use nyc_taxi_ldw

if OBJECT_ID('silver.vendor') is not NULL
drop EXTERNAL table silver.vendor
GO

CREATE EXTERNAL TABLE silver.vendor
WITH (
    DATA_SOURCE =  nyc_taxi_src,
    LOCATION = 'silver/vendor',
    FILE_FORMAT = parquet_file_format

) AS
SELECT * FROM bronze.vendor;