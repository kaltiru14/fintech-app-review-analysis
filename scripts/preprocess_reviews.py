# scripts/preprocess_reviews.py

import pandas as pd
import logging
from config import PathsConfig, PreprocessConfig
from typing import Tuple

# -------------------------------
# Setup Logging
# -------------------------------
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

# -------------------------------
# Functions
# -------------------------------

def load_data(path: str) -> pd.DataFrame:
    """Load CSV into DataFrame"""
    try:
        df = pd.read_csv(path)
        logging.info(f"Loaded data from {path} with {df.shape[0]} rows")
        return df
    except FileNotFoundError:
        logging.error(f"File not found: {path}")
        raise
    except Exception as e:
        logging.error(f"Error reading CSV: {e}")
        raise

def clean_data(df: pd.DataFrame, date_format: str) -> pd.DataFrame:
    """
    Clean the reviews DataFrame:
    - Drop missing reviews
    - Strip whitespace
    - Remove duplicates
    - Normalize dates
    """
    # Drop missing reviews
    df = df.dropna(subset=['review'])

    # Strip review text first
    df['review'] = df['review'].str.strip()

    # Remove duplicates after stripping
    df = df.drop_duplicates(subset=['review', 'bank'])

    # Normalize dates
    df['date'] = pd.to_datetime(df['date'], errors='coerce').dt.strftime(date_format)

    # Remove rows with invalid dates
    df = df.dropna(subset=['date'])

    logging.info(f"Cleaned data: {df.shape[0]} rows after preprocessing")
    return df

def save_data(df: pd.DataFrame, path: str) -> None:
    """Save cleaned DataFrame to CSV"""
    try:
        df.to_csv(path, index=False)
        logging.info(f"Saved cleaned dataset to {path}")
    except Exception as e:
        logging.error(f"Failed to save CSV: {e}")
        raise

# -------------------------------
# Main Execution
# -------------------------------

def main() -> None:
    paths = PathsConfig()
    config = PreprocessConfig()
    
    df = load_data(paths.raw_csv)
    df_clean = clean_data(df, config.date_format)
    save_data(df_clean, paths.clean_csv)

if __name__ == "__main__":
    main()
