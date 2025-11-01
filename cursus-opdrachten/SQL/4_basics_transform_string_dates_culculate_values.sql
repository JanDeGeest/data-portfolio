-- Pas String en numeric values aan.
-- Doe berekeningen.
-- Pas data weergave aan.

-- ***
-- OEFENTABELLEN.
-- ***

-- Dit zijn oefentabellen gekopieerd uit trainingsopdrachten, om vervolgens mijn code op te kunnen toepassen. Zie bestand 1 voor een eigen gemaakte tabel.

-- Voor Strings
CREATE TABLE cust_info_2 (
    CustomersID INT AUTO_INCREMENT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50),
    Address VARCHAR(255),
    Spending DECIMAL(10, 2)); 
INSERT INTO cust_info_2 (FirstNames, LastNames, Address, Spending) VALUES
('John', 'Doe', '123 Main St', 100.50),
('Alice', 'Smith', '456 Elm St', 200.75),
('Bob', 'Johnson', '789 Oak St', 150.25),
('Emily', 'Brown', '321 Pine St', 75.00),
('Michael', 'Davis', '654 Maple St', 300.00),
('Sarah', 'Wilson', '987 Cedar St', 50.50),
('David', 'Lee', '741 Birch St', 180.25),
('Jessica', 'Taylor', '852 Walnut St', 220.75),
('Chris', 'Evans', '369 Spruce St', 125.00),
('Emma', 'Thompson', '159 Fir St', 350.25);

-- Voor arithmetic functies (berekenen)
CREATE TABLE exam_info (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50),
    Scores integer);
INSERT INTO exam_info (FirstNames, LastNames, Scores) VALUES
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

-- Voor afronden
REATE TABLE exam_info_2 (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50),
    Scores float);
INSERT INTO exam_info_2 (FirstNames, LastNames, Scores) VALUES
('John', 'Doe',  80.345544),
('Alice', 'Smith',  75.6355),
('Bob', 'Johnson',  78.5364565),
('Emily', 'Brown',  60.3565),
('Michael', 'Davis', 86.5353656),
('Sarah', 'Wilson', 90.535464),
('David', 'Lee', 75.567765),
('Jessica', 'Taylor', 75.34242),
('Chris', 'Evans',  55.09098),
('Emma', 'Thompson',  67.34535);

-- Voor date formats
CREATE TABLE purchases (
    CustomerID INT,
    PurchaseDate DATE,
    ReturnDate DATE);
INSERT INTO purchases (CustomerID, PurchaseDate, ReturnDate) VALUES
(1, '2024-01-01', '2024-01-05'),
(2, '2024-01-02', '2024-01-06'),
(3, '2024-01-03', '2024-01-07'),
(4, '2024-01-04', '2024-01-08'),
(5, '2024-01-05', '2024-01-09'),
(6, '2024-01-06', '2024-01-10'),
(7, '2024-01-07', '2024-01-11'),
(8, '2024-01-08', '2024-01-12'),
(9, '2024-01-09', '2024-01-13'),
(10, '2024-01-10', '2024-01-14');


-- ***
-- HIER BEGINNEN DE OPDRACHTEN
-- ***


-- ***
-- String manipulatie
-- ***

-- CHAR LENGHT
SELECT CHAR_LENGTH (CustomersNames) AS LengthCustomersNames
FROM cust_info;

-- CONCAT FORMULA: Voeg waarden samen in een string.
SELECT CONCAT(FirstNames, " ", LastNames) AS NewCustomersNames
FROM cust_info_2;

-- Lower case
SELECT LOWER(CustomersNames) AS LcaseCustomersNames
FROM cust_info;

-- Upper case
SELECT UPPER(CustomersNames) AS UcaseCustomersNames
FROM cust_info;

-- TRIM, verwijder onnodige spaties
SELECT TRIM(CustomersNames) AS CorrectedCustomersNames
FROM cust_info;

-- REPLACE
SELECT REPLACE(CustomersNames, "John Doe", "Alex Doe") AS CorrectedCustomersNames
FROM cust_info;


-- ***
-- Arithmetic functies (berekenen)
-- ***

-- ABS: Verander de negatieve waarden in positieve waarden
SELECT ABS(Scores) AS CorrectedScores
FROM exam_info;

-- SUM: Totaal
SELECT SUM(Scores) AS TotalScores
FROM exam_info;

--  AVG: Gemiddelde
SELECT AVG(Scores) AS AverageScores
FROM exam_info;

-- COUNT: Aantal items in de column
SELECT COUNT(StudentID) AS TotalStudents
FROM exam_info;

-- DIV: Delen
SELECT Scores DIV 10 AS DividedScores
FROM exam_info;

-- MIN: Minimum, laagste waarde
SELECT MIN(Scores) AS MinimumScores
FROM exam_info;

-- MAX: Maximum, hoogste waarde
SELECT MAX(Scores) AS MaximumScores
FROM exam_info;

-- POWER: macht berekenen van een waarde. In dit geval tot de derde macht.
SELECT POWER(Scores, 3) AS CubeScores
FROM exam_info;

-- SQRT, wortel en afgerond naar twee decimalen
SELECT ROUND(SQRT(Scores), 2) AS ransformedScores
FROM exam_info_2;

-- LOG, logaritme
SELECT LOG(Scores) AS ransformedScores
FROM exam_info_2;

-- Sorteer oplopend (ASC) of aflopend (DESC)
SELECT *
FROM exam_info_2
ORDER BY Scores ASC;

SELECT *
FROM exam_info_2
ORDER BY Scores DESC;

-- ***
-- Date formats
-- ***

-- Aantal voorbeelden:
-- %a = Afgekorte dagnaam (Sat)
-- %W = Volledige dagnaam (Saturday)
-- %e = Dag van de maand zonder nul (1)
-- %D = Engsle weergave als je de dag uitspreekt als cijfer (1st)
-- %b = Verkorte naam van de maand (Feb)
-- %c = Nummer van de maand zonder nul (2)
-- %M = Volledige naam van de maand (Februari)
-- %Y = Volledige jaartal (2025)
-- %y = Laatste twee getallen jaartal (25)


-- Date format, Geef andere weergave datum YY-maandnaam-D
SELECT DATE_FORMAT(PurchaseDate, "%y-%M-%D") AS FormatedDate
FROM purchases;

-- DATEDIFF: Aantal dagen verschil tussen datums
SELECT DATEDIFF(ReturnDate, PurchaseDate) AS DateDifference
FROM purchases;

-- Extract DAY / MONTH / YEAR: In dit geval het jaar
SELECT YEAR(ReturnDate) AS YearsData
FROM purchases;
