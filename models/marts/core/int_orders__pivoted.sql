{%- set payment_methods = ['bank_transfer','gift_card','credit_card','coupon'] -%}

with payments as (
select * from {{ ref('stg_payments') }}
),

pivoted as (
    select 
        order_number,
        {% for i in payment_methods -%}
            sum(case when pay_method='{{ i }}' then amount else 0 end) as {{ i }}_amt
        {%- if not loop.last -%},{%- endif %}
        {% endfor -%}

    from payments
    where status='success'
    group by 1
)

select * from pivoted

