select * from film
select * from actor`
select * from city
SELECT COUNT(category_id) FROM film_category

--GET THE MAXIMUM payment got from rental
SELECT max(amount) FROM payment

SELECT first_name,last_name FROM actor
WHERE first_name = 'Ed' AND last_name = 'Chase';

--this is comment

SELECT  * FROM film_category
SELECT * FROM address
WHERE  district = 'Nagasaki' AND city_id = 463

-------------------------------------------------------------
--Day-2
-------------------------------------------------------------
SELECT * FROM actor
SELECT first_name,last_name,email FROM customer;
SELECT DISTINCT first_name FROM customer;
SELECT * FROM film
SELECT DISTINCT release_year FROM film;
SELECT DISTINCT rating FROM film;
SELECT COUNT rating FROM film;

SELECT * FROM payment
SELECT DISTINCT payment_id FROM payment
SELECT COUNT(*) FROM payment
SELECT COUNT(amount) FROM payment
SELECT amount FROM payment;
SELECT DISTINCT amount FROM payment;
SELECT COUNT(DISTINCT amount) FROM payment


SELECT name,choice FROM table
WHERE name = 'David'

SELECT * FROM film 
WHERE title = 'Airport Pollock'

SELECT * FROM customer
WHERE first_name = 'Mary' and last_name = 'Smith'
WHERE first_name = 'Mary' or last_name = 'Johnson'

SELECT * FROM film
WHERE rental_rate > 4;

SELECT * FROM film
WHERE rental_rate != 4.99;


---------------------------------------------------------------------
--DAY-3
---------------------------------------------------------------------
--Morning
--logical operators
--AND
--SELECT firstName, lastName
--FROM users
--WHERE firstName='mo' AND lastName=''

--OR
--SELECT firstName, lastName
--FROM users
--WHERE firstName='mo' AND lastName='andheri'

--NOT
--SELECT firstName, lastName
--FROM users
--WHERE NOT firstName='mo'


SELECT * FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating='R';

SELECT title FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating='R';

SELECT COUNT(title) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating='R';

SELECT COUNT(*) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating='R';

SELECT COUNT(*) FROM film
WHERE rating = 'R' OR rating='PG-13'

SELECT * FROM film 
WHERE rating != 'R';

SELECT * FROM film 
WHERE rating <> 'R';

SELECT * FROM film 
WHERE replacement_cost <= 10;

SELECT email FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

--Challenge No:2
--A customer wants to know what the movie "Outlaw Hanky" is about.
--Could you give them the description for the movie "Outlaw Hanky"?

SELECT description FROM film
WHERE title = 'Outlaw Hanky';

--CHALLENGE NO:3
--A costomer is late on their movie return, find the phone number of 
--customer having adress '259 Ipoh Drive'
SELECT * FROM address
SELECT phone FROM address
WHERE address = '259 Ipoh Drive';


--AFTERNOON

--ORDER BY
SELECT * FROM CUSTOMER
ORDER BY FIRST_NAME;

SELECT * FROM CUSTOMER
ORDER BY FIRST_NAME DESC;

SELECT * FROM CUSTOMER
ORDER BY STORE_ID;

SELECT STORE_ID,FIRST_NAME,LAST_NAME FROM CUSTOMER
ORDER BY STORE_ID,FIRST_NAME 

SELECT STORE_ID,FIRST_NAME,LAST_NAME FROM CUSTOMER
ORDER BY STORE_ID DESC,FIRST_NAME ASC 

SELECT ADDRESS_ID,FIRST_NAME,LAST_NAME FROM CUSTOMER
ORDER BY ADDRESS_ID DESC,FIRST_NAME ASC 

--LIMIT
SELECT * FROM PAYMENT
ORDER BY PAYMENT_DATE DESC
LIMIT 5

SELECT * FROM PAYMENT
WHERE AMOUNT!=0.00
ORDER BY PAYMENT_DATE DESC
LIMIT 5

SELECT CUSTOMER_ID FROM PAYMENT
ORDER BY PAYMENT_DATE ASC
LIMIT 10

SELECT TITLE,LENGTH FROM FILM
ORDER BY LENGTH ASC
LIMIT 5

SELECT COUNT(TITLE) FROM FILM
WHERE LENGTH<=50

--BETWEEN
SELECT * FROM PAYMENT
WHERE AMOUNT BETWEEN 8 AND 9

SELECT COUNT(*) FROM PAYMENT
WHERE AMOUNT BETWEEN 8 AND 9

SELECT COUNT(*) FROM PAYMENT
WHERE AMOUNT NOT BETWEEN 8 AND 9

SELECT * FROM PAYMENT
WHERE PAYMENT_DATE BETWEEN '2007-02-01' AND '2007-02-15'

--IN
SELECT * FROM PAYMENT
WHERE AMOUNT IN(0.99,1.98,1.99)

SELECT COUNT(*) FROM PAYMENT
WHERE AMOUNT IN(0.99,1.98,1.99)

SELECT COUNT(*) FROM PAYMENT
WHERE AMOUNT NOT IN(0.99,1.98,1.99)

SELECT * FROM CUSTOMER
WHERE FIRST_NAME IN('John','Jake','Julie')

SELECT * FROM CUSTOMER
WHERE FIRST_NAME NOT IN('John','Jake','Julie')

--LIKE
--CASE SENSITIVE
--TO AVOID CASE USE ILIKE
SELECT * FROM CUSTOMER
WHERE FIRST_NAME LIKE 'J%'

SELECT * FROM CUSTOMER
WHERE FIRST_NAME LIKE 'j%'

SELECT * FROM CUSTOMER
WHERE FIRST_NAME ILIKE 'j%'

SELECT count(*) FROM CUSTOMER
WHERE FIRST_NAME LIKE 'J%'

SELECT * FROM CUSTOMER
WHERE FIRST_NAME LIKE 'J%' AND LAST_NAME LIKE 'S%'

SELECT * FROM CUSTOMER
WHERE FIRST_NAME ILIKE 'j%' AND LAST_NAME ILIKE 's%'

SELECT * FROM CUSTOMER
WHERE FIRST_NAME LIKE '%er%'

SELECT * FROM CUSTOMER
WHERE FIRST_NAME LIKE '%her%'

SELECT * FROM CUSTOMER
WHERE FIRST_NAME LIKE '_her%'

SELECT * FROM CUSTOMER
WHERE FIRST_NAME LIKE 'A%'

SELECT * FROM CUSTOMER
WHERE FIRST_NAME LIKE 'A%'
ORDER BY LAST_NAME

SELECT * FROM CUSTOMER
WHERE FIRST_NAME LIKE 'A%' AND LAST_NAME NOT LIKE 'B%'
ORDER BY LAST_NAME

--ASSIGNMENT
SELECT COUNT(AMOUNT) FROM PAYMENT
WHERE AMOUNT>5

SELECT * FROM actor
WHERE FIRST_NAME LIKE 'P%'


----------------------------------------------------------------------------
--Day-4
----------------------------------------------------------------------------
--Morning

--Challenge: How many unique districts are our  customers from?
SELECT DISTINCT(count(district)) from address;
 
SELECT * FROM address


--Challenge : Retrive the list for those distinct districts from 
--            the previous question.

SELECT DISTINCT(district) FROM address;

--Challenge: How many films have rating R and a replacement cost between $5 and $15?
SELECT COUNT(*) FROM film
WHERE rating='R'
AND replacement_cost BETWEEN 5 AND 15;

--Challenge: How many films have the word Truman somewhere in the title?
SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%'

--Aggregate Functions
--AVG(): Returns a floating point value many decimal places(eg. 2.343554.....)
--       You can use ROUND(AVG(name),2)
--       COUNT() simply returns the number of rows, which means by 
--       convention we just use COUNT(*)

SELECT * FROM film;
SELECT MIN(replacement_cost) FROM film;

SELECT MAX(replacement_cost),MIN(replacement_cost) FROM film;

SELECT AVG(replacement_cost) FROM film;

--USING ROUND()
SELECT ROUND(AVG(replacement_cost),2) FROM film;
SELECT ROUND(AVG(replacement_cost),4) FROM film;

SELECT SUM(replacement_cost) FROM film;

SELECT * FROM payment

SELECT customer_id FROM payment
GROUP BY customer_id 
ORDER BY customer_id;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id;

SELECT DISTINCT(amount) FROM payment

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT customer_id,staff_id,SUM(amount) FROM payment
GROUP BY staff_id,customer_id;

SELECT customer_id,staff_id,SUM(amount) FROM payment
GROUP BY staff_id,customer_id
ORDER BY customer_id;

SELECT * FROM payment

SELECT DATE(payment_date),SUM(amount) FROM payment
GROUP BY DATE(payment_date)

SELECT DATE(payment_date),SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC

SELECT * from payment
SELECT staff_id from payment

--ASSIGNMENT: We have two staff members, with Staff IDs 1 and 2. 
--We want to give a bonus to the staff member that handled the most payments.(most 
--in terms of number of payments processed, not total dollar amount).
--How many payments did each staff member handle and who gets the bonus?

SELECT staff_id,COUNT(amount) FROM payment
GROUP BY staff_id;


--AFTERNOON

--ASSIGNMENT:Corprative HQ is conducting a study on the relationship between replacement 
--cost and a movie MPAA rating (e.g. G, PG,R, etc...).
--What is the average replacement cost per MPAA rating?
--Note: You may need to expand the AVG column to view correct results
SELECT rating,ROUND(AVG(replacement_cost),2) from film
GROUP BY rating;

--ASSIGNMENT: We are running a promotion to reward our top 5 customers with coupons.
--What are the customer ids of the top 5 customers by total spend?

SELECT customer_id,SUM(amount) from payment
GROUP BY customer_id
ORDER BY SUM(amount)DESC
LIMIT 5;
---------------------------------------------------------------------------

SELECT customer_id,SUM(amount) from payment
WHERE customer_id NOT IN (184,87,477)
GROUP BY customer_id;

SELECT customer_id,SUM(amount) from payment
GROUP BY customer_id;
HAVING SUM(amount)>100;

SELECT store_id,COUNT(customer_id) FROM customer
GROUP BY store_id

SELECT store_id,COUNT(*) FROM customer
GROUP BY store_id

SELECT store_id,COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;

SELECT store_id,COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 100;

--CHALLENGE:
SELECT customer_id,COUNT(*) from payment
GROUP BY customer_id
HAVING COUNT(*)>=40;

--CHALLENGE:
SELECT customer_id,SUM(amount) FROM payment
WHERE staff_id = 2 
GROUP BY customer_id
HAVING SUM(amount) > 100;


--Complete the following tasks

--1)Return the customer ID's of customers who have spend at 
--  least $110 with the staff member who has an ID of 2.
SELECT customer_id,SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 110;

--2)How many films begins with the letter j?
SELECT COUNT(*) FROM film
WHERE title LIKE 'J%';

--3)Which customer has the highest customer ID number whose name
--  starts with an 'E' and has an addess ID lower than 500?
--SELECT * FROM customer
SELECT MAX(customer_id) FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500;

--Or

SELECT * FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;

---------------------------------------------------------------------------
--Day-5
---------------------------------------------------------------------------
--SELECT SUM(column) AS new_name FROM table
--Use this AS new_name at the last of the code otherwise it will give error

SELECT COUNT(amount) AS num_transactions
FROM payment

SELECT customer_id,SUM(amount) FROM payment
GROUP BY customer_id

SELECT customer_id,SUM(amount) AS total_spend FROM payment
GROUP BY customer_id

SELECT customer_id,SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT customer_id,SUM(amount) AS total_spend FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT customer_id,SUM(amount) AS total_spend FROM payment
GROUP BY customer_id
HAVING total_spend > 100;

SELECT customer_id, amount AS new_name
FROM payment
WHERE amount > 2;

SELECT customer_id, amount AS new_name
FROM payment
WHERE new_name > 2;
--In this code we are using alias instead if the origional name then it will give error

--------------------------------Joins-------------------------------
--1)INNER JOIN 
SELECT * FROM  payment 
INNER JOIN customer
ON payment.customer_id = customer.customer_id

SELECT payment.payment_id, payment.customer_id,customer.first_name
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id

--2) FULL OUTER JOIN

SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.payment_id
WHERE customer.customer_id is null
or payment.payment_id is null


SELECT film.film_id,inventory_id,store_id,
FROM film
LEFT OUTER JOIN inventory ON
film.film_id = inventory.film_id;

-------------------------AFTERNOON----------------------------

SELECT * FROM film
SELECT * FROM inventory

SELECT film.film_id,title,inventory_id,store_id
FROM film
LEFT JOIN inventory ON
inventory.film_id = film.film_id
WHERE inventory.film_id IS null

--RIGHT JOIN

--CHALLENEGE
SELECT district,email FROM address
INNER JOIN customer ON
address.address_id = customer.address_id
WHERE district = 'California';


--CHALLENEGE
SELECT * FROM film
SELECT * FROM film_actor
SELECT * FROM actor

SELECT * FROM actor 
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name='Nick'
AND last_name = 'Wahlberg';


