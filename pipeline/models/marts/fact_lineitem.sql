select
    line_item.*,
    {{ discounted_amount('extended_price', 'discount_percentage') }} as item_discount_amount,
    case 
        when commit_date >= receipt_date then 'on time'
        else 'late delivery'
    end as devilvery_status

from {{ ref('stg_tpch_lineitem') }} as line_item

