with payment as (
    
    select 
        id as payment_id,
        orderid as order_number,
        paymentmethod as pay_method,
        status,
        amount / 100 as amount, 
        created
    from {{ source('stripe', 'payment') }}
)

select * from payment