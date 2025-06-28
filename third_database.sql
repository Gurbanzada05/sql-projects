CREATE DATABASE sql_praktika_4;
USE sql_praktika_4;

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
name VARCHAR(30),
city VARCHAR(30)
);

INSERT INTO customers (customer_id,name,city) 
VALUES
(1, 'Kamal', 'Bakı'),
(2, 'Aydan', 'Quba'),
(3, 'Əşrəf', 'Salyan'),
(4, 'Ənvər', 'Masallı'),
(5, 'Əli', 'Tovuz'),
(6, 'Aysun', 'Gəncə'),
(7, 'Nailə', 'Sumqayıt'),
(8, 'Samir', 'Mingəçevir'),
(9, 'Rəşad', 'Qəbələ'),
(10, 'Arif', 'Şəki');

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id, order_date, amount) 
VALUES
(101, 1, '2024-01-10', 500),
(102, 1, '2024-02-12', 300),
(103, 2, '2024-01-15', 450),
(104, 3, '2024-03-01', 700),
(105, 5, '2024-04-01', 800),
(106, 5, '2024-04-15', 300),
(107, 6, '2024-02-20', 200),
(108, 7, '2024-03-10', 600);

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO products (product_id, name, price) 
VALUES
(1, 'Laptop', 1000),
(2, 'Smartphone', 800),
(3, 'Tablet', 600),
(4, 'Smartwatch', 500),
(5, 'Headphones', 350);

SELECT name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
);

SELECT name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

SELECT name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

SELECT name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE amount > 400
);

SELECT name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE amount > (SELECT AVG(amount) FROM orders)
);

SELECT name
FROM customers c
WHERE customer_id IN (
    SELECT customer_id
    FROM orders o
    WHERE o.amount = (SELECT MAX(amount) FROM orders)
);

SELECT name
FROM customers c
WHERE customer_id IN (
    SELECT customer_id
    FROM orders o
    WHERE o.amount = (SELECT MIN(amount) FROM orders)
);













