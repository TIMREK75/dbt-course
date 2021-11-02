    select
        customers.customer_id,
        orders.order_id,
        case when orders.status = 'completed' then payments.amount else 0 end as amount

    from {{ ref('stg_payments') }} as payments
    inner join {{ ref('stg_orders') }} as orders on (payments.order_number=orders.order_id)
    inner join {{ ref('stg_customers')}} as customers on (orders.customer_id=customers.customer_id)

