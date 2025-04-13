WITH median AS (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY sales_per_customer) AS median_sales_per_user
                FROM (SELECT customer,
                             COUNT(*) AS sales_per_customer
                      FROM product_sales
                      GROUP BY customer) sales_per_customer)
SELECT COUNT(*)                                   AS number_of_sales,
       COUNT(DISTINCT customer)                   AS number_of_customers,
       COUNT(*) / COUNT(DISTINCT customer)        AS avg_sales_per_users,
       (SELECT median_sales_per_user FROM median) AS median_sales_per_user
FROM product_sales;