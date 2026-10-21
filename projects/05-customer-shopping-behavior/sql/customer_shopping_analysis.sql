-- Customer Shopping Behaviour | Databricks SQL
-- Source: workspace.default.customer_powerbi (3,900 customer purchase records)
-- Run against the permanent Delta table. Database/catalog names vary by workspace.

-- 1. Portfolio headline KPIs
SELECT COUNT(*) AS purchase_records,
       COUNT(DISTINCT customer_id) AS distinct_customer_ids,
       SUM(purchase_amount) AS recorded_purchase_value_usd,
       ROUND(AVG(purchase_amount), 2) AS avg_purchase_amount_usd,
       ROUND(AVG(review_rating), 2) AS avg_review_rating
FROM workspace.default.customer_powerbi;

-- 2. Category performance
SELECT category,
       COUNT(*) AS purchase_records,
       SUM(purchase_amount) AS purchase_value_usd,
       ROUND(AVG(purchase_amount), 2) AS avg_purchase_usd
FROM workspace.default.customer_powerbi
GROUP BY category
ORDER BY purchase_value_usd DESC;

-- 3. Revenue by gender (descriptive, not causal)
SELECT gender,
       COUNT(*) AS purchase_records,
       SUM(purchase_amount) AS purchase_value_usd,
       ROUND(AVG(purchase_amount), 2) AS avg_purchase_usd
FROM workspace.default.customer_powerbi
GROUP BY gender;

-- 4. High-spending discount users (overall average comparison)
SELECT customer_id, purchase_amount
FROM workspace.default.customer_powerbi
WHERE LOWER(TRIM(discount_applied)) = 'yes'
  AND purchase_amount >= (
      SELECT AVG(purchase_amount)
      FROM workspace.default.customer_powerbi
  )
ORDER BY purchase_amount DESC, customer_id;

-- 5. Highest-rated items (rating values include category-median imputation)
SELECT item_purchased,
       COUNT(*) AS rated_purchase_records,
       ROUND(AVG(review_rating), 2) AS avg_review_rating
FROM workspace.default.customer_powerbi
GROUP BY item_purchased
ORDER BY avg_review_rating DESC, rated_purchase_records DESC, item_purchased
LIMIT 5;

-- 6. Compare standard vs express shipping
SELECT shipping_type,
       COUNT(*) AS purchase_records,
       ROUND(AVG(purchase_amount), 2) AS avg_purchase_usd
FROM workspace.default.customer_powerbi
WHERE shipping_type IN ('Standard','Express')
GROUP BY shipping_type
ORDER BY avg_purchase_usd DESC;

-- 7. Subscriber/non-subscriber differences
SELECT subscription_status,
       COUNT(*) AS purchase_records,
       SUM(purchase_amount) AS purchase_value_usd,
       ROUND(AVG(purchase_amount), 2) AS avg_purchase_usd
FROM workspace.default.customer_powerbi
GROUP BY subscription_status;

-- 8. Discount application rate by item
WITH item_discount AS (
    SELECT item_purchased,
           COUNT(*) AS purchase_records,
           SUM(CASE WHEN LOWER(TRIM(discount_applied)) = 'yes' THEN 1 ELSE 0 END) AS discounted_records
    FROM workspace.default.customer_powerbi
    GROUP BY item_purchased
)
SELECT item_purchased,
       purchase_records,
       discounted_records,
       ROUND(100.0 * discounted_records / NULLIF(purchase_records,0), 2) AS discount_usage_pct
FROM item_discount
ORDER BY discount_usage_pct DESC, item_purchased
LIMIT 10;

-- 9. Rule-based purchase-history segments (NOT observed retention)
WITH segments AS (
    SELECT customer_id,
           CASE WHEN previous_purchases = 1 THEN 'New'
                WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
                ELSE 'Loyal'
           END AS purchase_history_segment
    FROM workspace.default.customer_powerbi
)
SELECT purchase_history_segment, COUNT(*) AS customer_count
FROM segments
GROUP BY purchase_history_segment
ORDER BY customer_count DESC;

-- 10. Top three items by purchase-record count within each category
WITH item_counts AS (
    SELECT category, item_purchased, COUNT(*) AS purchase_records
    FROM workspace.default.customer_powerbi
    GROUP BY category, item_purchased
), ranked_items AS (
    SELECT category, item_purchased, purchase_records,
           ROW_NUMBER() OVER (
               PARTITION BY category
               ORDER BY purchase_records DESC, item_purchased ASC
           ) AS item_rank
    FROM item_counts
)
SELECT category, item_purchased, purchase_records, item_rank
FROM ranked_items
WHERE item_rank <= 3
ORDER BY category, item_rank;

-- 11. Prior purchase history and subscription (associational only)
SELECT CASE WHEN previous_purchases > 5 THEN '>5 previous purchases'
            ELSE '<=5 previous purchases' END AS history_group,
       COUNT(*) AS purchase_records,
       SUM(CASE WHEN subscription_status = 'Yes' THEN 1 ELSE 0 END) AS subscribers,
       ROUND(100.0 * AVG(CASE WHEN subscription_status = 'Yes' THEN 1.0 ELSE 0.0 END), 2) AS subscription_rate_pct
FROM workspace.default.customer_powerbi
GROUP BY CASE WHEN previous_purchases > 5 THEN '>5 previous purchases'
              ELSE '<=5 previous purchases' END;

-- 12. Purchase value by age group
SELECT age_group,
       COUNT(*) AS purchase_records,
       SUM(purchase_amount) AS purchase_value_usd,
       ROUND(AVG(purchase_amount), 2) AS avg_purchase_usd
FROM workspace.default.customer_powerbi
GROUP BY age_group
ORDER BY purchase_value_usd DESC;