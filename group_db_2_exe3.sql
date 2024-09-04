Create table customer_table(
customer_id Serial Primary key,
customer_name varchar(50),
customer_address varchar(50),
customer_email varchar(150));

INSERT INTO customer_table (customer_id,customer_name,customer_address,customer_email) 
VALUES (1,'John Smith','123 Main St','johnsmith@gmail.com'),
(6,'Jane Doe','456 Main St','jane@gmail.com'),
(2,'Jane Doe','456 Park Ave','janedoe@gmail.com'),
(3,'Bob Johnson','789 Elm St','bobjohnson@gmail.com'),
(4,'Okafor Ikechukwu','92 Ikenga St','okafor@gmail.com'),
(5,'Jeffrey Godson','083 john St','jef@gmail.com');