import pandas as pd
import pytest
from pathlib import Path
from scripts.task4_analysis import (
    load_data,
    analyze_sentiment,
    extract_themes,
    identify_drivers_and_pain_points,
    generate_recommendations
)
import sys
from pathlib import Path

# Add project root to sys.path
sys.path.append(str(Path(__file__).resolve().parent.parent))

# Sample data for testing
SAMPLE_DATA = pd.DataFrame({
    "bank": ["CBE", "CBE", "BOA", "BOA"],
    "review": ["good", "excellent", "bad", "terrible"],
    "sentiment_label": ["positive", "positive", "negative", "negative"],
    "sentiment_score": [0.8, 0.9, -0.6, -0.8],
    "theme": ["service", "loan", "fees", "support"]
})


def test_analyze_sentiment():
    stats = analyze_sentiment(SAMPLE_DATA)
    assert "CBE" in stats.index
    assert "BOA" in stats.index
    # Updated column name
    assert stats.loc["CBE", "sentiment_score_mean"] == pytest.approx(0.85)

def test_extract_themes():
    themes = extract_themes(SAMPLE_DATA)
    assert "CBE" in themes
    assert themes["CBE"].iloc[0]["theme"] == "service"


def test_identify_drivers_and_pain_points():
    result = identify_drivers_and_pain_points(SAMPLE_DATA)
    assert "CBE" in result
    assert "drivers" in result["CBE"]
    assert "pain_points" in result["BOA"]
    assert "service" in result["CBE"]["drivers"]



def test_generate_recommendations():
    stats = analyze_sentiment(SAMPLE_DATA)
    themes = extract_themes(SAMPLE_DATA)
    drivers_pain = identify_drivers_and_pain_points(SAMPLE_DATA)
    recs = generate_recommendations(stats, themes, drivers_pain)
    
    assert "CBE" in recs
    assert "Bank CBE" in recs["CBE"]
    assert "service" in recs["CBE"]
    assert "loan" in recs["CBE"]

