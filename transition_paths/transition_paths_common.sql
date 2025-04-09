-- Number of users with Upgrade
select count(distinct customer)                                             as all_customers,
       count(distinct case when license_type = 'Upgrade' then customer end) as customers_with_upgrade,
       count(case when license_type = 'Upgrade' then customer end)          as all_upgrades,
       round(count(distinct case when license_type = 'Upgrade' then customer end)::numeric / count(distinct customer) *
             100, 2)                                                        as share_customers_with_upgrade
from product_sales;