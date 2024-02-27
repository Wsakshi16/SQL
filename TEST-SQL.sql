--1)
CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(255),
    min_salary DECIMAL(10, 2),
    max_salary DECIMAL(10, 2),
    CHECK (max_salary <= 25000)
);

SELECT * FROM jobs;
--2)
UPDATE jobs SET email = 'not available';

--3)
ALTER TABLE jobs RENAME TO jobs_new;

--4)
ALTER TABLE jobs_new
ADD COLUMN dept_id INT;

--5)
INSERT INTO jobs_new(job_id,job_title,min_salary,max_salary,dept_id)
VALUES('1','Data Scientist','15000','24000');
INSERT INTO jobs_new(job_id,job_title,min_salary,max_salary,dept_id)
VALUES('2','Web Developer','18000','20000','6');

SELECT * FROM jobs_new

--6)
SELECT job_id,dept_id FROM jobs_new;

--7)
SELECT MAX(max_salary) FROM jobs_new;

--8)
SELECT count(*),AVG(min_salary),AVG(max_salary) FROM jobs_new;

--9)
CREATE TABLE manager_details (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(255),
    dept_id INT
);

SELECT manager_details.manager_id, jobs_new.job_id FROM manager_details
INNER JOIN jobs_new
ON manager_details.dept_id = jobs_new.dept_id

--10)
SELECT emp_id FROM jobs_new
WHERE dpt = "IT"

