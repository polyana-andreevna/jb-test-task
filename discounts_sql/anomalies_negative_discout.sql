select customer,
       processed_date,
       amount_in_usd,
       discount_in_usd
from product_sales
where discount_in_usd < 0
order by discount_in_usd;