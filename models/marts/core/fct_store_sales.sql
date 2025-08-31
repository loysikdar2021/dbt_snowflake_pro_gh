{{ config(
    materialized='incremental',
    unique_key=['ticket_number','item_sk'],
    incremental_strategy='merge',
    on_schema_change='sync_all_columns',
    cluster_by=['sold_date']
) }}
with base as (
  select
    i.ticket_number,
    i.item_sk,
    i.customer_sk,
    i.store_sk,
    i.sold_date,
    i.quantity,
    i.wholesale_cost,
    i.list_price,
    i.sales_price,
    i.net_paid,
    i.net_paid_inc_tax,
    i.net_profit
  from {{ ref('int_sales_enriched') }} i
  {% if is_incremental() %}
    where i.sold_date > (select coalesce(max(sold_date), to_date('1900-01-01')) from {{ this }})
  {% endif %}
)
select * from base
