-- Verschillende JOIN mogelijkheden. 
-- Query opdracht om verschillende rijen uit meerdere tabellen naast elkaar te zetten.

-- Oefentabellen. Laten genereren omdat deze oefening over JOIN gaat en niet over het maken van een nieuwe tabel.

-- Tabel 1
CREATE TABLE student (
    StudentID INT PRIMARY KEY,
    Voornaam  VARCHAR(50),
    Achternaam VARCHAR(50)
);

INSERT INTO student (StudentID, Voornaam, Achternaam) VALUES
(1,  'Jan',     'Jansen'),
(2,  'Lisa',    'Vermeer'),
(3,  'Ahmed',   'El Amrani'),
(4,  'Sophie',  'de Vries'),
(5,  'Tom',     'Bakker'),
(6,  'Emma',    'van Dijk'),
(7,  'Noah',    'Smit'),
(8,  'Julia',   'Kok'),
(9,  'Lucas',   'Meijer'),
(10, 'Mila',    'de Boer'),
(11, 'Finn',    'Vos'),
(12, 'Sara',    'Hassan'),
(13, 'Daan',    'Mulder'),
(14, 'Lotte',   'Peeters'),
(15, 'Omar',    'Rahimi'),
(16, 'Eva',     'Bos'),
(17, 'Ruben',   'Post'),
(18, 'Nina',    'Jong'),
(19, 'Youssef', 'Benali'),
(20, 'Iris',    'Kuipers');

-- Tabel 2
CREATE TABLE exam (
    StudentID INT,
    Vak   VARCHAR(50),
    Score INT
);

INSERT INTO exam (StudentID, Vak, Score) VALUES
(1,  'Wiskunde',     8),
(1,  'Engels',       7),
(2,  'Wiskunde',     9),
(3,  'Geschiedenis', 6),
(3,  'Engels',       7),
(5,  'Biologie',     8),
(6,  'Wiskunde',     6),
(6,  'Natuurkunde',  7),
(7,  'Engels',       8),
(8,  'Geschiedenis', 9),
(9,  'Wiskunde',     5),
(10, 'Biologie',     7),
(10, 'Engels',       8),
(12, 'Wiskunde',     6),
(14, 'Geschiedenis', 7),
(15, 'Natuurkunde',  8),
(15, 'Wiskunde',     7),
(18, 'Biologie',     9),
(21, 'Engels',       6),
(22, 'Wiskunde',     8);

-- tabel 3
CREATE TABLE study_plan (
    TeVolgenVak VARCHAR(50),
    Semester    VARCHAR(20)
);

INSERT INTO study_plan (TeVolgenVak, Semester) VALUES
('Wiskunde',     'Semester 1'),
('Wiskunde',     'Semester 2'),
('Engels',       'Semester 1'),
('Geschiedenis', 'Semester 2'),
('Biologie',     'Semester 1'),
('Natuurkunde',  'Semester 2');


-- Opdrachten JOIN

-- INNER JOIN Volledige match zonder NULL waarden.

SELECT *
FROM student
INNER JOIN exam on student.StudentID = exam.StudentID
;

-- LEFT JOIN 'exam' rijen mogen NULL waarden bevatten
SELECT *
FROM student
LEFT JOIN exam on student.StudentID = exam.StudentID
;

-- RIGHT JOIN 'student' rijen mogen NULL waarden bevatten
SELECT *
FROM student
RIGHT JOIN exam on student.StudentID = exam.StudentID
;

-- FULL OUTER JOIN zowel 'student' als 'exam' rijen mogen NULL waarden bevatten
-- Maar in dit geval gebruik ik UNION, want ik gebruik mysql en die herkent full join niet.

SELECT *
FROM student
LEFT JOIN exam on student.StudentID = exam.StudentID

UNION

SELECT *
FROM student
RIGHT JOIN exam on student.StudentID = exam.StudentID
;

-- CROSS JOIN, een lesschema voor elke student. Per student alle vakken met betreffende semester(s).
SELECT *
FROM student
CROSS JOIN study_plan;

-- Een INNER JOIN, maar dan efficienter en zonder dubbele ID.
SELECT s.StudentID, s.Voornaam, s.Achternaam, e.Vak, e.Score
FROM student s
INNER JOIN exam e on s.StudentID = e.StudentID
; 
