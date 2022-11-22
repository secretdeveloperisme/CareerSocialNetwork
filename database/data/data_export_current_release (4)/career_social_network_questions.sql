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
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `questions` (
  `question_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (34,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"Do you have any Certification about IT ?\"},{\"insert\":\"\\n\"}]}'),(35,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"What the level of you english?\"},{\"insert\":\"\\n\"}]}'),(36,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"how long have you worked with php?\"},{\"insert\":\"\\n\"}]}'),(37,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"Do you have any certificate ?\"},{\"insert\":\"\\n\"}]}'),(38,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"What level of english you are?\"},{\"insert\":\"\\n\"}]}'),(39,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"What are the types of automation testing?\"},{\"insert\":\"\\n\"}]}'),(40,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"What is automation testing?\"},{\"insert\":\"\\n\"}]}'),(41,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"When is a good time to automate a test?\"},{\"insert\":\"\\n\"}]}'),(42,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"Bạn đã học những gì liên quan đến data analysis chưa?\"},{\"insert\":\"\\n\"}]}'),(43,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"Bạn đang sữ dụng ngôn ngữ nào để  viết UI cho web\"},{\"insert\":\"\\n\"}]}'),(52,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"How long have you  been in embedded field?\"},{\"insert\":\"\\n\"}]}'),(53,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"Did you work some jobs relate to network?\"},{\"insert\":\"\\n\"}]}'),(54,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"Are You Ungraduated ?\"},{\"insert\":\"\\n\"}]}'),(55,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"how long have you worked in database field?\"},{\"insert\":\"\\n\"}]}'),(65,'{\"ops\":[{\"insert\":\"Do you have any experience about this field?\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"}]}');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-22 20:15:25
