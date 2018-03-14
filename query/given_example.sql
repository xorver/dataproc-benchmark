select
    Coalesce(Sales.product_id, Waste.product_id, Stock.product_id) as product_id,
    Coalesce(Sales.description, Waste.description, Stock.description) as description,
    Coalesce(Sales.store_id, Waste.store_id, Stock.store_id) as store_id,
    Coalesce(Sales.store_name, Waste.store_name, Stock.store_name) as store_name,
    Coalesce(Sales.calendar_date, Waste.calendar_date, Stock.calendar_date) as calendar_date,
    SUM(Sales.sales_value) as sales_value,
    SUM(Waste.waste_value) as waste_value,
    SUM(Stock.stock_value) as stock_value
from
(
    Select prd.product_id, prd.description, str.store_id, str.store_name, cal.calendar_date, sum(dss.sales_value) as sales_value
    from daily_sales_parquet as dss
    inner join product_parquet as prd
    on prd.product_id = dss.product_id
    inner join store_parquet as str
    on str.store_id = dss.store_id
    inner join calendar_parquet as cal
    on cal.calendar_date = dss.calendar_date
    where str.store_id = 2 and prd.product_group_id = 3 and cal.calendar_date >= DATE '2018-01-01'
    group by 1,2,3,4,5
) as Sales
full outer join
(
    Select prd.product_id, prd.description, str.store_id, str.store_name, cal.calendar_date, SUM(dwt.waste_value) as waste_value
    from daily_waste_parquet as dwt
    inner join product_parquet as prd
    on prd.product_id = dwt.product_id
    inner join store_parquet as str
    on str.store_id = dwt.store_id
    inner join calendar_parquet as cal
    on cal.calendar_date = dwt.calendar_date
    where str.store_id = 2 and prd.product_group_id = 3 and cal.calendar_date >= DATE '2018-01-01'
    group by 1,2,3,4,5
) as Waste
on Sales.product_id = Waste.product_id
and Sales.store_id = Waste.store_id
and Sales.calendar_date = Waste.calendar_date
full outer join
(
    Select prd.product_id, prd.description, str.store_id, str.store_name, cal.calendar_date, SUM(dst.stock_value) as stock_value
    from daily_stock_parquet as dst
    inner join product_parquet as prd
    on prd.product_id = dst.product_id
    inner join store_parquet as str
    on str.store_id = dst.store_id
    inner join calendar_parquet as cal
    on cal.calendar_date = dst.calendar_date
    where str.store_id = 2 and prd.product_group_id = 3 and cal.calendar_date = DATE '2018-02-14'
    group by 1,2,3,4,5
) as Stock
on Sales.product_id = Stock.product_id
and Sales.store_id = Stock.store_id
and Sales.calendar_date = Stock.calendar_date
group by 1,2,3,4,5



