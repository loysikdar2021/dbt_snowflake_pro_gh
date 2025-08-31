{{ config(materialized='view') }}
select
  s_sold_date_sk       as sold_date_sk,
  s_item_sk            as item_sk,
  s_customer_sk        as customer_sk,
  s_store_sk           as store_sk,
  s_ticket_number      as ticket_number,
  s_quantity           as quantity,
  s_wholesale_cost     as wholesale_cost,
  s_list_price         as list_price,
  s_sales_price        as sales_price,
  s_net_paid           as net_paid,
  s_net_paid_inc_tax   as net_paid_inc_tax,
  s_net_profit         as net_profit
from {{ source('tpcds', 'STORE_SALES') }}
