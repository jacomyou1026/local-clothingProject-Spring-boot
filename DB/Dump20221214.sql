-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: oc
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `attenitem`
--

DROP TABLE IF EXISTS `attenitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attenitem` (
  `nickname` varchar(15) NOT NULL,
  `itemTitle` varchar(50) DEFAULT NULL,
  `image` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attenitem`
--

LOCK TABLES `attenitem` WRITE;
/*!40000 ALTER TABLE `attenitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `attenitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attenshop`
--

DROP TABLE IF EXISTS `attenshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attenshop` (
  `nickname` varchar(15) NOT NULL,
  `shopName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attenshop`
--

LOCK TABLES `attenshop` WRITE;
/*!40000 ALTER TABLE `attenshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `attenshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyer` (
  `buyerID` varchar(15) NOT NULL,
  `nickname` varchar(15) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `phoneNm` varchar(13) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `length` tinyint unsigned DEFAULT NULL,
  `weight` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`buyerID`,`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checker`
--

DROP TABLE IF EXISTS `checker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checker` (
  `id` varchar(15) NOT NULL,
  `password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checker`
--

LOCK TABLES `checker` WRITE;
/*!40000 ALTER TABLE `checker` DISABLE KEYS */;
/*!40000 ALTER TABLE `checker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `sellerID` varchar(15) NOT NULL,
  `type` enum('D','C') DEFAULT NULL,
  `shopAddr` varchar(100) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `writeDay` date DEFAULT NULL,
  `startDay` date DEFAULT NULL,
  `endDay` date DEFAULT NULL,
  `shopTel` varchar(13) DEFAULT NULL,
  `shopName` varchar(30) DEFAULT NULL,
  KEY `shopAddr_idx` (`shopAddr`),
  KEY `shopName_idx` (`shopName`),
  KEY `shopTel_idx` (`shopTel`),
  CONSTRAINT `e_shopAddr` FOREIGN KEY (`shopAddr`) REFERENCES `seller` (`shopAddr`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `e_shopName` FOREIGN KEY (`shopName`) REFERENCES `seller` (`shopName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `e_shopTel` FOREIGN KEY (`shopTel`) REFERENCES `seller` (`shopTel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `introdution`
--

DROP TABLE IF EXISTS `introdution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `introdution` (
  `shopName` varchar(30) DEFAULT NULL,
  `shopAddr` varchar(100) DEFAULT NULL,
  `shopTel` varchar(13) DEFAULT NULL,
  `shopLogo` tinyblob,
  `style` varchar(20) DEFAULT NULL,
  `content` mediumblob,
  KEY `shopName_idx` (`shopName`),
  KEY `shopAddr_idx` (`shopAddr`),
  KEY `shopTel_idx` (`shopTel`),
  CONSTRAINT `si_shopAddr` FOREIGN KEY (`shopAddr`) REFERENCES `seller` (`shopAddr`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `si_shopName` FOREIGN KEY (`shopName`) REFERENCES `seller` (`shopName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `si_shopTel` FOREIGN KEY (`shopTel`) REFERENCES `seller` (`shopTel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `introdution`
--

LOCK TABLES `introdution` WRITE;
/*!40000 ALTER TABLE `introdution` DISABLE KEYS */;
/*!40000 ALTER TABLE `introdution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `sellerID` varchar(15) NOT NULL,
  `itemCode` varchar(20) DEFAULT NULL,
  `itemTitle` varchar(50) DEFAULT NULL,
  `type` enum('U','D') DEFAULT NULL,
  `price` int unsigned DEFAULT NULL,
  `image` blob,
  `content` mediumblob,
  `soldOut` tinyint DEFAULT NULL,
  UNIQUE KEY `itemCode_UNIQUE` (`itemCode`),
  KEY `si_sellerID_idx` (`sellerID`),
  CONSTRAINT `si_sellerID` FOREIGN KEY (`sellerID`) REFERENCES `seller` (`sellerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderlist` (
  `orderNum` varchar(30) NOT NULL,
  `buyerID` varchar(15) DEFAULT NULL,
  `shopName` varchar(30) DEFAULT NULL,
  `itemName` varchar(50) DEFAULT NULL,
  `OrderListcol` varchar(45) DEFAULT NULL,
  `buyerAddr` varchar(100) DEFAULT NULL,
  `count` tinyint unsigned DEFAULT NULL,
  `price` int unsigned DEFAULT NULL,
  PRIMARY KEY (`orderNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `tNumber` int unsigned NOT NULL,
  `itemTitle` varchar(50) DEFAULT NULL,
  `nickname` varchar(15) DEFAULT NULL,
  `originNum` int unsigned DEFAULT NULL,
  `groupOrd` int unsigned DEFAULT NULL,
  `groupLayer` int unsigned DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `writeDay` date DEFAULT NULL,
  PRIMARY KEY (`tNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `itemCode` varchar(20) DEFAULT NULL,
  `itemTitle` varchar(50) DEFAULT NULL,
  `nickname` varchar(15) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `sellerID` varchar(15) NOT NULL,
  `shopName` varchar(30) DEFAULT NULL,
  `shopAddr` varchar(100) DEFAULT NULL,
  `shopTel` varchar(13) DEFAULT NULL,
  `password` varchar(15) NOT NULL,
  `shopNum` varchar(10) NOT NULL,
  `shopNumPic` mediumblob NOT NULL,
  `leasePic` longblob NOT NULL,
  `Approval` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`sellerID`),
  UNIQUE KEY `shopTel_UNIQUE` (`shopTel`),
  UNIQUE KEY `shopAddr_UNIQUE` (`shopAddr`),
  UNIQUE KEY `shopName_UNIQUE` (`shopName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppinglist`
--

DROP TABLE IF EXISTS `shoppinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppinglist` (
  `buyerID` varchar(15) NOT NULL,
  `shopName` varchar(30) DEFAULT NULL,
  `image` blob,
  `itemTitle` varchar(50) DEFAULT NULL,
  `count` tinyint unsigned DEFAULT NULL,
  `price` int unsigned DEFAULT NULL,
  PRIMARY KEY (`buyerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppinglist`
--

LOCK TABLES `shoppinglist` WRITE;
/*!40000 ALTER TABLE `shoppinglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppinglist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-14 17:37:42
