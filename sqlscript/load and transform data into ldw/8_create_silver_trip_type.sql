use nyc_taxi_ldw

if OBJECT_ID('silver.trip_type') is not NULL
drop EXTERNAL table silver.trip_type
GO

CREATE EXTERNAL TABLE silver.trip_type
WITH (
    DATA_SOURCE =  nyc_taxi_src,
    LOCATION = 'silver/trip_type',
    FILE_FORMAT = parquet_file_format

) AS
SELECT * FROM bronze.trip_type;