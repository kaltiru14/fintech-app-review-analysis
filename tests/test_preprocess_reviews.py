# tests/test_preprocess_reviews.py

import pytest
import pandas as pd
from unittest.mock import patch
from scripts.preprocess_reviews import load_data, clean_data, save_data

# ------------------- Sample Data -------------------
SAMPLE_DF = pd.DataFrame({
    "bank": ["CBE", "BOA", "CBE", "Dashen", "BOA"],
    "review": [" Great service ", "Poor loan process", "Great service", None, "Excellent app"],
    "date": ["2026-02-15", "2026-02-14", "2026-02-15", "invalid_date", "2026-02-13"]
})


# ------------------- load_data tests -------------------
def test_load_data(tmp_path):
    file = tmp_path / "reviews.csv"
    SAMPLE_DF.to_csv(file, index=False)
    
    df_loaded = load_data(file)
    assert len(df_loaded) == 5
    assert list(df_loaded.columns) == list(SAMPLE_DF.columns)


def test_load_data_file_not_found():
    with pytest.raises(FileNotFoundError):
        load_data("nonexistent_file.csv")


# ------------------- clean_data tests -------------------
def test_clean_data():
    df_cleaned = clean_data(SAMPLE_DF.copy(), date_format="%Y-%m-%d")
    
    # Should drop None review and invalid date
    assert df_cleaned.shape[0] == 3
    
    # Reviews should be stripped
    assert all(df_cleaned['review'].str[0] != " ")
    
    # No duplicates
    assert df_cleaned.duplicated(subset=['review', 'bank']).sum() == 0
    
    # Dates normalized
    assert df_cleaned['date'].iloc[0] == "2026-02-15"


# ------------------- save_data tests -------------------
def test_save_data(tmp_path):
    file = tmp_path / "clean_reviews.csv"
    df_clean = clean_data(SAMPLE_DF.copy(), date_format="%Y-%m-%d")
    
    save_data(df_clean, file)
    
    # Check file exists and has correct content
    df_loaded = pd.read_csv(file)
    assert len(df_loaded) == df_clean.shape[0]
    assert list(df_loaded.columns) == list(df_clean.columns)


# ------------------- Optional: full pipeline test -------------------
def test_full_pipeline(tmp_path):
    raw_file = tmp_path / "raw.csv"
    clean_file = tmp_path / "clean.csv"
    
    SAMPLE_DF.to_csv(raw_file, index=False)
    
    df = load_data(raw_file)
    df_clean = clean_data(df, date_format="%Y-%m-%d")
    save_data(df_clean, clean_file)
    
    df_saved = pd.read_csv(clean_file)
    assert df_saved.shape[0] == df_clean.shape[0]
