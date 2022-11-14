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
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `messages` (
  `message_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `conversation_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `FKt492th6wsovh1nush5yl5jj8e` (`conversation_id`),
  KEY `FKpsmh6clh3csorw43eaodlqvkn` (`user_id`),
  CONSTRAINT `FKpsmh6clh3csorw43eaodlqvkn` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKt492th6wsovh1nush5yl5jj8e` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (132,'2022-11-06 08:04:27',NULL,'hello linh','TEXT','2022-11-06 08:04:27',26,29),(133,'2022-11-06 08:04:34',NULL,'nice to meet you','TEXT','2022-11-06 08:04:34',26,29),(134,'2022-11-06 09:53:50',NULL,'Hello bạn ','TEXT','2022-11-06 09:53:50',27,26),(135,'2022-11-06 09:54:12',NULL,'Ban có thể cho mình biết thông tin về bạn không','TEXT','2022-11-06 09:54:12',27,26),(136,'2022-11-06 10:51:01',NULL,'Mình tên là Linh hehe','TEXT','2022-11-09 07:57:20',27,1),(138,'2022-11-09 07:48:18',NULL,'hi man','TEXT','2022-11-09 07:48:18',26,1),(139,'2022-11-09 07:48:33',NULL,'what are you waiting for me ? ','TEXT','2022-11-09 07:48:33',26,1),(140,'2022-11-09 07:48:46',NULL,'attachment','IMAGE','2022-11-09 07:48:46',26,1),(143,'2022-11-09 07:58:13',NULL,'attachment','IMAGE','2022-11-09 07:58:13',27,1),(145,'2022-11-10 06:44:57',NULL,'attachment','IMAGE','2022-11-10 06:44:57',27,1),(146,'2022-11-10 07:54:56',NULL,'hello ban man','TEXT','2022-11-10 07:54:56',28,26),(147,'2022-11-12 18:50:57',NULL,'hello ban diệu','TEXT','2022-11-12 18:50:57',27,26),(148,'2022-11-12 18:51:07',NULL,'hello bạn nha linh','TEXT','2022-11-12 18:51:07',27,1),(149,'2022-11-12 18:51:18',NULL,'attachment','IMAGE','2022-11-12 18:51:18',27,26),(151,'2022-11-13 14:11:50',NULL,'hello ban','TEXT','2022-11-13 14:11:50',29,26),(152,'2022-11-13 14:15:36',NULL,'Hiện tại bạn đang học hay đã đi làm rồi ?','TEXT','2022-11-13 14:15:36',27,1),(153,'2022-11-13 14:15:49',NULL,'mình còn đang học ','TEXT','2022-11-13 14:15:49',27,26),(154,'2022-11-13 14:16:35',NULL,'bên công ty mình đang tuyển vị trí QA, bạn có muốn apply vào vị trí đó không','TEXT','2022-11-13 14:16:35',27,1),(155,'2022-11-13 14:16:51',NULL,'có ','TEXT','2022-11-13 14:16:51',27,26),(156,'2022-11-13 14:17:14',NULL,'vậy bạn cho mình xem CV của bạn nhé ','TEXT','2022-11-13 14:17:14',27,1),(157,'2022-11-13 14:17:21',NULL,'Okay bạn','TEXT','2022-11-13 14:17:21',27,26),(159,'2022-11-13 14:18:17',NULL,'attachment','IMAGE','2022-11-13 14:18:17',27,26),(160,'2022-11-13 14:21:56',NULL,'hello','TEXT','2022-11-13 14:21:56',27,26),(161,'2022-11-13 19:06:18',NULL,'Chào công ty ','TEXT','2022-11-13 19:06:18',27,1),(162,'2022-11-13 19:14:31',NULL,'hiện tại công ty đang tuyển vị trí IT network đúng không ạ ','TEXT','2022-11-13 19:14:31',27,1),(163,'2022-11-13 19:15:33',NULL,'đúng rồi bạn ','TEXT','2022-11-13 19:15:33',27,26),(164,'2022-11-13 19:15:59',NULL,'em muốn apply vào job này','TEXT','2022-11-13 19:15:59',27,26),(165,'2022-11-13 19:16:23',NULL,'bạn gữi cv nhé công ty sẻ xem xét ','TEXT','2022-11-13 19:16:23',27,1),(166,'2022-11-13 19:17:04',NULL,'công ty sẻ sắp xếp ngày phỏng vấn và điện lại cho bạn sau','TEXT','2022-11-13 19:17:04',27,1),(167,'2022-11-13 19:17:19',NULL,'attachment','IMAGE','2022-11-13 19:17:19',27,26),(168,'2022-11-13 19:17:42',NULL,'em cảm ơn rất nhìu ','TEXT','2022-11-13 19:17:42',27,26),(169,'2022-11-13 19:28:37',NULL,'xin chào công ty','TEXT','2022-11-13 19:28:37',30,1),(170,'2022-11-13 19:28:48',NULL,'chào bạn ','TEXT','2022-11-13 19:28:48',30,27),(171,'2022-11-13 19:29:01',NULL,'mình có thể giúp gì cho bạn nè','TEXT','2022-11-13 19:29:10',30,27),(172,'2022-11-13 19:29:23',NULL,'mình muốn apply vào job database','TEXT','2022-11-13 19:29:23',30,1),(173,'2022-11-13 19:29:30',NULL,'bạn gữi cv nhé','TEXT','2022-11-13 19:29:30',30,27),(174,'2022-11-13 19:29:54',NULL,'attachment','IMAGE','2022-11-13 19:29:54',30,1);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-14  7:51:49
