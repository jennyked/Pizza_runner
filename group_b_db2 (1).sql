--1
Alter table products
add column unit_cost decimal(5,2);

UPDATE products
SET unit_cost = unit_price * 0.95;

--2
Select product_name, max(unit_price) as highest_price
from products
group by product_name
order by product_name desc
Limit 1;

--3 
SELECT EXTRACT(MONTH FROM order_date) AS order_month, COUNT(quantity) AS no_of_orders
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2022
GROUP BY order_month;

SELECT to_char(order_date, 'Month') AS order_month, COUNT(quantity) AS no_of_orders
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2022
GROUP BY EXTRACT(Month FROM order_date);


Select product_name, min(unit_price) as lowest_price
from products
group by product_name
order by product_name asc
Limit 1;

--3
Select * from orders;

SELECT EXTRACT(YEAR FROM order_date) AS order_year, COUNT(quantity) AS no_of_orders
FROM orders
GROUP BY order_year 
ORDER BY no_of_orders desc;

--4
Select * from payments;

Select count(order_id) 
from payments 
where payment_date = '2023-04-14';

---5
select * from orders;

Select customer_id, max(quantity) as max_orders
from orders
group by customer_id
order by max_orders desc
limit 1;


--7
Select customer_id, sum(quantity) as orders_by_id
from orders
group by customer_id
order by orders_by_id desc;

--8
select * from orders;

SELECT SUM(quantity) AS total_quantity
FROM orders
WHERE order_date >= date '2023-01-01' AND order_date < date '2023-03-01';






