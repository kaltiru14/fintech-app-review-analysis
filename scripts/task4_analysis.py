"""
Analyze bank reviews: compute sentiment, extract themes, quantify pain points and drivers,
and generate recommendations.
"""

import logging
from pathlib import Path
from typing import Dict
import pandas as pd
from config import DATA_PATH  # centralized config

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[logging.StreamHandler()]
)


def load_data(file_path: Path) -> pd.DataFrame:
    """
    Load the cleaned reviews CSV.
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


def analyze_sentiment(df: pd.DataFrame) -> pd.DataFrame:
    """
    Compute sentiment statistics per bank.
    Returns a DataFrame with mean sentiment, counts, and distribution of sentiment labels.
    """
    stats = df.groupby("bank")[["sentiment_score"]].agg(["mean", "count"])
    # Flatten MultiIndex columns
    stats.columns = [f"{col[0]}_{col[1]}" for col in stats.columns]

    sentiment_labels = df.groupby(["bank", "sentiment_label"]).size().unstack(fill_value=0)
    stats = stats.join(sentiment_labels)
    logging.info("Computed sentiment statistics")
    return stats


def extract_themes(df: pd.DataFrame) -> Dict[str, pd.DataFrame]:
    """
    Summarize common themes per bank.
    Returns a dictionary: {bank_name: DataFrame of theme counts}
    """
    theme_summary = {}
    for bank in df["bank"].unique():
        bank_df = df[df["bank"] == bank]
        themes = bank_df["theme"].value_counts().reset_index()
        themes.columns = ["theme", "count"]
        theme_summary[bank] = themes
        logging.info(f"Extracted {len(themes)} themes for {bank}")
    return theme_summary


def identify_drivers_and_pain_points(df: pd.DataFrame) -> Dict[str, Dict[str, str]]:
    """
    Identify top 2 drivers and top 2 pain points per bank.
    Returns a dictionary: {bank_name: {"drivers": str, "pain_points": str}}
    """
    result = {}
    for bank in df["bank"].unique():
        bank_df = df[df["bank"] == bank]
        # Top positive themes as drivers, top negative themes as pain points
        positive_themes = bank_df[bank_df["sentiment_label"] == "positive"]["theme"].value_counts().head(2).index.tolist()
        negative_themes = bank_df[bank_df["sentiment_label"] == "negative"]["theme"].value_counts().head(2).index.tolist()
        result[bank] = {
            "drivers": ", ".join(positive_themes) if positive_themes else "N/A",
            "pain_points": ", ".join(negative_themes) if negative_themes else "N/A"
        }
        logging.info(f"{bank} drivers: {result[bank]['drivers']}; pain points: {result[bank]['pain_points']}")
    return result


def generate_recommendations(
    stats: pd.DataFrame,
    themes: Dict[str, pd.DataFrame],
    drivers_pain: Dict[str, Dict[str, str]]
) -> Dict[str, str]:
    """
    Generate textual recommendations per bank combining sentiment stats, themes, and drivers/pain points.
    """
    recommendations = {}
    for bank in stats.index:
        mean_sentiment = stats.loc[bank, "sentiment_score_mean"]
        top_theme = themes[bank].iloc[0]["theme"] if not themes[bank].empty else "N/A"
        rec = (
            f"Bank {bank}: Focus on '{top_theme}' theme. "
            f"Average sentiment score: {mean_sentiment:.2f}. "
            f"Key drivers: {drivers_pain[bank]['drivers']}. "
            f"Pain points: {drivers_pain[bank]['pain_points']}."
        )
        recommendations[bank] = rec
        logging.info(f"Recommendation for {bank}: {rec}")
    return recommendations


if __name__ == "__main__":
    file_path = DATA_PATH / "reviews_sentiment_themes.csv"

    # Load data
    df_reviews = load_data(file_path)

    # Compute sentiment stats
    sentiment_stats = analyze_sentiment(df_reviews)

    # Extract themes
    theme_summary = extract_themes(df_reviews)

    # Identify drivers and pain points
    drivers_pain = identify_drivers_and_pain_points(df_reviews)

    # Generate recommendations
    recommendations = generate_recommendations(sentiment_stats, theme_summary, drivers_pain)

    # Print recommendations
    for bank, rec in recommendations.items():
        print(rec)
