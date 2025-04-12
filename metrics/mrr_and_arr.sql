WITH t1 AS (SELECT *,
                   ROUND((amount_in_usd * (- 1 / days_in_month * payment_day + (days_in_month + 1) / days_in_month) /
                          subscription_duration)::numeric, 2)                 AS first_payment,
                   ROUND((amount_in_usd / subscription_duration)::numeric, 2) AS rest_payment
            FROM (SELECT customer,
                         quantity,
                         processed_date,
                         amount_in_usd,
                         TO_CHAR(processed_date, 'DD')::numeric AS payment_day,
                         TO_CHAR(processed_date, 'MM')::numeric AS month_payment,
                         DATE_PART('days',
                                   DATE_TRUNC('month', processed_date)
                                       + INTERVAL '1 month'
                                       - INTERVAL '1 day')      AS days_in_month,
                         CASE
                             WHEN (discount_in_usd + amount_in_usd)::numeric / quantity::numeric < 35 THEN 1
                             ELSE 12
                             END                                AS subscription_duration,
                         ROW_NUMBER() OVER ()                   AS payment_id
                  FROM product_sales
                  WHERE customer IN (SELECT customer
                                     FROM product_sales
                                     WHERE customer_status = 'new customer'
                                     GROUP BY customer
                                     HAVING COUNT(*) = 1)) subscription_type),
     t2 AS (SELECT t1.*,
                   gs.index AS index,
                   CASE
                       WHEN gs.index = 0 THEN first_payment
                       WHEN gs.index = subscription_duration THEN
                           ROUND((amount_in_usd -
                                  (first_payment + (subscription_duration - 1) * rest_payment))::numeric, 2)
                       ELSE rest_payment
                       END  AS value
            FROM t1
                     CROSS JOIN LATERAL (
                SELECT GENERATE_SERIES(0, subscription_duration) AS index
                ) gs)
SELECT 'MRR'                                                                                            AS metric_name,
       TO_CHAR(TO_CHAR(processed_date, 'YYYY-MM-01')::date + (index || ' months')::INTERVAL, 'YYYY-MM') AS dt,
       SUM(value)
FROM t2
GROUP BY dt
UNION ALL
SELECT 'ARR'                                                                    AS metric_name,
       TO_CHAR((processed_date + (index || ' months')::INTERVAL)::date, 'YYYY') AS dt,
       SUM(value)                                                               AS sum
FROM t2
GROUP BY dt
ORDER BY dt;


