SELECT * FROM zones

SELECT * FROM yellow_taxi_trips
LIMIT 100;

--select all
SELECT
*
FROM  
	yellow_taxi_trips AS t,
	zones AS zpu,
	zones AS zdo
WHERE
	t."PULocationID" = zpu."LocationID" AND
	t."DOLocationID" = zdo."LocationID"
LIMIT 100;


--Select data
SELECT
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	CONCAT(zpu."Borough", ' / ' , zpu."Zone") As "pickup_loc",
	CONCAT(zdo."Borough", ' / ' , zdo."Zone") As "dropoff_loc"
FROM  
	yellow_taxi_trips t,
	zones zpu,
	zones zdo
WHERE
	t."PULocationID" = zpu."LocationID" AND
	t."DOLocationID" = zdo."LocationID"
LIMIT 100;

--GROUBY Query
SELECT
	CAST(tpep_dropoff_datetime AS DATE) as "day",
	COUNT(1)
FROM  
	yellow_taxi_trips AS t
GROUP BY
	CAST(tpep_dropoff_datetime AS DATE)
ORDER BY 
		--"day" ASC
		COUNT(1) DESC
LIMIT 100; 

