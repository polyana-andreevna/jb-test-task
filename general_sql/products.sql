SELECT product_code,
       COUNT(*)                 AS number_of_sales,
       COUNT(DISTINCT customer) AS number_of_customers
FROM product_sales
GROUP BY product_code
ORDER BY number_of_sales DESC;