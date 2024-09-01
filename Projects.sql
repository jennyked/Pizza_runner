
--Question 1: Write a query to list the names of customers who have placed orders for products from at least three different categories.

select first_name,last_name,count(category) Category
FROM customers c 
join orders o on c.customer_id = o.customer_id
join productreviews pra on pra.customer_id = c.customer_id 
join products pr on pr.product_id = pra.product_id
group by first_name,last_name
having count(category) >= 3


---Question 2: Find the names of products that have received a rating of 4 or 5 from every customer who reviewed them.
select distinct first_name,last_name,product_name, rating
FROM customers c 
join orders o on c.customer_id = o.customer_id
join productreviews pra on pra.customer_id = c.customer_id 
join products pr on pr.product_id = pra.product_id
--group by first_name,last_name
where rating in (4,5)




---Question 3: For each customer, calculate the average order amount and rank the customers based on their average order amount.Provide the rank, customer name, and average order amount
with cte as (select distinct first_name, last_name, avg(total_amount) avg_amt
FROM customers c 
join orders o on c.customer_id = o.customer_id
group by first_name, last_name)
,agg as (Select distinct cte.*, rank() over (order by avg_amt desc)
from cte)
Select * from agg  


---Question 4: Use a CTE to find the top 3 most expensive products in each category and display the category name, product name, and price.

with cte as (Select distinct category, product_name, price,
row_number() over (partition by category order by price desc) num from products)
Select distinct category, product_name, price from cte
where num between 1 and 3
order by category, 3


---Question 5: Write a query to find the total number of products sold and the total revenue generated for each product category, only considering orders that were delivered.
Select distinct category, count(pr.product_id), sum(total_amount)
from products pr 
left join productreviews o on pr.product_id = o.product_id
left join orders ord on ord.customer_id = o.customer_id
where status = 'Delivered'
group by category


---Question 6:List the customers who have never placed an order for a product in the 'Electronics' category.

SELECT DISTINCT first_name, last_name, category, c.customer_id
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
JOIN productreviews pra ON pra.customer_id = c.customer_id 
JOIN products pr ON pr.product_id = pra.product_id
WHERE c.customer_id NOT IN (
    SELECT c.customer_id
    FROM customers c 
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN productreviews pra ON pra.customer_id = c.customer_id 
    JOIN products pr ON pr.product_id = pra.product_id
    WHERE pr.category = 'Electronics'
);

---Question 7: For each order, calculate the cumulative total amount spent by the customer up to that order date, and display the order ID, customer name, order date, and cumulative total.
SELECT order_id, first_name, last_name,max(order_date), sum(total_amount)
    FROM customers c 
   right  JOIN orders o ON c.customer_id = o.customer_id
group by order_id, first_name, last_name


--Question 8: For each order, calculate the cumulative total amount spent by the customer up to that order date, and display the order ID, customer name, order date, and cumulative total.
SELECT order_id, first_name, last_name,order_date, sum(total_amount),
sum(total_amount) over (partition by order_id)
    FROM customers c 
   right  JOIN orders o ON c.customer_id = o.customer_id
group by order_id, first_name, last_name






