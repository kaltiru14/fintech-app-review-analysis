"""
insert_reviews.py

Insert cleaned bank reviews into PostgreSQL with structured error handling,
logging, and type hints.
"""

import logging
from pathlib import Path
from typing import Dict
import pandas as pd
import psycopg2
from psycopg2.extras import execute_values
from config import DATA_PATH, DB_CONFIG  # centralized config


# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler()]
)


def load_reviews(file_path: Path) -> pd.DataFrame:
    """
    Load cleaned reviews CSV into a DataFrame.
    """
    try:
        df = pd.read_csv(file_path)
        logging.info(f"Loaded {len(df)} reviews from {file_path}")
        return df
    except FileNotFoundError:
        logging.error(f"File not found: {file_path}")
        raise
    except Exception as e:
        logging.error(f"Error loading CSV: {e}")
        raise


def map_bank_ids(df: pd.DataFrame, bank_map: Dict[str, int]) -> pd.DataFrame:
    """
    Map bank names to their respective IDs.
    """
    df["bank_id"] = df["bank"].map(bank_map)
    if df["bank_id"].isnull().any():
        logging.warning("Some banks could not be mapped to IDs")
    return df


def insert_reviews(df: pd.DataFrame, db_config: Dict[str, str]) -> None:
    """
    Bulk insert reviews into PostgreSQL.
    """
    try:
        conn = psycopg2.connect(**db_config)
        cursor = conn.cursor()
        
        records = [
            (
                row["bank_id"],
                row["review"],
                int(row["rating"]),
                row["date"],
                row["sentiment_label"],
                float(row["sentiment_score"]),
                row["source"]
            )
            for _, row in df.iterrows()
        ]

        query = """
        INSERT INTO reviews (bank_id, review_text, rating, review_date, sentiment_label, sentiment_score, source)
        VALUES %s
        """
        execute_values(cursor, query, records)
        conn.commit()
        logging.info(f"Inserted {len(records)} reviews successfully!")

    except psycopg2.DatabaseError as e:
        logging.error(f"Database error: {e}")
        if conn:
            conn.rollback()
        raise
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()


if __name__ == "__main__":
    file_path = DATA_PATH / "reviews_sentiment_themes.csv"
    bank_map = {"CBE": 1, "BOA": 2, "Dashen": 3}
    df_reviews = load_reviews(file_path)
    df_reviews = map_bank_ids(df_reviews, bank_map)
    insert_reviews(df_reviews, DB_CONFIG)
