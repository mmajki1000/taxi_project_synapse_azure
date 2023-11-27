USE nyc_taxi_ldw;

if OBJECT_ID('silver.payment_type') is not NULL
drop EXTERNAL table silver.payment_type
GO

CREATE EXTERNAL TABLE silver.payment_type
WITH (
    DATA_SOURCE =  nyc_taxi_src,
    LOCATION = 'silver/payment_type',
    FILE_FORMAT = parquet_file_format

) AS
SELECT * FROM bronze.vw_payment_type;