
      
  
    

  create  table "sales_dw"."dev"."staging_transactions_resellers_xml"
  
  
    as
  
  (
    

WITH 



trans_xml AS (
  SELECT
    md5(cast(coalesce(cast(reseller_id as TEXT), '') || '-' || coalesce(cast(transaction_id as TEXT), '') as TEXT)) AS customer_key,
    reseller_id,
    transaction_id,
    product_name,
    total_amount,
    no_purchased_postcards,
    date_bought,
    sales_channel,
    office_location,
    loaded_timestamp
  FROM
    "sales_dw"."staging"."resellerxmlextracted"


  

)
SELECT
  t.customer_key,
  transaction_id,
  e.product_key,
  C.channel_key,
  t.reseller_id,
  to_char(
    date_bought,
    'YYYYMMDD'
  ) :: INT AS bought_date_key,
  total_amount::numeric,
  no_purchased_postcards,
  e.product_price::numeric,
  e.geography_key,
  s.commission_pct * total_amount::numeric AS commisionpaid,
  s.commission_pct,
  loaded_timestamp
FROM
  trans_xml t
  JOIN "sales_dw"."dev"."dim_product"
  e
  ON t.product_name = e.product_name
  JOIN "sales_dw"."dev"."dim_channel" C
  ON t.sales_channel = C.channel_name
  JOIN "sales_dw"."dev"."dim_customer"
  cu
  ON t.customer_key = cu.customer_key
  JOIN "sales_dw"."dev"."dim_salesagent"
  s
  ON t.reseller_id = s.original_reseller_id
  );
  
  