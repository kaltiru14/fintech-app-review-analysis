# config.py

from dataclasses import dataclass
from pathlib import Path

# Project root
PROJECT_ROOT = Path(__file__).parent.parent

# Path to the cleaned reviews CSV
DATA_PATH = PROJECT_ROOT / "data" / "reviews_sentiment_themes.csv"

@dataclass
class PathsConfig:
    raw_csv: str = "data/raw_reviews.csv"
    clean_csv: str = "data/clean_reviews.csv"

@dataclass
class PreprocessConfig:
    date_format: str = "%Y-%m-%d"


# config.py (append below previous dataclasses)
from typing import Dict, List

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

from dataclasses import dataclass
from typing import Dict, List

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

# config.py

from pathlib import Path

DATA_PATH = Path(__file__).parent / "data"

# PostgreSQL database config
DB_CONFIG = {
    "host": "localhost",
    "port": 5432,
    "dbname": "bank_reviews",
    "user": "postgres",
    "password": "postgres123"
}
