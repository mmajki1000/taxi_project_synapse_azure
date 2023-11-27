use nyc_taxi_ldw

if OBJECT_ID('silver.calendar') is not NULL
drop EXTERNAL table silver.calendar
GO

CREATE EXTERNAL TABLE silver.calendar
WITH (
    DATA_SOURCE =  nyc_taxi_src,
    LOCATION = 'silver/calendar',
    FILE_FORMAT = parquet_file_format

) AS
SELECT * FROM bronze.calendar;