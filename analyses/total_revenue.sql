with payments as (
    select * from {{ ref('stg_stripe__payments') }}
)
select
    sum(case when status = 'success' then amt_dollars else 0 end) as total_revenue
from payments