/* Enkele opdrachten met iets meer comlexere SELECT (nested) opdrachten. */



-- Opzet van twee databases
CREATE TABLE student_info (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50),
    Scores integer);
 
INSERT INTO student_info (FirstNames, LastNames, Scores) VALUES
('John', 'Doe',  80),
('Alice', 'Smith',  75),
('Bob', 'Johnson',  78),
('Emily', 'Brown',  60),
('Michael', 'Davis', 86),
('Sarah', 'Wilson', 90),
('David', 'Lee', 75),
('Jessica', 'Taylor', 75),
('Chris', 'Evans',  55),
('Emma', 'Thompson',  67);


CREATE TABLE exam_info (
    StudentID INT PRIMARY KEY,
    Subjects VARCHAR(50),
    Scores integer);
 
INSERT INTO exam_info (StudentID, Subjects, Scores) VALUES
(1, 'Math',  80),
(2, 'English',  75),
(3, 'Science',  78),
(4, 'Math',  60),
(5, 'English', 86),
(6, 'Science', 90),
(7, 'Science', 75),
(8, 'English', 75),
(9, 'Math',  55),
(10, 'Math',  67);



-- Toon gemiddelde scores, per vak, met een gemiddelde score lager dan 80.

SELECT Subjects, ROUND(AVG(Scores), 2)
FROM exam_info
GROUP BY Subjects
HAVING AVG(Scores) < 80
;


-- Nested: Toon de rijen uit student-info tabel, mits ze bestaan in exam_info en een score boven 75 hebben.

SELECT *
FROM student_info
WHERE EXISTS (SELECT * FROM exam_info WHERE student_info.StudentID = exam_info.StudentID AND Scores > 75)
;

-- Zelfde resultaat, maar andere code.

SELECT *
FROM student_info
WHERE StudentID = ANY (SELECT StudentID FROM exam_info WHERE Scores > 75)
;


-- Toon rijen student_info waarvan er geen overeenkomstige rijen bestaan in exam_info. 

SELECT *
FROM student_info
WHERE NOT EXISTS (
    SELECT *
    FROM exam_info
    WHERE student_info.Scores = exam_info.Scores
);


-- CASE: "Switch" statement. Maak een column waarbij je de waarde afhankelijk maakt van de waarde van een andere column.

SELECT *,
CASE
 WHEN Scores > 75 THEN 'A'
 WHEN Scores BETWEEN 60 AND 75 THEN 'B'
 ELSE 'C'
 END AS Results
FROM student_info
;


-- Extra opdrachtje om commando's te maken die je kunt oproepen.

DELIMITER //
CREATE PROCEDURE test()
 BEGIN
  SELECT *
  FROM student_info;
 END //

DELIMITER ;

CALL test()
