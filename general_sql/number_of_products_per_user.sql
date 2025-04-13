WITH total_customers AS (SELECT COUNT(DISTINCT customer) AS total
                         FROM product_sales)
SELECT number_of_products,
       COUNT(customer)                                                                AS number_of_users,
       ROUND(COUNT(customer)::numeric / (SELECT total FROM total_customers) * 100, 2) AS proportion_of_users
FROM (SELECT customer,
             COUNT(DISTINCT product_code) AS number_of_products
      FROM product_sales
      GROUP BY customer) AS t1
GROUP BY number_of_products
ORDER BY number_of_products;