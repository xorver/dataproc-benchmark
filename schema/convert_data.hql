INSERT INTO TABLE product_gs_orc
      SELECT * FROM product_gs_csv;
INSERT INTO TABLE product_gs_parquet
      SELECT * FROM product_gs_csv;

INSERT INTO TABLE calendar_gs_orc
      SELECT * FROM calendar_gs_csv;
INSERT INTO TABLE calendar_gs_parquet
      SELECT * FROM calendar_gs_csv;

INSERT INTO TABLE store_gs_orc
      SELECT * FROM store_gs_csv;
INSERT INTO TABLE store_gs_parquet
      SELECT * FROM store_gs_csv;

INSERT INTO TABLE daily_sales_gs_orc
      SELECT * FROM daily_sales_gs_csv;
INSERT INTO TABLE daily_sales_gs_parquet
      SELECT * FROM daily_sales_gs_csv;

INSERT INTO TABLE daily_waste_gs_orc
      SELECT * FROM daily_waste_gs_csv;
INSERT INTO TABLE daily_waste_gs_parquet
      SELECT * FROM daily_waste_gs_csv;

INSERT INTO TABLE daily_stock_gs_orc
      SELECT * FROM daily_stock_gs_csv;
INSERT INTO TABLE daily_stock_gs_parquet
      SELECT * FROM daily_stock_gs_csv;
