
  
    

  create  table "sales_dw"."dev"."dim_geography__dbt_tmp"
  
  
    as
  
  (
    

SELECT
      id AS geography_key,
      cityname as city_name,
      countryname as country_name,
      regionname as region_name
FROM
      "sales_dw"."dev_raw"."geography"
  );
  