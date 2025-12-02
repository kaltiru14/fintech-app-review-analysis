# task4-analysis.py

import os
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from wordcloud import WordCloud

# -------------------------------
# Step 0: Ensure outputs folder exists
# -------------------------------
output_dir = "../outputs"
os.makedirs(output_dir, exist_ok=True)

# -------------------------------
# Step 1: Load the cleaned data
# -------------------------------
df = pd.read_csv("../data/reviews_sentiment_themes.csv")

# Optional: check columns and first rows
print(df.head())
print(df.columns)

# -------------------------------
# Step 2: Define helper functions
# -------------------------------
def get_drivers_painpoints(df):
    """
    Identify top drivers (positive themes) and pain points (negative themes) per bank
    Returns a summary dataframe
    """
    summary = []

    for bank in df['bank'].unique():
        bank_df = df[df['bank'] == bank]
        
        # Drivers: most frequent positive sentiment themes
        drivers = bank_df[bank_df['sentiment_label'] == 'positive']['themes']\
                    .value_counts().head(2).index.tolist()
        # Pain points: most frequent negative sentiment themes
        painpoints = bank_df[bank_df['sentiment_label'] == 'negative']['themes']\
                        .value_counts().head(2).index.tolist()

        summary.append({
            'Bank': bank,
            'Driver(s)': ', '.join(drivers) if drivers else 'N/A',
            'Pain Point(s)': ', '.join(painpoints) if painpoints else 'N/A',
            'Suggested Improvements': 'Consider addressing pain points and enhancing drivers'
        })

    return pd.DataFrame(summary)

# -------------------------------
# Step 3: Compute summary table
# -------------------------------
summary_df = get_drivers_painpoints(df)
print("\nSummary of Drivers and Pain Points per Bank:\n")
print(summary_df)

# Save summary table as CSV
summary_csv_path = os.path.join(output_dir, "task4_summary.csv")
summary_df.to_csv(summary_csv_path, index=False)

# -------------------------------
# Step 4: Visualizations
# -------------------------------

# 1. Sentiment distribution per bank
plt.figure(figsize=(8,5))
sns.countplot(data=df, x='bank', hue='sentiment_label')
plt.title("Sentiment Distribution per Bank")
plt.xlabel("Bank")
plt.ylabel("Number of Reviews")
plt.legend(title='Sentiment')
plt.tight_layout()
plt.savefig(os.path.join(output_dir, "sentiment_distribution.png"))
plt.show()

# 2. Rating distribution per bank
plt.figure(figsize=(8,5))
sns.boxplot(data=df, x='bank', y='rating')
plt.title("Rating Distribution per Bank")
plt.xlabel("Bank")
plt.ylabel("Rating")
plt.tight_layout()
plt.savefig(os.path.join(output_dir, "rating_distribution.png"))
plt.show()

# 3. Overall Themes Word Cloud
all_themes = " ".join(df['themes'].astype(str))
wordcloud = WordCloud(width=800, height=400, background_color='white').generate(all_themes)
plt.figure(figsize=(15,7))
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis('off')
plt.title("Themes Word Cloud")
plt.tight_layout()
plt.savefig(os.path.join(output_dir, "themes_wordcloud.png"))
plt.show()

# 4. Optional: Per-bank Word Clouds
for bank in df['bank'].unique():
    text = ' '.join(df[df['bank'] == bank]['review'].astype(str))
    wordcloud = WordCloud(width=800, height=400, background_color='white').generate(text)
    plt.figure(figsize=(10,5))
    plt.imshow(wordcloud, interpolation='bilinear')
    plt.axis('off')
    plt.title(f"Word Cloud for {bank}")
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, f"wordcloud_{bank.replace(' ', '_')}.png"))
    plt.show()
