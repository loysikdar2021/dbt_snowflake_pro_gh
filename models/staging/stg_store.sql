{{ config(materialized='view') }}
select
  s_store_sk  as store_sk,
  s_store_id  as store_id,
  s_state     as state,
  s_city      as city,
  s_zip       as zip,
  s_gmt_offset as gmt_offset
from {{ source('tpcds', 'STORE') }}
