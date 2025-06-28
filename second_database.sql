CREATE TABLE worker_data_az_new
LIKE worker_data_az;

INSERT worker_data_az_new
SELECT *
FROM worker_data_az;


SELECT CONCAT(name,' ',surname) AS fullname
FROM worker_data_az_new;

ALTER TABLE worker_data_az_new
ADD fullname VARCHAR(255);

UPDATE worker_data_az_new
SET fullname = CONCAT(name,' ',surname);

ALTER TABLE worker_data_az_new
DROP COLUMN name,
DROP COLUMN surname;

describe worker_data_az_new;

ALTER TABLE worker_data_az_new
CHANGE `salary (AZN)` `salary_azn` INT;

SELECT fullname, salary_azn
FROM worker_data_az_new
ORDER BY salary_azn DESC
LIMIT 5;

SELECT *
FROM worker_data_az_new
ORDER BY fullname DESC;

UPDATE worker_data_az_new
SET department = REGEXP_REPLACE(TRIM(department), '\\s+', ' ');

SELECT department, AVG(salary_azn)
FROM worker_data_az_new
GROUP BY department;

SELECT 
    MAX(salary_azn), 
    MIN(salary_azn) 
FROM worker_data_az_new
WHERE department = 'Marketing';

SELECT COUNT(*) 
FROM worker_data_az_new
WHERE salary_azn > 3000;

ALTER TABLE worker_data_az_new
CHANGE `worker level` `worker_level` TEXT;

SELECT COUNT(*)
FROM worker_data_az_new
WHERE worker_level = 'Senior';

UPDATE worker_data_az
SET email = LOWER(email);

UPDATE worker_data_az_new
SET email = REPLACE(email, 'yahoo.com', 'gmail.com');
