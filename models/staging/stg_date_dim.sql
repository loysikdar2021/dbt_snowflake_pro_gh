{{ config(materialized='view') }}
select
  d_date_sk     as date_sk,
  to_date(d_date) as date,
  d_year        as year,
  d_moy         as month_of_year,
  d_dow         as day_of_week,
  d_qoy         as quarter_of_year,
  d_week_seq    as week_seq
from {{ source('tpcds', 'DATE_DIM') }}
where d_date is not null
