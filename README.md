# Task 1: Customer Experience Analytics for Fintech Apps
## Project Overview

This project is part of the Customer Experience Analytics for Fintech Apps challenge.
The goal of Task 1 is to scrape, preprocess, and store user reviews from Google Play Store apps for three Ethiopian banks:

Commercial Bank of Ethiopia (CBE)

Bank of Abyssinia (BOA)

Dashen Bank

The processed data will later be used for sentiment analysis, thematic analysis, and visualization to identify customer satisfaction drivers and pain points.

## Project Structure
```bash 
fintech-app-review-analysis/
│── data/
│     ├── raw_reviews.csv        # Raw scraped reviews
│     └── clean_reviews.csv      # Preprocessed and cleaned reviews
│── scripts/
│     ├── scrape_reviews.py      # Script to scrape Google Play reviews
│     └── preprocess_reviews.py  # Script to clean and normalize review data
│── requirements.txt             # Python dependencies
│── .gitignore
│── README.md
```
## Task 1 Methodology
### 1. Git Setup
- Created GitHub repository: fintech-app-review-analysis
- Added .gitignore to exclude temporary files and CSVs
- Added requirements.txt with required Python packages
- Created task-1 branch and committed scripts frequently

### 2. Data Collection (Web Scraping)
- Used google-play-scraper
 library
- Targeted 3 banking apps:

| Bank        | App ID                         |
| ----------- | ------------------------------ |
| CBE         | `com.combanketh.mobilebanking` |
| BOA         | `com.boa.boaMobileBanking`     |
| Dashen Bank | `com.dashen.dashensuperapp`    |

- Scraped fields:
    - review → User review text
    - rating → 1–5 stars
    - date → Review posting date
    - bank → Bank name
    - source → "Google Play"
- Collected 450+ reviews per bank (~1,350 total)

### 3. Preprocessing
- Removed duplicate reviews
- Removed reviews with missing text
- Normalized dates to YYYY-MM-DD format
- Cleaned whitespace from review text
- Saved as clean_reviews.csv in the data/ folder
### 4. Dependencies
- Python 3.11+
- Libraries listed in requirements.txt:
```bash 
pandas
google-play-scraper
numpy
python-dateutil
```
Install via:
```bash
pip install -r requirements.txt
```
### 5. Running the Scripts
**1️⃣ Scrape reviews**
```bash 
python scripts/scrape_reviews.py
```
**2️⃣ Preprocess reviews**
```bash
python scripts/preprocess_reviews.py
```
This will create data/clean_reviews.csv with:
- review
- rating
- date
- bank
- source
### 6. Key Achievements
- Scraped 1,350+ reviews across 3 banks
- Preprocessed dataset ready for Task 2 (Sentiment & Thematic Analysis)
- Repository is organized and ready for GitHub submission
- Meets Task 1 KPIs: clean CSV, minimum 1,200 reviews, clear folder structure
## Next Steps
- Task 2: Sentiment Analysis and Thematic Keyword Extraction
- Task 3: Store cleaned data in PostgreSQL
- Task 4: Insights, Visualization, and Recommendations
## References
- [google-play-scraper PyPI](https://pypi.org/project/google-play-scraper/)
- [pandas Documentation](https://pandas.pydata.org/pandas-docs/stable/)

