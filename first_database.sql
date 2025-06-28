CREATE DATABASE sql_ilk_praktika;
USE sql_ilk_praktika;
CREATE TABLE books (
    book_id INT,
    book_name VARCHAR(80) UNIQUE,
    book_price DECIMAL(6,2),
    author VARCHAR(100) UNIQUE,
    PRIMARY KEY (book_price)
);

INSERT INTO books (book_id, book_name, book_price, author)
VALUES 
(0101, 'Alice in Wonderland', 20.40, 'Lewis Carrol'),
(0202, 'David Copperfield', 15.50, 'Charles Dickens'),
(0303, 'Animal Farm', 18.80, 'George Orwell'),
(0404, 'Christine', 25.50, 'Stephen King'),
(0505, 'French Revolution', 10.30, 'Thomas Carlyle');

ALTER TABLE books
DROP PRIMARY KEY;

ALTER TABLE books
ADD PRIMARY KEY (book_id);

ALTER TABLE books
ADD COLUMN print_year DATE,
ADD COLUMN description TEXT;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100),
    birth_day DATE,
    book_count INT,
    FOREIGN KEY (author_name) REFERENCES books(author)
);

INSERT INTO authors (author_name, birth_day, book_count) VALUES
('Lewis Carrol', '1980-01-15', 5),
('Charles Dickens', '1975-11-23', 3),
('George Orwell', '1990-06-30', 7),
('Stephen King', '1985-09-05', 2),
(''Thomas Carlyle', '1992-04-11', 4);
