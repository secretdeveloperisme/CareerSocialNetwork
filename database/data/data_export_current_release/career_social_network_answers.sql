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
INSERT INTO `answers` VALUES (3,20,'Recusandae officiis qui amet nisi minus molestiae nostrum. Totam aliquam ratione. Repudiandae aut quas possimus autem voluptatem nesciunt amet. Et impedit voluptatem. Quo assumenda quia quia sed fuga ipsam dolorem.','2022-09-23 06:25:48'),(4,1,'Ex aperiam ut nesciunt ea. Delectus alias quidem quidem totam illo illum sed. Consequuntur non mollitia inventore nihil doloremque nemo et.','2022-09-23 06:25:31'),(4,20,'Suscipit corporis modi accusantium expedita.','2022-09-23 06:25:54'),(6,1,'linh questin','2022-10-17 07:21:32'),(6,20,'yes i have cerificatte','2022-10-19 20:19:00'),(6,22,'11111111111111111dsssdfdsfdsf111111',NULL),(26,1,'dsfdsfsdf','2022-10-17 07:21:32'),(26,20,'3 years','2022-10-19 20:19:00'),(26,22,'222222222222222222222sdfsdfdsfdsfsd22',NULL),(27,22,'yes yest',NULL),(28,1,'sdfsdfdsfds','2022-10-17 07:21:32'),(28,20,'this is new answer','2022-10-19 20:19:00'),(28,22,'this is answer dfdfd',NULL),(29,22,'','2022-10-22 15:29:14'),(30,22,'','2022-10-22 15:29:14'),(31,22,'','2022-10-22 15:29:14');
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

-- Dump completed on 2022-10-30 22:27:22
