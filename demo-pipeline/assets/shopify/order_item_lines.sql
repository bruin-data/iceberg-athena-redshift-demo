/* @bruin
name: demo_shopify.order_item_lines
type: athena.sql
materialization:
  type: table

depends:
  - demo_raw.shopify_orders

@bruin */

SELECT
    id as order_id,
    JSON_EXTRACT_SCALAR(line_item, '$.id') as line_item_id,
    JSON_EXTRACT_SCALAR(line_item, '$.name') as line_item_name,
    CAST(JSON_EXTRACT_SCALAR(line_item, '$.quantity') AS INTEGER) as line_item_quantity,
    CAST(JSON_EXTRACT_SCALAR(line_item, '$.price') AS DECIMAL) as line_item_price
FROM raw_demo.shopify_orders
CROSS JOIN UNNEST(CAST(JSON_PARSE(line_items) AS ARRAY(JSON))) as t(line_item)
