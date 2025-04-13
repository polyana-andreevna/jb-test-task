SELECT MAX(processed_date) - MIN(processed_date)         AS data_period_days,
       (MAX(processed_date) - MIN(processed_date)) / 365 AS data_period_years,
       MIN(processed_date)                               AS first_event_day,
       MAX(processed_date)                               AS last_event_day
FROM product_sales;