select order_key, nation, sum(total_price) over(partition by nation) 
from {{ ref('dim_orders') }}
