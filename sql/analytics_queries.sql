-- Top 3 cities  by revenue for delivered orders 
SELECT c.customer_city, SUM(o.price) AS total_revenue
FROM fact_order_items o 
LEFT JOIN dim_customers c 
ON o.customer_id = c.customer_id 
WHERE o.order_status = 'delivered' 
GROUP BY c.customer_city
ORDER BY total_revenue DESC
LIMIT 3;


-- Top 5 cities by total customers 
SELECT c.customer_city, COUNT(DISTINCT c.customer_unique_id) AS clients_for_city 
FROM dim_customers c
GROUP BY c.customer_city  
ORDER BY clients_for_city DESC 
LIMIT 5;


-- Top 5 cities by total delivered orders 
SELECT c.customer_city , COUNT(DISTINCT o.order_id) as total_orders 
FROM fact_order_items o  
LEFT JOIN dim_customers c 
ON o.customer_id = c.customer_id  
WHERE o.order_status = 'delivered' 
GROUP BY c.customer_city 
ORDER BY total_orders DESC 
LIMIT 5;


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


-- Top 5 product categories by revenue 
SELECT p.product_category_name, SUM (o.price) AS total_revenue 
FROM fact_order_items o 
LEFT JOIN dim_products p 
ON o.product_id = p.product_id 
GROUP BY p.product_category_name 
ORDER BY total_revenue DESC 
LIMIT 5;

