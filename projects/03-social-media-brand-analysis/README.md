# Social Media Brand Analytics: Netflix vs Amazon Prime Video

## 30-Second Summary

This project analyses public BlueSky discussion around Netflix and Amazon Prime Video to compare brand visibility, sentiment, engagement and discussion themes.

Python was used to collect approximately **4,000 public posts**, followed by data cleaning, engagement analysis, VADER sentiment scoring, TF-IDF text vectorisation and NMF topic modelling.

The analysis found that Netflix generated greater discussion volume and a broader user base, while Amazon Prime Video showed stronger average engagement and more favourable sentiment within the analysed sample.

The project also developed a post-level screening framework for identifying potential micro-influencer candidates.

---

## Business Problem

Streaming platforms generate large volumes of public online discussion.

Post volume alone, however, does not explain:

- how positively audiences perceive the brand
- which themes drive conversation
- what content generates engagement
- which users could support brand amplification

The objective was therefore to answer:

> **How do Netflix and Amazon Prime Video differ in public social-media conversation, audience sentiment and engagement behaviour?**

---

## Data Collection

Public posts were collected from BlueSky using Python keyword searches.

Approximately:

- **2,000 Netflix posts**
- **2,000 Amazon Prime Video posts**

were initially collected.

After cleaning, the main brand-analysis dataset contained:

- **1,888 Netflix posts**
- **1,644 Amazon Prime Video posts**

For English-language text analysis:

- **1,106 Netflix posts**
- **637 Amazon Prime Video posts**

were retained.

---

## Data Preparation

The social-media data required several preparation steps.

These included:

- duplicate removal
- post-ID validation
- cross-brand mention checks
- text cleaning
- language filtering
- engagement-field preparation
- removal of URLs and low-value text
- brand-noise reduction for topic modelling

The analysis should be interpreted as a snapshot of public BlueSky conversation rather than a representative measure of the entire streaming market.

---

## Analytical Approach

### 1. Brand Activity

Brand visibility was evaluated using:

- number of posts
- number of unique users
- posting frequency
- hashtag behaviour

### 2. Engagement Analysis

Total engagement combined:

- likes
- reposts
- replies
- quotes

Average and total engagement were compared between brands.

### 3. Sentiment Analysis

VADER sentiment analysis was applied to English-language posts.

Posts were classified as:

- positive
- neutral
- negative

### 4. Text Analytics

TF-IDF was used to identify distinctive language patterns.

NMF topic modelling was then applied to identify repeated discussion themes.

### 5. Micro-Influencer Screening

Potential candidates were evaluated using observable post-level measures including:

- brand-related posting activity
- total engagement
- average engagement
- median engagement
- maximum engagement
- account-type suitability

---

## Key Results

### Brand Visibility

Netflix generated:

- **1,888 cleaned posts**
- **1,189 unique users**

Amazon Prime Video generated:

- **1,644 cleaned posts**
- **839 unique users**

Netflix therefore showed broader conversation volume within the collected sample.

---

### Engagement

Average engagement per post:

- Netflix: **2.28**
- Amazon Prime Video: **9.18**

Total engagement:

- Netflix: **4,298**
- Amazon Prime Video: **15,103**

Despite having fewer posts, Amazon Prime Video generated stronger engagement intensity.

---

### Sentiment

| Brand | Positive | Neutral | Negative | Net Sentiment |
|---|---:|---:|---:|---:|
| Amazon Prime Video | **58.87%** | 21.66% | 19.47% | **39.40%** |
| Netflix | 43.85% | 32.91% | 23.24% | 20.61% |

Amazon Prime Video therefore showed a more favourable sentiment profile in the analysed English-language sample.

---

## Topic & Brand Positioning Insights

Both brands generated substantial discussion around:

- new content
- trailers
- films
- series releases

However, important differences emerged.

### Netflix

More strongly associated with:

- viewer opinion
- recommendations
- entertainment discussion
- audience reaction

### Amazon Prime Video

More strongly associated with:

- platform access
- content availability
- live sport
- event streaming
- franchise/content moments

The resulting positioning can therefore be summarised as:

**Netflix:** broader entertainment conversation

**Amazon Prime Video:** more concentrated content-access and event-driven engagement

---

## Micro-Influencer Analysis

Potential candidates were not selected purely using post count.

The screening process considered both:

- repeated brand relevance
- engagement quality

while avoiding accounts that appeared to be:

- media feeds
- publisher accounts
- invalid handles
- highly amplified one-off posts with limited repeated relevance

The analysis produced one pilot candidate for each brand based on the available post-level evidence.

These recommendations should be treated as preliminary because follower-network and audience-demographic information was unavailable.

---

## Business Recommendations

### Netflix

Netflix should focus on converting broad visibility into stronger audience advocacy through:

- fan-led campaigns
- recommendation content
- release-specific engagement
- viewer reaction campaigns
- community amplification

### Amazon Prime Video

Amazon Prime Video should build on high-engagement moments around:

- major releases
- franchises
- live sporting events
- trailers
- platform-access messaging

---

## Tools & Techniques

- Python
- Pandas
- BlueSky data collection
- Natural Language Processing
- VADER Sentiment Analysis
- TF-IDF
- NMF Topic Modelling
- Engagement Analysis
- Text Cleaning
- Influencer Screening
- Matplotlib

---

## Project Files

- [View analysis notebook](notebooks/social-media-brand-analytics-portfolio-notebook.ipynb)
- [View portfolio report](reports/social-media-brand-analytics-portfolio-report.pdf)

---

## Limitations

This analysis represents a snapshot rather than a longitudinal brand-tracking study.

Important limitations include:

- keyword-based collection
- no geographical filtering
- smaller English-language subset
- automated sentiment limitations
- possible event-driven engagement spikes
- follower/following network data unavailable

Future analysis could collect data around specific release windows and compare how sentiment and engagement evolve over time.

---

## Data Availability

Raw BlueSky post data is not publicly included.

The repository contains the analytical methodology, portfolio notebook and aggregated findings for professional demonstration.
