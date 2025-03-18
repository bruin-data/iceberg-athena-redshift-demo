/* @bruin
name: demo_shopify.customers
type: athena.sql
materialization:
  type: table

depends:
  - demo_raw.shopify_customers

@bruin */

SELECT
    id as customer_id,
    email as email,
    created_at as customer_created_at,
    updated_at as customer_updated_at,
    first_name,
    last_name,
    phone
FROM raw_demo.shopify_customers