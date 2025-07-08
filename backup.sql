-- MySQL dump 10.13  Distrib 9.3.0, for macos15.2 (arm64)
--
-- Host: localhost    Database: maidease
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` varchar(20) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('A77665588','newbee345');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_requests`
--

DROP TABLE IF EXISTS `contact_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) NOT NULL,
  `maid_name` varchar(255) NOT NULL,
  `request_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Pending','Accepted','Declined') DEFAULT 'Pending',
  `maid_id` int DEFAULT NULL,
  `maid_phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_maid_id` (`maid_id`),
  CONSTRAINT `fk_maid_id` FOREIGN KEY (`maid_id`) REFERENCES `maids` (`maid_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_requests`
--

LOCK TABLES `contact_requests` WRITE;
/*!40000 ALTER TABLE `contact_requests` DISABLE KEYS */;
INSERT INTO `contact_requests` VALUES (10,'tanishka@gmail.com','Anjali Sharma','2025-03-16 08:58:05','Accepted',54,'9878743210'),(11,'tanishka@gmail.com','Neeta kumari','2025-03-16 09:00:10','Declined',65,'9877638475'),(12,'tanishka@gmail.com','Sita Rao','2025-03-16 13:21:16','Pending',62,'1029634756'),(13,'Hari@gmail.com','Ravi kumar','2025-03-16 15:31:36','Accepted',66,'7866576545'),(14,'lamish@gmail.com','Anjali Sharma','2025-03-16 16:55:26','Accepted',54,'9878743210'),(15,'lamishh@gmail.com','Nisha Gupta','2025-03-17 16:49:29','Accepted',58,'5476109876'),(16,'tanishka@gmail.com','Nisha Gupta','2025-04-06 19:10:30','Accepted',58,'5476109876'),(17,'rashmika@gmail.com','Kavita Singh','2025-04-06 19:11:03','Declined',55,'8095432109'),(18,'Hari@gmail.com','Rekha Patel','2025-04-11 10:42:06','Accepted',61,'2989876543'),(19,'tanishka@gmail.com','Kavita Singh','2025-04-29 09:34:00','Pending',55,'8095432109'),(20,'pra@gmail.com','Priya Yadav','2025-04-29 11:36:51','Accepted',57,'6512210987'),(21,'pra@gmail.com','Tanishka Dadhe','2025-04-29 12:16:33','Pending',71,'8591342063'),(22,'tanishka@gmail.com','Nisha Gupta','2025-07-06 12:11:13','Accepted',58,'5476109876');
/*!40000 ALTER TABLE `contact_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maids`
--

DROP TABLE IF EXISTS `maids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maids` (
  `maid_id` int NOT NULL AUTO_INCREMENT,
  `maid_name` varchar(100) NOT NULL,
  `maid_phone` varchar(15) NOT NULL,
  `maid_gender` enum('Male','Female','Other') NOT NULL,
  `maid_address` text NOT NULL,
  `maid_aadhaar` varchar(20) NOT NULL,
  `maid_work` enum('Cleaning','Cooking','Babysitting') DEFAULT NULL,
  `working_hrs` enum('1 hr','3 hr','24 hrs') DEFAULT NULL,
  `working_time` enum('Morning','Afternoon','Evening') DEFAULT NULL,
  `salary_expected` enum('1k','2k','3k','4k','5k','6k','7k','8k','9k','10k','11k','12k','13k','14k','15k','16k','17k','18k','19k','20k','21k','22k','23k','24k','25k','26k','27k','28k','29k','30k') DEFAULT NULL,
  `experience` enum('1 year','3 years','5+ years') DEFAULT NULL,
  PRIMARY KEY (`maid_id`),
  UNIQUE KEY `maid_phone` (`maid_phone`),
  UNIQUE KEY `maid_aadhaar` (`maid_aadhaar`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maids`
--

LOCK TABLES `maids` WRITE;
/*!40000 ALTER TABLE `maids` DISABLE KEYS */;
INSERT INTO `maids` VALUES (1,'Sita Devi','9876543210','Female','vartak nagar thane','1234-5678-9012','Cooking','3 hr','Morning','10k','5+ years'),(2,'Ramesh Kumar','8765432109','Male','gandhigiri nagar mulund','2345-6789-0123','Cleaning','1 hr','Afternoon','5k','3 years'),(3,'Anita Sharma','7654321098','Female','Kisna housing thane','3456-7890-1234','Babysitting','24 hrs','Evening','30k','5+ years'),(12,'ramesh gupta','8766556656','Male','rupa gardens','342254653211','Cleaning','3 hr','Morning','4k','3 years'),(53,'manju tiwari','9866342131','Female','cadbury junction ','892211334455',NULL,NULL,NULL,NULL,NULL),(54,'Anjali Sharma','9878743210','Female','A-101, Akash Apartments, Thane','1234-5678-9101','Cleaning','3 hr','Morning','15k','1 year'),(55,'Kavita Singh','8095432109','Female','B-202, Paradise Enclave, Thane','1098-7654-3210','Cooking','1 hr','Afternoon','20k','3 years'),(56,'Sunita Verma','7698321098','Female','C-303, Green Valley, Thane','3210-9876-5432','Babysitting','24 hrs','Evening','25k','5+ years'),(57,'Priya Yadav','6512210987','Female','D-404, Silver Oaks, Thane','4567-8910-1234','Cleaning','1 hr','Morning','18k','1 year'),(58,'Nisha Gupta','5476109876','Female','E-505, Blue Ridge, Thane','5678-1234-5678','Cooking','3 hr','Afternoon','22k','3 years'),(59,'Meena Rani','4329898765','Female','F-606, Hilltop Residency, Thane','6789-2345-6789','Babysitting','3 hr','Evening','30k','1 year'),(60,'Aarti Desai','3220987654','Female','G-707, River View, Thane','7890-3456-7890','Cleaning','3 hr','Morning','14k','5+ years'),(61,'Rekha Patel','2989876543','Female','H-808, Ocean Breeze, Thane','8901-4567-8901','Cooking','1 hr','Afternoon','16k','3 years'),(62,'Sita Rao','1029634756','Female','I-909, Emerald Heights, Thane','9012-5678-9012','Babysitting','24 hrs','Evening','19k','3 years'),(63,'Geeta Joshi','5927382910','Female','J-1001, Lotus Park, Thane','0123-6789-0123','Cleaning','1 hr','Morning','21k','5+ years'),(64,'meena kumari','9877898987','Female','upvan lake thane','546754443321','Cooking','3 hr','Evening','5k','1 year'),(65,'Neeta kumari','9877638475','Female','majiwada junction housing ','345263546754','Cooking','3 hr','Morning','3k','5+ years'),(66,'Ravi kumar','7866576545','Male','hyde park thane ','234532645346','Cleaning','3 hr','Afternoon','13k','1 year'),(67,'praniti ahire','8777656547','Female','cadbury junction ','456567876548','Cooking','3 hr','Morning','3k','5+ years'),(69,'soham','8356967715','Male','tulsidham thane','234543212378','Cooking','1 hr','Afternoon','3k','3 years'),(70,'pra','9087654321','Female','cadbury junction ','456321765432','Cleaning','1 hr','Morning','2k','1 year'),(71,'Tanishka Dadhe','8591342063','Female','majiwada junction housing ','879988998986','Cooking','3 hr','Afternoon','30k','1 year');
/*!40000 ALTER TABLE `maids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT 'Other',
  `address` text,
  `aadhaar_no` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user@example.com','password123','John Doe','1234567890','Male','1234 Some Street, City, Country','123456789012'),(2,'lami@gmail.com','1234567890','Lamish ansari ','4533625787','Female','runwal park ','342565762121'),(3,'tanishka@gmail.com','3648252','Tanishka Dadhe','8767565545','Female','hyde park thane','990076543421'),(4,'praniti@gmail.com','345663245gvdsxx','Praniti Ahire','6577463523','Female','shivayi nagar block B thane','765463546565'),(5,'bhavani@gmail.com','338dsnjdu7r74r','bhavani das ','9877656765','Female','rutu parks ','345526354678'),(15,'lakshanyana@gmail.com','5543ddfff','lakshana iyer','9877874521','Female','hiranandani meadows thane','234567892345'),(20,'rashmika@gmail.com','384635hdd','rashmika jain','6577635463','Female','hirananadani estate patlipada thane','123456543212'),(21,'Hari@gmail.com','cutie2005','Hari Sharma','8777665656','Other','runwal gardens thane','987766776654'),(22,'lamish@gmail.com','4638edjff','Lamish Ansari ','9877665745','Female','castle mill thane','345645785698'),(23,'lamishh@gmail.com','tan@345','Lamish ansarii','7655654356','Female','castle mill thane','656787987654'),(24,'pra@gmail.com','123','Praniti','9876543265','Female','runwal park ','456789076543');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-06 19:30:10
