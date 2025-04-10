select discount_id,
       count(distinct product_code)                                                        as number_of_products,
       round(avg((discount_in_usd / (discount_in_usd + amount_in_usd))::numeric * 100), 0) as avg_discount_percentage
from product_sales
where discount_id is not null
group by discount_id
order by number_of_products desc;