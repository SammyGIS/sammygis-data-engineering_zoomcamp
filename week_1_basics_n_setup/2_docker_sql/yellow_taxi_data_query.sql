-- Question 3
-- How many taxi trips where there in January 15

SELECT 
	COUNT(*)
FROM 
	yellow_taxi_trips
WHERE
	CAST(tpep_pickup_datetime AS DATE) = '2021-01-15';
	
-- Question 4
-- On which day is the largest tip in January
with january_2021 AS (SELECT *
				  FROM yellow_taxi_trips
				  WHERE CAST(tpep_pickup_datetime AS DATE)
					  >= '2021-01-01' AND 
					  CAST(tpep_pickup_datetime AS DATE)
					  <= '2021-01-31')
					  
SELECT DATE_TRUNC('day', tpep_pickup_datetime) as pickup_day,
MAX(tip_amount) as max_tip
FROM 
	january_2021
GROUP BY
	pickup_day
ORDER by 
	max_tip DESC
LIMIT 1;

---Question 5
-- what was the most popular destination for passengers
-- picked up in central park on January 14? Enter the zone name (not id).
-- if the zone name is unknown(missing) write "Unknown"
SELECT z."Zone" as pick_up,zdo."Zone" as drop_off, COUNT(*) as trip_count
FROM 
	yellow_taxi_trips as taxi
JOIN 
	zones as z
ON 
	taxi."PULocationID" = z."LocationID"
LEFT join 
		zones as zdo
ON taxi."DOLocationID" = zdo."LocationID"
WHERE z."Zone" ilike '%central park%'
AND CAST(tpep_pickup_datetime AS DATE)
					  = '2021-01-14'
GROUP BY (1,2)
ORDER BY trip_count DESC
LIMIT 1;


