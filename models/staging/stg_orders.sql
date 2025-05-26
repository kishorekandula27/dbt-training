select 
--raw_orders columns
ro.orderid,
ro.orderdate,
ro.shipdate,
ro.shipmode,
ro.ORDERSELLINGPRICE - ro.ORDERCOSTPRICE ORDERPROFIT,
ro.ORDERCOSTPRICE,
ro.ORDERSELLINGPRICE,
--raw_customer columns
rc.customerid,
rc.customername,
rc.segment,
rc.country,
--raw_product columns
rp.productid,
rp.category,
rp.productname,
rp.subcategory
from {{ ref('raw_orders') }} ro,{{ ref('raw_customer') }} rc,{{ ref('raw_product') }} rp
where 1 = 1
and ro.customerid = rc.customerid (+)
and ro.productid = rp.productid (+)