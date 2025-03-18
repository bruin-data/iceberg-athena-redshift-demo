/* @bruin
name: demo_mart.shopify_order_lines
type: rs.sql
materialization:
  type: table

depends:
  - demo_shopify.customers
  - demo_shopify.orders
  - demo_shopify.order_item_lines

@bruin */

select *
from demo_shopify.orders
join demo_shopify.customers
  using(customer_id)
left join demo_shopify.order_item_lines
  using(order_id)


