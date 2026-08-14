# Retail Customer Segmentation for Targeted Marketing

## 30-Second Summary

This project segments 3,000 retail loyalty customers using six months of transactional behaviour to identify distinct shopping patterns and support more targeted marketing decisions.

Customer-level behavioural and category-spend features were engineered from multiple transactional tables, standardised and reduced using Principal Component Analysis (PCA), before applying K-Means clustering.

A five-segment solution was selected using elbow and silhouette diagnostics. The resulting segments showed meaningful differences in customer value, visit frequency, recency, basket size and product-category behaviour.

The analysis identified high-value customers requiring retention activity and less-recent, high-basket-value customers suitable for reactivation and basket-building campaigns.

---

## Business Problem

A convenience retailer serves customers with very different shopping behaviours.

Using the same promotions for every customer can result in:

- inefficient marketing spend
- irrelevant offers
- missed retention opportunities
- limited understanding of customer value

The objective was therefore to answer:

> **Can customers be grouped into meaningful behavioural segments that support more targeted marketing decisions?**

---

## Dataset Overview

The analysis used transactional data covering:

- **3,000 loyalty customers**
- approximately **six months of shopping behaviour**
- customer-level summary data
- individual shopping baskets
- category-level spend
- line-item transaction records

The raw datasets are not included in this repository because they were supplied for academic analysis.

A significant data-quality issue was identified in bakery spend. Bakery values had been recorded as zero in the category-level table despite bakery purchases appearing in the line-item data.

Bakery spend was therefore recalculated from transaction-level records, affecting **2,963 of 3,000 customers (98.8%)**.

---

## Analytical Approach

### 1. Data Preparation

The four transactional sources were combined into a customer-level analytical dataset.

Preparation included:

- currency conversion
- correction of inconsistent values
- bakery-spend reconstruction
- aggregation from basket level to customer level
- category-spend integration

### 2. Feature Engineering

Features were created across four behavioural dimensions:

**Engagement**
- number of baskets
- recency

**Customer Value**
- total basket spend
- average basket spend
- maximum basket spend
- spend variability

**Basket Behaviour**
- basket quantity
- average basket quantity
- category breadth
- basket variability

**Category Preference**
- spend across approximately 20 retail categories

### 3. Correlation Control

Highly correlated features were reviewed to avoid duplicated behavioural signals dominating clustering distances.

Variables with correlations above approximately |0.95| were reviewed and redundant features removed.

### 4. Scaling and PCA

All modelling features were standardised using z-score scaling.

Principal Component Analysis was then used to reduce dimensionality and residual multicollinearity.

**13 principal components retained approximately 80% of total variance.**

### 5. K-Means Clustering

K-Means solutions between approximately 4 and 10 clusters were evaluated using:

- inertia / elbow analysis
- silhouette score
- segment size
- business interpretability

A **five-segment solution** was selected.

The final silhouette score was approximately **0.171**, reflecting the natural overlap expected in retail customer behaviour.

---

## Key Results

The five segments showed clear differences across customer value, engagement and shopping mission.

| Segment | Approx. Share | Profile |
|---|---:|---|
| Mainstream Value Shoppers | 45.0% | Lower-value mainstream shoppers with relatively lower engagement |
| Premium Mission Shoppers | 3.0% | Highest-value customers with large, broad baskets |
| Convenience Top-Up Regulars | 7.5% | Very frequent shoppers with strong convenience-related category behaviour |
| Habitual Micro-Trip Shoppers | 25.7% | Highly active customers making frequent low-value visits |
| Periodic Stock-Up Shoppers | 18.8% | Larger baskets but lower visit frequency and higher recency |

### Value Differences

Average total spend ranged from approximately:

- **£415** for the mainstream group
- to approximately **£2,158** for premium mission shoppers

Premium shoppers also recorded average basket spend of approximately **£44.79**, compared with around **£10–£11** for some frequent micro-trip segments.

---

## Business Recommendations

### 1. Protect Premium Mission Shoppers

The premium segment represents only around **3% of customers**, but contributes substantially higher spend per customer.

Recommended actions:

- personalised retention offers
- VIP-style benefits
- high-value bundles
- service and product-availability monitoring
- share-of-wallet campaigns

### 2. Reactivate Periodic Stock-Up Shoppers

This group displays relatively high basket value but longer periods since the most recent visit.

Recommended actions:

- recency-triggered communications
- replenishment reminders
- cross-category bundles
- basket-building promotions
- targeted multi-buy campaigns

### 3. Increase Basket Size Among Frequent Micro-Trip Customers

These customers already visit frequently, so generating more visits may provide limited incremental value.

Instead, promotions should focus on:

- complementary product recommendations
- small basket-addition incentives
- cross-category offers

---

## Tools & Techniques

- Python
- Pandas
- NumPy
- Scikit-learn
- PCA
- K-Means Clustering
- Feature Engineering
- Customer Analytics
- Matplotlib
- Exploratory Data Analysis

---

## Project Files

- [View analysis notebook](notebooks/customer-segmentation-portfolio-notebook.ipynb)
- [View portfolio report](reports/customer-segmentation-portfolio-report.pdf)

---

## Limitations

The segmentation is descriptive rather than causal.

The clusters identify behavioural similarities but do not demonstrate that a particular marketing intervention will cause improved performance.

A useful next stage would therefore be to combine the segmentation with:

- campaign-response data
- A/B testing
- uplift modelling
- customer lifetime value
- longitudinal segment migration analysis

---

## Data Availability

The original transactional datasets and customer-level assignment file are not publicly included because the data was supplied for academic analysis.

Only the analytical methodology, code structure and aggregated findings are provided for portfolio demonstration.
