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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kiên giang','/api/file/images/upload/1/1667646768483_1667646768481_hoanglinh.png','hello i am hoanglinhplus, nice to meet you','2022-09-03 14:16:44','https://secretdeveloperisme.github.io/Curriculum_Vitae/HoangLinhPlusCV.html',NULL,'2000-11-25 07:00:00','linh07221@gmail.com',NULL,NULL,'nguyen hoang linh','m',_binary '','$2a$12$xCmz2Tsx3FS5f8AEoLkNoeI8iYsZeZDHOTSg2gBcQhPXI0ezc44wK',NULL,'hoanglinh'),(26,'Tan Hung, Long An','/api/file/images/upload/26/1667650461744_1667650461740_huynhdieu.png','If you have your doubts, it’s likely time to update your bio, and we have some of the best professional bio examples to get you started.','2022-06-07 21:05:46',NULL,NULL,'2000-04-25 07:00:00','dieu2504@gmail.com',NULL,NULL,NULL,'f',_binary '','$2a$10$FxzoQM9jMpQ2sXEwXi9epu3yhuPxIk0SGYbR8al6P2qtPEczAl6n.',NULL,'huynhdieu'),(27,'An Giang','/api/file/images/upload/1/1667659098032_1667659098032_huubang.png','I have a passionate with computer science ','2022-06-10 21:10:53',NULL,NULL,'2000-12-12 07:00:00','huubang@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$ixboSg7NMNDacOkNd9i3bOorv3mK.c35xY/psIp7zXVO4uJQGWcU6',NULL,'huubang'),(28,'Cai Rang, Can Tho','/api/file/images/upload/27/1667693394807_1667693394807_lapnghiep.png','Top Rated Freelancer || Blogger || Cross-Platform App Developer || Web Developer || Open Source Contributor','2022-01-12 23:09:02',NULL,NULL,'2000-07-08 07:00:00','nghiepit321@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$D1dbELyX5yT7iZUIqvFb0e5/HW4vWrdJtsIyYLjEiOx1B.6fSiXVu',NULL,'lapnghiep'),(29,'Long Ho, Vinh Long','/api/file/images/upload/1/1667696593675_1667696593675_minhman.webp','I am an automatic machine engineer. I really happy make friend with everyone.  ','2021-02-03 21:09:12',NULL,NULL,'2000-05-01 07:00:00','minhman2k@gmail.com',NULL,NULL,NULL,'m',_binary '\0','$2a$10$fWMCdJXO0ZOAjbFK95JSHuUQyYRbu2axz1G1IH6Lfts.IchenhtW2',NULL,'minhman'),(51,'Ha Noi','/api/file/images/upload/guest/1668338035668_1668338035659_nguyen_thi_hoa.png','I am from a countryside but with my motivation is not  small',NULL,NULL,NULL,'1997-11-22 07:00:00','thihoa@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$L/1uzblrgXHDZETXkGqolOF3yZ15kRLqHO5JxXFyNw562d4LngDzS',NULL,'thihoa'),(52,'Cai Rang Can Tho ','/api/file/images/upload/1/1669073760418_1669073760418_tran_thi_tuyet_mai.png','my full name is  nguyenn thi tuyet mai. i have a hobby, that is facing with the problems',NULL,NULL,NULL,'2000-09-07 07:00:00','tuyetmai53@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$74AZwdd/90zkvU2aPbKNHuHhU7Oqd/uSHMsFQk.ekHaINI.ER88RO',NULL,'tuyetmai');
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

-- Dump completed on 2022-11-22 20:15:22
