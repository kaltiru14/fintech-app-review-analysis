import pytest
from unittest.mock import patch
import pandas as pd
from scripts.scrape_reviews import fetch_page, parse_reviews, scrape_bank_reviews, scrape_all_banks
from config import ScraperConfig

# -------------------------------
# Test fetch_page
# -------------------------------
def test_fetch_page_success():
    # Mock requests.get to return a dummy response
    with patch("scripts.scrape_reviews.requests.get") as mock_get:
        mock_get.return_value.status_code = 200
        mock_get.return_value.text = "<html>dummy content</html>"
        html = fetch_page("http://dummyurl.com")
        assert html == "<html>dummy content</html>"

def test_fetch_page_failure():
    with patch("scripts.scrape_reviews.requests.get") as mock_get:
        mock_get.side_effect = Exception("Network error")
        html = fetch_page("http://dummyurl.com")
        assert html == ""  # should return empty string on failure

# -------------------------------
# Test parse_reviews
# -------------------------------
def test_parse_reviews_empty_html():
    result = parse_reviews("", "TestBank")
    assert result == []

def test_parse_reviews_mock_html():
    html = """
    <div class="review">
        <p class="text">Great app!</p>
        <span class="rating">5</span>
        <span class="date">2026-02-16</span>
    </div>
    """
    result = parse_reviews(html, "TestBank")
    assert len(result) == 1
    assert result[0]["review"] == "Great app!"
    assert result[0]["rating"] == "5"
    assert result[0]["date"] == "2026-02-16"
    assert result[0]["bank"] == "TestBank"

# -------------------------------
# Test scrape_bank_reviews
# -------------------------------
@patch("scripts.scrape_reviews.fetch_page")
@patch("scripts.scrape_reviews.parse_reviews")
def test_scrape_bank_reviews(mock_parse, mock_fetch):
    mock_fetch.return_value = "<html>dummy</html>"
    mock_parse.return_value = [{"review": "ok", "bank": "Bank", "rating": 5, "date": "2026-02-16", "source": "Web"}]
    reviews = scrape_bank_reviews("Bank", "http://dummyurl.com", pages=2)
    assert len(reviews) == 2  # 1 review per page × 2 pages

# -------------------------------
# Test scrape_all_banks
# -------------------------------
@patch("scripts.scrape_reviews.scrape_bank_reviews")
def test_scrape_all_banks(mock_scrape_bank):
    mock_scrape_bank.return_value = [{"review": "ok", "bank": "Bank", "rating": 5, "date": "2026-02-16", "source": "Web"}]
    config = ScraperConfig(banks={"Bank1": "url1", "Bank2": "url2"}, pages_per_bank=1)
    df = scrape_all_banks(config)
    assert isinstance(df, pd.DataFrame)
    assert df.shape[0] == 2  # one review per bank
