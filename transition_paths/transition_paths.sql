SELECT previous_product,
       upgrade_product,
       COUNT(*) AS number_of_transitions
FROM (SELECT customer,
             license_type,
             rn,
             previous_product,
             product_code AS upgrade_product
      FROM (SELECT customer,
                   license_type,
                   product_code,
                   ROW_NUMBER() OVER (PARTITION BY customer ORDER BY processed_date)      AS rn,
                   LAG(product_code) OVER (PARTITION BY customer ORDER BY processed_date) AS previous_product
            FROM product_sales
            WHERE customer IN (SELECT customer FROM product_sales WHERE license_type = 'Upgrade')) t1
      WHERE license_type = 'Upgrade') t2
WHERE previous_product IS NOT NULL
  AND NOT customer IN (SELECT customer
                       FROM (SELECT customer,
                                    license_type,
                                    ROW_NUMBER() OVER (PARTITION BY customer ORDER BY processed_date) AS rn
                             FROM product_sales
                             WHERE customer IN (SELECT customer FROM product_sales WHERE license_type = 'Upgrade')) t1
                       WHERE rn = 1
                         AND license_type = 'Upgrade')
GROUP BY previous_product, upgrade_product
ORDER BY number_of_transitions DESC
LIMIT 10;