# Customer Shopping Behaviour Analysis
**Business analytics report | Python, Databricks SQL and Power BI | October 2026**

## Executive summary
This descriptive retail analytics project examines 3,900 shopping records, with 3,900 distinct customer IDs. It investigates purchase concentration, subscription patterns, discount usage, product ratings and shipping choices. Data preparation was conducted using Python/pandas, business questions were explored with Databricks SQL, and a one-page Power BI dashboard was developed.

| Indicator | Verified result |
|---|---:|
| Purchase records | 3,900 |
| Unique customer IDs | 3,900 |
| Total recorded purchase amount | **$233,081** |
| Average purchase amount | **$59.76** |
| Mean review rating after imputation | **3.75 / 5** |
| Subscribers | **1,053 (27.0%)** |
| Discounted purchase records | **1,677 (43.0%)** |

**Principal finding:** Clothing accounted for **$104,264 (44.7%)** of recorded purchase value. Subscription status was **not associated with a higher mean purchase amount** in these data.

## 1. Business problem and objective
The retail scenario asks how the company could use customer shopping data to identify trends, improve engagement, and optimise its product and marketing strategies. The practical questions were:
- Where are recorded purchase value and transaction counts concentrated?
- How do discounts, product ratings, and shipping methods vary?
- How does observed spending differ between subscribers and non-subscribers?
- Which patterns deserve a carefully measured commercial test?

## 2. Dataset and scope
The original dataset contains **3,900 records and 18 fields**, including age, gender, location, item purchased, category, purchase amount (USD), season, size, colour, review rating, subscription status, shipping type, discount status, promo flag, previous purchases and stated purchasing frequency. After feature engineering, the prepared data have 19 fields.

Each customer ID occurs once in the available records. Although a `previous_purchases` field exists, this file does not contain observed customer-level transaction histories or dated orders; consequently, labels based on previous purchases should not be confused with measured churn or retention outcomes.

## 3. Analytical approach
**Python and pandas.** The data were loaded and inspected with schema summaries, summary statistics and null checks. The 37 missing values in `Review Rating` were imputed with the median rating for each category. Column names were standardised to snake_case, and customer ages were binned into descriptive quartiles: Young (18–31), Adult (32–44), Middle Aged (45–57), and Senior (58–70). Discount and promo flags were checked for redundancy and retained.

**Databricks SQL.** The pandas DataFrame was converted to PySpark, registered as the temporary `customer` SQL view, and made available through the persistent Delta table `workspace.default.customer_powerbi`. Queries used aggregation, conditional expressions, scalar subqueries, CTEs and `ROW_NUMBER()` for item rankings.

**Power BI.** An interactive one-page dashboard summarised customer count, mean purchase value, ratings, subscription proportion, category performance and age-group performance, with slicers for demographic and shopping attributes.

## 4. Findings

### 4.1 Category-level purchase value
| Category | Recorded purchase value |
|---|---:|
| Clothing | $104,264 |
| Accessories | $74,200 |
| Footwear | $36,093 |
| Outerwear | $18,524 |
| **Total** | **$233,081** |

Clothing contributed 1,737 of the 3,900 purchase records and the largest share of purchase value. These values are **not profit measures**.

### 4.2 Subscription status
| Subscription | Records | Recorded value | Mean purchase |
|---|---:|---:|---:|
| Yes | 1,053 | $62,645 | $59.49 |
| No | 2,847 | $170,436 | $59.87 |

The mean purchase difference is only $0.38 and is in the opposite direction from an assumed subscriber spending premium. The available snapshot does not justify a claim that subscriptions improve spending.

### 4.3 Discount usage
**1,677 of 3,900 records (43.0%)** indicate a discount. The highest observed item-level discount application rates are **Hat 50.00%; Sneakers 49.66%; Coat 49.07%; Sweater 48.17%; Pants 47.37%**. These figures measure whether a purchase was discounted, not discount depth, incremental lift or return on promotion.

### 4.4 Product ratings and shipping
Gloves (3.86), Sandals (3.84) and Boots (3.82) had the highest item-level average review ratings in the reported ranking. Ratings include category-median imputations, so comparisons should be checked with observed-only ratings and item counts.

The average recorded purchase amount was **$60.48 for Express** shipping versus **$58.46 for Standard**, a descriptive $2.02 difference. It does not demonstrate a causal effect of shipping choice.

### 4.5 Demographics and history proxy
The recorded purchase amount was **$157,890** among male-labelled records and **$75,191** among female-labelled records. Young customers (dataset quartile 18–31) contributed **$62,143**, the highest age-group recorded value. Purchase-history proxy labels classified 83 as *New*, 701 as *Returning* and 3,116 as *Loyal*; these are rule-based categories, not validated loyalty outcomes.

## 5. Dashboard deliverable
The authored Power BI dashboard contains three KPI cards, a subscription split, category and age-group charts of purchase value and purchase counts, and filters for subscription status, gender, category and shipping type. Count-based visuals use **Count of Customer ID**, not Sum. The most recently submitted PBIX is the intended final editable dashboard; its binary file must be uploaded separately to GitHub.

## 6. Recommendations and KPIs
| Priority | Recommendation | Success measure |
|---|---|---|
| Category focus | Protect Clothing availability and review the underrepresented category assortments in light of gross margin | In-stock rate, margin, conversion |
| Subscription pilot | Test subscriber-specific benefits against a comparable control group rather than assuming higher spending | Incremental repeat purchase and contribution margin |
| Discount governance | Evaluate frequent-discount items with targeted promotions | Incremental profit net of discount and campaign costs |
| Product merchandising | Feature consistently well-rated products with adequate review counts | Conversion, returns and rating stability |

These are proposals for future measurement, **not** verified effects of the interventions.

## 7. Limitations
The data source does not establish a representative sample of real retail customers. Transaction dates, item quantities, contribution margins, discount values, acquisition costs and controlled experimental results are unavailable. Recorded purchase value is not validated net revenue. All findings are descriptive, and the one-record-per-ID snapshot cannot establish longitudinal loyalty, customer lifetime value or the causal influence of discounts, subscriptions and shipping.

## 8. Reproducibility
The repository contains a streamlined notebook and Databricks SQL queries. The notebook requires a valid `customer_shopping_behavior.csv` data path and an accessible Databricks environment. The original CSV is not included. Source-based analysis and reconciliation notes are in `docs/analysis_validation_notes.md`.

*Basis: Uploaded project notebook, revised Power BI file and accompanying source reference report. The original reference PDF described PostgreSQL, but the notebook documents a Databricks SQL workflow; this report follows the executed work.*
