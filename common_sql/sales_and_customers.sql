with median as (select percentile_cont(0.5) within group (order by sales_per_customer) as median_sales_per_user
                from (select customer,
                             count(*) as sales_per_customer
                      from product_sales
                      group by customer) sales_per_customer)
select count(*)                                   as number_of_sales,
       count(distinct customer)                   as number_of_customers,
       count(*) / count(distinct customer)        as avg_sales_per_users,
       (select median_sales_per_user from median) as median_sales_per_user
from product_sales;