select
  store_sk,
  store_id,
  state,
  city,
  zip,
  gmt_offset
from {{ ref('stg_store') }}
