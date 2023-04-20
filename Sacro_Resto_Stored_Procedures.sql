USE sacro_resto;

-- 1) SP busqueda clientes por id, nombre o apellido

DELIMITER //
CREATE PROCEDURE sp_clients_info(
	IN id INT, 
	IN name VARCHAR(50), 
	IN l_name VARCHAR(50))
BEGIN
    SELECT * FROM clients 
    WHERE (ID_CLIENT = id OR id IS NULL) 
    AND (first_name LIKE CONCAT('%',name,'%') OR name IS NULL) 
    AND (last_name LIKE CONCAT('%',l_name,'%') OR l_name IS NULL);
END//
DELIMITER ;

-- Prubeas sp_clients_info
-- CALL sp_clients_info(null, 'Julio', null);
-- CALL sp_clients_info(10982733, null , null);
-- CALL sp_clients_info(null, null , 'Martinez');
-- CALL sp_clients_info(null,'Julio','Iglesias');
-- CALL sp_clients_info(92876301,null,'Ortega');

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2) SP ordenar tabla, columna orden asc o desc. Seleccionar que tabla y sobre que columna se quiere ordernar ASC o DESC

DELIMITER //
CREATE PROCEDURE sp_ordenar_tablas(IN nombre_tabla VARCHAR(100), IN campo VARCHAR(100), IN asc_desc VARCHAR(4))
BEGIN
  SET @listar = CONCAT('SELECT * FROM ', nombre_tabla, ' ORDER BY ', campo, ' ', asc_desc);
    PREPARE runSQL FROM @listar;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END//
DELIMITER ;

-- Pruebas sp_ordenar_tablas
-- CALL sp_ordenar_tablas('clients', 'first_name', 'DESC');
-- CALL sp_ordenar_tablas('orders', 'id_order', 'DESC');
-- CALL sp_ordenar_tablas('menu', 'dish_name', 'ASC');

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3) SP Insertar compras

DELIMITER //
CREATE PROCEDURE sp_insert_sale(
	IN invoice_id INT,
    IN product_id INT,
    IN supplier_id INT,
    IN stock_add INT,
    IN amount_amount DECIMAL
)
BEGIN
    INSERT INTO purchase (id_invoice, id_product, id_supplier, add_stock, amount)
    VALUES (invoice_id,product_id, supplier_id, stock_add, amount_amount);
END//
DELIMITER ;


-- Prueba sp_insert sale
-- CALL sp_insert_sale(null,2,1,400,900);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4) SP Insertar pedido

DELIMITER //
CREATE PROCEDURE sp_insert_order(
	IN order_id INT,
    IN employee_id INT,
    IN client_id INT,
    IN branch_id INT,
    IN dish_id INT,
    IN dish_id1 INT,
    IN dish_id2 INT,
    IN dish_id3 INT,
    IN dish_id4 INT
)
BEGIN
    INSERT INTO orders (id_order, id_employee, id_client, id_branch, id_dish, id_dish1, id_dish2, id_dish3, id_dish4)
    VALUES (order_id, employee_id, client_id, branch_id, dish_id, dish_id1, dish_id2, dish_id3, dish_id4);
END//

-- Prueba sp_insert_order
-- CALL sp_insert_order(null,2,20998372,1,13,1,5,9,7);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 5) SP Insertar ticket

DELIMITER //
CREATE PROCEDURE sp_insert_ticket(
	IN bill_id INT,
    IN pay_id INT,
    IN order_id INT,
    IN amount_amount INT,
    IN date_date DATE
)
BEGIN
    INSERT INTO ticket (id_bill, id_pay, id_order, amount, date)
    VALUES (bill_id, pay_id, order_id, amount_amount, CURDATE());
END//
DELIMITER ;

-- Prueba sp_insert_ticket
-- CALL sp_insert_ticket(null,1,10,1000,NULL);

