with orders
as
(select * from {{ ref('raw_orders') }} )
select
orderid,
sum(ordersellingprice) order_sp
from orders
group by
orderid
having order_sp <=0
