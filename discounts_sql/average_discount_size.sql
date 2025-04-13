SELECT product_code,
       customer_status,
       ROUND(AVG(discount_in_usd)::numeric, 2) AS avg_discount,
       ROUND(AVG(amount_in_usd)::numeric, 2)   AS avg_amount,
       ROUND(SUM(discount_in_usd)::numeric, 2) AS total_discount,
       ROUND(SUM(amount_in_usd)::numeric, 2)   AS total_amount
FROM product_sales
WHERE discount_in_usd > 0
  AND discount_id IS NULL
GROUP BY product_code, customer_status
ORDER BY product_code DESC, avg_discount DESC;