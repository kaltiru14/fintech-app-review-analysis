"""
insert_reviews.py

Insert cleaned bank reviews into PostgreSQL with structured error handling,
transaction rollback, validation, and production-grade logging.
"""

import logging
from pathlib import Path
from typing import Dict, List, Tuple
import pandas as pd
import psycopg2
from psycopg2.extras import execute_values
from psycopg2.extensions import connection as PGConnection
from config import DATA_PATH, DB_CONFIG


# -----------------------------------
# Logging Configuration
# -----------------------------------
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler()]
)


# -----------------------------------
# Data Loading
# -----------------------------------
def load_reviews(file_path: Path) -> pd.DataFrame:
    """
    Load cleaned reviews CSV and standardize column names.
    """
    try:
        df = pd.read_csv(file_path)
        df.columns = df.columns.str.strip().str.lower()
        logging.info(f"Loaded {len(df)} reviews from {file_path}")
        return df
    except FileNotFoundError:
        logging.error(f"File not found: {file_path}")
        raise
    except Exception as e:
        logging.error(f"Unexpected error loading CSV: {e}")
        raise


# -----------------------------------
# Data Preparation
# -----------------------------------
def map_bank_ids(df: pd.DataFrame, bank_map: Dict[str, int]) -> pd.DataFrame:
    """
    Map bank names to database bank IDs.
    """
    df["bank_id"] = df["bank"].map(bank_map)

    if df["bank_id"].isnull().any():
        missing = df[df["bank_id"].isnull()]["bank"].unique()
        logging.warning(f"Unmapped banks found: {missing}")

    return df


def validate_dataframe(df: pd.DataFrame) -> None:
    """
    Validate required columns exist before insertion.
    """
    required_columns = [
        "bank_id",
        "review",
        "rating",
        "date",
        "sentiment_label",
        "sentiment_score",
        "source"
    ]

    missing_cols = [col for col in required_columns if col not in df.columns]

    if missing_cols:
        raise ValueError(f"Missing required columns: {missing_cols}")

    logging.info("Data validation passed.")


def prepare_records(df: pd.DataFrame) -> List[Tuple]:
    """
    Convert DataFrame rows into tuples for bulk insert.
    """
    records = [
        (
            row.bank_id,
            row.review,
            int(row.rating),
            row.date,
            row.sentiment_label,
            float(row.sentiment_score),
            row.source
        )
        for row in df.itertuples(index=False)
    ]

    logging.info(f"Prepared {len(records)} records for insertion.")
    return records


# -----------------------------------
# Database Insertion
# -----------------------------------
def insert_reviews(records: List[Tuple], db_config: Dict[str, str]) -> None:
    """
    Bulk insert reviews into PostgreSQL using transaction handling.
    """
    conn: PGConnection | None = None
    cursor = None

    try:
        conn = psycopg2.connect(**db_config)
        cursor = conn.cursor()

        query = """
        INSERT INTO reviews
        (bank_id, review_text, rating, review_date,
         sentiment_label, sentiment_score, source)
        VALUES %s
        """

        execute_values(cursor, query, records)
        conn.commit()

        logging.info(f"Successfully inserted {len(records)} reviews.")

    except psycopg2.DatabaseError as e:
        logging.error(f"Database error occurred: {e}")

        if conn is not None:
            conn.rollback()
            logging.info("Transaction rolled back successfully.")

        raise

    finally:
        if cursor is not None:
            cursor.close()

        if conn is not None:
            conn.close()

        logging.info("Database connection closed.")


# -----------------------------------
# Main Execution
# -----------------------------------
if __name__ == "__main__":

    file_path = DATA_PATH / "reviews_sentiment_themes.csv"

    # Example bank mapping (should match your DB table)
    bank_map = {
        "CBE": 1,
        "BOA": 2,
        "Dashen": 3
    }

    try:
        df_reviews = load_reviews(file_path)
        df_reviews = map_bank_ids(df_reviews, bank_map)
        validate_dataframe(df_reviews)
        records = prepare_records(df_reviews)
        insert_reviews(records, DB_CONFIG)

    except Exception as e:
        logging.error(f"Script execution failed: {e}")
