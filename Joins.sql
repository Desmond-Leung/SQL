----------- JOINS -----------

-- Joins allow us to combine information from multiple tables

----------- AS STATEMENT -----------

-- The AS operator is executed at the END of a query. Used to give a result an alias. These aliases are assigned at the very END
-- so you cannot use them to filter by.

SELECT COUNT(amount) AS num_transactions FROM payment;

SELECT customer_id,SUM(amount) AS total_spent FROM payment GROUP BY customer_id;

SELECT customer_id,SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT customer_id,amount AS new_name
FROM payment
WHERE amount > 2;

----------- INNER JOINS -----------

-- An INNER JOIN will result with the set of records that match in both tables

SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

SELECT payment_id,payment.customer_id,first_name
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

----------- OUTER JOINS -----------

-- These allow us to specify how to deal with values present only in one of the tables being joined
-- You can add a where statement AFTER the join for further filtering

SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.payment_id IS null;

----------- LEFT OUTER JOIN -----------

-- A LEFT OUTER JOIN results in the set of records that are in the left table, 
-- if there is no match with the right table, the results are null

-- ORDER MATTERS FOR A LEFT OUTER JOIN. The table selected from the first FROM statement is the one that the query will return. 
-- Information exclusive to the left table or information included in BOTH tables. No information exclusive to the right table is 
-- returned.

SELECT film.film_id,title,inventory_id,store_id
FROM film
LEFT OUTER JOIN inventory 
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS null;

----------- RIGHT JOINS -----------

-- Essentially the same as a LEFT OUTER JOIN but with the tables flipped

----------- UNION -----------

-- Used to combine the result-set of two or more SELECT statement. Basically serves to concatenate two results together

----------- JOIN CHALLENGE TASKS -----------

-- What are the emails of the customers who live in California?
SELECT email,district
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'California';

-- Get a list of all the movies Nick Wahlberg has been in (TWO JOINS IN ONE QUERY)
SELECT title,first_name,last_name
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';