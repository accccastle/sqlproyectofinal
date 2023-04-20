CREATE DATABASE  IF NOT EXISTS `sacro_resto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sacro_resto`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: sacro_resto
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_log`
--

DROP TABLE IF EXISTS `_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_log` (
  `ID_LOG` int NOT NULL AUTO_INCREMENT,
  `ENTITY` varchar(20) DEFAULT NULL,
  `ID_ENTITY` int DEFAULT NULL,
  `DATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER` varchar(200) NOT NULL,
  `ACTION` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_log`
--

LOCK TABLES `_log` WRITE;
/*!40000 ALTER TABLE `_log` DISABLE KEYS */;
INSERT INTO `_log` VALUES (1,'purchase',35,'2023-04-19 22:52:51','root@localhost','insert'),(2,'purchase',36,'2023-04-19 22:52:51','root@localhost','insert'),(3,'purchase',37,'2023-04-19 22:52:51','root@localhost','insert'),(4,'orders',35,'2023-04-19 22:58:04','root@localhost','insert'),(5,'orders',36,'2023-04-19 23:02:11','root@localhost','insert');
/*!40000 ALTER TABLE `_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `ID_BRANCH` int NOT NULL AUTO_INCREMENT,
  `NAME_BRANCH` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_BRANCH`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'Belgrano','Av Cabildo 1238'),(2,'Palermo','Costa Rica 6038'),(3,'Monserrat','Av Rivadavia 1298');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `ID_CLIENT` int NOT NULL,
  `FIRST_NAME` varchar(100) DEFAULT NULL,
  `LAST_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (10332897,'Juan','Martinez'),(10876290,'Matias','Martinez'),(10973290,'Osvaldo','Ramirez'),(10982733,'Manuel','Ferreira'),(11109289,'Rosario','Velazquez'),(14287209,'Sebastian','Carrasco'),(15625582,'Agustina','Estebanez'),(16725815,'Patricio','Montero'),(19987320,'Rosa','Esmeralda'),(20998372,'Rocio','Hernandez'),(22218731,'Julio','Iglesias'),(23998217,'Maria','Lopez'),(37887290,'Umberto','Primo'),(92876301,'Carlos','Ortega');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_clients` AFTER UPDATE ON `clients` FOR EACH ROW BEGIN
    INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('clients', NEW.id_client,CURRENT_TIMESTAMP(),USER(),'update');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dish_ingredients`
--

DROP TABLE IF EXISTS `dish_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_ingredients` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_DISH` int NOT NULL,
  `ID_PRODUCT` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_DISH` (`ID_DISH`),
  KEY `ID_PRODUCT` (`ID_PRODUCT`),
  CONSTRAINT `dish_ingredients_ibfk_1` FOREIGN KEY (`ID_DISH`) REFERENCES `menu` (`ID_DISH`),
  CONSTRAINT `dish_ingredients_ibfk_2` FOREIGN KEY (`ID_PRODUCT`) REFERENCES `products` (`ID_PRODUCT`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_ingredients`
--

LOCK TABLES `dish_ingredients` WRITE;
/*!40000 ALTER TABLE `dish_ingredients` DISABLE KEYS */;
INSERT INTO `dish_ingredients` VALUES (1,1,16),(2,1,24),(3,2,19),(4,2,18),(5,2,12),(6,3,17),(7,3,27),(8,3,22),(9,4,25),(10,4,7),(11,4,12),(12,5,25),(13,5,12),(14,6,25),(15,6,32),(16,6,26),(17,7,23),(18,7,30),(19,7,29),(20,7,2),(21,7,5),(22,8,14),(23,8,13),(24,9,31),(25,9,10),(26,9,29),(27,10,15),(28,10,6),(29,11,5),(30,11,14),(31,11,33),(32,12,9),(33,12,1),(34,12,4),(35,13,8),(36,13,22),(37,14,25),(38,14,20),(39,14,28);
/*!40000 ALTER TABLE `dish_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `ID_EMPLOYEE` int NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(100) DEFAULT NULL,
  `LAST_NAME` varchar(100) DEFAULT NULL,
  `SHIFT` varchar(50) DEFAULT NULL,
  `JOB` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_EMPLOYEE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'ROBERTO','GOMEZ','MAÑANA','COCINA'),(2,'MIGUEL','ROMERO','TARDE','COCINA'),(3,'ROMINA','SOSA','NOCHE','COCINA'),(4,'ALBERTO','DIAZ','MAÑANA','MOZO'),(5,'MANUEL','PEREZ','TARDE','MOZO'),(6,'GREGORIO','TORRES','NOCHE','MOZO'),(7,'SIMON','FLORES','MAÑANA','AYUDANTE'),(8,'DANIELA','ACOSTA','TARDE','AYUDANTE'),(9,'FLORENCIA','ROJAS','NOCHE','AYUDANTE'),(10,'CARLOS','MENDEZ','TARDE','COCINA');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_employees_uppercase` BEFORE INSERT ON `employees` FOR EACH ROW BEGIN
  SET NEW.first_name = UPPER(NEW.first_name);
  SET NEW.last_name = UPPER(NEW.last_name);
  SET NEW.shift = UPPER(NEW.shift);
  SET NEW.job = UPPER(NEW.job);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_employee` AFTER UPDATE ON `employees` FOR EACH ROW BEGIN
    INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('employee', NEW.id_employee,CURRENT_TIMESTAMP(),USER(),'update');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `high_price_dishes`
--

DROP TABLE IF EXISTS `high_price_dishes`;
/*!50001 DROP VIEW IF EXISTS `high_price_dishes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `high_price_dishes` AS SELECT 
 1 AS `dish_name`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `low_price_dishes`
--

DROP TABLE IF EXISTS `low_price_dishes`;
/*!50001 DROP VIEW IF EXISTS `low_price_dishes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `low_price_dishes` AS SELECT 
 1 AS `dish_name`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `ID_DISH` int NOT NULL AUTO_INCREMENT,
  `DISH_NAME` varchar(100) DEFAULT NULL,
  `PRICE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ID_DISH`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Empanada carbon activado',1460),(2,'Dumplings',2620),(3,'Baos',2490),(4,'Nachos',2630),(5,'Tacos poblanos',2630),(6,'Palta masala',2690),(7,'Berenjena gratinada',2620),(8,'Samosas',2540),(9,'Spaghetti asiático',4060),(10,'Ravioles de boniato',4060),(11,'Mezze bowl',3740),(12,'Hamburguesa Sacro',3830),(13,'Tartita de chocolate',2050),(14,'Palta lime pie',2110);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_menu` AFTER UPDATE ON `menu` FOR EACH ROW BEGIN
	INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('menu', NEW.id_dish,CURRENT_TIMESTAMP(),USER(),'update');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ID_ORDER` int NOT NULL AUTO_INCREMENT,
  `ID_EMPLOYEE` int DEFAULT NULL,
  `ID_CLIENT` int DEFAULT NULL,
  `ID_BRANCH` int DEFAULT NULL,
  `ID_DISH` int DEFAULT NULL,
  `ID_DISH1` int DEFAULT NULL,
  `ID_DISH2` int DEFAULT NULL,
  `ID_DISH3` int DEFAULT NULL,
  `ID_DISH4` int DEFAULT NULL,
  PRIMARY KEY (`ID_ORDER`),
  KEY `ID_EMPLOYEE` (`ID_EMPLOYEE`),
  KEY `ID_CLIENT` (`ID_CLIENT`),
  KEY `ID_BRANCH` (`ID_BRANCH`),
  KEY `ID_DISH` (`ID_DISH`),
  KEY `ID_DISH1` (`ID_DISH1`),
  KEY `ID_DISH2` (`ID_DISH2`),
  KEY `ID_DISH3` (`ID_DISH3`),
  KEY `ID_DISH4` (`ID_DISH4`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ID_EMPLOYEE`) REFERENCES `employees` (`ID_EMPLOYEE`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ID_CLIENT`) REFERENCES `clients` (`ID_CLIENT`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`ID_BRANCH`) REFERENCES `branches` (`ID_BRANCH`),
  CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`ID_DISH`) REFERENCES `menu` (`ID_DISH`),
  CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`ID_DISH1`) REFERENCES `menu` (`ID_DISH`),
  CONSTRAINT `orders_ibfk_6` FOREIGN KEY (`ID_DISH2`) REFERENCES `menu` (`ID_DISH`),
  CONSTRAINT `orders_ibfk_7` FOREIGN KEY (`ID_DISH3`) REFERENCES `menu` (`ID_DISH`),
  CONSTRAINT `orders_ibfk_8` FOREIGN KEY (`ID_DISH4`) REFERENCES `menu` (`ID_DISH`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,20998372,1,1,13,6,13,NULL),(2,2,23998217,1,2,14,7,13,14),(3,3,10332897,1,3,1,8,14,1),(4,4,92876301,1,4,2,9,1,2),(5,5,22218731,2,5,3,10,2,3),(6,6,10876290,2,6,4,11,3,4),(7,7,11109289,2,7,5,12,4,7),(8,8,14287209,2,8,6,13,5,13),(9,9,10982733,2,9,7,14,6,14),(10,1,10973290,2,10,8,5,7,1),(11,2,37887290,2,11,9,6,8,2),(12,3,19987320,2,12,10,7,9,3),(13,4,20998372,2,13,11,8,10,4),(14,5,23998217,3,14,12,9,11,5),(15,6,10332897,3,1,13,10,12,6),(16,7,92876301,3,2,14,11,13,7),(17,8,22218731,3,3,1,14,14,8),(18,9,10876290,3,4,13,1,1,9),(19,1,11109289,1,5,14,2,2,10),(20,2,14287209,1,6,1,3,3,11),(21,3,10982733,1,7,2,4,4,12),(22,4,10973290,1,8,3,5,5,13),(23,5,37887290,1,9,4,6,1,14),(24,6,19987320,3,10,5,7,2,1),(25,7,20998372,3,11,6,8,3,2),(26,8,23998217,3,12,7,9,4,3),(27,9,10332897,2,13,8,10,5,4),(28,1,92876301,2,14,9,11,6,5),(29,2,22218731,2,1,10,12,7,8),(30,3,10876290,2,2,11,13,8,9),(31,4,11109289,2,3,12,14,9,10),(32,5,14287209,1,4,13,1,10,11),(33,6,10982733,1,5,14,2,11,12),(34,2,20998372,1,13,1,5,9,7),(35,1,20998372,1,4,5,NULL,NULL,NULL),(36,1,20998372,1,4,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_ingreso_ordenes` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
    INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('orders', NEW.id_order,CURRENT_TIMESTAMP(),USER(),'insert');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_restar_stock` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
    UPDATE stock 
    SET stock = stock - 1
    WHERE id_product IN 
		(SELECT id_product 
		FROM dish_ingredients 
		WHERE id_dish = NEW.id_dish OR NEW.id_dish2 OR NEW.id_dish2 OR NEW.id_dish3 OR NEW.id_dish4);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `pay_with_cash`
--

DROP TABLE IF EXISTS `pay_with_cash`;
/*!50001 DROP VIEW IF EXISTS `pay_with_cash`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pay_with_cash` AS SELECT 
 1 AS `CASH`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pay_with_credit`
--

DROP TABLE IF EXISTS `pay_with_credit`;
/*!50001 DROP VIEW IF EXISTS `pay_with_credit`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pay_with_credit` AS SELECT 
 1 AS `CREDIT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pay_with_debit`
--

DROP TABLE IF EXISTS `pay_with_debit`;
/*!50001 DROP VIEW IF EXISTS `pay_with_debit`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pay_with_debit` AS SELECT 
 1 AS `DEBIT`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `ID_PAY` int NOT NULL AUTO_INCREMENT,
  `NAME_PAY` varchar(100) DEFAULT NULL,
  `SHORT_NAME` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_PAY`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'CREDIT','TC'),(2,'DEBIT','DEB'),(3,'CASH','CH'),(4,'CHECK','CHK');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_payment_uppercase` BEFORE INSERT ON `payment` FOR EACH ROW BEGIN
  SET NEW.name_pay = UPPER(NEW.name_pay);
  SET NEW.short_name = UPPER(NEW.short_name);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ID_PRODUCT` int NOT NULL AUTO_INCREMENT,
  `NAME_PRODUCT` varchar(150) DEFAULT NULL,
  `SHORT_NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCT`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'alcaparras','ALCA'),(2,'algas','ALG'),(3,'almendras','ALMD'),(4,'batatas','BAT'),(5,'berenjena','BERE'),(6,'boniato','BONI'),(7,'calabaza','CALA'),(8,'caramelo salado','CAS'),(9,'cebolla','CEB'),(10,'chili','CHI'),(11,'chocolate','CHOCO'),(12,'cilantro','CIL'),(13,'coco','COC'),(14,'garbanzos','GARB'),(15,'girgolas','GIR'),(16,'hongos','HON'),(17,'jackfruit','JACK'),(18,'jengibre','JEN'),(19,'kimchi','KIM'),(20,'leche condensada de coco','LCOC'),(21,'lima','LIM'),(22,'mani','MAN'),(23,'miso','MIS'),(24,'olivas','OLI'),(25,'palta ','PAL'),(26,'papa','PAP'),(27,'pepino','PEP'),(28,'pistachos','PIST'),(29,'sesamo','SES'),(30,'shiitake','SHI'),(31,'spaghetti ','SPAG'),(32,'yogur de curry','YC'),(33,'coliflor','COL');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_products` AFTER UPDATE ON `products` FOR EACH ROW BEGIN
    INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('products', NEW.id_product,CURRENT_TIMESTAMP(),USER(),'update');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `ID_INVOICE` int NOT NULL AUTO_INCREMENT,
  `ID_PRODUCT` int DEFAULT NULL,
  `ID_SUPPLIER` int DEFAULT NULL,
  `ADD_STOCK` int DEFAULT NULL,
  `AMOUNT` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ID_INVOICE`),
  KEY `ID_PRODUCT` (`ID_PRODUCT`),
  KEY `ID_SUPPLIER` (`ID_SUPPLIER`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`ID_PRODUCT`) REFERENCES `products` (`ID_PRODUCT`),
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`ID_SUPPLIER`) REFERENCES `suppliers` (`ID_SUPPLIER`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,1,1,300,5000),(2,2,2,1000,10000),(3,3,3,550,1300),(4,4,1,410,9000),(5,5,2,200,8000),(6,6,3,900,12000),(7,7,1,606,9000),(8,8,2,619,5000),(9,9,3,632,7000),(10,10,1,645,3000),(11,11,2,659,2000),(12,12,3,672,9000),(13,13,1,685,1300),(14,14,2,698,9000),(15,15,3,711,8000),(16,16,1,724,12000),(17,17,2,737,9000),(18,18,3,751,5000),(19,19,1,764,7000),(20,20,2,777,3000),(21,21,3,790,2000),(22,22,2,803,9000),(23,23,3,816,1300),(24,24,1,829,9000),(25,25,2,843,8000),(26,26,3,856,12000),(27,27,1,869,9000),(28,28,2,882,5000),(29,29,3,895,7000),(30,30,1,711,3000),(31,31,2,724,2000),(32,32,3,737,9000),(33,33,1,751,1000),(34,2,1,400,900),(35,33,3,9100,35000),(36,2,1,100,1000),(37,21,2,500,12000);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_mensaje_error_compra` BEFORE INSERT ON `purchase` FOR EACH ROW BEGIN
    IF NEW.amount < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El importe no puede ser negativo, por favor ingrese un monto correcto';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_ingreso_compras` AFTER INSERT ON `purchase` FOR EACH ROW BEGIN
    INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('purchase', NEW.id_invoice,CURRENT_TIMESTAMP(),USER(),'insert');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_actualizar_stock` AFTER INSERT ON `purchase` FOR EACH ROW BEGIN
    UPDATE stock 
    SET stock = stock + NEW.add_stock 
    WHERE id_product = NEW.id_product;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `range_high_prices`
--

DROP TABLE IF EXISTS `range_high_prices`;
/*!50001 DROP VIEW IF EXISTS `range_high_prices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `range_high_prices` AS SELECT 
 1 AS `price`,
 1 AS `dish_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `range_prices`
--

DROP TABLE IF EXISTS `range_prices`;
/*!50001 DROP VIEW IF EXISTS `range_prices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `range_prices` AS SELECT 
 1 AS `price`,
 1 AS `dish_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sales_branch_1`
--

DROP TABLE IF EXISTS `sales_branch_1`;
/*!50001 DROP VIEW IF EXISTS `sales_branch_1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales_branch_1` AS SELECT 
 1 AS `Belgrano_Sales`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sales_branch_2`
--

DROP TABLE IF EXISTS `sales_branch_2`;
/*!50001 DROP VIEW IF EXISTS `sales_branch_2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales_branch_2` AS SELECT 
 1 AS `Palermo_Sales`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sales_branch_3`
--

DROP TABLE IF EXISTS `sales_branch_3`;
/*!50001 DROP VIEW IF EXISTS `sales_branch_3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales_branch_3` AS SELECT 
 1 AS `Monserrat_Sales`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `ID_STOCK` int NOT NULL AUTO_INCREMENT,
  `ID_PRODUCT` int DEFAULT NULL,
  `NAME_PRODUCT` varchar(100) DEFAULT NULL,
  `STOCK` int DEFAULT NULL,
  PRIMARY KEY (`ID_STOCK`),
  KEY `ID_PRODUCT` (`ID_PRODUCT`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`ID_PRODUCT`) REFERENCES `products` (`ID_PRODUCT`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,'alcaparras',300),(2,2,'algas',1100),(3,3,'almendras',550),(4,4,'batatas',410),(5,5,'berenjena',200),(6,6,'boniato',900),(7,7,'calabaza',604),(8,8,'caramelo salado',619),(9,9,'cebolla',632),(10,10,'chili',645),(11,11,'chocolate',659),(12,12,'cilantro',670),(13,13,'coco',685),(14,14,'garbanzos',698),(15,15,'girgolas',711),(16,16,'hongos',724),(17,17,'jackfruit',737),(18,18,'jengibre',751),(19,19,'kimchi',764),(20,20,'leche condensada de coco',777),(21,21,'lima',1290),(22,22,'mani',803),(23,23,'miso',816),(24,24,'olivas',829),(25,25,'palta ',841),(26,26,'papa',856),(27,27,'pepino',869),(28,28,'pistachos',882),(29,29,'sesamo',895),(30,30,'shiitake',711),(31,31,'spaghetti ',724),(32,32,'yogur de curry',737),(33,33,'coliflor',9851);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `ID_SUPPLIER` int NOT NULL AUTO_INCREMENT,
  `NAME_SUPPLIER` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_SUPPLIER`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Frutas del Norte'),(2,'Verduleria Prisma'),(3,'Verduras Juancito');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ID_BILL` int NOT NULL AUTO_INCREMENT,
  `ID_PAY` int DEFAULT NULL,
  `ID_ORDER` int DEFAULT NULL,
  `AMOUNT` decimal(10,0) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  PRIMARY KEY (`ID_BILL`),
  KEY `ID_PAY` (`ID_PAY`),
  KEY `ID_ORDER` (`ID_ORDER`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`ID_PAY`) REFERENCES `payment` (`ID_PAY`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`ID_ORDER`) REFERENCES `orders` (`ID_ORDER`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,1,1460,'2022-03-10'),(2,2,2,2620,'2022-03-10'),(3,3,3,2490,'2022-03-10'),(4,1,4,2630,'2022-03-10'),(5,2,5,2630,'2022-03-15'),(6,3,6,2690,'2022-03-15'),(7,1,7,2620,'2022-03-15'),(8,2,8,2540,'2022-03-15'),(9,3,9,4060,'2022-03-15'),(10,1,10,4060,'2022-03-15'),(11,2,11,3740,'2022-03-18'),(12,3,12,3830,'2022-03-18'),(13,1,13,2050,'2022-03-18'),(14,2,14,2110,'2022-03-18'),(15,1,15,1460,'2022-03-18'),(16,2,16,2620,'2022-03-18'),(17,3,17,2490,'2022-03-19'),(18,1,18,2630,'2022-03-19'),(19,2,19,2630,'2022-03-19'),(20,3,20,2690,'2022-03-19'),(21,1,21,2620,'2022-03-19'),(22,2,22,2540,'2022-03-19'),(23,3,23,4060,'2022-03-19'),(24,1,24,4060,'2022-03-20'),(25,2,25,3740,'2022-03-20'),(26,3,26,3830,'2022-03-20'),(27,1,27,2050,'2022-03-20'),(28,2,28,2110,'2022-03-20'),(29,1,29,1460,'2022-03-21'),(30,2,30,2620,'2022-03-21'),(31,3,31,2490,'2022-03-21'),(32,1,32,2630,'2022-03-21'),(33,2,33,2630,'2022-03-21'),(34,1,10,1000,'2023-04-19');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_mensaje_error_venta` BEFORE INSERT ON `ticket` FOR EACH ROW BEGIN
    IF NEW.amount < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El importe no puede ser negativo, por favor ingrese un monto correcto';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_ingreso_ventas` AFTER INSERT ON `ticket` FOR EACH ROW BEGIN
    INSERT INTO _log (entity, id_entity, date_time, user, ACTION)
    VALUES ('ticket', NEW.id_bill,CURRENT_TIMESTAMP(),USER(),'insert');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'sacro_resto'
--

--
-- Dumping routines for database 'sacro_resto'
--
/*!50003 DROP FUNCTION IF EXISTS `COMPRAS_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `COMPRAS_PROVEEDOR`(PROVEEDOR INT) RETURNS int
    READS SQL DATA
BEGIN
	DECLARE TOTAL INT;
	SET TOTAL = (
		SELECT SUM(AMOUNT)
        FROM PURCHASE
        WHERE ID_SUPPLIER LIKE PROVEEDOR);
	RETURN TOTAL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `VENTAS_EMPLEADOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `VENTAS_EMPLEADOS`(EMPLEADO INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE TOTAL INT;
    SET TOTAL = (
		SELECT COUNT(ID_EMPLOYEE)
        FROM ORDERS
        WHERE ID_EMPLOYEE LIKE EMPLEADO);
	RETURN TOTAL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `VENTAS_PAGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `VENTAS_PAGO`(PAGO INT) RETURNS int
    READS SQL DATA
BEGIN 
	DECLARE TOTAL INT;
    SET TOTAL = (
		SELECT SUM(AMOUNT)
		FROM TICKET 
		WHERE ID_PAY LIKE PAGO);
    RETURN TOTAL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_clients_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_clients_info`(
	IN id INT, 
	IN name VARCHAR(50), 
	IN l_name VARCHAR(50))
BEGIN
    SELECT * FROM clients 
    WHERE (ID_CLIENT = id OR id IS NULL) 
    AND (first_name LIKE CONCAT('%',name,'%') OR name IS NULL) 
    AND (last_name LIKE CONCAT('%',l_name,'%') OR l_name IS NULL);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_order`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_sale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_sale`(
	IN invoice_id INT,
    IN product_id INT,
    IN supplier_id INT,
    IN stock_add INT,
    IN amount_amount DECIMAL
)
BEGIN
    INSERT INTO purchase (id_invoice, id_product, id_supplier, add_stock, amount)
    VALUES (invoice_id,product_id, supplier_id, stock_add, amount_amount);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_ticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_ticket`(
	IN bill_id INT,
    IN pay_id INT,
    IN order_id INT,
    IN amount_amount INT,
    IN date_date DATE
)
BEGIN
    INSERT INTO ticket (id_bill, id_pay, id_order, amount, date)
    VALUES (bill_id, pay_id, order_id, amount_amount, CURDATE());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ordenar_tablas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ordenar_tablas`(IN nombre_tabla VARCHAR(100), IN campo VARCHAR(100), IN asc_desc VARCHAR(4))
BEGIN
  SET @listar = CONCAT('SELECT * FROM ', nombre_tabla, ' ORDER BY ', campo, ' ', asc_desc);
    PREPARE runSQL FROM @listar;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `high_price_dishes`
--

/*!50001 DROP VIEW IF EXISTS `high_price_dishes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `high_price_dishes` AS select `menu`.`DISH_NAME` AS `dish_name`,`menu`.`PRICE` AS `price` from `menu` where (`menu`.`PRICE` > 2000) order by `menu`.`PRICE` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `low_price_dishes`
--

/*!50001 DROP VIEW IF EXISTS `low_price_dishes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `low_price_dishes` AS select `menu`.`DISH_NAME` AS `dish_name`,`menu`.`PRICE` AS `price` from `menu` where (`menu`.`PRICE` < 2000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pay_with_cash`
--

/*!50001 DROP VIEW IF EXISTS `pay_with_cash`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pay_with_cash` AS select count(`ticket`.`ID_PAY`) AS `CASH` from `ticket` where (`ticket`.`ID_PAY` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pay_with_credit`
--

/*!50001 DROP VIEW IF EXISTS `pay_with_credit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pay_with_credit` AS select count(`ticket`.`ID_PAY`) AS `CREDIT` from `ticket` where (`ticket`.`ID_PAY` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pay_with_debit`
--

/*!50001 DROP VIEW IF EXISTS `pay_with_debit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pay_with_debit` AS select count(`ticket`.`ID_PAY`) AS `DEBIT` from `ticket` where (`ticket`.`ID_PAY` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `range_high_prices`
--

/*!50001 DROP VIEW IF EXISTS `range_high_prices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `range_high_prices` AS select `menu`.`PRICE` AS `price`,`menu`.`DISH_NAME` AS `dish_name` from `menu` where (`menu`.`PRICE` between 3001 and 10000) order by `menu`.`DISH_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `range_prices`
--

/*!50001 DROP VIEW IF EXISTS `range_prices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `range_prices` AS select `menu`.`PRICE` AS `price`,`menu`.`DISH_NAME` AS `dish_name` from `menu` where (`menu`.`PRICE` between 1000 and 3000) order by `menu`.`DISH_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales_branch_1`
--

/*!50001 DROP VIEW IF EXISTS `sales_branch_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_branch_1` AS select count(`orders`.`ID_BRANCH`) AS `Belgrano_Sales` from `orders` where (`orders`.`ID_BRANCH` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales_branch_2`
--

/*!50001 DROP VIEW IF EXISTS `sales_branch_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_branch_2` AS select count(`orders`.`ID_BRANCH`) AS `Palermo_Sales` from `orders` where (`orders`.`ID_BRANCH` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales_branch_3`
--

/*!50001 DROP VIEW IF EXISTS `sales_branch_3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_branch_3` AS select count(`orders`.`ID_BRANCH`) AS `Monserrat_Sales` from `orders` where (`orders`.`ID_BRANCH` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-20 13:27:18
