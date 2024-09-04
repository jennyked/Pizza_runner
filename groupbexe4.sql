Select * from aisles;
Select * from customers;
Select * from department;
Select * from orders;
Select * from products;


--1. On which days of the week are condoms mostly sold
Select order_dow day_of_week, count(p.product_id) no_sold
from orders o
join products p on o.product_id=p.product_id
where product_name LIKE '%condoms%'
group by day_of_week
order by no_sold desc

--2. How have the orders changed over time(monthly)
Select to_char(order_date, 'Month') monthly_orders, count(*) c
from orders
group by monthly_orders
order by c desc

--3 what department has the highest average spend per customer
select department, round(avg(unit_price), 1) spend
from department d
join products p on d.department_id=p.department_id
group by department
Order by spend
Limit 1

--4. Which type of condom do customers prefer
--5. Which aisle contains the most organic product
Select aisle Aisle, count(p.product_id) no_sold
from aisles a
join products p on a.aisle_id=p.aisle_id
where product_name LIKE '%organic%'
group by Aisle
order by no_sold desc
limit 1


---6. Which aisle can I find non alcohol drinks
