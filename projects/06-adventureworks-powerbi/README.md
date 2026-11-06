# AdventureWorks — Sales & Returns Dashboard

**Power BI • DAX • Data Modelling • KPI Reporting** | Independent portfolio project using sample retail data

## Business question

How can an analyst bring together sales, returns, product, customer, territory and calendar information to monitor commercial performance and identify where further investigation is needed?

## What the report demonstrates

- **Dimensional modelling:** A sales fact table (2020–2022) and returns data related to Calendar, Customer, Product and Territory lookup tables; product subcategory and category lookups provide further product hierarchy.
- **DAX measures:** A dedicated measure table is visible in the model, with measures for orders, revenue and time-based reporting. The report also displays profit and return-rate KPIs. Individual formulas have not been independently audited.
- **Executive reporting:** Revenue trends, orders by product category, product-level order/revenue/return comparisons and monthly indicators versus targets.
- **Interactive Power BI:** A native multi-page PBIX report, including an executive dashboard and model views.

## Values displayed in the supplied dashboard

| KPI | Displayed value |
|---|---:|
| Revenue | **$24.91M** |
| Profit | **$10.46M** |
| Total orders | **25K** |
| Return rate | **2.17%** |

These are values shown in the supplied Power BI screenshot, **not independently reconciled to the underlying data**. The figures are from a sample-data dashboard, not realised results at a company where the author was employed.

## Files

- [Open the editable Power BI report](dashboard/Adventure%20works%20dash%20board.pbix)
- [View the data model](dashboard/Screenshot%202026-11-05%20170405.png)

The PBIX and model screenshot are uploaded. The executive-dashboard screenshot has not yet been added to this repository.

### Data model

![AdventureWorks Power BI data model](dashboard/Screenshot%202026-11-05%20170405.png)

## Interpretation notes

The model and visuals support descriptive performance monitoring. The screenshots do not independently establish the accuracy of every DAX expression, the integrity of all relationships, or causal drivers of revenue and returns. Power BI Desktop may request updated data credentials when the PBIX is opened on another computer.
