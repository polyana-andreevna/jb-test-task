SELECT COUNT(DISTINCT CASE WHEN discount_in_usd > 0 THEN product_code END)    AS discounted_product,
       COUNT(DISTINCT product_code)                                           AS all_product,
       COUNT(DISTINCT CASE WHEN discount_in_usd > 0 THEN license_type END)    AS discounted_license_type,
       COUNT(DISTINCT license_type)                                           AS all_license_type,
       COUNT(DISTINCT CASE WHEN discount_in_usd > 0 THEN customer_status END) AS discounted_customer_status,
       COUNT(DISTINCT customer_status)                                        AS all_customer_status
FROM product_sales;