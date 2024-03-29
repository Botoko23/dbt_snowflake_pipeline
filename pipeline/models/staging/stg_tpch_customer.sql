{{ config(
    materialized='ephemeral'
) }}


with stg_tpch_customer as (
    select
    c_custkey as customer_key,
    c_name as customer_name,
    n_name as nation
    
    from {{ source('tpch', 'customer') }} as c 
    join {{ source('tpch', 'nation') }} as n
    on c.c_nationkey = n.n_nationkey 

)


select * from stg_tpch_customer