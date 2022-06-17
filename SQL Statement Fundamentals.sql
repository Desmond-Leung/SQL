----------- SQL STATEMENT FUNDAMENTALS -----------

----------- SELECT AND SELECT DISTINCT -----------

SELECT * FROM film;
SELECT first_name,last_name FROM actor;

-- * denotes all columns from the table 
-- Keywords are typically written in all caps

SELECT first_name,last_name,email FROM customer;

-- SELECT DISTINCT only returns distinct values from a column

SELECT DISTINCT release_year FROM film;
-- Can also use parentheses 
SELECT DISTINCT(rental_rate) FROM film;

SELECT DISTINCT(rating) FROM film;

----------- COUNT -----------

-- Notice parentheses structure. We are calling count on the result of distinct name
SELECT COUNT(DISTINCT rating) FROM film;

-- The following line gives the number of rows in the table
SELECT COUNT(*) FROM payment;

SELECT COUNT(DISTINCT amount) FROM payment;

----------- SELECT WHERE -----------

SELECT * FROM customer WHERE first_name = 'Jared';

SELECT * FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';
SELECT COUNT(title) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';

SELECT COUNT(*) FROM film WHERE rating = 'R' OR rating = 'PG-13';

SELECT * from film WHERE rating != 'R';

SELECT email FROM customer WHERE first_name = 'Nancy' AND last_name = 'Thomas';

SELECT description FROM film WHERE title = 'Outlaw Hanky';

SELECT phone FROM address WHERE address = '259 Ipoh Drive';

----------- ORDER BY -----------

-- After ordering by store ID, THEN order alphabetically for each store ID
SELECT store_id,first_name,last_name FROM customer ORDER BY store_id,first_name ASC;

----------- LIMIT -----------

-- Specifies how many rows to report back at the end
SELECT * FROM payment WHERE amount != 0.00 ORDER BY payment_date DESC LIMIT 10;

SELECT customer_id FROM payment WHERE amount !=0.00 ORDER BY payment_date ASC LIMIT 10;

SELECT title,length FROM film ORDER BY length ASC LIMIT 5;

SELECT COUNT(title) FROM film WHERE length <= 50;

----------- BETWEEN -----------

-- NOTE that the upper and lower bounds ARE included in the result when used in this context
SELECT DISTINCT(amount) FROM payment;
SELECT COUNT(*) FROM payment WHERE amount BETWEEN 8 AND 9;
SELECT COUNT(*) FROM payment WHERE amount NOT BETWEEN 8 AND 9;

-- When used in timestamps, format is YEAR-MONTH-DAY:
-- NOTE that BETWEEN '2007-02-01' AND '2007-02-15' will NOT include any transactions on '2007-02-15'
SELECT * FROM payment WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

----------- IN -----------

SELECT DISTINCT(amount) FROM payment ORDER BY amount;
SELECT COUNT(*) FROM payment WHERE amount IN (0.99,1.98,1.99);
SELECT COUNT(*) FROM payment WHERE amount NOT IN (0.99,1.98,1.99);

SELECT * FROM customer WHERE first_name IN ('John','Jake','Julie'); 

----------- LIKE AND ILIKE -----------

-- % is used for a sequence of characters (Note this sequence can be no characters)
-- _ is used for a single character

SELECT COUNT(*) FROM customer WHERE first_name LIKE 'J%';

SELECT * FROM customer WHERE first_name LIKE '%er%';

SELECT * FROM customer WHERE first_name LIKE '_her%';

SELECT * FROM customer WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%' ORDER BY last_name;

----------- CHALLENGE -----------

-- How many payment transactions were greater than $5.00?
SELECT COUNT(amount) FROM payment WHERE amount > 5;

-- How many actors have a first name that begins with the letter 'P'?
SELECT COUNT(first_name) FROM actor WHERE first_name LIKE 'P%';

-- How many unique districts are our customers from?
SELECT COUNT(DISTINCT district) FROM address;

-- Retrieve the list of names for those distinct districts from the previous question
SELECT DISTINCT district FROM address;

-- How many films have a rating of 'R' and a replacement cost between $5 and $15?
SELECT COUNT(*) FROM film WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

-- How many films have the word 'Truman' somewhere in the title?
SELECT COUNT(*) FROM film WHERE title LIKE '%Truman%';