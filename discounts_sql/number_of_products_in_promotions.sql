SELECT discount_id,
       COUNT(DISTINCT product_code)                                                        AS number_of_products,
       ROUND(AVG((discount_in_usd / (discount_in_usd + amount_in_usd))::numeric * 100), 0) AS avg_discount_percentage
FROM product_sales
WHERE discount_id IS NOT NULL
GROUP BY discount_id
ORDER BY number_of_products DESC;