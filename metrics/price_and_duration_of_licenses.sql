SELECT ROUND((discount_in_usd + amount_in_usd)::numeric / quantity, 0) AS license_cost,
       COUNT(*)                                                         AS number_of_licenses
FROM product_sales
WHERE product_code = 'X'
GROUP BY license_cost;