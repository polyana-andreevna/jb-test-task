select max(processed_date) - min(processed_date)         as data_period_days,
       (max(processed_date) - min(processed_date)) / 365 as data_period_years,
       min(processed_date)                               as first_event_day,
       max(processed_date)                               as last_event_day
from product_sales;