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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK2x6pnqwqmwtl0bc7chq0rykbq` (`job_id`),
  KEY `FKlri30okf66phtcgbe5pok7cc0` (`parent_id`),
  KEY `FK8omq0tc18jd43bu5tjh6jvraq` (`user_id`),
  KEY `FKh4c7lvsc298whoyd4w9ta25cr` (`post_id`),
  CONSTRAINT `FK2x6pnqwqmwtl0bc7chq0rykbq` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  CONSTRAINT `FK8omq0tc18jd43bu5tjh6jvraq` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKh4c7lvsc298whoyd4w9ta25cr` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  CONSTRAINT `FKlri30okf66phtcgbe5pok7cc0` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (64,'<p>B??i vi???t r???t b??? ??ch !</p>',NULL,NULL,NULL,29,30),(65,'<p>Mong b???n ra th??m nh??ng b??i vi???t m???i n???a<span class=\"ql-size-large\"><span class=\"ql-cursor\">???</span></span></p>',NULL,NULL,64,29,30),(66,'<p>T??i ???? h???c ???????c m???t s??? kinh nghi???m t??? ?????ng nghi???p v?? b???n b?? </p>',NULL,NULL,NULL,26,28),(73,'<p><strong class=\"ql-font-monospace ql-size-huge\">hello b???n </strong><strong class=\"ql-font-monospace ql-size-huge\" style=\"color: rgb(230, 0, 0);\">di???u</strong></p>',NULL,80,NULL,1,NULL),(74,'<p>hi ch??o b???n</p>',NULL,80,73,26,NULL),(75,'<p>alo alo</p>',NULL,80,74,1,NULL),(76,'<p>B??i Vi???t r???t hay nha</p>',NULL,NULL,NULL,51,28),(77,'<p>c???m ??n b???n d?? ???ng h??? b??i vi???t c???a m??nh</p>',NULL,NULL,66,1,28),(78,'<p>I wil apply for this job </p>',NULL,85,NULL,1,NULL),(79,'<p>t??i s??? apply v??o job n??y</p>',NULL,86,NULL,1,NULL),(80,'<p>okay b???n</p>',NULL,86,79,51,NULL),(105,'<p>dfsdfsdfds</p>',NULL,86,80,26,NULL),(113,'<p>t???o m???t comment</p>',NULL,86,NULL,1,NULL),(115,'<p>okay b???n</p>','2022-11-22 07:49:58',86,113,26,NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-22 20:15:16
