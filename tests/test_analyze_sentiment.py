import pandas as pd
import pytest

from scripts.analyze_sentiment_themes import (
    get_sentiment_label,
    analyze_sentiment,
    preprocess_text,
    assign_theme,
    map_themes
)
from config import SentimentThemeConfig


# -------------------------------
# Test sentiment label logic
# -------------------------------

def test_get_sentiment_label_positive():
    assert get_sentiment_label(0.6) == "positive"

def test_get_sentiment_label_negative():
    assert get_sentiment_label(-0.6) == "negative"

def test_get_sentiment_label_neutral():
    assert get_sentiment_label(0.0) == "neutral"


# -------------------------------
# Test sentiment analysis
# -------------------------------

def test_analyze_sentiment_adds_columns():
    df = pd.DataFrame({"review": ["This app is amazing!", "Terrible experience"]})
    result = analyze_sentiment(df)

    assert "sentiment_score" in result.columns
    assert "sentiment_label" in result.columns
    assert len(result) == 2


# -------------------------------
# Test preprocessing
# -------------------------------

def test_preprocess_text_basic():
    text = "This APP is running very slowly!"
    cleaned = preprocess_text(text)

    assert isinstance(cleaned, str)
    assert "app" in cleaned.lower()


# -------------------------------
# Test theme assignment
# -------------------------------

def test_assign_theme_match():
    config = SentimentThemeConfig()
    text = "login password problem"
    theme = assign_theme(text, config)

    assert "Account Access Issues" in theme


def test_assign_theme_other():
    config = SentimentThemeConfig()
    text = "completely unrelated words"
    theme = assign_theme(text, config)

    assert theme == "Other"


# -------------------------------
# Test full theme mapping
# -------------------------------

def test_map_themes_adds_column():
    config = SentimentThemeConfig()
    df = pd.DataFrame({
        "review": ["login issue", "great design"],
        "clean_text": ["login issue", "great design"]
    })

    result = map_themes(df, config)

    assert "themes" in result.columns
    assert len(result) == 2
