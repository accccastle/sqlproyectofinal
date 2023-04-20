USE sacro_resto;

SELECT SUM(AMOUNT) AS CREDIT_PAYMENT FROM TICKET WHERE ID_PAY LIKE '1'; 
SELECT SUM(AMOUNT) AS DEBIT_PAYMENT FROM TICKET WHERE ID_PAY LIKE '2'; 
SELECT SUM(AMOUNT) AS CASH_PAYMENT FROM TICKET WHERE ID_PAY LIKE '3'; 

SELECT COUNT(ID_SUPPLIER) AS COMPRAS_FRUTAS_DELNORTE FROM PURCHASE WHERE ID_SUPPLIER LIKE '1';
SELECT COUNT(ID_SUPPLIER) AS COMPRAS_VERDULERIA_PRISMA FROM PURCHASE WHERE ID_SUPPLIER LIKE '2';
SELECT COUNT(ID_SUPPLIER) AS COMPRAS_VERDURASA_JUANCITO FROM PURCHASE WHERE ID_SUPPLIER LIKE '3';
