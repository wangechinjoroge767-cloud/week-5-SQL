--Q1: create schema and set search path
create schema nairobi_academy;

set search_path to nairobi_academy;

--Q2: create students table
create table nairobi_academy.students(student_id INT primary key,
first_name VARCHAR(50)not null,
last_name VARCHAR(50)not null,
gender VARCHAR(1),
date_of_birth date,
class VARCHAR(10),
city VARCHAR(50)
);

--Q3: create subjects table
create table nairobi_academy.subjects(
subject_id INT primary key,
subject_name VARCHAR(100)not null unique,
department VARCHAR(50), 
teacher_name VARCHAR(100),
credits INT
);

select*from nairobi_academy.students;


SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'subjects' AND table_schema = 'nairobi_academy';

--Q4 create exam_results table
CREATE TABLE nairobi_academy.exam_results (
    result_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    marks INT NOT NULL,
    exam_date DATE,
    grade VARCHAR(2)
);


-- Q5: Add phone_number column to students

ALTER TABLE nairobi_academy.students
ADD COLUMN phone_number VARCHAR(20);

-- Q6: Rename credits to credit_hours in subjects
ALTER TABLE nairobi_academy.subjects
RENAME COLUMN credits TO credit_hours;

-- Q7: Drop phone_number from students
ALTER TABLE nairobi_academy.students
DROP COLUMN phone_number;

--Q8: INSERT 10 STUDENTS

set search_path to nairobi_academy;
INSERT INTO nairobi_academy.students (student_id, first_name, last_name, gender, date_of_birth, class, city) 
VALUES
(1, 'Amina', 'Wanjiku', 'F', '2008-03-12', 'Form 3', 'Nairobi'),
(2, 'Brian', 'Ochieng', 'M', '2007-07-25', 'Form 4', 'Mombasa'),
(3, 'Cynthia', 'Mutua', 'F', '2008-11-05', 'Form 3', 'Kisumu'),
(4, 'David', 'Kamau', 'M', '2007-02-18', 'Form 4', 'Nairobi'),
(5, 'Esther', 'Akinyi', 'F', '2009-06-30', 'Form 2', 'Nakuru'),
(6, 'Felix', 'Otieno', 'M', '2009-09-14', 'Form 2', 'Eldoret'),
(7, 'Grace', 'Mwangi', 'F', '2008-01-22', 'Form 3', 'Nairobi'),
(8, 'Hassan', 'Abdi', 'M', '2007-04-09', 'Form 4', 'Mombasa'),
(9, 'Ivy', 'Chebet', 'F', '2009-12-01', 'Form 2', 'Nakuru'),
(10, 'James', 'Kariuki', 'M', '2008-08-17', 'Form 3', 'Nairobi');


--Q9: INSERT SUBJECT

INSERT INTO nairobi_academy.subjects (subject_id, subject_name, department, teacher_name, credit_hours) VALUES
(1, 'Mathematics', 'Sciences', 'Mr. Njoroge', 4),
(2, 'English', 'Languages', 'Ms. Adhiambo', 3),
(3, 'Biology', 'Sciences', 'Ms. Otieno', 4),
(4, 'History', 'Humanities', 'Mr. Waweru', 3),
(5, 'Kiswahili', 'Languages', 'Ms. Nduta', 3),
(6, 'Physics', 'Sciences', 'Mr. Kamande', 4),
(7, 'Geography', 'Humanities', 'Ms. Chebet', 3),
(8, 'Chemistry', 'Sciences', 'Ms. Muthoni', 4),
(9, 'Computer Studies', 'Sciences', 'Mr. Oduya', 3),
(10, 'Business Studies', 'Humanities', 'Ms. Wangari', 3);



--Q10: INSERT EXAM RESULTS

INSERT INTO nairobi_academy.exam_results (result_id, student_id, subject_id, marks, exam_date, grade) VALUES
(1, 1, 1, 78, '2024-03-15', 'B'),
(2, 1, 2, 85, '2024-03-16', 'A'),
(3, 2, 1, 92, '2024-03-15', 'A'),
(4, 2, 3, 55, '2024-03-17', 'C'),
(5, 3, 2, 49, '2024-03-16', 'D'),
(6, 3, 4, 71, '2024-03-18', 'B'),
(7, 4, 1, 88, '2024-03-15', 'A'),
(8, 4, 6, 63, '2024-03-19', 'C'),
(9, 5, 5, 39, '2024-03-20', 'F'),
(10, 6, 9, 95, '2024-03-21', 'A');

SELECT 'STUDENTS' as table_name, COUNT(*) as total_rows FROM nairobi_academy.students
UNION ALL
SELECT 'SUBJECTS', COUNT(*) FROM nairobi_academy.subjects
UNION ALL
SELECT 'EXAM_RESULTS', COUNT(*) FROM nairobi_academy.exam_results;


-- Step 1: Drop the broken table
DROP TABLE IF EXISTS nairobi_academy.subjects;

-- Step 2: Create it fresh with correct column type
CREATE TABLE nairobi_academy.subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL UNIQUE,
    department VARCHAR(50),
    teacher_name VARCHAR(100),
    credit_hours INT
);

-- Step 3: Insert all the data
INSERT INTO nairobi_academy.subjects (subject_id, subject_name, department, teacher_name, credit_hours) VALUES
(1, 'Mathematics', 'Sciences', 'Mr. Njoroge', 4),
(2, 'English', 'Languages', 'Ms. Adhiambo', 3),
(3, 'Biology', 'Sciences', 'Ms. Otieno', 4),
(4, 'History', 'Humanities', 'Mr. Waweru', 3),
(5, 'Kiswahili', 'Languages', 'Ms. Nduta', 3),
(6, 'Physics', 'Sciences', 'Mr. Kamande', 4),
(7, 'Geography', 'Humanities', 'Ms. Chebet', 3),
(8, 'Chemistry', 'Sciences', 'Ms. Muthoni', 4),
(9, 'Computer Studies', 'Sciences', 'Mr. Oduya', 3),
(10, 'Business Studies', 'Humanities', 'Ms. Wangari', 3);

SELECT * FROM nairobi_academy.students;
SELECT * FROM nairobi_academy.subjects;
SELECT * FROM nairobi_academy.exam_results;

UPDATE nairobi_academy.students
SET city = 'Nairobi'
WHERE student_id = 5;

UPDATE nairobi_academy.exam_results
SET marks = 59
WHERE result_id = 5;

DELETE FROM nairobi_academy.exam_results
WHERE result_id = 9;

SELECT * FROM nairobi_academy.students
WHERE class = 'Form 4';

SELECT * FROM nairobi_academy.subjects
WHERE department = 'Sciences';

SELECT * FROM nairobi_academy.exam_results
WHERE marks >= 70;

SELECT * FROM nairobi_academy.students
WHERE gender = 'F';

SELECT * FROM nairobi_academy.students
WHERE class = 'Form 3' AND city = 'Nairobi';

SELECT * FROM nairobi_academy.students
WHERE class = 'Form 2' OR class = 'Form 4';

SELECT * FROM nairobi_academy.exam_results
WHERE marks BETWEEN 50 AND 80;

SELECT * FROM nairobi_academy.exam_results
WHERE exam_date BETWEEN '2024-03-15' AND '2024-03-18';

SELECT * FROM nairobi_academy.students
WHERE city IN ('Nairobi', 'Mombasa', 'Kisumu');

SELECT * FROM nairobi_academy.students
WHERE class NOT IN ('Form 2', 'Form 3');

SELECT * FROM nairobi_academy.students
WHERE first_name LIKE 'A%' OR first_name LIKE 'E%';

SELECT * FROM nairobi_academy.subjects
WHERE subject_name LIKE '%Studies%';

SELECT COUNT(*) FROM nairobi_academy.students
WHERE class = 'Form 3';

SELECT COUNT(*) FROM nairobi_academy.exam_results
WHERE marks >= 70;

SELECT *,
    CASE
        WHEN marks >= 80 THEN 'Distinction'
        WHEN marks >= 60 THEN 'Merit'
        WHEN marks >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS performance
FROM nairobi_academy.exam_results;


SELECT first_name, last_name, class,
    CASE
        WHEN class IN ('Form 3', 'Form 4') THEN 'Senior'
        WHEN class IN ('Form 1', 'Form 2') THEN 'Junior'
    END AS student_level
FROM nairobi_academy.students;