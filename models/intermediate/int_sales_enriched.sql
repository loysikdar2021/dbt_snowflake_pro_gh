{{ config(materialized='view') }}
select
  ss.ticket_number,
  ss.item_sk,
  ss.customer_sk,
  ss.store_sk,
  dd.date           as sold_date,
  ss.quantity,
  ss.wholesale_cost,
  ss.list_price,
  ss.sales_price,
  ss.net_paid,
  ss.net_paid_inc_tax,
  ss.net_profit
from {{ ref('stg_store_sales') }} ss
left join {{ ref('stg_date_dim') }} dd
  on ss.sold_date_sk = dd.date_sk
where dd.date is not null
