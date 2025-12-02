# 📄 Task 1: Customer Experience Analytics for Fintech Apps
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

## References
- [google-play-scraper PyPI](https://pypi.org/project/google-play-scraper/)
- [pandas Documentation](https://pandas.pydata.org/pandas-docs/stable/)

📄 Task 2: Sentiment and Thematic Analysis
## Overview
Task 2 focuses on analyzing customer reviews scraped from the Google Play Store to:
1. Quantify sentiment (positive, negative, neutral)
2. Identify recurring themes to uncover satisfaction drivers and pain points for each bank’s mobile app

This analysis builds on the cleaned dataset from Task 1 (clean_reviews.csv) and produces actionable insights for fintech stakeholders.

### Pipeline & Methodology
#### 1️⃣ Sentiment Analysis
- Used VADER Sentiment Analyzer from NLTK for English text.
- Steps:
    - Compute compound sentiment score per review
    - Convert score to sentiment label:
        - positive → compound ≥ 0.05
        - negative → compound ≤ -0.05
        - neutral → otherwise

- Aggregated sentiment by bank and rating for comparison.

#### 2️⃣ Preprocessing for Thematic Analysis
- Converted text to lowercase
- Tokenized and lemmatized using spaCy
- Removed stopwords and non-alphabetic tokens
- Cleaned text saved as clean_text for TF-IDF analysis
#### 3️⃣ Thematic Analysis (Keyword & Rule-Based Clustering)
- Extracted keywords and n-grams using TF-IDF (top 100 features)
- Manually grouped recurring keywords into 5 themes:

| Theme                       | Keywords / Examples                           |
| --------------------------- | --------------------------------------------- |
| Account Access Issues       | login, password, account, unlock              |
| Transaction Performance     | transfer, slow, loading, payment, crash       |
| User Interface & Experience | UI, navigation, button, menu, design          |
| Customer Support            | support, help, service, response              |
| Feature Requests            | fingerprint, biometric, feature, update, tool |

- Assigned each review 1–3 relevant themes
- Reviews without matches labeled as Other
#### 4️⃣ Output
- Saved as reviews_sentiment_themes.csv in data/ folder
- Columns:
```bash
review,rating,date,bank,source,sentiment_label,sentiment_score,themes
```
- Sample row:

| review                        | rating | date       | bank | sentiment_label | sentiment_score | themes                  |
| ----------------------------- | ------ | ---------- | ---- | --------------- | --------------- | ----------------------- |
| "App crashes during transfer" | 2      | 2025-11-20 | CBE  | negative        | -0.6            | Transaction Performance |

#### 5️⃣ Key Achievements & KPIs
- Sentiment scores computed for 100% of reviews
- 5 themes identified across all banks
- Modular pipeline with preprocessing → sentiment → thematic analysis → CSV output
- Ready for Task 4 visualization and insights
#### 6️⃣ Next Steps
- Aggregate sentiment by bank and rating
- Visualize trends and distributions
- Identify top drivers and pain points per bank
- Prepare actionable recommendations for mobile app improvements

### References
- [VADER Sentiment](https://github.com/cjhutto/vaderSentiment)
- [spaCy NLP](https://spacy.io/)
- [scikit-learn TF-IDF](https://scikit-learn.org/stable/modules/generated/sklearn.feature_extraction.text.TfidfVectorizer.html)
## Task 3: Store Cleaned Data in PostgreSQL

In this task, we designed and implemented a relational database to store cleaned and processed Google Play Store reviews for three Ethiopian banks.

### Database Setup

- **Database name:** `bank_reviews`
- **PostgreSQL version:** (your version, e.g., 16.2)
- **Python library used:** `psycopg2-binary` for inserting data

### Database Schema

#### 1. banks
| Column    | Type         | Description                  |
|-----------|--------------|------------------------------|
| bank_id   | SERIAL PK    | Primary key for banks        |
| bank_name | VARCHAR(100) | Name of the bank             |
| app_name  | VARCHAR(150) | Name of the mobile app       |

#### 2. reviews
| Column          | Type          | Description                                    |
|-----------------|---------------|-----------------------------------------------|
| review_id       | SERIAL PK     | Primary key for reviews                        |
| bank_id         | INT FK        | Foreign key referencing `banks(bank_id)`      |
| review_text     | TEXT          | User review text                               |
| rating          | INT           | Star rating (1–5)                              |
| review_date     | DATE          | Date of review                                 |
| sentiment_label | VARCHAR(20)   | Sentiment label (positive, negative, neutral) |
| sentiment_score | FLOAT         | Sentiment score (-1 to 1)                     |
| source          | VARCHAR(50)   | Source of review (Google Play)                |

### Data Insertion

- Data from `reviews_sentiment_themes.csv` was inserted using the Python script `insert_reviews.py`.
- Connection details in the script:

```python
import psycopg2
conn = psycopg2.connect(
    host="localhost",
    database="bank_reviews",
    user="postgres",
    password="your_password"
)
```
- All reviews inserted successfully, totaling over 1,200 entries across all three banks.
### Verification
- Count of reviews per bank:
```sql
SELECT b.bank_name, COUNT(r.review_id) AS total_reviews
FROM reviews r
JOIN banks b ON r.bank_id = b.bank_id
GROUP BY b.bank_name;
```
- Average rating per bank:
```sql 
SELECT b.bank_name, AVG(r.rating) AS avg_rating
FROM reviews r
JOIN banks b ON r.bank_id = b.bank_id
GROUP BY b.bank_name;
```
- Sample data check:
```sql
SELECT * FROM reviews LIMIT 5;
```
### SQL Dump
- A full SQL dump of the database is available in bank_reviews_dump.sql.
