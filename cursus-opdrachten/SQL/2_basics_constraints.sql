-- Dit is de uitwerking van een opdracht over foreign keys en references.

-- Zet een tabel op:

CREATE TABLE table_fk(CourseID int, CourseNames varchar(255));
INSERT INTO table_fk (CourseID, CourseNames)
VALUES (11, "English"), (12, "Math"), (13, "Language");

-- Maak van "CourseID" de primary key:
ALTER TABLE table_fk
ADD CONSTRAINT CourseID PRIMARY KEY (CourseID);

-- Zet tweede tabel op:

CREATE TABLE table_pk(StudentID int, CourseID int, StudentNames varchar(255), Age int);
INSERT INTO table_pk (StudentID, CourseID, StudentNames, Age)
VALUES (1, 11, "Alex", 18.43), (2, 12, "Akash", 27.56), (3, 13, "Ramisha", 21.45);

ALTER TABLE table_pk
ADD CONSTRAINT StudentID PRIMARY KEY (StudentID);

-- Foreign key
-- Toevoegen als contstaint uit table_FK column CourseID als foreign key aan table_pk column CourseID:

ALTER TABLE table_pk
ADD CONSTRAINT fk_CourseID FOREIGN KEY (CourseID) REFERENCES table_fk (CourseID);


DESC table_pk;


-- En mocht ik een constraint willen verwijderen:

ALTER TABLE table_pk
DROP PRIMARY KEY;