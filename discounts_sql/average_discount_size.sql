SELECT product_code,
       customer_status,
       round(AVG(discount_in_usd)::numeric, 2) AS avg_discount,
       round(avg(amount_in_usd)::numeric, 2)   as avg_amount,
       round(sum(discount_in_usd)::numeric, 2) as total_discount,
       round(sum(amount_in_usd)::numeric, 2)   as total_amount
FROM product_sales
WHERE discount_in_usd > 0
  and discount_id is null
GROUP BY product_code, customer_status
ORDER BY product_code desc, avg_discount DESC;