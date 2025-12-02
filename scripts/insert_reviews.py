import pandas as pd
import psycopg2
from psycopg2.extras import execute_values

# Load your cleaned CSV
df = pd.read_csv("../data/reviews_sentiment_themes.csv")

# Map bank names to IDs (match what you inserted)
bank_map = {"CBE": 1, "BOA": 2, "Dashen": 3}
df["bank_id"] = df["bank"].map(bank_map)

# Connect to PostgreSQL
conn = psycopg2.connect(
    dbname="bank_reviews",
    user="postgres",
    password="postgress123",
    host="localhost",
    port="5432"
)
cursor = conn.cursor()

# Prepare records for bulk insert
records = []
for _, row in df.iterrows():
    records.append((
        row["bank_id"],
        row["review"],
        int(row["rating"]),
        row["date"],
        row["sentiment_label"],
        float(row["sentiment_score"]),
        row["source"]
    ))

# Insert into reviews table
query = """
INSERT INTO reviews (bank_id, review_text, rating, review_date, sentiment_label, sentiment_score, source)
VALUES %s
"""
execute_values(cursor, query, records)

conn.commit()
cursor.close()
conn.close()
print("All reviews inserted successfully!")
