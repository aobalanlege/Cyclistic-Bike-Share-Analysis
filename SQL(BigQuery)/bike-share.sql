-- Create table cyclistic_2022 by merging all the clean data 
CREATE TABLE cyclistic.cyclistic_2022 AS
SELECT * FROM cyclistic.table_1
UNION ALL
SELECT * FROM cyclistic.table_2
UNION ALL
SELECT * FROM cyclistic.table_3
UNION ALL
SELECT * FROM cyclistic.table_4
UNION ALL
SELECT * FROM cyclistic.table_5
UNION ALL
SELECT * FROM cyclistic.table_6
UNION ALL
SELECT * FROM cyclistic.table_7
UNION ALL
SELECT * FROM cyclistic.table_8
UNION ALL
SELECT * FROM cyclistic.table_9
UNION ALL
SELECT * FROM cyclistic.table_10
UNION ALL
SELECT * FROM cyclistic.table_11
UNION ALL
SELECT * FROM cyclistic.table_12;


-- Create final table for analysis named bike_share  
CREATE TABLE cyclistic.bike_share AS 
SELECT
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  start_station_name,
  end_station_name,
  member_casual,
  ride_length,
    CASE 
      WHEN EXTRACT(DAYOFWEEK FROM started_at) = 1 THEN 'Sunday'
      WHEN EXTRACT(DAYOFWEEK FROM started_at) = 2 THEN 'Monday'
      WHEN EXTRACT(DAYOFWEEK FROM started_at) = 3 THEN 'Tuesday'
      WHEN EXTRACT(DAYOFWEEK FROM started_at) = 4 THEN 'Wednesday'
      WHEN EXTRACT(DAYOFWEEK FROM started_at) = 5 THEN 'Thursday'
      WHEN EXTRACT(DAYOFWEEK FROM started_at) = 6 THEN 'Friday'
      WHEN EXTRACT(DAYOFWEEK FROM started_at) = 7 THEN 'Saturday'
    END AS day,
    CASE 
      WHEN EXTRACT(MONTH FROM started_at) = 1 THEN 'January'
      WHEN EXTRACT(MONTH FROM started_at) = 2 THEN 'February'
      WHEN EXTRACT(MONTH FROM started_at) = 3 THEN 'March'
      WHEN EXTRACT(MONTH FROM started_at) = 4 THEN 'April'
      WHEN EXTRACT(MONTH FROM started_at) = 5 THEN 'May'
      WHEN EXTRACT(MONTH FROM started_at) = 6 THEN 'June'
      WHEN EXTRACT(MONTH FROM started_at) = 7 THEN 'July'
      WHEN EXTRACT(MONTH FROM started_at) = 8 THEN 'August'
      WHEN EXTRACT(MONTH FROM started_at) = 9 THEN 'September'
      WHEN EXTRACT(MONTH FROM started_at) = 10 THEN 'October'
      WHEN EXTRACT(MONTH FROM started_at) = 11 THEN 'November'
      WHEN EXTRACT(MONTH FROM started_at) = 12 THEN 'December'
    END AS month,
FROM cyclistic.cyclistic_2022;


 
--  Rider Composition by Member Type
SELECT
  member_casual,
  COUNT(*) AS rider_count,
  ROUND((COUNT(*) / (SELECT COUNT(*) FROM `cyclistic.bike_share`)) * 100, 2) AS percentage
FROM
  `cyclistic.bike_share`
GROUP BY
  member_casual;

 
-- average ride length in mins and secs
SELECT 
member_casual,
AVG(TIME_DIFF(ride_length, TIME '00:00:00', SECOND)) AS Avg_ride_length_seconds,
AVG(TIME_DIFF(ride_length, TIME '00:00:00', MINUTE)) AS Avg_ride_length_minutes,
FROM
  cyclistic.bike_share
  GROUP BY
  member_casual;
 
-- frequency 0f ride Usage by days of week
  SELECT
  member_casual,
  day,
  COUNT(*) AS ride_count
FROM
  cyclistic.bike_share
GROUP BY
  member_casual, day
ORDER BY
  member_casual, day;
 
-- frequency 0f ride Usage by month
  SELECT
  member_casual,
  month,
  COUNT(*) AS ride_count
FROM
  cyclistic.bike_share
GROUP BY
  member_casual, month
ORDER BY
  member_casual, month;

 
-- Ride frequency by hour of the day
  SELECT
  member_casual,
  EXTRACT(HOUR FROM started_at) AS start_hour,
  COUNT(*) AS ride_count
FROM
  cyclistic.bike_share
GROUP BY
  member_casual, start_hour
ORDER BY
  member_casual, start_hour;
 
  -- Ride Preference for members and casual users
-- Ride preference by membership type
SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS ride_count,
  ROUND((COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY member_casual)) * 100, 2) AS percentage
FROM
  cyclistic.bike_share
GROUP BY
  member_casual, rideable_type
ORDER BY
  member_casual, ride_count DESC;


 
-- Most popular start stations for members and casual users:
SELECT
  member_casual,
  start_station_name,
  COUNT(*) AS start_count
FROM
  cyclistic.bike_share
GROUP BY
  member_casual, start_station_name
ORDER BY
  member_casual, start_count DESC;
 
-- Most popular end stations for members and casual users:
SELECT
  member_casual,
  end_station_name,
  COUNT(*) AS end_count
FROM
  cyclistic.bike_share
GROUP BY
  member_casual, end_station_name
ORDER BY
  member_casual, end_count DESC;
 

  
 
 
 
 
 
