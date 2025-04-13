SELECT customer,
       processed_date,
       discount_in_usd,
       amount_in_usd
FROM product_sales
WHERE customer_status = 'new customer'
  AND discount_id IS NULL
  AND discount_in_usd > 0
  AND product_code = 'X';