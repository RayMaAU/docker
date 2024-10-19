

SELECT
    customer_key, 
    product_key,
    channel_key,
    bought_date_key,
    geography_key,
    total_amount,
    qty,
    commissionpct,
    commissionpaid,
    product_price,
    transaction_id,
    reseller_id,
    reseller_id,
FROM
    "sales_dw"."dev"."staging_transactions"