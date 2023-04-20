USE sacro_resto;

-- 1) Platos "baratos"
CREATE OR REPLACE VIEW low_price_dishes AS
(SELECT dish_name, price
FROM Menu
WHERE Price < 2000);

-- 2) Platos "caros"
CREATE OR REPLACE VIEW high_price_dishes AS
(SELECT dish_name, price 
FROM Menu
WHERE Price > 2000
ORDER BY price DESC);

-- 3) Ventas en la sucursal nro. 1
CREATE OR REPLACE VIEW sales_branch_1 AS
(SELECT COUNT(id_branch) as Belgrano_Sales
FROM orders
WHERE ID_BRANCH = 1
);

-- 4) Ventas en la sucursal nro. 2
CREATE OR REPLACE VIEW sales_branch_2 AS
(SELECT COUNT(id_branch) as Palermo_Sales
FROM orders
WHERE ID_BRANCH = 2
);

-- 5) Ventas en la sucursal nro. 3
CREATE OR REPLACE VIEW sales_branch_3 AS
(SELECT COUNT(id_branch) as Monserrat_Sales
FROM orders
WHERE ID_BRANCH = 3
);

-- 6) Rango de precios platos
CREATE OR REPLACE VIEW range_prices AS
(SELECT price, dish_name
FROM Menu
WHERE Price BETWEEN 1000 AND 3000
ORDER BY dish_name ASC
);

-- 7) Rango de precios altos platos
CREATE OR REPLACE VIEW range_high_prices AS
(SELECT price, dish_name
FROM Menu
WHERE Price BETWEEN 3001 AND 10000
ORDER BY dish_name ASC
);

-- 8) Ventas con tarjeta de credito
CREATE OR REPLACE VIEW pay_with_credit AS
(SELECT COUNT(id_pay) as CREDIT
FROM Ticket
WHERE id_pay = 1
);

-- 9) Ventas con tarjeta de debito
CREATE OR REPLACE VIEW pay_with_debit AS
(SELECT COUNT(id_pay) as DEBIT
FROM Ticket
WHERE id_pay = 2
);

-- 10) Ventas en efectivo
CREATE OR REPLACE VIEW pay_with_cash AS
(SELECT COUNT(id_pay) as CASH
FROM Ticket
WHERE id_pay = 3
);

-- Prueba Views
-- SELECT * FROM low_price_dishes;
-- SELECT * FROM high_price_dishes;
-- SELECT * FROM sales_branch_1;
-- SELECT * FROM sales_branch_2;
-- SELECT * FROM sales_branch_3;
-- SELECT * FROM range_prices;
-- SELECT * FROM range_high_prices;
-- SELECT * FROM pay_with_credit;
-- SELECT * FROM pay_with_debit;
-- SELECT * FROM pay_with_cash;

