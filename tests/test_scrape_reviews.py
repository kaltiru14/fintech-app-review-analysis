"""
scrape_reviews.py

Scrape reviews from Google Play Store for specified bank apps
using google_play_scraper Python library.
"""

import logging
import pandas as pd
from pathlib import Path
from typing import List, Dict
from google_play_scraper import Sort, reviews
from google_play_scraper.exceptions import NotFoundError
import time


# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s"
)

# Output path
RAW_CSV_PATH = Path(__file__).parent.parent / "data" / "raw_reviews.csv"

# App info mapping
APPS = {
    "CBE": "com.combanketh.mobilebanking",
    "BOA": "com.boa.boaMobileBanking",
    "Dashen": "com.dashen.dashensuperapp"
}


def fetch_reviews_for_app(app_id: str, n_reviews: int = 500):
    """
    Fetch reviews safely with error handling.
    """
    all_reviews = []
    logging.info(f"Fetching reviews for {app_id} ...")

    try:
        result, _ = reviews(
            app_id,
            lang="en",
            country="us",
            sort=Sort.NEWEST,
            count=n_reviews
        )

        if not result:
            logging.warning(f"No reviews returned for {app_id}")
            return []

        for r in result:
            try:
                all_reviews.append({
                    "review": r.get("content", ""),
                    "rating": r.get("score", None),
                    "date": r.get("at").strftime("%Y-%m-%d") if r.get("at") else None,
                    "bank": None,
                    "source": "Google Play"
                })
            except Exception as e:
                logging.warning(f"Malformed review skipped: {e}")
                continue

        logging.info(f"Fetched {len(all_reviews)} reviews for {app_id}")

    except NotFoundError:
        logging.error(f"App not found: {app_id}")
        return []

    except Exception as e:
        logging.error(f"Failed to fetch reviews for {app_id}: {e}")
        return []

    time.sleep(2)  # Prevent rate limiting
    return all_reviews


def main():
    all_rows = []
    
    for bank_name, app_id in APPS.items():
        bank_reviews = fetch_reviews_for_app(app_id, n_reviews=500)
        for rv in bank_reviews:
            rv["bank"] = bank_name
            all_rows.append(rv)

    df = pd.DataFrame(all_rows)
    
    # Save
    df.to_csv(RAW_CSV_PATH, index=False)
    logging.info(f"Saved raw reviews to {RAW_CSV_PATH}")


if __name__ == "__main__":
    main()
