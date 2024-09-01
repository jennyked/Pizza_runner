select * from weekly_sales;

Create VIEW Sales as (
Select week_date,
Extract(Day from week_date) as Day,
Extract(WEEK from week_date) as WEEK,
Extract(Month from week_date) as Month,
Extract(Year from week_date) as Year,
region, platform, segment,
Case 
when segment like '%1%' then 'Young adults'
when segment like '%2%' then 'Middle Aged'
when segment like '%3%' or segment like '%4%' then 'Retirees'
when segment = 'null' then 'Unknown'
end as age_band, 
Case 
when segment like '%C%' then 'Couples'
when segment like '%F%' then 'families'
when segment = 'null' then 'Unknown'
end as demographics,
transactions, sales
from weekly_sales
);

Select * from weekly_sales
limit 5

drop VIEW sales
Select * from Sales;


--questions
--1.What day of the week is used for each week_date value?
select distinct (TO_CHAR(week_date, 'day')) from Sales;

--2. What range of week numbers are missing from the dataset?
Select * from generate_series(1,53) as full_range
Where full_range not in (
Select DISTINCT(Sales.WEEK) from sales
)
order by full_range

--3. How many total transactions were there for each year in the dataset?
Select sum(transactions) as total_transactions, sales.YEAR as year
from Sales
group by year

--4. What is the total sales for each region for each month?
Select region, TO_CHAR(week_date, 'Month, YYYY'), sum(sales) as total_sales
from Sales
group by region, TO_CHAR(week_date, 'Month, YYYY')
order by region, TO_CHAR(week_date, 'Month, YYYY')

--5. What is the total count of transactions for each platform
Select platform, sum(transactions) as Transactions
from sales
group by platform
order by Transactions



--8. Which age_band and demographic values contribute the most to Retail sales?
With cte as (
Select * from sales
Where platform = 'Retail'
)
Select cte.age_band, cte.demographics, sum(sales) sale
from cte
group by age_band, demographics
order by  sale DESC


--9. Can we use the avg_transaction column to find the average transaction size for each year for Retail vs Shopify? If not - how would you calculate it instead?
Select platform, avg(transactions) as avg_transaction, extract(year from week_date) as year
from sales
GROUP by platform, extract(year from week_date)