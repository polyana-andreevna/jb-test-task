-- Number of users with Upgrade
SELECT COUNT(DISTINCT customer)                                             AS all_customers,
       COUNT(DISTINCT CASE WHEN license_type = 'Upgrade' THEN customer END) AS customers_with_upgrade,
       COUNT(CASE WHEN license_type = 'Upgrade' THEN customer END)          AS all_upgrades,
       ROUND(COUNT(DISTINCT CASE WHEN license_type = 'Upgrade' THEN customer END)::numeric / COUNT(DISTINCT customer) *
             100, 2)                                                        AS share_customers_with_upgrade
FROM product_sales;