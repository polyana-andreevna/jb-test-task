with total_customers as (select count(distinct customer) as total
                         from product_sales)
select number_of_products,
       count(customer)                                                                as number_of_users,
       round(count(customer)::numeric / (select total from total_customers) * 100, 2) as proportion_of_users
from (select customer,
             count(distinct product_code) as number_of_products
      from product_sales
      group by customer) as t1
group by number_of_products
order by number_of_products;