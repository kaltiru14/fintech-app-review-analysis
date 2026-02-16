import pytest
import pandas as pd
from unittest.mock import patch, MagicMock
from scripts.insert_reviews import load_reviews, map_bank_ids, insert_reviews

# Sample data for tests
SAMPLE_DF = pd.DataFrame({
    "bank": ["CBE", "BOA"],
    "review": ["Great service", "Poor loan process"],
    "rating": [5, 2],
    "date": ["2026-02-15", "2026-02-14"],
    "sentiment_label": ["positive", "negative"],
    "sentiment_score": [0.9, -0.5],
    "source": ["web", "app"]
})

BANK_MAP = {"CBE": 1, "BOA": 2}


# -------------------- load_reviews tests --------------------
def test_load_reviews(tmp_path):
    # Create a temporary CSV
    file = tmp_path / "reviews.csv"
    SAMPLE_DF.to_csv(file, index=False)
    
    df_loaded = load_reviews(file)
    assert len(df_loaded) == 2
    assert list(df_loaded.columns) == list(SAMPLE_DF.columns)


def test_load_reviews_file_not_found():
    with pytest.raises(FileNotFoundError):
        load_reviews("nonexistent_file.csv")


# -------------------- map_bank_ids tests --------------------
def test_map_bank_ids_success():
    df_mapped = map_bank_ids(SAMPLE_DF, BANK_MAP)
    assert df_mapped.loc[0, "bank_id"] == 1
    assert df_mapped.loc[1, "bank_id"] == 2


def test_map_bank_ids_warning(caplog):
    df_wrong = SAMPLE_DF.copy()
    df_wrong.loc[0, "bank"] = "UnknownBank"
    with caplog.at_level("WARNING"):
        df_mapped = map_bank_ids(df_wrong, BANK_MAP)
        assert "Some banks could not be mapped" in caplog.text
        assert pd.isna(df_mapped.loc[0, "bank_id"])


# -------------------- insert_reviews tests --------------------
def test_insert_reviews_success():
    df_mapped = map_bank_ids(SAMPLE_DF, BANK_MAP)

    # Patch execute_values directly
    with patch("scripts.insert_reviews.execute_values") as mock_exec_values, \
         patch("scripts.insert_reviews.psycopg2.connect") as mock_connect:

        mock_conn = MagicMock()
        mock_cursor = MagicMock()
        mock_connect.return_value = mock_conn
        mock_conn.cursor.return_value = mock_cursor

        insert_reviews(df_mapped, {"host": "localhost", "dbname": "testdb"})

        # Check execute_values called with correct args
        mock_exec_values.assert_called_once()
        mock_conn.commit.assert_called_once()
        mock_cursor.close.assert_called_once()
        mock_conn.close.assert_called_once()


def test_insert_reviews_db_error():
    df_mapped = map_bank_ids(SAMPLE_DF, BANK_MAP)

    with patch("scripts.insert_reviews.execute_values") as mock_exec_values, \
         patch("scripts.insert_reviews.psycopg2.connect") as mock_connect:

        mock_conn = MagicMock()
        mock_cursor = MagicMock()
        mock_connect.return_value = mock_conn
        mock_conn.cursor.return_value = mock_cursor

        # Simulate database error
        mock_exec_values.side_effect = Exception("DB error")

        with pytest.raises(Exception, match="DB error"):
            insert_reviews(df_mapped, {"host": "localhost", "dbname": "testdb"})
