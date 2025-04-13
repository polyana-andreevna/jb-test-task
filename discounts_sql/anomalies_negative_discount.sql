SELECT customer,
       processed_date,
       amount_in_usd,
       discount_in_usd
FROM product_sales
WHERE discount_in_usd < 0
ORDER BY discount_in_usd;