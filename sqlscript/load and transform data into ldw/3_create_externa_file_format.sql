USE nyc_taxi_ldw

-- Create an external file format for DELIMITED (CSV/TSV) files.
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'csv_file_format')
CREATE EXTERNAL FILE FORMAT csv_file_format
WITH (
      FORMAT_TYPE = DELIMITEDTEXT,
      FORMAT_OPTIONS ( 
          FIELD_TERMINATOR = ',',
          STRING_DELIMITER = '"',
          HEADER_ROW = TRUE,
          USE_TYPE_DEFAULT = FALSE,
          PARSER_VERSION = '2.0'
        ) 
     );

IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'csv_file_format_pv1')
CREATE EXTERNAL FILE FORMAT csv_file_format_pv1
WITH (
      FORMAT_TYPE = DELIMITEDTEXT,
      FORMAT_OPTIONS ( 
          FIELD_TERMINATOR = ',',
          STRING_DELIMITER = '"',
          HEADER_ROW = TRUE,
          USE_TYPE_DEFAULT = FALSE,
          PARSER_VERSION = '1.0'
        ) 
     );

IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'tsv_file_format')
CREATE EXTERNAL FILE FORMAT tsv_file_format
WITH (
      FORMAT_TYPE = DELIMITEDTEXT,
      FORMAT_OPTIONS ( 
          FIELD_TERMINATOR = '\t',
          STRING_DELIMITER = '"',
          HEADER_ROW = TRUE,
          USE_TYPE_DEFAULT = FALSE,
          PARSER_VERSION = '2.0'
        ) 
     );

IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'tsv_file_format_pv1')
CREATE EXTERNAL FILE FORMAT tsv_file_format_pv1
WITH (
      FORMAT_TYPE = DELIMITEDTEXT,
      FORMAT_OPTIONS ( 
          FIELD_TERMINATOR = '\t',
          STRING_DELIMITER = '"',
          HEADER_ROW = TRUE,
          USE_TYPE_DEFAULT = FALSE,
          PARSER_VERSION = '1.0'
        ) 
     );
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'parquet_file_format')
CREATE EXTERNAL FILE FORMAT parquet_file_format
  WITH (
         FORMAT_TYPE = PARQUET,
         DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
     
    );

IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'delta_file_format')
CREATE EXTERNAL FILE FORMAT delta_file_format
  WITH (
         FORMAT_TYPE = DELTA,
         DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
     
    );