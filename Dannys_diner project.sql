CREATE TABLE sales (
  "customer_id" VARCHAR(1),
  "order_date" DATE,
  "product_id" INTEGER
);

INSERT INTO sales
  ("customer_id", "order_date", "product_id")
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 

CREATE TABLE menu (
  "product_id" INTEGER,
  "product_name" VARCHAR(5),
  "price" INTEGER
);

INSERT INTO menu
  ("product_id", "product_name", "price")
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  

CREATE TABLE members (
  "customer_id" VARCHAR(1),
  "join_date" DATE
);

INSERT INTO members
  ("customer_id", "join_date")
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');


  Select * from members
  Select * from menu
  Select * from sales
/* --------------------
   Case Study Questions
   --------------------*/
-- 1. What is the total amount each customer spent at the restaurant?
Select customer_id, sum(price) price
from sales s
join menu m on s.product_id=m.product_id
group by customer_id
Order by customer_id

-- 2. How many days has each customer visited the restaurant?
select customer_id, count(distinct order_date) days_visited
from sales 
group by customer_id
order by customer_id

-- 3. What was the first item from the menu purchased by each customer?
WITH ordered_sales AS (
  SELECT 
    sales.customer_id, 
    sales.order_date, 
    menu.product_name,
    DENSE_RANK() OVER(PARTITION BY sales.customer_id ORDER BY sales.order_date) AS rank
  FROM sales
  JOIN menu
    ON sales.product_id = menu.product_id
)
select customer_id, product_name
from ordered_sales
WHERE rank = 1
GROUP BY customer_id, product_name;

-- 3. What was the first item from the menu purchased by each customer?
With first_item as(
select customer_id, product_name, order_date,
Dense_rank() over (partition by customer_id order by order_date) as rank
from sales s
join menu m on s.product_id = m.product_id
 )
select customer_id, product_name
from first_item
where rank = 1
group by customer_id, product_name;

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
select product_name, count(s.product_id) as most_purchased
from sales s
join menu m on s.product_id=m.product_id
group by product_name
order by most_purchased desc
limit 1

-- 5. Which item was the most popular for each customer?
WITH most_popular AS (
  SELECT 
    customer_id, product_name, COUNT(m.product_id) AS order_count,
    DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY COUNT(customer_id) DESC) AS rank
  FROM menu m
  JOIN sales s
    ON m.product_id = s.product_id
  GROUP BY customer_id, product_name
)

SELECT 
  customer_id, product_name, order_count
FROM most_popular 
WHERE rank = 1;


-- 6. Which item was purchased first by the customer after they became a member?
WITH joined_as_member AS (
  SELECT
    m.customer_id, s.product_id,
    ROW_NUMBER() OVER(PARTITION BY m.customer_id ORDER BY s.order_date) AS row_num
  FROM members m
  JOIN sales s
    ON m.customer_id = s.customer_id
    AND s.order_date > m.join_date
)

SELECT 
  customer_id, 
  product_name 
FROM joined_as_member j
JOIN menu m ON j.product_id = m.product_id
WHERE row_num = 1
ORDER BY customer_id ASC;

-- 7. Which item was purchased just before the customer became a member?
WITH joined_as_member AS (
  SELECT
    m.customer_id, s.product_id,
    ROW_NUMBER() OVER(PARTITION BY m.customer_id ORDER BY s.order_date desc) AS row_num
  FROM members m
  JOIN sales s
    ON m.customer_id = s.customer_id
    AND s.order_date < m.join_date
)
SELECT 
  customer_id, product_name 
FROM joined_as_member j
JOIN menu m ON j.product_id = m.product_id
WHERE row_num = 1
ORDER BY customer_id ASC;

 

-- 7. Which item was purchased just before the customer became a member?
with joined as (
select m.customer_id, s.product_id,
row_number() over (partition by m.customer_id order by s.order_date desc) as row_num
from sales s
join members m on m.customer_id=s.customer_id and s.order_date< m.join_date
)
select customer_id, product_name
from joined j
join menu m on j.product_id = m.product_id
where row_num = 1
order by customer_id asc;


-- 8. What is the total items and amount spent for each member before they became a member?
select m.customer_id c, sum(mm.price), count(s.product_id)
from sales s
join members m on m.customer_id=s.customer_id and s.order_date< m.join_date
join menu mm on mm.product_id=s.product_id
group by c
order by c


-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
WITH points AS (
  SELECT m.product_id, 
    CASE
      WHEN product_id = 1 THEN price * 20
      ELSE price * 10
    END AS point
  FROM menu m
)

SELECT 
  s.customer_id, SUM(points.point) AS total_points
FROM sales s
JOIN points ON s.product_id = points.product_id
GROUP BY s.customer_id
ORDER BY s.customer_id; 

-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
With cus_points as (
select m.product_id,
case when
product_id = 1 then price * 20
else price * 10
End as points
	from menu m
)
select s.customer_id, sum(cus_points.points) as total
from sales s
join cus_points  on s.product_id=cus_points.product_id
group by s.customer_id
order by s.customer_id


-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
WITH dates_cte AS (
  SELECT 
    customer_id, 
    join_date, 
    join_date + 6 AS valid_date, 
    DATE_TRUNC(
      'month', '2021-01-31'::DATE)
      + interval '1 month' 
      - interval '1 day' AS last_date
  FROM members
)

SELECT 
  sales.customer_id, 
  SUM(CASE
    WHEN menu.product_name = 'sushi' THEN 2 * 10 * menu.price
    WHEN sales.order_date BETWEEN dates.join_date AND dates.valid_date THEN 2 * 10 * menu.price
    ELSE 10 * menu.price END) AS points
FROM sales
JOIN dates_cte AS dates
  ON sales.customer_id = dates.customer_id
  AND sales.order_date <= dates.last_date
JOIN menu
  ON sales.product_id = menu.product_id
GROUP BY sales.customer_id;

---Bonus question: Recreate the table with: customer_id, order_date, product_name, price, member (Y/N)
Select * from members
  Select * from menu
  Select * from sales

Select s.customer_id, s.order_date, m.product_name, m.price,
case
 when mm.join_date>s.order_date then 'N'
 when mm.join_date<=s.order_date then 'Y'
 else 'N' END AS member_status
from sales s
join members mm on mm.customer_id=s.customer_id 
join menu m on m.product_id=s.product_id
ORDER BY mm.customer_id, s.order_date









