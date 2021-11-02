select 
order_number, 
sum(amount) total_amount
from {{ ref('stg_payments') }}
group by 1
having not(total_amount>=0)