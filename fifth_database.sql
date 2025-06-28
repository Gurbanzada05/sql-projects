CREATE DATABASE sql_praktika_5;
USE sql_praktika_5;

SELECT *
FROM customers
WHERE registration_date > '2023-01-01';

SELECT title, price
FROM books
ORDER BY price DESC
LIMIT 10;

SELECT title
FROM books
WHERE title LIKE '%girl%';

SELECT 
       o.order_id,
       o.total_amount,
       c.name
FROM orders o
LEFT JOIN customers c 
ON o.customer_id = c.customer_id;

SELECT 
       b.title, 
       b.author, 
       SUM(oi.quantity) AS sum_quantity
FROM order_items oi
LEFT JOIN books b 
ON oi.book_id = b.book_id
GROUP BY b.title, b.author;


SELECT 
	  c.name, 
      b.title
FROM orders o
LEFT JOIN customers c 
ON o.customer_id = c.customer_id
LEFT JOIN order_items oi 
ON o.order_id = oi.order_id
LEFT JOIN books b 
ON oi.book_id = b.book_id;

SELECT 
      b.title,
      o.total_amount
FROM orders o
LEFT JOIN order_items oi
ON o.order_id = oi.order_id
LEFT JOIN books b
ON oi.book_id = b.book_id;

UPDATE orders
SET order_date = STR_TO_DATE(order_date, '%d/%m/%Y');

ALTER TABLE orders
MODIFY COLUMN order_date DATE;

SELECT 
       DATE_FORMAT(order_date, '%Y/%m') AS month,
       SUM(total_amount) AS total_amount
FROM orders
GROUP BY month
ORDER BY month;
SELECT 
      month, 
      genre, 
      total_sold
FROM (
    SELECT 
        month,
        genre,
        total_sold,
        RANK() OVER (PARTITION BY month ORDER BY total_sold) AS genre_rank
    FROM (
        SELECT 
            DATE_FORMAT(o.order_date, '%Y/%m') AS month,
            b.genre, 
            SUM(oi.quantity) AS total_sold
        FROM orders o
        LEFT JOIN order_items oi 
        ON o.order_id = oi.order_id
        LEFT JOIN books b 
        ON oi.book_id = b.book_id
        GROUP BY DATE_FORMAT(o.order_date, '%Y/%m'), b.genre
    ) AS monthly_sales
) AS ranked_sales
WHERE genre_rank = 1;

SELECT title, total_sold
FROM (
    SELECT 
          b.title, 
          SUM(oi.quantity) AS total_sold
    FROM order_items oi
    LEFT JOIN books b 
    ON oi.book_id = b.book_id
    GROUP BY b.title
) AS book_sales
WHERE total_sold > (
    SELECT AVG(total_quantity)
    FROM (
        SELECT SUM(quantity) AS total_quantity
        FROM order_items
        GROUP BY book_id
    ) AS average_sales
);

SELECT name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY total_amount DESC
LIMIT 10;

UPDATE customers
SET registration_date = STR_TO_DATE(registration_date, '%d/%m/%Y');

ALTER TABLE customers
MODIFY COLUMN registration_date DATE;

SELECT 
       DATE_FORMAT(registration_date, '%Y/%m') AS month,
       COUNT(customer_id) AS new_customers
FROM customers
GROUP BY month
ORDER BY month;
