-- Top 5 cities by average order value 
SELECT t.customer_city, AVG(t.order_total) AS avg_check 
FROM ( 
     SELECT 
         o.order_id, 
         c.customer_city, 
         SUM(o.price) AS order_total 
     FROM fact_order_items o 
     LEFT JOIN dim_customers c 
         ON o.customer_id = c.customer_id 
     LEFT JOIN dim_products p 
         ON o.product_id = p.product_id 
     WHERE p.product_category_name = 'eletronicos'
     GROUP BY 
         o.order_id,
         c.customer_city 
    ) t 
GROUP BY t.customer_city 
ORDER BY avg_check DESC 
LIMIT 3;
