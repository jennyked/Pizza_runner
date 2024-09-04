CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees (employee_id, first_name, last_name, department_id)
VALUES 
    (1, 'John', 'Doe', 1),
    (2, 'Jane', 'Smith', 1),
    (3, 'Bob', 'Johnson', 2),
    (4, 'Alice', 'Williams', 2),
    (5, 'Jim', 'Brown', 3);


	CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name)
VALUES 
    (1, 'Sales'),
    (2, 'Marketing'),
    (3, 'Finance');

	WITH EmployeeCount (DepartmentID, TotalEmployees) AS (
    SELECT department_id, COUNT(*) 
    FROM employees 
    GROUP BY department_id
)
SELECT d.department_name, ec.TotalEmployees 
FROM EmployeeCount ec
JOIN departments d ON d.department_id = ec.DepartmentID;
