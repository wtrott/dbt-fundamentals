with payments as (
    select 
    id as payment_id,
    ORDERID as order_id,
    paymentmethod as payment_method,
    status,
    {{ cents_to_dollars('amount') }} as amount,
    created as created_at
    from {{ source('stripe', 'payment') }}
)
select * from payments