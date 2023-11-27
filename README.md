Project made to get some experience in Azure Synapse Analytics Service.

Table of Context:
1. Project Description & Requirements
2. Services & Tools

1. Project based on open source NYC Taxi Data
Aim of the project was to go thru the ETL process using bronze, silver and gold layers.

- first raw data was extracted from files into bronze container
- then transormed and loaded into silver layer:
    - schema applied,
    - parquet format

- finally consolidated and loaded into gold layer for reporting purpose.

On tp of that pipeline has been created to run the scripts automatically based on a trigger.

2. Azure:
	- Synapse Analytics:
    	- Synapse Pipeline
        - Serverless SQL Pool