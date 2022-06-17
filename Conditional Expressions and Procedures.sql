----------- CONDITIONAL EXPRESSIONS AND PROCEDURES -----------

----------- CASE -----------

SELECT * FROM customer;

-- General case statement (more flexible)
SELECT customer_id,
CASE
WHEN (customer_id <= 100) THEN 'Premium'
WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
ELSE 'Normal'
END AS customer_class
FROM customer;

-- Case expression statement (less flexible but faster to type out)
SELECT customer_id,
CASE customer_id
WHEN 2 THEN 'Winner'
WHEN 5 THEN 'Second Place'
ELSE 'Normal'
END AS raffle_results
FROM customer;

SELECT * FROM film;

-- How many rental rates are 0.99, 2.99 and 4.99?
SELECT
SUM(CASE rental_rate
   WHEN 0.99 THEN 1
   ELSE 0
END) AS bargains,
SUM(CASE rental_rate
   WHEN 2.99 THEN 1
   ELSE 0
END) AS regular,
SUM(CASE rental_rate
   WHEN 4.99 THEN 1
   ELSE 0
END) AS premium
FROM film;

SELECT * FROM film;

-- How many R, PG and PG-13 rated movies are there?
SELECT
SUM(CASE rating
   WHEN 'R' THEN 1
   ELSE 0
END) AS r,
SUM(CASE rating
   WHEN 'PG' THEN 1
   ELSE 0
END) AS pg,
SUM(CASE rating
   WHEN 'PG-13' THEN 1
   ELSE 0
END) AS pg13
FROM film;

----------- COALESCE -----------

-- Used to replace null values with a value so numeric operations can be performed.
-- For example:
-- SELECT item,(price - COALESCE(discount,0))
-- AS final_price FROM table

----------- CAST -----------

SELECT CAST('5' AS INTEGER) AS new_int;

SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental;

----------- VIEW -----------

CREATE VIEW customer_info AS
SELECT first_name,last_name,address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;

-- CREATE OR REPLACE VIEW customer_info AS 
-- SELECT first_name,last_name,address,district FROM customer
-- INNER JOIN address
-- ON customer.address_id = address.address_id;

-- DROP VIEW IF EXISTS customer_info;

-- ALTER VIEW customer_info RENAME to c_info;
