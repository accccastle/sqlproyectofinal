USE sacro_resto;

SET AUTOCOMMIT = 0;

-- Ejercicio 1

START TRANSACTION;
INSERT INTO purchase VALUES(NULL,1,1,1000,9000);
INSERT INTO purchase VALUES(NULL,2,2,300,8000);
INSERT INTO purchase VALUES(NULL,3,3,400,7000);
INSERT INTO purchase VALUES(NULL,4,1,100,1500);
INSERT INTO purchase VALUES(NULL,5,2,100,5000);
INSERT INTO purchase VALUES(NULL,6,3,550,15000);
INSERT INTO purchase VALUES(NULL,7,1,110,4500);
START TRANSACTION;
SET SQL_SAFE_UPDATES = 1;
DELETE FROM purchase WHERE id_product LIKE 2;
-- ROLLBACK;
-- COMMIT;
-- SELECT * FROM purchase;

-- Ejercicio 2

START TRANSACTION;
INSERT INTO menu VALUES(null,'Pizza',1450);
INSERT INTO menu VALUES(null,'Pan de masa madre',710);
INSERT INTO menu VALUES(null,'Panisse de garbanzos',4030);
INSERT INTO menu VALUES(null,'Pavlova de sandía',1950);
INSERT INTO menu VALUES(null,'Kimchi al fuego',4570);
SAVEPOINT spoint1;
INSERT INTO menu VALUES(null,'Ceviche de okra',2480);
INSERT INTO menu VALUES(null,'Chauchas moradas con mole',2950);
INSERT INTO menu VALUES(null,'Quesos estacionados',3390);
INSERT INTO menu VALUES(null,'Chipa',2120);
INSERT INTO menu VALUES(null,'Tartita de piña',2010);
SAVEPOINT spoint2;

-- RELEASE SAVEPOINT spoint1;