with orders as (
    
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from {{ source('jaffle_shop', 'orders') }}
)

select * from orders
{% if target.name == 'default' -%}
    where _etl_loaded_at >= dateadd('day', -3, current_timestamp)
{% endif -%}