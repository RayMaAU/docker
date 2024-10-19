
  
    

  create  table "sales_dw"."dev"."dim_product__dbt_tmp"
  
  
    as
  
  (
    


select product_id as product_key, product_id as original_product_id, product_name, geography_key , product_price


FROM "sales_dw"."dev"."staging_product"
  );
  