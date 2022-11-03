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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (3,'This job is very nice',NULL,8,NULL,20,NULL),(6,'how can i apply for this job',NULL,8,NULL,20,NULL),(7,'what\'s up',NULL,8,NULL,20,NULL),(8,'really useful',NULL,8,NULL,20,NULL),(12,'ok really useful',NULL,8,8,20,NULL),(15,'you just click the button of this job',NULL,8,6,2,NULL),(16,'you just click the button of this job',NULL,12,NULL,2,NULL),(17,'you just click the button of this job dfsfsfsdf',NULL,12,16,2,NULL),(18,'you just click the button of this job dfsfsfsdf',NULL,12,16,2,NULL),(19,'<p><strong style=\"color: rgb(230, 0, 0);\">hehehjefdfdsf</strong></p>',NULL,12,NULL,22,NULL),(30,'you just click the button of this job dfsfsfsdf',NULL,12,16,2,NULL),(31,'you just click the button of this job dfsfsfsdf',NULL,12,30,2,NULL),(35,'<p>fdsfsdfsdfds</p>',NULL,12,31,22,NULL),(47,'<p>sdfsfdf</p>',NULL,12,NULL,22,NULL),(49,'<p><span class=\"ql-font-serif\">I will apply for this job</span></p>',NULL,13,NULL,2,NULL),(50,'<p>thank you for applying</p>',NULL,13,49,22,NULL),(51,'<p><strong>not at all</strong></p>',NULL,13,50,22,NULL),(52,'<p>sdfsdfsdf</p>',NULL,12,31,22,NULL),(53,'<h1>this is really helpful</h1>',NULL,16,NULL,1,NULL),(56,'you just click the button of this job dfsfsfsdf',NULL,12,NULL,22,NULL),(57,'you just click the button of this job dfsfsfsdf',NULL,NULL,NULL,22,2),(58,'reply you just click the button of this job dfsfsfsdf',NULL,NULL,NULL,22,2),(59,'reply you just click the button of this job dfsfsfsdf',NULL,NULL,58,22,2),(60,'<p>okay what about you</p>',NULL,8,12,22,NULL);
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

-- Dump completed on 2022-11-03  8:11:02
