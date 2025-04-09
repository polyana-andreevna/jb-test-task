select count(distinct case when discount_in_usd > 0 then product_code end)          as discounted_product,
       count(distinct product_code)                                                 as all_product,
       count(distinct case when discount_in_usd > 0 then license_type end)          as discounted_license_type,
       count(distinct license_type)                                                 as all_license_type,
       count(distinct case when discount_in_usd > 0 then customer_status end)       as discounted_customer_status,
       count(distinct customer_status)                                              as all_customer_status
from product_sales;