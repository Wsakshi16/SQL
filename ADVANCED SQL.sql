SHOW TIMEZONE
SHOW ALL
SELECT now()
SELECT TIMEOFDAY()
SELECT CURRENT_DATE

SELECT EXTRACT(YEAR FROM payment_date) AS myyear
FROM payment

SELECT EXTRACT(MONTH FROM payment_date) AS my_month
FROM payment

SELECT EXTRACT(QUARTER FROM payment_date) AS pay_month
FROM payment

SELECT AGE(payment_date)
FROM payment

SELECT TO_CHAR(payment_date,'')
FROM payment

SELECT TO_CHAR(payment_date,'MM/DD/YYYY')
FROM payment

SELECT TO_CHAR(payment_date,'MM-DD-YYYY')
FROM payment

SELECT DISTINCT(TO_CHAR(payment_date,'MONTH'))
FROM payment

----------------------------------------------------------------------
--DAY-6
----------------------------------------------------------------------
--Challenge:
SELECT COUNT(*) FROM payment
WHERE EXTRACT(dow FROM payment_date)=1


SELECT rental_rate/replacement_cost FROM film

--MATHEMATICAL OPERATOR
SELECT * FROM film

SELECT rental_duration + rental_rate FROM film;
SELECT rental_duration - rental_rate FROM film;
SELECT rental_duration * rental_rate FROM film;
SELECT ROUND(rental_duration / rental_rate,2) FROM film;
SELECT rental_duration % rental_rate FROM film;
SELECT ROUND(rental_duration ^ film_id,2) FROM film;

SELECT ROUND(rental_rate/replacement_cost,4)*100 FROM film;

SELECT ROUND(rental_rate/replacement_cost,4)*100 AS percent_cost FROM film;

SELECT 0.1 * replacement_cost AS deposit FROM film



SELECT * FROM customer
SELECT LENGTH(first_name) FROM customer

SELECT first_name || last_name FROM customer

SELECT first_name ||' '|| last_name FROM customer

SELECT first_name ||' '|| last_name AS full_name FROM customer

SELECT upper(first_name) ||' '|| upper(last_name) AS full_name FROM customer

SELECT LEFT(first_name,1) || last_name || '@gmail.com' FROM customer

SELECT LOWER(LEFT(first_name,1)) || LOWER(last_name) || '@gmail.com' FROM customer

SELECT LOWER(LEFT(first_name,1)) || LOWER(last_name) || '@gmail.com' 
AS customer_email FROM customer


SELECT * FROM film

SELECT AVG(rental_rate) FROM film;

SELECT title,rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

SELECT * FROM rental
SELECT * FROM inventory

SELECT * FROM rental
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30' 

SELECT inventory,film_id FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30' 

SELECT film_id,title
FROM film
WHERE film_id IN
(SELECT inventory.film_id FROM rental INNER JOIN inventory
ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')




