with t1 as (select *,
                   ROUND((amount_in_usd * (- 1 / days_in_month * payment_day + (days_in_month + 1) / days_in_month) /
                          subscription_duration)::numeric, 2)                 as first_payment,
                   ROUND((amount_in_usd / subscription_duration)::numeric, 2) as rest_payment
            from (select customer,
                         quantity,
                         processed_date,
                         amount_in_usd,
                         to_char(processed_date, 'DD')::numeric as payment_day,
                         to_char(processed_date, 'MM')::numeric as month_payment,
                         date_part('days',
                                   date_trunc('month', processed_date)
                                       + interval '1 month'
                                       - interval '1 day')      as days_in_month,
                         case
                             when (discount_in_usd + amount_in_usd)::numeric / quantity::numeric < 35 then 1
                             else 12
                             end                                as subscription_duration,
                         row_number() over ()                   as payment_id
                  from product_sales
                  where customer in (select customer
                                     from product_sales
                                     where customer_status = 'new customer'
                                     group by customer
                                     having count(*) = 1)) subscription_type)
select to_char(to_char(processed_date, 'YYYY-MM-01')::date + (index || ' months')::INTERVAL, 'YYYY-MM') as dt, -- MRR
--        to_char((processed_date + (index || ' months')::INTERVAL)::date, 'YYYY')                         as dt, -- ARR
       sum(value)                                                                                       as sum
from (select *,
             payment_id,
             payment_day,
             amount_in_usd,
             gs.generate_index as index,
             first_payment,
             CASE
                 WHEN gs.generate_index = 0 THEN first_payment
                 WHEN gs.generate_index = subscription_duration THEN
                     ROUND((amount_in_usd - (first_payment + (subscription_duration - 1) * rest_payment))::numeric, 2)
                 ELSE rest_payment
                 END           AS value
      from t1,
           LATERAL (
               SELECT generate_series(0, subscription_duration) AS generate_index
               ) gs) t2
group by dt
order by dt;


