{{ config(
    materialized='incremental',
    unique_key=['ticket_number','item_sk'],
    incremental_strategy='merge',
    on_schema_change='sync_all_columns',
    cluster_by=['return_date']
) }}
with base as (
  select
    sr.ticket_number,
    sr.item_sk,
    sr.customer_sk,
    sr.store_sk,
    dd.date as return_date,
    sr.return_qty,
    sr.return_amt,
    sr.return_tax,
    sr.return_amt_inc_tax,
    sr.net_loss
  from {{ ref('stg_store_returns') }} sr
  left join {{ ref('stg_date_dim') }} dd
    on sr.returned_date_sk = dd.date_sk
  where dd.date is not null
  {% if is_incremental() %}
    and dd.date > (select coalesce(max(return_date), to_date('1900-01-01')) from {{ this }})
  {% endif %}
)
select * from base
