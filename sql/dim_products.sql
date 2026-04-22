CREATE TABLE dim_products
WITH (
    format = 'PARQUET',
    external_location = 's3://your-bucket/analytics/olist/dim_products/'
) AS 

SELECT 
    product_id,
    product_category_name
FROM curated_olist_products
