SELECT EXTRACT(YEAR FROM processed_date)                                              AS sales_year,
       CAST(customer_status AS TEXT)                                                  AS customer_status,
       CASE WHEN discount_in_usd > 0 THEN 'With Discount' ELSE 'Without Discount' END AS discount_category,
       round(AVG(amount_in_usd)::numeric, 2)                                  AS avg_order_value
FROM product_sales
GROUP BY sales_year, customer_status, discount_category
ORDER BY sales_year, discount_category;