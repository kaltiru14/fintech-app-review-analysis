# task4_analysis.py

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from wordcloud import WordCloud
import os

# -------------------------------
# Step 1: Load the cleaned data with error handling
# -------------------------------
try:
    df = pd.read_csv("../data/reviews_sentiment_themes.csv")
except FileNotFoundError:
    raise SystemExit("Error: CSV file not found at ../data/reviews_sentiment_themes.csv")
except Exception as e:
    raise SystemExit(f"Error reading CSV: {e}")

print(df.head())
print(df.columns)

# -------------------------------
# Step 2: Helper function to get bank-specific drivers, pain points, and recommendations
# -------------------------------
def get_drivers_painpoints(df):
    summary = []
    for bank in df['bank'].unique():
        bank_df = df[df['bank'] == bank]

        drivers = bank_df[bank_df['sentiment_label'] == 'positive']['themes']\
                    .value_counts().head(2).index.tolist()
        painpoints = bank_df[bank_df['sentiment_label'] == 'negative']['themes']\
                        .value_counts().head(2).index.tolist()

        # Bank-specific recommendations
        recommendations = []
        if bank == "CBE":
            if "Customer Support" in painpoints:
                recommendations.append("Improve customer support response times")
            if "Account Access Issues" in painpoints:
                recommendations.append("Simplify account login and verification process")
            if "Other" in drivers:
                recommendations.append("Highlight popular app features in tutorials")
        elif bank == "BOA":
            if "Transaction Performance" in painpoints:
                recommendations.append("Optimize transaction speed and reliability")
            if "Customer Support" in painpoints:
                recommendations.append("Provide clear guidance for common issues")
            if "Other" in drivers:
                recommendations.append("Promote fast navigation and app stability")
        elif bank == "Dashen":
            if "Feature Requests" in painpoints:
                recommendations.append("Add requested features based on feedback")
            if "User Interface & Experience" in drivers:
                recommendations.append("Keep UI intuitive and user-friendly")
        else:
            recommendations.append("Consider addressing pain points and enhancing drivers")

        summary.append({
            'Bank': bank,
            'Driver(s)': ', '.join(drivers) if drivers else 'N/A',
            'Pain Point(s)': ', '.join(painpoints) if painpoints else 'N/A',
            'Suggested Improvements': '; '.join(recommendations) if recommendations else 'N/A'
        })

    return pd.DataFrame(summary)

# -------------------------------
# Step 3: Compute summary table
# -------------------------------
summary_df = get_drivers_painpoints(df)
print("\nSummary of Drivers and Pain Points per Bank:\n")
print(summary_df)

# Ensure outputs folder exists
os.makedirs("../outputs", exist_ok=True)
summary_df.to_csv("../outputs/task4_summary.csv", index=False)

# -------------------------------
# Step 4: Visualizations with error handling
# -------------------------------
try:
    # 1. Sentiment distribution per bank
    plt.figure(figsize=(8,5))
    sns.countplot(data=df, x='sentiment_label', hue='bank')
    plt.title("Sentiment Distribution per Bank")
    plt.xlabel("Sentiment")
    plt.ylabel("Number of Reviews")
    plt.legend(title='Bank')
    plt.tight_layout()
    plt.savefig("../outputs/sentiment_distribution.png")
    plt.show()

    # 2. Rating distribution per bank
    plt.figure(figsize=(8,5))
    sns.boxplot(data=df, x='bank', y='rating')
    plt.title("Rating Distribution per Bank")
    plt.xlabel("Bank")
    plt.ylabel("Rating")
    plt.tight_layout()
    plt.savefig("../outputs/rating_distribution.png")
    plt.show()

    # 3. Word Clouds per bank
    for bank in df['bank'].unique():
        text = ' '.join(df[df['bank']==bank]['review'].astype(str))
        wordcloud = WordCloud(width=800, height=400, background_color='white').generate(text)
        plt.figure(figsize=(10,5))
        plt.imshow(wordcloud, interpolation='bilinear')
        plt.axis('off')
        plt.title(f"Word Cloud for {bank}")
        plt.tight_layout()
        plt.savefig(f"../outputs/wordcloud_{bank.replace(' ', '_')}.png")
        plt.show()
except Exception as e:
    print(f"Error generating visualizations: {e}")

# Optional: add additional plots (e.g., average sentiment score per bank over time)
