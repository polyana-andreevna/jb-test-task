SELECT TO_CHAR(processed_date, 'YYYY-MM-DD') AS dt,
       SUM(discount_in_usd)                  AS sum_discount,
       SUM(amount_in_usd)                    AS sum_amount
FROM product_sales
WHERE processed_date BETWEEN '2018-07-15' and '2018-08-15'
GROUP BY processed_date
ORDER BY processed_date;