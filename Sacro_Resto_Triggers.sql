USE sacro_resto;

-- 1) Triggers auditoria para ingreso de venta por ticket

DELIMITER //
CREATE TRIGGER tr_ingreso_ventas
AFTER INSERT ON ticket
FOR EACH ROW
BEGIN
    INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('ticket', NEW.id_bill,CURRENT_TIMESTAMP(),USER(),'insert');
END;
//

-- 2) Trigger auditoria para ingreso de ordernes

DELIMITER //
CREATE TRIGGER tr_ingreso_ordenes 
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('orders', NEW.id_order,CURRENT_TIMESTAMP(),USER(),'insert');
END;
//

-- 3) Trigger auditoria para ingreso de compras proveedores

DELIMITER //
CREATE TRIGGER tr_ingreso_compras
AFTER INSERT ON purchase
FOR EACH ROW
BEGIN
    INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('purchase', NEW.id_invoice,CURRENT_TIMESTAMP(),USER(),'insert');
END;
//

-- 4) Trigger auditoria update clients

DELIMITER //
CREATE TRIGGER tr_update_clients
AFTER UPDATE ON clients
FOR EACH ROW
BEGIN
    INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('clients', NEW.id_client,CURRENT_TIMESTAMP(),USER(),'update');
END;
//

-- 5) Trigger auditoria update employees

DELIMITER //
CREATE TRIGGER tr_update_employee
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('employee', NEW.id_employee,CURRENT_TIMESTAMP(),USER(),'update');
END;
//

-- 6) Trigger auditoria update products

DELIMITER //
CREATE TRIGGER tr_update_products
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('products', NEW.id_product,CURRENT_TIMESTAMP(),USER(),'update');
END;
//

-- 7) Trigger auditoria update menu

DELIMITER //
CREATE TRIGGER tr_update_menu
AFTER UPDATE ON menu
FOR EACH ROW
BEGIN
	INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('menu', NEW.id_dish,CURRENT_TIMESTAMP(),USER(),'update');
END;
//

/* -- Pruebas _log 
INSERT INTO ticket VALUES (null,1,3,1400,'2020-03-20');
INSERT INTO orders VALUES (NULL, 1, 20998372, 1, 4,3,4,5,5);
INSERT INTO purchase VALUES (null,1,3,100,5000);
UPDATE clients SET first_name='Maria Laura' WHERE id_client='23998217';
UPDATE employees SET shift='Tarde' WHERE id_employee=3;
UPDATE products SET short_name='LCON' WHERE id_product=20;
UPDATE menu SET price=1500 WHERE id_dish=1;

SELECT * FROM _LOG;
*/

---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 8) Trigger muestra mensaje de error si el importe ingresado en un registro de compras es negativo (-000)

DELIMITER //
CREATE TRIGGER tr_mensaje_error_compra
BEFORE INSERT ON purchase
FOR EACH ROW
BEGIN
    IF NEW.amount < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El importe no puede ser negativo, por favor ingrese un monto correcto';
    END IF;
END;
//

INSERT INTO purchase VALUES (NULL,33,3,9100,-35000);

---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 9) Trigger actualizar stock al generar una compra

DELIMITER //
CREATE TRIGGER tr_actualizar_stock
AFTER INSERT ON purchase
FOR EACH ROW
BEGIN
    UPDATE stock 
    SET stock = stock + NEW.add_stock 
    WHERE id_product = NEW.id_product;
END;
//

-- Pruebas 
-- INSERT INTO purchase VALUES (NULL,33,3,9100,35000);
-- INSERT INTO purchase VALUES (NULL,2,1,100,1000);
-- INSERT INTO purchase VALUES (NULL,21,2,500,12000);
-- SELECT * FROM stock;


---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 10) Trigger muestra mensaje de error si el importe ingresado en un registro de venta es negativo (-000)

DELIMITER //
CREATE TRIGGER tr_mensaje_error_venta
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
    IF NEW.amount < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El importe no puede ser negativo, por favor ingrese un monto correcto';
    END IF;
END;
//

-- Pruebas
-- INSERT INTO ticket VALUES (NULL,2,44,-9100,'2022-03-30');

---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 11) Trigger para tabla empleados, guarda el dato en mayuscula

DELIMITER //
CREATE TRIGGER tr_employees_uppercase 
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
  SET NEW.first_name = UPPER(NEW.first_name);
  SET NEW.last_name = UPPER(NEW.last_name);
  SET NEW.shift = UPPER(NEW.shift);
  SET NEW.job = UPPER(NEW.job);
END;
//

-- Pruebas
-- INSERT INTO employees VALUES (null,'carlos','mendez','tarde','cocina');
-- SELECT * FROM employees;


---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 12) Trigger para tabla sucursales, guarda el dato en mayuscula

DELIMITER //
CREATE TRIGGER tr_payment_uppercase 
BEFORE INSERT ON payment
FOR EACH ROW
BEGIN
  SET NEW.name_pay = UPPER(NEW.name_pay);
  SET NEW.short_name = UPPER(NEW.short_name);
END;
//

-- Prueba
-- INSERT INTO payment VALUES (NULL, 'check', 'chk');
-- SELECT * FROM payment;

---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 13) Trigger para restar stock, al ingresar una orden 

DELIMITER //
CREATE TRIGGER tr_restar_stock
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE stock 
    SET stock = stock - 1
    WHERE id_product IN 
		(SELECT id_product 
		FROM dish_ingredients 
		WHERE id_dish = NEW.id_dish OR NEW.id_dish2 OR NEW.id_dish2 OR NEW.id_dish3 OR NEW.id_dish4);
END;
//

-- Se deben restar ingredientes 7 stock = 606, 12 = 672 y 25 stock = 843, id_dish es 4 'Nachos', stock se refiere a valores ANTES de realizar el insert de prueba
-- INSERT INTO ORDERS VALUES (NULL,1,20998372,1,4,NULL,NULL,NULL,NULL);
-- SELECT * FROM STOCK;





