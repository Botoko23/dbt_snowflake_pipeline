with stg_tpch_order as (
    select
    order_key,
    o.customer_key,
    status_code,
    total_price,
    order_date,
    customer_name,
    nation
    
    from {{ ref('stg_tpch_order') }}  as o
    join {{ ref('stg_tpch_customer') }} as c
    on o.customer_key = c.customer_key
)


select * from stg_tpch_order
