----------------------------AFTERNOON-----------------------------
CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	 password VARCHAR(50) NOT NULL,
	 email VARCHAR(250) UNIQUE NOT NULL,
	 created_on TIMESTAMP NOT NULL,
	 last_login TIMESTAMP
	)
	
CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	 job_name VARCHAR(200) UNIQUE NOT NULL
)

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
)


INSERT INTO account(username,password,email,created_on)
VALUES
('Ram','root','ram1@sanjivani.org.in',CURRENT_TIMESTAMP)

SELECT * FROM account

INSERT INTO account(username,password,email,created_on)
VALUES
('Aditya','root@1','aditya1@sanjivani.org.in',CURRENT_TIMESTAMP)

INSERT INTO job(job_name)
VALUES('Data Scientist')

SELECT * FROM job

INSERT INTO account_job(job_id,user_id,hire_date)
VALUES
(1,1,CURRENT_TIMESTAMP)

SELECT * FROM account_job

---------------------------------------MORNING--------------------------------------------
---------------UPDATE------------------

UPDATE account
SET last_login = CURRENT_TIMESTAMP

SELECT * FROM account

SELECT * FROM job

SELECT * FROM account_job

UPDATE  account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id

SELECT * FROM account_job

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email,created_on,last_login

INSERT INTO job(job_name)VALUES('Cowboy')
SELECT * FROM job

DELETE FROM job
WHERE job_name=  'Cowboy'
RETURNING job_id,job_name

-----------ALTER---------------
CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	 title VARCHAR(500) NOT NULL,
	 person VARCHAR(50) NOT NULL UNIQUE
)

SELECT * FROM information

ALTER TABLE information
RENAME TO new_info

SELECT * FROM new_info

ALTER TABLE new_info
RENAME COLUMN person TO people

SELECT * FROM new_info

INSERT INTO new_info(title)
VALUES
('some new title')

INSERT INTO new_info(title)
VALUES
('some_new_title')

ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL

INSERT INTO new_info(title)
VALUES('some new title')

SELECT * FROM new_info

--https://www.postgresql.org/docs/current/sql-altertable.html

----------DROP------------
SELECT * FROM new_info

ALTER TABlE new_info
DROP COLUMN people

SELECT * FROM new_info

ALTER TABlE new_info
DROP COLUMN people

ALTER TABlE new_info
DROP COLUMN IF EXISTS people

----------------------AFTERNOON----------------------------
----------CHECK-----------

CREATE TABLE employees(
 emp_id SERIAL PRIMARY KEY,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 birthdate DATE CHECK (birthdate > '1900-01-01'),
 hire_date DATE CHECK (hire_date > birthdate),
 salary INTEGER CHECK (salary > 0)
);

INSERT INTO employees(
first_name,
last_name,
birthdate,
hire_date,
salary
)
VALUES
('Jose',
'Portilla',
'1999-11-03',
'2010-08-08',
12000
)


INSERT INTO employees(
first_name,
last_name,
birthdate,
hire_date,
salary
)
VALUES
('SMith',
'Bhau',
'2000-11-03',
'2015-08-20',
1000
)

SELECT * FROM employees



