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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `biography` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `cv_url` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `external_login_id` varchar(255) DEFAULT NULL,
  `external_login_type` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `is_enabled` bit(1) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kiên giang','/api/file/images/upload/guest/1665448250622_1665448250621_hoanglinh.png','hello i am hoanglinhplus','2022-09-03 14:16:44','https://secretdeveloperisme.github.io/Curriculum_Vitae/HoangLinhPlusCV.html',NULL,'2000-11-25 14:16:57','linh07221@gmail.com',NULL,NULL,'nguyen hoang linh','m',_binary '','$2a$12$xCmz2Tsx3FS5f8AEoLkNoeI8iYsZeZDHOTSg2gBcQhPXI0ezc44wK',NULL,'hoanglinh'),(2,'longan','/api/file/images/upload/guest/1665448250622_1665448250621_hoanglinh.png','nice to meet you','2022-09-03 14:25:21',NULL,NULL,'1998-06-03 14:25:34','vana123@gmail.com',NULL,NULL,'nguyen van a','m',_binary '','$2a$12$w71H35UliCZ/NTh0x2t1sOSskBcJKOLoTuq5nUKttzvVbeuKlobEu',NULL,'vana123'),(3,'vinh long','/api/file/images/upload/guest/1665448250643_1665448250643_lapnghiep.png','i am glad to meet you ','2022-09-03 14:27:44',NULL,'2022-09-03 14:27:50','2022-09-03 14:27:54','ngochoa@gmail.com',NULL,NULL,'tran ngoc hoa','f',_binary '','$2a$12$RozngUfanm1Gy.tbdfh4Ge537Oli7R1G/3MAMCcZrLQJibKy4fX0C',NULL,'ngochoa123'),(20,'long hồ, vĩnh long','/api/file/images/upload/guest/1665448250625_1665448250624_huubang.png','Hello everyone, i am an engineer',NULL,NULL,NULL,'2000-04-25 07:00:00','minhman123@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$LFvOE9vTy2NjDAi.khfu5uKtnDPO3XVMlOh5gCYi.a8882sWmdTi.',NULL,'MinhMan'),(21,'Bình Thuận','/api/file/images/upload/guest/1665360568065_1665360568065_275921919_3111524412395778_4635370749805421973_n.jpg','Hello everyone, i am an worker',NULL,NULL,NULL,'1998-12-03 07:00:00','vanminh7676@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$wCefEiKwu7mXNa1clDWPE.nMXw3bHMYH28LFJU1EPPmgOJDn114x2',NULL,'VanMinh'),(22,'longan, viet nam','/api/file/images/upload/22/1666832252046_1666832252045_tran_thi_tuyet_mai.png','biography',NULL,'http://www.huynhdieu.tk/cv/',NULL,'2000-04-25 07:00:00','dieu@gmail.com',NULL,NULL,NULL,'f',_binary '','$2a$10$GwMjd0Z0oIKsd31zgN.Ygevko6q6HeCV5CFpWK.a8afhwxwmfMjFi',NULL,'huynhdieu'),(23,'longan','/api/file/images/upload/guest/1665360260136_1665360260136_277149396_1332373123921961_6109822464603979499_n.jpg','',NULL,NULL,NULL,'2000-04-25 07:00:00','dieu@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$axnM1Au.86C81S2KxQpAlOEIX.vVhK6ZdCIbvjHqTRC9kx5dtV4dW',NULL,'huynhdieuhello'),(24,'longan','/api/file/images/upload/guest/1665360568065_1665360568065_275921919_3111524412395778_4635370749805421973_n.jpg','',NULL,NULL,NULL,'2000-04-25 07:00:00','dieu@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$7Yr91PTjdFpktj.GPlTz3.A99qT0S7d19/NXFIWQbOECu1iuOXKCe',NULL,'huynhdieu333'),(25,'longan','/api/file/images/upload/guest/1665360568065_1665360568065_275921919_3111524412395778_4635370749805421973_n.jpg','',NULL,NULL,NULL,'2000-04-25 07:00:00','dieu@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$fEtKwQSuKJSqukf3AJ9Rb.ULwI4ILU29ygqVI1jyU4cfYbhFUp.6q',NULL,'huynhdieuaaa');
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

-- Dump completed on 2022-11-03  8:11:05
