with stg_tpch_lineitem as (
    select
    {{
        dbt_utils.generate_surrogate_key([
            'l_orderkey',
            'l_linenumber',
            'l_partkey ',
            'l_suppkey',
            'l_commitdate'
        ])
    }} as line_item_key,
    l_orderkey as order_key,
    l_partkey as part_key,
    l_suppkey as supp_key, 
    l_linenumber as line_number,
    l_quantity as quantity,
    l_extendedprice as extended_price,
    l_discount as discount_percentage,
    l_tax as tax_rate,
    l_commitdate as commit_date,
    l_receiptdate as receipt_date

    from {{ source('tpch', 'lineitem') }}
)

select * from stg_tpch_lineitem





