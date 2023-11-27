USE master
GO

CREATE DATABASE nyc_taxi_ldw
GO

ALTER DATABASE nyc_taxi_ldw COLLATION LAtin1_....utf8
GO

USE nyc_taxi_ldw
GO

CREATE SCHEMA bronze
GO

CREATE SCHEMA silver
GO

CREATE SCHEMA gold
GO
