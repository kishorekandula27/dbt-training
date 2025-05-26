select
customerid,
customername,
segment,
country,
sum(orderprofit) orderprofit
from {{ ref('stg_orders') }}
group by
customerid,
customername,
segment,
country