select * from Unicorn;0000000000


--*Data Cleaning*
CREATE TEMP TABLE unicorn_new AS
SELECT
    "Company",
    "Country",
    "City",
    "Industry",
    "Select Inverstors" as "Select Investors",
    "Financial Stage", 
    CASE
        WHEN "Valuation ($B)" = 'None' THEN '0'
        WHEN "Valuation ($B)" LIKE '$%' THEN TRIM('$' from "Valuation ($B)")
        ELSE "Valuation ($B)"
    END AS "Valuation($B)",
    CASE
        WHEN "Total Raised" = 'None' THEN '0'
        WHEN "Total Raised" LIKE '$%' THEN TRIM('$' from "Total Raised")
        WHEN "Total Raised" LIKE '%B' THEN 
            TO_CHAR(CAST(REPLACE("Total Raised", 'B', '') AS DECIMAL(20, 2)) * 1000000000, 'FM999,999,999,999.00')
        WHEN "Total Raised" LIKE '%M' THEN
            TO_CHAR(CAST(REPLACE("Total Raised", 'M', '') AS DECIMAL(20, 2)) * 1000000, 'FM999,999,999.00')
        --ELSE "Total Raised" -- Handle other cases, if any
    END AS "Total_Raised",
    CASE
        WHEN "Portfolio Exits" = 'None' THEN '0'
        ELSE "Portfolio Exits"
    END AS "Portfolio Exits",
    CASE
        WHEN "Founded Year" = 'None' THEN '0'
        ELSE "Founded Year"
    END AS "Founded Year",
    CASE
        WHEN "Deal Terms" = 'None' THEN '0'
        ELSE "Deal Terms"
    END AS "Deal_Terms",
    CASE
        WHEN "Investors Count" = 'None' THEN '0'
        ELSE "Investors Count"
    END AS "Investors_Count",
    CASE
        WHEN "Date Joined" ~ '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' THEN "Date Joined"
        WHEN "Date Joined" ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$' THEN TO_CHAR(TO_DATE("Date Joined", 'MM/DD/YYYY'), 'YYYY-MM-DD')
    END AS "Cleaned_Date"
FROM public."Unicorn";

--*Change data type*
Alter table unicorn_new
ALTER COLUMN "Valuation($B)" TYPE numeric USING "Valuation($B)"::numeric,
ALTER COLUMN "Deal_Terms" TYPE numeric USING "Deal_Terms"::numeric,
ALTER COLUMN "Investors_Count" TYPE numeric USING "Investors_Count"::numeric, 
ALTER COLUMN "Founded Year" TYPE numeric USING "Founded Year"::numeric, 
ALTER COLUMN "Cleaned_Date" TYPE Date USING "Cleaned_Date"::Date

SELECT * FROM unicorn_new;
DROP TABLE unicorn_new;


--1. What unicorn companies are located in germany
Select "Company", "Valuation($B)"
FROM unicorn_new
where "Country" = 'Germany'
order by "Valuation($B)" desc

--2. What is most popular industries that are unicorn companies
Select "Industry" Industry, Count("Industry") no_industry
from unicorn_new
group by Industry
order by no_industry desc
limit 5

--3. What is the highest valuation among the listed companies?
Select "Company" Company, max("Valuation($B)") max_valuation
FROM unicorn_new
group by Company 
order by max_valuation desc
Limit 1

--4. How many companies became unicorn after year 2000 and what are the industries
Select "Company" Company, "Industry" Industry, extract(Year from "Cleaned_Date") 
FROM unicorn_new
where extract(Year from "Cleaned_Date") > 2020
group by extract(Year from "Cleaned_Date"), Company, industry
order by extract(Year from "Cleaned_Date") asc

--5. What country has the highest number of unicorn companies
Select "Country", count("Country") count_com
FROM unicorn_new
group by "Country"
order by count_com desc
Limit 5

---6. how many companies are located in Munich, Germany and what is the valuation
Select distinct("Company"), "Industry", "Country", "City", "Valuation($B)"
FROM unicorn_new
where "Country" = 'Germany' and "City" = 'Munich'
order by "Valuation($B)" desc

--7. how many companies where founded before 2000
Select count(distinct "Company")
FROM unicorn_new
where "Founded Year" < 2000;


