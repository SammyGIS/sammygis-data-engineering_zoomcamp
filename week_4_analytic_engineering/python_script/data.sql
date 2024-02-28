-- create the data from a public repository
-- Load Green taxi data for 2019 and 2020
-- Create or replace the table with data from 2019
CREATE OR REPLACE TABLE `data-enginerring-zoomcamp.trips_data_all.green_tripdata`
AS SELECT * FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2019`;

-- Insert data from 2020 into the existing table
INSERT INTO `data-enginerring-zoomcamp.trips_data_all.green_tripdata`
SELECT * FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2020`;

-- Load Yellow taxi data for 2019 and 2020
-- Create or replace the table with data from 2019
CREATE OR REPLACE TABLE `data-enginerring-zoomcamp.trips_data_all.yellow_tripdata`
AS SELECT * FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2019`;

-- Insert data from 2020 into the existing table
INSERT INTO `data-enginerring-zoomcamp.trips_data_all.yellow_tripdata`
SELECT * FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2020`;