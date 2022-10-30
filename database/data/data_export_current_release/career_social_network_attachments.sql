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
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `attachments` (
  `attachment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attachment_url` varchar(1000) NOT NULL,
  `attachment_type_id` bigint(20) NOT NULL,
  `message_id` bigint(20) NOT NULL,
  PRIMARY KEY (`attachment_id`),
  KEY `FKrnvn4cqnjpmllc44j88cw8ttv` (`attachment_type_id`),
  KEY `FKcf4ta8qdkixetfy7wnqfv3vkv` (`message_id`),
  CONSTRAINT `FKcf4ta8qdkixetfy7wnqfv3vkv` FOREIGN KEY (`message_id`) REFERENCES `messages` (`message_id`),
  CONSTRAINT `FKrnvn4cqnjpmllc44j88cw8ttv` FOREIGN KEY (`attachment_type_id`) REFERENCES `attachment_types` (`attachment_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (4,'/file/images/upload/20/1664548522745_1664548522743_0fd0c17764e09ee424874dfd6807af4ee40cdd75.jpg',8,9),(5,'/file/images/upload/20/1664548522756_1664548522756_1a5a77b007c952ff5e7d09ac8f46d1041cdc05e5.jpg',8,9),(21,'/api/file/images/upload/22/1666509958336_1666509958336_embedded.jpg',8,74),(26,'/api/file/images/upload/2/1666511744009_1666511744009_myblog.txt',11,79),(27,'/api/file/images/upload/2/1666511744011_1666511744011_stack-overflow.png',12,79),(28,'/api/file/images/upload/22/1666511852949_1666511852949_attachment.pdf',13,80),(30,'/api/file/images/upload/1/1666571134759_1666571134759_D_AND_L.jpg',8,87),(31,'/api/file/images/upload/1/1666571550961_1666571550961_D_AND_L.jpg',8,92),(32,'/api/file/images/upload/1/1666572018755_1666572018755_chess.jpg',8,112),(33,'/api/file/images/upload/22/1666573148746_1666573148744_What-is-Algorithm_-1024x631.jpg',8,114),(35,'/api/file/images/upload/2/1667106880002_1667106879997_lapnghiep.png',12,129);
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-30 22:27:14
