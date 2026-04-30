-- Top 3 cities  by revenue for delivered orders 
SELECT c.customer_city, SUM(o.price) AS total_revenue
FROM fact_order_items o 
LEFT JOIN dim_customers c 
ON o.customer_id = c.customer_id 
WHERE o.order_status = 'delivered' 
GROUP BY c.customer_city
ORDER BY total_revenue DESC
LIMIT 3;
