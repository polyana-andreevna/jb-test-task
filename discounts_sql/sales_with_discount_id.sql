SELECT COUNT(discount_id)                                     AS sales_with_discount_id,
       COUNT(*)                                               AS all_sales_with_discount,
       ROUND(COUNT(discount_id)::numeric / COUNT(*) * 100, 2) AS share_of_sales_with_discount_id
FROM product_sales
WHERE discount_in_usd > 0;