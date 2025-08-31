select
  s.sold_date,
  count(distinct s.ticket_number)            as orders,
  sum(s.quantity)                            as units_sold,
  sum(s.net_paid)                            as net_paid,
  sum(s.net_paid_inc_tax)                    as net_paid_inc_tax,
  sum(s.net_profit)                          as net_profit,
  coalesce(sum(r.return_amt), 0)             as returns_amt,
  (sum(s.net_paid) - coalesce(sum(r.return_amt),0)) as net_revenue_after_returns
from {{ ref('fct_store_sales') }} s
left join {{ ref('fct_store_returns') }} r
  on r.ticket_number = s.ticket_number
  and r.item_sk = s.item_sk
  and r.return_date = s.sold_date
group by 1
