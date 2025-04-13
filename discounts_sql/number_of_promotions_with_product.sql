SELECT product_code,
       COUNT(DISTINCT discount_id) AS number_of_promotions_with_product
FROM product_sales
WHERE discount_id IS NOT NULL
GROUP BY product_code
ORDER BY number_of_promotions_with_product DESC;