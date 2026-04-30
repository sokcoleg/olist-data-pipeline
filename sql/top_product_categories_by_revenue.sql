-- Top 5 product categories by revenue 
SELECT p.product_category_name, SUM (o.price) AS total_revenue 
FROM fact_order_items o 
LEFT JOIN dim_products p 
ON o.product_id = p.product_id 
GROUP BY p.product_category_name 
ORDER BY total_revenue DESC 
LIMIT 5;
