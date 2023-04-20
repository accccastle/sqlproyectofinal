USE sacro_resto;

-- Insert Branches
INSERT INTO Branches VALUES (NULL,'Belgrano','Av Cabildo 1238');
INSERT INTO Branches VALUES (NULL,'Palermo','Costa Rica 6038');
INSERT INTO Branches VALUES (NULL,'Monserrat','Av Rivadavia 1298');

-- Insert Employees
INSERT INTO Employees VALUES (NULL,'ROBERTO','GOMEZ','MAÑANA','COCINA');
INSERT INTO Employees VALUES (NULL,'MIGUEL','ROMERO','TARDE','COCINA');
INSERT INTO Employees VALUES (NULL,'ROMINA','SOSA','NOCHE','COCINA');
INSERT INTO Employees VALUES (NULL,'ALBERTO','DIAZ','MAÑANA','MOZO');
INSERT INTO Employees VALUES (NULL,'MANUEL','PEREZ','TARDE','MOZO');
INSERT INTO Employees VALUES (NULL,'GREGORIO','TORRES','NOCHE','MOZO');
INSERT INTO Employees VALUES (NULL,'SIMON','FLORES','MAÑANA','AYUDANTE');
INSERT INTO Employees VALUES (NULL,'DANIELA','ACOSTA','TARDE','AYUDANTE');
INSERT INTO Employees VALUES (NULL,'FLORENCIA','ROJAS','NOCHE','AYUDANTE');

-- Insert Menu
INSERT INTO Menu VALUES (NULL,'Empanada carbon activado',1460);
INSERT INTO Menu VALUES (NULL,'Dumplings',2620);
INSERT INTO Menu VALUES (NULL,'Baos',2490);
INSERT INTO Menu VALUES (NULL,'Nachos',2630);
INSERT INTO Menu VALUES (NULL,'Tacos poblanos',2630);
INSERT INTO Menu VALUES (NULL,'Palta masala',2690);
INSERT INTO Menu VALUES (NULL,'Berenjena gratinada',2620);
INSERT INTO Menu VALUES (NULL,'Samosas',2540);
INSERT INTO Menu VALUES (NULL,'Spaghetti asiático',4060);
INSERT INTO Menu VALUES (NULL,'Ravioles de boniato',4060);
INSERT INTO Menu VALUES (NULL,'Mezze bowl',3740);
INSERT INTO Menu VALUES (NULL,'Hamburguesa Sacro',3830);
INSERT INTO Menu VALUES (NULL,'Tartita de chocolate',2050);
INSERT INTO Menu VALUES (NULL,'Palta lime pie',2110);

-- Insert Payment
INSERT INTO Payment VALUES(NULL,'CREDIT','TC');
INSERT INTO Payment VALUES(NULL,'DEBIT','DEB');
INSERT INTO Payment VALUES(NULL,'CASH','CH');

-- Insert Suppliers
INSERT INTO Suppliers VALUES (NULL,'Frutas del Norte');
INSERT INTO Suppliers VALUES (NULL,'Verduleria Prisma');
INSERT INTO Suppliers VALUES (NULL,'Verduras Juancito'); 
