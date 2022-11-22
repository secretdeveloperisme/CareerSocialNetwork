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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `answers` (
  `job_que_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`job_que_id`,`user_id`),
  KEY `FK5bp3d5loftq2vjn683ephn75a` (`user_id`),
  CONSTRAINT `FK4vqj9owum0ouyrso21qndwkt9` FOREIGN KEY (`job_que_id`) REFERENCES `job_question` (`job_que_id`),
  CONSTRAINT `FK5bp3d5loftq2vjn683ephn75a` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (35,29,'{\"ops\":[{\"insert\":\"Yes I have an IT certificate, and office\"},{\"attributes\":{\"bold\":true},\"insert\":\"sdfdsfs\"},{\"attributes\":{\"header\":1},\"insert\":\"\\n\"},{\"insert\":\"sdfsdfdsfdsf\"},{\"attributes\":{\"code-block\":true},\"insert\":\"\\n\"}]}','2022-11-06 08:53:08'),(36,29,'{\"ops\":[{\"insert\":\"My level English is intermediate\"},{\"attributes\":{\"bold\":true},\"insert\":\"sdfdsfs\"},{\"attributes\":{\"header\":1},\"insert\":\"\\n\"},{\"insert\":\"sdfsdfdsfdsf\"},{\"attributes\":{\"code-block\":true},\"insert\":\"\\n\"}]}','2022-11-06 08:53:08'),(53,1,'{\"ops\":[{\"insert\":\"I have been in this field about 2 years\"},{\"attributes\":{\"italic\":true},\"insert\":\"dsfdsfdsfs\"},{\"attributes\":{\"underline\":true,\"italic\":true},\"insert\":\"dsfdsfdsfsd\"},{\"insert\":\"\\n\"}]}','2022-11-12 18:41:17'),(54,1,'{\"ops\":[{\"insert\":\"I have been in this field about 2 years\"},{\"attributes\":{\"italic\":true},\"insert\":\"dsfdsfdsfs\"},{\"attributes\":{\"underline\":true,\"italic\":true},\"insert\":\"dsfdsfdsfsd\"},{\"insert\":\"\\n\"}]}','2022-11-13 19:10:15'),(54,51,'{\"ops\":[{\"insert\":\"you I work as a IT helpdesk\"},{\"attributes\":{\"italic\":true},\"insert\":\"dsfdsfdsfs\"},{\"attributes\":{\"underline\":true,\"italic\":true},\"insert\":\"dsfdsfdsfsd\"},{\"insert\":\"\\n\"}]}','2022-11-13 19:09:17'),(55,1,'{\"ops\":[{\"insert\":\"yes\"},{\"attributes\":{\"italic\":true},\"insert\":\"dsfdsfdsfs\"},{\"attributes\":{\"underline\":true,\"italic\":true},\"insert\":\"dsfdsfdsfsd\"},{\"insert\":\"\\n\"}]}','2022-11-13 19:10:15'),(55,51,'{\"ops\":[{\"insert\":\"yes\"},{\"attributes\":{\"italic\":true},\"insert\":\"dsfdsfdsfs\"},{\"attributes\":{\"underline\":true,\"italic\":true},\"insert\":\"dsfdsfdsfsd\"},{\"insert\":\"\\n\"}]}','2022-11-13 19:09:17'),(56,1,'{\"ops\":[{\"insert\":\"two years\"},{\"attributes\":{\"italic\":true},\"insert\":\"dsfdsfdsfs\"},{\"attributes\":{\"underline\":true,\"italic\":true},\"insert\":\"dsfdsfdsfsd\"},{\"insert\":\"\\n\"}]}','2022-11-13 19:31:45'),(66,52,'{\"ops\":[{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"about 3 years \"},{\"insert\":\"\\n\"}]}','2022-11-22 06:50:20');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-22 20:15:27
