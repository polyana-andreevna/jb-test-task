select product_code,
       count(distinct discount_id) as number_of_promotions_with_product
from product_sales
where discount_id is not null
group by product_code
order by number_of_promotions_with_product desc;