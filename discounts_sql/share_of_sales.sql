SELECT round(COUNT(CASE WHEN discount_in_usd > 0 THEN 1 END) * 100.0 / COUNT(*), 2) AS discount_usage_rate
FROM product_sales;