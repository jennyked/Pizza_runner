

CREATE TABLE runners (
  "runner_id" INTEGER,
  "registration_date" DATE
);
INSERT INTO runners
  ("runner_id", "registration_date")
VALUES
  (1, '2021-01-01'),
  (2, '2021-01-03'),
  (3, '2021-01-08'),
  (4, '2021-01-15');



CREATE TABLE customer_orders (
  "order_id" INTEGER,
  "customer_id" INTEGER,
  "pizza_id" INTEGER,
  "exclusions" VARCHAR(4),
  "extras" VARCHAR(4),
  "order_time" TIMESTAMP
);

INSERT INTO customer_orders
  ("order_id", "customer_id", "pizza_id", "exclusions", "extras", "order_time")
VALUES
  ('1', '101', '1', '', '', '2020-01-01 18:05:02'),
  ('2', '101', '1', '', '', '2020-01-01 19:00:52'),
  ('3', '102', '1', '', '', '2020-01-02 23:51:23'),
  ('3', '102', '2', '', NULL, '2020-01-02 23:51:23'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '2', '4', '', '2020-01-04 13:23:46'),
  ('5', '104', '1', 'null', '1', '2020-01-08 21:00:29'),
  ('6', '101', '2', 'null', 'null', '2020-01-08 21:03:13'),
  ('7', '105', '2', 'null', '1', '2020-01-08 21:20:29'),
  ('8', '102', '1', 'null', 'null', '2020-01-09 23:54:33'),
  ('9', '103', '1', '4', '1, 5', '2020-01-10 11:22:59'),
  ('10', '104', '1', 'null', 'null', '2020-01-11 18:34:49'),
  ('10', '104', '1', '2, 6', '1, 4', '2020-01-11 18:34:49');



CREATE TABLE runner_orders (
  "order_id" INTEGER,
  "runner_id" INTEGER,
  "pickup_time" VARCHAR(19),
  "distance" VARCHAR(7),
  "duration" VARCHAR(10),
  "cancellation" VARCHAR(23)
);

INSERT INTO runner_orders
  ("order_id", "runner_id", "pickup_time", "distance", "duration", "cancellation")
VALUES
  ('1', '1', '2020-01-01 18:15:34', '20km', '32 minutes', ''),
  ('2', '1', '2020-01-01 19:10:54', '20km', '27 minutes', ''),
  ('3', '1', '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
  ('4', '2', '2020-01-04 13:53:03', '23.4', '40', NULL),
  ('5', '3', '2020-01-08 21:10:57', '10', '15', NULL),
  ('6', '3', 'null', 'null', 'null', 'Restaurant Cancellation'),
  ('7', '2', '2020-01-08 21:30:45', '25km', '25mins', 'null'),
  ('8', '2', '2020-01-10 00:15:02', '23.4 km', '15 minute', 'null'),
  ('9', '2', 'null', 'null', 'null', 'Customer Cancellation'),
  ('10', '1', '2020-01-11 18:50:20', '10km', '10minutes', 'null');



CREATE TABLE pizza_names (
  "pizza_id" INTEGER,
  "pizza_name" TEXT
);
INSERT INTO pizza_names
  ("pizza_id", "pizza_name")
VALUES
  (1, 'Meatlovers'),
  (2, 'Vegetarian');



CREATE TABLE pizza_recipes (
  "pizza_id" INTEGER,
  "toppings" TEXT
);
INSERT INTO pizza_recipes
  ("pizza_id", "toppings")
VALUES
  (1, '1, 2, 3, 4, 5, 6, 8, 10'),
  (2, '4, 6, 7, 9, 11, 12');



CREATE TABLE pizza_toppings (
  "topping_id" INTEGER,
  "topping_name" TEXT
);
INSERT INTO pizza_toppings
  ("topping_id", "topping_name")
VALUES
  (1, 'Bacon'),
  (2, 'BBQ Sauce'),
  (3, 'Beef'),
  (4, 'Cheese'),
  (5, 'Chicken'),
  (6, 'Mushrooms'),
  (7, 'Onions'),
  (8, 'Pepperoni'),
  (9, 'Peppers'),
  (10, 'Salami'),
  (11, 'Tomatoes'),
  (12, 'Tomato Sauce');


--*case study* 
--data cleaning
CREATE TEMP TABLE runner_orders_new AS
 SELECT order_id, runner_id, 
   CASE
     WHEN pickup_time = 'null' THEN NULL
     ELSE pickup_time
   END AS pickup_time,
   CASE
     WHEN distance = 'null' THEN NULL
     WHEN distance LIKE '%km' THEN TRIM('km' from distance)
     ELSE distance 
   END AS distance,
   CASE
     WHEN duration = 'null' THEN NULL
     WHEN duration LIKE '%mins' THEN TRIM('mins' from duration)
     WHEN duration LIKE '%minute' THEN TRIM('minute' from duration)
     WHEN duration LIKE '%minutes' THEN TRIM('minutes' from duration)
     ELSE duration
   END AS duration,
   CASE
     WHEN cancellation IS NULL or cancellation = 'null' THEN ''
     ELSE cancellation
   END AS cancellation
  FROM runner_orders;



SELECT order_id, customer_id, pizza_id, 
  CASE 
    WHEN exclusions IS null OR exclusions LIKE 'null' THEN ' '
    ELSE exclusions
    END AS exclusions,
  CASE 
    WHEN extras IS NULL or extras LIKE 'null' THEN ' '
    ELSE extras 
    END AS extras, 
  order_time
INTO customer_orders_new -- create TEMP TABLE
FROM customer_orders;

drop table runner_orders_new
SELECT order_id, runner_id,
  CASE 
    WHEN pickup_time LIKE 'null' THEN ' '
    ELSE pickup_time 
    END AS pickup_time,
  CASE 
    WHEN distance LIKE 'null' THEN ''
    WHEN distance LIKE '%km' THEN TRIM('km' from distance) 
    ELSE distance END AS distance,
  CASE 
    WHEN duration LIKE 'null' THEN ' ' 
    WHEN duration LIKE '%mins' THEN TRIM('mins' from duration) 
    WHEN duration LIKE '%minute' THEN TRIM('minute' from duration)        
    WHEN duration LIKE '%minutes' THEN TRIM('minutes' from duration)       
    ELSE duration END AS duration,
  CASE 
    WHEN cancellation IS NULL or cancellation LIKE 'null' THEN ''
    ELSE cancellation END AS cancellation
INTO runner_orders_new
FROM runner_orders;
 

--A. Pizza Metrics
--1.How many pizzas were ordered?
select * from customer_orders_new
select * from pizza_names
select * from pizza_recipes
select * from pizza_toppings
select * from runner_orders_new
select * from runners

drop table runner_orders_new
select count(pizza_id)
from customer_orders_new;

--2.How many unique customer orders were made?
select count(distinct order_id)
from customer_orders

--3. How many successful orders were delivered by each runner?
-- Update rows with white space in the "distance" column to NULL
UPDATE runner_orders_new
SET distance = NULL
WHERE distance = ' ';

-- Alter the "distance" column to a temporary numeric type to convert the data
ALTER TABLE runner_orders_new
ALTER COLUMN distance TYPE NUMERIC USING distance::NUMERIC,
ALTER COLUMN pickup_time TYPE timestamp USING pickup_time::timestamp without time zone, 
ALTER COLUMN duration TYPE integer USING duration::integer;


-- Alter the "distance" column to the desired float type
ALTER TABLE runner_orders_new
ALTER COLUMN distance TYPE FLOAT;


SELECT runner_id, COUNT(order_id) AS successful_orders
FROM runner_orders_new
WHERE distance is not null
GROUP BY runner_id
order by runner_id asc;

--4. How many of each type of pizza was delivered?
select pizza_name, count(c.pizza_id)
from customer_orders_new c
join pizza_names p on p.pizza_id = c.pizza_id
join runner_orders_new r on  c.order_id = r.order_id
where distance != 0
group by pizza_name;
select * from pizza_names


--5.How many Vegetarian and Meatlovers were ordered by each customer?
select c.customer_id, p.pizza_name, count(p.pizza_name) o
from customer_orders_new c
join pizza_names p on p.pizza_id = c.pizza_id
group by c.customer_id, p.pizza_name
order by c.customer_id;
select * from pizza_names
select * from customer_orders_new
select * from runner_orders_new

--6.What was the maximum number of pizzas delivered in a single order?
WITH pizza_count_cte AS
(
 SELECT c.order_id, COUNT(c.pizza_id) AS pizza_per_order
 FROM customer_orders_new AS c
 JOIN runner_orders_new AS r
  ON c.order_id = r.order_id
 WHERE r.distance != 0
 GROUP BY c.order_id
)
SELECT MAX(pizza_per_order) AS pizza_count
FROM pizza_count_cte;


--7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
Select c.customer_id,
sum(case 
when exclusions <> ' ' or extras <> ' ' then 1
else 0
end) as at_least_1_change,
sum(case 
when exclusions = ' ' or extras = ' ' then 1
else 0
end) as no_change
from customer_orders_new c
join runner_orders_new r on r.order_id = c.order_id
where distance != 0
group by c.customer_id
Order by c.customer_id asc


--8.How many pizzas were delivered that had both exclusions and extras?
Select  
sum(case when exclusions IS NOT NULL and extras IS NOT NULL
then 1
Else 0 
End) as pizza_count
from customer_orders_new c
join runner_orders_new r on r.order_id = c.order_id
where distance >= 1 AND exclusions <> ' ' AND extras <> ' ';


with no_pizza as (
select c.order_id, r.distance
from customer_orders_new c
join runner_orders_new r on r.order_id = c.order_id
where exclusions <> ' ' and extras <> ' '
)
Select count(order_id) as pizza_count
from no_pizza
where distance != 0

--9. What was the total volume of pizzas ordered for each hour of the day?
select Extract(hour from order_time) as Hour_day, count(order_id) as Vol
from customer_orders_new
group by Extract(hour from order_time)
order by Extract(hour from order_time) asc;


--10.What was the volume of orders for each day of the week?

SELECT to_char(order_time, 'Day') AS Day_of_week, COUNT(order_id) AS no_of_orders
FROM customer_orders_new
GROUP BY Day_of_week
order by no_of_orders;






  
