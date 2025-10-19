-- Hoe kan ik verschillende filters toepassen??

-- Een gekopieerde voorbeeld tabel,zie (1) voor een voorbeeld van een tabel die ik zelf heb geschreven.
CREATE TABLE cust_info (
    CustomersID INT AUTO_INCREMENT PRIMARY KEY,
    CustomersNames VARCHAR(100),
    Address VARCHAR(255),
    Spending DECIMAL(10, 2)
);
 
INSERT INTO cust_info (CustomersNames, Address, Spending) VALUES
	('John Doe', '123 Main St', 100.50),
	('Alice Smith', '456 Elm St', 200.75),
	('Bob Johnson', '789 Oak St', 150.25),
	('Emily Brown', '321 Pine St', 75.00),
	('Michael Davis', '654 Maple St', 300.00),
	('Sarah Wilson', '987 Cedar St', 50.50),
	('David Lee', '741 Birch St', 180.25),
	('Jessica Taylor', '852 Walnut St', 220.75),
	('Chris Evans', '369 Spruce St', 125.00),
	('Emma Thompson', '159 Fir St', 350.25)
;



-- Verschillende filters:


-- AND: Filter  tussen x en y

SELECT *
FROM cust_info
WHERE Spending > 100 AND Spending < 200;


-- IN: verschillende resultaten met een formule die practischer is:

SELECT *
FROM cust_info
WHERE CustomersID IN (1, 2, 4);


-- BETWEEN: Practischere formule om resultaten te krijgen met waarden tussen x en y, maar dan met minder code.

SELECT *
FROM cust_info
WHERE Spending BETWEEN 100 AND 300;


-- OR: resultaten x of y. Ik wil alleen de namen en adres column zien.

SELECT CustomersNames, Address
FROM cust_info
WHERE Spending < 200 OR Spending > 500;


-- NOT. ik wil een bepaald resultaat juist niet zien.

SELECT *
FROM cust_info
WHERE NOT CustomersNames = 'John Doe';

-- LIKE: filter op basis van teken die voorkomen in een waarde: %w x% %y% z%z
-- LIMIT: Beperk aantal rijen in resultaat.

SELECT *
FROM cust_info
WHERE CustomersNames LIKE '%e'
LIMIT 5;
