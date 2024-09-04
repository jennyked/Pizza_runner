--1
Select * from products;
Alter table products
add column unit_cost decimal(5,2);

UPDATE products
SET unit_cost = unit_price * 0.95;

--2
Select product_name, max(unit_price) as highest_price
from products
group by product_name
order by highest_price desc
Limit 1;

Select product_name, min(unit_price) as lowest_price
from products
group by product_name
order by lowest_price asc
Limit 1;




--3 
Select * from orders;
SELECT EXTRACT(MONTH FROM order_date) AS order_month, COUNT(quantity) AS no_of_orders
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2022
GROUP BY order_month;

SELECT to_char(order_date, 'Month') AS order_month, COUNT(quantity) AS no_of_orders
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2022
GROUP BY order_month;


--3
Select * from orders;

SELECT EXTRACT(YEAR FROM order_date) AS order_year, COUNT(quantity) AS no_of_orders
FROM orders
GROUP BY order_year 
ORDER BY no_of_orders desc;

--4
Select * from payments;

Select count(*)
from payments 
where payment_date = '2023-04-14';

---5
select * from orders;

Select customer_id, count(*) as max_orders
from orders
group by customer_id
order by max_orders desc
limit 1;


--7
Select customer_id, count(*) as nom_of_orders
from orders
group by customer_id
order by nom_of_orders desc;

--8
select * from orders;

SELECT count(*) AS total_quantity
FROM orders
WHERE order_date >= date '2023-01-01' AND order_date < date '2023-03-01';


SELECT count(*) AS total_quantity
FROM orders
WHERE order_date Between '2023-01-01' AND '2023-03-01';



