select customer,
       processed_date,
       discount_in_usd,
       amount_in_usd
from product_sales
where customer_status = 'new customer'
  and discount_id is null
  and discount_in_usd > 0
  and product_code = 'X';