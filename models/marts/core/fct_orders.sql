with customers as (

    select * from {{ ref('stg_customers')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),

final as (

    select
        customers.customer_id,
        orders.order_id,
        case when orders.status = 'completed' then payments.amount else 0 end as amount

    from payments
    inner join orders on (payments.order_number=orders.order_id)
    inner join customers on (orders.customer_id=customers.customer_id)

)

select * from final