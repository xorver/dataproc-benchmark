----- product -----
CREATE EXTERNAL TABLE product_gs_csv(product_id int, description string, product_group_id int)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION 'gs://5spoc-benchmark-data/csv/product';
CREATE EXTERNAL TABLE product_gs_orc(product_id int, description string, product_group_id int)
STORED AS ORC
LOCATION 'gs://5spoc-benchmark-data/orc/product'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"="536870912", "orc.row.index.stride"="50000");
CREATE EXTERNAL TABLE product_gs_parquet(product_id int, description string, product_group_id int)
STORED AS parquet
LOCATION 'gs://5spoc-benchmark-data/parquet/product';
CREATE EXTERNAL TABLE product_orc(product_id int, description string, product_group_id int)
STORED AS ORC
LOCATION '/orc/product'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"="536870912", "orc.row.index.stride"="50000");
CREATE EXTERNAL TABLE product_parquet(product_id int, description string, product_group_id int)
STORED AS parquet
LOCATION '/parquet/product';

----- calendar -----
CREATE EXTERNAL TABLE calendar_gs_csv(calendar_date date)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION 'gs://5spoc-benchmark-data/csv/calendar';
CREATE EXTERNAL TABLE calendar_gs_orc(calendar_date date)
STORED AS ORC
LOCATION 'gs://5spoc-benchmark-data/orc/calendar'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"="536870912", "orc.row.index.stride"="50000");
CREATE EXTERNAL TABLE calendar_gs_parquet(calendar_date date)
STORED AS parquet
LOCATION 'gs://5spoc-benchmark-data/parquet/calendar';
CREATE EXTERNAL TABLE calendar_orc(calendar_date date)
STORED AS ORC
LOCATION '/orc/calendar'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"="536870912", "orc.row.index.stride"="50000");
CREATE EXTERNAL TABLE calendar_parquet(calendar_date date)
STORED AS parquet
LOCATION '/parquet/calendar';

----- store -----
CREATE EXTERNAL TABLE store_gs_csv(store_id int, store_name string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION 'gs://5spoc-benchmark-data/csv/store';
CREATE EXTERNAL TABLE store_gs_orc(store_id int, store_name string)
STORED AS ORC
LOCATION 'gs://5spoc-benchmark-data/orc/store'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"="536870912", "orc.row.index.stride"="50000");
CREATE EXTERNAL TABLE store_gs_parquet(store_id int, store_name string)
STORED AS parquet
LOCATION 'gs://5spoc-benchmark-data/parquet/store';
CREATE EXTERNAL TABLE store_orc(store_id int, store_name string)
STORED AS ORC
LOCATION '/orc/store'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"="536870912", "orc.row.index.stride"="50000");
CREATE EXTERNAL TABLE store_parquet(store_id int, store_name string)
STORED AS parquet
LOCATION '/parquet/store';

----- daily_sales -----
CREATE EXTERNAL TABLE daily_sales_gs_csv(product_id int, store_id int, calendar_date date, sales_value int)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION 'gs://5spoc-benchmark-data/csv/daily_sales';
CREATE EXTERNAL TABLE daily_sales_gs_orc(product_id int, store_id int, calendar_date date, sales_value int)
STORED AS ORC
LOCATION 'gs://5spoc-benchmark-data/orc/daily_sales'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"="536870912", "orc.row.index.stride"="50000");
CREATE EXTERNAL TABLE daily_sales_gs_parquet(product_id int, store_id int, calendar_date date, sales_value int)
STORED AS parquet
LOCATION 'gs://5spoc-benchmark-data/parquet/daily_sales';
CREATE EXTERNAL TABLE daily_sales_orc(product_id int, store_id int, calendar_date date, sales_value int)
STORED AS ORC
LOCATION '/orc/daily_sales'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"="536870912", "orc.row.index.stride"="50000");
CREATE EXTERNAL TABLE daily_sales_parquet(product_id int, store_id int, calendar_date date, sales_value int)
STORED AS parquet
LOCATION '/parquet/daily_sales';

----- daily_waste -----
CREATE EXTERNAL TABLE daily_waste_gs_csv(product_id int, store_id int, calendar_date date, waste_value int)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION 'gs://5spoc-benchmark-data/csv/daily_waste';
CREATE EXTERNAL TABLE daily_waste_gs_orc(product_id int, store_id int, calendar_date date, waste_value int)
STORED AS ORC
LOCATION 'gs://5spoc-benchmark-data/orc/daily_waste'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"="536870912", "orc.row.index.stride"="50000");
CREATE EXTERNAL TABLE daily_waste_gs_parquet(product_id int, store_id int, calendar_date date, waste_value int)
STORED AS parquet
LOCATION 'gs://5spoc-benchmark-data/parquet/daily_waste';
CREATE EXTERNAL TABLE daily_waste_orc(product_id int, store_id int, calendar_date date, waste_value int)
STORED AS ORC
LOCATION '/orc/daily_waste'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"="536870912", "orc.row.index.stride"="50000");
CREATE EXTERNAL TABLE daily_waste_parquet(product_id int, store_id int, calendar_date date, waste_value int)
STORED AS parquet
LOCATION '/parquet/daily_waste';

----- daily_stock -----
CREATE EXTERNAL TABLE daily_stock_gs_csv(product_id int, store_id int, calendar_date date, stock_value int)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION 'gs://5spoc-benchmark-data/csv/daily_stock';
CREATE EXTERNAL TABLE daily_stock_gs_orc(product_id int, store_id int, calendar_date date, stock_value int)
STORED AS ORC
LOCATION 'gs://5spoc-benchmark-data/orc/daily_stock'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"="536870912", "orc.row.index.stride"="50000");
CREATE EXTERNAL TABLE daily_stock_gs_parquet(product_id int, store_id int, calendar_date date, stock_value int)
STORED AS parquet
LOCATION 'gs://5spoc-benchmark-data/parquet/daily_stock';
CREATE EXTERNAL TABLE daily_stock_orc(product_id int, store_id int, calendar_date date, stock_value int)
STORED AS ORC
LOCATION '/orc/daily_stock'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"="536870912", "orc.row.index.stride"="50000");
CREATE EXTERNAL TABLE daily_stock_parquet( product_id int, store_id int, calendar_date date, stock_value int)
STORED AS parquet
LOCATION '/parquet/daily_stock';