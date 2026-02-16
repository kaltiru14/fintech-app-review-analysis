import streamlit as st
import pandas as pd
import plotly.express as px

st.set_page_config(page_title="Fintech App Review Dashboard", layout="wide")

st.title("📊 Fintech App Review Analysis Dashboard")

# -------------------------------
# Load Data
# -------------------------------

@st.cache_data
def load_data():
    return pd.read_csv("data/reviews_sentiment_themes.csv")

df = load_data()

# -------------------------------
# Sidebar Filters
# -------------------------------

st.sidebar.header("Filters")

banks = st.sidebar.multiselect(
    "Select Bank",
    options=df["bank"].unique(),
    default=df["bank"].unique()
)

sentiments = st.sidebar.multiselect(
    "Select Sentiment",
    options=df["sentiment_label"].unique(),
    default=df["sentiment_label"].unique()
)

filtered_df = df[
    (df["bank"].isin(banks)) &
    (df["sentiment_label"].isin(sentiments))
]

# -------------------------------
# Sentiment Distribution
# -------------------------------

col1, col2 = st.columns(2)

with col1:
    st.subheader("Sentiment Distribution")
    sentiment_counts = filtered_df["sentiment_label"].value_counts().reset_index()
    sentiment_counts.columns = ["sentiment", "count"]

    fig = px.pie(
        sentiment_counts,
        names="sentiment",
        values="count",
        title="Overall Sentiment Distribution"
    )
    st.plotly_chart(fig, use_container_width=True)

# -------------------------------
# Sentiment by Bank
# -------------------------------

with col2:
    st.subheader("Sentiment by Bank")
    bank_sentiment = (
        filtered_df.groupby(["bank", "sentiment_label"])
        .size()
        .reset_index(name="count")
    )

    fig2 = px.bar(
        bank_sentiment,
        x="bank",
        y="count",
        color="sentiment_label",
        barmode="group",
        title="Sentiment Breakdown by Bank"
    )
    st.plotly_chart(fig2, use_container_width=True)

# -------------------------------
# Theme Distribution
# -------------------------------

st.subheader("Theme Distribution")

theme_counts = (
    filtered_df["themes"]
    .str.split(", ")
    .explode()
    .value_counts()
    .reset_index()
)

theme_counts.columns = ["theme", "count"]

fig3 = px.bar(
    theme_counts,
    x="theme",
    y="count",
    title="Most Common Themes"
)

st.plotly_chart(fig3, use_container_width=True)

# -------------------------------
# Reviews Over Time
# -------------------------------

st.subheader("Reviews Over Time")

if "date" in filtered_df.columns:
    filtered_df["date"] = pd.to_datetime(filtered_df["date"], errors="coerce")
    time_data = (
        filtered_df.groupby(filtered_df["date"].dt.date)
        .size()
        .reset_index(name="count")
    )

    fig4 = px.line(
        time_data,
        x="date",
        y="count",
        title="Review Volume Over Time"
    )

    st.plotly_chart(fig4, use_container_width=True)

# -------------------------------
# Raw Data Viewer
# -------------------------------

st.subheader("Raw Data")
st.dataframe(filtered_df.head(50))
