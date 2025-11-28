import pandas as pd
from google_play_scraper import reviews, Sort

# App IDs
apps = {
    "CBE": "com.combanketh.mobilebanking",
    "BOA": "com.boa.boaMobileBanking",
    "Dashen": "com.dashen.dashensuperapp"
}

all_reviews = []

for bank, app_id in apps.items():
    print(f"Scraping {bank}...")

    bank_reviews = []
    count = 0

    # Scrape 400+ reviews
    while len(bank_reviews) < 450:
        result, _ = reviews(
            app_id,
            lang="en",
            country="us",
            sort=Sort.NEWEST,
            count=200
        )
        bank_reviews.extend(result)
        if len(result) == 0:
            break

    print(f"Collected {len(bank_reviews)} for {bank}")

    # Process into DataFrame
    df = pd.DataFrame(bank_reviews)[['content', 'score', 'at']]
    df['bank'] = bank
    df['source'] = "Google Play"
    all_reviews.append(df)

# Combine all banks
final_df = pd.concat(all_reviews, ignore_index=True)

# Rename columns
final_df = final_df.rename(columns={
    'content': 'review',
    'score': 'rating',
    'at': 'date'
})

# Save raw scraped data
final_df.to_csv("data/raw_reviews.csv", index=False)
print("Saved raw_reviews.csv!")
