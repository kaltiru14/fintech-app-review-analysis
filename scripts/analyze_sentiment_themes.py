# scripts/analyze_sentiment_themes.py

import pandas as pd
import logging
from typing import List
from nltk.corpus import stopwords
from sklearn.feature_extraction.text import TfidfVectorizer
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
import spacy
from config import PathsConfig, SentimentThemeConfig

# -------------------------------
# Logging Setup
# -------------------------------
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

# -------------------------------
# Load NLP model
# -------------------------------
try:
    nlp = spacy.load("en_core_web_sm")
except OSError:
    logging.error("SpaCy English model not found. Run: python -m spacy download en_core_web_sm")
    raise

stop_words = set(stopwords.words("english"))

# -------------------------------
# Sentiment Functions
# -------------------------------

def get_sentiment_label(score: float) -> str:
    """Convert compound score to label"""
    if score >= 0.05:
        return "positive"
    elif score <= -0.05:
        return "negative"
    else:
        return "neutral"

def analyze_sentiment(df: pd.DataFrame) -> pd.DataFrame:
    """Add sentiment score and label to DataFrame"""
    analyzer = SentimentIntensityAnalyzer()
    df["sentiment_score"] = df["review"].apply(lambda x: analyzer.polarity_scores(str(x))["compound"])
    df["sentiment_label"] = df["sentiment_score"].apply(get_sentiment_label)
    logging.info("Sentiment analysis completed")
    return df

# -------------------------------
# Preprocessing for thematic analysis
# -------------------------------

def preprocess_text(text: str) -> str:
    """Lowercase, remove stopwords, lemmatize"""
    doc = nlp(str(text).lower())
    tokens = [token.lemma_ for token in doc if token.is_alpha and token.text not in stop_words]
    return " ".join(tokens)

def preprocess_reviews(df: pd.DataFrame) -> pd.DataFrame:
    df["clean_text"] = df["review"].apply(preprocess_text)
    logging.info("Text preprocessing completed")
    return df

# -------------------------------
# TF-IDF Keyword Extraction
# -------------------------------

def extract_keywords(df: pd.DataFrame, max_features: int = 100) -> List[str]:
    vectorizer = TfidfVectorizer(max_features=max_features, ngram_range=(1, 2))
    vectorizer.fit_transform(df["clean_text"])
    keywords = vectorizer.get_feature_names_out()
    logging.info(f"Extracted {len(keywords)} keywords using TF-IDF")
    return keywords

# -------------------------------
# Theme Assignment
# -------------------------------

def assign_theme(text: str, config: SentimentThemeConfig) -> str:
    matched_themes = []
    for theme, kw_list in config.themes.items():
        for kw in kw_list:
            if kw in text:
                matched_themes.append(theme)
                break
    if not matched_themes:
        matched_themes.append("Other")
    return ", ".join(matched_themes)

def map_themes(df: pd.DataFrame, config: SentimentThemeConfig) -> pd.DataFrame:
    df["themes"] = df["clean_text"].apply(lambda x: assign_theme(x, config))
    logging.info("Theme mapping completed")
    return df

# -------------------------------
# Save Results
# -------------------------------

def save_results(df: pd.DataFrame, path: str) -> None:
    try:
        df[["review", "rating", "date", "bank", "source", "sentiment_label", "sentiment_score", "themes"]].to_csv(path, index=False)
        logging.info(f"Analysis results saved to {path}")
    except Exception as e:
        logging.error(f"Failed to save results: {e}")
        raise

# -------------------------------
# Main Execution
# -------------------------------

def main() -> None:
    paths = PathsConfig()
    theme_config = SentimentThemeConfig()
    
    try:
        df = pd.read_csv(paths.clean_csv)
        logging.info(f"Loaded cleaned reviews: {df.shape[0]} rows")
    except FileNotFoundError:
        logging.error(f"Clean CSV not found: {paths.clean_csv}")
        return
    
    df = analyze_sentiment(df)
    df = preprocess_reviews(df)
    keywords = extract_keywords(df)
    df = map_themes(df, theme_config)
    save_results(df, "data/reviews_sentiment_themes.csv")

if __name__ == "__main__":
    main()
