CREATE DATABASE  IF NOT EXISTS `kendb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `kendb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: kendb
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `employee_employeeId` int(6) unsigned zerofill NOT NULL,
  PRIMARY KEY (`employee_employeeId`),
  CONSTRAINT `fk_accounts_employee` FOREIGN KEY (`employee_employeeId`) REFERENCES `employee` (`employeeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('Ken1','Calvo',000001);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `idcategory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Rice All You Can'),(2,'Appetizer'),(3,'Short Order'),(4,'Pork Specialties'),(5,'Soup'),(6,'Fish'),(7,'Dessert'),(8,'Drinks'),(9,'Home Made Fresh Juice');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employeeId` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (000031,'Ken1','Calvo'),(000032,'Ken2','Calvo'),(000033,'Ken3','Calvo'),(000034,'Ken4','Calvo'),(000035,'Ken5','Calvo'),(000036,'Ken6','Calvo'),(000037,'Ken7','Calvo'),(000038,'Ken8','Calvo'),(000039,'Ken9','Calvo'),(000040,'Ken10','Calvo');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `product_productId` int(11) NOT NULL,
  ` inStock` int(11) DEFAULT NULL,
  KEY `fk_inventory_product1_idx` (`product_productId`),
  CONSTRAINT `fk_inventory_product1` FOREIGN KEY (`product_productId`) REFERENCES `product` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `orders_idorder` int(11) NOT NULL,
  `invoiceDate` datetime DEFAULT NULL,
  `tax` decimal(19,4) DEFAULT '0.0000',
  `amountDue` decimal(19,4) DEFAULT '0.0000',
  `employeeId` int(6) unsigned zerofill NOT NULL,
  KEY `fk_invoices_accounts1_idx` (`employeeId`),
  KEY `fk_invoices_order1_idx` (`orders_idorder`),
  CONSTRAINT `fk_invoices_accounts1` FOREIGN KEY (`employeeId`) REFERENCES `accounts` (`employee_employeeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_order1` FOREIGN KEY (`orders_idorder`) REFERENCES `orders` (`idorder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `orders_idorder` int(11) NOT NULL,
  `product_productId` int(11) NOT NULL,
  `quantity` decimal(10,0) NOT NULL DEFAULT '0',
  `unitPrice` double DEFAULT '0',
  `order_details_status_idorder_details_status` int(11) NOT NULL,
  PRIMARY KEY (`product_productId`,`orders_idorder`),
  KEY `fk_order_details_product1_idx` (`product_productId`),
  KEY `fk_order_details_orders1_idx` (`orders_idorder`),
  KEY `fk_order_details_order_details_status1_idx` (`order_details_status_idorder_details_status`),
  CONSTRAINT `fk_order_details_order_details_status1` FOREIGN KEY (`order_details_status_idorder_details_status`) REFERENCES `order_details_status` (`idorder_details_status`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_orders1` FOREIGN KEY (`orders_idorder`) REFERENCES `orders` (`idorder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_product1` FOREIGN KEY (`product_productId`) REFERENCES `product` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (20,3,2,139,1);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details_status`
--

DROP TABLE IF EXISTS `order_details_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details_status` (
  `idorder_details_status` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idorder_details_status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details_status`
--

LOCK TABLES `order_details_status` WRITE;
/*!40000 ALTER TABLE `order_details_status` DISABLE KEYS */;
INSERT INTO `order_details_status` VALUES (1,'Pending');
/*!40000 ALTER TABLE `order_details_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `idorder_status` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idorder_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'Unpaid'),(2,'Paid'),(3,'Closed');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `idorder` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` datetime DEFAULT NULL,
  `accounts_employee_employeeId` int(6) unsigned zerofill NOT NULL,
  `order_status_idorder_status` int(11) NOT NULL,
  `queue` int(6) DEFAULT NULL,
  PRIMARY KEY (`idorder`,`accounts_employee_employeeId`),
  KEY `fk_orders_accounts1_idx` (`accounts_employee_employeeId`),
  KEY `fk_orders_order_status1_idx` (`order_status_idorder_status`),
  CONSTRAINT `fk_orders_accounts1` FOREIGN KEY (`accounts_employee_employeeId`) REFERENCES `accounts` (`employee_employeeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_order_status1` FOREIGN KEY (`order_status_idorder_status`) REFERENCES `order_status` (`idorder_status`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2018-01-10 09:48:45',000001,3,1),(2,'2018-01-10 09:49:05',000001,3,2),(3,'2018-01-10 11:44:03',000001,3,1),(4,'2018-01-10 13:50:05',000001,3,1),(5,'2018-01-10 14:22:04',000001,3,1),(6,'2018-01-10 14:40:32',000001,3,1),(7,'2018-01-10 14:45:56',000001,3,1),(8,'2018-01-10 14:46:12',000001,3,1),(9,'2018-01-10 14:46:33',000001,3,1),(10,'2018-01-10 14:46:36',000001,3,2),(11,'2018-01-10 15:44:19',000001,3,1),(12,'2018-01-10 15:44:20',000001,1,2),(13,'2018-01-10 15:44:20',000001,1,3),(14,'2018-01-10 15:56:31',000001,1,4),(15,'2018-01-10 15:56:37',000001,1,5),(16,'2018-01-10 15:56:38',000001,1,6),(17,'2018-01-10 15:56:39',000001,3,7),(18,'2018-01-10 15:56:40',000001,3,8),(19,'2018-01-11 14:32:44',000001,3,8),(20,'2018-01-11 14:42:52',000001,1,8),(21,'2018-01-11 14:42:54',000001,3,9);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `pricePerUnit` double NOT NULL DEFAULT '0',
  `category_idcategory` int(11) NOT NULL,
  `discontinued` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`productId`),
  KEY `fk_product_category1_idx` (`category_idcategory`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_idcategory`) REFERENCES `category` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Chicken Inasal',99,1,0),(2,'Grilled Pork Belly',109,1,0),(3,'Grilled Baby Back Ribs',139,1,0),(4,'Tuna Kinilaw',135,2,0),(5,'Pork Sisig',160,2,0),(6,'Chicharon Bulaklak',130,2,0),(7,'Pork Siomai',45,2,0),(8,'Dumplings - Pork',55,2,0),(9,'Dumplings - Chicken',55,2,0),(10,'Lumpia Ubod',60,2,0),(11,'Sotanghon Guisado - Chicken',165,3,0),(12,'Sotanghon Guisado - Pork',165,3,0),(13,'Sotanghon Guisado - Seafood',180,3,0),(14,'Pancit Guisado - Chicken',145,3,0),(15,'Pancit Guisado - Pork',145,3,0),(16,'Pancit Guisado - Seafood',160,3,0),(17,'Bihon Guisado - Chicken',145,3,0),(18,'Bihon Guisado - Pork',145,3,0),(19,'Bihon Guisado - Seafood',160,3,0),(20,'Bam-i - Chicken',165,3,0),(21,'Bam-i - Pork',165,3,0),(22,'Bam-i - Seafood',180,3,0),(23,'Mix Vegetables - Chicken',165,3,0),(24,'Mix Vegetables - Pork',165,3,0),(25,'Mix Vegetables - Seafood',165,3,0),(26,'Crispy Pata',375,4,0),(27,'Patatim',375,4,0),(28,'Grilled Baby Back Ribs Platter',550,4,0),(29,'Native Chicken Binakol',329,5,0),(30,'Native Chicken Tinola',299,5,0),(31,'Seafood Sinigang',139,5,0),(32,'Seafood Tinola',139,5,0),(33,'Steamed Tilapia',175,6,0),(34,'Grilled Tuna Belly',190,6,0),(35,'Steamed Pompano',360,6,0),(36,'Leche Flan Small',30,7,0),(37,'Leche Flan Big',95,7,0),(38,'Maja Blanca',25,7,0),(39,'Fruit Salad',45,7,0),(40,'Macaroni',45,7,0),(41,'Coke',18,8,0),(42,'Sprite',18,8,0),(43,'Royal',18,8,0),(44,'Pineapple Juice',45,8,0),(45,'PineOrange Juice',45,8,0),(46,'Four Seasons Juice',45,8,0),(47,'Camote Juice',22,9,0),(48,'Tanglad',22,9,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'kendb'
--

--
-- Dumping routines for database 'kendb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-15 14:20:32
