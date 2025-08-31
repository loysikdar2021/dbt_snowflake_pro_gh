{{ config(materialized='view') }}
select
  sr_returned_date_sk   as returned_date_sk,
  sr_item_sk            as item_sk,
  sr_customer_sk        as customer_sk,
  sr_store_sk           as store_sk,
  sr_ticket_number      as ticket_number,
  sr_return_quantity    as return_qty,
  sr_return_amt         as return_amt,
  sr_return_tax         as return_tax,
  sr_return_amt_inc_tax as return_amt_inc_tax,
  sr_net_loss           as net_loss
from {{ source('tpcds', 'STORE_RETURNS') }}
