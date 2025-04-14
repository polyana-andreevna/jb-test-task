WITH without_discount AS (SELECT license_type,
                                    COUNT(*) AS sales_without_discount
                             FROM product_sales
                             WHERE discount_in_usd = 0
                               AND discount_id IS NULL
                             GROUP BY license_type),
     with_discount AS (SELECT license_type,
                                 COUNT(*) AS sales_with_discount
                          FROM product_sales
                          WHERE discount_in_usd > 0
                          GROUP BY license_type)
SELECT *
FROM with_discount
         LEFT JOIN without_discount USING (license_type);