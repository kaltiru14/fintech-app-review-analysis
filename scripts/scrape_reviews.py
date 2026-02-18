# scripts/scrape_reviews.py

import logging
import pandas as pd
from google_play_scraper import reviews, Sort
from config import PathsConfig, BANK_APPS

# -------------------------------
# Logging Setup
# -------------------------------
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

# -------------------------------
# Helper: Extract App ID
# -------------------------------
def extract_app_id(url: str) -> str:
    return url.split("id=")[-1]

# -------------------------------
# Scraper Function (REAL SCRAPER)
# -------------------------------
def scrape_all_banks() -> pd.DataFrame:
    all_reviews = []

    for bank, url in BANK_APPS.items():
        logging.info(f"Scraping reviews for {bank}")

        app_id = extract_app_id(url)

        bank_reviews = []
        continuation_token = None

        while len(bank_reviews) < 400:
            result, continuation_token = reviews(
                app_id,
                lang="en",
                country="et",
                sort=Sort.NEWEST,
                count=200,
                continuation_token=continuation_token
            )

            bank_reviews.extend(result)

            if not continuation_token:
                break  # no more reviews available

        # Trim to exactly 400 if slightly over
        bank_reviews = bank_reviews[:400]

        logging.info(f"Final total for {bank}: {len(bank_reviews)}")

        for r in bank_reviews:
            all_reviews.append({
                "bank": bank,
                "review": r["content"],
                "rating": r["score"],
                "date": r["at"],
                "source": "Google Play"
            })

    df = pd.DataFrame(all_reviews)
    logging.info(f"Total reviews scraped for all banks: {df.shape[0]}")
    return df

# -------------------------------
# Save Data
# -------------------------------
def save_reviews(df: pd.DataFrame, paths: PathsConfig):
    df.to_csv(paths.raw_csv, index=False)
    logging.info(f"Scraped reviews saved to {paths.raw_csv}")

# -------------------------------
# Main Execution
# -------------------------------
def main():
    paths = PathsConfig()
    df = scrape_all_banks()
    save_reviews(df, paths)

if __name__ == "__main__":
    main()
