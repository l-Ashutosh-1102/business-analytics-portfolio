# Term-Deposit Campaign Targeting

## Project overview

This portfolio project uses historical telemarketing data to identify prospects who are more likely to subscribe to a fixed-term deposit product. The business objective is to improve call-centre efficiency by prioritising higher-probability prospects while reducing unproductive calls.

## Business question

**Which prospects should be contacted first when call-centre capacity is limited?**

## Data

- 4,000 historical call records
- 20% subscription rate
- 14 pre-call predictors used for modelling
- Call duration excluded from prediction because it is unavailable before a future call and would introduce target leakage

The raw dataset is not included because it was supplied for academic use.

## Analytical approach

1. Descriptive analysis of customer and campaign characteristics
2. Decision-tree exploration of influential features
3. Stratified 70/30 development-holdout split
4. Five-fold stratified cross-validation on the development sample
5. Comparison of Decision Tree, Logistic Regression and Random Forest models
6. Final holdout evaluation and probability-ranked targeting analysis

## Model results

The Random Forest provided the strongest overall cross-validated performance:

| Metric | Cross-validation | Holdout |
|---|---:|---:|
| Precision | 0.534 | 0.504 |
| Recall | 0.534 | 0.542 |
| F1 score | 0.534 | 0.522 |
| ROC-AUC | 0.788 | 0.764 |
| PR-AUC | 0.565 | 0.557 |

On the holdout sample, the top-ranked 10% of prospects achieved a 64.2% conversion rate and contained 32.1% of all subscribers. These are historical estimates and not guaranteed future outcomes.

## Key business insights

- Previous campaign success was the strongest descriptive signal.
- Known contact channels converted more strongly than an unknown channel.
- Conversion declined as the number of campaign contacts increased.
- The model should be used to rank prospects rather than automatically exclude customers.
- The operating threshold should be selected using call-centre capacity and campaign economics.

## Tools

- Python
- pandas
- scikit-learn
- matplotlib
- Jupyter Notebook

## Portfolio files

- `term-deposit-campaign-portfolio-report.pdf` - recruiter-facing business report
- `term-deposit-campaign-targeting.ipynb` - data preparation, modelling and evaluation workflow

## Limitations

The sample contains call records rather than unique customer identifiers, does not include explicit call-cost or product-margin data, and has not been externally validated on a later campaign. Observed relationships are predictive associations rather than causal effects.
