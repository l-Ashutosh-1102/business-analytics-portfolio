# Analysis validation and source notes

The project is grounded in the submitted Databricks Python/SQL notebook and Power BI dashboard.

- The source notebook uses pandas, PySpark, a temporary Databricks SQL view named `customer`, and a persistent Delta table `workspace.default.customer_powerbi`. The earlier reference PDF mentioned PostgreSQL, but that is not the workflow documented by the actual notebook.
- Original input: 3,900 purchase records and 18 columns. The prepared dataset has 19 columns, including derived `age_group`; 37 missing review ratings were imputed with category medians.
- Reconciled metrics: 3,900 customer IDs; $233,081 total recorded purchase value; $59.76 average purchase; and 3.75 mean imputed review rating.
- `promo_code_used` and `discount_applied` match in the saved prepared data; they are not independent measures of promotions.
- The top-three ranking query includes a secondary alphabetical ordering for deterministic treatment of ties under `ROW_NUMBER()`.
- Power BI count charts use Count of Customer ID, not Sum; misleading internal names in the PBIX metadata do not change the aggregation.
- The original CSV was not separately supplied for publication. Run the notebook after providing a CSV copy to which you hold publication/use rights.
- This is descriptive, cross-sectional data with no transaction timestamps, profit margins, discount amounts, or observed longitudinal purchase histories; causal or retention claims are not warranted.

**Binary assets pending for GitHub:** updated Power BI PBIX, preview PNG, PDF/DOCX report and source business brief are present in the project ZIP supplied with this work but have not been uploaded via the GitHub text-file connector.
