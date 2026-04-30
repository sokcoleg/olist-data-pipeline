-- Top 5 cities by total customers 
SELECT c.customer_city, COUNT(DISTINCT c.customer_unique_id) AS clients_for_city 
FROM dim_customers c
GROUP BY c.customer_city  
ORDER BY clients_for_city DESC 
LIMIT 5;
