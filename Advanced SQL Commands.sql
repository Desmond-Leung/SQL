----------- ADVANCED SQL COMMANDS -----------

----------- TIMESTAMPS AND EXTRACT -----------

SHOW ALL;
SELECT NOW();
SELECT TIMEOFDAY();
SELECT CURRENT_TIME;
SELECT CURRENT_DATE;

SELECT * FROM payment;

SELECT EXTRACT(YEAR FROM payment_date) AS my_year
FROM payment;

SELECT AGE(payment_date)
FROM payment;

SELECT TO_CHAR(payment_date,'dd/MM/YYYY')
FROM payment;

-- During which months did payments occur? Format your answer to return the full month name
SELECT DISTINCT TO_CHAR(payment_date,'MONTH')
FROM payment;

-- How many payments occured on a Monday? (SUNDAY COUNTS AS 0)
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1;

----------- MATHEMATICAL FUNCTIONS AND OPERATORS -----------

SELECT ROUND(rental_rate/replacement_cost,2)*100 AS percent_cost
FROM film;

----------- STRING FUNCTIONS AND OPERATORS -----------

SELECT first_name || ' ' || last_name AS full_name
FROM customer;

SELECT LOWER(LEFT(first_name,1)) || LOWER(last_name) || '@gmail.com'
AS custom_email
FROM customer;

----------- SUBQUERY -----------

-- SUBQUERIES in parentheses are executed first, whose result becomes a part of the larger query
SELECT title,rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

SELECT film_id,title
FROM film
WHERE film_id IN
(SELECT inventory.film_id
FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY title;

SELECT first_name,last_name
FROM customer AS c
WHERE EXISTS 
(SELECT * FROM payment as p
WHERE p.customer_id = c.customer_id
AND amount > 11);

----------- SELF-JOIN -----------

-- Find all the pairs of films that have the same length
SELECT f1.title,f2.title,f1.length
FROM film AS f1
INNER JOIN film AS f2 ON
f1.film_id != f2.film_id
AND f1.length = f2.length;