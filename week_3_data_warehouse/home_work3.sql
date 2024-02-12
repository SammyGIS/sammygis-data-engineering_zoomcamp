-- Creating external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE data-enginerring-zoomcamp.green_taxi_2022.external_green_2022_tripdata
OPTIONS (
  format = 'parquet',
  uris = ['gs://mage-zoomcamp-bucket-sammy/nyc_taxi_2022_green_taxi.parquet']
);
-- create normal tbale
CREATE OR REPLACE TABLE data-enginerring-zoomcamp.green_taxi_2022.green_2022_tripdata AS
SELECT * FROM data-enginerring-zoomcamp.green_taxi_2022.external_green_2022_tripdata;

-- count distinct PUlocationID
SELECT COUNT(DISTINCT PULocationID)
FROM data-enginerring-zoomcamp.green_taxi_2022.external_green_2022_tripdata;
-- count distinct PUlocationID
SELECT COUNT(DISTINCT PULocationID)
FROM data-enginerring-zoomcamp.green_taxi_2022.green_2022_tripdata;

-- how many trip has a fare_amount of zero
SELECT COUNT(*)
FROM data-enginerring-zoomcamp.green_taxi_2022.green_2022_tripdata
WHERE fare_amount = 0;


-- Create a non partitioned table from external table
CREATE OR REPLACE TABLE data-enginerring-zoomcamp.green_taxi_2022.green_tripdata_non_partitoned AS
SELECT * FROM data-enginerring-zoomcamp.green_taxi_2022.green_2022_tripdata;

-- What is the best strategy to make an optimized table in Big Query if your query will always order the results by PUlocationID and filter based on lpep_pickup_datetime? (Create a new table with this strategy)

-- Cluster on lpep_pickup_datetime Partition by PUlocationID
CREATE OR REPLACE TABLE data-enginerring-zoomcamp.green_taxi_2022.strategy_1
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY (PULocationID) AS
SELECT * FROM data-enginerring-zoomcamp.green_taxi_2022.green_2022_tripdata;

-- Partition by lpep_pickup_datetime Cluster on PUlocationID
CREATE OR REPLACE TABLE data-enginerring-zoomcamp.green_taxi_2022.strategy_2
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PULocationID AS
SELECT * FROM data-enginerring-zoomcamp.green_taxi_2022.green_2022_tripdata;

-- Partition by lpep_pickup_datetime and Partition by PUlocationID
CREATE OR REPLACE TABLE data-enginerring-zoomcamp.green_taxi_2022.strategy_3
PARTITION BY DATE(lpep_pickup_datetime), PULocationID AS
SELECT * FROM data-enginerring-zoomcamp.green_taxi_2022.green_2022_tripdata;

-- Cluster on by lpep_pickup_datetime and Cluster on PUlocationID
CREATE OR REPLACE TABLE data-enginerring-zoomcamp.green_taxi_2022.strategy_4
CLUSTER BY DATE(lpep_pickup_datetime),PULocationID AS
SELECT * FROM data-enginerring-zoomcamp.green_taxi_2022.green_2022_tripdata;



-- Create a partitioned table from external table
CREATE OR REPLACE TABLE data-enginerring-zoomcamp.green_taxi_2022.green_tripdata_partitoned
PARTITION BY
  DATE(lpep_pickup_datetime) AS
SELECT * FROM data-enginerring-zoomcamp.green_taxi_2022.green_2022_tripdata;

-- Creating a partition and cluster table
CREATE OR REPLACE TABLE data-enginerring-zoomcamp.green_taxi_2022.green_tripdata_partitoned_clustered
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PULocationID AS
SELECT * FROM data-enginerring-zoomcamp.green_taxi_2022.green_2022_tripdata;


-- What's the size of the tables?
SELECT PULocationID
FROM data-enginerring-zoomcamp.green_taxi_2022.green_tripdata_partitoned
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';

-- What's the size of the tables?
SELECT PULocationID
FROM data-enginerring-zoomcamp.green_taxi_2022.green_tripdata_non_partitoned
WHERE DATE(lpep_pickup_datetime) BETWEEN '2022-06-01' AND '2022-06-30';







