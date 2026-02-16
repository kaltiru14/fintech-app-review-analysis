# config.py

from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List

# -------------------------------
# Project paths
# -------------------------------
PROJECT_ROOT = Path(__file__).parent
DATA_PATH = PROJECT_ROOT / "data"

# Path to specific CSV files
RAW_CSV = DATA_PATH / "raw_reviews.csv"
CLEAN_CSV = DATA_PATH / "clean_reviews.csv"
REVIEWS_CSV = DATA_PATH / "reviews_sentiment_themes.csv"

# -------------------------------
# Dataclasses for configs
# -------------------------------
@dataclass
class PathsConfig:
    raw_csv: str = str(RAW_CSV)
    clean_csv: str = str(CLEAN_CSV)

@dataclass
class PreprocessConfig:
    date_format: str = "%Y-%m-%d"

@dataclass
class SentimentThemeConfig:
    themes: Dict[str, List[str]] = None

    def __post_init__(self):
        if self.themes is None:
            self.themes = {
                "Account Access Issues": ["login", "password", "account", "unlock"],
                "Transaction Performance": ["transfer", "slow", "loading", "payment", "crash"],
                "User Interface & Experience": ["ui", "navigation", "button", "menu", "design"],
                "Customer Support": ["support", "help", "service", "response"],
                "Feature Requests": ["fingerprint", "biometric", "feature", "update", "tool"]
            }

@dataclass
class ScraperConfig:
    banks: Dict[str, str] = None  # bank name → URL mapping
    pages_per_bank: int = 5

    def __post_init__(self):
        if self.banks is None:
            self.banks = {
                "Abay Bank": "https://www.example.com/abaybank/reviews",
                "Awash Bank": "https://www.example.com/awashbank/reviews",
                "Dashen Bank": "https://www.example.com/dashenbank/reviews",
            }

# -------------------------------
# Database config
# -------------------------------
DB_CONFIG = {
    "host": "localhost",
    "port": 5432,
    "dbname": "bank_reviews",
    "user": "postgres",
    "password": "postgres123"
}