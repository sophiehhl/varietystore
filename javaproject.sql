--
-- Database: `javaproject`
--
CREATE DATABASE IF NOT EXISTS `javaproject` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `javaproject`;

-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: javaproject
-- ------------------------------------------------------
-- Server version	5.7.28-log

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryID` varchar(20) NOT NULL,
  `CategoryName` char(20) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('1','Automotive'),('2','Electronics'),('3','Toys');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `InvoiceID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `InvoiceDate` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `TotalAmount` float NOT NULL DEFAULT '0',
  `IsProcessed` enum('y','n') DEFAULT NULL,
  PRIMARY KEY (`InvoiceID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineitem`
--

DROP TABLE IF EXISTS `lineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineitem` (
  `LineItemID` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceID` int(11) NOT NULL DEFAULT '0',
  `ProductID` int(11) NOT NULL DEFAULT '0',
  `Quantity` int(11) NOT NULL DEFAULT '0',
  `ProductName` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LineItemID`),
  KEY `InvoiceID` (`InvoiceID`),
  CONSTRAINT `lineitem_ibfk_1` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineitem`
--

LOCK TABLES `lineitem` WRITE;
/*!40000 ALTER TABLE `lineitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductID` varchar(20) NOT NULL,
  `CategoryID` varchar(20) NOT NULL,
  `ProductName` char(50) NOT NULL,
  `ProductDetails` char(200) NOT NULL,
  `ProductPrice` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('1001','1','Engine Degreaser','Spray cleaner for Engines',12.00),('1002','1','Spark Plug','Spark driven titanium plug',3.99),('1003','1','Spray Paint','Black automotive spray paint',6.95),('1004','1','2-ton Jack','Automotive jack rated for 2 tons and less',65.00),('1005','1','2-Cycle Oil','SAE 10w-30 full synthetic engine oil',28.99),('1006','1','Floor Mats','Custom 34 inch rubber floor mats',78.95),('1007','1','Windshield Washer Fluid','RainX brand high clean fluid',14.99),('1008','1','Windshield Wipers','24inch alumunium wipers',23.00),('1009','1','Car Wax','RainX brand non streak wax',18.95),('1010','1','Headlight Bulb','1200 lumen ultrabright halogen bulb',21.95),('1011','1','Seat Protector','full leather 28 inch seat cover',95.99),('1012','1','1/8inch Wrench','full steel 1/8 inch wrench',4.95),('1013','1','1/2inch Wrench','full steel 1/2 inch wrench',5.95),('1014','1','3/4inch Wrench','full steel 3/4 inch wrench',6.95),('1015','1','1inch Wrench','full steel 1 inch wrench',7.95),('1016','1','Booster Cables','Super Start 8 gauge 12 booster cables',38.95),('1017','1','Car Battery','Maximum starting power 12 inch car battery',99.99),('1018','1','STP Air Filter','advanced air filter media holds more dirt for maximum engine protection',19.99),('1019','1','Coast To Coast Door Handle Cover','add a touch of chrome for dealers and owners that are looking to customize or upgrade their vehicles appearance or trim level',39.99),('1020','1','Thumbnail  VHT Ford Blue Engine Paint 11oz','They are specially formulated to withstand corrosion, rust, salt spray, chemicals and additives of today’s gasoline blends and degreasers',9.99),('2001','2','45 inch TV','Stunning 45 inch Full HD OLED TV',299.99),('2002','2','50 inch TV','Stunning 50 inch Full HD OLED TV',399.99),('2003','2','55 inch TV','Stunning 55 inch Full HD OLED TV',449.99),('2004','2','70 inch TV','Stunning 70 inch Full HD OLED TV',599.99),('2005','2','Wall Power Strip','Standard 3 prong power strip',12.95),('2006','2','70 inch TV Stand','70 inch TV stand holds up to 65 pounds',68.95),('2007','2','45 inch TV Stand','45 inch TV stand holds up to 45 pounds',49.95),('2008','2','PlayStation 5','Sonys newest generation console',350.00),('2009','2','Blu Ray Player','3 disc HD blu ray player',124.99),('2010','2','Ring - Video Doorbell 3','With improved motion detection and enhanced wifi, you can keep an eye on what’s happening anytime, from anywhere',159.99),('2011','2','Philips - Hue White & Color Ambiance Bulbs','Add color to any room with a single smart bulb, which offers warm to cool white light as well as 16 million colors',89.99),('2012','2','Hover-1 - Superfly Electric Self-Balancing Scooter','This exciting hoverboard takes mobility to a whole new level',119.99),('2013','2','Beats by Dr. Dre - Solo Pro','Get inspired with Solo Pro noise cancelling wireless headphones',179.99),('2014','2','Tile Performance Pack','You’ll gain peace of mind knowing you can open the free Tile app and tap Find to locate your stuff',49.99),('2015','2','Sony Wireless Noise-Cancelling Headphones',' A wide array of smart features will have you wearing them all day afterwards',148.00),('2016','2','Canon - PowerShot SX720','Get super-close to your subject with this Canon Power Camera',299.99),('2017','2','Nikon - D850 DSLR 4k Video','Take sharp, high-resolution photos with this Nikon DSLR camera',2.00),('2018','2','Polaroid Now i-Type Camera','New point-and-shoot camera with autofocus, double exposure, self-timer, and a more accurate flash',119.99),('2019','2','Dyson - Supersonic Hair Dryer','Create gorgeous hairstyles quickly with this high-velocity Dyson Supersonic hair dryer',319.99),('2020','2','Apple Watch Series 6','lets you measure your blood oxygen level with a revolutionary new sensor and app',509.00),('3001','3','Batman Action Figure','Full Plastic 10 inch Batman action figure',12.95),('3002','3','Black Nerf Gun','All black 22 inch Nerf fun with 12 foam darts',29.99),('3003','3','Pony Stuffed Animal','100% cotton pink stuffed unicorn',9.99),('3004','3','Gumball Machine','14 inch gumball machine, gumballs not included',45.00),('3005','3','Basketball','Wilson brand 29.5 inch basketball',29.95),('3006','3','Soccerball','Kids size vinyl red soccerball',24.95),('3007','3','Baseball Bat','32 inch all wood Luisville slugger',99.99),('3008','3','Football','NCAA authentic collectors signed football',199.99),('3009','3','12inch Firetruck','Hotwheels exclusive 12 inch firetruck',12.95),('3010','3','10inch Copcar','Hotwheels exclusive 10 inch copcar',12.95),('3011','3','Gumballs','250 multifalvored gumballs',19.99),('3012','3','RollerSkates','All metal 4 wheel roller skates',50.00),('3013','3','LEGO Overwatch Wrecking Ball','Can transform from a mech into an epic ball and is packed with authentic details from the in-game hero',16.99),('3014','3','Paw Patrol, Dino Rescue and T. Rex Figures','The Dino Patroller is the first-ever motorized team vehicle',49.99),('3015','3','LeapFrog Learning Friends','Touching the words on the pages plays the words, sound effects and fun facts',17.99),('3016','3','TEMI Dinosaur Toy Figure','Complete set of 9 dinosaur action figures',29.99),('3017','3','156pcs Create A Dinosaur','Create unique dinosaur track of the dinosaur world',28.99),('3018','3','VTech Pull and Sing Puppy','Push or pull the playful puppy using the cord to activate music while building gross motor skills',15.99),('3019','3','Toy Rocket Launcher','Kids will have a blast while blasting off with this fantastically fun foam toy rocket launcher',19.99),('3020','3','VTech Write & Learn Create','Learning toy magnetic drawing board provides a fun way to get a head start on learning how to write',19.88);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `CompanyName` varchar(50) DEFAULT NULL,
  `Address1` varchar(50) DEFAULT NULL,
  `Address2` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Zip` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `CreditCardType` varchar(50) DEFAULT NULL,
  `CreditCardNumber` varchar(50) DEFAULT NULL,
  `CreditCardExpirationDate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-03 14:21:02
