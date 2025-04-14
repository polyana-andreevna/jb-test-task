SELECT ROUND((AVG(CASE WHEN discount_in_usd > 0 THEN amount_in_usd END)::numeric), 2) AS avg_amount_with_discount,
       ROUND((AVG(CASE WHEN discount_in_usd = 0 THEN amount_in_usd END)::numeric), 2) AS avg_amount_without_discount
FROM product_sales;