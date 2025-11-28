# scripts/analyze_sentiment_themes.py

import pandas as pd
from nltk.corpus import stopwords
from sklearn.feature_extraction.text import TfidfVectorizer
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
import spacy

# Load SpaCy English model
nlp = spacy.load("en_core_web_sm")

# Load data
df = pd.read_csv("data/clean_reviews.csv")

# Initialize sentiment analyzer
analyzer = SentimentIntensityAnalyzer()

# Step 1: Sentiment Analysis
def get_sentiment_label(score):
    if score >= 0.05:
        return "positive"
    elif score <= -0.05:
        return "negative"
    else:
        return "neutral"

df["sentiment_score"] = df["review"].apply(lambda x: analyzer.polarity_scores(str(x))["compound"])
df["sentiment_label"] = df["sentiment_score"].apply(get_sentiment_label)

# Step 2: Preprocessing for Thematic Analysis
stop_words = set(stopwords.words("english"))

def preprocess_text(text):
    doc = nlp(str(text).lower())
    tokens = [token.lemma_ for token in doc if token.is_alpha and token.text not in stop_words]
    return " ".join(tokens)

df["clean_text"] = df["review"].apply(preprocess_text)

# Step 3: TF-IDF Keyword Extraction
vectorizer = TfidfVectorizer(max_features=100, ngram_range=(1,2))
tfidf_matrix = vectorizer.fit_transform(df["clean_text"])
keywords = vectorizer.get_feature_names_out()

# Step 4: Manual Theme Mapping
# Map common keywords into 3-5 themes
themes = {
    "Account Access Issues": ["login", "password", "account", "unlock"],
    "Transaction Performance": ["transfer", "slow", "loading", "payment", "crash"],
    "User Interface & Experience": ["ui", "navigation", "button", "menu", "design"],
    "Customer Support": ["support", "help", "service", "response"],
    "Feature Requests": ["fingerprint", "biometric", "feature", "update", "tool"]
}

def assign_theme(text):
    matched_themes = []
    for theme, kw_list in themes.items():
        for kw in kw_list:
            if kw in text:
                matched_themes.append(theme)
                break
    if not matched_themes:
        matched_themes.append("Other")
    return ", ".join(matched_themes)

df["themes"] = df["clean_text"].apply(assign_theme)

# Step 5: Save results
df[["review", "rating", "date", "bank", "source", "sentiment_label", "sentiment_score", "themes"]].to_csv(
    "data/reviews_sentiment_themes.csv", index=False
)

print("Sentiment and thematic analysis completed!")
print("Output saved to data/reviews_sentiment_themes.csv")
