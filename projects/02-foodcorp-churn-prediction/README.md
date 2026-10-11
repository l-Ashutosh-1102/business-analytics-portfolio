# FoodCorp Customer Churn Prediction

## 30-Second Summary

Built a customer-churn early-warning workflow using **178,440 customer-week observations from 8,506 customers**. SQL was used to engineer time-aware behavioural features, and Python was used to compare and evaluate classification models. The purpose was to flag **currently active** customers who are at risk of future disengagement, so retention teams could intervene before they stop shopping.

On an untouched **final eight-week temporal holdout**, the selected Logistic Regression model achieved **86.81% recall** and **66.67% precision** for the churn class. These are historical validation results, not measured campaign outcomes.

---

## Business Problem

A retailer needs to identify early signs of disengagement rather than waiting until a customer is already lost.

**Question:** Can historical purchasing behaviour identify customers likely to become inactive, early enough to support targeted retention activity?

Churn was defined for the modelling exercise as **no purchase activity for more than 35 days**. This threshold was selected after considering the trade-off between early detection and customers' ordinary shopping intervals.

---

## Data & Preparation

- **8,506 unique customers** and **178,440 customer-week records** in the modelling analysis
- Weekly reference dates, with one row per customer still considered active at each date
- Transaction, receipt-line, product and customer information as the underlying sources
- Data-quality controls for negative quantities/values and extreme corrupted transactions

Raw source data is not published because it was supplied for academic analysis.

---

## Analytical Approach

### 1. SQL Feature Engineering

Historical features were calculated **as of each weekly reference date**, using only information available by that date:

- **Recency:** days since the most recent purchase
- **Frequency:** distinct purchase days over 7-, 35- and 70-day windows
- **Value and quantity:** spending and quantities over rolling windows
- **Breadth:** number of categories purchased
- **Behavioural trends:** changes in purchase frequency and spending between recent and earlier windows

Future purchase behaviour was used only to construct the churn label, not as a predictor.

### 2. Temporal Validation

Rather than randomly dividing customer-week rows, model development used **time-ordered validation folds** and reserved the **final eight weeks** as a holdout period. This better reflects the practical task of learning from past activity and predicting later periods.

### 3. Model Comparison and Tuning

- Compared **Logistic Regression** and **Random Forest**
- Scaled predictors within the Logistic Regression pipeline
- Tuned regularisation, class weighting and decision thresholds using development data
- Removed four exact duplicate window features before final fitting
- Selected **Logistic Regression with C = 3 and balanced class weights** for the final model

---

## Final Holdout Performance

| Metric | Result |
|---|---:|
| Accuracy | **78.24%** |
| Precision (churn) | **66.67%** |
| Recall (churn) | **86.81%** |
| F1 score (churn) | **75.42%** |

Confusion matrix, in the order **[[true negatives, false positives], [false negatives, true positives]]**: **[[8,930, 3,324], [1,010, 6,649]]**.

The model identified a large share of future churn cases, but it also generated false-positive alerts. An operational retention programme would need to balance intervention cost against the value of identifying additional at-risk customers.

---

## Business Insights & Recommendations

The modelling interpretation highlighted **declining shopping regularity** and **narrowing product-category engagement** as important churn signals. Spending added information, but relying on total spend alone would miss behavioural deterioration.

A practical retention workflow could:

1. **Score active customers weekly** and prioritise those with sustained high predicted risk.
2. **Use behavioural triggers** such as increasing recency, falling purchase frequency and declining category breadth to tailor outreach.
3. **Set an intervention threshold** based on available marketing capacity and the cost of unnecessary contact.
4. **Test incremental impact** with controlled retention campaigns before claiming reduced churn or financial uplift.
5. **Monitor model drift** as shopping behaviour changes over time.

These are proposed applications; the portfolio study did **not** measure the causal effect of retention interventions.

---

## Tools & Techniques

**SQL, Python, Pandas, Scikit-learn, Logistic Regression, Random Forest, temporal validation, behavioural feature engineering, classification metrics and permutation importance.**

## Project Files

- [View analysis notebook](notebooks/foodcorp-churn-prediction-portfolio-notebook.ipynb)
- [View portfolio report](reports/foodcorp-churn-prediction-portfolio-report.pdf)

## Reproducibility & Limitations

The notebook documents a **Spark/Databricks SQL and Python** workflow using tables such as `customers`, `products`, `receipts` and `receipt_lines`. It is not a self-contained notebook runnable without the original data and environment.

The holdout results describe historical predictive performance. They do not prove that model-driven communications increase customer retention. Future work should use campaign-response data, controlled experiments and costs/benefits to choose a deployment strategy.
