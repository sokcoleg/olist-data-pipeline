CREATE TABLE fact_order_items
WITH (
    format = 'PARQUET',
    external_location = 's3://your_bucket/analytics/olist/fact_order_items/'
) AS

SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_year,
    o.order_month,

    oi.order_item_id,
    oi.product_id,
    oi.seller_id,
    oi.price,
    oi.freight_value

FROM curated_olist_orders o
INNER JOIN curated_olist_order_items oi
    ON o.order_id = oi.order_id
