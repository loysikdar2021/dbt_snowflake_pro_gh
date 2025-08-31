{{ config(materialized='view') }}

select
  ss_sold_date_sk       as sold_date_sk,
  ss_item_sk            as item_sk,
  ss_customer_sk        as customer_sk,
  ss_store_sk           as store_sk,
  ss_ticket_number      as ticket_number,
  ss_quantity           as quantity,
  ss_wholesale_cost     as wholesale_cost,
  ss_list_price         as list_price,
  ss_sales_price        as sales_price,
  ss_net_paid           as net_paid,
  ss_net_paid_inc_tax   as net_paid_inc_tax,
  ss_net_profit         as net_profit
from {{ source('tpcds', 'STORE_SALES') }}
