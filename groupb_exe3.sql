
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

select * from customer_table


drop table orders_table;
Create table orders_table(
order_id Serial Primary key,
customer_id INT,
order_quantity INT,
order_date date,
Foreign key(customer_id) references customer_table(customer_id));
select * from orders_table

INSERT INTO orders_table (order_id,customer_id,order_quantity,order_date) 
VALUES 
(1,1,2,'2024-07-01'),
(2,2,1,'2022-08-13'),
(3,3,4,'2022-05-01'),
(4,5,2,'2023-04-11'),
(5,3,2,'2022-01-01'),
(6,4,1,'2022-06-01'),
(7,6,6,'2025-07-21'),
(8,5,3,'2022-01-03'),
(9,4,3,'2022-05-01'),
(10,2,3,'2022-03-17'),
(11,1,2,'2022-07-08');
Select * from orders_table;

CREATE TABLE restaurant_orders (
    restaurant_id serial Primary key,
    order_id INT,
    price DECIMAL(4, 2),
    restaurant_name VARCHAR(100),
    restaurant_menu VARCHAR(100),
    restaurant_address_line1 VARCHAR(100),
    restaurant_address_line2 VARCHAR(100),
    restaurant_city VARCHAR(100),
    restaurant_state VARCHAR(50),
    restaurant_zip_code INT,
    Foreign key(order_id) references orders_table(order_id));
Select * from restaurant_orders;


INSERT INTO restaurant_orders (
    restaurant_id, order_id, price, restaurant_name, restaurant_menu,
    restaurant_address_line1, restaurant_address_line2, restaurant_city,
    restaurant_state, restaurant_zip_code)
VALUES
    (1, 2, 50, 'Italiano Pizza', 'Tuner fish pizza', '123 Main St', NULL, 'New York City', 'New York', '10001'),
    (2, 1, 25.5, 'Italiano Pizza', 'Margherita Pizza', '123 Main St', NULL, 'New York City', 'New York', '10001'),
    (3, 4, 12.75, 'Italiano Pizza', 'Mushroom pizza', '123 Main St', NULL, 'New York City', 'New York', '10001'),
    (4, 4, 12.75, 'Italiano Pizza', 'Margherita Pizza', '123 Main St', NULL, 'New York City', 'New York', '10001'),
    (5, 2, 13.49, 'Breakfast Café', 'Black coffee', '456 Elm St', NULL, 'Boston', 'Massachusetts', '2110'),
    (6, 2, 13.49, 'Breakfast Café', 'Sausage', '456 Elm St', NULL, 'Boston', 'Massachusetts', '2110'),
    (7, 2, 4.99, 'Breakfast Café', 'Macaroni', '456 Elm St', NULL, 'Boston', 'Massachusetts', '2110'),
    (8, 2, 4.99, 'Breakfast Café', 'Black coffee', '456 Elm St', NULL, 'Boston', 'Massachusetts', '2110'),
    (9, 1, 10.99, 'Breakfast Café', 'Oxtail', '456 Elm St', NULL, 'Boston', 'Massachusetts', '2110'),
    (10, 6, 4.99, 'Breakfast Café', 'Custard', '456 Elm St', NULL, 'Boston', 'Massachusetts', '2110'),
    (11, 6, 4.99, 'Breakfast Café', 'Beans', '456 Elm St', NULL, 'Boston', 'Massachusetts', '2110'),
    (12, 3, 25.78, 'Burger King', 'Burger', '336 Main St', NULL, 'New York City', 'New York', '13201'),
    (13, 3, 5.8, 'Burger King', 'Cola', '336 Main St', NULL, 'New York City', 'New York', '13201'),
    (14, 3, 3.78, 'Burger King', 'Chicken', '336 Main St', NULL, 'New York City', 'New York', '13201'),
    (15, 3, 4.65, 'Burger King', 'Cheese Burger', '336 Main St', NULL, 'New York City', 'New York', '13201'),
    (16, 3, 8.45, 'Burger King', 'Fanta', '336 Main St', NULL, 'New York City', 'New York', '13201'),
    (17, 3, 10.75, 'Burger King', 'Chicken', '336 Main St', NULL, 'New York City', 'New York', '13201'),
    (18, 3, 15, 'Afro kitchen', 'Abacha', '076 Hamburg St', NULL, 'Hamburg City', 'Hamburg', '10032'),
    (19, 3, 18, 'Afro kitchen', 'Nkwobi', '076 Hamburg St', NULL, 'Hamburg City', 'Hamburg', '10032'),
    (20, 3, 13, 'Afro kitchen', 'Oha Soup', '076 Hamburg St', NULL, 'Hamburg City', 'Hamburg', '10032'),
    (21, 2, 50, 'Afro foods', 'Ugba', '123 Hamburg St', NULL, 'Hamburg City', 'Hamburg', '10041');
select*from restaurant_orders;






