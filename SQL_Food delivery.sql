CREATE DATABASE food_delivery_project;
USE food_delivery_project;

CREATE TABLE food_orders (
    Order_ID INT,
    Distance_km FLOAT,
    Weather VARCHAR(50),
    Traffic_Level VARCHAR(50),
    Time_of_Day VARCHAR(50),
    Vehicle_Type VARCHAR(50),
    Preparation_Time_min INT,
    Courier_Experience_yrs FLOAT,
    Delivery_Time_min INT
);

SELECT COUNT(*) FROM cleaned_food_delivery;


SELECT Order_ID, COUNT(*)
FROM cleaned_food_delivery
GROUP BY Order_ID
HAVING COUNT(*) > 1;

CREATE TABLE food_orders_1 AS
SELECT DISTINCT *
FROM cleaned_food_delivery;

SELECT COUNT(*) FROM food_orders_1;

SELECT COUNT(*) AS total_orders FROM food_orders_1;

SELECT AVG(Delivery_Time_min) AS avg_delivery_time FROM food_orders_1;

SELECT MAX(Delivery_Time_min), MIN(Delivery_Time_min)
FROM food_orders_1;

SELECT Traffic_Level,
AVG(Delivery_Time_min) AS avg_time
FROM food_orders_1
GROUP BY Traffic_Level
ORDER BY avg_time DESC;

SELECT Weather,
AVG(Delivery_Time_min) AS avg_time
FROM food_orders_1
GROUP BY Weather
ORDER BY avg_time DESC;

SELECT Time_of_Day,
COUNT(*) AS total_orders,
AVG(Delivery_Time_min) AS avg_time
FROM food_orders_1
GROUP BY Time_of_Day
ORDER BY total_orders DESC;

SELECT Vehicle_Type,
AVG(Delivery_Time_min) AS avg_time
FROM food_orders_1
GROUP BY Vehicle_Type
ORDER BY avg_time;

SELECT 
CASE 
WHEN Distance_km < 5 THEN 'Short Distance'
WHEN Distance_km BETWEEN 5 AND 10 THEN 'Medium Distance'
ELSE 'Long Distance'
END AS distance_category,
AVG(Delivery_Time_min) AS avg_time
FROM food_orders_1
GROUP BY distance_category;

SELECT Courier_Experience_yrs,
       AVG(Delivery_Time_min) AS avg_time
FROM food_orders_1
GROUP BY Courier_Experience_yrs
ORDER BY Courier_Experience_yrs;

SELECT *
FROM food_orders_1
ORDER BY Delivery_Time_min DESC
LIMIT 5;