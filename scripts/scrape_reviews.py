# scripts/scrape_reviews.py

import requests
from bs4 import BeautifulSoup
import pandas as pd
import logging
from typing import List, Dict
from config import PathsConfig, ScraperConfig

# -------------------------------
# Logging Setup
# -------------------------------
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

# -------------------------------
# Scraper Functions
# -------------------------------

def fetch_page(url: str) -> str:
    """Fetch HTML content from a URL"""
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        logging.info(f"Fetched URL: {url}")
        return response.text
    except Exception as e:
        logging.error(f"Failed to fetch {url}: {e}")
        return ""

def parse_reviews(html: str, bank: str) -> List[Dict]:
    """Extract reviews from HTML"""
    if not html:
        return []
    soup = BeautifulSoup(html, "html.parser")
    review_elements = soup.find_all("div", class_="review")  # adjust per site
    reviews = []
    for rev in review_elements:
        text = rev.find("p", class_="text").get_text(strip=True) if rev.find("p", class_="text") else ""
        rating = rev.find("span", class_="rating").get_text(strip=True) if rev.find("span", class_="rating") else None
        date = rev.find("span", class_="date").get_text(strip=True) if rev.find("span", class_="date") else None
        if text:  # only store non-empty reviews
            reviews.append({
                "bank": bank,
                "review": text,
                "rating": rating,
                "date": date,
                "source": "Web"
            })
    logging.info(f"Parsed {len(reviews)} reviews for {bank}")
    return reviews

def scrape_bank_reviews(bank: str, url: str, pages: int) -> List[Dict]:
    """Scrape multiple pages for a bank"""
    all_reviews = []
    for page in range(1, pages + 1):
        page_url = f"{url}?page={page}"
        html = fetch_page(page_url)
        reviews = parse_reviews(html, bank)
        all_reviews.extend(reviews)
    logging.info(f"Total reviews scraped for {bank}: {len(all_reviews)}")
    return all_reviews

def scrape_all_banks(config: ScraperConfig) -> pd.DataFrame:
    """Scrape all banks from config"""
    all_reviews = []
    for bank, url in config.banks.items():
        bank_reviews = scrape_bank_reviews(bank, url, config.pages_per_bank)
        all_reviews.extend(bank_reviews)
    df = pd.DataFrame(all_reviews)
    logging.info(f"Total reviews scraped for all banks: {df.shape[0]}")
    return df

# -------------------------------
# Save Data
# -------------------------------

def save_reviews(df: pd.DataFrame, path: str) -> None:
    try:
        df.to_csv(path, index=False)
        logging.info(f"Scraped reviews saved to {path}")
    except Exception as e:
        logging.error(f"Failed to save reviews: {e}")
        raise

# -------------------------------
# Main Execution
# -------------------------------

def main() -> None:
    paths = PathsConfig()
    config = ScraperConfig()
    
    df = scrape_all_banks(config)
    save_reviews(df, paths.raw_csv)

if __name__ == "__main__":
    main()
