CREATE TABLE dim_customers
WITH ( 
    format = 'PARQUET',
    external_location = 's3://your-bucket/analytics/olist/dim_customers'
) AS 

SELECT 
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state
FROM curated_olist_customers
