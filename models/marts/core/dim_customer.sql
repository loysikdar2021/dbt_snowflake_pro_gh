select
  customer_sk,
  customer_id,
  first_name,
  last_name,
  email,
  birth_country
from {{ ref('stg_customer') }}
