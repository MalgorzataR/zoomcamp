{# {%- set my_animal = ['cat', 'dog'] -%}


{%- for animal in my_animal -%}
    {{animal}}
{%-endfor-%} #}



with payments as (

    select * from {{ ref('stg_stripe__payments') }}
    where status = 'success'

),

pivoted as (
    select order_id
    {% set payment_method = ['bank_transfer', 'coupon',  'gift_card', 'credit_card']%}
    {% for method in payment_method %}
    sum (case when payment_method = '{{method}}' then  amount else 0 end) as {{method}}_payment
    {%if not loop.last %}, {%endif%}
    {% endfor %}

from payments
group by 1
)

select * from pivoted

