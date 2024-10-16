-- MySQL dump 10.13  Distrib 9.0.1, for macos14 (arm64)
--
-- Host: localhost    Database: cit480_db
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `Address_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Zip_code` varchar(20) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Type` enum('B','S') DEFAULT NULL,
  PRIMARY KEY (`Address_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,1,'123 Main St','Springfield','IL','62704','USA','B'),(2,2,'456 Oak St','Metropolis','IL','62960','USA','S'),(3,3,'789 Pine St','Smallville','KS','67524','USA','B'),(4,4,'101 Maple St','Gotham','NY','10001','USA','S'),(5,5,'202 Cedar St','Star City','CA','90210','USA','B');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Brand`
--

DROP TABLE IF EXISTS `Brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Brand` (
  `Brand_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Brand_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brand`
--

LOCK TABLES `Brand` WRITE;
/*!40000 ALTER TABLE `Brand` DISABLE KEYS */;
INSERT INTO `Brand` VALUES (1,'Brand A'),(2,'Brand B'),(3,'Brand C'),(4,'Brand D'),(5,'Brand E');
/*!40000 ALTER TABLE `Brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart` (
  `Cart_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  PRIMARY KEY (`Cart_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
INSERT INTO `Cart` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart_Items`
--

DROP TABLE IF EXISTS `Cart_Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart_Items` (
  `Cart_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `Quantity` int NOT NULL,
  `Item_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Cart_ID`,`Product_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`Cart_ID`) REFERENCES `Cart` (`Cart_ID`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart_Items`
--

LOCK TABLES `Cart_Items` WRITE;
/*!40000 ALTER TABLE `Cart_Items` DISABLE KEYS */;
INSERT INTO `Cart_Items` VALUES (1,1,2,29.99),(1,5,1,14.99),(2,3,1,39.99),(3,2,1,59.99),(3,4,1,99.99),(4,7,1,89.99),(5,8,1,15.99),(5,9,1,79.99);
/*!40000 ALTER TABLE `Cart_Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `Category_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'Fitness Equipment'),(2,'Climbing Gear'),(3,'Footwear'),(4,'Accessories'),(5,'Outdoors');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Item`
--

DROP TABLE IF EXISTS `Order_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_Item` (
  `Order_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  `Item_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`,`Product_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `Orders` (`Order_ID`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Item`
--

LOCK TABLES `Order_Item` WRITE;
/*!40000 ALTER TABLE `Order_Item` DISABLE KEYS */;
INSERT INTO `Order_Item` VALUES (1,1,2,29.99),(1,5,1,14.99),(2,2,1,19.99),(3,3,1,99.99),(4,4,1,89.99),(5,5,1,14.99);
/*!40000 ALTER TABLE `Order_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `Order_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  `Total_amount` decimal(10,2) DEFAULT NULL,
  `Order_status` enum('P','S','D','C') DEFAULT NULL,
  `Created_At` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,129.95,'P','2024-10-16 17:37:57'),(2,2,59.99,'S','2024-10-16 17:37:57'),(3,3,199.99,'D','2024-10-16 17:37:57'),(4,4,89.99,'C','2024-10-16 17:37:57'),(5,5,14.99,'P','2024-10-16 17:37:57');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payment` (
  `Payment_ID` int NOT NULL AUTO_INCREMENT,
  `Order_ID` int NOT NULL,
  `Payment_method` enum('CC','PP') DEFAULT NULL,
  `Payment_status` enum('P','C','F') DEFAULT NULL,
  `Payment_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `Orders` (`Order_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,1,'CC','P','2024-10-16 17:37:57'),(2,2,'PP','F','2024-10-16 17:37:57'),(3,3,'CC','P','2024-10-16 17:37:57'),(4,4,'CC','P','2024-10-16 17:37:57'),(5,5,'PP','F','2024-10-16 17:37:57');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `Product_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Description` text,
  `Price` decimal(10,2) DEFAULT NULL,
  `Category_ID` int NOT NULL,
  `Brand_ID` int NOT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `Category_ID` (`Category_ID`),
  KEY `Brand_ID` (`Brand_ID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `Category` (`Category_ID`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`Brand_ID`) REFERENCES `Brand` (`Brand_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'10lb Dumbbells','A set of 10lb dumbbells for strength training',29.99,1,5),(2,'Climbing Clip','Sturdy clip for climbing safety',19.99,2,3),(3,'Climbing Shoes','Professional climbing shoes for better grip',99.99,2,3),(4,'Running Shoes','Lightweight running shoes for marathon training',89.99,3,4),(5,'Jump Rope','Durable jump rope for cardio workouts',14.99,4,5),(6,'Yoga Mat','Non-slip yoga mat for home and studio use',25.99,1,1),(7,'Resistance Bands','Set of resistance bands for strength training',15.99,1,2),(8,'Pull-Up Bar','Door-mounted pull-up bar for upper body strength',39.99,1,1),(9,'Kettlebell','20lb kettlebell for strength and conditioning',45.99,1,5),(10,'Climbing Harness','Comfortable climbing harness for safety',79.99,2,3),(11,'Running Cap','Breathable cap for outdoor running',19.99,3,4),(12,'Sports Watch','Smart sports watch with GPS and heart-rate monitor',149.99,4,1),(13,'Water Bottle','Insulated water bottle for hydration',24.99,4,2),(14,'Trail Shoes','Shoes designed for trail running and hiking',110.99,3,4),(15,'Climbing Helmet','Protective helmet for rock climbing',89.99,2,3),(16,'Treadmill','High-quality treadmill for indoor running',599.99,1,5),(17,'Cycling Gloves','Gloves designed for cycling and comfort',19.99,4,2),(18,'Foam Roller','Foam roller for muscle recovery and massage',24.99,1,5),(19,'Climbing Rope','Durable rope for mountain climbing',199.99,2,3),(20,'Compression Socks','Socks for better circulation during runs',12.99,3,4);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shipment`
--

DROP TABLE IF EXISTS `Shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shipment` (
  `Shipment_ID` int NOT NULL AUTO_INCREMENT,
  `Order_ID` int NOT NULL,
  `Shipment_method` enum('C','P','ISP') DEFAULT NULL,
  `Shipment_date` timestamp NULL DEFAULT NULL,
  `Tracking_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Shipment_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `Orders` (`Order_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipment`
--

LOCK TABLES `Shipment` WRITE;
/*!40000 ALTER TABLE `Shipment` DISABLE KEYS */;
INSERT INTO `Shipment` VALUES (1,1,'C','2024-10-16 17:37:57','TRACK1234'),(2,2,'P','2024-10-16 17:37:57','TRACK5678'),(3,3,'ISP','2024-10-16 17:37:57','TRACK9876'),(4,4,'P','2024-10-16 17:37:57','TRACK5432'),(5,5,'C','2024-10-16 17:37:57','TRACK6789');
/*!40000 ALTER TABLE `Shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Role` enum('A','C') DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'John Doe','john.doe@example.com','password123','(555)123-4567','C'),(2,'Alice Smith','alice.smith@example.com','password456','(555)234-5678','C'),(3,'Bob Johnson','bob.johnson@example.com','password789','(555)345-6789','C'),(4,'Charlie Brown','charlie.brown@example.com','password111','(555)456-7890','C'),(5,'Admin User','admin@example.com','adminpass','(555)567-8901','A');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-16 10:41:23
