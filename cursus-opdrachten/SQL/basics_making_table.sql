-- De basis code om een tabel te maken, gegevens toe te voegen, te wijzigen en zaken te verwijderen.

-- Maak een database en gebruik deze.

CREATE DATABASE wijn_proeverij;
USE wijn_proeverij;

-- Maak een tabel met collumns.
-- Condities: ID mag niet vaker in column voorkomen en niemand mag jonger dan 18 jaar zijn,

CREATE TABLE bestelling_riesling(
	ID int,
	Naam varchar(255),
	Leeftijd int,
	Mililiter float,
	UNIQUE(ID),
	CHECK(Leeftijd >=18)
);

-- voeg data toe.

INSERT INTO bestelling_riesling (ID, Naam, Leeftijd, Mililiter)
VALUES
	(1, 'Henk', 56, 33.5),
	(2, 'Anne', 42, 34),
	(3, 'Harrie', 18, 12.5),
	(4, 'Jim', 32, 120.1),
	(5, 'Annefleur', 20, 90)
;

-- Wijzig.

UPDATE bestelling_riesling
SET Naam = 'Harry'
	WHERE ID = 3
;

-- Verwijder een rij
	
DELETE FROM bestelling_riesling
	WHERE ID = '2'
;

-- Toon resultaat.
Select * FROM bestelling_riesling;

-- Verwijder alle records van de tabel.
TRUNCATE TABLE bestelling_riesling;

-- Verwijder tabel.
DROP TABLE bestelling_riesling;
