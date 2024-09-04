--Complex Joins:

--Question: Write a query to list the names of customers who have placed orders for products from at least three different categories.
--Skills Covered: INNER JOIN, GROUP BY, HAVING.

Select distinct first_name, last_name, count(category) count_cat
from customers cus
join orders o on cus.customer_id = o.customer_id
join orderitems oi on  oi.order_id = o.order_id
join products po on oi.product_id = po.product_id
group by first_name,last_name
having count(category)  >= 3




---------------------------------------------------------------
--Subqueries:

--Question: Find the names of products that have received a rating of 4 or 5 from every customer who reviewed them.



select distinct product_name, first_name, last_name, pr.customer_id, rating  
from products p
join  productreviews pr on  p.product_id = pr.product_id
join customers c on c.customer_id = pr.customer_id
where rating in (4,5)

-----Question: For each customer, calculate the average order amount and rank the customers based 
---on their average order amount. Provide the rank, customer name, and average order amount.

WITH cte AS (
    SELECT DISTINCT first_name, last_name, AVG(total_amount) AS ab
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY first_name, last_name
),
agg AS (
    SELECT cte.*, RANK() OVER (ORDER BY cte.ab ASC)
    FROM cte
)
SELECT * FROM agg;


--- Use a CTE to find the top 3 most expensive products 
--in each category and display the category name, product name, and price.

with cte as (Select category, product_name, price,
row_number() over (partition by category order by price) num
from products)
Select * from cte
where num <= 3




--Question: Write a query to find the total number of products sold and the total revenue 
--generated for each product category, only considering orders that were delivered.

select category,  from orderitems p

Select category, count( product_name) number_products, sum(price)
from products
--join orders on o.
group by category
where status = 'Delivered'


-----Question: List the customers who have never placed an order for a product in the
-- 'Electronics' category


SELECT first_name, last_name, category 
FROM customers cus
JOIN orders o ON cus.customer_id = o.customer_id
    JOIN orderitems oi ON oi.order_id = o.order_id
    JOIN products po ON oi.product_id = po.product_id
WHERE cus.customer_id NOT IN (
    SELECT DISTINCT cus.customer_id 
    FROM customers cus
    JOIN orders o ON cus.customer_id = o.customer_id
    JOIN orderitems oi ON oi.order_id = o.order_id
    JOIN products po ON oi.product_id = po.product_id
    WHERE po.category  'Electronics'


);

-------: Update the prices of all products in the 'Books' 
category by increasing them by 10%. Ensure that the new price is rounded to two decimal places.

update products
set price = round((price * 0.1),2)

select * from products






--Question: For each order, calculate the cumulative total amount spent by the 
---customer up to that order date, and display the order ID, customer name, order date, and
-- cumulative total.
select o.order_id, first_name, last_name, order_date, sum(total_amount) from customers cus
join orders o on o.customer_id = cus.customer_id
group by o.order_id, first_name, last_name, order_date





 


 





















