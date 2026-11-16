-- Student Academic Record Management System
-- MySQL script (run in MySQL Workbench)

CREATE DATABASE IF NOT EXISTS student_academic_records;
USE student_academic_records;

DROP TABLE IF EXISTS student_records;

-- CREATE
CREATE TABLE student_records
(
    student_id INT PRIMARY KEY,
    full_name  VARCHAR(60)  NOT NULL,
    program    VARCHAR(40)  NOT NULL,
    semester   INT          NOT NULL,
    email      VARCHAR(100) UNIQUE,
    gpa        DECIMAL(3,2) NOT NULL
);

-- INSERT (10 sample records)
INSERT INTO student_records
(student_id, full_name, program, semester, email, gpa)
VALUES
(201, 'Marowa Islam',   'CSE',     3, 'marowa.islam@example.com',   3.72),
(202, 'Sabrina',        'EEE',     2, 'sabrina@example.com',        3.45),
(203, 'Shaikha',        'BBA',     4, 'shaikha@example.com',        3.81),
(204, 'Yamin',          'CSE',     5, 'yamin@example.com',          3.28),
(205, 'Farzana Islam',  'English', 3, 'farzana.islam@example.com',  3.66),
(206, 'Siam Ahmed',     'EEE',     4, 'siam.ahmed@example.com',     3.54),
(207, 'Maliha Sultana', 'CSE',     2, 'maliha.sultana@example.com', 3.91),
(208, 'Sanjana',        'BBA',     5, 'sanjana@example.com',        3.37),
(209, 'Sujana',         'English', 1, 'sujana@example.com',         3.75),
(210, 'Suraiya',        'CSE',     6, 'suraiya@example.com',        3.60);

-- SELECT (view all records)
SELECT * FROM student_records;

-- WHERE (search / filter)
SELECT * FROM student_records
WHERE full_name = 'Marowa Islam';

SELECT * FROM student_records
WHERE program = 'CSE';

-- UPDATE
UPDATE student_records
SET gpa = 3.85
WHERE student_id = 201;

SELECT * FROM student_records
WHERE student_id = 201;

-- DELETE
DELETE FROM student_records
WHERE student_id = 210;

SELECT * FROM student_records;

-- AGGREGATE FUNCTIONS (summary)
SELECT COUNT(*) AS total_students
FROM student_records;

SELECT AVG(gpa) AS average_gpa
FROM student_records;

SELECT MAX(gpa) AS highest_gpa,
       MIN(gpa) AS lowest_gpa
FROM student_records;

-- GROUP BY (students per program, shown as chips on the web page)
SELECT program, COUNT(*) AS students
FROM student_records
GROUP BY program
ORDER BY students DESC, program;
