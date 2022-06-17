----------- GROUP BY STATEMENTS -----------

----------- AGGREGATION FUNCTIONS -----------

-- Most common include:
-- - AVG()
-- - COUNT()
-- - MAX()
-- - MIN()
-- - SUM()

-- Aggregate function calls happen only in the SELECT clause or HAVING clause

SELECT MIN(replacement_cost) FROM film;

-- ROUND() can be used to round the AVG() call 
SELECT ROUND(AVG(replacement_cost),2) FROM film;

----------- GROUP BY -----------

-- GROUP BY clause must appear right after a WHERE or FROM statement

-- The following gives the number of transactions per customer ID and the sum of the transactions
SELECT customer_id,COUNT(*),SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount);

SELECT customer_id,staff_id,SUM(amount) FROM payment GROUP BY staff_id,customer_id ORDER BY customer_id;

-- Dealing with timestamps
SELECT DATE(payment_date),SUM(amount) FROM payment GROUP BY DATE(payment_date) ORDER BY SUM(amount);


SELECT * FROM payment;
SELECT COUNT(*),staff_id FROM payment GROUP BY staff_id ORDER BY COUNT(payment_id) DESC;

SELECT * FROM film;
SELECT ROUND(AVG(replacement_cost),2),rating FROM film GROUP BY rating ORDER BY AVG(replacement_cost);

SELECT customer_id,SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 5;

----------- HAVING -----------

SELECT customer_id,SUM(amount) FROM payment GROUP BY customer_id HAVING SUM(amount) > 100;

SELECT COUNT(customer_id),store_id FROM customer GROUP BY store_id;
SELECT COUNT(customer_id),store_id FROM customer GROUP BY store_id HAVING COUNT(customer_id) > 300;

SELECT COUNT(payment_id),customer_id FROM payment GROUP BY customer_id HAVING COUNT(payment_id) >= 40;

SELECT SUM(amount),customer_id FROM payment WHERE staff_id = 2 GROUP BY customer_id HAVING SUM(amount) > 100;

----------- ASSESSMENT TEST 1 -----------

-- 1. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.
SELECT SUM(amount), customer_id FROM payment WHERE staff_id = 2 GROUP BY customer_id HAVING SUM(amount) >= 110;

-- 2. How many films begin with the letter J?
SELECT COUNT(*) FROM film WHERE title LIKE 'J%';

-- 3. What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
SELECT first_name,last_name FROM customer WHERE first_name LIKE 'E%' and address_id < 500 ORDER BY customer_id DESC LIMIT 1;