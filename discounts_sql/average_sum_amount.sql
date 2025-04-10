SELECT round((AVG(CASE WHEN discount_in_usd > 0 THEN amount_in_usd END)::numeric), 2) AS avg_amount_discounted,
       round((AVG(CASE WHEN discount_in_usd = 0 THEN amount_in_usd END)::numeric), 2) AS avg_amount_non_discounted
FROM product_sales;