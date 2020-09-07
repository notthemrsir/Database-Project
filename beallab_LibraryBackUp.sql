-- MySQL dump 10.16  Distrib 10.1.41-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: beallab_library
-- ------------------------------------------------------
-- Server version	10.1.41-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Article`
--

DROP TABLE IF EXISTS `Article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Article` (
  `primary_author` varchar(255) NOT NULL,
  `secondary_author` varchar(255) DEFAULT NULL,
  `issn` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`issn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article`
--

LOCK TABLES `Article` WRITE;
/*!40000 ALTER TABLE `Article` DISABLE KEYS */;
INSERT INTO `Article` VALUES ('Clark John',NULL,9993,'The Journey Home','The Journey home details ...');
/*!40000 ALTER TABLE `Article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Barcodes`
--

DROP TABLE IF EXISTS `Barcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Barcodes` (
  `barcode_number` int(11) NOT NULL,
  `item_status` varchar(255) DEFAULT 'Available',
  PRIMARY KEY (`barcode_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Barcodes`
--

LOCK TABLES `Barcodes` WRITE;
/*!40000 ALTER TABLE `Barcodes` DISABLE KEYS */;
INSERT INTO `Barcodes` VALUES (123,'Available'),(456,'Available'),(888,'Available');
/*!40000 ALTER TABLE `Barcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CD`
--

DROP TABLE IF EXISTS `CD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CD` (
  `artist` varchar(255) NOT NULL,
  `secondary_artist` varchar(255) DEFAULT NULL,
  `music_style` varchar(255) NOT NULL,
  `barcode_number` int(11) NOT NULL,
  PRIMARY KEY (`barcode_number`),
  CONSTRAINT `CD_ibfk_1` FOREIGN KEY (`barcode_number`) REFERENCES `Disc_Media` (`barcode_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CD`
--

LOCK TABLES `CD` WRITE;
/*!40000 ALTER TABLE `CD` DISABLE KEYS */;
INSERT INTO `CD` VALUES ('John Lennon',NULL,'Rock',123);
/*!40000 ALTER TABLE `CD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Calculator`
--

DROP TABLE IF EXISTS `Calculator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Calculator` (
  `calculator_loan_duration` int(11) DEFAULT '14',
  `calculator_loan_fine_rate` decimal(5,2) DEFAULT '2.50',
  `calculator_availability_status` varchar(255) NOT NULL,
  `barcode_number` int(11) NOT NULL,
  PRIMARY KEY (`barcode_number`),
  CONSTRAINT `Calculator_ibfk_1` FOREIGN KEY (`barcode_number`) REFERENCES `Rentable_Items` (`barcode_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calculator`
--

LOCK TABLES `Calculator` WRITE;
/*!40000 ALTER TABLE `Calculator` DISABLE KEYS */;
/*!40000 ALTER TABLE `Calculator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Camera`
--

DROP TABLE IF EXISTS `Camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Camera` (
  `camera_loan_duration` int(11) DEFAULT '7',
  `camera_loan_fine_rate` decimal(5,2) DEFAULT '10.00',
  `camera_availability_status` varchar(255) NOT NULL,
  `barcode_number` int(11) NOT NULL,
  PRIMARY KEY (`barcode_number`),
  CONSTRAINT `Camera_ibfk_1` FOREIGN KEY (`barcode_number`) REFERENCES `Rentable_Items` (`barcode_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Camera`
--

LOCK TABLES `Camera` WRITE;
/*!40000 ALTER TABLE `Camera` DISABLE KEYS */;
/*!40000 ALTER TABLE `Camera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Check_Out`
--

DROP TABLE IF EXISTS `Check_Out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Check_Out` (
  `loan_ID` int(11) NOT NULL,
  `lib_ID` int(11) DEFAULT NULL,
  `barcode_number` int(11) DEFAULT NULL,
  `patron_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`loan_ID`),
  KEY `barcode_number` (`barcode_number`),
  KEY `patron_ID` (`patron_ID`),
  KEY `lib_ID` (`lib_ID`),
  CONSTRAINT `Check_Out_ibfk_1` FOREIGN KEY (`barcode_number`) REFERENCES `Barcodes` (`barcode_number`),
  CONSTRAINT `Check_Out_ibfk_3` FOREIGN KEY (`patron_ID`) REFERENCES `Patron` (`catID`),
  CONSTRAINT `Check_Out_ibfk_4` FOREIGN KEY (`lib_ID`) REFERENCES `Librarian` (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Check_Out`
--

LOCK TABLES `Check_Out` WRITE;
/*!40000 ALTER TABLE `Check_Out` DISABLE KEYS */;
/*!40000 ALTER TABLE `Check_Out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DVD`
--

DROP TABLE IF EXISTS `DVD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DVD` (
  `main_director` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `barcode_number` int(11) NOT NULL,
  PRIMARY KEY (`barcode_number`),
  CONSTRAINT `DVD_ibfk_1` FOREIGN KEY (`barcode_number`) REFERENCES `Disc_Media` (`barcode_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DVD`
--

LOCK TABLES `DVD` WRITE;
/*!40000 ALTER TABLE `DVD` DISABLE KEYS */;
/*!40000 ALTER TABLE `DVD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Digital_Article`
--

DROP TABLE IF EXISTS `Digital_Article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Digital_Article` (
  `online_source` varchar(255) NOT NULL,
  `issn` int(11) NOT NULL,
  PRIMARY KEY (`issn`),
  CONSTRAINT `Digital_Article_ibfk_1` FOREIGN KEY (`issn`) REFERENCES `Article` (`issn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Digital_Article`
--

LOCK TABLES `Digital_Article` WRITE;
/*!40000 ALTER TABLE `Digital_Article` DISABLE KEYS */;
/*!40000 ALTER TABLE `Digital_Article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disc_Media`
--

DROP TABLE IF EXISTS `Disc_Media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disc_Media` (
  `title` varchar(255) NOT NULL,
  `barcode_number` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`barcode_number`),
  CONSTRAINT `Disc_Media_ibfk_1` FOREIGN KEY (`barcode_number`) REFERENCES `Barcodes` (`barcode_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disc_Media`
--

LOCK TABLES `Disc_Media` WRITE;
/*!40000 ALTER TABLE `Disc_Media` DISABLE KEYS */;
INSERT INTO `Disc_Media` VALUES ('Imagine',123,'John Lennons Imagine Cd with tracks ...');
/*!40000 ALTER TABLE `Disc_Media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty` (
  `faculty_permissions` int(11) DEFAULT '3',
  `faculty_book_checkout_period` int(11) DEFAULT '30',
  `faculty_media_checkout_period` int(11) DEFAULT '30',
  `faculty_fine_rate` decimal(5,2) DEFAULT '2.50',
  `faculty_max_books_allowed_out` int(11) DEFAULT '50',
  `faculty_max_media_allowed_out` int(11) DEFAULT '50',
  `catID` int(11) NOT NULL,
  PRIMARY KEY (`catID`),
  CONSTRAINT `Faculty_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `Patron` (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES (3,30,30,2.50,50,50,981324);
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guest`
--

DROP TABLE IF EXISTS `Guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Guest` (
  `guest_permissions` int(11) DEFAULT '1',
  `guest_book_checkout_period` int(11) DEFAULT '7',
  `guest_media_checkout_period` int(11) DEFAULT '7',
  `guest_fine_rate` decimal(5,2) DEFAULT '1.25',
  `guest_max_books_allowed_out` int(11) DEFAULT '10',
  `guest_max_media_allowed_out` int(11) DEFAULT '10',
  `catID` int(11) NOT NULL,
  PRIMARY KEY (`catID`),
  CONSTRAINT `Guest_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `Patron` (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guest`
--

LOCK TABLES `Guest` WRITE;
/*!40000 ALTER TABLE `Guest` DISABLE KEYS */;
INSERT INTO `Guest` VALUES (1,7,7,1.25,10,10,555111);
/*!40000 ALTER TABLE `Guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Laptop`
--

DROP TABLE IF EXISTS `Laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Laptop` (
  `laptop_loan_duration` int(11) DEFAULT '1',
  `laptop_loan_fine_rate` decimal(5,2) DEFAULT '25.00',
  `laptop_availability_status` varchar(255) NOT NULL,
  `barcode_number` int(11) NOT NULL,
  PRIMARY KEY (`barcode_number`),
  CONSTRAINT `Laptop_ibfk_1` FOREIGN KEY (`barcode_number`) REFERENCES `Rentable_Items` (`barcode_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Laptop`
--

LOCK TABLES `Laptop` WRITE;
/*!40000 ALTER TABLE `Laptop` DISABLE KEYS */;
INSERT INTO `Laptop` VALUES (1,25.00,'Loand Out',111);
/*!40000 ALTER TABLE `Laptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Librarian`
--

DROP TABLE IF EXISTS `Librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Librarian` (
  `librarian_permissions` int(11) DEFAULT '4',
  `librarian_book_checkout_period` int(11) DEFAULT '14',
  `librarian_media_checkout_period` int(11) DEFAULT '7',
  `librarian_fine_rate` decimal(5,2) DEFAULT '3.00',
  `librarian_max_books_allowed_out` int(11) DEFAULT '25',
  `librarian_max_media_allowed_out` int(11) DEFAULT '25',
  `catID` int(11) NOT NULL,
  PRIMARY KEY (`catID`),
  CONSTRAINT `Librarian_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `Patron` (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Librarian`
--

LOCK TABLES `Librarian` WRITE;
/*!40000 ALTER TABLE `Librarian` DISABLE KEYS */;
INSERT INTO `Librarian` VALUES (4,14,7,3.00,25,25,777444);
/*!40000 ALTER TABLE `Librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Online_Book`
--

DROP TABLE IF EXISTS `Online_Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Online_Book` (
  `primary_author` varchar(100) NOT NULL,
  `secondary_author` varchar(255) DEFAULT NULL,
  `isbn` bigint(8) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `genre` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `link_to_text` varchar(90) NOT NULL,
  PRIMARY KEY (`primary_author`,`link_to_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Online_Book`
--

LOCK TABLES `Online_Book` WRITE;
/*!40000 ALTER TABLE `Online_Book` DISABLE KEYS */;
INSERT INTO `Online_Book` VALUES ('Ray Bradbury',NULL,9788429772456,'Simon & Schuster','Fiction','Fahrenheit 451','Guy Montag is a fireman...','cool url here');
/*!40000 ALTER TABLE `Online_Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patron`
--

DROP TABLE IF EXISTS `Patron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patron` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `fine_total` decimal(5,2) DEFAULT '0.00',
  `catID` int(11) NOT NULL,
  PRIMARY KEY (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patron`
--

LOCK TABLES `Patron` WRITE;
/*!40000 ALTER TABLE `Patron` DISABLE KEYS */;
INSERT INTO `Patron` VALUES ('Lucas','Beal',0.00,555111),('Khan','Singh',0.00,777444),('Carl','Eugen',50.00,888222),('Andrew','Berns',0.00,981324);
/*!40000 ALTER TABLE `Patron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Print_Article`
--

DROP TABLE IF EXISTS `Print_Article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Print_Article` (
  `barcode_number` int(11) NOT NULL,
  `issn` int(11) DEFAULT NULL,
  PRIMARY KEY (`barcode_number`),
  KEY `issn` (`issn`),
  CONSTRAINT `Print_Article_ibfk_1` FOREIGN KEY (`issn`) REFERENCES `Article` (`issn`),
  CONSTRAINT `Print_Article_ibfk_2` FOREIGN KEY (`barcode_number`) REFERENCES `Barcodes` (`barcode_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Print_Article`
--

LOCK TABLES `Print_Article` WRITE;
/*!40000 ALTER TABLE `Print_Article` DISABLE KEYS */;
/*!40000 ALTER TABLE `Print_Article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Print_Book`
--

DROP TABLE IF EXISTS `Print_Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Print_Book` (
  `primary_author` varchar(255) NOT NULL,
  `secondary_author` varchar(255) DEFAULT NULL,
  `isbn` int(11) DEFAULT NULL,
  `barcode_number` int(11) NOT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `genre` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `dewey_decimal` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`barcode_number`),
  CONSTRAINT `Print_Book_ibfk_1` FOREIGN KEY (`barcode_number`) REFERENCES `Barcodes` (`barcode_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Print_Book`
--

LOCK TABLES `Print_Book` WRITE;
/*!40000 ALTER TABLE `Print_Book` DISABLE KEYS */;
INSERT INTO `Print_Book` VALUES ('Hall',NULL,878,888,'Some Publisher','Fiction','My Hone',NULL,'Description Here');
/*!40000 ALTER TABLE `Print_Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Print_Queue`
--

DROP TABLE IF EXISTS `Print_Queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Print_Queue` (
  `position` int(11) NOT NULL,
  `document` varchar(255) NOT NULL,
  `patronID` int(11) NOT NULL,
  PRIMARY KEY (`position`,`patronID`),
  KEY `patronID` (`patronID`),
  CONSTRAINT `Print_Queue_ibfk_1` FOREIGN KEY (`patronID`) REFERENCES `Patron` (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Print_Queue`
--

LOCK TABLES `Print_Queue` WRITE;
/*!40000 ALTER TABLE `Print_Queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `Print_Queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Printer`
--

DROP TABLE IF EXISTS `Printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Printer` (
  `printer_id` varchar(100) NOT NULL,
  `printer_location` varchar(255) NOT NULL,
  `printer_ink_level` int(11) NOT NULL,
  `printer_paper_level` int(11) NOT NULL,
  `printer_operating_status` varchar(255) NOT NULL,
  PRIMARY KEY (`printer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Printer`
--

LOCK TABLES `Printer` WRITE;
/*!40000 ALTER TABLE `Printer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rent_Item`
--

DROP TABLE IF EXISTS `Rent_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rent_Item` (
  `loan_ID` int(11) NOT NULL,
  `lib_ID` int(11) DEFAULT NULL,
  `barcode_number` int(11) DEFAULT NULL,
  `patron_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`loan_ID`),
  KEY `barcode_number` (`barcode_number`),
  KEY `patron_ID` (`patron_ID`),
  KEY `lib_ID` (`lib_ID`),
  CONSTRAINT `Rent_Item_ibfk_1` FOREIGN KEY (`barcode_number`) REFERENCES `Rentable_Items` (`barcode_number`),
  CONSTRAINT `Rent_Item_ibfk_3` FOREIGN KEY (`patron_ID`) REFERENCES `Patron` (`catID`),
  CONSTRAINT `Rent_Item_ibfk_4` FOREIGN KEY (`lib_ID`) REFERENCES `Librarian` (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rent_Item`
--

LOCK TABLES `Rent_Item` WRITE;
/*!40000 ALTER TABLE `Rent_Item` DISABLE KEYS */;
INSERT INTO `Rent_Item` VALUES (1,777444,111,888222),(2,777444,774455,888222);
/*!40000 ALTER TABLE `Rent_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rentable_Items`
--

DROP TABLE IF EXISTS `Rentable_Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rentable_Items` (
  `item_name` varchar(255) NOT NULL,
  `barcode_number` int(11) NOT NULL,
  PRIMARY KEY (`barcode_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rentable_Items`
--

LOCK TABLES `Rentable_Items` WRITE;
/*!40000 ALTER TABLE `Rentable_Items` DISABLE KEYS */;
INSERT INTO `Rentable_Items` VALUES ('Laptop1',111),('Laptop1',774455);
/*!40000 ALTER TABLE `Rentable_Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room_Reservation`
--

DROP TABLE IF EXISTS `Room_Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room_Reservation` (
  `reservation_number` int(11) NOT NULL,
  `student_ID` int(11) DEFAULT NULL,
  `room_number` int(11) NOT NULL,
  PRIMARY KEY (`reservation_number`,`room_number`),
  KEY `room_number` (`room_number`),
  KEY `student_ID` (`student_ID`),
  CONSTRAINT `Room_Reservation_ibfk_2` FOREIGN KEY (`room_number`) REFERENCES `Student_Study_Room` (`room_number`),
  CONSTRAINT `Room_Reservation_ibfk_3` FOREIGN KEY (`student_ID`) REFERENCES `Student` (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room_Reservation`
--

LOCK TABLES `Room_Reservation` WRITE;
/*!40000 ALTER TABLE `Room_Reservation` DISABLE KEYS */;
INSERT INTO `Room_Reservation` VALUES (878,888222,2);
/*!40000 ALTER TABLE `Room_Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Scan_Queue`
--

DROP TABLE IF EXISTS `Scan_Queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Scan_Queue` (
  `position` int(11) NOT NULL,
  `document` varchar(255) NOT NULL,
  `patronID` int(11) NOT NULL,
  PRIMARY KEY (`position`,`patronID`),
  KEY `patronID` (`patronID`),
  CONSTRAINT `Scan_Queue_ibfk_1` FOREIGN KEY (`patronID`) REFERENCES `Patron` (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Scan_Queue`
--

LOCK TABLES `Scan_Queue` WRITE;
/*!40000 ALTER TABLE `Scan_Queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `Scan_Queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Scanner`
--

DROP TABLE IF EXISTS `Scanner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Scanner` (
  `scanner_id` varchar(100) NOT NULL,
  `scanner_location` varchar(255) NOT NULL,
  `scanner_operating_status` varchar(255) NOT NULL,
  PRIMARY KEY (`scanner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Scanner`
--

LOCK TABLES `Scanner` WRITE;
/*!40000 ALTER TABLE `Scanner` DISABLE KEYS */;
/*!40000 ALTER TABLE `Scanner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `student_permissions` int(11) DEFAULT '2',
  `student_book_checkout_period` int(11) DEFAULT '14',
  `student_media_checkout_period` int(11) DEFAULT '7',
  `student_fine_rate` decimal(5,2) DEFAULT '1.25',
  `student_max_books_allowed_out` int(11) DEFAULT '15',
  `student_max_media_allowed_out` int(11) DEFAULT '15',
  `catID` int(11) NOT NULL,
  PRIMARY KEY (`catID`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`catID`) REFERENCES `Patron` (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (2,14,7,1.25,15,15,888222);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_Study_Room`
--

DROP TABLE IF EXISTS `Student_Study_Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_Study_Room` (
  `room_number` int(11) NOT NULL,
  `room_computer` varchar(255) DEFAULT NULL,
  `wall_whiteboard` varchar(255) DEFAULT NULL,
  `recommended_seating_limit` int(11) NOT NULL,
  PRIMARY KEY (`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_Study_Room`
--

LOCK TABLES `Student_Study_Room` WRITE;
/*!40000 ALTER TABLE `Student_Study_Room` DISABLE KEYS */;
INSERT INTO `Student_Study_Room` VALUES (2,NULL,NULL,8);
/*!40000 ALTER TABLE `Student_Study_Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Whiteboard_Markers`
--

DROP TABLE IF EXISTS `Whiteboard_Markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Whiteboard_Markers` (
  `whiteboard_markers_loan_duration` int(11) DEFAULT '1',
  `whiteboard_markers_loan_fine_rate` decimal(5,2) DEFAULT '1.50',
  `whiteboard_markers_availability_status` varchar(255) NOT NULL,
  `barcode_number` int(11) NOT NULL,
  PRIMARY KEY (`barcode_number`),
  CONSTRAINT `Whiteboard_Markers_ibfk_1` FOREIGN KEY (`barcode_number`) REFERENCES `Rentable_Items` (`barcode_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Whiteboard_Markers`
--

LOCK TABLES `Whiteboard_Markers` WRITE;
/*!40000 ALTER TABLE `Whiteboard_Markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Whiteboard_Markers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-10 16:29:58
