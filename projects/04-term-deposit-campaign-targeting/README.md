# Term-Deposit Campaign Targeting

## 30-Second Summary

This project develops a predictive targeting approach for a bank telemarketing campaign.

The objective was to identify customers most likely to subscribe to a fixed-term deposit product so that limited call-centre resources could be concentrated on higher-probability prospects.

Three classification models were compared:

- Decision Tree
- Logistic Regression
- Random Forest

Random Forest provided the strongest overall balance between identifying potential subscribers and limiting unnecessary calls.

On the holdout sample, the model achieved approximately:

- **Precision: 50.4%**
- **Recall: 54.2%**
- **F1 Score: 52.2%**
- **ROC-AUC: 76.4%**
- **PR-AUC: 55.7%**

The analysis also demonstrated that probability-based ranking can be more commercially useful than a simple yes/no prediction.

---

## Business Problem

Cold-call marketing is expensive because only a minority of contacted customers will subscribe.

The business question was therefore:

> **Which prospects should be contacted first when call-centre capacity is limited?**

The objective was not simply to maximise model accuracy.

The model needed to balance:

- capturing likely subscribers
- avoiding unnecessary calls
- call-centre capacity
- commercial efficiency

---

## Dataset

The analysis used approximately:

- **4,000 historical telemarketing records**
- customer demographic information
- financial characteristics
- previous campaign outcomes
- contact-history information
- final subscription outcome

The target variable identified whether the customer subscribed to the deposit product.

---

## Leakage Prevention

Call duration was deliberately excluded from predictive modelling.

Although duration is strongly associated with subscription outcome, it is only known after a call has already taken place.

Using it to decide whom to call would therefore introduce target leakage and would not reflect a realistic deployment scenario.

---

## Exploratory Analysis

The exploratory analysis identified several useful behavioural signals.

### Previous Campaign Outcome

Previous campaign success was one of the strongest descriptive indicators of future subscription.

### Financial Position

Higher account balances generally corresponded with higher conversion rates, although the relationship was not perfectly monotonic.

### Loan Status

Customers with fewer existing loan obligations generally showed stronger conversion.

### Contact Behaviour

Unknown contact channels combined with limited prior success represented comparatively low-yield groups.

---

## Model Comparison

Three classification models were evaluated.

### Decision Tree

Advantages:

- highly interpretable
- strong precision

Limitation:

- low recall
- missed many potential subscribers

### Logistic Regression

Advantages:

- strong recall
- probability-based output

Limitation:

- relatively high false-positive volume

### Random Forest

Provided the most balanced precision-recall trade-off and was therefore selected as the preferred model.

---

## Final Model Performance

| Metric | Holdout Result |
|---|---:|
| Accuracy | ~80.2% |
| Precision | **50.4%** |
| Recall | **54.2%** |
| F1 Score | **52.2%** |
| ROC-AUC | **76.4%** |
| PR-AUC | **55.7%** |

Accuracy was interpreted carefully because approximately 80% of observations belonged to the majority class.

A majority-class benchmark could achieve high accuracy while identifying no subscribers, so precision, recall, F1 and ranking performance were considered more commercially informative.

---

## Probability-Based Targeting

Rather than using only a binary classification outcome, predicted probabilities can be used to rank prospects.

For example, in the historical holdout sample:

- the top-ranked **10% of prospects** captured approximately **32.1% of subscribers**
- this group achieved approximately **64.2% conversion**
- the top-ranked **30%** captured approximately **62.1% of subscribers**
- this group achieved approximately **41.4% conversion**

These figures are historical estimates rather than guaranteed future campaign performance.

---

## Business Recommendations

### 1. Use Probability Ranking

Call-centre teams should rank prospects by predicted subscription probability.

### 2. Match Threshold to Capacity

The probability threshold should not be fixed permanently.

It should reflect:

- campaign budget
- available agents
- customer-contact cost
- expected product value

### 3. Monitor Campaign Outcomes

Future campaign data should be used to:

- recalibrate probabilities
- retrain the model
- monitor performance drift
- update targeting thresholds

### 4. Prioritise Previous Successful Customers

Customers with successful previous campaign interactions represent a particularly attractive group for prioritisation.

---

## Tools & Techniques

- Python
- Pandas
- Scikit-learn
- Logistic Regression
- Decision Tree
- Random Forest
- Classification
- Feature Engineering
- Confusion Matrix Analysis
- ROC-AUC
- PR-AUC
- Probability Ranking

---

## Project Files

- [View analysis notebook](notebooks/term-deposit-campaign-targeting.ipynb)
- [View portfolio report](reports/term-deposit-campaign-portfolio-report.pdf)

---

## Limitations

The dataset represents historical campaign behaviour.

Model performance could change because of:

- changing customer behaviour
- economic conditions
- campaign design
- product pricing
- contact strategy

The dataset also does not include explicit call-centre cost or customer lifetime value.

A production version should therefore optimise the probability threshold using real campaign economics.

---

## Data Availability

The original campaign dataset is not included publicly because it was supplied for academic analysis.

The notebook and report demonstrate the modelling methodology and business interpretation.
