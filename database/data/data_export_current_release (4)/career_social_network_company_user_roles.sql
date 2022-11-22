-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: career_social_network
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company_user_roles`
--

DROP TABLE IF EXISTS `company_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company_user_roles` (
  `company_id` bigint(20) NOT NULL,
  `company_role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`company_id`,`company_role_id`,`user_id`),
  KEY `FKq2wsedkft8jhup7wgal1udqu1` (`company_role_id`),
  KEY `FKtun5s5ivd1iwdyfv37r9pjy2` (`user_id`),
  CONSTRAINT `FKffw817sus1ajxuvpvos2529yk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  CONSTRAINT `FKq2wsedkft8jhup7wgal1udqu1` FOREIGN KEY (`company_role_id`) REFERENCES `company_roles` (`company_role_id`),
  CONSTRAINT `FKtun5s5ivd1iwdyfv37r9pjy2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_user_roles`
--

LOCK TABLES `company_user_roles` WRITE;
/*!40000 ALTER TABLE `company_user_roles` DISABLE KEYS */;
INSERT INTO `company_user_roles` VALUES (31,1,26),(32,1,26),(33,1,1),(34,1,1),(35,1,1),(36,1,1),(37,1,27),(38,1,27),(39,1,28),(40,1,28),(41,1,29),(42,1,29),(49,1,1),(50,1,51),(51,1,51),(52,1,52),(33,2,26),(34,2,29),(35,3,27),(50,3,1),(31,4,1),(32,4,27),(33,4,27),(34,4,26),(35,4,26),(37,4,26),(49,4,26),(50,4,26),(51,4,27),(52,4,28),(33,5,29),(49,5,26);
/*!40000 ALTER TABLE `company_user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-22 20:15:30
