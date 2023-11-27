use nyc_taxi_ldw
GO

CREATE OR ALTER PROCEDURE silver.usp_silver_payment_type
AS
BEGIN
    if OBJECT_ID('silver.payment_type') is not NULL
        drop EXTERNAL table silver.payment_type


    CREATE EXTERNAL TABLE silver.payment_type
        WITH (
            DATA_SOURCE =  nyc_taxi_src,
            LOCATION = 'silver/payment_type',
            FILE_FORMAT = parquet_file_format
        )       
    AS
    SELECT * FROM bronze.vw_payment_type;

END;