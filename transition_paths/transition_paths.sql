select previous_product,
       upgrade_product,
       count(*) as number_of_transitions
from (select customer,
             license_type,
             rn,
             previous_product,
             product_code as upgrade_product
      from (select customer,
                   license_type,
                   product_code,
                   row_number() over (partition by customer order by processed_date)      as rn,
                   lag(product_code) over (partition by customer order by processed_date) as previous_product
            from product_sales
            where customer in (select customer from product_sales where license_type = 'Upgrade')) t1
      where license_type = 'Upgrade') t2
where previous_product is not null
group by previous_product, upgrade_product
order by number_of_transitions desc
limit 10;