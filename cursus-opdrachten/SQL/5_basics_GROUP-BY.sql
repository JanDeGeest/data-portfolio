-- De GROUP BY functie


-- Deze tabel heb ik niet zelf geschreven maar overgenomen zodat ik een tabel heb om mijn opdracht op uit te voeren.
CREATE TABLE students (student_id INT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), age INT, gender VARCHAR(20), department VARCHAR(50), year_level VARCHAR(20), gpa DECIMAL(3,2) );
INSERT INTO students (student_id, first_name, last_name, age, gender, department, year_level, gpa) VALUES
(1,'Richard','Wilson',20,'Male','Science','Freshman',3.80),
(2,'Jessica','Garcia',23,'Male','Medicine','Freshman',3.54),
(3,'James','Miller',18,'Male','Medicine','Senior',2.71),
(4,'Patricia','Brown',24,'Non-Binary','Business','Senior',3.24),
(5,'Patricia','Jones',21,'Female','Arts','Senior',2.58),
(6,'Linda','Miller',21,'Female','Engineering','Senior',3.75),
(7,'Elizabeth','Brown',22,'Female','Medicine','Sophomore',2.22),
(8,'Karen','Brown',24,'Female','Medicine','Junior',2.42),
(9,'Charles','Garcia',19,'Male','Engineering','Sophomore',2.37),
(10,'Robert','Wilson',22,'Male','Medicine','Freshman',2.81),
(11,'Michael','Wilson',21,'Female','Business','Freshman',3.49),
(12,'Richard','Wilson',21,'Female','Business','Sophomore',3.05),
(13,'Mary','Garcia',21,'Female','Arts','Freshman',2.98),
(14,'Michael','Brown',22,'Female','Science','Sophomore',2.00),
(15,'Linda','Williams',20,'Non-Binary','Engineering','Freshman',2.85),
(16,'Joseph','Brown',19,'Male','Business','Junior',2.13),
(17,'Sarah','Wilson',20,'Female','Business','Senior',2.42),
(18,'Jennifer','Garcia',20,'Female','Business','Freshman',3.86),
(19,'Susan','Garcia',19,'Female','Business','Sophomore',2.43),
(20,'William','Miller',21,'Female','Arts','Senior',3.72),
(21,'Elizabeth','Johnson',21,'Female','Medicine','Sophomore',3.61),
(22,'Karen','Williams',22,'Non-Binary','Business','Senior',2.32),
(23,'Thomas','Williams',22,'Male','Arts','Senior',3.21),
(24,'Karen','Rodriguez',20,'Female','Science','Senior',2.23);


-- GROUP BY 
-- Gegroepeerd op basis van department. Aantal studenten weergegeven als aantal_studenten. De score is als gemiddelde per faculteit (department.

SELECT department AS Faculteit, COUNT(student_id) AS Aantal_studenten, ROUND(AVG(gpa), 2) AS Score
FROM students
GROUP BY department;
