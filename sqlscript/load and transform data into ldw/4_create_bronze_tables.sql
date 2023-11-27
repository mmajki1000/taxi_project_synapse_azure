USE nyc_taxi_ldw;

IF OBJECT_ID('bronze.taxi_zone') IS NOT NULL
DROP EXTERNAL TABLE bronze.taxi_zone

CREATE EXTERNAL TABLE bronze.taxi_zone
    (   location_id SMALLINT ,
        borough VARCHAR(15),
        zone VARCHAR(50),
        service_zone VARCHAR(15)  )
    WITH (
        LOCATION = 'raw/taxi_zone.csv',
        DATA_SOURCE = nyc_taxi_src,
        FILE_FORMAT = csv_file_format_pv1,
        REJECT_VALUE = 10,
        REJECTED_ROW_LOCATION = 'rejections/taxi_zone'
    );

IF OBJECT_ID('bronze.calendar') IS NOT NULL
DROP EXTERNAL TABLE bronze.calendar;

CREATE EXTERNAL TABLE bronze.calendar
    (   date_key varchar(10),
        date VARCHAR(20),
        year SMALLINT,
        month TINYINT,
        day TINYINT,
        day_name VARCHAR(10),
        day_of_year SMALLINT,
        week_of_month TINYINT,
        week_of_year TINYINT,
        month_name VARCHAR(10),
        year_month INT,
        year_week INT
    )
    WITH (
        LOCATION = 'raw/calendar.csv',
        DATA_SOURCE = nyc_taxi_src,
        FILE_FORMAT = csv_file_format_pv1,
        REJECT_VALUE = 10,
        REJECTED_ROW_LOCATION = 'rejections/calendar'
    );



 IF OBJECT_ID('bronze.vendor') IS NOT NULL
DROP EXTERNAL TABLE bronze.vendor

CREATE EXTERNAL TABLE bronze.vendor
    (   vendor_id INT,
        vendor_name VARCHAR(50)
    )
    WITH (
        LOCATION = 'raw/vendor.csv',
        DATA_SOURCE = nyc_taxi_src,
        FILE_FORMAT = csv_file_format_pv1,
        REJECT_VALUE = 10,
        REJECTED_ROW_LOCATION = 'rejections/vendor'
    );

 IF OBJECT_ID('bronze.trip_type') IS NOT NULL
DROP EXTERNAL TABLE bronze.trip_type

CREATE EXTERNAL TABLE bronze.trip_type
    (   trip_type TINYINT,
        trip_desc VARCHAR(50)
    )
    WITH (
        LOCATION = 'raw/trip_type.tsv',
        DATA_SOURCE = nyc_taxi_src,
        FILE_FORMAT = tsv_file_format_pv1,
        REJECT_VALUE = 10,
        REJECTED_ROW_LOCATION = 'rejections/trip_type'
    );

 IF OBJECT_ID('bronze.trip_data_green') IS NOT NULL
DROP EXTERNAL TABLE bronze.trip_data_green

CREATE EXTERNAL TABLE bronze.trip_data_green
    (   VendorID INT,
        lpep_pickup_datetime datetime2(7),
        lpep_dropoff_datetime datetime2(7),
        store_and_fwd_flag CHAR(1),
        RatecodeID INT,
        PULocationID INT,
        DOLocationID INT,
        passenger_count INT,
        trip_distance FLOAT,
        fare_amount FLOAT,
        extra FLOAT,
        mta_tax FLOAT,
        tip_amount FLOAT,
        tolls_amount FLOAT,
        ehail_fee INT,
        improvement_surcharge FLOAT,
        total_amount FLOAT,
        payment_type INT,
        trip_type INT,
        congestion_surcharge FLOAT
    )
    WITH (
        LOCATION = 'raw/trip_data_green_csv/**',
        DATA_SOURCE = nyc_taxi_src,
        FILE_FORMAT = csv_file_format
    );

IF OBJECT_ID('bronze.trip_data_green_parquet') IS NOT NULL
DROP EXTERNAL TABLE bronze.trip_data_green_parquet;

CREATE EXTERNAL TABLE bronze.trip_data_green_parquet
    (   VendorID INT,
        lpep_pickup_datetime datetime2(7),
        lpep_dropoff_datetime datetime2(7),
        store_and_fwd_flag CHAR(1),
        RatecodeID INT,
        PULocationID INT,
        DOLocationID INT,
        passenger_count INT,
        trip_distance FLOAT,
        fare_amount FLOAT,
        extra FLOAT,
        mta_tax FLOAT,
        tip_amount FLOAT,
        tolls_amount FLOAT,
        ehail_fee INT,
        improvement_surcharge FLOAT,
        total_amount FLOAT,
        payment_type INT,
        trip_type INT,
        congestion_surcharge FLOAT
    )
    WITH (
        LOCATION = 'raw/trip_data_green_parquet/**',
        DATA_SOURCE = nyc_taxi_src,
        FILE_FORMAT = parquet_file_format
    );

IF OBJECT_ID('bronze.trip_data_green_delta') IS NOT NULL
DROP EXTERNAL TABLE bronze.trip_data_green_delta;

CREATE EXTERNAL TABLE bronze.trip_data_green_delta
    (   VendorID INT,
        lpep_pickup_datetime datetime2(7),
        lpep_dropoff_datetime datetime2(7),
        store_and_fwd_flag CHAR(1),
        RatecodeID INT,
        PULocationID INT,
        DOLocationID INT,
        passenger_count INT,
        trip_distance FLOAT,
        fare_amount FLOAT,
        extra FLOAT,
        mta_tax FLOAT,
        tip_amount FLOAT,
        tolls_amount FLOAT,
        ehail_fee INT,
        improvement_surcharge FLOAT,
        total_amount FLOAT,
        payment_type INT,
        trip_type INT,
        congestion_surcharge FLOAT
    )
    WITH (
        LOCATION = 'raw/trip_data_green_delta',
        DATA_SOURCE = nyc_taxi_src,
        FILE_FORMAT = delta_file_format
    );