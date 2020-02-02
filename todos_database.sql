-- MySQL dump 10.13  Distrib 8.0.18, for osx10.13 (x86_64)
--
-- Host: tech-returners-database.cw4xuhfwr7sb.eu-west-1.rds.amazonaws.com    Database: todos
-- ------------------------------------------------------
-- Server version	5.7.26-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Tasks`
--

DROP TABLE IF EXISTS `Tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tasks` (
  `taskId` int(11) NOT NULL AUTO_INCREMENT,
  `completed` tinyint(1) DEFAULT NULL,
  `due_Date` date DEFAULT NULL,
  `task_Text` varchar(255) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`taskId`),
  KEY `userID` (`userId`),
  CONSTRAINT `Tasks_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tasks`
--

LOCK TABLES `Tasks` WRITE;
/*!40000 ALTER TABLE `Tasks` DISABLE KEYS */;
INSERT INTO `Tasks` VALUES (1,1,'2019-10-16','Buy tickets to Blue Planet',1),(3,1,'2019-07-03','Update CV',1),(5,1,'2020-03-07','Book flights to Mallorca',2),(6,1,'2020-01-08','Tidy the loft',2),(7,1,'2020-01-02','Clean the bathroom',2),(8,1,'2019-05-04','Pick a book for book club',2),(9,0,'2019-01-23','Buy salad bits; lettuce, cucumber, tomato',3),(10,1,'2019-01-04','RSVP to Anna\'s wedding',3),(11,0,'2019-04-02','Organise dinner with Fe&Carlos',3),(12,0,'2019-07-01','Renew Car Insurance',3),(13,1,'0000-00-00','2019-07-03',NULL),(14,1,'0000-00-00','2019-07-03',NULL),(15,1,'0000-00-00','2019-07-03',NULL),(16,1,'2019-07-03','Update CV',NULL),(17,1,'2019-07-03','Update CV',NULL),(18,1,'2019-07-03','Update CV',NULL);
/*!40000 ALTER TABLE `Tasks` ENABLE KEYS */;
UNLOCK TABLES;
