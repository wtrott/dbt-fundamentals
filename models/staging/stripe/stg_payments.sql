with payments as (
    select 
    id as payment_id,
    ORDERID as order_id,
    paymentmethod as payment_method,
    status,
<<<<<<< HEAD
    {{ cents_to_dollars('amount') }} as amount,
=======
    amount / 100 as amount,
>>>>>>> f93625137f2a20d4355405f9b5c8ae854d815fbf
    created as created_at
    from {{ source('stripe', 'payment') }}
)
select * from payments