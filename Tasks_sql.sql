Select * from contacts;
Select * from departments;
Select * from employeechurn;
Select * from employees;
Select * from positions;
Select * from salaries;

--HR ANALYSIS
--Task 1: Find the oldest employee in each department. 
WITH cte AS (
    SELECT 
        e.first_name, 
        e.last_name, 
        e.age, 
        d.department_name,
        ROW_NUMBER() OVER (PARTITION BY d.department_name ORDER BY e.age DESC) AS row_numb
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    WHERE e.employee_id NOT IN (
        SELECT employee_id FROM employeechurn
    )
)
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name, 
    department_name, 
    age
FROM cte
WHERE row_numb = 1;



--TASK 2: Find the employees who resigned from the company in the last 4 months.
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name, 
    churn_date
FROM employees e
JOIN employeechurn ec ON e.employee_id = ec.employee_id
WHERE churn_date >= (current_date - interval '4 months')
order by extract(month from churn_date) desc;



--TASK 3: What is the percent churn amongst males and females?
 SELECT 
    gender,
    COUNT(*) AS total_count,
    concat(round(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employeechurn), 1), '%') AS percent_churn
FROM employeechurn
GROUP BY gender;


--Task 4: Find the average number of years that the employees stay in each department before they churn.
select department_name, round(avg(EXTRACT(year from churn_date)-EXTRACT(year from date_joined))) avg_year
from departments d
left join employees e on d.department_id=e.department_id
join employeechurn ec on ec.employee_id=e.employee_id
group by department_name
order by avg_year desc



--Task 5: Which department has the highest churn rate (in percentage)
WITH department_churn AS (
    SELECT 
        d.department_name,
        COUNT(ec.employee_id) AS churned_employees,
        concat(round((COUNT(ec.employee_id) * 100.0 / (select count(*) from employeechurn))), '%') AS churn_rate
    FROM departments d
    JOIN employees e ON e.department_id = d.department_id
   right JOIN employeechurn ec ON ec.employee_id = e.employee_id
    GROUP BY d.department_name
)
SELECT 
    department_name,
    churned_employees,
    churn_rate
FROM department_churn
ORDER BY churn_rate DESC

select first_name, department_name, churn_date
FROM employees e
JOIN departments d ON e.department_id = d.department_id
left JOIN employeechurn ec ON ec.employee_id = e.employee_id

select first_name, department_name, churn_date
FROM employees e
JOIN departments d ON e.department_id = d.department_id
right JOIN employeechurn ec ON ec.employee_id = e.employee_id


