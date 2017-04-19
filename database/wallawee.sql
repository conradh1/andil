-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wallawee
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.10.1

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
-- Table structure for table `experience_types`
--

DROP TABLE IF EXISTS `experience_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience_types` (
  `pk_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience_types`
--

LOCK TABLES `experience_types` WRITE;
/*!40000 ALTER TABLE `experience_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `experience_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiences`
--

DROP TABLE IF EXISTS `experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiences` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_provider_id` int(11) NOT NULL,
  `fk_type_id` smallint(6) NOT NULL,
  `slogan` varchar(64) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `short_description` varchar(200) DEFAULT NULL,
  `keywords` varchar(256) NOT NULL,
  `languages_spoken1` varchar(30) DEFAULT NULL,
  `languages_spoken2` varchar(30) DEFAULT NULL,
  `languages_spoken3` varchar(30) DEFAULT NULL,
  `languages_spoken4` varchar(30) DEFAULT NULL,
  `image_path_1` varchar(30) NOT NULL,
  `image_path_2` varchar(30) DEFAULT NULL,
  `image_path_3` varchar(30) DEFAULT NULL,
  `image_path_4` varchar(30) DEFAULT NULL,
  `image_path_5` varchar(30) DEFAULT NULL,
  `video_path_1` varchar(30) DEFAULT NULL,
  `video_path_2` varchar(30) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pk_id`),
  KEY `fk_provider_id` (`fk_provider_id`),
  KEY `fk_type_id` (`fk_type_id`),
  CONSTRAINT `experiences_ibfk_1` FOREIGN KEY (`fk_provider_id`) REFERENCES `providers` (`pk_id`) ON DELETE CASCADE,
  CONSTRAINT `experiences_ibfk_2` FOREIGN KEY (`fk_type_id`) REFERENCES `experience_types` (`pk_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiences`
--

LOCK TABLES `experiences` WRITE;
/*!40000 ALTER TABLE `experiences` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providers` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `island` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `zip` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `insta_login` varchar(30) DEFAULT NULL,
  `profile_image_path_1` varchar(30) NOT NULL,
  `insta_pass` varchar(30) DEFAULT NULL,
  `whatsap` varchar(30) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seekers`
--

DROP TABLE IF EXISTS `seekers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seekers` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `insta_login` varchar(30) DEFAULT NULL,
  `insta_pass` varchar(30) DEFAULT NULL,
  `dob` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `whatsap` varchar(30) DEFAULT NULL,
  `active` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seekers`
--

LOCK TABLES `seekers` WRITE;
/*!40000 ALTER TABLE `seekers` DISABLE KEYS */;
/*!40000 ALTER TABLE `seekers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_experience_id` int(11) NOT NULL,
  `fk_seeker_id` int(11) NOT NULL,
  `rating` enum('1','2','3','4','5') DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  KEY `fk_experience_id` (`fk_experience_id`),
  KEY `fk_seeker_id` (`fk_seeker_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`fk_experience_id`) REFERENCES `experiences` (`pk_id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`fk_seeker_id`) REFERENCES `seekers` (`pk_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-18 17:01:53
