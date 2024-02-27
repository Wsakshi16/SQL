--Write a SQL statement to create a simple table countries including columns country_id, country_name,region_id.

CREATE TABLE countries(
COUNTRY_ID varchar(3),
	COUNTRY_NAME varchar(45),
	REGION_ID decimal(10,0)
);

SELECT * FROM countries
----------------------------------------------------------------------------

--Write a SQL statement to create the structure of a table dup_countries
--similar to countries

CREATE TABLE dup_countries AS
(SELECT * FROM countries);

SELECT * FROM dup_countries;

-----------------------------------------------------------------------------------

--Write a SQL statement to create a table countries, set a constraint NULL.
CREATE TABLE IF NOT EXISTS countries(
COUNTRY_ID varchar(2) NOT NULL,
	COUNTRY_NAME varchar(40) NOT NULL,
	REGION_ID decimal(10,0) NOT NULL
);

-------------------------------------------------------------------------------------------

--Write a SQL statement to create table name jobs including columns job_id, job_title, min_salary,
--max_salary and check whether the max_salary amount exceeding the upper limit 25000.

CREATE TABLE IF NOT EXISTS jobs(
job_id SERIAL PRIMARY KEY,
	job_title VARCHAR(60),
	min_salary decimal(400),
	max_salary decimal(400) CHECK(max_salary <= 25000)
	
);

SELECT * FROM jobs
-----------------------------------------------------------

--Write a SQL statement to create a table name countries including columns country_id, country_name, and 
--region_id and make sure that no countries except Italy, India and China will be entered in the table.


CREATE TABLE IF NOT EXISTS countries(
COUNTRY_ID varchar(3),
	COUNTRY_NAME varchar(45),
	CHECK(COUNTRY_NAME IN ('Italy','India','China')),
	REGION_ID decimal(10,0)
);

SELECT * FROM countries;
------------------------------------------------------------------
--Write a SQL statement to create a table named countries 
--including columns country_id, country_name, and region_id and make sure that 
--no duplicate data against column country_id.

CREATE TABLE IF NOT EXISTS countries(
COUNTRY_ID varchar(3) NOT NULL,
	COUNTRY_NAME varchar(45) NOT NULL,
	REGION_ID decimal(10,0) NOT NULL,
	UNIQUE(COUNTRY_ID)
);


----------------------------------------------------------------------------------------
--Write a SQL statement to create table name jobs including columns job_id, job_title, min_salary,
--max_salary and make sure that the default value for job_title is blank and min_salary is 8000
--max_salary is NULL will be entered automatically at the time of insertion if no value assigned
--for the specified columns.

CREATE TABLE IF NOT EXISTS jobs(
job_id VARCHAR(10) NOT NULL UNIQUE,
	job_title VARCHAR(60) NOT NULL DEFAULT ' ',
	min_salary decimal(6,0) DEFAULT 8000,
	max_salary decimal(6,0) DEFAULT NULL
);

-------------------------------------------------------------------------------------------
--Write a SQL statement to create a table named countries 
--including columns country_id, country_name, and region_id and make sure that 
--country_id column column will be a key field which will not contain any duplicate 
--data at the time of insertion.

CREATE TABLE IF NOT EXISTS countries(
COUNTRY_ID varchar(3) NOT NULL UNIQUE PRIMARY KEY,
	COUNTRY_NAME varchar(45) NOT NULL,
	REGION_ID decimal(10,0) NOT NULL
);
--------------------------------------------------------------------------------------
--Write a SQL statement to create a table named countries 
--including columns country_id, country_name, and region_id and make sure that 
--country_id will be unique and auto-incremented value.

CREATE TABLE IF NOT EXISTS countries(
COUNTRY_ID SERIAL PRIMARY KEY,
	COUNTRY_NAME varchar(45) NOT NULL,
	REGION_ID decimal(10,0) NOT NULL
);
----------------------------------------------------------------------
--Write a SQL statement to create a table named countries 
--including columns country_id, country_name, and region_id and make sure that 
--that the combination of columns coutry_id and region_id wil be unique.

CREATE TABLE IF NOT EXISTS countries_n(
COUNTRY_ID VARCHAR(2) NOT NULL UNIQUE DEFAULT '',
	COUNTRY_NAME varchar(45) NOT NULL,
	REGION_ID decimal(10,0) NOT NULL,
	PRIMARY KEY (COUNTRY_ID, REGION_ID)
);

SELECT * FROM countries_n;
------------------------------------------------------------------------
--Write a SQL statement to create a job_history table including columns 
CREATE TABLE job_history(
employee_id decimal(6,0) NOT NULL PRIMARY KEY,
	start_date date NOT NULL,
	end_date date NOT NULL,
	job_date varchar(10) NOT NULL,
	department_id decimal(4,0) DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);	

------------------------------------------------------------------------------------
CREATE TABLE countries(
country_id varchar(3),
	country_name varchar(45),
	region_id decimal(10,0)
);
	