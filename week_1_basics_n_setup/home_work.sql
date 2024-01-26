SELECT * 
FROM public.green_taxi_Data
LIMIT 10;


SELECT * 
FROM public.zones
LIMIT 10;

-- How many taxi trips were totally made on September 18th 2019?
-- Tip: started and finished on 2019-09-18.
-- Remember that lpep_pickup_datetime and lpep_dropoff_datetime columns are in the format timestamp 
-- (date and hour+min+sec) and not in date.
SELECT COUNT(*), lpep_pickup_datetime::DATE AS pickup
FROM public.green_taxi_Data
WHERE lpep_pickup_datetime::DATE = '2019-09-18'
GROUP BY pickup,

-- Which was the pick up day with the largest trip distance Use the pick up time for your calculations.
SELECT COUNT(*), lpep_pickup_datetime::DATE AS pickup, MAX(trip_distance) AS max_trip_distance
FROM public.green_taxi_Data
GROUP BY pickup
ORDER BY MAX(trip_distance) DESC;

-- Consider lpep_pickup_datetime in '2019-09-18' and ignoring Borough has Unknown
-- Which were the 3 pick up Boroughs that had a sum of total_amount superior to 50000?

SELECT zones."Borough", SUM(total_amount) AS total_amount
FROM public.green_taxi_data AS taxi_data
LEFT JOIN public.zones AS zones ON taxi_data."PULocationID"= zones."LocationID"
WHERE taxi_data.lpep_pickup_datetime::DATE = '2019-09-18'
  AND zones."Borough"  <> 'Unknown'
GROUP BY zones."Borough"
HAVING SUM(total_amount) > 50000
ORDER BY total_amount DESC;


-- For the passengers picked up in September 2019 in the zone name Astoria which was the drop off zone that had the largest tip?
-- We want the name of the zone, not the id.

SELECT * 
FROM public.green_taxi_Data
LIMIT 10;


SELECT * 
FROM public.zones
LIMIT 10;

-- How many taxi trips were totally made on September 18th 2019?
-- Tip: started and finished on 2019-09-18.
-- Remember that lpep_pickup_datetime and lpep_dropoff_datetime columns are in the format timestamp 
-- (date and hour+min+sec) and not in date.
SELECT COUNT(*), lpep_pickup_datetime::DATE AS pickup
FROM public.green_taxi_Data
WHERE lpep_pickup_datetime::DATE = '2019-09-18'
GROUP BY pickup,

-- Which was the pick up day with the largest trip distance Use the pick up time for your calculations.
SELECT COUNT(*), lpep_pickup_datetime::DATE AS pickup, MAX(trip_distance) AS max_trip_distance
FROM public.green_taxi_Data
GROUP BY pickup
ORDER BY MAX(trip_distance) DESC;

-- Consider lpep_pickup_datetime in '2019-09-18' and ignoring Borough has Unknown
-- Which were the 3 pick up Boroughs that had a sum of total_amount superior to 50000?

SELECT zones."Borough", SUM(total_amount) AS total_amount
FROM public.green_taxi_data AS taxi_data
LEFT JOIN 
    public.zones AS zones ON taxi_data."PULocationID"= zones."LocationID"
WHERE taxi_data.lpep_pickup_datetime::DATE = '2019-09-18'
  AND zones."Borough"  <> 'Unknown'
GROUP BY 
    zones."Borough"
HAVING SUM(total_amount) > 50000
ORDER BY total_amount DESC;


-- For the passengers picked up in September 2019 in the zone name Astoria which was the drop off zone that had the largest tip?
-- We want the name of the zone, not the id.

SELECT
    zones."Zone" AS pickup_zone,
    taxi_data."DOLocationID",
    drop_off_zone."Zone" AS drop_off_zone,
    SUM(taxi_data."tip_amount") AS sum_tip_amount
FROM  public.green_taxi_data AS taxi_data
RIGHT JOIN    public.zones AS zones ON taxi_data."PULocationID" = zones."LocationID"
LEFT JOIN     public.zones AS drop_off_zone ON taxi_data."DOLocationID" = drop_off_zone."LocationID"
WHERE     zones."Zone" = 'Astoria' AND
    taxi_data."DOLocationID" IS NOT NULL
GROUP BY     zones."Zone", taxi_data."DOLocationID", drop_off_zone."Zone"
ORDER BY     sum_tip_amount DESC;







