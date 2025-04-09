select count(discount_id)                                     as sales_with_discount_id,
       count(*)                                               as all_sales_with_discount,
       round(count(discount_id)::numeric / count(*) * 100, 2) as share_of_sales_with_discount_id
from product_sales
where discount_in_usd > 0;