/* @bruin
name: demo_shopify.orders
type: athena.sql
materialization:
  type: table

depends:
  - demo_raw.shopify_orders

@bruin */

SELECT
    id as order_id,
    created_at as order_created_at,
    cast(JSON_EXTRACT_SCALAR(customer, '$.id') as bigint) as customer_id,
    total_price,
    total_tax,
    total_discounts,
    total_line_items_price
FROM raw_demo.shopify_orders
