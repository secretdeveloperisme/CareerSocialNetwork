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
-- Temporary view structure for view `amount_companies_per_month_in_current_year`
--

DROP TABLE IF EXISTS `amount_companies_per_month_in_current_year`;
/*!50001 DROP VIEW IF EXISTS `amount_companies_per_month_in_current_year`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `amount_companies_per_month_in_current_year` AS SELECT 
 1 AS `month`,
 1 AS `amount_of_companies`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `amount_jobs_of_companies`
--

DROP TABLE IF EXISTS `amount_jobs_of_companies`;
/*!50001 DROP VIEW IF EXISTS `amount_jobs_of_companies`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `amount_jobs_of_companies` AS SELECT 
 1 AS `company_id`,
 1 AS `name`,
 1 AS `amount_of_jobs`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `amount_jobs_of_companies_of_total`
--

DROP TABLE IF EXISTS `amount_jobs_of_companies_of_total`;
/*!50001 DROP VIEW IF EXISTS `amount_jobs_of_companies_of_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `amount_jobs_of_companies_of_total` AS SELECT 
 1 AS `company_id`,
 1 AS `name`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `amount_jobs_per_month_in_current_year`
--

DROP TABLE IF EXISTS `amount_jobs_per_month_in_current_year`;
/*!50001 DROP VIEW IF EXISTS `amount_jobs_per_month_in_current_year`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `amount_jobs_per_month_in_current_year` AS SELECT 
 1 AS `month`,
 1 AS `amount_of_jobs`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `amount_posts_per_month_in_current_year`
--

DROP TABLE IF EXISTS `amount_posts_per_month_in_current_year`;
/*!50001 DROP VIEW IF EXISTS `amount_posts_per_month_in_current_year`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `amount_posts_per_month_in_current_year` AS SELECT 
 1 AS `month`,
 1 AS `amount_of_posts`*/;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `answers` VALUES (35,29,'Yes I have an IT certificate, and office','2022-11-06 08:53:08'),(36,29,'My level English is intermediate ','2022-11-06 08:53:08'),(53,1,'I have been in this field about 2 years','2022-11-12 18:41:17'),(54,1,'Yes I worked as a IT helpdesk ','2022-11-13 19:10:15'),(54,51,'you I work as a IT helpdesk  ','2022-11-13 19:09:17'),(55,1,'yes','2022-11-13 19:10:15'),(55,51,'Yes ','2022-11-13 19:09:17'),(56,1,'two year','2022-11-13 19:31:45');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `applications` (
  `job_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`job_id`,`user_id`),
  KEY `FKfsfqljedcla632u568jl5qf3w` (`user_id`),
  CONSTRAINT `FK65weib1lru9dkrbto5pv389vi` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  CONSTRAINT `FKfsfqljedcla632u568jl5qf3w` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (52,26,'APPROVED'),(55,29,'PENDING'),(56,1,'PENDING'),(56,28,'PENDING'),(59,1,'PENDING'),(80,1,'APPROVED'),(85,1,'APPROVED'),(85,51,'PENDING'),(86,1,'APPROVED');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment_types`
--

DROP TABLE IF EXISTS `attachment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `attachment_types` (
  `attachment_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attachment_type_id`),
  UNIQUE KEY `UK_p854mhyary1hkf67i5mwhyn5w` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment_types`
--

LOCK TABLES `attachment_types` WRITE;
/*!40000 ALTER TABLE `attachment_types` DISABLE KEYS */;
INSERT INTO `attachment_types` VALUES (9,'application/json'),(10,'application/octet-stream'),(13,'application/pdf'),(4,'audio'),(14,'image/gif'),(8,'image/jpeg'),(12,'image/png'),(1,'normal'),(2,'picture'),(11,'text/plain'),(3,'video');
/*!40000 ALTER TABLE `attachment_types` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (38,'/api/file/images/upload/1/1667954925970_1667954925968_tma.jpg',8,140),(40,'/api/file/images/upload/1/1667955492862_1667955492860_RBVH-Logo.png',12,143),(43,'/api/file/images/upload/1/1668037497362_1668037497359_NguyenHoangLinh_FresherNodeJS_CV.pdf',13,145),(44,'/api/file/images/upload/26/1668253877649_1668253877646_fpt.jpg',8,149),(45,'/api/file/images/upload/26/1668253877653_1668253877653_KMS.jpg',8,149),(47,'/api/file/images/upload/26/1668323897407_1668323897404_CV_Huỳnh Thị Diệu.pdf',13,159),(48,'/api/file/images/upload/26/1668341839068_1668341839068_acb.png',12,167),(49,'/api/file/images/upload/26/1668341839070_1668341839070_chotot.jpg',8,167),(50,'/api/file/images/upload/1/1668342594217_1668342594217_Curriculum_Vitae.pdf',13,174);
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookmarks` (
  `user_id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  KEY `FKn7m2tvrmm8hq11ahswawj0kq6` (`job_id`),
  KEY `FKdbsho2e05w5r13fkjqfjmge5f` (`user_id`),
  CONSTRAINT `FKdbsho2e05w5r13fkjqfjmge5f` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKn7m2tvrmm8hq11ahswawj0kq6` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
INSERT INTO `bookmarks` VALUES (29,54);
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_likes`
--

DROP TABLE IF EXISTS `comment_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment_likes` (
  `comment_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_like` varchar(30) NOT NULL,
  PRIMARY KEY (`comment_id`,`user_id`),
  KEY `FK6h3lbneryl5pyb9ykaju7werx` (`user_id`),
  CONSTRAINT `FK3wa5u7bs1p1o9hmavtgdgk1go` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`comment_id`),
  CONSTRAINT `FK6h3lbneryl5pyb9ykaju7werx` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_likes`
--

LOCK TABLES `comment_likes` WRITE;
/*!40000 ALTER TABLE `comment_likes` DISABLE KEYS */;
INSERT INTO `comment_likes` VALUES (66,1,'LIKE'),(66,51,'LIKE'),(74,1,'LIKE'),(74,26,'LIKE'),(75,26,'LIKE'),(76,1,'LIKE'),(77,1,'UNLIKE'),(78,51,'LIKE');
/*!40000 ALTER TABLE `comment_likes` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (64,'<p>Bài viết rất bổ ích !</p>',NULL,NULL,NULL,29,30),(65,'<p>Mong bạn ra thêm nhưng bài viết mới nửa<span class=\"ql-size-large\"><span class=\"ql-cursor\">﻿</span></span></p>',NULL,NULL,64,29,30),(66,'<p>Tôi đã học được một số kinh nghiệm từ đồng nghiệp và bạn bè </p>',NULL,NULL,NULL,26,28),(73,'<p><strong class=\"ql-font-monospace ql-size-huge\">hello bạn </strong><strong class=\"ql-font-monospace ql-size-huge\" style=\"color: rgb(230, 0, 0);\">diệu</strong></p>',NULL,80,NULL,1,NULL),(74,'<p>hi chào bạn</p>',NULL,80,73,26,NULL),(75,'<p>alo alo</p>',NULL,80,74,1,NULL),(76,'<p>Bài Viết rất hay nha</p>',NULL,NULL,NULL,51,28),(77,'<p>cảm ơn bạn dã ủng hộ bài viết của mình</p>',NULL,NULL,66,1,28),(78,'<p>I wil apply for this job </p>',NULL,85,NULL,1,NULL),(79,'<p>tôi sẻ apply vào job này</p>',NULL,86,NULL,1,NULL),(80,'<p>okay bạn</p>',NULL,86,79,51,NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `companies` (
  `company_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `tag_line` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `industry_id` bigint(20) DEFAULT NULL,
  `organization_size_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  KEY `FK9l5d0fem75e59uwf9upwuf9du` (`user_id`),
  KEY `FKsmvt41c2quaagfwsorsfexn6u` (`industry_id`),
  KEY `FKai9u6livoeushy7vk2b736x08` (`organization_size_id`),
  CONSTRAINT `FK9l5d0fem75e59uwf9upwuf9du` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKai9u6livoeushy7vk2b736x08` FOREIGN KEY (`organization_size_id`) REFERENCES `organization_sizes` (`organization_size_id`),
  CONSTRAINT `FKsmvt41c2quaagfwsorsfexn6u` FOREIGN KEY (`industry_id`) REFERENCES `industries` (`industry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (31,'2022-01-05 19:22:31',NULL,'/api/file/images/upload/26/1667650950664_1667650950661_RBVH-Logo.png','Robert Bosch','','2022-11-10 07:47:20','https://www.bosch.com/',26,1,5),(32,'2022-02-05 19:44:02',NULL,'/api/file/images/upload/26/1667652242028_1667652242027_1665755678671.jpg','Oracle','We help people see data in new ways, discover insights, unlock endless possibilities.','2022-11-05 19:44:02','http://www.oracle.com/',26,1,6),(33,'2022-03-05 19:57:04',NULL,'/api/file/images/upload/1/1667653024403_1667653024403_tma.jpg','TMA Solution','Leading software outsourcing provider in Vietnam | 25 years | 3800 engineers | 7 offices in Vietnam | 6 overseas offices','2022-11-05 19:57:04','https://www.tmasolutions.com/',1,16,7),(34,'2022-04-05 20:06:16',NULL,'/api/file/images/upload/1/1667653576111_1667653576111_fpt.jpg','FPT Software','Powering Digital Transformation','2022-11-05 20:06:16','http://www.fpt-software.com/',1,16,7),(35,'2022-04-05 20:21:00',NULL,'/api/file/images/upload/1/1667654460083_1667654460083_KMS.jpg','KMS Technology, Inc.','Bright Minds. Brilliant Solutions.','2022-11-05 20:21:00','http://www.kms-technology.com/',1,16,6),(36,'2022-04-05 20:59:29','2022-11-10 07:38:06','/api/file/images/upload/1/1667656768263_1667656768263_HoangLinhPlus.png','hoanglinhplus','Together We will change the world','2022-11-10 07:38:06','https://hoanglinhplus.org.com',1,1,3),(37,'2022-09-05 21:44:20',NULL,'/api/file/images/upload/27/1667659460045_1667659460042_chotot.jpg','Chợ Tốt','Vietnam\'s first recommerce platform, using technology to empower Vietnamese daily life.','2022-11-05 21:44:20','https://careers.chotot.com/',27,9,5),(38,'2022-09-06 06:53:56',NULL,'/api/file/images/upload/27/1667692435893_1667692435893_Plume.jpg','Plume Design, Inc','Plume Design, Inc','2022-11-06 06:53:56','http://www.plume.com/',27,9,4),(39,'2022-11-06 07:14:29',NULL,'/api/file/images/upload/28/1667693669451_1667693669451_acb.png','Ngân Hàng TMCP Á Châu (ACB)','ACB cần những con người làm chủ sự phát triển của ngân hàng theo cách chủ động nhất với thời cuộc','2022-11-06 07:14:29','http://www.acbjobs.com.vn/',28,8,6),(40,'2022-11-06 07:37:04',NULL,'/api/file/images/upload/28/1667695023825_1667695023825_language_link.png','Language Link Vietnam','Language Link recruits talents to support our diversity and educational excellence. If you believe you can really make a difference, want to have room to freely use your talent and pursue an extraordinary career, please write to us.','2022-11-06 07:37:04','http://languagelink.edu.vn',28,17,5),(41,'2022-11-06 08:20:41',NULL,'/api/file/images/upload/29/1667697640844_1667697640844_s.png','One Mount','One Mount Group được thành lập với tham vọng kiến tạo hệ sinh thái công nghệ lớn nhất Việt Nam, cung cấp các giải pháp và dịch vụ xuyên suốt chuỗi giá trị, từ lĩnh vực dịch vụ tài chính, phân phối, bất động sản và bán lẻ.','2022-11-06 08:20:41','https://onemount.com/',29,9,5),(42,'2022-11-06 08:41:28',NULL,'/api/file/images/upload/29/1667698888072_1667698888072_10668657.png','Shinhan DS Vietnam Company Limited','Shinhan DS Vietnam Co., Ltd. has been reinforcing generation of IT synergies within Shinhan Financial Group and offering the best-of-its kind financial IT services to its customers since 1991.','2022-11-06 08:41:28','',29,16,5),(49,'2022-11-10 22:02:53',NULL,'/api/file/images/upload/1/1668092573298_1668092573296_LG-logo.png','LG','LG Vehicle Component Solutions Development Center Vietnam (VS DCV)','2022-11-10 22:02:53','https://www.facebook.com/LGVSDCV',1,1,4),(50,'2022-11-13 18:57:27',NULL,'/api/file/images/upload/51/1668340646782_1668340646779_daikin.png','Daikin Air Conditioning (Vietnam) Joint Stock Company','Daikin Vietnam - formerly known as Viet Kim Company - was established in 1995, specializing in distributing Daikin air conditioning products in Viet Nam.','2022-11-13 18:57:27','https://www.daikin.com',51,17,6),(51,'2022-11-13 19:23:46',NULL,'/api/file/images/upload/51/1668342225884_1668342225884_11127170.png','Công Ty Cổ Phần Chứng Khoán MB','Được thành lập từ tháng 5 năm 2000 bởi Ngân hàng TMCP Quân đội (MB), Công ty CP Chứng khoán MB (MBS) là một trong 5 công ty chứng khoán đầu tiên tại Việt Nam','2022-11-13 19:23:46','https://www.mbbank.com.vn/',51,2,6);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_notifications`
--

DROP TABLE IF EXISTS `company_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company_notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_read` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `FKma13xndn80b9c44qaagrmp3u4` (`company_id`),
  CONSTRAINT `FKma13xndn80b9c44qaagrmp3u4` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_notifications`
--

LOCK TABLES `company_notifications` WRITE;
/*!40000 ALTER TABLE `company_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_roles`
--

DROP TABLE IF EXISTS `company_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `company_roles` (
  `company_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_roles`
--

LOCK TABLES `company_roles` WRITE;
/*!40000 ALTER TABLE `company_roles` DISABLE KEYS */;
INSERT INTO `company_roles` VALUES (1,'CREATOR'),(2,'CEO'),(3,'Director'),(4,'HR'),(5,'STAFF');
/*!40000 ALTER TABLE `company_roles` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `company_user_roles` VALUES (31,1,26),(32,1,26),(33,1,1),(34,1,1),(35,1,1),(36,1,1),(37,1,27),(38,1,27),(39,1,28),(40,1,28),(41,1,29),(42,1,29),(49,1,1),(50,1,51),(51,1,51),(33,2,26),(34,2,29),(35,3,27),(50,3,1),(31,4,1),(32,4,27),(34,4,26),(35,4,26),(37,4,26),(49,4,26),(50,4,26),(51,4,27),(33,5,27),(33,5,29),(49,5,26);
/*!40000 ALTER TABLE `company_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conversations` (
  `conversation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`conversation_id`),
  KEY `FKpltqvfcbkql9svdqwh0hw4g1d` (`user_id`),
  CONSTRAINT `FKpltqvfcbkql9svdqwh0hw4g1d` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (26,'2022-11-06 08:04:11',NULL,'2022-11-06 08:04:11',29),(27,'2022-11-06 09:26:20',NULL,'2022-11-06 09:26:20',26),(28,'2022-11-06 09:53:33',NULL,'2022-11-06 09:53:33',26),(29,'2022-11-13 07:00:00',NULL,'2022-11-13 07:00:00',26),(30,'2022-11-13 19:27:47',NULL,'2022-11-13 19:27:47',1);
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educations`
--

DROP TABLE IF EXISTS `educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `educations` (
  `education_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_date` datetime DEFAULT NULL,
  `grade` float NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`education_id`),
  KEY `FKff5wc10svmgvwumia2rsfaud6` (`user_id`),
  CONSTRAINT `FKff5wc10svmgvwumia2rsfaud6` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educations`
--

LOCK TABLES `educations` WRITE;
/*!40000 ALTER TABLE `educations` DISABLE KEYS */;
INSERT INTO `educations` VALUES (35,'2022-12-05 07:00:00',3.45,'Can Tho University','2018-05-23 07:00:00',1),(36,'2022-09-09 07:00:00',3.54,'Can Tho University','2018-02-05 07:00:00',26),(37,'2022-07-09 07:00:00',3.5,'Hutech University','2018-04-25 07:00:00',29);
/*!40000 ALTER TABLE `educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employment_types`
--

DROP TABLE IF EXISTS `employment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employment_types` (
  `employment_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employment_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employment_types`
--

LOCK TABLES `employment_types` WRITE;
/*!40000 ALTER TABLE `employment_types` DISABLE KEYS */;
INSERT INTO `employment_types` VALUES (1,'full-time'),(2,'part-time'),(3,'contract'),(4,'internship');
/*!40000 ALTER TABLE `employment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_companies`
--

DROP TABLE IF EXISTS `follow_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `follow_companies` (
  `user_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  KEY `FK77p3tk5m700b24bijexbj052y` (`company_id`),
  KEY `FKb2vx49ajh1mbec8d9p73dxbnn` (`user_id`),
  CONSTRAINT `FK77p3tk5m700b24bijexbj052y` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  CONSTRAINT `FKb2vx49ajh1mbec8d9p73dxbnn` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_companies`
--

LOCK TABLES `follow_companies` WRITE;
/*!40000 ALTER TABLE `follow_companies` DISABLE KEYS */;
INSERT INTO `follow_companies` VALUES (27,34),(28,32),(28,36),(26,32),(51,34),(51,50),(1,34),(1,33),(1,50),(1,51);
/*!40000 ALTER TABLE `follow_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_tags`
--

DROP TABLE IF EXISTS `follow_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `follow_tags` (
  `user_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  KEY `FKqdl0u34mxdxgxvx7jc1t68wwn` (`tag_id`),
  KEY `FKkv2209s6n6gv07sse0wekvmyw` (`user_id`),
  CONSTRAINT `FKkv2209s6n6gv07sse0wekvmyw` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKqdl0u34mxdxgxvx7jc1t68wwn` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_tags`
--

LOCK TABLES `follow_tags` WRITE;
/*!40000 ALTER TABLE `follow_tags` DISABLE KEYS */;
INSERT INTO `follow_tags` VALUES (28,57),(29,28),(1,28),(1,41),(51,47),(51,71),(51,68);
/*!40000 ALTER TABLE `follow_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_users`
--

DROP TABLE IF EXISTS `follow_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `follow_users` (
  `following_id` bigint(20) NOT NULL,
  `followed_id` bigint(20) NOT NULL,
  KEY `FK7dg0g99fb698afo6r7pbn5ra3` (`followed_id`),
  KEY `FKkfax38io7hohs9fjqiasoiwq6` (`following_id`),
  CONSTRAINT `FK7dg0g99fb698afo6r7pbn5ra3` FOREIGN KEY (`followed_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKkfax38io7hohs9fjqiasoiwq6` FOREIGN KEY (`following_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_users`
--

LOCK TABLES `follow_users` WRITE;
/*!40000 ALTER TABLE `follow_users` DISABLE KEYS */;
INSERT INTO `follow_users` VALUES (29,1),(1,1),(26,1),(51,1);
/*!40000 ALTER TABLE `follow_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industries`
--

DROP TABLE IF EXISTS `industries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `industries` (
  `industry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`industry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industries`
--

LOCK TABLES `industries` WRITE;
/*!40000 ALTER TABLE `industries` DISABLE KEYS */;
INSERT INTO `industries` VALUES (1,'Information Technology'),(2,'Finance'),(3,'Health Care and Social Assistance'),(4,'Agriculture'),(5,'Tourist'),(6,'Food And Drink'),(7,'Production'),(8,'Bank'),(9,'Market'),(10,'Insurance'),(11,'Advertising'),(12,'Energy'),(13,'Law'),(14,'Security'),(15,'Import and Export'),(16,'Software Development'),(17,'Education'),(18,'Hardware'),(19,'Furniture'),(20,'Electronic');
/*!40000 ALTER TABLE `industries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_question`
--

DROP TABLE IF EXISTS `job_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_question` (
  `job_que_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`job_que_id`),
  KEY `FK725y964f0x34ka2xd79g75f6i` (`job_id`),
  KEY `FK6ns3l5u99bfunmvfp82mi5rbn` (`question_id`),
  CONSTRAINT `FK6ns3l5u99bfunmvfp82mi5rbn` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  CONSTRAINT `FK725y964f0x34ka2xd79g75f6i` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_question`
--

LOCK TABLES `job_question` WRITE;
/*!40000 ALTER TABLE `job_question` DISABLE KEYS */;
INSERT INTO `job_question` VALUES (35,55,34),(36,55,35),(37,61,36),(38,61,37),(39,61,38),(40,65,39),(41,65,40),(42,65,41),(43,67,42),(44,72,43),(53,80,52),(54,85,53),(55,85,54),(56,86,55);
/*!40000 ALTER TABLE `job_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_skills`
--

DROP TABLE IF EXISTS `job_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_skills` (
  `skill_id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  KEY `FK1gb74tysr9vkypwivvvovxq1f` (`job_id`),
  KEY `FKe10ho7um0atjm67b9dgokmfyx` (`skill_id`),
  CONSTRAINT `FK1gb74tysr9vkypwivvvovxq1f` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  CONSTRAINT `FKe10ho7um0atjm67b9dgokmfyx` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_skills`
--

LOCK TABLES `job_skills` WRITE;
/*!40000 ALTER TABLE `job_skills` DISABLE KEYS */;
INSERT INTO `job_skills` VALUES (3,62),(6,62),(2,59),(10,59),(1,80),(3,80);
/*!40000 ALTER TABLE `job_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_tags`
--

DROP TABLE IF EXISTS `job_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_tags` (
  `tag_id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  KEY `FKy5ln7dquha6f0a63bnux2qlk` (`job_id`),
  KEY `FK2cw3d43irph8rm9f0lees5jm9` (`tag_id`),
  CONSTRAINT `FK2cw3d43irph8rm9f0lees5jm9` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`),
  CONSTRAINT `FKy5ln7dquha6f0a63bnux2qlk` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_tags`
--

LOCK TABLES `job_tags` WRITE;
/*!40000 ALTER TABLE `job_tags` DISABLE KEYS */;
INSERT INTO `job_tags` VALUES (41,52),(42,52),(28,53),(42,53),(43,53),(44,53),(28,54),(42,54),(44,54),(28,55),(43,55),(10,56),(43,56),(43,57),(45,57),(28,58),(46,58),(47,58),(47,60),(10,61),(22,61),(49,61),(1,62),(22,62),(22,63),(24,63),(27,64),(50,64),(51,65),(52,65),(53,66),(54,66),(55,67),(56,67),(48,68),(56,68),(19,69),(41,69),(57,69),(57,70),(58,70),(19,71),(57,71),(1,72),(59,72),(60,72),(59,73),(60,73),(61,73),(62,74),(63,74),(62,75),(63,75),(1,76),(78,76),(79,76),(12,77),(78,77),(28,78),(80,78),(81,79),(82,79),(11,60),(47,59),(48,59),(24,80),(28,80),(42,85),(87,85),(10,86),(88,86);
/*!40000 ALTER TABLE `job_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jobs` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `experience` float NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `job_description` text,
  `location` varchar(1000) DEFAULT NULL,
  `salary_max` int(11) NOT NULL,
  `salary_min` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `employment_type_id` bigint(20) DEFAULT NULL,
  `position_id` bigint(20) DEFAULT NULL,
  `work_place_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `FKrtmqcrktb6s7xq8djbs2a2war` (`company_id`),
  KEY `FK1hr4wlsdirv7lgxl7a5ta4br3` (`employment_type_id`),
  KEY `FK4dl7f5eydopt2a8bgrk3ngohe` (`position_id`),
  KEY `FKcqx06r3c7kkctv6pckingsts5` (`work_place_id`),
  CONSTRAINT `FK1hr4wlsdirv7lgxl7a5ta4br3` FOREIGN KEY (`employment_type_id`) REFERENCES `employment_types` (`employment_type_id`),
  CONSTRAINT `FK4dl7f5eydopt2a8bgrk3ngohe` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`),
  CONSTRAINT `FKcqx06r3c7kkctv6pckingsts5` FOREIGN KEY (`work_place_id`) REFERENCES `work_places` (`work_place_id`),
  CONSTRAINT `FKrtmqcrktb6s7xq8djbs2a2war` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (52,10,'2022-01-05 19:24:30',NULL,NULL,0,'/api/file/images/upload/26/1667651070073_1667651070073_RBVH-Logo.png','<h2>WHAT WE CAN OFFER</h2><p class=\"ql-align-center\"><br></p><p>13th-month bonus + yearly performance bonus + annual salary appraisal</p><p class=\"ql-align-center\"><br></p><p>Premium health insurance for employee + 2 family members</p><p class=\"ql-align-center\"><br></p><p>16++ days of paid leave per year</p><h2>JOB DESCRIPTION</h2><p>• Verification and Validation of Configurable items</p><p>• Configuration Audits reporting, verification of actions and tracking to closure</p><p>• Facilitate for CAR/8D and LLBP</p><p>• Quality Assurance Activities</p><p>• Project, Planning, Tracking and Closure</p><p>• Conduct reviews of activities and work products against specifications, processes and standards.</p><p>• Reporting of QA status</p><p>• PDC shall be performed by EPQ prior to all releases</p><p>• Creation and regular updating of product-related quality forecast and alignment of quality targets with - product/project and business targets) with risk assessments and if necessary arrange measures and review their effectiveness.</p><p>• Independent evaluation of product-/process maturity.</p><p>• Preparation of quality report based on defined quality targets and KPI</p><p>• Duty to escalate if measures to achieve the Q-targets are not sufficient in her/his view.</p><p>• Release of SW-Release of in-house development and third-party components from Q-perspective.</p><p>• Request systematical problem solving in case of deviations in the project</p><p>• Responsible to check the existence of required review/approval records and compliance information for the 3rd party software license usage.</p><p>• Enssurance of adequate use (right effect) of SW/IT quality methods and processes in product development and regarding incoming products.</p><p>• Verification, if software quality assurance activities are carried out as planned and whether the quality status corresponds to the prerequisites for the product release.</p><p><span style=\"color: rgb(0, 90, 255); background-color: transparent;\">Read full Job Descriptions</span></p><h2>JOB REQUIREMENTS</h2><p>Mandatory requirement</p><p>• B.S of Computer Science, Computer Engineering, Information Technology, MIS or related major</p><p>• 4-7 Years of hands-on related experience, especially in Software Quality activities</p><p>• Good knowledge with ISO9001:2015, CMMI 2.0, ITIL foundation. Practical experience in this aspect is a treasure</p><p>• Office experience and Reporting skill: MS Excel, Word, PPT, VBA, Scripting, Power BI desktop (reporting and DAX - Data Analysis Expressions)</p><p>• Good Communication skills in English, able to work with different stakeholders</p><p>• Software Development Lifecycle (SDLC), Software Maintenance Lifecycle (SMLC)</p><p>• Quality Engineer, Quality inspection and testing</p><p>• Data collection and analysis</p><p>• Planning and organizing</p><p>• Patience, Working under pressure, Conflict management</p><p>• Exposure in software projects</p><p><br></p><p>Desirable Skills:</p><p>• Problem analysis and problem solving, 7 QC tools</p><p>• Statistical Process Control: Hypothesis testing, acceptance sampling, prediction; DoE, six Sigma</p><p>• Internal Auditor, Quality Auditor, CSQA etc</p><p>• ISO 9001:2015, ITIL, ISO/TS 16949, ASPICE, CMMI Dev Ver2.0 processes, etc.</p>','Etown building, 364 Cong Hoa street, ward 13, Tan Binh district, Ho Chi Minh, Vietnam',3000,2000,NULL,'Epq - Engineering Product Quality (Quality Assurance)','2022-11-05 19:24:30',31,1,1,1),(53,20,'2022-01-05 19:29:47',NULL,NULL,1,'/api/file/images/upload/26/1667651387071_1667651387071_RBVH-Logo.png','<h2>JOB DESCRIPTION</h2><p>- Support End-User via SMT Ticket following ITIL Process which are maintained with defined SLA &amp; KPI</p><p>- Contribute to problem investigation, change management</p><p>- Working on Oracle PL/SQL</p><p>- Support for new feature release, hot-fix</p><p>- Maintain and manage the application servers</p><p>- To the holder of this position other tasks and activities related to the current job can be assigned by line-manager</p><h2>JOB REQUIREMENTS</h2><p>- Bachelor degree in IT/ Computer Science or relevant background</p><p>- Knowledge of SQL, PL/SQL</p><p>- Knowledge in Service Management Tool (Redemy , Service Now, ServiceDesk Plus)</p><p>- To be trained in process know how (Incident, Problem, Change Management)</p><p>- Strong communication, interpersonal and intercultural skills</p>','ho chi minh',2000,1500,NULL,'Global IT Support (Fresher)','2022-11-05 19:29:47',31,1,1,1),(54,1,'2022-11-05 19:31:35',NULL,NULL,0,'/api/file/images/upload/26/1667651494602_1667651494602_RBVH-Logo.png','<h2>WHAT WE CAN OFFER</h2><p class=\"ql-align-center\"><br></p><p>13th-month bonus + yearly performance bonus + annual salary appraisal</p><p class=\"ql-align-center\"><br></p><p>Premium health insurance for employee + 2 family members</p><p class=\"ql-align-center\"><br></p><p>16++ days of paid leave per year</p><h2>JOB DESCRIPTION</h2><p>Overview: Bosch Hybrid Cloud provides Bosch business units with best-fit services from private and public clouds. Your work as a IT Development Lead involves leading development &amp; automation of the Cloud Frameworks &amp; Automation Product portfolio using state of the art Development Tools and frameworks</p><p><br></p><p>- Mange overall product design, architecture, development, code review, and testing of apps</p><p>- Preparing low- and high-level design documents</p><p>- Drive adopting new technologies, ideas, and continuous improvement of processes</p><p>- Guiding and mentoring team members Best Practices</p><p>- Oversee Continuous Integration/Continuous Deployment</p><p>- Define and document best practices and strategies application deployment</p><p>- Ensuring systems availability and scalability</p><p>- Define and deploy monitoring, metrics and logging systems</p><p>- Operate the platform within our security and privacy guidelines</p><p>- Automate stories and tasks wherever it requires</p><p>- Ensure code quality with Unit and integration tests</p><p><span style=\"color: rgb(0, 90, 255); background-color: transparent;\">Read full Job Descriptions</span></p><h2>JOB REQUIREMENTS</h2><p>This role requires both depth and breadth in technologies used in modern DevOps landscapes, PaaS platforms and the development of cloud-native application architectures (micro-services). Furthermore, a solid understanding of the components required to provide high-availability application and networking environment is required. The role demands strong work ethic, critical attention to detail, thoroughness, strong analytical, problem-solving skills and the following qualifications:</p><p>• Solid web application development experience using Java and Sprint Boot</p><p>• Proficiency in one or more frontend frameworks (Angular or React or etc.,)</p><p>• Hands on experience in JavaScript, Bootstrap, HTML5/CSS3, JQuery</p><p>• Strong SQL and No-SQL databases design experience (Oracle or MySQL/Cassandra/Mongo)</p><p>• Experience in developing and consuming RESTful APIs, SOAP and JSON data</p><p>• Strong experience in consuming cloud services like API Gateway, RabbitMQ, Redis, Logic Apps, Active Directory</p><p>• Hands on experience in setting up CI/CD Pipeline using tools like Jenkins, Maven, Artifactory and others</p><p>• Hands-on experience in writing Unit, Integration and Functional Tests.</p><p>• Solid experience in OOAD, Design patterns and UML.</p><p>• Experience in designing Cloud Native and Cloud Agnostic solutions</p><p>• Good communication and client-facing skills.</p><p>• Hands-on experience across all phases of SDLC using Agile Methodologies</p><p>• Integration, Continuous Delivery, Pair programming and Test Driven Development (TDD)</p><p>• Knowledge on Bosch SEP Process\\ Could Security \\ Application Security</p><p>Recommended Skills:</p><p>- Knowledge in the field of Cloud Platform Development/ Operations, system engineering or similar (For e.g. Cloud Foundry, OpenShift etc.)</p><p>- Knowledge in Infrastructure as Code, Orchestration tools (e.g. Terraform, Cloud Formation, Ansible etc.)</p><p>- Working knowledge with modern security concepts (OAuth, micro segmentation etc.)</p><p>- Working knowledge with monitoring/logging tools (e.g. Grafana, Elasticsearch, Splunk, Prometheus etc.)</p><p>- Knowledge of public cloud technologies (e.g. Azure, AWS etc.)</p><p>Language: Speak &amp; write fluently in English</p><h2>JOB LOCATIONS</h2><p class=\"ql-align-center\"><br></p><p>Etown Building, 364 Cong Hoa, Ward 13, Tan Binh District, HCMC</p>','ho chi minh',2500,2000,NULL,'Java Technical Lead (Joining Bonus)','2022-11-05 19:31:35',31,1,1,1),(55,100,'2022-11-05 19:46:19',NULL,NULL,1,'/api/file/images/upload/26/1667652378781_1667652378781_1665755678671.jpg','<h2>About the job</h2><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Job Description</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Design, develop, troubleshoot and debug software programs for databases, applications, tools, networks etc.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">As a member of the software engineering division, you will apply basic to intermediate knowledge of software architecture to perform software development tasks associated with developing, debugging or designing software applications or operating systems according to provided design specifications. Build enhancements within an existing software architecture and occasionally suggest improvements to the architecture.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Duties and tasks are standard with some variation; displays understanding of roles, processes and procedures. Performs moderately complex problem solving with assistance and guidance in understanding and applying company policies and processes. BS degree or equivalent experience relevant to functional area. 1 year of software engineering or related experience.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Responsibilities</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">As a member of the software engineering division, you will apply basic to intermediate knowledge of software architecture to perform software development tasks associated with developing, debugging or designing software applications or operating systems according to provided design specifications. Build enhancements within an existing software architecture and occasionally suggest improvements to the architecture.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Duties and tasks are standard with some variation; displays understanding of roles, processes and procedures. Performs moderately complex problem solving with assistance and guidance in understanding and applying company policies and processes. BS degree or equivalent experience relevant to functional area. 1 year of software engineering or related experience.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">About Us</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">As a world leader in cloud solutions, Oracle uses tomorrow’s technology to tackle today’s problems. True innovation starts with diverse perspectives and various abilities and backgrounds.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">When everyone’s voice is heard, we’re inspired to go beyond what’s been done before. It’s why we’re committed to expanding our inclusive workforce that promotes diverse insights and perspectives.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">We’ve partnered with industry-leaders in almost every sector—and continue to thrive after 40+ years of change by operating with integrity.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Oracle careers open the door to global opportunities where work-life balance flourishes. We offer a highly competitive suite of employee benefits designed on the principles of parity and consistency. We put our people first with flexible medical, life insurance and retirement options. We also encourage employees to give back to their communities through our volunteer programs.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">We’re committed to including people with disabilities at all stages of the employment process. If you would like accessibility assistance or accommodation for a disability at any point, let us know at +1.888.404.2494, Option 1.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Disclaimer:</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Certain US customer or client-facing roles may be required to comply with applicable requirements, such as immunization and occupational health mandates.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Oracle is an Equal Employment Opportunity Employer*. All qualified applicants will receive consideration for employment without regard to race, color, religion, sex, national origin, sexual orientation, gender identity, disability and protected veterans’ status, or any other characteristic protected by law. Oracle will consider for employment qualified applicants with arrest and conviction records pursuant to applicable law.</span></p><ul><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Which includes being a United States Affirmative Action Employer</span></li></ul><p><br></p>',' United States',2000,1000,NULL,'Software Developer','2022-11-05 19:46:19',32,2,1,3),(56,5,'2022-11-05 19:49:13',NULL,NULL,1,'/api/file/images/upload/26/1667652552703_1667652552703_1665755678671.jpg','<p>Why ORACLE + NetSuite?&nbsp;To start, you’ll be surrounded by smart, innovative, caring people — invested in our customers and the community. If you’re looking to share your unique perspective and ideas at a collaborative table and help equip all kinds of businesses achieve their visions, check us out.</p><p>The Technical Team mainly handles customization and integration requests of customers. We work with other groups such as CSMs and Functional Consultants to make sure each engagement is successful.</p><p><br></p><p>Job summary:</p><p>A Technical Consulting position operating independently with some assistance and guidance to provide quality work products to a project team or customer that comply with Oracle NetSuite methodologies and practices. Performs standard duties and tasks with some variation to implement Oracle NetSuite products and technology to meet customer specifications.</p><p>As a Technical Consultant, you will help develop custom scripts or workflows that will enhance the system to suit the customer’s unique business process. You will also help the customers on how they can leverage proprietary technologies on top of the platform and incorporate it in their business requirements.</p><p>Skills we are looking for:</p><ul><li>Experience in Object Oriented Programming (i.e. Java, .Net, Python, C# etc.)</li><li>Javascript will be a big advantage</li><li>HTML/CSS</li><li>SQL / DB Mgt is a plus</li><li>Web services is a plus</li><li>Experience in translating business requirements into a technical solution</li></ul><p><br></p>','Philippines ',4000,2000,NULL,'Fullstack Developer','2022-11-05 19:49:13',32,1,2,3),(57,100,'2022-02-05 19:51:43',NULL,NULL,0,'/api/file/images/upload/26/1667652702853_1667652702853_1665755678671.jpg','<p>The ideal candidate will be responsible for developing high-quality applications. They will also be responsible for designing and implementing testable and scalable code.</p><p><br></p><p>Responsibilities</p><ul><li>Develop quality software and web applications</li><li>Analyze and maintain existing software applications</li><li>Design highly scalable, testable code</li><li>Discover and fix programming bugs</li></ul><p><br></p><p>Qualifications</p><ul><li>Bachelor\'s degree or equivalent experience in Computer Science or related field</li><li>Development experience with programming languages</li><li>SQL database or relational database skills</li><li>Javascript Experience of atleast 1 year</li></ul><p><br></p>','Philippines ',2000,1000,NULL,'Junior Javascript Developer','2022-11-05 19:51:43',32,1,1,3),(58,10,'2022-03-05 19:58:42',NULL,NULL,0,'/api/file/images/upload/1/1667653122202_1667653122202_tma.jpg','<p><span style=\"color: rgba(0, 0, 0, 0.9);\">Mô tả công việc: Củng cố kiến thức chuyên môn bằng các khóa đào tạo dành cho nhân viên mới từ 1 - 2 tháng Tham gia làm việc tại dự án thực tế sau khi được đào tạo Quyền lợi: Được đào tạo kỹ thuật và công nghệ trước khi tham gia dự án với khách hàng Bắc Mỹ, Châu Âu, Úc Mức lương thỏa thuận và hưởng 100% lương trong thời gian đào tạo Môi trường làm việc chuyên nghiệp, nhiều cơ hội thăng tiến Được hưởng đầy đủ các chế độ BHXH, BHYT, BHTN và Chương trình Bảo hiểm chăm sóc sức khoẻ toàn diện Yêu cầu ứng viên: Nắm vững kiến thức nền tảng (OOP, cấu trúc dữ liệu, thuật toán) Có kỹ năng lập trình ngôn ngữ Python Biết dùng ít nhất một Python Framework (như Django, Flask hoặc Pyramid) Có kiến thức về ORM Biết dùng các công nghệ front-end (như JavaScript và HTML5) Có tư duy lập trình tốt Địa điểm làm việc: Các văn phòng TMA tại Q. Phú Nhuận và Q.12, TP. Hồ Chí Minh Thu nhập: Theo năng lực. Cạnh tranh</span></p>','ho chi minh',1000,500,NULL,'Fresher Python Developer - Không yêu cầu kinh nghiệm','2022-11-05 19:58:42',33,1,1,1),(59,10,'2022-11-05 20:00:17',NULL,NULL,0,'/api/file/images/upload/1/1667653217139_1667653217139_tma.jpg','<p><span style=\"color: rgba(0, 0, 0, 0.9);\">Mô tả công việc: Củng cố kiến thức chuyên môn bằng các khóa đào tạo dành cho nhân viên mới từ 1-2 tháng Tham gia làm việc tại dự án thực tế sau khi được</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">đào tạo Quyền lợi: Được đào tạo kỹ thuật và công nghệ trước khi tham gia dự án với khách hàng Bắc Mỹ, Châu Âu, Úc Mức lương thỏa thuận và hưởng 100% lương trong thời gian đào tạo Môi trường làm việc chuyên nghiệp, nhiều cơ hội thăng tiến Yêu cầu ứng viên: Nắm vững kiến thức nền tảng (OOP, cấu trúc dữ</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">liệu, thuật toán) Thành thạo với quy trình làm việc với GIT Kiến thức tốt về Ruby hoặc Python Kiến thức làm việc về cơ sở dữ liệu và SQL Hiểu biết về các công nghệ container (Docker,</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">RKT, Kubernetes, v.v.) Kinh nghiệm cơ bản với hệ thống CI / CD</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">(Jenkins, TeamCity, GoCD, Concourse, v.v.) Kinh nghiệm cơ bản khi làm việc với AWS /</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Google Cloud Có tư duy lập trình tốt Địa điểm làm việc: Các văn phòng TMA tại Q. Phú Nhuận và Q.12, TP. Hồ</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Chí Minh Thu nhập: Theo năng lực. Cạnh tranh</span></p>','ho chi minh',542,345,NULL,'Fresher DevOps Engineer','2022-11-11 06:47:12',33,1,1,1),(60,200,'2022-04-05 20:02:53',NULL,NULL,0,'/api/file/images/upload/1/1667653372844_1667653372843_tma.jpg','<p><span style=\"color: rgba(0, 0, 0, 0.9);\">Mô tả công việc: Củng cố kiến thức chuyên môn bằng các khóa đào tạo dành cho nhân viên mới từ 1-2 tháng Tham gia làm việc tại dự án thực tế sau khi được đào tạo Quyền lợi: Được đào tạo kỹ thuật và công nghệ trước khi tham gia dự án với khách hàng Bắc Mỹ, Châu Âu, Úc Mức lương thỏa thuận và hưởng 100% lương trong thời gian đào tạo Môi trường làm việc chuyên nghiệp, nhiều cơ hội thăng tiến Yêu cầu ứng viên: Nắm vững kiến thức nền tảng (OOP, cấu trúc dữ liệu, thuật toán) Có kiến thức về lập trình Java Hiểu biết về ORM và Hibernate/JPA Có kiến thức về Spring/Spring Boot Framework và Restful API Có tư duy lập trình tốt Địa điểm làm việc: Các văn phòng TMA tại Q. Phú Nhuận và Q.12, TP. Hồ Chí Minh Thu nhập: Theo năng lực. Cạnh tranh</span></p>','ho chi minh',500,500,NULL,'Fresher Java Developer','2022-11-05 20:02:53',33,1,1,1),(61,10,'2022-04-05 20:07:56',NULL,NULL,1,'/api/file/images/upload/1/1667653676157_1667653676157_fpt.jpg','<p>FPT Software&nbsp;Ho Chi Minh City Metropolitan Area&nbsp;On-site</p><p><br></p><p>Talent Acquisition Associate</p><p>Job poster · LinkedIn member since August 2021</p><p>1 mutual connection</p><p><a href=\"https://www.linkedin.com/premium/products/?family=jss&amp;destUrl=https%3A%2F%2Fwww%2Elinkedin%2Ecom%2Fjobs%2Fview%2F3342418769%2F&amp;upsellOrderOrigin=premium_job_details_upsell_job_poster\" target=\"_blank\" style=\"color: var(--color-text-low-emphasis-shift); background-color: var(--color-background-none);\">Message</a></p><p>The ideal candidate is a highly resourceful and innovative developer with extensive experience in the layout, design and coding of websites specifically in PHP format. You must also possess a strong knowledge of web application development using PHP programming language and MySQL Server databases.</p><p>Responsibilities</p><ul><li>Maintance Legacy System.</li><li>Enhance current features or create new features to adapt with new architecture.</li><li>Able to optimize some complicated SQL queries.</li><li>Ability to troubleshoot production issues/incidents.</li><li>Ability to use monitoring tools - NewRelic, CloudWatch, Splunk.</li></ul><p><br></p><p>Qualifications</p><p>Technical Requires:</p><ul><li>PHP 5.6 -&gt; 7</li><li>Zend Framework 1</li><li>MySQL</li><li>AWS Services: Codebuild, Codepipeline, Memcache, ActiveMQ.</li><li>Tools: NewRelic, Splunk</li><li>Docker</li></ul><p><br></p><p>Benefits</p><p>Successful candidates will be part of a friendly, motivated and committed talent teams in FPT Software HCM (FSOFT) with various benefits and attractive offers:</p><ul><li>COMPETITIVE SALARY PACKAGE based on your competent plus Annual Bonus and Project Performance Bonus “FPT care” health insurance provided by AON and is exclusive for FPT employees.</li><li>Company shuttle buses provide convenient way of transportation for all employees.</li><li>Annual Summer Vacation: Base on Company’s policy</li><li>Other allowances: transportation allowance, lunch allowance, working on-site allowance, etc. plus company support for housing in District 9.</li><li>F-Town Campus provide many facilities for FPT Software employees such as football ground, basketball &amp; volleyball, gym &amp; yoga centre, restaurant, cafeteria, etc.</li></ul><p><br></p>','ho chi minh',2000,1000,NULL,'PHP Developer','2022-11-05 20:07:56',34,1,1,1),(62,0,'2022-11-05 20:12:22',NULL,NULL,0,'/api/file/images/upload/1/1667653941530_1667653941530_fpt.jpg','<p>Job description:</p><p><br></p><p>Joining to Software Build - web application on cloud for USA customer</p><p>Define and detail the functions, interfaces</p><p>Detail datatypes/data structures required within the application</p><p>Data models for persistent data requirements</p><p>Class models with methods, attributes defined. UML Modeling where necessary</p><p>Details around business processes, system specific algorithms, etc.</p><p>Review code and establish best practices.</p><p><br></p><p>Job qualification:</p><p><br></p><p>Experience in Angular ≥ 2 years</p><p>- Good verbal and written communication.</p><p>- Communicate with Solution architect, project members in an agile scrum methodology</p><p>DEV04: Good technical leadership who can work with other team members to identify and evaluate new technology and tools. Lead or Mentor junior and/or mid-level developers</p><p>DEV03: More hands-on Development.</p><p><br></p><p>Benefits:</p><p><br></p><p>Successful candidates will be part of a friendly, motivated and committed talent teams in FPT Software HCM (FSOFT) with various benefits and attractive offers:</p><p>· Be able to work in major projects with big customers and exchange knowledge with specialists and experts from top IT corporations</p><p>· Be supported preferential buying a department with Senior.</p><p>· COMPETITIVE SALARY PACKAGE based on your competent plus Annual Bonus and Project Performance Bonus “FPT care” health insurance provided by AON and is exclusive for FPT employees.</p><p>· 18 Leave day (12 Annual leave, 6 Sick Leave)</p><p>· Annual Summer Vacation: 1-6 Million Cash, 1-3 Leave holiday</p><p>· Annual health check up</p><p>· Udemy Premium account for one year</p><p>· English class, sponsor for taking certification as: PMP, AWS…</p><p>· 13th month Salary</p><p>· Other allowances: transportation allowance, lunch allowance, working on-site allowance, etc.</p><p>· Company shuttle buses provide convenient way of transportation for all employees.</p><p>· F-Town Campus provide many facilities for FPT Software employees such as football ground, basketball &amp; volleyball, gym &amp; yoga centre, restaurant, cafeteria, etc.</p><p><br></p><p><br></p>','Da Nang',500,200,NULL,'Angular Developer','2022-11-05 20:14:19',34,1,1,1),(63,10,'2022-11-05 20:16:54',NULL,NULL,1,'/api/file/images/upload/1/1667654214031_1667654214030_embedded.jpg','<p>About Project</p><ul><li>You will take part in multi-million project for high-profile customer, which are automotive industry leaders Japan.</li><li>You will design solution for embedded software used in a car such as Autosar software.</li><li>You have a great career advance to expand your horizon not only in automotive industry but also the international working experience</li></ul><p><br></p><p>Responsibilities</p><ul><li>Development and maintenance of the Device drivers for various microcontrollers</li><li>Work with various kinds of microcontroller from Renesas, ST, …</li><li>Perform design, analysis and integrated testing on hardware and software, system diagnostic and failure management</li></ul><p><br></p><p>Qualifications</p><p>Must have:</p><ul><li>At least 1 years’ experience in programming in C, Embedded system development</li><li>Experience in the development, configuration, or testing of any of the following areas: AUTOSAR Basic Software (BSW) e.g. CAN stack, ETH stack, Memory stack, Diagnostic stack , Microcontroller Abstraction Layer (MCAL), ECU Abstraction Layer.</li><li>Good Development experience on 16/32 bit microcontroller families like Renesas, ST, ...</li><li>Excellent knowledge on Compilers, Debuggers for different micro-controllers</li><li>Good knowledge of hardware, software embedded system concepts and architecture.</li><li>Good understanding of the embedded software build process (compiling, linking, programming, etc.).</li><li>Ability and ease with using lab tools such as debuggers, emulators, oscilloscopes, etc.</li><li>Experience with configuration management software (SVN, GIT)</li><li>Ability to analyze / study new technical, new hardware</li><li>Excellent teamwork and communication skills.</li><li>Good at English communication</li></ul><p><br></p><p>Nice to have:</p><ul><li>ASPICE development process</li><li>Functional Safety Experience (ISO 26262)</li><li>Overall understanding of automotive system</li></ul><p><br></p>','ha noi',3000,2000,NULL,'Embedded Software Engineer','2022-11-05 20:16:54',34,1,2,1),(64,10,'2022-11-05 20:35:38',NULL,NULL,0,'/api/file/images/upload/1/1667655337582_1667655337578_KMS.jpg','<p>KMS was established in 2009 as a U.S.-based software development &amp; consulting company with development centers in Vietnam. Over 13 years of operation, we have been trusted globally for the superlative quality of software services, products, technology solutions and engineers\' expertise.</p><p><br></p><ul><li>KMS Technology focuses on custom software development and a wide variety of consulting services</li><li>KMS Healthcare specialises in the healthcare industry, provides a unique blend of consultative healthcare technology solutions backed by the power of full lifecycle development support</li><li>KMS Solutions serves the Asia Pacific region, bringing the world\'s innovative technologies to help organizations achieve their business goals through world-class digital capabilities and fit-for-purpose solutions</li></ul><p><br></p><p><br></p><p>Besides providing services, KMS builds and successfully launches its own software companies through its internal startup incubator, KMS Labs. The most notable companies with millions of users worldwide include QASymphony, Kobiton, Katalon, Grove, and Visily.</p><p><br></p><p><br></p><p>KMS is committed to providing tangible contributions and long-lasting impacts to the communities through leveraging our IT expertise. The company has also been recognized by prestigious industry awards as a great workplace in Vietnam, Asia, and the U.S. for many years in a row.</p><p><br></p><p>Job Description</p><p><br></p><p>Your key responsibilities:</p><p><br></p><ul><li>Understand and support the client\'s requirements</li><li>Follow your passion</li><li>Enjoy every single working day with your nice colleagues and our kind clients</li><li>Take your skill to the next level</li></ul><p><br></p><p><br></p><p>The responsibility includes design, coding, troubleshooting, and working with the project team as well as customers on features/bug fixes</p><p><br></p><p>Qualifications</p><p><br></p><p>Your key qualifications:</p><p><br></p><ul><li>Final year student/ new graduate/ less than 1 year of experience</li><li>Ready to work full-time</li><li>Passion for .NET technology</li><li>Strong fundamental of .NET Framework, C#, SQL, OOP, data structure and algorithms</li><li>Understanding thoroughly of projects being done in university or during the internship</li><li>Good English skills (especially reading and writing)</li><li>Have good communication and be a good team-player</li></ul><p><br></p><p><br></p><p>Additional Information</p><p><br></p><p>Perks you Enjoy</p><p><br></p><ul><li>Working in one of the Best Places to Work in Vietnam</li><li>Building large-scale &amp; global software products</li><li>Working &amp; growing with Passionate &amp; Talented Team</li><li>Diverse careers opportunities with Software Outsourcing, Software Product Development, IT Solutions &amp; Consulting</li><li>Attractive Salary and Benefits</li><li>Performance appraisals every year</li><li>Onsite opportunities: short-term and long-term assignments in North American (U.S, Canada), Europe, Asia.</li><li>Flexible working time</li><li>Various training on hot-trend technologies, best practices, and soft skills</li><li>Premium healthcare insurance for you and your loved ones</li><li>Company trip every summer, big annual year-end party every year, team building, etc.</li><li>Fitness &amp; sports activities: football, tennis, table-tennis, badminton, yoga, swimming…</li><li>Joining community development activities: 1% Pledge, charity every quarter, blood donation, public seminars, career orientation talks,…</li><li>Free in-house entertainment facilities (foosball, ping pong, gym…), coffee (latte, cappuccino, espresso), and snack (instant noodles, cookies, candies…)</li></ul><p><br></p><p>And much more...Send your&nbsp;<u>Resume including Academic Transcript</u>&nbsp;to join us and let yourself explore other fantastic things!</p><h3>Benefits found in job post</h3><ul><li>Medical insurance</li></ul><p><br></p>','Da Nang',2000,1000,NULL,'Fresher .Net Software Engineer','2022-11-05 20:35:38',35,1,1,1),(65,10,'2022-11-05 20:47:00',NULL,NULL,0,'/api/file/images/upload/1/1667656019819_1667656019819_KMS.jpg','<h2>About the job</h2><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Company Description</span></p><p><br></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">KMS was established in 2009 as a U.S.-based software development &amp; consulting company with development centers in Vietnam. Over 13 years of operation, we have been trusted globally for the superlative quality of software services, products, technology solutions and engineers\' expertise.</span></p><p><br></p><ul><li><span style=\"color: rgba(0, 0, 0, 0.9);\">KMS Technology focuses on custom software development and a wide variety of consulting services</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">KMS Healthcare specialises in the healthcare industry, provides a unique blend of consultative healthcare technology solutions backed by the power of full lifecycle development support</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">KMS Solutions serves the Asia Pacific region, bringing the world\'s innovative technologies to help organizations achieve their business goals through world-class digital capabilities and fit-for-purpose solutions</span></li></ul><p><br></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Besides providing services, KMS builds and successfully launches its own software companies through its internal startup incubator, KMS Labs. The most notable companies with millions of users worldwide include QASymphony, Kobiton, Katalon, Grove, and Visily.</span></p><p><br></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">KMS is committed to providing tangible contributions and long-lasting impacts to the communities through leveraging our IT expertise. The company has also been recognized by prestigious industry awards as a great workplace in Vietnam, Asia, and the U.S. for many years in a row.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Job Description</span></p><p><br></p><ul><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Execute all testing activities to improve product quality, work closely with the team (developers, business analysis, customer service, operation, etc.) to deliver the product success</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Address the test automation needs in a methodical, detail-oriented manner with the help of robust analytical skills and problem-solving capacity</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Automate functional, regression and/or performance acceptance tests</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Have complete responsibility to enhance end-to-end automated test coverage</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Participate in sprint planning and work closely with the Scrum team to analyze requirements and provide necessary test recommendations</span></li></ul><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Qualifications</span></p><p><br></p><ul><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Strong experience in developing test automation for web services and web application</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">2+ years of experience in creating and running automated tests using testing frameworks like Katalon/Appium/Selenium/etc.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Solid testing experiences (test strategy, test approach, test plan, test techniques included black box, risk-based, exploratory, Non-UI testing, etc.)</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Good knowledge of the software development process, especially the software testing process</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Have experience on UI testing with Selenium, API testing, Java technology</span></li></ul><p><br></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Additional Information</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Perks You\'ll Enjoy</span></p><p><br></p><ul><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Working in one of the Best Places to Work in Vietnam</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Building large-scale &amp; global software products</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Working &amp; growing with Passionate &amp; Talented Team</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Diverse careers opportunities with Software Outsourcing, Software Product Development, IT Solutions &amp; Consulting</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Attractive Salary and Benefits</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Two performance appraisals every year and performance bonus</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Onsite opportunities: short-term and long-term assignments in North American (U.S, Canada), Europe, Asia.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Flexible working time</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Various training on hot-trend technologies, best practices and soft skills</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Premium healthcare insurance for you and your loved ones</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Company trip, big annual year-end party every year, team building, etc.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Fitness &amp; sport activities: football, tennis, table-tennis, badminton, yoga, swimming,…</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Joining community development activities: 1% Pledge, charity every quarter, blood donation, public seminars, career orientation talks,…</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Free in-house entertainment facilities (foosball, ping pong, gym…), coffee, and snack (instant noodles, cookies, candies…)</span></li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">And much more, join us and let yourself explore other fantastic things!</span></p>','Can Tho',1000,500,NULL,'Automation Test Engineer (UI, API Testing)','2022-11-05 20:47:00',35,1,1,1),(66,10,'2022-11-05 21:02:08',NULL,NULL,1,'/api/file/images/upload/1/1667656926734_1667656926734_HoangLinhPlus.png','<p><span style=\"color: rgba(0, 0, 0, 0.9);\">A rapidly-growing company offering affordable world-class IT solutions that are responsive and customer-focused is looking for a Full-Stack Developer. The developer will be in charge of improving scalability, service reliability, capacity, and performance. The company is offering businesses across the world a host of IT-related services. This will be a full-time position that offers amazing opportunities for developers to grow their careers.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Job Responsibilities:</span></p><p><br></p><ul><li>Develop the web architecture for the company’s platform</li><li>Collaborate effectively across cross-functional teams to meet the company’s goals</li><li>Enhance the performance and responsiveness of the web applications</li><li>Help form and maintain engineering best practices in the organization</li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Job Requirements:</span></p><p><br></p><ul><li>Bachelor’s/Master’s degree in Engineering, Computer Science (or equivalent experience)</li><li>At least 3+ years of relevant experience as a full-stack developer</li><li>Extensive experience in Node.js, Java, Angular, and JavaScript</li><li>Nice to have experience in HTML, CSS, and SQL</li><li>Fluent in verbal and written English</li></ul><p><br></p>','Ho Chi Minh',1000,200,NULL,'Remote Full-Stack Developer Jobs','2022-11-05 21:02:08',36,1,1,1),(67,10,'2022-11-05 21:46:11',NULL,NULL,5,'/api/file/images/upload/27/1667659571124_1667659571124_chotot.jpg','<h2>About the job</h2><p><span style=\"color: rgba(0, 0, 0, 0.9);\">At&nbsp;Cho Tot, we rely on powerful and insightful data to power our systems and make data-driven solutions. As a Analytics Engineer in&nbsp;Cho Tot, you are accountable for delivering highest quality data, data models to help business get insights, make impactful decision to drive the best performance of Chotot products overall.</span></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">You will have the autonomy to lead data analytics projects and solve real-life business problems by working together with a core team of passionate Business Analyst, Data Engineer, and AI Engineer.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">What will you be doing?</span></p><ul><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Provide clean, transformed data ready for analysis. Turn vast amount of data into insightful, ease to use, automated business intelligent report</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Apply software engineering best practice to analytics code (version control, testing, continuous integration)</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Responsible for data quality including: design, plan, build, and maintain report system of overall Chotot’s Data Quality</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Responsible for data consistency, data usages across organization: build and maintain data documentation, definitions, sync to Chotot’s data discovery platform, broadcast data metrics across the org</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Train business users on using data visualization tools, standardize reporting system</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Collaborate closely with Business Analyst, Data Engineer to provide good quality data with minimum time</span></li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">What do you need for the role?</span></p><ul><li><span style=\"color: rgba(0, 0, 0, 0.9);\">1+ years of related experience in Data Engineering, Analyst Engineer roles with BSc, MSc degree in Computer Science related fields</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Expertise in SQL. Git is required. Python and Linux script is a plus.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Experience with Google Studio, Superset, Looker, PowerBi is a plus</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Expertise in data modeling for analysis, data warehouse building</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Must be excellent&nbsp;in communicate technical ideas and results to non-technical partners in written and verbal form</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Self-motivated, detail-oriented, and responsible.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Strong project management and organizational skills.</span></li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">What’s in it for you?</span></p><ul><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Join plenty of Sharing and Learning activities as part of our initiatives to contribute to the tech community in Vietnam</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Get 15 days of annual leave and 5 days of sick leave per year</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Health insurance for employee and their family members</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Get 13th month salary and annual performance bonus</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Participate in regular team building activities and company parties</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Get opportunities to attend training courses abroad</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Most importantly, the code you write will be impacting the lives of millions!</span></li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Thank you for taking your time to read our job description and thank you in advance if you decide to apply for this position. Shortlisted candidates will be contacted within 2 weeks since application, otherwise we might meet when another chance arises.</span></p><p><br></p>','Da Nang',2000,1000,NULL,'Analytics Engineer','2022-11-05 21:46:11',37,1,2,1),(68,4,'2022-11-05 22:12:07',NULL,NULL,1,'/api/file/images/upload/27/1667661126746_1667661126746_chotot.jpg','<h2>About the job</h2><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Chotot technology foundation is growing and expanding to power our next level of growth, serving tens of millions of Vietnamese via our digital products. Our Site Reliability Engineering team work day to day with all open source CNCF projects, building robust platform, automation and data engineering pipeline that enabling continuous releases of hundred of microservices.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Join us to build systems that serve more than hundreds of millions of requests and make use of data pipes having more than billion of messages passing through daily. You will be solving big scale distributed system problem in a fast pace agile software development for internet digital product.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Responsibilities:</span></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">This is a key role that should have the engineering knowledge, production experience and hands-on implementation ability. You will work with Chotot Site Reliability Engineering as well as the bigger regional tech group that Chotot is a member of. Your responsibilities include:</span></p><ul><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Ensure the highest levels of production system performance, availability and scalability.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Automate the provisioning of infrastructure (on-premise and cloud), system and software.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Design and operate the build &amp; release, configuration management, code deployments to multiple environments.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Work closely with the development team to integrate new deployment processes and strategies.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Seek out problem or opportunity in the critical high impact area and solve them.</span></li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Minimum qualifications:</span></p><ul><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Hands-on in Python and any of Bash/Perl/Golang.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Experienced with Golang, React or NodeJS</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Hands-on experience in the Cloud (GCP or AWS) ecosystem and tooling.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Hands-on experience in Terraform or similar software like Ansible/Chef.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Have foundation and knowledge of operating systems, database and distributed systems fundamentals.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Understanding and full experience in DevOps development culture, principle and practices.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Self-motivated, detailed oriented and responsible.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Very well command of English in both reading and writing.</span></li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Preferred qualifications:</span></p><ul><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Production experience in using and operating software services that utilize: Kubernetes, Kafka, PostgreSQL, MongoDB, ElasticSearch, Prometheus.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Ability to drive sound architecture, implementation &amp; technical investigations through hands-on development plus systematically planning and execution.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Enjoy learning and ramping up on new technologies quickly.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Professional Certification preferred, ideally in Google Cloud Platform and Amazon.</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">BSc, MSc in Computer Science or Engineering or equivalent.</span></li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Benefit:</span></p><ul><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Join plenty of Sharing and Learning activities as part of our initiatives to contribute to the tech community in Vietnam</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Get 15 days of annual leave and 5 days of sick leave per year</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Health insurance for employee and their family members</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Get 13th month salary and annual performance bonus</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Participate in regular team building activities and company parties</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Get opportunities to attend training courses abroad</span></li><li><span style=\"color: rgba(0, 0, 0, 0.9);\">Most importantly, the code you write will be impacting the lives of millions!</span></li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Thank you for taking your time to read our job description and thank you in advance if you decide to apply for this position. Shortlisted candidates will be contacted within 2 weeks since application, otherwise, we might meet when another chance arises.</span></p><p><br></p>','Ho Chi Minh',700,500,NULL,'DevOps Engineer','2022-11-05 22:12:07',37,1,2,1),(69,3,'2022-11-06 06:56:29',NULL,NULL,0,'/api/file/images/upload/27/1667692588570_1667692588570_Plume.jpg','<p><span style=\"color: rgba(0, 0, 0, 0.9);\">Life at Plume</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">At Plume, we believe that technology isn\'t about moving faster, it\'s about making life\'s moments better. Which is why we\'ve built the world\'s first, and only, open and hardware-independent service delivery platform for smart homes, small businesses, enterprises, and beyond. Our SaaS platform uses WiFi, advanced AI, and machine learning to create the future of connected spaces—and human experiences—at massive scale.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">We now deliver services to over 40 million locations globally and have managed over 1.6 billion devices on our platform. We\'re expanding rapidly, pioneering a new category, and we achieved our Series F funding in just four years. Our customers include many of the world\'s largest Communications Service Providers (CSPs) who look to Plume to help them evolve their smart home offerings while gleaning insights from their own data.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">With a bias for action and a love for being trailblazers, the team at Plume embodies a combination of relentless curiosity and imaginative innovation. We challenge ourselves to think in ways that other companies don\'t, work to do what should be done (rather than what can), and if we can\'t do it exceptionally well, we don\'t do it. It\'s how we\'ve assembled a team of world-class builders, thinkers, and doers. And it\'s how we\'re reinventing what\'s possible every day.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Mobile Development QA Engineer</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Plume Design, Inc. is a Pre-IPO startup valued at $2.6B and has developed the world\'s first service delivery platform for the smart home, delivering the world\'s best performing home WiFi system. Our mobile and tablet apps are the gateway to our experiences and the critical surfaces through which users interact with our products. We are looking to add to our Mobile QA Engineer team to support our manual testing of native IOS/Android mobile applications for smart-homes and smart-business wifi.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">What You\'ll Do</span></p><ul><li>Work with the developers and product managers to create a test plan for the Mobile features.</li><li>Establish key performance metrics for the pass and the fail criteria of the test cases.</li><li>Perform manual regression, acceptance, ad hoc and exploratory testing.</li><li>Contribute towards automation of the test cases.</li><li>Establish and improve our quality processes and development processes continuously</li><li>Take ownership of our manual test suite (create and execute test scenarios)</li><li><br></li></ul><p><span style=\"color: rgba(0, 0, 0, 0.9);\">What You\'ll Bring</span></p><ul><li>3+ years experience to support our manual testing of native IOS/Android mobile applications</li><li>Experience with Xcode and Android Studio</li><li>Fluency in spoken and written English is mandatory</li><li>Familiar with QA tools and processes (i.e. Jira, Confluence or TestRail)</li><li>Knowledge of agile principles and practices</li><li>Basic knowledge of Git</li><li>Basic knowledge of programming (Kotlin or Swift is a plus)</li><li>Strong passion for iOS or Android mobile applications</li><li>Basic experience with test automation tools is a plus</li><li>Basic knowledge of python is advantage</li><li>Close attention to details</li><li>Structured and a process-driven mindset</li><li><br></li></ul><p><span style=\"color: rgba(0, 0, 0, 0.9);\">About Plume</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">As the creator of the only open, hardware-independent, cloud-controlled experience platform for CSPs and their subscribers, Plume partners with over 250 CSP customers, including some of the world\'s largest such as Comcast, Charter, Liberty Global, and J:COM.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Using OpenSync, the most widely supported open-source, silicon-to-cloud framework for smart spaces, Plume\'s software-defined network allows CSPs to decouple their service offerings from hardware and rapidly curate and deliver new services over a multi-vendor, open-platform architecture.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Backed by investors such as Insight Partners and SoftBank Vision Fund 2, Plume is now valued at $2.6B, having added over $500M in funding in 2021 alone.</span></p>','Ho Chi Minh',1500,1000,NULL,'Mobile Development QA Engineer','2022-11-06 06:56:29',38,1,1,3),(70,6,'2022-11-06 06:57:56',NULL,NULL,0,'/api/file/images/upload/27/1667692676361_1667692676361_Plume.jpg','<p><span style=\"color: rgba(0, 0, 0, 0.9);\">ife at Plume</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">At Plume, we believe that technology isn\'t about moving faster, it\'s about making life’s moments better. Which is why we’ve built the world\'s first, and only, open and hardware-independent service delivery platform for smart homes, small businesses, enterprises, and beyond. Our SaaS platform uses WiFi, advanced AI, and machine learning to create the future of connected spaces—and human experiences—at massive scale.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">We now deliver services to over 40 million locations globally and have managed over 1.6 billion devices on our platform. We’re expanding rapidly, pioneering a new category, and we achieved our Series F funding in just four years. Our customers include many of the world\'s largest Communications Service Providers (CSPs) who look to Plume to help them evolve their smart home offerings while gleaning insights from their own data.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">With a bias for action and a love for being trailblazers, the team at Plume embodies a combination of relentless curiosity and imaginative innovation. We challenge ourselves to think in ways that other companies don\'t, work to do what should be done (rather than what can), and if we can’t do it exceptionally well, we don’t do it. It’s how we\'ve assembled a team of world-class builders, thinkers, and doers. And it’s how we’re reinventing what’s possible every day.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Location: Ljubljana, Slovenia</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Summary</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Plume develops and deploys cloud based control planes with scale to manage tens of millions of customer homes through some of the world’s largest Internet Service Providers. Our cloud applications include WiFi network management and optimisation, device access control, network provisioning, IoT security, and end customer user interaction through mobile apps.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">We are growing our team and looking for a student to join as a Junior Tester on our Web QA team. This is an entry-level role with great learning and advancement possibilities. If you have passion for finding bugs, are detail oriented and have excellent English skills, join us and become a part of our growing global team of smart, pragmatic and collaborative engineers.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">The Role</span></p><ul><li>Carrying out manual tests to ensure our web-based applications are meeting system requirements and specifications</li><li>Executing well-defined test runs</li><li>Creating precise bug reports for any issues found during testing</li><li>Reproducing and verifying bugs found during testing</li><li>Communicating test efforts and status on current projects</li><li>Participating in team meetings</li></ul><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Who You Are</span></p><ul><li>Currently studying or have recently completed a BA/BS/MS in Computer Science, Computer Engineering, Information Systems or related technical field</li><li>You have exceptional attention to detail and ability to maintain focus</li><li>Excellent oral and written English language skills, additional languages will be considered a plus (German, Spanish, French, Japanese)</li><li>You are an advanced user of both Windows and Mac operating systems</li><li>Previous experience with manual testing is welcome, but not required</li><li>Knowledge of any modern agile tool, preferably JIRA and Confluence</li><li>Knowledge of any test case management software, especially TestRail, will be considered a plus</li></ul><p><span style=\"color: rgba(0, 0, 0, 0.9);\">What We Offer</span></p><ul><li>An opportunity to gain experience as a student and convert to a full-time employee</li><li>A combination of working from home and from the office</li><li>Top-notch equipment</li><li>Smart and talented team to learn from</li></ul><p><span style=\"color: rgba(0, 0, 0, 0.9);\">About Plume</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">As the creator of the only open, hardware-independent, cloud-controlled experience platform for CSPs and their subscribers, Plume partners with over 250 CSP customers, including some of the world’s largest such as Comcast, Charter, Liberty Global, and J:COM.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Using OpenSync, the most widely supported open-source, silicon-to-cloud framework for smart spaces, Plume’s software-defined network allows CSPs to decouple their service offerings from hardware and rapidly curate and deliver new services over a multi-vendor, open-platform architecture.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Backed by investors such as Insight Partners and SoftBank Vision Fund 2, Plume is now valued at $2.6B, having added over $500M in funding in 2021 alone.</span></p>','Ha Noi',700,578,NULL,'Manual WEB Tester - Student','2022-11-06 06:57:56',38,2,1,2),(71,3,'2022-11-06 07:07:03',NULL,NULL,0,'/api/file/images/upload/27/1667693222635_1667693222632_Plume.jpg','<p>Opportunity</p><p>Plume Design, Inc. is a Pre-IPO startup valued at $2.6B and has developed the world’s first service delivery platform for the smart home, delivering the world\'s best performing home WiFi system. Our mobile and tablet apps are the gateway to our experiences and the critical surfaces through which users interact with our products. We have highly visible opportunities to Senior iOS engineers to take our iOS app to the next level of functionality. In concert with Android, Cloud, Product, Design and Hardware teams, you will help drive development from toolchain selection through to implementation and reporting.</p><p><br></p><p>We’re in search of a talented developers and independent thinkers, excited to fundamentally change the way people think about their connected lives. We\'re looking for more than an order taker.</p><p><br></p><p>What You\'ll Do</p><ul><li>Design and implement new user-facing features in Plume\'s iOS app, focused on consumer electronics products and experiences.</li><li>Define and implement app coding architectures to allow for future feature growth and maintainability.</li><li>Collaborate with cross-functional teams to define, design, and ship new features.</li><li>Unit-test code for robustness, including edge cases, usability, and general reliability.</li><li>Work on bug fixing and improving application performance.</li><li>Work hand-in-hand with product designers to implement a visual and animated experience that is top in class.</li><li>Continuously discover, evaluate, and implement new technologies to maximize development efficiency.</li></ul><p><br></p><p>What You\'ll Bring</p><ul><li>BA/BS degree in Computer Science or related technical field or equivalent practical experience.</li><li>5+ years industry experience developing Swift based iOS mobile apps released to App Store.</li><li>Developed applications with a strong focus on animation, UI, design, and usability.</li><li>Experience working on consumer electronics products a plus.</li><li>Experience with Clean Architecture a plus.</li></ul><p><br></p>','Ho Chi Minh',2500,2000,NULL,'Senior IOS Developer','2022-11-06 07:07:03',38,1,2,2),(72,3,'2022-11-06 07:17:21',NULL,NULL,1,'/api/file/images/upload/28/1667693841166_1667693841166_acb.png','<h2>CÁC PHÚC LỢI DÀNH CHO BẠN</h2><p class=\"ql-align-center\"><br></p><ol><li>Hưởng mức lương cạnh tranh thị trường cùng các khoản thưởng hợp lý khác tương xứng với sự đóng góp</li><li>Đào tạo chuyên sâu, nâng cao kiến thức cho nhân viên với các chuyên gia đầu ngành</li><li>Lộ trình thăng tiến rõ ràng phù hợp cho từng vị trí hoặc từng cá nhân</li></ol><p><br></p><h2>MÔ TẢ CÔNG VIỆC</h2><p>ACB Fintech: we’re building a startup at ACB to serve our millions of customers. We’re looking for exceptional talent to drive growth. Shape the management team that will deliver world-class technology to acquire the next million customers.</p><p><br></p><p>Responsibilities:</p><p><br></p><p>+ Develop methodologies and practices for innovative, interactive technologies in collaboration with tech leads, the UX team, and designers.</p><p>+ Collaborate with back-end developers to implement front-end templates, HTML, CSS, Javascript, and ReactJS.</p><p>+ Participate in code and design reviews to maintain our high development standards</p><p>+ Design and develop highly performant user interfaces</p><p>+ Execute refactoring and optimization of existing code where necessary</p><p>+ Monitor website performance and both identify the rectify usability issues</p><p>+ Quality assurance and unit testing of deliverables developed based on technical specifications</p><p><span style=\"color: rgb(0, 90, 255); background-color: transparent;\">Xem toàn bộ Mô Tả Công Việc</span></p><h2>YÊU CẦU CÔNG VIỆC</h2><p>Requirements:</p><p>+ At least 3 years of professional experience working with Frontend (ReactJS JavaScript…)</p><p>+ Solid understanding of HTML, CSS, and JavaScript fundamentals and software design best practices.</p><p>+ Ability to think and write scalable modular code.</p><p>+ Ability to write well-documented, clean JavaScript code.</p><p>+ Solid knowledge of working with third-party dependencies and debugging dependencies.</p><p>+ Experience working with AWS Services is a plus but not required.</p><p>+ Familiarity with mocha and cypress testing frameworks.</p><p>+ Experience in design and experience with the collaborative interface design tool.</p><p>+ Experience with CI/CD pipeline.</p><p>+ UI/UX skills.</p><p><br></p><p>Company Benefits:</p><p>+ Best place to work in Asia for 4 consecutive years from 2018 to 2022.</p><p>+ Competitive salary based on each individual\'s knowledge and experience</p><p>+ Fixed 13th month salary</p><p>+ Bonus based on productivity and work efficiency at the end of the year: 1-4 months\' salary (depending on performance ranking)</p><p>+ Bonus on holidays and bank birthdays, mid-autumn gifts, etc.</p><p>+ Dynamic and creative environment, maximize personal capacity, good working conditions, full facilities, and equipment.</p><p>+ Participating in extracurricular activities (Team building, sports festivals, art...).</p><p>+ Participating in many kinds of training courses for improving skills and professional competence.</p>','Can Tho',2000,1000,NULL,' IT - Frontend Developer (React JS)','2022-11-06 07:17:21',39,1,2,3),(73,1,'2022-11-06 07:21:21',NULL,NULL,0.5,'/api/file/images/upload/28/1667694080795_1667694080795_acb.png','<h2>JOB DESCRIPTION</h2><p>- Phát triển khách hàng</p><p>- Tiếp nhận nhu cầu, tư vấn và hướng dẫn khách hàng sử dụng sản phẩm dịch vụ ACB.</p><p>- Đầu mối hướng dẫn khách hàng thực hiện các giao dịch hoặc hướng dẫn khách hàng tiếp xúc các chức danh khác để thực hiện các giao dịch tại kênh phân phối theo qui định.</p><p>- Chăm sóc khách hàng</p><p>- Chăm sóc khách hàng,nhắc nợ / thúc nợ không để bị trễ hạn.</p><p>- Tiếp nhận và giải quyết nhanh chóng những khó khăn vướng mắc khách hàng gặp phải.</p><p>- Thẩm định và đề xuất cấp tín dụng trong phạm vi được phân công.</p><h2>JOB REQUIREMENTS</h2><p>- Tốt nghiệp ĐH hệ tập trung dài hạn, chính quy các trường ĐH trong nước hoặc ĐH nước ngoài (được quốc tế công nhận), tốt nghiệp loại TB Khá trở lên, chuyên ngành: Kinh tế, Tài chính, Ngân hàng, Quản trị kinh doanh.</p><p>- Tiếng Anh trình độ B trở lên, thành thạo tin học văn phòng.</p><p>- Sức khoẻ tốt, ngoại hình dễ nhìn. Nam cao từ 1.65m, Nữ cao từ 1.55m trở lên, độ tuổi không quá 32.</p><p>- Ưu tiên ứng viên có kinh nghiệm ở vị trí tương đương</p>','Ha Noi',1200,700,NULL,'NHN - Chuyên Viên Quan Hệ Khách Hàng Cá Nhân','2022-11-06 07:21:21',39,1,1,1),(74,1,'2022-11-06 07:38:43',NULL,NULL,1,'/api/file/images/upload/28/1667695123021_1667695123021_language_link.png','<h2>CÁC PHÚC LỢI DÀNH CHO BẠN</h2><p class=\"ql-align-center\"><br></p><p>A dynamic, professional environment with development opportunities for career path</p><p class=\"ql-align-center\"><br></p><p>Premium Health care package</p><p class=\"ql-align-center\"><br></p><p>16 annual leave and 3 paid sick leave days per year</p><h2>MÔ TẢ CÔNG VIỆC</h2><p>1. Mục tiêu công việc của Regional Head Teaching Assistant (RHTA - Quản lý Trợ giảng)</p><p>- Quản lý các trợ giảng trong khu vực được phân công để đảm bảo chất lượng giờ dạy, hỗ trợ tốt giáo viên nước ngoài và ngày càng nâng cao chất lượng chương trình giảng dạy</p><p><br></p><p>2. Nhiệm vụ</p><p>- Cập nhật tình hình hàng tuần với các trợ giảng, dự giờ và đánh giá ít nhất 2 lần/học kì với số lượng trợ giảng từ 35 - 40 bạn</p><p>- Tham gia vào quá trình tuyển chọn, đào tạo trợ giảng mới, có kế hoạch bồi dưỡng trợ giảng định kì trong suốt năm học</p><p>- Đánh giá năng lực chuyên môn của trợ giảng vào cuối mỗi năm học</p><p>- Hỗ trợ trợ giảng giải quyết các vấn đề phát sinh bao gồm những bất cập về học sinh, giáo viên nước ngoài, mối quan hệ giữa trợ giảng và nhà trường, cơ sở vật chất…</p><p>- Kiểm tra và chấm bài tập về nhà cho học sinh thuộc các nhóm lớp được phân công</p><p>- Dạy các nhóm lớp được phân công (8 - 10 tiết mỗi tuần) và tạo điều kiện cho các trợ giảng khác được dự giờ</p><p>- Tham gia các khóa bồi dưỡng năng lực cho nhân viên</p><p><br></p><p>3. Thời gian &amp; Địa điểm làm việc:</p><p>- Thời gian: 8h30 - 17h30 từ Thứ Hai đến Thứ Sáu</p><p>- Địa điểm: 1 trong 3 văn phòng tại Hoàng Đạo Thúy, Long Biên hoặc Đại Cồ Việt</p><p><br></p><p>***QUYỀN LỢI***</p><p>- Thu nhập thỏa thuận</p><p>- Chế độ nghỉ phép lên đến 19 ngày/năm</p><p>- Tham gia BHXH đầy đủ, chế độ chăm sóc sức khỏe theo PTI Care</p><p>- Nhiều học bổng học Tiếng Anh miễn phí cho nhân viên và con cái của nhân viên</p><p>- Môi trường làm việc bài bản, có hệ thống và đa văn hóa</p><p>- Nhiều cơ hội học tập, đào tạo bài bản về Teaching Methodology từ các chuyên gia cấp cao</p><p>- Nhiều cơ hội thăng tiến lên các vị trí Senior hoặc Manager nếu đạt kết quả công việc tốt</p><h2>YÊU CẦU CÔNG VIỆC</h2><p>- Độ tuổi từ 28 trở lên, tốt nghiệp Đại học chính quy chuyên ngành Sư phạm/ Ngôn ngữ Anh</p><p>- Ngoại hình sáng, giao tiếp tốt cả tiếng Anh lẫn tiếng Việt</p><p>- Kinh nghiệm dạy học/ trợ giảng từ 3 năm trở lên</p><p>- Đã có kinh nghiệm quản lý và điều phối trợ giảng ít nhất 1 năm trở lên, ưu tiên các bạn có kinh nghiệm trong công tác tuyển dụng và đào tạo trợ giảng</p><p>- Các kỹ năng cần thiết: Giao tiếp, thuyết phục, phân tích, giải quyết vấn đề, lên kế hoạch và quản lí</p><p>- Có tinh thần học hỏi và thái độ tích cực khi giải quyết các vấn đề</p><p>- Có kĩ năng máy tính tốt về MS Office, Excel và Power Point</p><p>- Không ngại di chuyển liên tục</p><h2>ĐỊA ĐIỂM LÀM VIỆC</h2><p class=\"ql-align-center\"><br></p><p>34T Hoàng Đạo Thúy - Thanh Xuân - Hà Nội</p><p class=\"ql-align-center\"><br></p><p>Nguyễn Sơn, Long Biên</p><p class=\"ql-align-center\"><br></p><p>24 Đại Cồ Việt, Le Dai Hanh, Hai Bà Trưng District, Hanoi, Vietnam</p>','Ho Chi Minh',500,300,NULL,'Quản Lý Trợ Giảng Tiếng Anh (Rhta)','2022-11-06 07:38:43',40,1,3,1),(75,1,'2022-11-06 07:40:47',NULL,NULL,0,'/api/file/images/upload/28/1667695247252_1667695247252_language_link.png','<h2>CÁC PHÚC LỢI DÀNH CHO BẠN</h2><p class=\"ql-align-center\"><br></p><ul><li>Thu nhập 15 - 20 triệu/tháng + Phụ cấp điện thoại, xăng xe</li><li>Bảo hiểm xã hội đầy đủ, tặng thẻ chăm sóc sức khỏe PTI</li><li>Học bổng học Tiếng Anh miễn phí cho người lao động và con cái</li></ul><h2>MÔ TẢ CÔNG VIỆC</h2><p>Chương trình Tiếng Anh liên kết trường học Schools Link cần tìm 1 bạn Phát triển chương trình Tiếng Anh cho khối cấp 2 với công việc như sau:</p><p><br></p><p>- Phối hợp với Academic Team và các bộ phận liên quan đế phát triển và cải thiện chất lượng giảng dạy tại các trường cấp 2 được phân công</p><p>- Quản lý và làm đề thi cho khối cấp 2: Thi giữa kì, cuối kì, Olympic Tiếng Anh, thi chứng chỉ CEFR (A1, A2, B1, B2) và thi thử (Mock test)</p><p>- Nhận hoặc cùng phát triển đề thi với AC, soát chính tả, sửa lỗi, căn chỉnh đề thi rồi chuyển cho team Học liệu</p><p>- Quản lý việc chấm và chữa bài tập về nhà cũng như lên nội dung cho bài tập về nhà các cấp học</p><p>- Cập nhật feedback về chương trình học và điều chỉnh cho phù hợp</p><p>- Có ý tưởng cải tiến, phát triển chương trình học mới theo yêu cầu của cấp trên</p><h2>YÊU CẦU CÔNG VIỆC</h2><p>- Tốt nghiệp ĐH chuyên ngành giảng dạy Tiếng Anh, độ tuổi từ 23 trở lên</p><p>- Có kinh nghiệm chuyên sâu về mảng phát triển học liệu, đề thi cho học sinh lứa tuổi cấp 2</p><p>- Cẩn thận, tỉ mỉ, kĩ tính để kiểm tra chính xác học liệu, đề thi trước khi đưa đi in ấn, chuyển sang trường</p><p>- Tiếng Anh tốt ở cả 4 kỹ năng (IELTS 7.0 trở lên)</p><p>- Kỹ năng tin học văn phòng tốt</p><p><br></p><p>***CHẾ ĐỘ ĐÃI NGỘ***</p><p>- Thu nhập 13 - 18 triệu/tháng + Phụ cấp</p><p>- Bảo hiểm xã hội đầy đủ, tặng thẻ chăm sóc sức khỏe PTI</p><p>- Nghỉ phép 19 ngày/năm có trả lương</p><p>- Học bổng học Tiếng Anh miễn phí cho người lao động và con cái</p><p>- Lộ trình thăng tiến rõ ràng, review lương hàng năm</p><h2>ĐỊA ĐIỂM LÀM VIỆC</h2><p class=\"ql-align-center\"><br></p><p>34T Hoàng Đạo Thúy - Thanh Xuân - Hà Nội</p>','Ha Noi',750,550,NULL,' Academic Officer - Nhân Viên Phát Triển Chương Trình, Đề Thi','2022-11-06 07:40:47',40,1,1,1),(76,1,'2022-11-06 08:23:08',NULL,NULL,1.5,'/api/file/images/upload/29/1667697788385_1667697788385_s.png','<h2>WHAT WE CAN OFFER</h2><p class=\"ql-align-center\"><br></p><ul><li>Premium Healthcare Program</li><li>Annual leave: 15 days/year and Other leaves/public holidays</li><li>Providing customized training courses according to business needs and upon your request</li></ul><h2>JOB DESCRIPTION</h2><p>We are looking for experienced Senior Frontend Developer (Reactjs)&nbsp;to join our high-powered experienced product team who follow agile development principles, and who value well-designed software, creative thinking and thrive on solving the un-solvable.</p><p><br></p><p>You will be working with lasted update technology and most trending domain fintech/payments, all underpinned by strong security and privacy principles.</p><p><br></p><p>This is a fantastic opportunity to work at a well-established and leading start-up in Vietnam and you will be part of&nbsp;VinID&nbsp;- A digitalized ecosystem via a super App with diverse utilities from Retails, E-commerce to Financial services serving people’s end-to-end needs in their daily activities - designed &amp; built by talented Vietnamese.</p><p><br></p><p>Responsibilities</p><p>- You will be responsible for designing, developing, testing, and debugging responsive web and mobile applications for the company.&nbsp;</p><p>- Designing, developing, and testing UI for mobile and web applications</p><p>- Build reusable code and libraries for future use</p><p>- Accurately translate user and business needs into functional Front-end code</p><h2>JOB REQUIREMENTS</h2><p>- Strong knowledge in OOP and Front-end patterns.</p><p>- Experience with ReactJS,&nbsp;React-Redux, Observable&nbsp;or other Javascript frameworks.</p><p>- Familiar with Angular&nbsp;is a big plus</p><p>- Expertise in SCSS and HTML</p><p>- Experience with Agile development methods, especially Scrum.</p><p>- Experience delivering and maintaining applications.</p><p>- Bachelor’s degree in Computer Science or related field</p><h2>JOB LOCATIONS</h2><p class=\"ql-align-center\"><br></p><p>9th Floor, Five Star Tower, 28bis Mạc Đĩnh Chi, Đa Kao, Quận 1, Thành phố Hồ Chí Minh</p>','Ho Chi Minh',2000,1000,NULL,'Senior Frontend Developer','2022-11-06 08:23:08',41,1,2,2),(77,2,'2022-11-06 08:33:41',NULL,NULL,1,'/api/file/images/upload/29/1667698420560_1667698420558_s.png','<h2>WHAT WE CAN OFFER</h2><p class=\"ql-align-center\"><br></p><ol><li><strong>Premium Healthcare Program</strong></li><li><strong>Annual leave: 15 days/year and Other leaves/public holidays</strong></li><li><strong>Providing customized training courses according to business needs and upon your request</strong></li></ol><h2>JOB DESCRIPTION</h2><p>Responsibilities</p><p>- Writing clean &amp; high-quality code</p><p>- Maintain &amp; improve running- functionality as well as design and develop new system, new feature if needed</p><p>- Deliver end-to-end, including unit test, integration test and deployment to PROD</p><p>- Participate in code reviews</p><h2>JOB REQUIREMENTS</h2><p>- 3+ years of experience in Java, Spring, Oracle, MySQL</p><p>- Experience with RESTful APIs, Microservices</p><p>- Expertise in Object Oriented Design, Database Design.</p><p>- Experience with Docker/Kubernetes and Cloud Infrastructure is a plus</p><p>- Experience with Agile or Scrum software development methodologies</p><p>- Ability to multi-task, organize, and prioritize work</p><p>- Proactive attitude and good communication skills</p><h2>JOB LOCATIONS</h2><p class=\"ql-align-center\"><br></p><p>Tòa văn phòng T26, khu đô thị Times City, 458 Minh Khai, Phường Vĩnh Tuy, Quận Hai Bà Trưng, Hà Nội</p><p class=\"ql-align-center\"><br></p><p>28bis Đường Mạc Đĩnh Chi, Đa Kao, Quận 1, Thành phố Hồ Chí Minh, Việt Nam</p><h5>Tags:</h5><p><br></p>','Ho Chi Minh',3000,1500,NULL,'Senior Backend Engineer (Java)','2022-11-06 08:33:41',41,1,3,1),(78,5,'2022-11-06 08:43:50',NULL,NULL,0.5,'/api/file/images/upload/29/1667699029767_1667699029767_10668657.png','<h2>CÁC PHÚC LỢI DÀNH CHO BẠN</h2><p class=\"ql-align-center\"><br></p><p>Competitive salary and bonus up to 300%</p><p class=\"ql-align-center\"><br></p><p>Overseas Training</p><p class=\"ql-align-center\"><br></p><p>Dynamic &amp; Friendly working environment</p><h2>MÔ TẢ CÔNG VIỆC</h2><p>Shinhan DS Vietnam is established to be in charge of the ICT synergy of Shinhan Financial Group in the Southeast Asia.</p><p><br></p><p>SDSer\' top priority is the clients\' business growth acceleration by strengthening their ICT systems.</p><p><br></p><p>One of our big clients is Shinhan Securities.</p><p><br></p><p>As a Developer of Securities team, you will:</p><p>- Collaborate closely with clients and IT professionals in analysis, development, and testing trading system on mobile &amp; web platforms.</p><p>- Write efficient source code to program complete applications.</p><p>- Maintain, modify or create new applications based on requirements.</p><p>- Identify errors, bugs, and suggest solutions to these problems.</p><p>- Attend business and technical training from clients and partners.</p><h2>YÊU CẦU CÔNG VIỆC</h2><p>- From 1+ years of experience.</p><p>- Back-end developer: Experience with C, C#, Pro*C, Python and PLSQL.</p><p>- Web developer: NodeJS, ReactJS, ElectronJS.</p><p>- Mobile developer: React native, Flutter.</p><p>- Experience with payment gateway, data processing, batch processing, real-time processing</p><p>- Preferable: Finance, Banking, Securities field.</p><p>- Graduate college or university with major Information Technology, Computer Science, Software</p><p>Engineering or related fields.</p><p>- Good problem solving &amp; communication skills.</p><p>- Detail-oriented, proactive, fast learner.</p><p>- Languages: Vietnamese &amp; English</p><p>- Ready to work in November, December 2022</p><p><br></p><p>Let\'s Excite you more with our Brilliant perks:</p><p><br></p><p>- Salary: you will be happy + Pass-Probation Bonus</p><p>- Performance Bonus: twice a year.</p><p>- Friend Referral Program Bonus and many other incentives.</p><p>- 15 days of annual leaves</p><p>- Personal Allowances for birthday, marriage, new baby, etc.</p><p>- Team monthly allowance.</p><p>- Special loan offers and fee waiver from Shinhan Bank.</p><p>- Company Trip, annual/monthly/weekly activities and events.</p><p>- Health check once a year and premium healthcare program for family.</p><p>- Education Programs and oversea training opportunities.</p><p>- Your solutions and opinions are welcomed.</p><h2>ĐỊA ĐIỂM LÀM VIỆC</h2><p class=\"ql-align-center\"><br></p><p>CENTEC Tower, 72-74 Nguyen Thi Minh Khai, Ward 6, District 3, HCM city</p>','Ho Chi Minh',2500,800,NULL,'05 Software Developer (C) (Stock/ Securities)','2022-11-06 08:43:50',42,1,1,1),(79,1,'2022-11-06 08:51:40',NULL,NULL,0.5,'/api/file/images/upload/29/1667699499949_1667699499947_10668657.png','<h2>MÔ TẢ CÔNG VIỆC</h2><p>Shinhan DS Vietnam is established to be in charge of the ICT synergy of Shinhan Financial Group in the Southeast Asia.</p><p>SDSer\' top priority is the clients\' business growth acceleration by strengthening their ICT systems.</p><p>- Collaborate closely with clients and IT professionals in analysis, development, and testing banking features &amp; functions (web)</p><p>- Write efficient source code to program complete applications.</p><p>- Maintain, modify or create new applications based on requirements.</p><p>- Identify errors, bugs, and devise solutions to these problems.</p><p>- Attend business (banking, stock/ securities &amp; finance), technical training from Korea\'s top experts.</p><h2>YÊU CẦU CÔNG VIỆC</h2><p>- 2-6 years of experience.</p><p>- Back-end Developer: Proficiency in C/C++, Java base on Unix, Linux.</p><p>- Web Developer: Experienced in</p><p>+ Java frameworks (J2EE, Spring, etc.)</p><p>+ Web services (RESTful, SOAP, etc.)</p><p>+ XML, JSON, HTML, CSS, Bootstrap, JavaScript, jQuery, Ajax</p><p>+ SQL and RDBMS (Oracle or MySQL)</p><p>- Knowledge about WebLogic, Http Apache is a plus.</p><p>- Good understanding software principles and design patterns.</p><p>- Good understanding of OOP programming, Data Structures &amp; Algorithm</p><p>- Familiar with Oracle, Spring boot</p><p>- Good to have: knowledge in Banking, Stock/ Securities, Finance field.</p><p>- Good problem solving &amp; communication skills.</p><p>- Detail-oriented, proactive, fast learner.</p><p>- Communicate in Vietnamese &amp; English</p><p>- Ready to work in November, December 2022</p><p><br></p><p>Let\'s Excite you more with our Brilliant perks:</p><p><br></p><p>- Salary: you will be happy + Pass-Probation Bonus</p><p>- Performance Bonus: twice a year.</p><p>- Friend Referral Program Bonus and many other incentives.</p><p>- 15 days of annual leaves</p><p>- Personal Allowances for birthday, marriage, new baby, etc.</p><p>- Team monthly allowance.</p><p>- Special loan offers and fee waiver from Shinhan Bank.</p><p>- Company Trip, annual/monthly/weekly activities and events.</p><p>- Health check once a year and premium healthcare program for family.</p><p>- Education Programs and oversea training opportunities.</p><p>- Your solutions and opinions are welcomed.</p><h2>ĐỊA ĐIỂM LÀM VIỆC</h2><p class=\"ql-align-center\"><br></p><p>CENTEC Tower, 72-74 Nguyen Thi Minh Khai, Ward 6, District 3, HCM city</p>','Ho Chi Minh',2500,800,NULL,' 20 Software Developer (C/C++, Java) (Pass Probation Bonus)','2022-11-06 08:51:40',42,1,1,1),(80,1,'2022-11-07 08:06:32',NULL,NULL,5,'/api/file/images/upload/26/1667783191967_1667783191964_RBVH-Logo.png','<h2>CÁC PHÚC LỢI DÀNH CHO BẠN</h2><p class=\"ql-align-center\"><br></p><p>13th-month bonus + yearly performance bonus + annual salary appraisal</p><p class=\"ql-align-center\"><br></p><p>Premium health insurance for employee + 2 family members</p><p class=\"ql-align-center\"><br></p><p>16++ days of paid leave per year</p><h2>MÔ TẢ CÔNG VIỆC</h2><p>VISION</p><p>Our vision is to be THE software engineering partner for brake system in ASEAN. We deliver complete software projects (CSPs) to our Bosch counterparts of CC, BEG and 2WP divisions for the OEMs in nearshore regions Japan, China, ASAEAN. We perform the end-to-end software development activities including all the roles like developers, testers, integrators, project managers and other special functions like functional safety and cyber security for our projects. We also work on the advanced engineering topics like software engineering for E&amp;E architecture.</p><p>“Join us in this noble cause of saving lives and develop your career towards these futuristic technologies”.</p><p><br></p><p>JOB DESCRIPTION</p><p>We\'re looking for talented Project Manager to join Brake System team in Ho Chi Minh and Hanoi. General responsibilities include:</p><p><br></p><p>- Analyze customer requirements, clarify and document</p><p>- Issue development request to developers and track the progress</p><p>- Plan, Monitor and Control project schedule</p><p>- Interface with customers, manage OPLs and stakeholders</p><p>- Develop team and give feedback to associates as per need</p><p><br></p><p>** As a Project Manager, you will be responsible for analyzing requirements from customer and manage development of same with support from development team. You will be the interface to customers and responsible for managing the project schedule and deliverables within defined QCD. Your main focus include:</p><p>- Engineering services for embedded software projects (C, Automotive)</p><p>- Working with engineering team to make overall project proposal (work packages, time schedule...)</p><p>- Supporting sales with quotation, pricing and contract with customer\'s supplier</p><p>- Leading project team, execute project till final delivery to customer</p><p>- Use PM tools for project management</p><p>- Close cooperate with Bosch BUs, BEG-CN (engineering team)</p><p><br></p><p>APPLY NOW TO SEIZE THE OPPORTUNITY TO RECEIVE JOINING BONUS - 1 MONTH OF GROSS SALARY</p><p><span style=\"background-color: transparent; color: rgb(0, 90, 255);\">Xem toàn bộ Mô Tả Công Việc</span></p><h2>YÊU CẦU CÔNG VIỆC</h2><p>QUALIFICATION</p><p>- B.S or equivalent degree in Mechatronic Engineering, Automotive Engineering, Electronics, Computing Engineering, Information Technology or related major</p><p>- Good at stakeholder management skills</p><p>- Good English communication skills</p><p>- Have strong experience in Embedded software development</p><p>- Have hands-on experience in Automotive Diagnostics and Communication protocols is big advantage</p><p>- To apply for Project Manager role, you should have strong knowledge and experience in Project Management processes, Risk Management [Risk identification, mitigation and contingency plan]</p><p><br></p><p>WHY BOSCH?</p><p>Because we don\'t just follow trends, we create them.</p><p>Because together we turn ideas into reality, working every day to make the world of tomorrow a better place. Do you have high standards when it comes to your job? So do we. At Bosch, you will discover more than just work.</p><p>- Working in one of the Best Places to Work in Vietnam and Top 30 of the Most Innovative Companies all over the world</p><p>- Join a dynamic and fast growing global company (English-speaking environment)</p><p>- 13th-month salary bonus + attractive performance bonus (you\'ll love it!) + annual performance appraisal</p><p>- 100% monthly salary and mandatory social insurances in 2-month probation</p><p>- Onsite opportunities: short-term and long-term assignments</p><p>- 15++ days of annual leave + 1 day of birthday leave</p><p>- Premium health insurance for employee and 02 family members</p><p>- Flexible working time</p><p>- Lunch and parking allowance</p><p>- Various training on hot-trend technologies/ foreign language (English/Chinese/Japanese) and soft-skills</p><p>- Fitness &amp; sport activities: football, badminton, yoga, Aerobic</p><p>- Free in-house entertainment facilities and snack</p><p>- Join in various team building, company trip, year-end party, tech talks and a lot of charity events</p><h2>ĐỊA ĐIỂM LÀM VIỆC</h2><p class=\"ql-align-center\"><br></p><p>Etown building, 364 Cong Hoa street, ward 13, Tan Binh district, Ho Chi Minh, Vietnam</p><p class=\"ql-align-center\"><br></p><p>Capital Place Building, 29 Lieu Giai Street, Ba Dinh District, Hanoi, Vietnam</p><p class=\"ql-align-center\"><br></p><p>Remote Work</p>','Binh Duong',5000,4000,NULL,'Embedded Software Project Manager','2022-11-12 18:40:10',31,1,4,1),(85,1,'2022-11-13 19:02:43',NULL,NULL,0,'/api/file/images/upload/51/1668340962825_1668340962825_daikin.png','<h2>CÁC PHÚC LỢI DÀNH CHO BẠN</h2><p class=\"ql-align-center\"><br></p><p>Du Lịch, Phụ cấp, hưởng, Tăng lương</p><p class=\"ql-align-center\"><br></p><p>Chăm sóc sức khỏe, Đào tạo, Công tác phí, Phụ cấp thâm niên, Chế độ nghỉ phép</p><h2>MÔ TẢ CÔNG VIỆC</h2><p>- Supporting End-Users to solve all issue of IT(email, application, network, hardware issues...)</p><p>- Supporting for admin to troubleshoot network and system problems</p><p>- Configuring and monitoring follow assignment of network and system administrators in Data Center</p><p>- Monitoring and diagnostic all issues of End-users and systems in branches</p><p>- Producing IT support document, user guide and maintain IT support knowledge base</p><p>- Supporting for IT asset management</p><p>- Other reports upon requests of direct manager</p><h2>YÊU CẦU CÔNG VIỆC</h2><p>- Bachelor of Information Technology, major in network administrator</p><p>- Certificate of CCNA, MCSA or concerning IT network is an advantage</p><p>- No experience required or experience 1-2 years in IT helpdesk, troubleshooting network problems</p><p>- Communicate well in English and Vietnamese</p><p>- Self-motivated, energetic, adaptive to changes and willing to accept challenges</p><p>- Ability to work under pressure, over time and business trip when required</p>','Ho Chi Minh',1000,800,NULL,' IT Network & Security Officer','2022-11-13 19:02:43',50,1,1,1),(86,2,'2022-11-13 19:25:33',NULL,NULL,1,'/api/file/images/upload/51/1668342332714_1668342332714_11127170.png','<h2>CÁC PHÚC LỢI DÀNH CHO BẠN</h2><p class=\"ql-align-center\"><br></p><p>Được thưởng theo hiệu quả kinh doanh của công ty, thưởng trong các dịp lễTết</p><p class=\"ql-align-center\"><br></p><p>Được hưởng chế độ BHXH, BHYT, BHTN, Bảo hiểm sức khỏe theo quy định của Công ty</p><p class=\"ql-align-center\"><br></p><p>Được hưởng các khoản phụ cấp như phụ cấp ăn trưa, độc hại, phụ cấp kiêm nhiệm trách nhiệm công việc</p><h2>MÔ TẢ CÔNG VIỆC</h2><p>- Phân tích, nghiên cứu, đánh giá, thiết kế, tư vấn và chi tiết hóa giải pháp công nghệ với các khối nghiệp vụ, kinh doanh về dịch vụ Tài chính và Chứng khoán.</p><p>- Tham gia nghiên cứu, đánh giá các giải pháp công nghệ, sản phẩm, đặc biệt các giải pháp xây dựng trên nền tảng ngôn ngữ SQL</p><h2>YÊU CẦU CÔNG VIỆC</h2><p>* YÊU CẦU TRÌNH ĐỘ</p><p>- Tốt nghiệp đại học chuyên ngành Công nghệ thông tin, toán tin</p><p>-Sử dụng thành thạo ngôn ngữ lập trình Java/.Net/NodeJS</p><p>-Có kinh nghiệm lập trình socket, websocket, socket.io</p><p>-Lập trình thành thạo với hệ CSDL: MS SQL, MySQL, Oracle (Oracle là lợi thế)</p><p>- Sử dụng thành thao các công cụ xây dựng mô hình như Visio, UML, ORM …</p><p><br></p><p>* YÊU CẦU KHÁC</p><p>- Trung thực, cẩn thận, làm việc theo quy trình</p><p>- Có khả năng làm việc độc lập và làm việc nhóm trong môi trường áp lực cao</p><p>- Có tư duy logic tốt, khả năng trình bày diễn giải phân tích vấn đề, rõ ràng và chi tiết</p><p>- Ham học hỏi và tìm hiểu các công nghệ mới</p><p>- Có mong muốn tìm hiểu về lĩnh vực tài chính, chứng khoán</p><p>- Có khả năng đọc hiểu tài liệu Tiếng Anh chuyên ngành</p><p><br></p><p>* YÊU CẦU KINH NGHIỆM</p><p>- Có kinh nghiệm làm việc từ 2 năm trở lên</p><p><br></p><p>* Ưu tiên</p><p>- Có hiểu biết, kiến thức về tài chính, chứng khoán</p><p>- Đã từng tham gia phát triển các hệ thống tài chính, chứng khoán</p><p><br></p><p>*** Quyền lợi:</p><p><br></p><p>• Thời gian làm việc 5 ngày/tuần (từ thứ Hai đến thứ Sáu).</p><p>• Cơ hội thăng tiến, phát triển nghề nghiệp công bằng.</p><p>• Thu nhập hấp dẫn, cạnh tranh.</p><p>• Được hưởng chế độ BHXH, BHYT, BHTN, Bảo hiểm sức khỏe theo quy định của Công ty.</p><p>• Được tham gia các chương trình đào tạo, huấn luyện của Công ty.</p><p>• Môi trường làm việc chuyên nghiệp, thân thiện, năng động.</p><p>• Mức lương: theo thỏa thuận* Thời hạn nhận hồ sơ:</p><p>• (Phỏng vấn cuốn chiếu ngay khi nhận được hồ sơ đến khi tuyển được ứng viên phù hợp)</p><p><br></p><p>* Hồ sơ yêu cầu:</p><p>• Bản Thông tin ứng viên theo mẫu của MBS.</p><p>• Các mẫu thông tin ứng viên/CV khác không theo mẫu MBS là hồ sơ không hợp lệ.</p><p><br></p><p>* Nơi nhận hồ sơ:</p><p><br></p><p>Nộp Bản Thông tin ứng viên theo mẫu của MBS theo hình thức sau:</p><p>• Nộp hồ sơ Online trên website tuyển dụng</p><p>• Nộp hồ sơ trực tiếp tại Công ty theo địa chỉ :</p><p>o Phòng Nhân sự &amp; Phát triển Nguồn lực</p><p>o Công Ty Cổ Phần Chứng Khoán MB</p><p>o Địa chỉ: Tầng 7, số 21 Cát Linh, Hà Nội</p><h2>ĐỊA ĐIỂM LÀM VIỆC</h2><p class=\"ql-align-center\"><br></p><p>98A Ngụy Như Kon Tum - Q.Thanh Xuân - Hà Nội</p>','Ho Chi Minh',2000,1000,NULL,'Chuyên Viên Phát Triển Phần Mềm Nền Tảng Database/ Web','2022-11-13 19:25:33',51,1,2,1);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_comments`
--

DROP TABLE IF EXISTS `jobs_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jobs_comments` (
  `job_job_id` bigint(20) NOT NULL,
  `comments_comment_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_o3sucntut2yhx14r9l434g4mc` (`comments_comment_id`),
  KEY `FKhkq1jg6k78nokt056xivy9sqh` (`job_job_id`),
  CONSTRAINT `FKhkq1jg6k78nokt056xivy9sqh` FOREIGN KEY (`job_job_id`) REFERENCES `jobs` (`job_id`),
  CONSTRAINT `FKpm1g9pvwqsmqxo9pgjysu22fj` FOREIGN KEY (`comments_comment_id`) REFERENCES `comments` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_comments`
--

LOCK TABLES `jobs_comments` WRITE;
/*!40000 ALTER TABLE `jobs_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `likes` (
  `job_id` bigint(20) NOT NULL,
  `type_like` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`job_id`,`type_like`,`user_id`),
  KEY `FKnvx9seeqqyy71bij291pwiwrg` (`user_id`),
  CONSTRAINT `FK8rx8tdimnwga5cx5r6a8wjtuv` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  CONSTRAINT `FKnvx9seeqqyy71bij291pwiwrg` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (56,'LIKE',1),(80,'LIKE',1),(85,'LIKE',1),(86,'LIKE',1),(52,'LIKE',26),(54,'LIKE',29);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `organization_sizes`
--

DROP TABLE IF EXISTS `organization_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `organization_sizes` (
  `organization_size_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`organization_size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_sizes`
--

LOCK TABLES `organization_sizes` WRITE;
/*!40000 ALTER TABLE `organization_sizes` DISABLE KEYS */;
INSERT INTO `organization_sizes` VALUES (1,'0-1 employees'),(2,'2-10 employees'),(3,'11-20 employees'),(4,'11-50 employees'),(5,'51-200 employees'),(6,'501-1000 employees'),(7,'1000+ employees');
/*!40000 ALTER TABLE `organization_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `participants` (
  `user_id` bigint(20) NOT NULL,
  `conversation_id` bigint(20) NOT NULL,
  KEY `FK2o70jsad53f112ojer15xcqx2` (`conversation_id`),
  KEY `FKghixrahoj1s8cloinfx8lyeqa` (`user_id`),
  CONSTRAINT `FK2o70jsad53f112ojer15xcqx2` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`),
  CONSTRAINT `FKghixrahoj1s8cloinfx8lyeqa` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (1,26),(29,26),(1,27),(26,27),(29,28),(26,28),(27,29),(26,29),(27,30),(1,30);
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `percent_jobs_of_companies_of_total`
--

DROP TABLE IF EXISTS `percent_jobs_of_companies_of_total`;
/*!50001 DROP VIEW IF EXISTS `percent_jobs_of_companies_of_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `percent_jobs_of_companies_of_total` AS SELECT 
 1 AS `company_id`,
 1 AS `name`,
 1 AS `percent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `popular_companies`
--

DROP TABLE IF EXISTS `popular_companies`;
/*!50001 DROP VIEW IF EXISTS `popular_companies`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `popular_companies` AS SELECT 
 1 AS `company_id`,
 1 AS `number_of_follows`,
 1 AS `number_of_applications`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `popular_jobs`
--

DROP TABLE IF EXISTS `popular_jobs`;
/*!50001 DROP VIEW IF EXISTS `popular_jobs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `popular_jobs` AS SELECT 
 1 AS `job_id`,
 1 AS `number_of_like`,
 1 AS `number_of_applications`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `popular_posts`
--

DROP TABLE IF EXISTS `popular_posts`;
/*!50001 DROP VIEW IF EXISTS `popular_posts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `popular_posts` AS SELECT 
 1 AS `post_id`,
 1 AS `number_of_like`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `positions` (
  `position_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Engineer'),(2,'Senior Engineer'),(3,'Team Leader'),(4,'Project Manager');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post_likes` (
  `post_id` bigint(20) NOT NULL,
  `type_like` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`post_id`,`type_like`,`user_id`),
  KEY `FKkgau5n0nlewg6o9lr4yibqgxj` (`user_id`),
  CONSTRAINT `FKa5wxsgl4doibhbed9gm7ikie2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  CONSTRAINT `FKkgau5n0nlewg6o9lr4yibqgxj` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_likes`
--

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
INSERT INTO `post_likes` VALUES (28,'LIKE',1),(28,'LIKE',26),(32,'LIKE',26),(28,'LIKE',29),(30,'LIKE',29),(28,'LIKE',51),(30,'LIKE',51);
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post_tags` (
  `tag_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  KEY `FKkifam22p4s1nm3bkmp1igcn5w` (`post_id`),
  KEY `FKm6cfovkyqvu5rlm6ahdx3eavj` (`tag_id`),
  CONSTRAINT `FKkifam22p4s1nm3bkmp1igcn5w` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  CONSTRAINT `FKm6cfovkyqvu5rlm6ahdx3eavj` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (70,28),(71,28),(72,29),(73,29),(68,30),(74,30),(75,30),(68,31),(76,31),(77,31),(70,32),(77,32),(67,27),(68,27),(69,27);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `posts` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `post_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `FK5lidm6cqbc7u4xhqpxm898qme` (`user_id`),
  CONSTRAINT `FK5lidm6cqbc7u4xhqpxm898qme` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (27,'<p>Những câu hỏi phỏng vấn việc làm thường gặp &amp; cách trả lời hay nhất bằng tiếng Anh và tiếng Việt</p><p>1. Giới thiệu sơ lược về bản thân bạn? (Could you briefly Introduce yourself?)</p><p>Hầu hết nhà tuyển dụng đều dùng câu hỏi này để bắt đầu câu chuyện với ứng viên. Mục đích câu hỏi này là để đánh giá phong thái và cách trình bày của ứng viên. Lúc này, tùy thuộc vào câu trả lời của ứng viên mà nhà tuyển dụng sẽ đánh giá đây có phải là một ứng viên phù hợp hay không và đưa ra các câu hỏi tiếp theo để đánh giá kỹ năng, tính cách và kinh nghiệm làm việc.</p><p><br></p><p>Tip: Để trả lời tốt câu hỏi này, bạn cần đưa ra khái quát những thông tin về cá nhân có liên quan, hữu ích cho vị trí mà mình ứng tuyển như: công việc hiện tại, trình độ học vấn, mục tiêu sự nghiệp,… Bạn nên cân nhắc giới thiệu bản thân theo trình tự thời gian quá khứ, hiện tại và tương lai cũng như gói gọn trong tối đa 2 phút. Chia sẻ ngắn về sở thích, tính cách cũng là một cách thu hút nhà tuyển dụng, tuy nhiên cũng không nên nói quá nhiều về những vấn đề này với nhà tuyển dụng.</p><p><br></p><p>Tham khảo câu trả lời phỏng vấn mẫu bằng Tiếng Việt:</p><p>\"Trước khi giới thiệu về bản thân mình, em/tôi xin gửi lời cảm ơn chân thành tới anh/chị khi đã tạo cơ hội cho em/tôi để được trao đổi về vị trí ứng tuyển của quý công ty. Em chào anh/ chị, tên em là Mai, họ tên đầy đủ của em là Trịnh Thị Tuyết Mai. Em là sinh viên mới ra trường của Trường đại học X, trong thời gian làm sinh viên em đã từng tham gia một số công việc bán thời gian nhưng không thật sự ấn tượng, vì các công việc em làm khá đơn giản, tuy vậy thông qua chúng em học được tính kiên nhẫn và tỉ mỉ. Thông qua các hoạt động này, em có kinh nghiệm hơn trong việc nắm bắt tâm lý người khác, có thêm những kỹ năng như quan sát, có khả năng chịu áp lực cao. Và em tin những điều này sẽ có ích đối với vị trí này. Qua tìm hiểu kỹ về vị trí công việc và môi trường làm việc bên mình cũng như những kinh nghiệm và sở trường em đang có, em thực sự mong muốn được có cơ hội được làm việc cùng anh chị tại công ty Y với vị trí nhân viên tư vấn khách hàng.\"</p><p><br></p><p>Tham khảo câu trả lời phỏng vấn mẫu bằng Tiếng Anh:</p><p>\"Before I introduce myself, I would like to thank you very much for giving me / me the opportunity to talk about the position of your company. / sister, my name is Mai, my full name is Trinh Thi Tuyet Mai. I am a fresh graduate of University X, when I was a student, I used to have some part-time jobs but none is not really significant, because the work I did was quite simple. Nonetheless I learned to be patient and meticulous. Through these jobs, I have more experience in interpersonal skills, observation, and high pressure tolerance. I believe these will be useful for this position through understanding carefully about the job position and working environment For me, I really want to have the opportunity to work with you at company Y as a client consultant. \"</p><p>2. Bạn có thể mô tả sơ lược về những công việc bạn đã làm? Nhiệm vụ chính ở công việc gần đây nhất của bạn là gì? (Can you briefly describe the work you have done? What was the main tasks at your most recent job?)</p><p>Mục đích của câu hỏi này để đánh giá về năng lực và những kinh nghiệm làm việc của bạn có phù hợp với vị trí đang ứng tuyển hay không.</p><p><br></p><p>Tip: Được đánh giá là một trong các câu hỏi phỏng vấn thường gặp và quan trọng, cách trả lời phỏng vấn câu hỏi này là nên chân thật, nó giống như bạn đang chia sẻ những kinh nghiệm của bản thân, đừng cố nói những gì mình không biết, bạn sẽ không trả lời được nếu nhà tuyển dụng hỏi sâu hơn về chuyên môn.</p><p>Hãy nói những gì bạn được học hay những gì biết về công việc một cách ngắn gọn và đủ, cũng không nên kể chi tiết các công việc, quá dài dòng</p><p>Trong trường hợp bạn chưa có nhiểu kinh nghiệm, hãy nói bạn đang muốn theo đuổi công việc này và dành nhiều thời gian học hỏi, phát triển kỹ năng, bạn đang mong muốn tìm được một công ty tốt để gắn bó và cống hiến lâu dài.</p><p><br></p><p>Tham khảo câu trả lời phỏng vấn mẫu bằng Tiếng Việt:</p><p>\"Trước kia, tôi đã làm trợ lý hành chính cho một giám đốc tại Nhà xuất bản Sách và tôi đã hỗ trợ sắp xếp lịch trình cho cho ông ấy cũng như cho toàn văn phòng. Công việc của tôi là chăm sóc tất cả các chi tiết hành chính để ông ấy có thể tập trung vào các dự án của mình. Tôi đã làm tất cả mọi thứ từ việc đặt vé chuyến bay để chuẩn bị và in ấn các bản tường trình để nộp làm báo cáo chi phí.”</p><p><br></p><p>Tham khảo câu trả lời phỏng vấn mẫu bằng Tiếng Anh:</p><p>\"In the past, I worked as an administrative assistant for a director at the Book Publishing House. I assisted with scheduling for him as well as for the entire office. My job was to take care of all administrative details so that he could focus on his projects. I did everything from booking a flight, preparing and printing reports and submitting an expense report. \"</p><p>3. Những thành tựu nào đã đạt được trong công việc khiến bạn tự hào nhất? (What achievements in your job are you most proud of?)</p><p>Mục đích câu hỏi này là để nhà tuyển dụng biết được mức độ thành thạo trong công việc của ứng viên và năng suất làm việc của họ như thế nào.</p><p><br></p><p>Tip: Bạn cần liệt kê những thành tựu trong cả quãng thời gian đi học: bạn đạt được những giải thưởng gì, bạn tham gia cuộc thi gì,... lý do là để bạn dẫn dắt nhà tuyển dụng vào những thành tích của mình theo một chuỗi những hoạt động từ ngày bạn đi học, thể hiện bạn là một ứng viên xuất sắc, tham gia hoạt động nhiệt tình, kỹ năng mềm rất tốt. Khi nói về các thành tích trong công việc, hãy kể về các thành tích bạn đã đạt được trong các dự án trước đây, những giá trị mang lại cho công ty, kể về vai trò của bạn trong dự án, những công việc đã thực hiện hay cả những khó khăn đã gặp phải trong quá trình thực hiện. Hãy thể hiện sự tâm huyết với công việc, kể cả với công việc ở công ty cũ, bạn nên nêu cảm xúc khi bạn đạt được những thành tựu và những bài học tích cực bạn rút ra được từ những lần đó.</p><p><br></p><p>Tham khảo câu trả lời phỏng vấn mẫu bằng Tiếng Việt:</p><p>\"Tôi từng được bầu chọn làm nhân viên của tháng chỉ trong vòng hai tháng đầu làm việc – điều rất ít người đạt được tại công ty X. Thành tựu này đến từ việc áp dụng chuẩn service trong chương trình học vào một nơi có hoạt động chuyên nghiệp như công ty X. Điều này tuy không đem lại lợi thế tài chính nhưng có giá trị tinh thần rất lớn với tôi\"</p><p><br></p><p>Tham khảo câu trả lời phỏng vấn mẫu bằng Tiếng Anh:</p><p>\"I was nominated as the employee of the month in just the first two months of my job - something very few people achieve at company X. This achievement comes from applying service standards in the curriculum to a place where there are professional activities like Company X. This does not bring financial advantages, but it is of great spiritual value to me \"</p><p>4. Tình huống khó khăn nhất trong công việc bạn từng gặp là gì? Cách bạn giải quyết vấn đề khó khăn đó như thế nào? (What was the toughest job situation you\'ve ever encountered? How do you solve that difficult problem?)</p><p>Khi hỏi câu này, NTD muốn biết bạn có khả năng tư duy để tìm ra giải pháp cho tất cả vấn đề bạn gặp phải hay không.</p><p><br></p><p>Tip: Ngay cả khi vấn đề của bạn là không có đủ thời gian để học tập, nghiên cứu, bạn cũng cần cho NTD thấy cách bạn đã điều chỉnh thứ tự ưu tiên trong lịch làm việc của mình để giải quyết nó. Việc này chứng tỏ bạn là người có tinh thần trách nhiệm và có thể tự mình tìm ra giải pháp cho vấn đề gặp phải.</p><p>Bạn có thể trả lời bằng cách nêu lên các khó khăn gặp phải khi thực hiện công việc, đảm bảo tuân thủ các kế hoạch, hoàn thành đúng thời hạn và quản lý nguồn ngân sách. Hãy sử dụng đại từ “tôi” và nhấn mạnh các yếu tố quan trọng (dựa trên nhu cầu và văn hoá của công ty).</p><p><br></p><p>Tham khảo câu trả lời phỏng vấn mẫu bằng Tiếng Việt:</p><p>\"Trong quá trình làm công việc chăm sóc khách hàng, tôi từng gặp trường hợp khách hàng phàn nàn về sản phẩm của công ty một cách rất khó chịu và thậm chí họ lớn tiếng với tôi. Điều đầu tiên tôi làm chính là xin lỗi khách hàng vì đã có những điều chưa hài lòng khi sử dụng sản phẩm của công ty. Sau đó tôi đã cố gắng tìm hiểu nguyên do vì khách hàng khó chịu đồng thời hỏi ý kiến của cấp trên về những chính sách ưu đãi cho khách hàng này\"</p><p><br></p><p>Tham khảo câu trả lời phỏng vấn mẫu bằng Tiếng Anh:</p><p>\"In the process of customer care, I have encountered a customer who complained about the company\'s products in a very annoying way and they even raised their voice at me. The first thing I did was apologize for their dissatisfaction when using the company\'s products. After that, I tried to find out the reason why the customers were upset and consulted with superiors about preferential policies for customers.\"</p><p><br></p><p>\"I would describe myself as a hardworking and optimistic person who knows how to control my emotions and stay calm in situations where others cannot. I want to bring out the best in value for customers, imparting passion and trust in the product to make sure that the customer feels they are making the best choice \"</p><p><br></p><p><br></p><p>Tham khảo câu trả lời phỏng vấn mẫu bằng Tiếng Anh:</p><p>\"I think both ways of doing things work for me when completing a given task. When I work independently, I focus better and during teamwork, I work together and achieve successful quickly. \"</p><p>12. Thời gian rảnh bạn thường làm gì? (What do you usually do in your free time?)</p><p>Qua câu hỏi này, nhà tuyển dụng muốn biết xem sở thích, thói quen của bạn có phần nào đó gắn liền với công việc mà bạn đang ứng tuyển hay không, bạn có thực sự đam mê với công việc này không, câu trả lời phỏng vấn của bạn sẽ thể hiện một phần nào đó.</p><p><br></p><p>Tip: Bạn nên liệt kê những sở thích hoặc thói quen thường ngày liên quan đến kỹ năng cần thiết cho công việc hiện tại. Liên kết câu trả lời của bạn với các năng lực được vạch ra trong mô tả công việc. Chỉ ra cách mà các kỹ năng và năng lực phù hợp được phản ánh trong các hoạt động bạn thích.</p><p><br></p><p>Tham khảo câu trả lời phỏng vấn mẫu bằng Tiếng Việt:</p><p>\"Tôi rất thích tìm hiểu về tâm lý học nên thời gian rảnh tôi thường tìm thêm những tài liệu phân tích về tâm lý hoặc đăng kí những khóa học tìm hiểu về bản thân và cách phán đoán hành vi xác định tính cách như DISC\"</p><p><br></p><p>Tham khảo câu trả lời phỏng vấn mẫu bằng Tiếng Anh:</p><p>\"I love to learn about psychology so in my free time I often look for more psychological analysis materials or take courses on self-understanding and behavioral judgment like DISC\"</p><p><br></p>','2022-03-06 07:53:11',NULL,'','/api/file/images/upload/1/1667695990996_1667695990996_most-common-interview-questions.webp','nhung-cau-hoi-phong-van-viec-lam-thuong-gap--cach-tra-loi-hay-nhat-bang-tieng-anh-va-tieng-viet','Những câu hỏi phỏng vấn việc làm thường gặp & cách trả lời hay nhất bằng tiếng Anh và tiếng Việt','2022-11-08 20:27:05',1,'PRIVATE'),(28,'<p>Sau khi trải qua những ngày tháng cống hiến hết mình cho sự nghiệp, bạn cũng đã quyết định rời khỏi nơi mà bạn đã làm việc suốt bao năm qua. Bạn đã làm việc với một người trong một thời gian dài và bạn nghĩ khó có thể tìm thấy được một ai khác giống như họ ở nơi làm việc mới,... Bạn lo lắng rằng sẽ đánh mất tình bạn này dù đã trải qua những khoảng thời gian làm việc và đồng hành với nhau.</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Có nhiều người cho rằng khi nghỉ việc ở công ty cũ thì đồng nghĩa với việc cắt đứt những mối quan hệ với đồng nghiệp cũ vì họ cho rằng những mối quan hệ này không có tác dụng trong công việc. Vậy, lợi ích của việc giữ mối quan hệ với đồng nghiệp cũ sau khi nghỉ việc? và cách cách giúp bạn giữ vững mối quan hệ với đồng nghiệp cũ.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Lợi ích của việc giữ mối quan hệ với đồng nghiệp ngay cả khi nghỉ việc</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Một quan hệ tốt với đồng nghiệp không chỉ mang tới cho bạn nhiều lợi ích trong quá trình làm việc hay khi bạn đã nghỉ việc. Trong quá trình còn làm việc, mối quan hệ tốt với đồng nghiệp giúp bạn giải quyết, chia sẻ những công việc quá tải, giúp đỡ bạn hoàn thành các nhiệm vụ khó khăn hay có thể cùng tán gẫu trong giờ nghỉ giải lao. Đồng thời, mối quan hệ tốt với đồng nghiệp còn giúp bạn tập trung vào các cơ hội để phát triển sự nghiệp thay vì tiêu tốn thời gian và năng lượng cho những vấn đề mà mối quan hệ tiêu cực mang lại.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Không chỉ thế, việc giữ liên lạc không chỉ về tình bạn nơi công sở, mà vấn đề này cũng rất quan trọng để giữ mối quan hệ tốt với đồng nghiệp vì lý do nghề nghiệp. Họ có thể là người giới thiệu cho bạn một việc làm mới thú vị hơn, nhiều chế độ tốt. Hay họ có thể giúp bạn giải quyết những vấn đề ở chỗ làm mới. Thậm chí, khi bạn đi xin việc, nhà tuyển dụng có thể sử dụng mục tham khảo trong hồ sơ cá nhân của bạn để kiểm tra về thái độ làm việc hay những kinh nghiệm đã có, vậy nên, bạn cũng cần hòa đồng với mọi người, chăm chỉ làm việc để khi nhà tuyển dụng kiểm tra, thì những đồng nghiệp sẽ là người nói tốt cho bạn.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Các cách giúp bạn giữ vững mối quan hệ với đồng nghiệp cũ ngay cả khi nghỉ việc</strong></h2><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Gặp gỡ ngoài giờ làm việc</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Việc bạn rời đi, bạn bắt đầu có một cuộc sống mới và kế hoạch của bạn cũng bị thay đổi dần nhưng kế hoạch và thời gian của đồng nghiệp của bạn vẫn vậy. Và, nếu bạn ngượng ngùng không liên lạc với đồng nghiệp vì lo làm phiền họ thì mối quan hệ của các bạn sẽ không còn khăng khít như xưa. Vậy nên, đừng ngần ngại mà giữ liên lạc với họ bằng cách gặp gỡ nhau trước và sau khi làm việc. Bạn và đồng nghiệp cũ có chung sở thích đi bộ hay tập gym vào buổi sáng, việc đi tập thể dục một mình sẽ rất chán, bạn có thể liên hệ với đồng nghiệp cũ và hẹn họ cùng đi tập thể dục với nhau.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Hãy cố tận dụng những buổi sáng sớm để giữ mối quan hệ bạn bè trong công việc. Bắt chuyện với đồng nghiệp cũ, rủ họ cùng nhau đi làm hay đi uống cà phê vào cuối tuần. Nếu như văn phòng làm việc của bạn gần với công ty cũ, bạn có thể yên tâm gặp gỡ bạn cũ ở đó, hoặc trong giờ nghỉ trưa và bạn có thể cùng đi ăn trưa với họ, hay thậm chí, bạn có thể giới thiệu bạn bè mới ở chỗ làm mới với đồng nghiệp cũ. Nếu như bạn là dân cú đêm, bạn có thể tận dụng tối đa sau giờ làm việc, rủ họ đi uống ở quán bar quen thuộc. Sẽ không thiếu cách giúp bạn tận dụng tối đa thời gian để gặp gỡ họ, chỉ cần sắp xếp lịch nghỉ ngơi hợp lý để bạn có thể lên kế hoạch với đồng nghiệp cũ của bạn.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Tìm điểm chung mới</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Mỗi người đều thay đổi theo thời gian, bạn không thể duy trì mãi một tình bạn dựa trên những điểm chung mà bạn đã từng có. Nếu như lúc trước, bạn với đồng nghiệp kết nối với nhau bằng công việc, thì hiện tại bạn có thể tìm cách kết nối với đồng nghiệp cũ bằng những điều mà cả hai cùng quan tâm, như: thể loại phim, cuốn sách, game,…&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Tìm bất cứ điều gì đó và tập trung vào chúng thay vì chỉ nói chuyện với nhau về công việc dù các bạn đã từng làm việc với nhau. Hãy hạn chế nói về công việc của cả hai vì họ không muốn nghe bạn đã thuyết trình như thế nào và buổi họp của sếp bạn đưa ra những ý tưởng gì,..</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Không nên thể hiện sự tiêu cực của bạn về công ty cũ</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Nếu bạn rời công việc bởi những điều bất mãn với công việc hay sếp của bạn thì khi nghỉ việc, bạn vẫn còn một số cảm xúc tiêu cực với nơi làm việc cũ. Khi bạn còn làm ở công ty cũ, bạn với đồng nghiệp làm việc cùng nhau và cả hai đều có những cảm xúc bất mãn với công việc. Vậy nên, khi bạn vẫn còn chơi với đồng nghiệp cũ, hãy cố gắng không thể hiện những cảm xúc bất mãn về công ty mà họ vẫn đang làm việc. Bạn có thể lắng nghe họ than thở về công ty, về công việc nhàm chán mà họ đang làm. Nhưng, bạn cần lưu ý không nên nói về môi trường công việc mới của bạn tuyệt vời ra sao hay nhắc về những sai lầm của đồng nghiệp trong công việc hiện tại. Dù bạn chỉ muốn xoa dịu họ nhưng đó là cách không nên cân nhắc và khó để phát triển bền vững một mối quan hệ</span></p><p><br></p>','2022-05-06 07:54:45',NULL,'','/api/file/images/upload/1/1667696085022_1667696085022_6-1200x900-1.jpg','giu-moi-quan-he-voi-ong-nghiep-ngay-ca-khi-nghi-viec--toi-a-hoc-uoc-gi','Giữ mối quan hệ với đồng nghiệp ngay cả khi nghỉ việc – tôi đã học được gì?','2022-11-06 07:54:45',1,'PUBLIC'),(29,'<h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Định nghĩa CV là gì?</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">CV là viết tắt của cụm từ Tiếng anh “Curriculum Vitae”, có nghĩa là bản tóm tắt về thông tin cá nhân, mục tiêu nghề nghiệp ngắn hạn và dài hạn, quá trình học tập cũng như các kỹ năng của bản thân để gây ấn tượng với nhà tuyển dụng.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Thông qua CV xin việc, nhà tuyển dụng sẽ biết ứng viên là ai, đến từ đâu có thành tích, chuyên môn, sở trường gì,… để cân nhắc xem ứng viên có phù hợp với tiêu chí tuyển dụng hay không. Vì thế, chuẩn bị một bản CV xin việc thật chỉn chu là yếu tố cần được ưu tiên hàng đầu trên hành trình tìm kiếm một công việc như ý.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Kỹ năng viết CV ấn tượng với nhà tuyển dụng</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Kỹ năng viết CV tiếng Anh&nbsp;hay tiếng Việt cũng đều cần chỉn chu. Điều này có nghĩa là trong bản CV gửi đến nhà tuyển dụng sẽ cần đầy đủ các mục sau: thông tin cá nhân, mục tiêu nghề nghiệp ngắn hạn và dài hạn, học vấn, kỹ năng, chứng chỉ, kinh nghiêm việc làm.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Với từng đối tượng,&nbsp;kỹ năng viết CV xin việc&nbsp;nhấn mạnh ở mỗi mục là khác nhau. Nếu người đã đi làm thường nhấn mạnh đến mục tiêu ngắn hạn, dài hạn, kinh nghiệm làm việc thì với các bạn sinh viên mới ra trường, CV cần nhấn mạnh đến kỹ năng và học vấn mà các bạn có được. Nhưng nhìn chung, cách viết CV chuẩn sẽ như sau:</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Thông tin cá nhân</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Sẽ bao gồm mục: họ tên, ngày tháng năm sinh, số điện thoại, email, địa chỉ liên hệ. Nhà tuyển dụng sẽ dựa vào những thông tin này để liên hệ với bạn nếu như CV đạt yêu cầu. Vì thế, bạn cần viết đầy đủ và chính xác các thông tin này. Một lưu ý nhỏ dành cho bạn là hãy để ảnh chụp rõ nét và dùng email có tên nghiêm túc.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Mục tiêu nghề nghiệp</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Các nhà tuyển dụng nói rằng, họ chú ý nhiều đến phần mục tiêu nghề nghiệp trong CV mà ứng viên gửi về. Vì thế, không nói quá khi&nbsp;kỹ năng viết CV xin việc&nbsp;là yếu tố quan trọng trong phần này.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Mục tiêu nghề nghiệp chính là định hướng việc làm hiện tại và tương lai của ứng viên. Mục này sẽ giúp nhà tuyển dụng đánh giá được tính cách của ứng viên, cũng như biết được ứng viên có tinh thần cầu tiến và muốn gắn bó lâu dài với doanh nghiệp hay không.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Ở phần này bạn có thể chia ra 2 mục tiêu ngắn hạn và dài hạn. Với mục tiêu ngắn hạn, bạn hãy nêu những gì muốn học, muốn trau dồi trong quá trình làm việc. Đối với mục tiêu dài hạn, bạn hãy nêu những giá trị bạn tạo được cho công ty, muốn thăng tiến công việc trong tương lai cũng như sự nghiệp và có cơ hội phát triển bản thân mình qua từng ngày.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Kinh nghiệm làm việc</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Kinh nghiệm làm việc được xem là phần quan trọng nhất trong một CV xin việc. Ở phần này, bạn hãy trình bày về quá trình làm việc (nếu có) của bạn đã trải qua như thế nào. Bạn đã từng làm ở công ty nào? Đã đảm nhận những vị trí nào? Bạn đã có những kinh nghiệm, thành tựu hay kỹ năng nào trong quá trình làm việc.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Kỹ năng viết CV ấn tượng&nbsp;được thể hiện qua cách trình bày chuẩn chỉnh, liệt kê công việc theo thứ tự thời gian, đưa các con số vào để dẫn chứng. Đồng thời mô tả ngắn gọn, súc tích nhưng đầy đủ về những công việc mà bạn đã làm có liên quan đến vị trí đang ứng tuyển.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Học vấn</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Hãy viết thật ngắn gọn, rõ ràng về tên trường đại học, chuyên ngành, loại bằng và chứng chỉ bạn đã học thêm (nếu có). Nên ghi thêm giải thưởng, dự án đã tham gia và đạt thành tựu gì. Đới với những bạn sinh viên mới ra trường, bạn hãy ghi thêm học bổng đã đạt được (nếu có) trong quá trình học. Điều này sẽ là điểm cộng trong mắt nhà tuyển dụng nếu như thành tích bạn xuất sắc.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Kỹ năng và chứng chỉ</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Đây là mục khá quan trọng và không được phép bỏ qua khi bạn viết CV. Bạn hãy nêu những kỹ năng và chứng chỉ mà trong quá trình ngồi ở giảng đường hay đi làm bạn đã học được: giao tiếp tốt, lập kế hoạch tốt, chứng chỉ ngoại ngữ, tin học văn phòng, và các chứng chỉ khác liên quan đến vị trí bạn đang ứng tuyển…</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Một số chú ý khi viết CV cho sinh viên mới ra trường</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Ngoài&nbsp;các kỹ năng viết CV xin việc, để hồ sơ xin việc của bạn gây ấn tượng và lọt vào mắt xanh của nhà tuyển dụng, bạn cần lưu ý một số điểm sau:&nbsp;</span></p><ul><li class=\"ql-align-justify\"><span style=\"background-color: initial;\">Trong một bản CV sử dụng tối đa 2 kiểu chữ, những kiểu chữ chuyên nghiệp, dễ nhìn và hay được sử dụng là: Times New Roman, Arial, Tahoma, Serif. Nếu trong một bản CV có quá nhiều kiểu chữ và màu sắc lộn xộn sẽ làm nhà tuyển dụng rối mắt và rất dễ bỏ qua CV của bạn.</span></li><li class=\"ql-align-justify\"><span style=\"background-color: initial;\">Độ dài phù hợp của một bản CV xin việc cho sinh viên mới ra trường thường là 1 trang A4. Nhà tuyển dụng chỉ mất 15 – 20 giây để đọc CV của bạn. Vì vậy, CV của bạn rất dễ bị bỏ qua nếu viết quá dài, lan man và không đúng trọng tâm.</span></li><li class=\"ql-align-justify\"><span style=\"background-color: initial;\">Chắc chắn rằng mỗi vị trí tuyển dụng sẽ có những yêu cầu công việc khác nhau. Vì thế, bạn không thể dùng cùng một bản CV để nộp vào hai vị trí khác nhau được. Bạn nên nêu rõ điểm mạnh của bản thân cho phù hợp từng vị trí mà mình ứng tuyển.</span></li></ul><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Hiện nay, CV xin việc là phần không thể thiếu trong quá trình ứng tuyển tìm việc làm. Đây được coi là cánh cửa đầu tiên mà bạn phải vượt qua để chạm tay tới công việc mơ ước. Dựa vào những&nbsp;kỹ năng viết CV và phỏng vấn xin việc&nbsp;trên đây, bạn hãy đầu tư thời gian và công sức để tạo nên một bản CV thật sự ấn tượng và thuyết phục được các nhà tuyển dụng nhé!</span></p><p><br></p>','2022-07-06 07:56:55',NULL,'CV xin việc luôn là một tài liệu quan trọng mà bạn phải gửi đến nhà tuyển dụng khi đi xin việc. Dù đã biết đến tầm quan trọng của CV, nhưng nhiều người vẫn chưa biết làm cách nào để viết CV sao cho chuẩn, gây ấn tượng với nhà tuyển dụng. Theo các chuyên gia tuyển dụng, nhấn mạnh vào những gì là lợi thế của mình là kỹ năng viết CV và phỏng vấn xin việc thông minh. Vậy kỹ năng viết CV ấn tượng gồm những gì? Khám phá ngay nhé!','/api/file/images/upload/1/1667696215036_1667696215036_shutterstock_2125009718.jpg','viet-cv-sao-cho-chuan-nhung-ky-nang-viet-cv-ma-ban-can-biet','Viết CV sao cho chuẩn? Những kỹ năng viết CV mà bạn cần biết','2022-11-06 07:56:55',1,'PUBLIC'),(30,'<h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Kỹ năng thuyết trình là gì?</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Kỹ năng thuyết trình là khả năng truyền đạt thông điệp, vấn đề một cách đơn giản, hiệu quả và hấp dẫn đến một nhóm người nghe.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Trong buổi thuyết trình, người nói cần hướng tới mục tiêu giúp người nghe hiểu được những gì bản thân đang nói, giải quyết một vấn đề của họ, hay chỉ đơn giản là tiếp nhận một thông tin mới mẻ nào đó.&nbsp;</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Lợi ích của kỹ năng thuyết trình</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Kỹ năng thuyết trình là kỹ năng mềm quan trọng giúp người nói truyền đạt được các thông tin phức tạp đến người nghe theo một cách đơn giản và thú vị nhất.&nbsp;Tầm quan trọng của kỹ năng thuyết trình&nbsp;được thể hiện nhiều trong công việc và cuộc sống.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Đầu tiên, có kỹ năng thuyết trình tốt quá trình phỏng vấn xin việc của bạn sẽ trở nên thuận lợi hơn. Nhiều người đi làm đồng ý rằng kỹ năng thuyết trình rất quan trọng đối với thành công của họ trong công việc. Có&nbsp;kỹ năng thuyết trình và đàm phán&nbsp;tốt không chỉ tăng cơ hội thành công của người lao động mà còn cho phép họ đóng góp nhiều hơn cho doanh nghiệp.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Vai trò của kỹ năng thuyết trình&nbsp;còn thể hiện ở vị trí quản lý. Nếu kỹ năng thuyết trình kém, các nhà quản lý sẽ không thể truyền đạt được cảm hứng cho các thành viên trong đội nhóm. Thậm chí là sản phẩm sẽ không bán được, doanh nghiệp cũng sẽ không thu hút được nguồn đầu tư và không thể phát triển được.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Mặc dù&nbsp;vai trò của kỹ năng thuyết trình&nbsp;là rất lớn nhưng nhiều người vẫn mang trong mình nỗi sợ này với một số biểu hiện như: Cảm giác hồi hộp và sợ hãi khi phải thuyết trình trước đám đông, có những suy nghĩ tiêu cực về các tình huống xấu có thể xảy ra với bản thân trong khi đang thuyết trình, căng cơ ở vùng cổ và lưng, nói lí nhí hoặc yếu ớt, thở hổn hển hoặc nói không ra hơi. Những người mang nỗi sợ “nặng hơn” còn có biểu hiện hoảng hốt tột độ khi đang nói hoặc rơi vào tình trạng “tim đập chân run”, mồ hôi nhễ nhại, mặt đỏ bừng,…</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Vậy làm thế nào để&nbsp;nâng cao kỹ năng thuyết trình trước đám đông?</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Cách rèn luyện kỹ năng thuyết trình trước đám đông</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Để vượt qua nỗi sợ mang tên “thuyết trình trước đám đông” là điều không hề dễ dàng. Tuy nhiên, nếu kiên trì thực hiện các&nbsp;giải pháp nâng cao kỹ năng thuyết trình&nbsp;dưới đây, kỹ năng của bạn sẽ trở nên nhuần nhuyễn hơn. Qua đó, công việc sẽ trở nên thuận lợi hơn</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Tạo các slide trình bày đơn giản</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Trên thực tế, nếu slide trình bày nội dung càng khó hiểu, bạn sẽ càng gặp khó khăn trong việc truyền tải các thông điệp, vấn đề đến khán giả. Để&nbsp;nâng cao kỹ năng thuyết trình hiệu quả, bạn nên tạo các slide đơn giản.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Các chuyên gia nói rằng, hãy làm cho kích thước phông chữ của bài thuyết trình gấp đôi độ tuổi trung bình của đối tượng khán giả đang nghe. Có nghĩa là phông chữ trong slide chỉ nằm trong khoảng từ 60 đến 80 pt.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Bên cạnh đó, nội dung các slide nên làm nổi bật các điểm trọng tâm, không bao giờ nên là toàn bộ các điểm chính. Bởi khán giả sẽ chú ý đến slide, lúc này bạn sẽ chẳng còn gì để nói với người nghe khi họ đã tìm thấy các thông tin cần thiết ngay trên slide.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Kiểm tra trước khi trình bày</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Khi đã sợ thuyết trình trước đám đông, bất cứ một sự cố nào xảy ra cũng làm cho buổi thuyết trình trở nên tồi tệ hơn. Vì thế, bạn hãy tạo một thói quen đi xung quanh phòng để kiểm tra tầm nhìn, kiểm tra micro và chạy thử bài thuyết trình để đảm bảo nó sẵn sàng hoạt động… Sau khi làm những điều này, chắc hẳn bạn sẽ cảm thấy thoải mái hơn trong sự quen thuộc và tăng thêm sự tự tin.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Mở đầu bằng một điều mới mẻ mà khán giả không biết</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Khi ngại nói trước đám đông, nếu người nghe không hứng thú, nỗi sợ này lại càng lớn thêm. Khi đó, bạn sẽ khó khăn trong việc thuyết trình của mình. Vì thế, khơi gợi hứng thú, chú ý của người nghe là&nbsp;cách rèn luyện kỹ năng thuyết trình trước đám đông&nbsp;bạn cần chú ý.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Hãy bắt đầu buổi thuyết trình bằng một thông tin thực sự mới mẻ liên quan đến chủ đề của bạn. Ví dụ như: “Bạn có biết khi bạn đỏ mặt, dạ dày của bạn cũng sẽ chuyển sang màu đỏ không?”. Lúc này, nhiều khả năng người nghe sẽ ngẩng cao đầu và nghĩ “Thật sao? Wow ….”, và sẽ chú ý hơn vào bài thuyết trình của bạn.&nbsp;</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Cung cấp các thông tin giá trị&nbsp;</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Để nâng cao kỹ năng thuyết trình trước đám đông, bạn cần đảm bảo luôn cung cấp cho người nghe các thông tin có giá trị. Cho dù thông điệp hay đến đâu mà người nghe không thể áp dụng vào công việc, cuộc sống thì buổi thuyết trình của bạn cũng không thể thành công được.&nbsp;&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Theo Diễn giả Quách Tuấn Khanh – một trong những diễn giả hàng đầu Việt Nam: “thuyết trình cũng là một phương tiện truyền thông, và nhiệm vụ của người thuyết trình là hướng đến lợi ích chung của đám đông, chứ không phải để thể hiện thương hiệu cá nhân. Vì thế, mục tiêu của một bài thuyết trình luôn là để khiến cho người khác thay đổi tốt hơn, hoặc để giải quyết vấn đề đó theo hướng tích cực”.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Vì thế, để đánh tan nỗi sợ thuyết trình trước đám đông bạn cần tìm hiểu đầy đủ các thông tin trước khi diễn thuyết. Bạn cần biết người nghe của bạn là ai, họ cần gì và điều gì sẽ tác động làm cho họ thay đổi. Bên cạnh đó, trước khi thuyết trình bạn cũng nên “xốc dậy” được sự chú ý của người nghe bằng cách giới thiệu về bản thân, thẩm quyền, và chuyên môn đối với vấn đề sắp trình bày. Khi đó, khán giả sẽ xác định được là họ có nên tin hoặc nên có thái độ như thế nào đối với những thông tin mà bạn sắp nói.&nbsp;</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Tạo cảm xúc – cách rèn luyện kỹ năng thuyết trình hiệu quả&nbsp;</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Một sai lầm mà nhiều người thuyết trình kém đang mắc phải là chỉ tập trung vào nội dung cần trình bày mà quên mất điều quan trọng là nói như thế nào. Có những nội dung thể chuyển tải hết được qua khối lượng câu chữ ngắn ngủi của bài thuyết trình trong thời lượng khoảng 30 đến 45 phút. Tuy nhiên, nếu kết hợp với cảm xúc được thể hiện trong giọng nói và ngôn ngữ cơ thể khi trình bày, người nghe có thể hiểu được trọn vẹn nội dung mà bạn đang trình bày.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Để&nbsp;rèn luyện kỹ năng thuyết trình trước đám đông, bạn có thể sử dụng bản đồ tư duy, áp dụng các công cụ giọng nói và ngôn ngữ cơ thể để nâng cao khả năng trình bày tốt và truyền đạt được cảm xúc một cách tự nhiên nhất.&nbsp;</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Không nên kéo quá dài thời gian thuyết trình</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Nếu có 30 phút để trình bày bạn chỉ nên sử dụng 25 phút. Nếu có một giờ, bạn hãy sử dụng 50 phút. Hãy luôn tôn trọng thời gian của khán giả và kết thúc sớm buổi thuyết trình. Để làm được điều này, bạn cần rèn luyện kỹ năng nói trong điểm và nhấn mạnh vào các ý chính cần trình bày. Trên thực tế, người nghe chỉ nghe được khoảng hơn một nửa lượng thông tin bạn cung cấp. Vì thế vào cuối giờ, bạn hãy củng cố và tóm lại các điểm chính để người nghe có thể nắm được các ý mà bạn đang muốn truyền tải.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Tham khảo những người thuyết trình khác&nbsp;</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Cách rèn luyện kỹ năng thuyết trình trước đám đông&nbsp;tốt nhất là tham dự càng nhiều buổi thuyết trình trực tiếp càng tốt. Qua đó, bạn có thể học được các kỹ năng nói cũng như phản ứng của cơ thể từ những họ. Bạn có thể tham gia các khóa học kỹ năng thuyết trình, tham khảo các bài giảng kỹ năng thuyết trình được phát trên Youtube.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Việc&nbsp;cải thiện kỹ năng thuyết trình trước đám đông&nbsp;sẽ không thể thực hiện được trong một ngày một đêm, mà sẽ mất rất nhiều công sức và sự nỗ lực từ bạn. Vì thế, bạn hãy kiên trì thực hiện theo các giải pháp trên đây để vượt qua nỗi sợ này. Và xa hơn là tăng cơ hội trở thành một người thuyết trình mà người sẽ yêu thích, đồng thời tạo dựng được thương hiệu cá nhân tích cực trong mắt mọi người xung quanh.</span></p><p><br></p>','2022-08-06 07:58:20',NULL,'Nếu bạn đang sợ thuyết trình trước đám đông, hãy nhớ rằng bạn không phải là người duy nhất có nỗi sợ này. Theo kết quả cuộc nhiều cuộc khảo sát, có đến 75% người được hỏi thừa nhận rằng mình mang nỗi sợ này. Tuy nhiên, trong công việc hay cuộc sống đều cần đến kỹ năng thuyết trình. Kỹ năng thuyết trình trước đám đông tốt là điều mấu chốt giúp bạn thu phục nhân tâm, đồng thời tạo động lực cho những người xung quanh.','/api/file/images/upload/1/1667696299811_1667696299811_New-Project-2.jpg','vuot-qua-noi-so-mang-ten-thuyet-trinh-truoc-am-ong','Vượt qua nỗi sợ mang tên thuyết trình trước đám đông','2022-11-06 07:58:20',1,'PUBLIC'),(31,'<p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Làm thế nào để bạn nhận ra được một công ty có nền văn hóa doanh nghiệp tốt? Làm sao để bạn biết bạn phù hợp với công ty này? Không có cách nào khác ngoài việc bạn phải tự trải nghiệm chúng. Tuy nhiên, cũng có một số dấu hiệu giúp bạn có thể đánh giá tổng thể văn hóa công ty. Những dấu hiệu dưới đây có thể giúp bạn dự đoán được công ty tốt.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Nhân viên hài lòng và vui vẻ</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Quá trình phỏng vấn là một cách tuyệt vời để giúp bạn quan sát được những người mà chúng ta sẽ tiếp xúc trong tương lai. Họ có thể là người trưởng nhóm, nhân viên nhân sự, giám đốc hay trợ lý. Trong buổi phỏng vấn, họ có cách cư xử như thế nào? thái độ của họ ra sao?. Qua một vài đặc điểm hay một số câu trả lời từ họ, bạn sẽ nhận thấy được họ có thích công ty của mình hay không hoặc họ có đang căng thẳng khi nói về công ty.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Mô tả công việc rõ ràng</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Khi bạn quyết định đi phỏng và bạn hỏi về công việc của mình, nếu như nhà tuyển dụng cho bạn xem một bản mô tả công việc không hề rõ ràng, các con số để đo lường đánh giá công việc của bạn mơ hồ, thì bạn nên lựa chọn ứng tuyển ở nơi khác. Kể cả đối với một công ty mới thành lập, nếu bản mô tả công việc không được rõ ràng ngay từ đầu sẽ gây ra sự tranh cãi giữa người lao động và người sử dụng lao động.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Vì vậy, khi ứng tuyển, bạn nhận được một bản mô tả công việc rõ ràng hoặc bạn hỏi người tuyển dụng về các nhiệm vụ bên ngoài, cùng với những thước đo số lượng cho từng nhiệm vụ của bạn, nếu như người phỏng vấn bạn trả lời bạn rõ ràng về những số lượng nhiệm vụ hay thước đo cho mỗi nhiệm vụ một cách minh bạch, bạn xem xét lựa chọn làm việc tại đây.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Không gian làm việc thoải mái</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Việc đi phỏng vấn trực tiếp sẽ giúp bạn nhìn thấy được không gian – nơi làm việc của công ty. Bởi văn phòng công ty là nơi nhân viên dành 8 tiếng/ 1 ngày để làm việc. Không gian làm việc thoải mái, công ty trang bị đầy đủ các công cụ hỗ trợ, như: máy tính, máy in, điện thoại, quạt,.. Với một môi trường làm việc thoải mái và tiện nghi sẽ khiến mọi người yên tâm làm việc.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Khi đi phỏng vấn, bạn có thể hỏi nhà tuyển dụng, công ty có thể trang bị các công cụ làm việc nào cho nhân viên tại nơi làm việc của họ. Ngoài ra, một số nơi cung cấp những quà ăn vặt, trà, cafe hay những bữa ăn miễn phí. Hay chính địa chỉ văn phòng cũng là một cách giúp nhân viên đi lại thuận lợi và giữ chân nhân viên.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Cơ hội phát triển sự nghiệp</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Sự hài lòng trong công việc thường được gắn liền với sự thăng tiến của nhân viên. Các doanh nghiệp tốt thường xây dựng một lộ trình thăng tiến phù hợp cho nhân viên tiềm năng. Họ sẵn sàng đầu tư vào nâng cao kiến thức chuyên môn của nhân sự đó, cũng nhằm để lôi kéo nhân tài về công ty của mình.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Nếu như bạn hỏi người phỏng vấn về cơ hội phát triển sự nghiệp của mình, người phỏng vấn sẽ chỉ rõ cho bạn doanh nghiệp sẽ có những hỗ trợ như nào cho sự phát triển cho người lao động, có cam kết đối với phát triển sự nghiệp của nhân viên.&nbsp;</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Thẳng thắn và minh bạch&nbsp;</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Các câu hỏi về vị trí mà bạn ứng tuyển hay những quyền lợi mà bạn sẽ được nhận là các câu hỏi có thể hỏi nhà tuyển dụng và cần được trả lời trực tiếp. Bạn có thể chấp nhận việc người phỏng vấn bạn sẽ không thể giải thích mọi thứ chi tiết, nhưng sẽ không ổn nếu người phỏng vấn lảng tránh những câu hỏi này và không đưa địa chỉ liên hệ của người có thể giải thích cho bạn về những vấn đề này.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Quyền lợi của nhân viên</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Mọi người tham gia phỏng vấn thường hay ngại nói về vấn đề tiền lương, bởi họ lo nhà tuyển dụng đánh giá họ là những con người vội vàng. Tuy nhiên, một công ty có văn hóa doanh nghiệp tốt, những giá trị của bạn đem lại phù hợp với những gì công ty đang cần, bạn không cần ngần ngại về việc hỏi về mức lương thưởng thích đáng.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Bạn còn có thể hỏi về những lợi ích khác mà bạn có thể được nhận, sự cân bằng giữa công việc và cuộc sống riêng tư như ngày nghỉ, thời gian tăng ca,… Dựa vào các câu trả lời của công ty, bạn sẽ biết được công ty sẽ nhìn nhận và đánh giá ứng viên của mình như thế nào.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Danh tiếng của công ty&nbsp;</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Không chỉ khi đi phỏng vấn bạn mới tìm hiểu về doanh nghiệp. Thời gian là vàng bạc và sự nghiệp cá nhân của mỗi người là điều quan trọng nhất, bạn cũng không muốn lãng phí thời gian của mình vào một công ty không phù hợp. Không chỉ thông qua trang web, bạn có thể truy cập vào các trang web khác và các trang mạng xã hội, các group hội nhóm về đánh giá công ty, bạn có thể tham khảo xem thứ hạng của công ty, mức lương, chế độ đãi ngộ và phản hồi của nhân viên.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Những ý kiến tiêu cực đều do những nhân viên không hài lòng để lại. Những nhân viên cảm thấy hài lòng với công việc hay chế độ đãi ngộ của công ty hiện tại sẽ ít khi phải xem xét lại công ty. Lưu ý: bạn có thể tham khảo những ý kiến của nhân viên để lại đánh giá để đưa ra lựa chọn cho bản thân.</span></p><p><br></p>','2022-11-06 07:59:15',NULL,'Dấu hiệu nhận biết bạn đang ứng tuyển vào một công ty tốt','/api/file/images/upload/1/1667696354612_1667696354612_shutterstock_2115699611.jpg','dau-hieu-nhan-biet-ban-ang-ung-tuyen-vao-mot-cong-ty-tot','Dấu hiệu nhận biết bạn đang ứng tuyển vào một công ty tốt','2022-11-06 07:59:15',1,'PUBLIC'),(32,'<h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Luôn thành thật</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Bạn lo lắng lời từ chối của bạn làm đồng nghiệp thân thiết thất vọng nhưng việc nói dối sẽ làm mối quan hệ của hai người gặp trục trặc. Bạn nên thành thật với đồng nghiệp của mình về lý do tại sao bạn không nhận công việc này. Tất nhiên, bạn cũng cần lưu ý không nên công kích nổi giận với người giới thiệu công việc cho bạn chỉ vì bạn không phù hợp hoặc nói về những đãi ngộ của công ty cung cấp cho bạn không như kỳ vọng của bạn. Thay vào đó, bạn nên nói về những lý do liên quan đến con đường sự nghiệp của bạn hoặc bạn chưa đáp ứng được những yêu cầu của công ty.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Nếu như đồng nghiệp cũ của bạn đã giới thiệu về bạn cho nhân sự của công ty đấy thì họ có thể có mối quan hệ với công ty đó hoặc họ nghĩ đó là một nơi tuyệt vời để làm việc. Vì vậy, bạn không nên nói tiêu cực về công ty-nơi họ đang làm việc, bởi việc bạn đánh giá công ty như việc bạn đánh giá người giới thiệu bạn ở mức độ nào đó.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Theo sát vào câu chuyện của bạn</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Trải qua cuộc phỏng vấn với nhà tuyển dụng, bạn nhận ra công việc không phù hợp với bản thân, bạn nên đưa ra những lý do cho người phỏng vấn, nhân sự về lý do bạn từ chối lời mời cũng giống như lý do mà bạn trình bày với đồng nghiệp của mình. Bạn sẽ gặp rắc rối nếu bạn nói với đồng nghiệp một điều nhưng bạn lại nói với nhà tuyển dụng một điều khác. Và, khi họ bắt chuyện với nhau, họ nhận ra lý do mà bạn đưa ra cho họ không hề giống nhau tí nào.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Bạn còn nghĩ ra bạn sẽ cung cấp thêm các thông tin cá nhân hoặc lý do bạn từ chối công việc cho đồng nghiệp thân thiết, nhưng bạn lại đang đặt họ vào tình huống khó xử. Những thông tin mà bạn cung cấp cho người đồng nghiệp của bạn có thể có lợi cho người tuyển dụng, nhưng họ không phải chia sẻ như thế nào với người tuyển dụng do mối quan hệ với bạn.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Nhớ việc cảm ơn</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Khi nhận được lời giới thiệu, bạn đã lên kế hoạch cho việc cảm ơn đồng nghiệp cũ đã giới thiệu bạn, bằng cách đưa họ đi ăn trưa, gửi họ một món quà nhỏ hoặc hẹn đồng nghiệp cũ đó đi chơi vào ngày nghỉ thư giãn, đó là một vài cách thể hiện bạn đánh giá cao họ.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Việc nói lời cảm ơn vào những dịp này là điều cần thiết, đây là việc thể hiện bạn là một người thật lòng, là cơ hội để bạn chia sẻ rằng bản thân bạn rất vui khi nhận được sự ưu ái từ họ. Hãy đảm bảo rằng bạn sẽ làm điều gì đó phù hợp với mối quan hệ của bạn với đồng nghiệp cũ và rằng bạn không có ý định từ chối cơ hội đó nhưng bạn cũng cảm ơn họ vì đã cho bạn một cơ hội để khám phá ra những điều mới mẻ trong công việc.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Thể hiện sự chuyên nghiệp</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Việc thể hiện sự chuyên nghiệp trong công việc và cuộc sống thường ngày, giúp chúng ta giữ được những mối quan hệ chất lượng. Bạn gặp lại người đồng nghiệp cũ thân thiết sau khi bạn từ chối lời giới thiệu việc làm, bạn nên kiên định với những lý do mà bạn đã đề cập trước đó. Hạn chế việc nói rõ hoặc đi sâu vào những chi tiết không hợp lý để nói ra về lý do bạn quyết định từ chối lời mời. Cả hai sẽ cảm thấy khó xử khi quá tập trung vào vấn đề tại sao bạn từ chối về làm việc tại công ty đó. Bạn có thể nói về lý do bạn không nhận lời mời làm việc nhưng hãy giữ cho cuộc trò chuyện về chủ đề này thật ngắn gọn và nên chuyển cuộc trò chuyện sang một vấn đề khác mà không liên quan tới công việc.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Từ chối một lời mời không bao giờ là điều thú vị. Đừng ngần ngại việc đưa ra câu trả lời nếu bạn cảm thấy không muốn làm công việc này, bạn nên liên hệ với người tuyển dụng hay người đồng nghiệp đó ngay lập tức. Mặc dù họ có thể cảm thấy thất vọng nhưng việc bạn từ chối kịp thời sẽ giúp họ chuyển sang được ứng viên tiềm năng tiếp theo. Đừng vì sự chậm trễ của bạn khiến cho quá trình tuyển dụng của họ bị quay mòng mòng.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Bạn không nên nói những điều tiêu cực về công ty hay quy trình của công ty hoặc lời đề nghị từ công ty, bởi những điều này sẽ gây ảnh hưởng đến cơ hội tuyển dụng của bạn trong tương lai. Vì thế, hãy luôn bày tỏ sự biết ơn và đánh giá cao lời giới thiệu của đồng nghiệp bạn hoặc lời mời làm việc từ phía công ty.</span></p><p><br></p>','2022-11-06 08:18:55',NULL,'Bạn luôn có mối quan hệ tốt với đồng nghiệp cũ ở công ty, các bạn vẫn hay hẹn hò nhau vào thời gian rảnh và giúp đỡ nhau trong công việc. Một hôm, bạn nhận được lời giới thiệu công việc từ người đồng nghiệp cũ thân thiết, là một công việc ở công ty có tiếng. Việc nhận được một lời giới thiệu là một lời khen ngợi lớn khi nói đến sự nghiệp của bạn, những nỗ lực của bạn trong công việc dần có được kết quả. Nhưng khi bạn tìm hiểu về công việc hay cơ hội bạn được giới thiệu thì bạn phát hiện bản thân không phù hợp, vậy bạn nên làm thế nào để từ chối công việc khi được đồng nghiệp giới thiệu sao cho tinh tế?','/api/file/images/upload/29/1667697534464_1667697534464_shutterstock_2123956601-1.jpg','ong-nghiep-cu-than-thiet-ru-re-nhay-viec-ung-xu-sao-cho-tinh-te','Đồng nghiệp cũ thân thiết rủ rê nhảy việc, ứng xử sao cho tinh tế?','2022-11-06 08:18:55',29,'PUBLIC'),(34,'<p>tèdsfdsfdsfds</p>','2022-11-08 20:27:49','2022-11-08 20:34:49','tets','/api/file/images/upload/29/1667914068807_1667914068805_1665755678671.jpg','test1','test1','2022-11-08 20:34:49',29,'PRIVATE');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (34,'Do you have any Certification about IT ?'),(35,'What the level of you english?'),(36,'how long have you worked with php?'),(37,'Do you have any certificate ?'),(38,'What level of english you are?'),(39,'What are the types of automation testing?'),(40,'What is automation testing?'),(41,'When is a good time to automate a test?'),(42,'Bạn đã học những gì liên quan đến data analysis chưa?'),(43,'Bạn đang sữ dụng ngôn ngữ nào để  viết UI cho web'),(52,'How long have you  been in embedded field?'),(53,'Did you work some jobs relate to network?'),(54,'Are You Ungraduated ?'),(55,'how long have you worked in database field?');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'USER'),(2,'ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `skills` (
  `skill_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'Java'),(2,'C/C++'),(3,'Web'),(4,'Nodejs'),(5,'JavaScript'),(6,'UI_UX'),(7,'Graphic design'),(8,'Embedded'),(9,'Mobile'),(10,'Linux'),(11,'SQL'),(12,'Github'),(13,'Communication'),(14,'Teamwork'),(15,'Problem Solving'),(16,'Leadership'),(17,'English'),(18,'Analytic'),(19,'NetWork'),(20,'Data analysis'),(21,'DevOps'),(22,'Cloud computing'),(23,'Machine learning'),(24,'AI');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tags` (
  `tag_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'frontend'),(2,'rearctjs'),(3,'javascript'),(10,'Web'),(11,'Java'),(12,'Backend'),(13,'agriculture'),(14,'warter'),(15,'plant'),(16,'fresh'),(17,'json'),(18,'android'),(19,'mobile'),(20,'github'),(21,'devop'),(22,'fpt'),(23,'cantho'),(24,'embedded'),(25,'system'),(26,'net'),(27,'csharp'),(28,'software'),(29,'Web-java'),(30,'Chief'),(31,'Ways'),(32,'sensor'),(33,'Harbors'),(34,'Account'),(35,'post'),(39,'make'),(40,'morepost'),(41,'QA'),(42,'IT'),(43,'Oracle'),(44,'SQL'),(45,'Javascipt'),(46,'python'),(47,'tma'),(48,'devops'),(49,'php'),(50,'dotNet'),(51,'automation'),(52,'kms'),(53,'hoanglinhplus'),(54,'fullstack'),(55,'data'),(56,'chotot'),(57,'Plume'),(58,'Tester'),(59,'acb'),(60,'bank'),(61,'relationship'),(62,'education'),(63,'english'),(67,'interview'),(68,'hr'),(69,'Question_Answer'),(70,'carreer'),(71,'coworker'),(72,'cv'),(73,'preparation'),(74,'softskill'),(75,'hoanglinh'),(76,'company'),(77,'good_job'),(78,'onemount'),(79,'senior'),(80,'stock'),(81,'solfware'),(82,'shinhan'),(83,'insight'),(84,'c++'),(87,'network'),(88,'database');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notification_relationship`
--

DROP TABLE IF EXISTS `user_notification_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_notification_relationship` (
  `notification_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  KEY `FKio2r7wdx270q31uctelcjjd24` (`user_id`),
  KEY `FKqhejb9n2aj3idly8m6ijtwllc` (`notification_id`),
  CONSTRAINT `FKio2r7wdx270q31uctelcjjd24` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKqhejb9n2aj3idly8m6ijtwllc` FOREIGN KEY (`notification_id`) REFERENCES `user_notifications` (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notification_relationship`
--

LOCK TABLES `user_notification_relationship` WRITE;
/*!40000 ALTER TABLE `user_notification_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_read` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notifications`
--

LOCK TABLES `user_notifications` WRITE;
/*!40000 ALTER TABLE `user_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  KEY `FKhfh9dx7w3ubf1co1vdev94g3f` (`user_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,2),(26,1),(27,1),(28,1),(29,1),(51,1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_skills`
--

DROP TABLE IF EXISTS `user_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_skills` (
  `user_id` bigint(20) NOT NULL,
  `skill_id` bigint(20) NOT NULL,
  KEY `FKh223y61gwijpgqt6nlsuti07g` (`skill_id`),
  KEY `FKro13if9r7fwkr5115715127ai` (`user_id`),
  CONSTRAINT `FKh223y61gwijpgqt6nlsuti07g` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`),
  CONSTRAINT `FKro13if9r7fwkr5115715127ai` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_skills`
--

LOCK TABLES `user_skills` WRITE;
/*!40000 ALTER TABLE `user_skills` DISABLE KEYS */;
INSERT INTO `user_skills` VALUES (1,2),(1,1),(1,10),(29,14),(29,15),(26,15),(26,1),(26,14);
/*!40000 ALTER TABLE `user_skills` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kiên giang','/api/file/images/upload/1/1667646768483_1667646768481_hoanglinh.png','hello i am hoanglinhplus, nice to meet you','2022-09-03 14:16:44','https://secretdeveloperisme.github.io/Curriculum_Vitae/HoangLinhPlusCV.html',NULL,'2000-11-25 07:00:00','linh07221@gmail.com',NULL,NULL,'nguyen hoang linh','m',_binary '\0','$2a$12$xCmz2Tsx3FS5f8AEoLkNoeI8iYsZeZDHOTSg2gBcQhPXI0ezc44wK',NULL,'hoanglinh'),(26,'Tan Hung, Long An','/api/file/images/upload/26/1667650461744_1667650461740_huynhdieu.png','If you have your doubts, it’s likely time to update your bio, and we have some of the best professional bio examples to get you started.','2022-06-07 21:05:46',NULL,NULL,'2000-04-25 07:00:00','dieu2504@gmail.com',NULL,NULL,NULL,'f',_binary '\0','$2a$10$FxzoQM9jMpQ2sXEwXi9epu3yhuPxIk0SGYbR8al6P2qtPEczAl6n.',NULL,'huynhdieu'),(27,'An Giang','/api/file/images/upload/1/1667659098032_1667659098032_huubang.png','I have a passionate with computer science ','2022-06-10 21:10:53',NULL,NULL,'2000-12-12 07:00:00','huubang@gmail.com',NULL,NULL,NULL,'m',_binary '\0','$2a$10$ixboSg7NMNDacOkNd9i3bOorv3mK.c35xY/psIp7zXVO4uJQGWcU6',NULL,'huubang'),(28,'Cai Rang, Can Tho','/api/file/images/upload/27/1667693394807_1667693394807_lapnghiep.png','Top Rated Freelancer || Blogger || Cross-Platform App Developer || Web Developer || Open Source Contributor','2022-01-12 23:09:02',NULL,NULL,'2000-07-08 07:00:00','nghiepit321@gmail.com',NULL,NULL,NULL,'m',_binary '\0','$2a$10$D1dbELyX5yT7iZUIqvFb0e5/HW4vWrdJtsIyYLjEiOx1B.6fSiXVu',NULL,'lapnghiep'),(29,'Long Ho, Vinh Long','/api/file/images/upload/1/1667696593675_1667696593675_minhman.webp','I am an automatic machine engineer. I really happy make friend with everyone.  ','2021-02-03 21:09:12',NULL,NULL,'2000-05-01 07:00:00','minhman2k@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$fWMCdJXO0ZOAjbFK95JSHuUQyYRbu2axz1G1IH6Lfts.IchenhtW2',NULL,'minhman'),(51,'Ha Noi','/api/file/images/upload/guest/1668338035668_1668338035659_nguyen_thi_hoa.png','I am from a countryside but with my motivation is not  small',NULL,NULL,NULL,'1997-11-22 07:00:00','thihoa@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$L/1uzblrgXHDZETXkGqolOF3yZ15kRLqHO5JxXFyNw562d4LngDzS',NULL,'thihoa');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_places`
--

DROP TABLE IF EXISTS `work_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `work_places` (
  `work_place_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `place` varchar(255) NOT NULL,
  PRIMARY KEY (`work_place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_places`
--

LOCK TABLES `work_places` WRITE;
/*!40000 ALTER TABLE `work_places` DISABLE KEYS */;
INSERT INTO `work_places` VALUES (1,'onsite'),(2,'hybrid'),(3,'remote');
/*!40000 ALTER TABLE `work_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'career_social_network'
--
/*!50003 DROP FUNCTION IF EXISTS `check_user_is_the_same_conversation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_user_is_the_same_conversation`(user_id1 bigint, user_id2 bigint) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    declare number_conversation int;
    set number_conversation = (select count(*) from(
        select conversation_id, count(user_id) as number_of_users
        from participants
        where user_id in(user_id1,user_id2)
        group by conversation_id
        having number_of_users > 1
    ) cp);
    IF (number_conversation > 0) THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_total_of_jobs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_total_of_jobs`() RETURNS bigint(20)
    DETERMINISTIC
BEGIN
    declare total BIGINT default -1;
    set total = (select count(*) from jobs);
    return total;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `amount_companies_per_month_in_current_year`
--

/*!50001 DROP VIEW IF EXISTS `amount_companies_per_month_in_current_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `amount_companies_per_month_in_current_year` AS select month(`companies`.`created_at`) AS `month`,count(`companies`.`company_id`) AS `amount_of_companies` from `companies` where (year(`companies`.`created_at`) = year(curdate())) group by `month` order by `month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `amount_jobs_of_companies`
--

/*!50001 DROP VIEW IF EXISTS `amount_jobs_of_companies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `amount_jobs_of_companies` AS select `c`.`company_id` AS `company_id`,`c`.`name` AS `name`,count(`j`.`job_id`) AS `amount_of_jobs` from (`companies` `c` join `jobs` `j` on((`c`.`company_id` = `j`.`company_id`))) group by `c`.`company_id` order by `amount_of_jobs` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `amount_jobs_of_companies_of_total`
--

/*!50001 DROP VIEW IF EXISTS `amount_jobs_of_companies_of_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `amount_jobs_of_companies_of_total` AS (select `c`.`company_id` AS `company_id`,`c`.`name` AS `name`,count(`j`.`job_id`) AS `total` from (`companies` `c` join `jobs` `j` on((`c`.`company_id` = `j`.`company_id`))) group by `c`.`company_id` order by `total` desc limit 0,10) union (select NULL AS `company_id`,'other' AS `name`,sum(`other`.`total`) AS `total` from (select `c`.`company_id` AS `company_id`,`c`.`name` AS `name`,count(`j`.`job_id`) AS `total` from (`companies` `c` join `jobs` `j` on((`c`.`company_id` = `j`.`company_id`))) group by `c`.`company_id` order by `total` desc limit 10,9999999999) `other`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `amount_jobs_per_month_in_current_year`
--

/*!50001 DROP VIEW IF EXISTS `amount_jobs_per_month_in_current_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `amount_jobs_per_month_in_current_year` AS select month(`jobs`.`created_at`) AS `month`,count(`jobs`.`job_id`) AS `amount_of_jobs` from `jobs` where (year(`jobs`.`created_at`) = year(curdate())) group by `month` order by `month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `amount_posts_per_month_in_current_year`
--

/*!50001 DROP VIEW IF EXISTS `amount_posts_per_month_in_current_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `amount_posts_per_month_in_current_year` AS select month(`posts`.`created_at`) AS `month`,count(`posts`.`post_id`) AS `amount_of_posts` from `posts` where (year(`posts`.`created_at`) = year(curdate())) group by `month` order by `month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `percent_jobs_of_companies_of_total`
--

/*!50001 DROP VIEW IF EXISTS `percent_jobs_of_companies_of_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `percent_jobs_of_companies_of_total` AS select `c`.`company_id` AS `company_id`,`c`.`name` AS `name`,(count(`j`.`job_id`) / `get_total_of_jobs`()) AS `percent` from (`companies` `c` join `jobs` `j` on((`c`.`company_id` = `j`.`company_id`))) group by `c`.`company_id` order by `percent` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `popular_companies`
--

/*!50001 DROP VIEW IF EXISTS `popular_companies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `popular_companies` AS select `top_ca`.`company_id` AS `company_id`,coalesce(`top_cf`.`number_of_follows`,0) AS `number_of_follows`,`top_ca`.`number_of_applications` AS `number_of_applications` from ((select `c`.`company_id` AS `company_id`,coalesce(sum(`ja`.`number_of_application`),0) AS `number_of_applications` from (`companies` `c` left join (select `j`.`company_id` AS `company_id`,count(`a`.`job_id`) AS `number_of_application` from (`jobs` `j` left join `applications` `a` on((`j`.`job_id` = `a`.`job_id`))) group by `j`.`job_id`,`j`.`company_id`) `ja` on((`c`.`company_id` = `ja`.`company_id`))) group by `c`.`company_id`) `top_ca` left join (select `c`.`company_id` AS `company_id`,count(`c`.`company_id`) AS `number_of_follows` from (`companies` `c` join `follow_companies` `fc` on((`c`.`company_id` = `fc`.`company_id`))) group by `c`.`company_id`) `top_cf` on((`top_ca`.`company_id` = `top_cf`.`company_id`))) where ((`top_cf`.`number_of_follows` > 0) or (`top_ca`.`number_of_applications` > 0)) order by `number_of_follows` desc,`top_ca`.`number_of_applications` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `popular_jobs`
--

/*!50001 DROP VIEW IF EXISTS `popular_jobs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `popular_jobs` AS select `top_ja`.`job_id` AS `job_id`,coalesce(`top_jf`.`number_of_likes`,0) AS `number_of_like`,`top_ja`.`number_of_applications` AS `number_of_applications` from ((select `j`.`job_id` AS `job_id`,sum(`ja`.`number_of_application`) AS `number_of_applications` from (`jobs` `j` left join (select `j`.`job_id` AS `job_id`,count(`a`.`job_id`) AS `number_of_application` from (`jobs` `j` left join `applications` `a` on((`j`.`job_id` = `a`.`job_id`))) group by `j`.`job_id`,`j`.`company_id`) `ja` on((`j`.`job_id` = `ja`.`job_id`))) group by `j`.`job_id`) `top_ja` left join (select `l`.`job_id` AS `job_id`,count(`l`.`job_id`) AS `number_of_likes` from (`jobs` join `likes` `l` on((`jobs`.`job_id` = `l`.`job_id`))) where (`l`.`type_like` = 'LIKE') group by `l`.`job_id`) `top_jf` on((`top_ja`.`job_id` = `top_jf`.`job_id`))) where ((`top_jf`.`number_of_likes` > 0) or (`top_ja`.`number_of_applications` > 0)) order by `top_ja`.`number_of_applications` desc,`top_jf`.`number_of_likes` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `popular_posts`
--

/*!50001 DROP VIEW IF EXISTS `popular_posts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `popular_posts` AS select `top_pf`.`post_id` AS `post_id`,coalesce(`top_pf`.`number_of_likes`,0) AS `number_of_like` from (select `l`.`post_id` AS `post_id`,count(`l`.`post_id`) AS `number_of_likes` from (`posts` join `post_likes` `l` on((`posts`.`post_id` = `l`.`post_id`))) where (`l`.`type_like` = 'LIKE') group by `l`.`post_id`) `top_pf` order by `number_of_like` desc,`top_pf`.`number_of_likes` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-14  7:50:36
