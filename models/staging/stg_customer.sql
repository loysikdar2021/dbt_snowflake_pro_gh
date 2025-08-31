{{ config(materialized='view') }}
select
  c_customer_sk      as customer_sk,
  c_customer_id      as customer_id,
  c_first_name       as first_name,
  c_last_name        as last_name,
  c_birth_country    as birth_country,
  c_email_address    as email,
  c_current_cdemo_sk as current_cdemo_sk,
  c_current_hdemo_sk as current_hdemo_sk,
  c_current_addr_sk  as current_addr_sk
from {{ source('tpcds', 'CUSTOMER') }}
