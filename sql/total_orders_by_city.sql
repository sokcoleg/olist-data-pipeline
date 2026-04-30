-- Top 5 cities by total delivered orders 
SELECT c.customer_city , COUNT(DISTINCT o.order_id) as total_orders 
FROM fact_order_items o  
LEFT JOIN dim_customers c 
ON o.customer_id = c.customer_id  
WHERE o.order_status = 'delivered' 
GROUP BY c.customer_city 
ORDER BY total_orders DESC 
LIMIT 5;
