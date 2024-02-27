CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(500),
	last_name VARCHAR(50),
	homeroom_number INT,
	department VARCHAR(50),
	email VARCHAR(400) UNIQUE,
	phone VARCHAR(300) UNIQUE
)

SELECT * FROM teachers

CREATE TABLE students(
student_id SERIAL PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
homeroom_number INT,
department VARCHAR(50),
email VARCHAR(400) UNIQUE,
phone VARCHAR(300) UNIQUE,
grad_year INT
)

SELECT * FROM students

INSERT INTO students(first_name,last_name,phone,email,grad_year,homeroom_number)
VALUES
('Rahul ','Galande ','7775551234 ','Rahul.galande@gmail.com','2023','5')

SELECT * FROM students


INSERT INTO teachers(first_name,last_name,phone,email,homeroom_number,department)
VALUES
('Chandrashekhar','Gogte','7775554321 ','Chandrashekhar.gogte@gamil.com','5','Biology')

SELECT * FROM teachers

