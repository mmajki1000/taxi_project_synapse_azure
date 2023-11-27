USE nyc_taxi_ldw;

if OBJECT_ID('silver.rate_code') is not NULL
drop EXTERNAL table silver.rate_code
GO

CREATE EXTERNAL TABLE silver.rate_code
WITH (
    DATA_SOURCE =  nyc_taxi_src,
    LOCATION = 'silver/rate_code',
    FILE_FORMAT = parquet_file_format

) AS
SELECT * FROM bronze.vw_rate_code;