SELECT  customer_id,
CASE
	 WHEN (customer_id<=100) THEN 'Premium'
	 WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
	 ELSE 'Normal'
	 END
FROM customer
	
SELECT  customer_id,
CASE customer_id
	 WHEN 2 THEN 'Winner'
	 WHEN 5 THEN 'Second Place'
	 ELSE 'Normal'
END AS raffle_results
FROM customer
	 
	 
SELECT * FROM film
SELECT rental_rate FROM film

SELECT
CASE rental_rate
    WHEN 0.99 THEN 1
	ElSE 0
END 
FROM film


SELECT 
SUM(CASE rental_rate
    WHEN 0.99 THEN 1
	ELSE 0
END) AS number_of_bargains
FROM film

SELECT 
SUM(CASE rental_rate
    WHEN 0.99 THEN 1
	ELSE 0
END) AS number_of_bargains,
SUM(CASE rental_rate
    WHEN 2.99 THEN 1
	ELSE 0
END) AS regular,
SUM(CASE rental_rate
    WHEN 4.99 THEN 1
	ELSE 0
END) AS premium
FROM film


--------------------------------------------------------------------------------------------------------------
---------MORNING----------
--------VIEW------------

SELECT * FROM customer
SELECT * FROM address

SELECT first_name,last_name,address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

CREATE VIEW customer_info AS
SELECT first_name,last_name,address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

SELECT * FROM customer_info

CREATE OR REPLACE VIEW customer_info AS
SELECT first_name,last_name,address,district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

SELECT * FROM customer_info

DROP VIEW IF EXISTS customer_info

ALTER VIEW customer_info RENAME TO c_info

SELECT * FROM customer_info
SELECT * FROM c_info

DROP VIEW c_info
--------------------------------------------------------------------------
