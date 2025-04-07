select product_code,
       count(*)                 as number_of_sales,
       count(distinct customer) as number_of_customers
from product_sales
group by product_code
order by number_of_sales desc;