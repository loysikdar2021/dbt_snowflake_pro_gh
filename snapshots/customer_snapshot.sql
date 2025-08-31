{% snapshot customer_snapshot %}

{{
  config(
    target_database=target.database,
    target_schema=target.schema ~ '__snap',
    unique_key='customer_sk',
    strategy='check',
    check_cols=['first_name','last_name','email','birth_country']
  )
}}

select
  customer_sk,
  customer_id,
  first_name,
  last_name,
  email,
  birth_country
from {{ ref('stg_customer') }}

{% endsnapshot %}
