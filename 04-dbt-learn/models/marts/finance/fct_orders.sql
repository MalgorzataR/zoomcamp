with customers as (

    select * from {{ ref('stg_jaffle_shop__customers') }}

),

orders as (

    select * from {{ ref('stg_jaffle_shop__orders') }}

),

payment as (

    select * from {{ ref('stg_stripe__payments') }}

),

customer_orders as (

    select
        customers.customer_id,
        orders.order_id
    from customers
    left join orders using (customer_id)
),

final as (

    select
        customer_orders.customer_id,
        customer_orders.order_id,
        payment.amount
    from customer_orders
    left join payment using (order_id)

)

select * from final
