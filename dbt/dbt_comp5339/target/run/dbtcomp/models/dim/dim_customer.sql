
  
    

  create  table "sales_dw"."dev"."dim_customer__dbt_tmp"
  
  
    as
  
  (
    

select  customer_key,customer_first_name, customer_last_name, customer_email, sales_agent_key
from "sales_dw"."dev"."staging_customers"
  );
  