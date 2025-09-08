-- ✅ Table Creation
CREATE TABLE student_records (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(30)
);

-- ✅ Sample Data Insertion
INSERT INTO student_records VALUES
(101, "ANIL", 78, "C", "PUNE"),
(102, "BHUMIKA", 93, "A", "MUMBAI"),
(103, "CHETAN", 85, "B", "MUMBAI"),
(104, "DHRUV", 96, "A", "DELHI"),
(105, "EMANUAL", 12, "F", "DELHI"),
(106, "FARAH", 82, "B", "DELHI");

--------------------------------------------------------

-- 🎯 Q1 – Show all records from student_records table  
SELECT * FROM student_records;

--------------------------------------------------------

-- 🎯 Q2 – Change column name 'name' to 'FULL_NAME'  
ALTER TABLE student_records 
CHANGE name FULL_NAME VARCHAR(50);

--------------------------------------------------------

-- 🎯 Q3 – Delete records where marks < 50  
DELETE FROM student_records WHERE marks < 50;

--------------------------------------------------------

-- 🎯 Q4 – Calculate the average marks of all students  
SELECT AVG(marks) AS avg_marks FROM student_records;

--------------------------------------------------------

-- 🎯 Q5 – Get students scoring above average marks  
SELECT FULL_NAME, marks FROM student_records  
WHERE marks > (SELECT AVG(marks) FROM student_records);

--------------------------------------------------------

-- 🎯 Q6 – Get students from PUNE city named "ANIL"  
SELECT * FROM student_records  
WHERE city = 'PUNE' AND FULL_NAME = 'ANIL';

--------------------------------------------------------

-- 🎯 Q7 – Get students with even roll numbers  
SELECT rollno, FULL_NAME FROM student_records  
WHERE (rollno % 2 = 0);

--------------------------------------------------------

-- 🎯 Q8 – Find distinct cities where students are from  
SELECT DISTINCT city FROM student_records;

--------------------------------------------------------

-- 🎯 Q9 – Count of students in each city  
SELECT city, COUNT(rollno) AS student_count  
FROM student_records  
GROUP BY city;

--------------------------------------------------------

-- 🎯 Q10 – Students with marks between 70 and 90 in Mumbai, Delhi, or Pune  
SELECT * FROM student_records  
WHERE marks BETWEEN 70 AND 90  
AND city IN ('MUMBAI', 'DELHI', 'PUNE')  
ORDER BY city ASC  
LIMIT 3;

--------------------------------------------------------

-- 🎯 Q11 – Maximum marks scored by any student  
SELECT MAX(marks) AS max_marks FROM student_records;

--------------------------------------------------------

-- 🎯 Q12 – Minimum marks scored by any student  
SELECT MIN(marks) AS min_marks FROM student_records;

--------------------------------------------------------

-- 🎯 Q13 – Average marks grouped by city in ascending order  
SELECT city, AVG(marks) AS avg_marks  
FROM student_records  
GROUP BY city  
ORDER BY city ASC;

--------------------------------------------------------

-- 🎯 Q14 – List of students where marks + 10 exceeds 100  
SELECT * FROM student_records  
WHERE marks + 10 > 100;

--------------------------------------------------------

-- 🎯 Q15 – Earliest student added (based on lowest roll number)  
SELECT * FROM student_records  
ORDER BY rollno ASC  
LIMIT 1;
