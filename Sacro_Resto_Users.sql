USE sacro_resto;

-- Creacion usuario
CREATE USER rocio@localhost IDENTIFIED BY 'Rocio993_';
-- Permiso solo de lectura
GRANT SELECT ON sacro_resto.* TO rocio@localhost;
-- Ver permisos usuario
SHOW GRANTS FOR rocio@localhost;

-- Creacion usuario 2
CREATE USER castle@localhost IDENTIFIED BY 'Castle993_';
-- Permiso solo de lectura, insert y update de la bd
GRANT SELECT, INSERT, UPDATE ON sacro_resto.* TO castle@localhost;
-- Ver permisos usuario
SHOW GRANTS FOR castle@localhost;

-- USE mysql;
-- SELECT * FROM user;

