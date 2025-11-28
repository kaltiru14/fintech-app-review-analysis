import pandas as pd

df = pd.read_csv("data/raw_reviews.csv")

# Drop missing reviews
df = df.dropna(subset=['review'])

# Remove duplicates
df = df.drop_duplicates(subset=['review', 'bank'])

# Normalize date
df['date'] = pd.to_datetime(df['date']).dt.strftime("%Y-%m-%d")

# Clean whitespace
df['review'] = df['review'].str.strip()

# Save clean dataset
df.to_csv("data/clean_reviews.csv", index=False)

print(f"Cleaned dataset saved: {df.shape[0]} rows")
