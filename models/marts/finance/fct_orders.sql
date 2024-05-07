with orders as (

    select * from {{ ref('stg_orders') }}

), payments as (
    select * from {{ ref('stg_stripe__payments') }}
), final as (

select
    orders.order_id,
    orders.customer_id,
    payments.amt_dollars
from orders
left join payments using (order_id)
)

select * from final