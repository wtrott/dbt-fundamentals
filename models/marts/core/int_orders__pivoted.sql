{%- set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] -%}

with payments as (
    select * from {{ref('stg_payments')}}
),
pivoted as (
    select 
        order_id,
        {% for method in payment_methods -%}
        sum(case when payment_method = '{{ method }}' then amount else 0 end) as {{ method }}_amount
        {%- if not loop.last -%}
        ,
        {%- endif %}
        {% endfor -%}
    
    from payments
    where status = 'success'
    group by 1
)
select * from pivoted