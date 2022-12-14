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
INSERT INTO `answers` VALUES (35,29,'{\"ops\":[{\"insert\":\"Yes I have an IT certificate, and office\"},{\"attributes\":{\"bold\":true},\"insert\":\"sdfdsfs\"},{\"attributes\":{\"header\":1},\"insert\":\"\\n\"},{\"insert\":\"sdfsdfdsfdsf\"},{\"attributes\":{\"code-block\":true},\"insert\":\"\\n\"}]}','2022-11-06 08:53:08'),(36,29,'{\"ops\":[{\"insert\":\"My level English is intermediate\"},{\"attributes\":{\"bold\":true},\"insert\":\"sdfdsfs\"},{\"attributes\":{\"header\":1},\"insert\":\"\\n\"},{\"insert\":\"sdfsdfdsfdsf\"},{\"attributes\":{\"code-block\":true},\"insert\":\"\\n\"}]}','2022-11-06 08:53:08'),(53,1,'{\"ops\":[{\"insert\":\"I have been in this field about 2 years\"},{\"attributes\":{\"italic\":true},\"insert\":\"dsfdsfdsfs\"},{\"attributes\":{\"underline\":true,\"italic\":true},\"insert\":\"dsfdsfdsfsd\"},{\"insert\":\"\\n\"}]}','2022-11-12 18:41:17'),(54,1,'{\"ops\":[{\"insert\":\"I have been in this field about 2 years\"},{\"attributes\":{\"italic\":true},\"insert\":\"dsfdsfdsfs\"},{\"attributes\":{\"underline\":true,\"italic\":true},\"insert\":\"dsfdsfdsfsd\"},{\"insert\":\"\\n\"}]}','2022-11-13 19:10:15'),(54,51,'{\"ops\":[{\"insert\":\"you I work as a IT helpdesk\"},{\"attributes\":{\"italic\":true},\"insert\":\"dsfdsfdsfs\"},{\"attributes\":{\"underline\":true,\"italic\":true},\"insert\":\"dsfdsfdsfsd\"},{\"insert\":\"\\n\"}]}','2022-11-13 19:09:17'),(55,1,'{\"ops\":[{\"insert\":\"yes\"},{\"attributes\":{\"italic\":true},\"insert\":\"dsfdsfdsfs\"},{\"attributes\":{\"underline\":true,\"italic\":true},\"insert\":\"dsfdsfdsfsd\"},{\"insert\":\"\\n\"}]}','2022-11-13 19:10:15'),(55,51,'{\"ops\":[{\"insert\":\"yes\"},{\"attributes\":{\"italic\":true},\"insert\":\"dsfdsfdsfs\"},{\"attributes\":{\"underline\":true,\"italic\":true},\"insert\":\"dsfdsfdsfsd\"},{\"insert\":\"\\n\"}]}','2022-11-13 19:09:17'),(56,1,'{\"ops\":[{\"insert\":\"two years\"},{\"attributes\":{\"italic\":true},\"insert\":\"dsfdsfdsfs\"},{\"attributes\":{\"underline\":true,\"italic\":true},\"insert\":\"dsfdsfdsfsd\"},{\"insert\":\"\\n\"}]}','2022-11-13 19:31:45'),(66,52,'{\"ops\":[{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"about 3 years \"},{\"insert\":\"\\n\"}]}','2022-11-22 06:50:20');
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
INSERT INTO `applications` VALUES (52,26,'APPROVED'),(55,29,'PENDING'),(56,1,'PENDING'),(56,28,'PENDING'),(59,1,'PENDING'),(80,1,'APPROVED'),(85,1,'APPROVED'),(85,51,'PENDING'),(86,1,'PENDING'),(89,52,'PENDING');
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (40,'/api/file/images/upload/1/1667955492862_1667955492860_RBVH-Logo.png',12,143),(43,'/api/file/images/upload/1/1668037497362_1668037497359_NguyenHoangLinh_FresherNodeJS_CV.pdf',13,145),(44,'/api/file/images/upload/26/1668253877649_1668253877646_fpt.jpg',8,149),(45,'/api/file/images/upload/26/1668253877653_1668253877653_KMS.jpg',8,149),(47,'/api/file/images/upload/26/1668323897407_1668323897404_CV_Hu???nh Th??? Di???u.pdf',13,159),(48,'/api/file/images/upload/26/1668341839068_1668341839068_acb.png',12,167),(49,'/api/file/images/upload/26/1668341839070_1668341839070_chotot.jpg',8,167),(50,'/api/file/images/upload/1/1668342594217_1668342594217_Curriculum_Vitae.pdf',13,174),(53,'/api/file/images/upload/29/1668490341190_1668490341187_milk-and-mocha-yay.gif',14,178);
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
INSERT INTO `comment_likes` VALUES (66,1,'LIKE'),(66,51,'LIKE'),(74,1,'LIKE'),(74,26,'LIKE'),(75,26,'LIKE'),(76,1,'LIKE'),(77,1,'UNLIKE'),(78,51,'LIKE'),(79,1,'LIKE');
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (31,'2022-01-05 19:22:31',NULL,'/api/file/images/upload/26/1667650950664_1667650950661_RBVH-Logo.png','Robert Bosch','','2022-11-10 07:47:20','https://www.bosch.com/',26,1,5),(32,'2022-02-05 19:44:02',NULL,'/api/file/images/upload/26/1667652242028_1667652242027_1665755678671.jpg','Oracle','We help people see data in new ways, discover insights, unlock endless possibilities.','2022-11-05 19:44:02','http://www.oracle.com/',26,1,6),(33,'2022-03-05 19:57:04',NULL,'/api/file/images/upload/1/1667653024403_1667653024403_tma.jpg','TMA Solution','Leading software outsourcing provider in Vietnam | 25 years | 3800 engineers | 7 offices in Vietnam | 6 overseas offices','2022-11-05 19:57:04','https://www.tmasolutions.com/',1,16,7),(34,'2022-04-05 20:06:16',NULL,'/api/file/images/upload/1/1667653576111_1667653576111_fpt.jpg','FPT Software','Powering Digital Transformation','2022-11-05 20:06:16','http://www.fpt-software.com/',1,16,7),(35,'2022-04-05 20:21:00',NULL,'/api/file/images/upload/1/1667654460083_1667654460083_KMS.jpg','KMS Technology, Inc.','Bright Minds. Brilliant Solutions.','2022-11-05 20:21:00','http://www.kms-technology.com/',1,16,6),(36,'2022-04-05 20:59:29','2022-11-10 07:38:06','/api/file/images/upload/1/1667656768263_1667656768263_HoangLinhPlus.png','hoanglinhplus','Together We will change the world','2022-11-10 07:38:06','https://hoanglinhplus.org.com',1,1,3),(37,'2022-09-05 21:44:20',NULL,'/api/file/images/upload/27/1667659460045_1667659460042_chotot.jpg','Ch??? T???t','Vietnam\'s first recommerce platform, using technology to empower Vietnamese daily life.','2022-11-05 21:44:20','https://careers.chotot.com/',27,9,5),(38,'2022-09-06 06:53:56',NULL,'/api/file/images/upload/27/1667692435893_1667692435893_Plume.jpg','Plume Design, Inc','Plume Design, Inc','2022-11-06 06:53:56','http://www.plume.com/',27,9,4),(39,'2022-11-06 07:14:29',NULL,'/api/file/images/upload/28/1667693669451_1667693669451_acb.png','Ng??n H??ng TMCP ?? Ch??u (ACB)','ACB c???n nh???ng con ng?????i l??m ch??? s??? ph??t tri???n c???a ng??n h??ng theo c??ch ch??? ?????ng nh???t v???i th???i cu???c','2022-11-06 07:14:29','http://www.acbjobs.com.vn/',28,8,6),(40,'2022-11-06 07:37:04',NULL,'/api/file/images/upload/28/1667695023825_1667695023825_language_link.png','Language Link Vietnam','Language Link recruits talents to support our diversity and educational excellence. If you believe you can really make a difference, want to have room to freely use your talent and pursue an extraordinary career, please write to us.','2022-11-06 07:37:04','http://languagelink.edu.vn',28,17,5),(41,'2022-11-06 08:20:41',NULL,'/api/file/images/upload/29/1667697640844_1667697640844_s.png','One Mount','One Mount Group ???????c th??nh l???p v???i tham v???ng ki???n t???o h??? sinh th??i c??ng ngh??? l???n nh???t Vi???t Nam, cung c???p c??c gi???i ph??p v?? d???ch v??? xuy??n su???t chu???i gi?? tr???, t??? l??nh v???c d???ch v??? t??i ch??nh, ph??n ph???i, b???t ?????ng s???n v?? b??n l???.','2022-11-06 08:20:41','https://onemount.com/',29,9,5),(42,'2022-11-06 08:41:28',NULL,'/api/file/images/upload/29/1667698888072_1667698888072_10668657.png','Shinhan DS Vietnam Company Limited','Shinhan DS Vietnam Co., Ltd. has been reinforcing generation of IT synergies within Shinhan Financial Group and offering the best-of-its kind financial IT services to its customers since 1991.','2022-11-06 08:41:28','',29,16,5),(49,'2022-11-10 22:02:53',NULL,'/api/file/images/upload/1/1668092573298_1668092573296_LG-logo.png','LG','LG Vehicle Component Solutions Development Center Vietnam (VS DCV)','2022-11-10 22:02:53','https://www.facebook.com/LGVSDCV',1,1,4),(50,'2022-11-13 18:57:27',NULL,'/api/file/images/upload/51/1668340646782_1668340646779_daikin.png','Daikin Air Conditioning (Vietnam) Joint Stock Company','Daikin Vietnam - formerly known as Viet Kim Company - was established in 1995, specializing in distributing Daikin air conditioning products in Viet Nam.','2022-11-13 18:57:27','https://www.daikin.com',51,17,6),(51,'2022-11-13 19:23:46',NULL,'/api/file/images/upload/51/1668342225884_1668342225884_11127170.png','C??ng Ty C??? Ph???n Ch???ng Kho??n MB','???????c th??nh l???p t??? th??ng 5 n??m 2000 b???i Ng??n h??ng TMCP Qu??n ?????i (MB), C??ng ty CP Ch???ng kho??n MB (MBS) l?? m???t trong 5 c??ng ty ch???ng kho??n ?????u ti??n t???i Vi???t Nam','2022-11-13 19:23:46','https://www.mbbank.com.vn/',51,2,6),(52,'2022-11-22 06:38:46',NULL,'/api/file/images/upload/52/1669073926039_1669073926039_binance-logo-5.webp','Binance','Buy, trade, and hold 350+ cryptocurrencies on Binance','2022-11-22 06:38:46','https://www.binance.com/en',52,2,5);
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
INSERT INTO `company_user_roles` VALUES (31,1,26),(32,1,26),(33,1,1),(34,1,1),(35,1,1),(36,1,1),(37,1,27),(38,1,27),(39,1,28),(40,1,28),(41,1,29),(42,1,29),(49,1,1),(50,1,51),(51,1,51),(52,1,52),(33,2,26),(34,2,29),(35,3,27),(50,3,1),(31,4,1),(32,4,27),(33,4,27),(34,4,26),(35,4,26),(37,4,26),(49,4,26),(50,4,26),(51,4,27),(52,4,28),(33,5,29),(49,5,26);
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
INSERT INTO `follow_companies` VALUES (27,34),(28,32),(28,36),(26,32),(51,34),(51,50),(1,34),(1,33),(1,50),(1,51),(52,52);
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
INSERT INTO `follow_tags` VALUES (28,57),(29,28),(1,28),(1,41),(51,47),(51,71),(51,68),(52,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_question`
--

LOCK TABLES `job_question` WRITE;
/*!40000 ALTER TABLE `job_question` DISABLE KEYS */;
INSERT INTO `job_question` VALUES (35,55,34),(36,55,35),(37,61,36),(38,61,37),(39,61,38),(40,65,39),(41,65,40),(42,65,41),(43,67,42),(44,72,43),(53,80,52),(54,85,53),(55,85,54),(56,86,55),(66,89,65);
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
INSERT INTO `job_skills` VALUES (3,80),(10,75),(12,75),(3,62),(6,62),(3,76),(6,76),(10,89),(1,80),(2,59),(10,59),(3,90);
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
INSERT INTO `job_tags` VALUES (42,85),(87,85),(24,80),(28,80),(81,79),(82,79),(28,78),(80,78),(12,77),(78,77),(62,75),(63,75),(62,74),(63,74),(59,73),(60,73),(61,73),(1,72),(59,72),(60,72),(19,71),(57,71),(57,70),(58,70),(19,69),(41,69),(57,69),(55,67),(56,67),(53,66),(54,66),(51,65),(52,65),(27,64),(50,64),(22,63),(24,63),(1,62),(22,62),(10,61),(22,61),(49,61),(47,60),(28,58),(46,58),(47,58),(43,57),(45,57),(10,56),(43,56),(28,55),(43,55),(28,54),(42,54),(44,54),(28,53),(42,53),(43,53),(44,53),(41,52),(42,52),(48,68),(56,68),(1,76),(78,76),(79,76),(10,86),(88,86),(46,89),(90,89),(91,89),(11,60),(47,59),(48,59),(89,90);
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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (52,10,'2022-01-05 19:24:30',NULL,'2022-11-30 19:24:30',0,'/api/file/images/upload/26/1667651070073_1667651070073_RBVH-Logo.png','{\"ops\":[{\"insert\":\"WHAT WE CAN OFFER\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"13th-month bonus + yearly performance bonus + annual salary appraisal\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Premium health insurance for employee + 2 family members\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"16++ days of paid leave per year\\nJOB DESCRIPTION\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"??? Verification and Validation of Configurable items\\n??? Configuration Audits reporting, verification of actions and tracking to closure\\n??? Facilitate for CAR/8D and LLBP\\n??? Quality Assurance Activities\\n??? Project, Planning, Tracking and Closure\\n??? Conduct reviews of activities and work products against specifications, processes and standards.\\n??? Reporting of QA status\\n??? PDC shall be performed by EPQ prior to all releases\\n??? Creation and regular updating of product-related quality forecast and alignment of quality targets with - product/project and business targets) with risk assessments and if necessary arrange measures and review their effectiveness.\\n??? Independent evaluation of product-/process maturity.\\n??? Preparation of quality report based on defined quality targets and KPI\\n??? Duty to escalate if measures to achieve the Q-targets are not sufficient in her/his view.\\n??? Release of SW-Release of in-house development and third-party components from Q-perspective.\\n??? Request systematical problem solving in case of deviations in the project\\n??? Responsible to check the existence of required review/approval records and compliance information for the 3rd party software license usage.\\n??? Enssurance of adequate use (right effect) of SW/IT quality methods and processes in product development and regarding incoming products.\\n??? Verification, if software quality assurance activities are carried out as planned and whether the quality status corresponds to the prerequisites for the product release.\\n\"},{\"attributes\":{\"background\":\"transparent\",\"color\":\"#005aff\"},\"insert\":\"Read full Job Descriptions\"},{\"insert\":\"\\nJOB REQUIREMENTS\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"Mandatory requirement\\n??? B.S of Computer Science, Computer Engineering, Information Technology, MIS or related major\\n??? 4-7 Years of hands-on related experience, especially in Software Quality activities\\n??? Good knowledge with ISO9001:2015, CMMI 2.0, ITIL foundation. Practical experience in this aspect is a treasure\\n??? Office experience and Reporting skill: MS Excel, Word, PPT, VBA, Scripting, Power BI desktop (reporting and DAX - Data Analysis Expressions)\\n??? Good Communication skills in English, able to work with different stakeholders\\n??? Software Development Lifecycle (SDLC), Software Maintenance Lifecycle (SMLC)\\n??? Quality Engineer, Quality inspection and testing\\n??? Data collection and analysis\\n??? Planning and organizing\\n??? Patience, Working under pressure, Conflict management\\n??? Exposure in software projects\\n\\nDesirable Skills:\\n??? Problem analysis and problem solving, 7 QC tools\\n??? Statistical Process Control: Hypothesis testing, acceptance sampling, prediction; DoE, six Sigma\\n??? Internal Auditor, Quality Auditor, CSQA etc\\n??? ISO 9001:2015, ITIL, ISO/TS 16949, ASPICE, CMMI Dev Ver2.0 processes, etc.\\n\"}]}','Etown building, 364 Cong Hoa street, ward 13, Tan Binh district, Ho Chi Minh, Vietnam',3000,2000,'2022-01-05 19:24:30','Epq - Engineering Product Quality (Quality Assurance)','2022-11-21 21:19:30',31,1,1,1),(53,20,'2022-01-05 19:29:47',NULL,'2022-12-14 19:29:47',1,'/api/file/images/upload/26/1667651387071_1667651387071_RBVH-Logo.png','{\"ops\":[{\"insert\":\"JOB DESCRIPTION\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"- Support End-User via SMT Ticket following ITIL Process which are maintained with defined SLA & KPI\\n- Contribute to problem investigation, change management\\n- Working on Oracle PL/SQL\\n- Support for new feature release, hot-fix\\n- Maintain and manage the application servers\\n- To the holder of this position other tasks and activities related to the current job can be assigned by line-manager\\nJOB REQUIREMENTS\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"- Bachelor degree in IT/ Computer Science or relevant background\\n- Knowledge of SQL, PL/SQL\\n- Knowledge in Service Management Tool (Redemy , Service Now, ServiceDesk Plus)\\n- To be trained in process know how (Incident, Problem, Change Management)\\n- Strong communication, interpersonal and intercultural skills\\n\"}]}','ho chi minh',2000,1500,'2022-01-05 19:29:47','Global IT Support (Fresher)','2022-11-21 21:19:24',31,1,1,1),(54,1,'2022-11-05 19:31:35',NULL,'2022-12-15 19:31:35',0,'/api/file/images/upload/26/1667651494602_1667651494602_RBVH-Logo.png','{\"ops\":[{\"insert\":\"WHAT WE CAN OFFER\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"13th-month bonus + yearly performance bonus + annual salary appraisal\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Premium health insurance for employee + 2 family members\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"16++ days of paid leave per year\\nJOB DESCRIPTION\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"Overview: Bosch Hybrid Cloud provides Bosch business units with best-fit services from private and public clouds. Your work as a IT Development Lead involves leading development & automation of the Cloud Frameworks & Automation Product portfolio using state of the art Development Tools and frameworks\\n\\n- Mange overall product design, architecture, development, code review, and testing of apps\\n- Preparing low- and high-level design documents\\n- Drive adopting new technologies, ideas, and continuous improvement of processes\\n- Guiding and mentoring team members Best Practices\\n- Oversee Continuous Integration/Continuous Deployment\\n- Define and document best practices and strategies application deployment\\n- Ensuring systems availability and scalability\\n- Define and deploy monitoring, metrics and logging systems\\n- Operate the platform within our security and privacy guidelines\\n- Automate stories and tasks wherever it requires\\n- Ensure code quality with Unit and integration tests\\n\"},{\"attributes\":{\"background\":\"transparent\",\"color\":\"#005aff\"},\"insert\":\"Read full Job Descriptions\"},{\"insert\":\"\\nJOB REQUIREMENTS\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"This role requires both depth and breadth in technologies used in modern DevOps landscapes, PaaS platforms and the development of cloud-native application architectures (micro-services). Furthermore, a solid understanding of the components required to provide high-availability application and networking environment is required. The role demands strong work ethic, critical attention to detail, thoroughness, strong analytical, problem-solving skills and the following qualifications:\\n??? Solid web application development experience using Java and Sprint Boot\\n??? Proficiency in one or more frontend frameworks (Angular or React or etc.,)\\n??? Hands on experience in JavaScript, Bootstrap, HTML5/CSS3, JQuery\\n??? Strong SQL and No-SQL databases design experience (Oracle or MySQL/Cassandra/Mongo)\\n??? Experience in developing and consuming RESTful APIs, SOAP and JSON data\\n??? Strong experience in consuming cloud services like API Gateway, RabbitMQ, Redis, Logic Apps, Active Directory\\n??? Hands on experience in setting up CI/CD Pipeline using tools like Jenkins, Maven, Artifactory and others\\n??? Hands-on experience in writing Unit, Integration and Functional Tests.\\n??? Solid experience in OOAD, Design patterns and UML.\\n??? Experience in designing Cloud Native and Cloud Agnostic solutions\\n??? Good communication and client-facing skills.\\n??? Hands-on experience across all phases of SDLC using Agile Methodologies\\n??? Integration, Continuous Delivery, Pair programming and Test Driven Development (TDD)\\n??? Knowledge on Bosch SEP Process\\\\ Could Security \\\\ Application Security\\nRecommended Skills:\\n- Knowledge in the field of Cloud Platform Development/ Operations, system engineering or similar (For e.g. Cloud Foundry, OpenShift etc.)\\n- Knowledge in Infrastructure as Code, Orchestration tools (e.g. Terraform, Cloud Formation, Ansible etc.)\\n- Working knowledge with modern security concepts (OAuth, micro segmentation etc.)\\n- Working knowledge with monitoring/logging tools (e.g. Grafana, Elasticsearch, Splunk, Prometheus etc.)\\n- Knowledge of public cloud technologies (e.g. Azure, AWS etc.)\\nLanguage: Speak & write fluently in English\\nJOB LOCATIONS\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Etown Building, 364 Cong Hoa, Ward 13, Tan Binh District, HCMC\\n\"}]}','ho chi minh',2500,2000,'2022-11-05 19:31:35','Java Technical Lead (Joining Bonus)','2022-11-21 21:19:15',31,1,1,1),(55,100,'2022-11-05 19:46:19',NULL,'2022-12-15 19:46:19',1,'/api/file/images/upload/26/1667652378781_1667652378781_1665755678671.jpg','{\"ops\":[{\"insert\":\"About the job\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Job Description\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Design, develop, troubleshoot and debug software programs for databases, applications, tools, networks etc.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"As a member of the software engineering division, you will apply basic to intermediate knowledge of software architecture to perform software development tasks associated with developing, debugging or designing software applications or operating systems according to provided design specifications. Build enhancements within an existing software architecture and occasionally suggest improvements to the architecture.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Duties and tasks are standard with some variation; displays understanding of roles, processes and procedures. Performs moderately complex problem solving with assistance and guidance in understanding and applying company policies and processes. BS degree or equivalent experience relevant to functional area. 1 year of software engineering or related experience.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Responsibilities\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"As a member of the software engineering division, you will apply basic to intermediate knowledge of software architecture to perform software development tasks associated with developing, debugging or designing software applications or operating systems according to provided design specifications. Build enhancements within an existing software architecture and occasionally suggest improvements to the architecture.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Duties and tasks are standard with some variation; displays understanding of roles, processes and procedures. Performs moderately complex problem solving with assistance and guidance in understanding and applying company policies and processes. BS degree or equivalent experience relevant to functional area. 1 year of software engineering or related experience.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"About Us\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"As a world leader in cloud solutions, Oracle uses tomorrow???s technology to tackle today???s problems. True innovation starts with diverse perspectives and various abilities and backgrounds.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"When everyone???s voice is heard, we???re inspired to go beyond what???s been done before. It???s why we???re committed to expanding our inclusive workforce that promotes diverse insights and perspectives.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"We???ve partnered with industry-leaders in almost every sector???and continue to thrive after 40+ years of change by operating with integrity.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Oracle careers open the door to global opportunities where work-life balance flourishes. We offer a highly competitive suite of employee benefits designed on the principles of parity and consistency. We put our people first with flexible medical, life insurance and retirement options. We also encourage employees to give back to their communities through our volunteer programs.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"We???re committed to including people with disabilities at all stages of the employment process. If you would like accessibility assistance or accommodation for a disability at any point, let us know at +1.888.404.2494, Option 1.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Disclaimer:\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Certain US customer or client-facing roles may be required to comply with applicable requirements, such as immunization and occupational health mandates.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Oracle is an Equal Employment Opportunity Employer*. All qualified applicants will receive consideration for employment without regard to race, color, religion, sex, national origin, sexual orientation, gender identity, disability and protected veterans??? status, or any other characteristic protected by law. Oracle will consider for employment qualified applicants with arrest and conviction records pursuant to applicable law.\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Which includes being a United States Affirmative Action Employer\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"}]}',' United States',2000,1000,'2022-11-05 19:46:19','Software Developer','2022-11-21 21:19:00',32,2,1,3),(56,5,'2022-11-05 19:49:13',NULL,'2022-12-29 19:49:13',1,'/api/file/images/upload/26/1667652552703_1667652552703_1665755678671.jpg','{\"ops\":[{\"insert\":\"Why ORACLE + NetSuite???To start, you???ll be surrounded by smart, innovative, caring people ??? invested in our customers and the community. If you???re looking to share your unique perspective and ideas at a collaborative table and help equip all kinds of businesses achieve their visions, check us out.\\nThe Technical Team mainly handles customization and integration requests of customers. We work with other groups such as CSMs and Functional Consultants to make sure each engagement is successful.\\n\\nJob summary:\\nA Technical Consulting position operating independently with some assistance and guidance to provide quality work products to a project team or customer that comply with Oracle NetSuite methodologies and practices. Performs standard duties and tasks with some variation to implement Oracle NetSuite products and technology to meet customer specifications.\\nAs a Technical Consultant, you will help develop custom scripts or workflows that will enhance the system to suit the customer???s unique business process. You will also help the customers on how they can leverage proprietary technologies on top of the platform and incorporate it in their business requirements.\\nSkills we are looking for:\\nExperience in Object Oriented Programming (i.e. Java, .Net, Python, C# etc.)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Javascript will be a big advantage\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"HTML/CSS\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"SQL / DB Mgt is a plus\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Web services is a plus\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Experience in translating business requirements into a technical solution\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"}]}','Philippines ',4000,2000,'2022-11-05 19:49:13','Fullstack Developer','2022-11-21 21:18:50',32,1,2,3),(57,100,'2022-02-05 19:51:43',NULL,'2023-01-17 19:51:43',0,'/api/file/images/upload/26/1667652702853_1667652702853_1665755678671.jpg','{\"ops\":[{\"insert\":\"The ideal candidate will be responsible for developing high-quality applications. They will also be responsible for designing and implementing testable and scalable code.\\n\\nResponsibilities\\nDevelop quality software and web applications\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Analyze and maintain existing software applications\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Design highly scalable, testable code\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Discover and fix programming bugs\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\nQualifications\\nBachelor\'s degree or equivalent experience in Computer Science or related field\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Development experience with programming languages\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"SQL database or relational database skills\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Javascript Experience of atleast 1 year\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"}]}','Philippines ',2000,1000,'2022-02-05 19:51:43','Junior Javascript Developer','2022-11-21 21:17:59',32,1,1,3),(58,10,'2022-03-05 19:58:42',NULL,'2022-04-14 19:58:42',0,'/api/file/images/upload/1/1667653122202_1667653122202_tma.jpg','{\"ops\":[{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"M?? t??? c??ng vi???c: C???ng c??? ki???n th???c chuy??n m??n b???ng c??c kh??a ????o t???o d??nh cho nh??n vi??n m???i t??? 1 - 2 th??ng Tham gia l??m vi???c t???i d??? ??n th???c t??? sau khi ???????c ????o t???o Quy???n l???i: ???????c ????o t???o k??? thu???t v?? c??ng ngh??? tr?????c khi tham gia d??? ??n v???i kh??ch h??ng B???c M???, Ch??u ??u, ??c M???c l????ng th???a thu???n v?? h?????ng 100% l????ng trong th???i gian ????o t???o M??i tr?????ng l??m vi???c chuy??n nghi???p, nhi???u c?? h???i th??ng ti???n ???????c h?????ng ?????y ????? c??c ch??? ????? BHXH, BHYT, BHTN v?? Ch????ng tr??nh B???o hi???m ch??m s??c s???c kho??? to??n di???n Y??u c???u ???ng vi??n: N???m v???ng ki???n th???c n???n t???ng (OOP, c???u tr??c d??? li???u, thu???t to??n) C?? k??? n??ng l???p tr??nh ng??n ng??? Python Bi???t d??ng ??t nh???t m???t Python Framework (nh?? Django, Flask ho???c Pyramid) C?? ki???n th???c v??? ORM Bi???t d??ng c??c c??ng ngh??? front-end (nh?? JavaScript v?? HTML5) C?? t?? duy l???p tr??nh t???t ?????a ??i???m l??m vi???c: C??c v??n ph??ng TMA t???i Q. Ph?? Nhu???n v?? Q.12, TP. H??? Ch?? Minh Thu nh???p: Theo n??ng l???c. C???nh tranh\"},{\"insert\":\"\\n\"}]}','ho chi minh',1000,500,'2022-03-05 19:58:42','Fresher Python Developer - Kh??ng y??u c???u kinh nghi???m','2022-11-21 21:17:48',33,1,1,1),(59,10,'2022-11-05 20:00:17',NULL,'2022-12-15 20:00:17',0,'/api/file/images/upload/1/1667653217139_1667653217139_tma.jpg','{\"ops\":[{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\",\"size\":\"large\"},\"insert\":\"M?? t??? c??ng vi???c: C???ng c??? ki???n th???c chuy??n m??n b???ng c??c kh??a ????o t???o d??nh cho nh??n vi??n m???i t??? 1-2 th??ng Tham gia l??m vi???c t???i d??? ??n th???c t??? sau khi ???????c\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\",\"size\":\"large\"},\"insert\":\"????o t???o Quy???n l???i: ???????c ????o t???o k??? thu???t v?? c??ng ngh??? tr?????c khi tham gia d??? ??n v???i kh??ch h??ng B???c M???, Ch??u ??u, ??c M???c l????ng th???a thu???n v?? h?????ng 100% l????ng trong th???i gian ????o t???o M??i tr?????ng l??m vi???c chuy??n nghi???p, nhi???u c?? h???i th??ng ti???n Y??u c???u ???ng vi??n: N???m v???ng ki???n th???c n???n t???ng (OOP, c???u tr??c d???\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\",\"size\":\"large\"},\"insert\":\"li???u, thu???t to??n) Th??nh th???o v???i quy tr??nh l??m vi???c v???i GIT Ki???n th???c t???t v??? Ruby ho???c Python Ki???n th???c l??m vi???c v??? c?? s??? d??? li???u v?? SQL Hi???u bi???t v??? c??c c??ng ngh??? container (Docker,\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\",\"size\":\"large\"},\"insert\":\"RKT, Kubernetes, v.v.) Kinh nghi???m c?? b???n v???i h??? th???ng CI / CD\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\",\"size\":\"large\"},\"insert\":\"(Jenkins, TeamCity, GoCD, Concourse, v.v.) Kinh nghi???m c?? b???n khi l??m vi???c v???i AWS /\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\",\"size\":\"large\"},\"insert\":\"Google Cloud C?? t?? duy l???p tr??nh t???t ?????a ??i???m l??m vi???c: C??c v??n ph??ng TMA t???i Q. Ph?? Nhu???n v?? Q.12, TP. H???\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\",\"size\":\"large\"},\"insert\":\"Ch?? Minh Thu nh???p: Theo n??ng l???c. C???nh tranh\"},{\"insert\":\"\\n\"}]}','ho chi minh',542,345,'2022-11-05 20:00:17','Fresher DevOps Engineer','2022-11-22 12:59:42',33,1,1,1),(60,200,'2022-04-05 20:02:53',NULL,'2022-12-15 20:02:53',0,'/api/file/images/upload/1/1667653372844_1667653372843_tma.jpg','{\"ops\":[{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"M?? t??? c??ng vi???c: C???ng c??? ki???n th???c chuy??n m??n b???ng c??c kh??a ????o t???o d??nh cho nh??n vi??n m???i t??? 1-2 th??ng Tham gia l??m vi???c t???i d??? ??n th???c t??? sau khi ???????c ????o t???o Quy???n l???i: ???????c ????o t???o k??? thu???t v?? c??ng ngh??? tr?????c khi tham gia d??? ??n v???i kh??ch h??ng B???c M???, Ch??u ??u, ??c M???c l????ng th???a thu???n v?? h?????ng 100% l????ng trong th???i gian ????o t???o M??i tr?????ng l??m vi???c chuy??n nghi???p, nhi???u c?? h???i th??ng ti???n Y??u c???u ???ng vi??n: N???m v???ng ki???n th???c n???n t???ng (OOP, c???u tr??c d??? li???u, thu???t to??n) C?? ki???n th???c v??? l???p tr??nh Java Hi???u bi???t v??? ORM v?? Hibernate/JPA C?? ki???n th???c v??? Spring/Spring Boot Framework v?? Restful API C?? t?? duy l???p tr??nh t???t ?????a ??i???m l??m vi???c: C??c v??n ph??ng TMA t???i Q. Ph?? Nhu???n v?? Q.12, TP. H??? Ch?? Minh Thu nh???p: Theo n??ng l???c. C???nh tranh\"},{\"insert\":\"\\n\"}]}','ho chi minh',500,500,'2022-04-05 20:02:53','Fresher Java Developer','2022-11-21 21:17:35',33,1,1,1),(61,10,'2022-04-05 20:07:56',NULL,'2022-05-15 20:07:56',1,'/api/file/images/upload/1/1667653676157_1667653676157_fpt.jpg','{\"ops\":[{\"insert\":\"FPT Software??Ho Chi Minh City Metropolitan Area??On-site\\n\\nTalent Acquisition Associate\\nJob poster ?? LinkedIn member since August 2021\\n1 mutual connection\\n\"},{\"attributes\":{\"background\":\"var(--color-background-none)\",\"color\":\"var(--color-text-low-emphasis-shift)\",\"link\":\"https://www.linkedin.com/premium/products/?family=jss&destUrl=https%3A%2F%2Fwww%2Elinkedin%2Ecom%2Fjobs%2Fview%2F3342418769%2F&upsellOrderOrigin=premium_job_details_upsell_job_poster\"},\"insert\":\"Message\"},{\"insert\":\"\\nThe ideal candidate is a highly resourceful and innovative developer with extensive experience in the layout, design and coding of websites specifically in PHP format. You must also possess a strong knowledge of web application development using PHP programming language and MySQL Server databases.\\nResponsibilities\\nMaintance Legacy System.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Enhance current features or create new features to adapt with new architecture.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Able to optimize some complicated SQL queries.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Ability to troubleshoot production issues/incidents.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Ability to use monitoring tools - NewRelic, CloudWatch, Splunk.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\nQualifications\\nTechnical Requires:\\nPHP 5.6 -> 7\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Zend Framework 1\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"MySQL\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"AWS Services: Codebuild, Codepipeline, Memcache, ActiveMQ.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Tools: NewRelic, Splunk\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Docker\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\nBenefits\\nSuccessful candidates will be part of a friendly, motivated and committed talent teams in FPT Software HCM (FSOFT) with various benefits and attractive offers:\\nCOMPETITIVE SALARY PACKAGE based on your competent plus Annual Bonus and Project Performance Bonus ???FPT care??? health insurance provided by AON and is exclusive for FPT employees.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Company shuttle buses provide convenient way of transportation for all employees.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Annual Summer Vacation: Base on Company???s policy\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Other allowances: transportation allowance, lunch allowance, working on-site allowance, etc. plus company support for housing in District 9.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"F-Town Campus provide many facilities for FPT Software employees such as football ground, basketball & volleyball, gym & yoga centre, restaurant, cafeteria, etc.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"}]}','ho chi minh',2000,1000,'2022-04-05 20:07:56','PHP Developer','2022-11-21 21:17:28',34,1,1,1),(62,0,'2022-11-05 20:12:22',NULL,'2022-12-15 20:12:22',0,'/api/file/images/upload/1/1667653941530_1667653941530_fpt.jpg','{\"ops\":[{\"insert\":\"Job description:\\n\\nJoining to Software Build - web application on cloud for USA customer\\nDefine and detail the functions, interfaces\\nDetail datatypes/data structures required within the application\\nData models for persistent data requirements\\nClass models with methods, attributes defined. UML Modeling where necessary\\nDetails around business processes, system specific algorithms, etc.\\nReview code and establish best practices.\\n\\nJob qualification:\\n\\nExperience in Angular ??? 2 years\\n- Good verbal and written communication.\\n- Communicate with Solution architect, project members in an agile scrum methodology\\nDEV04: Good technical leadership who can work with other team members to identify and evaluate new technology and tools. Lead or Mentor junior and/or mid-level developers\\nDEV03: More hands-on Development.\\n\\nBenefits:\\n\\nSuccessful candidates will be part of a friendly, motivated and committed talent teams in FPT Software HCM (FSOFT) with various benefits and attractive offers:\\n?? Be able to work in major projects with big customers and exchange knowledge with specialists and experts from top IT corporations\\n?? Be supported preferential buying a department with Senior.\\n?? COMPETITIVE SALARY PACKAGE based on your competent plus Annual Bonus and Project Performance Bonus ???FPT care??? health insurance provided by AON and is exclusive for FPT employees.\\n?? 18 Leave day (12 Annual leave, 6 Sick Leave)\\n?? Annual Summer Vacation: 1-6 Million Cash, 1-3 Leave holiday\\n?? Annual health check up\\n?? Udemy Premium account for one year\\n?? English class, sponsor for taking certification as: PMP, AWS???\\n?? 13th month Salary\\n?? Other allowances: transportation allowance, lunch allowance, working on-site allowance, etc.\\n?? Company shuttle buses provide convenient way of transportation for all employees.\\n?? F-Town Campus provide many facilities for FPT Software employees such as football ground, basketball & volleyball, gym & yoga centre, restaurant, cafeteria, etc.\\n\\n\\n\"}]}','Da Nang',500,200,'2022-11-05 20:12:22','Angular Developer','2022-11-21 21:17:17',34,1,1,1),(63,10,'2022-11-05 20:16:54',NULL,'2022-12-15 20:16:54',1,'/api/file/images/upload/1/1667654214031_1667654214030_embedded.jpg','{\"ops\":[{\"insert\":\"About Project\\nYou will take part in multi-million project for high-profile customer, which are automotive industry leaders Japan.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"You will design solution for embedded software used in a car such as Autosar software.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"You have a great career advance to expand your horizon not only in automotive industry but also the international working experience\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\nResponsibilities\\nDevelopment and maintenance of the Device drivers for various microcontrollers\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Work with various kinds of microcontroller from Renesas, ST, ???\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Perform design, analysis and integrated testing on hardware and software, system diagnostic and failure management\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\nQualifications\\nMust have:\\nAt least 1 years??? experience in programming in C, Embedded system development\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Experience in the development, configuration, or testing of any of the following areas: AUTOSAR Basic Software (BSW) e.g. CAN stack, ETH stack, Memory stack, Diagnostic stack , Microcontroller Abstraction Layer (MCAL), ECU Abstraction Layer.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Good Development experience on 16/32 bit microcontroller families like Renesas, ST, ...\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Excellent knowledge on Compilers, Debuggers for different micro-controllers\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Good knowledge of hardware, software embedded system concepts and architecture.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Good understanding of the embedded software build process (compiling, linking, programming, etc.).\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Ability and ease with using lab tools such as debuggers, emulators, oscilloscopes, etc.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Experience with configuration management software (SVN, GIT)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Ability to analyze / study new technical, new hardware\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Excellent teamwork and communication skills.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Good at English communication\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\nNice to have:\\nASPICE development process\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Functional Safety Experience (ISO 26262)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Overall understanding of automotive system\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"}]}','ha noi',3000,2000,'2022-11-05 20:16:54','Embedded Software Engineer','2022-11-21 21:17:09',34,1,2,1),(64,10,'2022-11-05 20:35:38',NULL,'2022-12-15 20:35:38',0,'/api/file/images/upload/1/1667655337582_1667655337578_KMS.jpg','{\"ops\":[{\"insert\":\"KMS was established in 2009 as a U.S.-based software development & consulting company with development centers in Vietnam. Over 13 years of operation, we have been trusted globally for the superlative quality of software services, products, technology solutions and engineers\' expertise.\\n\\nKMS Technology focuses on custom software development and a wide variety of consulting services\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"KMS Healthcare specialises in the healthcare industry, provides a unique blend of consultative healthcare technology solutions backed by the power of full lifecycle development support\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"KMS Solutions serves the Asia Pacific region, bringing the world\'s innovative technologies to help organizations achieve their business goals through world-class digital capabilities and fit-for-purpose solutions\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\\nBesides providing services, KMS builds and successfully launches its own software companies through its internal startup incubator, KMS Labs. The most notable companies with millions of users worldwide include QASymphony, Kobiton, Katalon, Grove, and Visily.\\n\\n\\nKMS is committed to providing tangible contributions and long-lasting impacts to the communities through leveraging our IT expertise. The company has also been recognized by prestigious industry awards as a great workplace in Vietnam, Asia, and the U.S. for many years in a row.\\n\\nJob Description\\n\\nYour key responsibilities:\\n\\nUnderstand and support the client\'s requirements\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Follow your passion\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Enjoy every single working day with your nice colleagues and our kind clients\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Take your skill to the next level\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\\nThe responsibility includes design, coding, troubleshooting, and working with the project team as well as customers on features/bug fixes\\n\\nQualifications\\n\\nYour key qualifications:\\n\\nFinal year student/ new graduate/ less than 1 year of experience\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Ready to work full-time\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Passion for .NET technology\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Strong fundamental of .NET Framework, C#, SQL, OOP, data structure and algorithms\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Understanding thoroughly of projects being done in university or during the internship\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Good English skills (especially reading and writing)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Have good communication and be a good team-player\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\\nAdditional Information\\n\\nPerks you Enjoy\\n\\nWorking in one of the Best Places to Work in Vietnam\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Building large-scale & global software products\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Working & growing with Passionate & Talented Team\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Diverse careers opportunities with Software Outsourcing, Software Product Development, IT Solutions & Consulting\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Attractive Salary and Benefits\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Performance appraisals every year\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Onsite opportunities: short-term and long-term assignments in North American (U.S, Canada), Europe, Asia.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Flexible working time\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Various training on hot-trend technologies, best practices, and soft skills\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Premium healthcare insurance for you and your loved ones\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Company trip every summer, big annual year-end party every year, team building, etc.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Fitness & sports activities: football, tennis, table-tennis, badminton, yoga, swimming???\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Joining community development activities: 1% Pledge, charity every quarter, blood donation, public seminars, career orientation talks,???\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Free in-house entertainment facilities (foosball, ping pong, gym???), coffee (latte, cappuccino, espresso), and snack (instant noodles, cookies, candies???)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\nAnd much more...Send your??\"},{\"attributes\":{\"underline\":true},\"insert\":\"Resume including Academic Transcript\"},{\"insert\":\"??to join us and let yourself explore other fantastic things!\\nBenefits found in job post\"},{\"attributes\":{\"header\":3},\"insert\":\"\\n\"},{\"insert\":\"Medical insurance\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"}]}','Da Nang',2000,1000,'2022-11-05 20:35:38','Fresher .Net Software Engineer','2022-11-21 21:15:37',35,1,1,1),(65,10,'2022-11-05 20:47:00',NULL,'2022-12-15 20:47:00',0,'/api/file/images/upload/1/1667656019819_1667656019819_KMS.jpg','{\"ops\":[{\"insert\":\"About the job\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Company Description\"},{\"insert\":\"\\n\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"KMS was established in 2009 as a U.S.-based software development & consulting company with development centers in Vietnam. Over 13 years of operation, we have been trusted globally for the superlative quality of software services, products, technology solutions and engineers\' expertise.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"KMS Technology focuses on custom software development and a wide variety of consulting services\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"KMS Healthcare specialises in the healthcare industry, provides a unique blend of consultative healthcare technology solutions backed by the power of full lifecycle development support\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"KMS Solutions serves the Asia Pacific region, bringing the world\'s innovative technologies to help organizations achieve their business goals through world-class digital capabilities and fit-for-purpose solutions\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Besides providing services, KMS builds and successfully launches its own software companies through its internal startup incubator, KMS Labs. The most notable companies with millions of users worldwide include QASymphony, Kobiton, Katalon, Grove, and Visily.\"},{\"insert\":\"\\n\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"KMS is committed to providing tangible contributions and long-lasting impacts to the communities through leveraging our IT expertise. The company has also been recognized by prestigious industry awards as a great workplace in Vietnam, Asia, and the U.S. for many years in a row.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Job Description\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Execute all testing activities to improve product quality, work closely with the team (developers, business analysis, customer service, operation, etc.) to deliver the product success\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Address the test automation needs in a methodical, detail-oriented manner with the help of robust analytical skills and problem-solving capacity\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Automate functional, regression and/or performance acceptance tests\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Have complete responsibility to enhance end-to-end automated test coverage\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Participate in sprint planning and work closely with the Scrum team to analyze requirements and provide necessary test recommendations\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Qualifications\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Strong experience in developing test automation for web services and web application\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"2+ years of experience in creating and running automated tests using testing frameworks like Katalon/Appium/Selenium/etc.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Solid testing experiences (test strategy, test approach, test plan, test techniques included black box, risk-based, exploratory, Non-UI testing, etc.)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Good knowledge of the software development process, especially the software testing process\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Have experience on UI testing with Selenium, API testing, Java technology\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Additional Information\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Perks You\'ll Enjoy\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Working in one of the Best Places to Work in Vietnam\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Building large-scale & global software products\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Working & growing with Passionate & Talented Team\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Diverse careers opportunities with Software Outsourcing, Software Product Development, IT Solutions & Consulting\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Attractive Salary and Benefits\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Two performance appraisals every year and performance bonus\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Onsite opportunities: short-term and long-term assignments in North American (U.S, Canada), Europe, Asia.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Flexible working time\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Various training on hot-trend technologies, best practices and soft skills\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Premium healthcare insurance for you and your loved ones\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Company trip, big annual year-end party every year, team building, etc.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Fitness & sport activities: football, tennis, table-tennis, badminton, yoga, swimming,???\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Joining community development activities: 1% Pledge, charity every quarter, blood donation, public seminars, career orientation talks,???\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Free in-house entertainment facilities (foosball, ping pong, gym???), coffee, and snack (instant noodles, cookies, candies???)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"And much more, join us and let yourself explore other fantastic things!\"},{\"insert\":\"\\n\"}]}','Can Tho',1000,500,'2022-11-05 20:47:00','Automation Test Engineer (UI, API Testing)','2022-11-21 21:15:24',35,1,1,1),(66,10,'2022-11-05 21:02:08',NULL,'2022-12-15 21:02:08',1,'/api/file/images/upload/1/1667656926734_1667656926734_HoangLinhPlus.png','{\"ops\":[{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"A rapidly-growing company offering affordable world-class IT solutions that are responsive and customer-focused is looking for a Full-Stack Developer. The developer will be in charge of improving scalability, service reliability, capacity, and performance. The company is offering businesses across the world a host of IT-related services. This will be a full-time position that offers amazing opportunities for developers to grow their careers.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Job Responsibilities:\"},{\"insert\":\"\\n\\nDevelop the web architecture for the company???s platform\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Collaborate effectively across cross-functional teams to meet the company???s goals\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Enhance the performance and responsiveness of the web applications\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Help form and maintain engineering best practices in the organization\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Job Requirements:\"},{\"insert\":\"\\n\\nBachelor???s/Master???s degree in Engineering, Computer Science (or equivalent experience)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"At least 3+ years of relevant experience as a full-stack developer\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Extensive experience in Node.js, Java, Angular, and JavaScript\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Nice to have experience in HTML, CSS, and SQL\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Fluent in verbal and written English\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"}]}','Ho Chi Minh',1000,200,'2022-11-05 21:02:08','Remote Full-Stack Developer Jobs','2022-11-21 21:14:06',36,1,1,1),(67,10,'2022-11-05 21:46:11',NULL,'2022-12-15 21:46:11',5,'/api/file/images/upload/27/1667659571124_1667659571124_chotot.jpg','{\"ops\":[{\"insert\":\"About the job\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"At??Cho Tot, we rely on powerful and insightful data to power our systems and make data-driven solutions. As a Analytics Engineer in??Cho Tot, you are accountable for delivering highest quality data, data models to help business get insights, make impactful decision to drive the best performance of Chotot products overall.\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"You will have the autonomy to lead data analytics projects and solve real-life business problems by working together with a core team of passionate Business Analyst, Data Engineer, and AI Engineer.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"What will you be doing?\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Provide clean, transformed data ready for analysis. Turn vast amount of data into insightful, ease to use, automated business intelligent report\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Apply software engineering best practice to analytics code (version control, testing, continuous integration)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Responsible for data quality including: design, plan, build, and maintain report system of overall Chotot???s Data Quality\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Responsible for data consistency, data usages across organization: build and maintain data documentation, definitions, sync to Chotot???s data discovery platform, broadcast data metrics across the org\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Train business users on using data visualization tools, standardize reporting system\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Collaborate closely with Business Analyst, Data Engineer to provide good quality data with minimum time\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"What do you need for the role?\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"1+ years of related experience in Data Engineering, Analyst Engineer roles with BSc, MSc degree in Computer Science related fields\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Expertise in SQL. Git is required. Python and Linux script is a plus.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Experience with Google Studio, Superset, Looker, PowerBi is a plus\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Expertise in data modeling for analysis, data warehouse building\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Must be excellent??in communicate technical ideas and results to non-technical partners in written and verbal form\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Self-motivated, detail-oriented, and responsible.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Strong project management and organizational skills.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"What???s in it for you?\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Join plenty of Sharing and Learning activities as part of our initiatives to contribute to the tech community in Vietnam\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Get 15 days of annual leave and 5 days of sick leave per year\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Health insurance for employee and their family members\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Get 13th month salary and annual performance bonus\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Participate in regular team building activities and company parties\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Get opportunities to attend training courses abroad\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Most importantly, the code you write will be impacting the lives of millions!\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Thank you for taking your time to read our job description and thank you in advance if you decide to apply for this position. Shortlisted candidates will be contacted within 2 weeks since application, otherwise we might meet when another chance arises.\"},{\"insert\":\"\\n\\n\"}]}','Da Nang',2000,1000,'2022-11-05 21:46:11','Analytics Engineer','2022-11-21 21:13:55',37,1,2,1),(68,4,'2022-11-05 22:12:07',NULL,'2022-12-15 22:12:07',1,'/api/file/images/upload/27/1667661126746_1667661126746_chotot.jpg','{\"ops\":[{\"insert\":\"About the job\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Chotot technology foundation is growing and expanding to power our next level of growth, serving tens of millions of Vietnamese via our digital products. Our Site Reliability Engineering team work day to day with all open source CNCF projects, building robust platform, automation and data engineering pipeline that enabling continuous releases of hundred of microservices.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Join us to build systems that serve more than hundreds of millions of requests and make use of data pipes having more than billion of messages passing through daily. You will be solving big scale distributed system problem in a fast pace agile software development for internet digital product.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Responsibilities:\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"This is a key role that should have the engineering knowledge, production experience and hands-on implementation ability. You will work with Chotot Site Reliability Engineering as well as the bigger regional tech group that Chotot is a member of. Your responsibilities include:\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Ensure the highest levels of production system performance, availability and scalability.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Automate the provisioning of infrastructure (on-premise and cloud), system and software.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Design and operate the build & release, configuration management, code deployments to multiple environments.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Work closely with the development team to integrate new deployment processes and strategies.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Seek out problem or opportunity in the critical high impact area and solve them.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Minimum qualifications:\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Hands-on in Python and any of Bash/Perl/Golang.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Experienced with Golang, React or NodeJS\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Hands-on experience in the Cloud (GCP or AWS) ecosystem and tooling.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Hands-on experience in Terraform or similar software like Ansible/Chef.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Have foundation and knowledge of operating systems, database and distributed systems fundamentals.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Understanding and full experience in DevOps development culture, principle and practices.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Self-motivated, detailed oriented and responsible.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Very well command of English in both reading and writing.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Preferred qualifications:\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Production experience in using and operating software services that utilize: Kubernetes, Kafka, PostgreSQL, MongoDB, ElasticSearch, Prometheus.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Ability to drive sound architecture, implementation & technical investigations through hands-on development plus systematically planning and execution.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Enjoy learning and ramping up on new technologies quickly.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Professional Certification preferred, ideally in Google Cloud Platform and Amazon.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"BSc, MSc in Computer Science or Engineering or equivalent.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Benefit:\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Join plenty of Sharing and Learning activities as part of our initiatives to contribute to the tech community in Vietnam\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Get 15 days of annual leave and 5 days of sick leave per year\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Health insurance for employee and their family members\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Get 13th month salary and annual performance bonus\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Participate in regular team building activities and company parties\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Get opportunities to attend training courses abroad\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Most importantly, the code you write will be impacting the lives of millions!\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Thank you for taking your time to read our job description and thank you in advance if you decide to apply for this position. Shortlisted candidates will be contacted within 2 weeks since application, otherwise, we might meet when another chance arises.\"},{\"insert\":\"\\n\\n\"}]}','Ho Chi Minh',700,500,'2022-11-05 22:12:07','DevOps Engineer','2022-11-21 21:20:55',37,1,2,1),(69,3,'2022-11-06 06:56:29',NULL,'2022-12-16 06:56:29',0,'/api/file/images/upload/27/1667692588570_1667692588570_Plume.jpg','{\"ops\":[{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Life at Plume\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"At Plume, we believe that technology isn\'t about moving faster, it\'s about making life\'s moments better. Which is why we\'ve built the world\'s first, and only, open and hardware-independent service delivery platform for smart homes, small businesses, enterprises, and beyond. Our SaaS platform uses WiFi, advanced AI, and machine learning to create the future of connected spaces???and human experiences???at massive scale.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"We now deliver services to over 40 million locations globally and have managed over 1.6 billion devices on our platform. We\'re expanding rapidly, pioneering a new category, and we achieved our Series F funding in just four years. Our customers include many of the world\'s largest Communications Service Providers (CSPs) who look to Plume to help them evolve their smart home offerings while gleaning insights from their own data.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"With a bias for action and a love for being trailblazers, the team at Plume embodies a combination of relentless curiosity and imaginative innovation. We challenge ourselves to think in ways that other companies don\'t, work to do what should be done (rather than what can), and if we can\'t do it exceptionally well, we don\'t do it. It\'s how we\'ve assembled a team of world-class builders, thinkers, and doers. And it\'s how we\'re reinventing what\'s possible every day.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Mobile Development QA Engineer\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Plume Design, Inc. is a Pre-IPO startup valued at $2.6B and has developed the world\'s first service delivery platform for the smart home, delivering the world\'s best performing home WiFi system. Our mobile and tablet apps are the gateway to our experiences and the critical surfaces through which users interact with our products. We are looking to add to our Mobile QA Engineer team to support our manual testing of native IOS/Android mobile applications for smart-homes and smart-business wifi.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"What You\'ll Do\"},{\"insert\":\"\\nWork with the developers and product managers to create a test plan for the Mobile features.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Establish key performance metrics for the pass and the fail criteria of the test cases.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Perform manual regression, acceptance, ad hoc and exploratory testing.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Contribute towards automation of the test cases.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Establish and improve our quality processes and development processes continuously\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Take ownership of our manual test suite (create and execute test scenarios)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"What You\'ll Bring\"},{\"insert\":\"\\n3+ years experience to support our manual testing of native IOS/Android mobile applications\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Experience with Xcode and Android Studio\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Fluency in spoken and written English is mandatory\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Familiar with QA tools and processes (i.e. Jira, Confluence or TestRail)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Knowledge of agile principles and practices\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Basic knowledge of Git\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Basic knowledge of programming (Kotlin or Swift is a plus)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Strong passion for iOS or Android mobile applications\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Basic experience with test automation tools is a plus\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Basic knowledge of python is advantage\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Close attention to details\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Structured and a process-driven mindset\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"About Plume\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"As the creator of the only open, hardware-independent, cloud-controlled experience platform for CSPs and their subscribers, Plume partners with over 250 CSP customers, including some of the world\'s largest such as Comcast, Charter, Liberty Global, and J:COM.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Using OpenSync, the most widely supported open-source, silicon-to-cloud framework for smart spaces, Plume\'s software-defined network allows CSPs to decouple their service offerings from hardware and rapidly curate and deliver new services over a multi-vendor, open-platform architecture.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Backed by investors such as Insight Partners and SoftBank Vision Fund 2, Plume is now valued at $2.6B, having added over $500M in funding in 2021 alone.\"},{\"insert\":\"\\n\"}]}','Ho Chi Minh',1500,1000,'2022-11-06 06:56:29','Mobile Development QA Engineer','2022-11-21 21:11:07',38,1,1,3),(70,6,'2022-11-06 06:57:56',NULL,'2022-12-16 06:57:56',0,'/api/file/images/upload/27/1667692676361_1667692676361_Plume.jpg','{\"ops\":[{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"ife at Plume\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"At Plume, we believe that technology isn\'t about moving faster, it\'s about making life???s moments better. Which is why we???ve built the world\'s first, and only, open and hardware-independent service delivery platform for smart homes, small businesses, enterprises, and beyond. Our SaaS platform uses WiFi, advanced AI, and machine learning to create the future of connected spaces???and human experiences???at massive scale.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"We now deliver services to over 40 million locations globally and have managed over 1.6 billion devices on our platform. We???re expanding rapidly, pioneering a new category, and we achieved our Series F funding in just four years. Our customers include many of the world\'s largest Communications Service Providers (CSPs) who look to Plume to help them evolve their smart home offerings while gleaning insights from their own data.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"With a bias for action and a love for being trailblazers, the team at Plume embodies a combination of relentless curiosity and imaginative innovation. We challenge ourselves to think in ways that other companies don\'t, work to do what should be done (rather than what can), and if we can???t do it exceptionally well, we don???t do it. It???s how we\'ve assembled a team of world-class builders, thinkers, and doers. And it???s how we???re reinventing what???s possible every day.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Location: Ljubljana, Slovenia\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Summary\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Plume develops and deploys cloud based control planes with scale to manage tens of millions of customer homes through some of the world???s largest Internet Service Providers. Our cloud applications include WiFi network management and optimisation, device access control, network provisioning, IoT security, and end customer user interaction through mobile apps.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"We are growing our team and looking for a student to join as a Junior Tester on our Web QA team. This is an entry-level role with great learning and advancement possibilities. If you have passion for finding bugs, are detail oriented and have excellent English skills, join us and become a part of our growing global team of smart, pragmatic and collaborative engineers.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"The Role\"},{\"insert\":\"\\nCarrying out manual tests to ensure our web-based applications are meeting system requirements and specifications\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Executing well-defined test runs\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Creating precise bug reports for any issues found during testing\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Reproducing and verifying bugs found during testing\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Communicating test efforts and status on current projects\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Participating in team meetings\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Who You Are\"},{\"insert\":\"\\nCurrently studying or have recently completed a BA/BS/MS in Computer Science, Computer Engineering, Information Systems or related technical field\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"You have exceptional attention to detail and ability to maintain focus\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Excellent oral and written English language skills, additional languages will be considered a plus (German, Spanish, French, Japanese)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"You are an advanced user of both Windows and Mac operating systems\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Previous experience with manual testing is welcome, but not required\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Knowledge of any modern agile tool, preferably JIRA and Confluence\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Knowledge of any test case management software, especially TestRail, will be considered a plus\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"What We Offer\"},{\"insert\":\"\\nAn opportunity to gain experience as a student and convert to a full-time employee\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"A combination of working from home and from the office\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Top-notch equipment\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Smart and talented team to learn from\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"About Plume\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"As the creator of the only open, hardware-independent, cloud-controlled experience platform for CSPs and their subscribers, Plume partners with over 250 CSP customers, including some of the world???s largest such as Comcast, Charter, Liberty Global, and J:COM.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Using OpenSync, the most widely supported open-source, silicon-to-cloud framework for smart spaces, Plume???s software-defined network allows CSPs to decouple their service offerings from hardware and rapidly curate and deliver new services over a multi-vendor, open-platform architecture.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"color\":\"rgba(0, 0, 0, 0.9)\"},\"insert\":\"Backed by investors such as Insight Partners and SoftBank Vision Fund 2, Plume is now valued at $2.6B, having added over $500M in funding in 2021 alone.\"},{\"insert\":\"\\n\"}]}','Ha Noi',700,578,'2022-11-06 06:57:56','Manual WEB Tester - Student','2022-11-21 21:09:46',38,2,1,2),(71,3,'2022-11-06 07:07:03',NULL,'2022-12-16 07:07:03',0,'/api/file/images/upload/27/1667693222635_1667693222632_Plume.jpg','{\"ops\":[{\"insert\":\"Opportunity\\nPlume Design, Inc. is a Pre-IPO startup valued at $2.6B and has developed the world???s first service delivery platform for the smart home, delivering the world\'s best performing home WiFi system. Our mobile and tablet apps are the gateway to our experiences and the critical surfaces through which users interact with our products. We have highly visible opportunities to Senior iOS engineers to take our iOS app to the next level of functionality. In concert with Android, Cloud, Product, Design and Hardware teams, you will help drive development from toolchain selection through to implementation and reporting.\\n\\nWe???re in search of a talented developers and independent thinkers, excited to fundamentally change the way people think about their connected lives. We\'re looking for more than an order taker.\\n\\nWhat You\'ll Do\\nDesign and implement new user-facing features in Plume\'s iOS app, focused on consumer electronics products and experiences.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Define and implement app coding architectures to allow for future feature growth and maintainability.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Collaborate with cross-functional teams to define, design, and ship new features.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Unit-test code for robustness, including edge cases, usability, and general reliability.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Work on bug fixing and improving application performance.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Work hand-in-hand with product designers to implement a visual and animated experience that is top in class.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Continuously discover, evaluate, and implement new technologies to maximize development efficiency.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\nWhat You\'ll Bring\\nBA/BS degree in Computer Science or related technical field or equivalent practical experience.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"5+ years industry experience developing Swift based iOS mobile apps released to App Store.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Developed applications with a strong focus on animation, UI, design, and usability.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Experience working on consumer electronics products a plus.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Experience with Clean Architecture a plus.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"}]}','Ho Chi Minh',2500,2000,'2022-11-06 07:07:03','Senior IOS Developer','2022-11-21 21:09:30',38,1,2,2),(72,3,'2022-11-06 07:17:21',NULL,'2022-12-16 07:17:21',1,'/api/file/images/upload/28/1667693841166_1667693841166_acb.png','{\"ops\":[{\"insert\":\"C??C PH??C L???I D??NH CHO B???N\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"H?????ng m???c l????ng c???nh tranh th??? tr?????ng c??ng c??c kho???n th?????ng h???p l?? kh??c t????ng x???ng v???i s??? ????ng g??p\"},{\"attributes\":{\"list\":\"ordered\"},\"insert\":\"\\n\"},{\"insert\":\"????o t???o chuy??n s??u, n??ng cao ki???n th???c cho nh??n vi??n v???i c??c chuy??n gia ?????u ng??nh\"},{\"attributes\":{\"list\":\"ordered\"},\"insert\":\"\\n\"},{\"insert\":\"L??? tr??nh th??ng ti???n r?? r??ng ph?? h???p cho t???ng v??? tr?? ho???c t???ng c?? nh??n\"},{\"attributes\":{\"list\":\"ordered\"},\"insert\":\"\\n\"},{\"insert\":\"\\nM?? T??? C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"ACB Fintech: we???re building a startup at ACB to serve our millions of customers. We???re looking for exceptional talent to drive growth. Shape the management team that will deliver world-class technology to acquire the next million customers.\\n\\nResponsibilities:\\n\\n+ Develop methodologies and practices for innovative, interactive technologies in collaboration with tech leads, the UX team, and designers.\\n+ Collaborate with back-end developers to implement front-end templates, HTML, CSS, Javascript, and ReactJS.\\n+ Participate in code and design reviews to maintain our high development standards\\n+ Design and develop highly performant user interfaces\\n+ Execute refactoring and optimization of existing code where necessary\\n+ Monitor website performance and both identify the rectify usability issues\\n+ Quality assurance and unit testing of deliverables developed based on technical specifications\\n\"},{\"attributes\":{\"background\":\"transparent\",\"color\":\"#005aff\"},\"insert\":\"Xem to??n b??? M?? T??? C??ng Vi???c\"},{\"insert\":\"\\nY??U C???U C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"Requirements:\\n+ At least 3 years of professional experience working with Frontend (ReactJS JavaScript???)\\n+ Solid understanding of HTML, CSS, and JavaScript fundamentals and software design best practices.\\n+ Ability to think and write scalable modular code.\\n+ Ability to write well-documented, clean JavaScript code.\\n+ Solid knowledge of working with third-party dependencies and debugging dependencies.\\n+ Experience working with AWS Services is a plus but not required.\\n+ Familiarity with mocha and cypress testing frameworks.\\n+ Experience in design and experience with the collaborative interface design tool.\\n+ Experience with CI/CD pipeline.\\n+ UI/UX skills.\\n\\nCompany Benefits:\\n+ Best place to work in Asia for 4 consecutive years from 2018 to 2022.\\n+ Competitive salary based on each individual\'s knowledge and experience\\n+ Fixed 13th month salary\\n+ Bonus based on productivity and work efficiency at the end of the year: 1-4 months\' salary (depending on performance ranking)\\n+ Bonus on holidays and bank birthdays, mid-autumn gifts, etc.\\n+ Dynamic and creative environment, maximize personal capacity, good working conditions, full facilities, and equipment.\\n+ Participating in extracurricular activities (Team building, sports festivals, art...).\\n+ Participating in many kinds of training courses for improving skills and professional competence.\\n\"}]}','Can Tho',2000,1000,'2022-11-06 07:17:21',' IT - Frontend Developer (React JS)','2022-11-21 21:07:30',39,1,2,3),(73,1,'2022-11-06 07:21:21',NULL,'2022-12-16 07:21:21',0.5,'/api/file/images/upload/28/1667694080795_1667694080795_acb.png','{\"ops\":[{\"insert\":\"JOB DESCRIPTION\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"- Ph??t tri???n kh??ch h??ng\\n- Ti???p nh???n nhu c???u, t?? v???n v?? h?????ng d???n kh??ch h??ng s??? d???ng s???n ph???m d???ch v??? ACB.\\n- ?????u m???i h?????ng d???n kh??ch h??ng th???c hi???n c??c giao d???ch ho???c h?????ng d???n kh??ch h??ng ti???p x??c c??c ch???c danh kh??c ????? th???c hi???n c??c giao d???ch t???i k??nh ph??n ph???i theo qui ?????nh.\\n- Ch??m s??c kh??ch h??ng\\n- Ch??m s??c kh??ch h??ng,nh???c n??? / th??c n??? kh??ng ????? b??? tr??? h???n.\\n- Ti???p nh???n v?? gi???i quy???t nhanh ch??ng nh???ng kh?? kh??n v?????ng m???c kh??ch h??ng g???p ph???i.\\n- Th???m ?????nh v?? ????? xu???t c???p t??n d???ng trong ph???m vi ???????c ph??n c??ng.\\nJOB REQUIREMENTS\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"- T???t nghi???p ??H h??? t???p trung d??i h???n, ch??nh quy c??c tr?????ng ??H trong n?????c ho???c ??H n?????c ngo??i (???????c qu???c t??? c??ng nh???n), t???t nghi???p lo???i TB Kh?? tr??? l??n, chuy??n ng??nh: Kinh t???, T??i ch??nh, Ng??n h??ng, Qu???n tr??? kinh doanh.\\n- Ti???ng Anh tr??nh ????? B tr??? l??n, th??nh th???o tin h???c v??n ph??ng.\\n- S???c kho??? t???t, ngo???i h??nh d??? nh??n. Nam cao t??? 1.65m, N??? cao t??? 1.55m tr??? l??n, ????? tu???i kh??ng qu?? 32.\\n- ??u ti??n ???ng vi??n c?? kinh nghi???m ??? v??? tr?? t????ng ??????ng\\n\"}]}','Ha Noi',1200,700,'2022-11-06 07:21:21','NHN - Chuy??n Vi??n Quan H??? Kh??ch H??ng C?? Nh??n','2022-11-21 21:07:13',39,1,1,1),(74,1,'2022-11-06 07:38:43',NULL,'2022-12-16 07:38:43',1,'/api/file/images/upload/28/1667695123021_1667695123021_language_link.png','{\"ops\":[{\"insert\":\"C??C PH??C L???I D??NH CHO B???N\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"A dynamic, professional environment with development opportunities for career path\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Premium Health care package\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"16 annual leave and 3 paid sick leave days per year\\nM?? T??? C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"1. M???c ti??u c??ng vi???c c???a Regional Head Teaching Assistant (RHTA - Qu???n l?? Tr??? gi???ng)\\n- Qu???n l?? c??c tr??? gi???ng trong khu v???c ???????c ph??n c??ng ????? ?????m b???o ch???t l?????ng gi??? d???y, h??? tr??? t???t gi??o vi??n n?????c ngo??i v?? ng??y c??ng n??ng cao ch???t l?????ng ch????ng tr??nh gi???ng d???y\\n\\n2. Nhi???m v???\\n- C???p nh???t t??nh h??nh h??ng tu???n v???i c??c tr??? gi???ng, d??? gi??? v?? ????nh gi?? ??t nh???t 2 l???n/h???c k?? v???i s??? l?????ng tr??? gi???ng t??? 35 - 40 b???n\\n- Tham gia v??o qu?? tr??nh tuy???n ch???n, ????o t???o tr??? gi???ng m???i, c?? k??? ho???ch b???i d?????ng tr??? gi???ng ?????nh k?? trong su???t n??m h???c\\n- ????nh gi?? n??ng l???c chuy??n m??n c???a tr??? gi???ng v??o cu???i m???i n??m h???c\\n- H??? tr??? tr??? gi???ng gi???i quy???t c??c v???n ????? ph??t sinh bao g???m nh???ng b???t c???p v??? h???c sinh, gi??o vi??n n?????c ngo??i, m???i quan h??? gi???a tr??? gi???ng v?? nh?? tr?????ng, c?? s??? v???t ch???t???\\n- Ki???m tra v?? ch???m b??i t???p v??? nh?? cho h???c sinh thu???c c??c nh??m l???p ???????c ph??n c??ng\\n- D???y c??c nh??m l???p ???????c ph??n c??ng (8 - 10 ti???t m???i tu???n) v?? t???o ??i???u ki???n cho c??c tr??? gi???ng kh??c ???????c d??? gi???\\n- Tham gia c??c kh??a b???i d?????ng n??ng l???c cho nh??n vi??n\\n\\n3. Th???i gian & ?????a ??i???m l??m vi???c:\\n- Th???i gian: 8h30 - 17h30 t??? Th??? Hai ?????n Th??? S??u\\n- ?????a ??i???m: 1 trong 3 v??n ph??ng t???i Ho??ng ?????o Th??y, Long Bi??n ho???c ?????i C??? Vi???t\\n\\n***QUY???N L???I***\\n- Thu nh???p th???a thu???n\\n- Ch??? ????? ngh??? ph??p l??n ?????n 19 ng??y/n??m\\n- Tham gia BHXH ?????y ?????, ch??? ????? ch??m s??c s???c kh???e theo PTI Care\\n- Nhi???u h???c b???ng h???c Ti???ng Anh mi???n ph?? cho nh??n vi??n v?? con c??i c???a nh??n vi??n\\n- M??i tr?????ng l??m vi???c b??i b???n, c?? h??? th???ng v?? ??a v??n h??a\\n- Nhi???u c?? h???i h???c t???p, ????o t???o b??i b???n v??? Teaching Methodology t??? c??c chuy??n gia c???p cao\\n- Nhi???u c?? h???i th??ng ti???n l??n c??c v??? tr?? Senior ho???c Manager n???u ?????t k???t qu??? c??ng vi???c t???t\\nY??U C???U C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"- ????? tu???i t??? 28 tr??? l??n, t???t nghi???p ?????i h???c ch??nh quy chuy??n ng??nh S?? ph???m/ Ng??n ng??? Anh\\n- Ngo???i h??nh s??ng, giao ti???p t???t c??? ti???ng Anh l???n ti???ng Vi???t\\n- Kinh nghi???m d???y h???c/ tr??? gi???ng t??? 3 n??m tr??? l??n\\n- ???? c?? kinh nghi???m qu???n l?? v?? ??i???u ph???i tr??? gi???ng ??t nh???t 1 n??m tr??? l??n, ??u ti??n c??c b???n c?? kinh nghi???m trong c??ng t??c tuy???n d???ng v?? ????o t???o tr??? gi???ng\\n- C??c k??? n??ng c???n thi???t: Giao ti???p, thuy???t ph???c, ph??n t??ch, gi???i quy???t v???n ?????, l??n k??? ho???ch v?? qu???n l??\\n- C?? tinh th???n h???c h???i v?? th??i ????? t??ch c???c khi gi???i quy???t c??c v???n ?????\\n- C?? k?? n??ng m??y t??nh t???t v??? MS Office, Excel v?? Power Point\\n- Kh??ng ng???i di chuy???n li??n t???c\\n?????A ??I???M L??M VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"34T Ho??ng ?????o Th??y - Thanh Xu??n - H?? N???i\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Nguy???n S??n, Long Bi??n\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"24 ?????i C??? Vi???t, Le Dai Hanh, Hai B?? Tr??ng District, Hanoi, Vietnam\\n\"}]}','Ho Chi Minh',500,300,'2022-11-06 07:38:43','Qu???n L?? Tr??? Gi???ng Ti???ng Anh (Rhta)','2022-11-21 21:06:59',40,1,3,1),(75,1,'2022-11-06 07:40:47',NULL,'2022-12-16 07:40:47',0,'/api/file/images/upload/28/1667695247252_1667695247252_language_link.png','{\"ops\":[{\"insert\":\"C??C PH??C L???I D??NH CHO B???N\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Thu nh???p 15 - 20 tri???u/th??ng + Ph??? c???p ??i???n tho???i, x??ng xe\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"B???o hi???m x?? h???i ?????y ?????, t???ng th??? ch??m s??c s???c kh???e PTI\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"H???c b???ng h???c Ti???ng Anh mi???n ph?? cho ng?????i lao ?????ng v?? con c??i\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"M?? T??? C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"Ch????ng tr??nh Ti???ng Anh li??n k???t tr?????ng h???c Schools Link c???n t??m 1 b???n Ph??t tri???n ch????ng tr??nh Ti???ng Anh cho kh???i c???p 2 v???i c??ng vi???c nh?? sau:\\n\\n- Ph???i h???p v???i Academic Team v?? c??c b??? ph???n li??n quan ????? ph??t tri???n v?? c???i thi???n ch???t l?????ng gi???ng d???y t???i c??c tr?????ng c???p 2 ???????c ph??n c??ng\\n- Qu???n l?? v?? l??m ????? thi cho kh???i c???p 2: Thi gi???a k??, cu???i k??, Olympic Ti???ng Anh, thi ch???ng ch??? CEFR (A1, A2, B1, B2) v?? thi th??? (Mock test)\\n- Nh???n ho???c c??ng ph??t tri???n ????? thi v???i AC, so??t ch??nh t???, s???a l???i, c??n ch???nh ????? thi r???i chuy???n cho team H???c li???u\\n- Qu???n l?? vi???c ch???m v?? ch???a b??i t???p v??? nh?? c??ng nh?? l??n n???i dung cho b??i t???p v??? nh?? c??c c???p h???c\\n- C???p nh???t feedback v??? ch????ng tr??nh h???c v?? ??i???u ch???nh cho ph?? h???p\\n- C?? ?? t?????ng c???i ti???n, ph??t tri???n ch????ng tr??nh h???c m???i theo y??u c???u c???a c???p tr??n\\nY??U C???U C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"- T???t nghi???p ??H chuy??n ng??nh gi???ng d???y Ti???ng Anh, ????? tu???i t??? 23 tr??? l??n\\n- C?? kinh nghi???m chuy??n s??u v??? m???ng ph??t tri???n h???c li???u, ????? thi cho h???c sinh l???a tu???i c???p 2\\n- C???n th???n, t??? m???, k?? t??nh ????? ki???m tra ch??nh x??c h???c li???u, ????? thi tr?????c khi ????a ??i in ???n, chuy???n sang tr?????ng\\n- Ti???ng Anh t???t ??? c??? 4 k??? n??ng (IELTS 7.0 tr??? l??n)\\n- K??? n??ng tin h???c v??n ph??ng t???t\\n\\n***CH??? ????? ????I NG???***\\n- Thu nh???p 13 - 18 tri???u/th??ng + Ph??? c???p\\n- B???o hi???m x?? h???i ?????y ?????, t???ng th??? ch??m s??c s???c kh???e PTI\\n- Ngh??? ph??p 19 ng??y/n??m c?? tr??? l????ng\\n- H???c b???ng h???c Ti???ng Anh mi???n ph?? cho ng?????i lao ?????ng v?? con c??i\\n- L??? tr??nh th??ng ti???n r?? r??ng, review l????ng h??ng n??m\\n?????A ??I???M L??M VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"34T Ho??ng ?????o Th??y - Thanh Xu??n - H?? N???i\\n\"}]}','Ha Noi',750,550,'2022-11-06 07:40:47',' Academic Officer - Nh??n Vi??n Ph??t Tri???n Ch????ng Tr??nh, ????? Thi','2022-11-21 21:06:43',40,1,1,1),(76,1,'2022-11-06 08:23:08',NULL,'2022-12-16 08:23:08',1.5,'/api/file/images/upload/29/1667697788385_1667697788385_s.png','{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"M?? T??? C??ng Vi???c\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"We are looking for talented and passionately committed agile developers for??\"},{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"Trapets ??? A European expert company providing cutting-edge services and systems for securities trading, anti-money laundering surveillance and compliance\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"????? to work in our beautiful office in??\"},{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"HANOI, VIETNAM\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\". With Trapets, it is important to have a team spirit where we share knowledge, support each other and are driven by development both on the personal level and within the team / company.\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"Trapets??\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"is expanding strongly both nationally and globally and in the role you are given the opportunity to contribute to the company???s continued development. Trapets is characterized by commitment, creativity and team spirit where you will be an important piece of the puzzle in the development of our products and its profile.\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Note:??\"},{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"Online interview is supported.\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Y??u C???u C??ng Vi???c\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"Technical Requirements\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"4+ years of real, hands-on experience in web/frontend development in a professional environment working with some of the main frameworks or libraries (Angular).\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"At least 2 years of relevant experience in Angular-centric projects.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Typescript Redux (Vuex, Ngrx or other Flux pattern works as well)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Strong analytic skills to process complex requirements to come up with end-to-end scenarios and implications.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"High proficiency in HTML and CSS.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Hands-on experience in Responsive Design.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"??Hands-on experience in Web/front-end testing and automation frameworks.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Knowledge of TypeScript.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Knowledge of API integration.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Knowledge of Web/front-end SDLC and CD/CI processes: Jenkins, SonarQube\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"DevOps mindset REST API???s and Swagger/OpenAPI.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Knowledge with componentization (any experience on WebComponents is a plus).\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Should know how to work with Jira, Confluence, etc.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"You should know how to view quality holistically and ensure the highest software quality.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"Good communication in English in verbal and written.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"Education and Experience\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Bachelor???s degree.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Hands-on experience in Agile projects.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Banking experience is preferred.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Must have resilience and the ability to work well under pressure.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Should be able a quick learner and adapt to change.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Ability to handle multiple concurrent activities and projects.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Ability to work along with team distributed across locations.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Strong sense of ownership for assigned projects.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Able to articulate well the solution(s).\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Able to work as a team.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"T???i Sao B???n S??? Y??u Th??ch L??m Vi???c T???i ????y\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"What do we offer you?\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"At??\"},{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"Trapets??\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"we want to foster an open and dynamic working culture where we encourage initiatives and sharing of ideas.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Close collaboration and teamwork are two of our guiding principles which we believe will help us in our mission to provide world leading systems and services to combat financial crime.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"We believe having fun at work is an important contributing factor to our success.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Working in a modern Scandinavian culture and style office, characterized by strong team spirit, high degrees of openness, friendliness and innovation.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Meet other software engineer teams from some of Scandinavia???s market leading SaaS companies that develop cutting edge products for a wide variety of industries across the world.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"You???ll get\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"You???ll get to work with experienced software engineers worldwide at market leading, innovative Scandinavian SaaS company looking to accelerate growth\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\",\"bold\":true},\"insert\":\"Scandinavian Work Culture: creativity, innovation and work-life balance\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Competitive salary and 100% official salary during the probation period.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Annual review and 13th month salary.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Premium healthcare and & accident insurance.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Wellness package supports employees stay healthy and wealthy.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Exciting company outing/events and team building activities.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"On-site and training opportunities in Nordic.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Modern working environment.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"}]}','Ho Chi Minh',2000,1000,'2022-11-06 08:23:08','Senior Frontend Developer','2022-11-22 06:01:16',41,1,2,2),(77,2,'2022-11-06 08:33:41',NULL,'2022-12-16 08:33:41',1,'/api/file/images/upload/29/1667698420560_1667698420558_s.png','{\"ops\":[{\"insert\":\"WHAT WE CAN OFFER\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Premium Healthcare Program\"},{\"attributes\":{\"list\":\"ordered\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Annual leave: 15 days/year and Other leaves/public holidays\"},{\"attributes\":{\"list\":\"ordered\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Providing customized training courses according to business needs and upon your request\"},{\"attributes\":{\"list\":\"ordered\"},\"insert\":\"\\n\"},{\"insert\":\"JOB DESCRIPTION\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"Responsibilities\\n- Writing clean & high-quality code\\n- Maintain & improve running- functionality as well as design and develop new system, new feature if needed\\n- Deliver end-to-end, including unit test, integration test and deployment to PROD\\n- Participate in code reviews\\nJOB REQUIREMENTS\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"- 3+ years of experience in Java, Spring, Oracle, MySQL\\n- Experience with RESTful APIs, Microservices\\n- Expertise in Object Oriented Design, Database Design.\\n- Experience with Docker/Kubernetes and Cloud Infrastructure is a plus\\n- Experience with Agile or Scrum software development methodologies\\n- Ability to multi-task, organize, and prioritize work\\n- Proactive attitude and good communication skills\\nJOB LOCATIONS\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"T??a v??n ph??ng T26, khu ???? th??? Times City, 458 Minh Khai, Ph?????ng V??nh Tuy, Qu???n Hai B?? Tr??ng, H?? N???i\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"28bis ???????ng M???c ????nh Chi, ??a Kao, Qu???n 1, Th??nh ph??? H??? Ch?? Minh, Vi???t Nam\\nTags:\"},{\"attributes\":{\"header\":5},\"insert\":\"\\n\"},{\"insert\":\"\\n\"}]}','Ho Chi Minh',3000,1500,'2022-11-06 08:33:41','Senior Backend Engineer (Java)','2022-11-21 21:04:36',41,1,3,1),(78,5,'2022-11-06 08:43:50',NULL,'2022-12-16 08:43:50',0.5,'/api/file/images/upload/29/1667699029767_1667699029767_10668657.png','{\"ops\":[{\"insert\":\"C??C PH??C L???I D??NH CHO B???N\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Competitive salary and bonus up to 300%\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Overseas Training\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Dynamic & Friendly working environment\\nM?? T??? C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"Shinhan DS Vietnam is established to be in charge of the ICT synergy of Shinhan Financial Group in the Southeast Asia.\\n\\nSDSer\' top priority is the clients\' business growth acceleration by strengthening their ICT systems.\\n\\nOne of our big clients is Shinhan Securities.\\n\\nAs a Developer of Securities team, you will:\\n- Collaborate closely with clients and IT professionals in analysis, development, and testing trading system on mobile & web platforms.\\n- Write efficient source code to program complete applications.\\n- Maintain, modify or create new applications based on requirements.\\n- Identify errors, bugs, and suggest solutions to these problems.\\n- Attend business and technical training from clients and partners.\\nY??U C???U C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"- From 1+ years of experience.\\n- Back-end developer: Experience with C, C#, Pro*C, Python and PLSQL.\\n- Web developer: NodeJS, ReactJS, ElectronJS.\\n- Mobile developer: React native, Flutter.\\n- Experience with payment gateway, data processing, batch processing, real-time processing\\n- Preferable: Finance, Banking, Securities field.\\n- Graduate college or university with major Information Technology, Computer Science, Software\\nEngineering or related fields.\\n- Good problem solving & communication skills.\\n- Detail-oriented, proactive, fast learner.\\n- Languages: Vietnamese & English\\n- Ready to work in November, December 2022\\n\\nLet\'s Excite you more with our Brilliant perks:\\n\\n- Salary: you will be happy + Pass-Probation Bonus\\n- Performance Bonus: twice a year.\\n- Friend Referral Program Bonus and many other incentives.\\n- 15 days of annual leaves\\n- Personal Allowances for birthday, marriage, new baby, etc.\\n- Team monthly allowance.\\n- Special loan offers and fee waiver from Shinhan Bank.\\n- Company Trip, annual/monthly/weekly activities and events.\\n- Health check once a year and premium healthcare program for family.\\n- Education Programs and oversea training opportunities.\\n- Your solutions and opinions are welcomed.\\n?????A ??I???M L??M VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"CENTEC Tower, 72-74 Nguyen Thi Minh Khai, Ward 6, District 3, HCM city\\n\"}]}','Ho Chi Minh',2500,800,'2022-11-06 08:43:50','05 Software Developer (C) (Stock/ Securities)','2022-11-21 21:04:14',42,1,1,1),(79,1,'2022-11-06 08:51:40',NULL,'2022-12-16 08:51:40',1,'/api/file/images/upload/29/1667699499949_1667699499947_10668657.png','{\"ops\":[{\"insert\":\"M?? T??? C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"Shinhan DS Vietnam is established to be in charge of the ICT synergy of Shinhan Financial Group in the Southeast Asia.\\nSDSer\' top priority is the clients\' business growth acceleration by strengthening their ICT systems.\\n- Collaborate closely with clients and IT professionals in analysis, development, and testing banking features & functions (web)\\n- Write efficient source code to program complete applications.\\n- Maintain, modify or create new applications based on requirements.\\n- Identify errors, bugs, and devise solutions to these problems.\\n- Attend business (banking, stock/ securities & finance), technical training from Korea\'s top experts.\\nY??U C???U C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"- 2-6 years of experience.\\n- Back-end Developer: Proficiency in C/C++, Java base on Unix, Linux.\\n- Web Developer: Experienced in\\n+ Java frameworks (J2EE, Spring, etc.)\\n+ Web services (RESTful, SOAP, etc.)\\n+ XML, JSON, HTML, CSS, Bootstrap, JavaScript, jQuery, Ajax\\n+ SQL and RDBMS (Oracle or MySQL)\\n- Knowledge about WebLogic, Http Apache is a plus.\\n- Good understanding software principles and design patterns.\\n- Good understanding of OOP programming, Data Structures & Algorithm\\n- Familiar with Oracle, Spring boot\\n- Good to have: knowledge in Banking, Stock/ Securities, Finance field.\\n- Good problem solving & communication skills.\\n- Detail-oriented, proactive, fast learner.\\n- Communicate in Vietnamese & English\\n- Ready to work in November, December 2022\\n\\nLet\'s Excite you more with our Brilliant perks:\\n\\n- Salary: you will be happy + Pass-Probation Bonus\\n- Performance Bonus: twice a year.\\n- Friend Referral Program Bonus and many other incentives.\\n- 15 days of annual leaves\\n- Personal Allowances for birthday, marriage, new baby, etc.\\n- Team monthly allowance.\\n- Special loan offers and fee waiver from Shinhan Bank.\\n- Company Trip, annual/monthly/weekly activities and events.\\n- Health check once a year and premium healthcare program for family.\\n- Education Programs and oversea training opportunities.\\n- Your solutions and opinions are welcomed.\\n?????A ??I???M L??M VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"CENTEC Tower, 72-74 Nguyen Thi Minh Khai, Ward 6, District 3, HCM city\\n\"}]}','Ho Chi Minh',2500,800,'2022-11-06 08:51:40',' 20 Software Developer (C/C++, Java) (Pass Probation Bonus)','2022-11-21 21:02:22',42,1,1,1),(80,1,'2022-11-07 08:06:32',NULL,'2022-12-17 08:06:32',5,'/api/file/images/upload/26/1667783191967_1667783191964_RBVH-Logo.png','{\"ops\":[{\"insert\":\"C??C PH??C L???I D??NH CHO B???N\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"13th-month bonus + yearly performance bonus + annual salary appraisal\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Premium health insurance for employee + 2 family members\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"16++ days of paid leave per year\\nM?? T??? C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"VISION\\nOur vision is to be THE software engineering partner for brake system in ASEAN. We deliver complete software projects (CSPs) to our Bosch counterparts of CC, BEG and 2WP divisions for the OEMs in nearshore regions Japan, China, ASAEAN. We perform the end-to-end software development activities including all the roles like developers, testers, integrators, project managers and other special functions like functional safety and cyber security for our projects. We also work on the advanced engineering topics like software engineering for E&E architecture.\\n???Join us in this noble cause of saving lives and develop your career towards these futuristic technologies???.\\n\\nJOB DESCRIPTION\\nWe\'re looking for talented Project Manager to join Brake System team in Ho Chi Minh and Hanoi. General responsibilities include:\\n\\n- Analyze customer requirements, clarify and document\\n- Issue development request to developers and track the progress\\n- Plan, Monitor and Control project schedule\\n- Interface with customers, manage OPLs and stakeholders\\n- Develop team and give feedback to associates as per need\\n\\n** As a Project Manager, you will be responsible for analyzing requirements from customer and manage development of same with support from development team. You will be the interface to customers and responsible for managing the project schedule and deliverables within defined QCD. Your main focus include:\\n- Engineering services for embedded software projects (C, Automotive)\\n- Working with engineering team to make overall project proposal (work packages, time schedule...)\\n- Supporting sales with quotation, pricing and contract with customer\'s supplier\\n- Leading project team, execute project till final delivery to customer\\n- Use PM tools for project management\\n- Close cooperate with Bosch BUs, BEG-CN (engineering team)\\n\\nAPPLY NOW TO SEIZE THE OPPORTUNITY TO RECEIVE JOINING BONUS - 1 MONTH OF GROSS SALARY\\n\"},{\"attributes\":{\"color\":\"#005aff\",\"background\":\"transparent\"},\"insert\":\"Xem to??n b??? M?? T??? C??ng Vi???c\"},{\"insert\":\"\\nY??U C???U C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"QUALIFICATION\\n- B.S or equivalent degree in Mechatronic Engineering, Automotive Engineering, Electronics, Computing Engineering, Information Technology or related major\\n- Good at stakeholder management skills\\n- Good English communication skills\\n- Have strong experience in Embedded software development\\n- Have hands-on experience in Automotive Diagnostics and Communication protocols is big advantage\\n- To apply for Project Manager role, you should have strong knowledge and experience in Project Management processes, Risk Management [Risk identification, mitigation and contingency plan]\\n\\nWHY BOSCH?\\nBecause we don\'t just follow trends, we create them.\\nBecause together we turn ideas into reality, working every day to make the world of tomorrow a better place. Do you have high standards when it comes to your job? So do we. At Bosch, you will discover more than just work.\\n- Working in one of the Best Places to Work in Vietnam and Top 30 of the Most Innovative Companies all over the world\\n- Join a dynamic and fast growing global company (English-speaking environment)\\n- 13th-month salary bonus + attractive performance bonus (you\'ll love it!) + annual performance appraisal\\n- 100% monthly salary and mandatory social insurances in 2-month probation\\n- Onsite opportunities: short-term and long-term assignments\\n- 15++ days of annual leave + 1 day of birthday leave\\n- Premium health insurance for employee and 02 family members\\n- Flexible working time\\n- Lunch and parking allowance\\n- Various training on hot-trend technologies/ foreign language (English/Chinese/Japanese) and soft-skills\\n- Fitness & sport activities: football, badminton, yoga, Aerobic\\n- Free in-house entertainment facilities and snack\\n- Join in various team building, company trip, year-end party, tech talks and a lot of charity events\\n?????A ??I???M L??M VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Etown building, 364 Cong Hoa street, ward 13, Tan Binh district, Ho Chi Minh, Vietnam\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Capital Place Building, 29 Lieu Giai Street, Ba Dinh District, Hanoi, Vietnam\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Remote Work\\n\"}]}','Binh Duong',5000,4000,'2022-11-07 08:06:32','Embedded Software Project Manager','2022-11-21 21:01:53',31,1,4,1),(85,1,'2022-11-13 19:02:43',NULL,'2022-12-23 19:02:43',0,'/api/file/images/upload/51/1668340962825_1668340962825_daikin.png','{\"ops\":[{\"insert\":\"C??C PH??C L???I D??NH CHO B???N\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Du L???ch, Ph??? c???p, h?????ng, T??ng l????ng\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"insert\":\"Ch??m s??c s???c kh???e, ????o t???o, C??ng t??c ph??, Ph??? c???p th??m ni??n, Ch??? ????? ngh??? ph??p\\nM?? T??? C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"- Supporting End-Users to solve all issue of IT(email, application, network, hardware issues...)\\n- Supporting for admin to troubleshoot network and system problems\\n- Configuring and monitoring follow assignment of network and system administrators in Data Center\\n- Monitoring and diagnostic all issues of End-users and systems in branches\\n- Producing IT support document, user guide and maintain IT support knowledge base\\n- Supporting for IT asset management\\n- Other reports upon requests of direct manager\\nY??U C???U C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"- Bachelor of Information Technology, major in network administrator\\n- Certificate of CCNA, MCSA or concerning IT network is an advantage\\n- No experience required or experience 1-2 years in IT helpdesk, troubleshooting network problems\\n- Communicate well in English and Vietnamese\\n- Self-motivated, energetic, adaptive to changes and willing to accept challenges\\n- Ability to work under pressure, over time and business trip when required\\n\"}]}','Ho Chi Minh',1000,800,'2022-11-13 19:02:43',' IT Network & Security Officer','2022-11-21 21:00:24',50,1,1,1),(86,2,'2022-11-13 19:25:33',NULL,'2022-12-23 19:25:33',1,'/api/file/images/upload/51/1668342332714_1668342332714_11127170.png','{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"C??C PH??C L???I D??NH CHO B???N\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"???????c th?????ng theo hi???u qu??? kinh doanh c???a c??ng ty, th?????ng trong c??c d???p l???T???t\"},{\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"???????c h?????ng ch??? ????? BHXH, BHYT, BHTN, B???o hi???m s???c kh???e theo quy ?????nh c???a C??ng ty\"},{\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"???????c h?????ng c??c kho???n ph??? c???p nh?? ph??? c???p ??n tr??a, ?????c h???i, ph??? c???p ki??m nhi???m tr??ch nhi???m c??ng vi???c\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"M?? T??? C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"- Ph??n t??ch, nghi??n c???u, ????nh gi??, thi???t k???, t?? v???n v?? chi ti???t h??a gi???i ph??p c??ng ngh??? v???i c??c kh???i nghi???p v???, kinh doanh v??? d???ch v??? T??i ch??nh v?? Ch???ng kho??n.\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"- Tham gia nghi??n c???u, ????nh gi?? c??c gi???i ph??p c??ng ngh???, s???n ph???m, ?????c bi???t c??c gi???i ph??p x??y d???ng tr??n n???n t???ng ng??n ng??? SQL\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"Y??U C???U C??NG VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"* Y??U C???U TR??NH ?????\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"- T???t nghi???p ?????i h???c chuy??n ng??nh C??ng ngh??? th??ng tin, to??n tin\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"-S??? d???ng th??nh th???o ng??n ng??? l???p tr??nh Java/.Net/NodeJS\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"-C?? kinh nghi???m l???p tr??nh socket, websocket, socket.io\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"-L???p tr??nh th??nh th???o v???i h??? CSDL: MS SQL, MySQL, Oracle (Oracle l?? l???i th???)\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"- S??? d???ng th??nh thao c??c c??ng c??? x??y d???ng m?? h??nh nh?? Visio, UML, ORM ???\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"* Y??U C???U KH??C\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"- Trung th???c, c???n th???n, l??m vi???c theo quy tr??nh\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"- C?? kh??? n??ng l??m vi???c ?????c l???p v?? l??m vi???c nh??m trong m??i tr?????ng ??p l???c cao\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"- C?? t?? duy logic t???t, kh??? n??ng tr??nh b??y di???n gi???i ph??n t??ch v???n ?????, r?? r??ng v?? chi ti???t\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"- Ham h???c h???i v?? t??m hi???u c??c c??ng ngh??? m???i\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"- C?? mong mu???n t??m hi???u v??? l??nh v???c t??i ch??nh, ch???ng kho??n\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"- C?? kh??? n??ng ?????c hi???u t??i li???u Ti???ng Anh chuy??n ng??nh\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"* Y??U C???U KINH NGHI???M\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"- C?? kinh nghi???m l??m vi???c t??? 2 n??m tr??? l??n\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"* ??u ti??n\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"- C?? hi???u bi???t, ki???n th???c v??? t??i ch??nh, ch???ng kho??n\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"- ???? t???ng tham gia ph??t tri???n c??c h??? th???ng t??i ch??nh, ch???ng kho??n\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"*** Quy???n l???i:\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"??? Th???i gian l??m vi???c 5 ng??y/tu???n (t??? th??? Hai ?????n th??? S??u).\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"??? C?? h???i th??ng ti???n, ph??t tri???n ngh??? nghi???p c??ng b???ng.\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"??? Thu nh???p h???p d???n, c???nh tranh.\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"??? ???????c h?????ng ch??? ????? BHXH, BHYT, BHTN, B???o hi???m s???c kh???e theo quy ?????nh c???a C??ng ty.\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"??? ???????c tham gia c??c ch????ng tr??nh ????o t???o, hu???n luy???n c???a C??ng ty.\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"??? M??i tr?????ng l??m vi???c chuy??n nghi???p, th??n thi???n, n??ng ?????ng.\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"??? M???c l????ng: theo th???a thu???n* Th???i h???n nh???n h??? s??:\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"??? (Ph???ng v???n cu???n chi???u ngay khi nh???n ???????c h??? s?? ?????n khi tuy???n ???????c ???ng vi??n ph?? h???p)\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"* H??? s?? y??u c???u:\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"??? B???n Th??ng tin ???ng vi??n theo m???u c???a MBS.\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"??? C??c m???u th??ng tin ???ng vi??n/CV kh??c kh??ng theo m???u MBS l?? h??? s?? kh??ng h???p l???.\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"* N??i nh???n h??? s??:\"},{\"insert\":\"\\n\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"N???p B???n Th??ng tin ???ng vi??n theo m???u c???a MBS theo h??nh th???c sau:\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"??? N???p h??? s?? Online tr??n website tuy???n d???ng\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"??? N???p h??? s?? tr???c ti???p t???i C??ng ty theo ?????a ch??? :\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"o Ph??ng Nh??n s??? & Ph??t tri???n Ngu???n l???c\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"o C??ng Ty C??? Ph???n Ch???ng Kho??n MB\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"o ?????a ch???: T???ng 7, s??? 21 C??t Linh, H?? N???i\"},{\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"?????A ??I???M L??M VI???C\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"align\":\"center\"},\"insert\":\"\\n\"},{\"attributes\":{\"size\":\"large\"},\"insert\":\"98A Ng???y Nh?? Kon Tum - Q.Thanh Xu??n - H?? N???i\"},{\"insert\":\"\\n\"}]}','Ho Chi Minh',2000,1000,'2022-11-13 19:25:33','Chuy??n Vi??n Ph??t Tri???n Ph???n M???m N???n T???ng Database/ Web','2022-11-22 06:20:34',51,1,2,1),(89,2,'2022-11-22 06:48:47',NULL,'2023-01-01 06:48:47',0.5,'/api/file/images/upload/52/1669074526643_1669074526643_binance-logo-5.webp','{\"ops\":[{\"insert\":\"3 L?? Do ????? Gia Nh???p C??ng Ty\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"Top-tier company in the crypto industry\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Global, dynamic and thriving working environment\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Competitive salary packages\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"M?? T??? C??ng Vi???c\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"Hands-on manual investigation and reproduction of functional backend software issues\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Root cause analysis of existing test script failures\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Identification of current test script deficiencies and candidates for additional scripted coverage\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Investigatory testing of unreleased features including defining requirements, behavior and impact\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Documentation and design of candidate test scenarios for the above\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Y??u C???u C??ng Vi???c\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"insert\":\"5 years+ of backend QA engineering experience\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Full cycle testing from designing manual tests, developing scripts and execution\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Strong experience with UNIX/Linux\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Scripting ability using Python, Bash\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Experience testing backend services such as APIs, Databases, distributed services (non-monolithic)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Enjoys breaking things and solving problems - not just able to find out the \'what\', but also the \'why\'\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Clear, logical communicator in English\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"T???i Sao B???n S??? Y??u Th??ch L??m Vi???c T???i ????y\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"The chance to work on the largest cryptocurrency exchange platform in the world:\"},{\"insert\":\"\\nNow we are having??\"},{\"attributes\":{\"bold\":true},\"insert\":\"~2 billion\"},{\"insert\":\"??average??\"},{\"attributes\":{\"bold\":true},\"insert\":\"daily volume\"},{\"insert\":\";??\"},{\"attributes\":{\"bold\":true},\"insert\":\"1.5 million transaction/ second\"},{\"insert\":\"??as well as more than??\"},{\"attributes\":{\"bold\":true},\"insert\":\"10 million users\"},{\"insert\":\".\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"We welcome top talents to join us and continuously improve, innovate the platform together.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Our values:\"},{\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"User-Focused\"},{\"insert\":\": we protect our users by putting our users\' needs first and delivering quality service.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Freedom\"},{\"insert\":\": We execute responsibly and autonomously. We empower those around us. Our team is diverse and we challenge the status quo.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Collaboration\"},{\"insert\":\": We communicate openly. We work as a team towards shared goals to build the ecosystem together\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Hardcore\"},{\"insert\":\": We are results driven, get things done, passionate and work hard. When we fail, we learn fast, and pick ourselves up.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Integrity\"},{\"insert\":\": We are accountable for our actions. When we make mistakes, we fix them. We always act ethically. We never punch down.\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Our benefits:\"},{\"insert\":\"\\nCompetitive salary, option to be paid in crypto\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Additional Private Medical Insurance\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Macbook, Iphone will be provided for work\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Free language classes\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Remote working option\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Flexible working hours, casual work attire\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Company sponsored: learning programs, relocation, transportation allowance, holidays, team building activities, ...\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\n\"}]}','Ho Chi Minh',1000,700,'2022-11-22 06:48:47','Senior QA Engineer (Exploratory Testing)','2022-11-22 06:48:47',52,2,1,1),(90,1,'2022-11-22 12:54:42',NULL,'2022-11-17 07:00:00',1,'/api/file/images/upload/1/1669096482260_1669096482256_KMS.jpg','{\"ops\":[{\"insert\":\"test\\n\"}]}','Binh Duong',4444,2222,'2022-11-16 07:00:00','test','2022-11-22 20:07:54',33,1,2,1);
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
INSERT INTO `likes` VALUES (56,'LIKE',1),(80,'LIKE',1),(85,'LIKE',1),(86,'LIKE',1),(52,'LIKE',26),(54,'LIKE',29),(89,'LIKE',52);
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
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (132,'2022-11-06 08:04:27',NULL,'hello linh','TEXT','2022-11-06 08:04:27',26,29),(133,'2022-11-06 08:04:34',NULL,'nice to meet you','TEXT','2022-11-06 08:04:34',26,29),(134,'2022-11-06 09:53:50',NULL,'Hello b???n ','TEXT','2022-11-06 09:53:50',27,26),(135,'2022-11-06 09:54:12',NULL,'Ban c?? th??? cho m??nh bi???t th??ng tin v??? b???n kh??ng','TEXT','2022-11-06 09:54:12',27,26),(136,'2022-11-06 10:51:01',NULL,'M??nh t??n l?? Linh hehe','TEXT','2022-11-09 07:57:20',27,1),(138,'2022-11-09 07:48:18',NULL,'hi man','TEXT','2022-11-09 07:48:18',26,1),(139,'2022-11-09 07:48:33',NULL,'what are you waiting for me ? ','TEXT','2022-11-09 07:48:33',26,1),(143,'2022-11-09 07:58:13',NULL,'attachment','IMAGE','2022-11-09 07:58:13',27,1),(145,'2022-11-10 06:44:57',NULL,'attachment','IMAGE','2022-11-10 06:44:57',27,1),(146,'2022-11-10 07:54:56',NULL,'hello ban man','TEXT','2022-11-10 07:54:56',28,26),(147,'2022-11-12 18:50:57',NULL,'hello ban di???u','TEXT','2022-11-12 18:50:57',27,26),(148,'2022-11-12 18:51:07',NULL,'hello b???n nha linh','TEXT','2022-11-12 18:51:07',27,1),(149,'2022-11-12 18:51:18',NULL,'attachment','IMAGE','2022-11-12 18:51:18',27,26),(151,'2022-11-13 14:11:50',NULL,'hello ban','TEXT','2022-11-13 14:11:50',29,26),(152,'2022-11-13 14:15:36',NULL,'Hi???n t???i b???n ??ang h???c hay ???? ??i l??m r???i ?','TEXT','2022-11-13 14:15:36',27,1),(153,'2022-11-13 14:15:49',NULL,'m??nh c??n ??ang h???c ','TEXT','2022-11-13 14:15:49',27,26),(154,'2022-11-13 14:16:35',NULL,'b??n c??ng ty m??nh ??ang tuy???n v??? tr?? QA, b???n c?? mu???n apply v??o v??? tr?? ???? kh??ng','TEXT','2022-11-13 14:16:35',27,1),(155,'2022-11-13 14:16:51',NULL,'c?? ','TEXT','2022-11-13 14:16:51',27,26),(156,'2022-11-13 14:17:14',NULL,'v???y b???n cho m??nh xem CV c???a b???n nh?? ','TEXT','2022-11-13 14:17:14',27,1),(157,'2022-11-13 14:17:21',NULL,'Okay b???n','TEXT','2022-11-13 14:17:21',27,26),(159,'2022-11-13 14:18:17',NULL,'attachment','IMAGE','2022-11-13 14:18:17',27,26),(160,'2022-11-13 14:21:56',NULL,'hello','TEXT','2022-11-13 14:21:56',27,26),(161,'2022-11-13 19:06:18',NULL,'Ch??o c??ng ty ','TEXT','2022-11-13 19:06:18',27,1),(162,'2022-11-13 19:14:31',NULL,'hi???n t???i c??ng ty ??ang tuy???n v??? tr?? IT network ????ng kh??ng ??? ','TEXT','2022-11-13 19:14:31',27,1),(163,'2022-11-13 19:15:33',NULL,'????ng r???i b???n ','TEXT','2022-11-13 19:15:33',27,26),(164,'2022-11-13 19:15:59',NULL,'em mu???n apply v??o job n??y','TEXT','2022-11-13 19:15:59',27,26),(165,'2022-11-13 19:16:23',NULL,'b???n g???i cv nh?? c??ng ty s??? xem x??t ','TEXT','2022-11-13 19:16:23',27,1),(166,'2022-11-13 19:17:04',NULL,'c??ng ty s??? s???p x???p ng??y ph???ng v???n v?? ??i???n l???i cho b???n sau','TEXT','2022-11-13 19:17:04',27,1),(167,'2022-11-13 19:17:19',NULL,'attachment','IMAGE','2022-11-13 19:17:19',27,26),(168,'2022-11-13 19:17:42',NULL,'em c???m ??n r???t nh??u ','TEXT','2022-11-13 19:17:42',27,26),(169,'2022-11-13 19:28:37',NULL,'xin ch??o c??ng ty','TEXT','2022-11-13 19:28:37',30,1),(170,'2022-11-13 19:28:48',NULL,'ch??o b???n ','TEXT','2022-11-13 19:28:48',30,27),(171,'2022-11-13 19:29:01',NULL,'m??nh c?? th??? gi??p g?? cho b???n n??','TEXT','2022-11-13 19:29:10',30,27),(172,'2022-11-13 19:29:23',NULL,'m??nh mu???n apply v??o job database','TEXT','2022-11-13 19:29:23',30,1),(173,'2022-11-13 19:29:30',NULL,'b???n g???i cv nh??','TEXT','2022-11-13 19:29:30',30,27),(174,'2022-11-13 19:29:54',NULL,'attachment','IMAGE','2022-11-13 19:29:54',30,1),(178,'2022-11-15 12:32:21',NULL,'attachment','IMAGE','2022-11-15 12:32:21',26,29),(179,'2022-11-20 18:21:32',NULL,'hello','TEXT','2022-11-20 18:21:32',26,1),(180,'2022-11-20 20:03:00',NULL,'hello','TEXT','2022-11-20 20:03:00',27,26);
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
INSERT INTO `posts` VALUES (27,'<p>Nh???ng c??u h???i ph???ng v???n vi???c l??m th?????ng g???p &amp; c??ch tr??? l???i hay nh???t b???ng ti???ng Anh v?? ti???ng Vi???t</p><p>1. Gi???i thi???u s?? l?????c v??? b???n th??n b???n? (Could you briefly Introduce yourself?)</p><p>H???u h???t nh?? tuy???n d???ng ?????u d??ng c??u h???i n??y ????? b???t ?????u c??u chuy???n v???i ???ng vi??n. M???c ????ch c??u h???i n??y l?? ????? ????nh gi?? phong th??i v?? c??ch tr??nh b??y c???a ???ng vi??n. L??c n??y, t??y thu???c v??o c??u tr??? l???i c???a ???ng vi??n m?? nh?? tuy???n d???ng s??? ????nh gi?? ????y c?? ph???i l?? m???t ???ng vi??n ph?? h???p hay kh??ng v?? ????a ra c??c c??u h???i ti???p theo ????? ????nh gi?? k??? n??ng, t??nh c??ch v?? kinh nghi???m l??m vi???c.</p><p><br></p><p>Tip: ????? tr??? l???i t???t c??u h???i n??y, b???n c???n ????a ra kh??i qu??t nh???ng th??ng tin v??? c?? nh??n c?? li??n quan, h???u ??ch cho v??? tr?? m?? m??nh ???ng tuy???n nh??: c??ng vi???c hi???n t???i, tr??nh ????? h???c v???n, m???c ti??u s??? nghi???p,??? B???n n??n c??n nh???c gi???i thi???u b???n th??n theo tr??nh t??? th???i gian qu?? kh???, hi???n t???i v?? t????ng lai c??ng nh?? g??i g???n trong t???i ??a 2 ph??t. Chia s??? ng???n v??? s??? th??ch, t??nh c??ch c??ng l?? m???t c??ch thu h??t nh?? tuy???n d???ng, tuy nhi??n c??ng kh??ng n??n n??i qu?? nhi???u v??? nh???ng v???n ????? n??y v???i nh?? tuy???n d???ng.</p><p><br></p><p>Tham kh???o c??u tr??? l???i ph???ng v???n m???u b???ng Ti???ng Vi???t:</p><p>\"Tr?????c khi gi???i thi???u v??? b???n th??n m??nh, em/t??i xin g???i l???i c???m ??n ch??n th??nh t???i anh/ch??? khi ???? t???o c?? h???i cho em/t??i ????? ???????c trao ?????i v??? v??? tr?? ???ng tuy???n c???a qu?? c??ng ty. Em ch??o anh/ ch???, t??n em l?? Mai, h??? t??n ?????y ????? c???a em l?? Tr???nh Th??? Tuy???t Mai. Em l?? sinh vi??n m???i ra tr?????ng c???a Tr?????ng ?????i h???c X, trong th???i gian l??m sinh vi??n em ???? t???ng tham gia m???t s??? c??ng vi???c b??n th???i gian nh??ng kh??ng th???t s??? ???n t?????ng, v?? c??c c??ng vi???c em l??m kh?? ????n gi???n, tuy v???y th??ng qua ch??ng em h???c ???????c t??nh ki??n nh???n v?? t??? m???. Th??ng qua c??c ho???t ?????ng n??y, em c?? kinh nghi???m h??n trong vi???c n???m b???t t??m l?? ng?????i kh??c, c?? th??m nh???ng k??? n??ng nh?? quan s??t, c?? kh??? n??ng ch???u ??p l???c cao. V?? em tin nh???ng ??i???u n??y s??? c?? ??ch ?????i v???i v??? tr?? n??y. Qua t??m hi???u k??? v??? v??? tr?? c??ng vi???c v?? m??i tr?????ng l??m vi???c b??n m??nh c??ng nh?? nh???ng kinh nghi???m v?? s??? tr?????ng em ??ang c??, em th???c s??? mong mu???n ???????c c?? c?? h???i ???????c l??m vi???c c??ng anh ch??? t???i c??ng ty Y v???i v??? tr?? nh??n vi??n t?? v???n kh??ch h??ng.\"</p><p><br></p><p>Tham kh???o c??u tr??? l???i ph???ng v???n m???u b???ng Ti???ng Anh:</p><p>\"Before I introduce myself, I would like to thank you very much for giving me / me the opportunity to talk about the position of your company. / sister, my name is Mai, my full name is Trinh Thi Tuyet Mai. I am a fresh graduate of University X, when I was a student, I used to have some part-time jobs but none is not really significant, because the work I did was quite simple. Nonetheless I learned to be patient and meticulous. Through these jobs, I have more experience in interpersonal skills, observation, and high pressure tolerance. I believe these will be useful for this position through understanding carefully about the job position and working environment For me, I really want to have the opportunity to work with you at company Y as a client consultant. \"</p><p>2. B???n c?? th??? m?? t??? s?? l?????c v??? nh???ng c??ng vi???c b???n ???? l??m? Nhi???m v??? ch??nh ??? c??ng vi???c g???n ????y nh???t c???a b???n l?? g??? (Can you briefly describe the work you have done? What was the main tasks at your most recent job?)</p><p>M???c ????ch c???a c??u h???i n??y ????? ????nh gi?? v??? n??ng l???c v?? nh???ng kinh nghi???m l??m vi???c c???a b???n c?? ph?? h???p v???i v??? tr?? ??ang ???ng tuy???n hay kh??ng.</p><p><br></p><p>Tip: ???????c ????nh gi?? l?? m???t trong c??c c??u h???i ph???ng v???n th?????ng g???p v?? quan tr???ng, c??ch tr??? l???i ph???ng v???n c??u h???i n??y l?? n??n ch??n th???t, n?? gi???ng nh?? b???n ??ang chia s??? nh???ng kinh nghi???m c???a b???n th??n, ?????ng c??? n??i nh???ng g?? m??nh kh??ng bi???t, b???n s??? kh??ng tr??? l???i ???????c n???u nh?? tuy???n d???ng h???i s??u h??n v??? chuy??n m??n.</p><p>H??y n??i nh???ng g?? b???n ???????c h???c hay nh???ng g?? bi???t v??? c??ng vi???c m???t c??ch ng???n g???n v?? ?????, c??ng kh??ng n??n k??? chi ti???t c??c c??ng vi???c, qu?? d??i d??ng</p><p>Trong tr?????ng h???p b???n ch??a c?? nhi???u kinh nghi???m, h??y n??i b???n ??ang mu???n theo ??u???i c??ng vi???c n??y v?? d??nh nhi???u th???i gian h???c h???i, ph??t tri???n k??? n??ng, b???n ??ang mong mu???n t??m ???????c m???t c??ng ty t???t ????? g???n b?? v?? c???ng hi???n l??u d??i.</p><p><br></p><p>Tham kh???o c??u tr??? l???i ph???ng v???n m???u b???ng Ti???ng Vi???t:</p><p>\"Tr?????c kia, t??i ???? l??m tr??? l?? h??nh ch??nh cho m???t gi??m ?????c t???i Nh?? xu???t b???n S??ch v?? t??i ???? h??? tr??? s???p x???p l???ch tr??nh cho cho ??ng ???y c??ng nh?? cho to??n v??n ph??ng. C??ng vi???c c???a t??i l?? ch??m s??c t???t c??? c??c chi ti???t h??nh ch??nh ????? ??ng ???y c?? th??? t???p trung v??o c??c d??? ??n c???a m??nh. T??i ???? l??m t???t c??? m???i th??? t??? vi???c ?????t v?? chuy???n bay ????? chu???n b??? v?? in ???n c??c b???n t?????ng tr??nh ????? n???p l??m b??o c??o chi ph??.???</p><p><br></p><p>Tham kh???o c??u tr??? l???i ph???ng v???n m???u b???ng Ti???ng Anh:</p><p>\"In the past, I worked as an administrative assistant for a director at the Book Publishing House. I assisted with scheduling for him as well as for the entire office. My job was to take care of all administrative details so that he could focus on his projects. I did everything from booking a flight, preparing and printing reports and submitting an expense report. \"</p><p>3. Nh???ng th??nh t???u n??o ???? ?????t ???????c trong c??ng vi???c khi???n b???n t??? h??o nh???t? (What achievements in your job are you most proud of?)</p><p>M???c ????ch c??u h???i n??y l?? ????? nh?? tuy???n d???ng bi???t ???????c m???c ????? th??nh th???o trong c??ng vi???c c???a ???ng vi??n v?? n??ng su???t l??m vi???c c???a h??? nh?? th??? n??o.</p><p><br></p><p>Tip: B???n c???n li???t k?? nh???ng th??nh t???u trong c??? qu??ng th???i gian ??i h???c: b???n ?????t ???????c nh???ng gi???i th?????ng g??, b???n tham gia cu???c thi g??,... l?? do l?? ????? b???n d???n d???t nh?? tuy???n d???ng v??o nh???ng th??nh t??ch c???a m??nh theo m???t chu???i nh???ng ho???t ?????ng t??? ng??y b???n ??i h???c, th??? hi???n b???n l?? m???t ???ng vi??n xu???t s???c, tham gia ho???t ?????ng nhi???t t??nh, k??? n??ng m???m r???t t???t. Khi n??i v??? c??c th??nh t??ch trong c??ng vi???c, h??y k??? v??? c??c th??nh t??ch b???n ???? ?????t ???????c trong c??c d??? ??n tr?????c ????y, nh???ng gi?? tr??? mang l???i cho c??ng ty, k??? v??? vai tr?? c???a b???n trong d??? ??n, nh???ng c??ng vi???c ???? th???c hi???n hay c??? nh???ng kh?? kh??n ???? g???p ph???i trong qu?? tr??nh th???c hi???n. H??y th??? hi???n s??? t??m huy???t v???i c??ng vi???c, k??? c??? v???i c??ng vi???c ??? c??ng ty c??, b???n n??n n??u c???m x??c khi b???n ?????t ???????c nh???ng th??nh t???u v?? nh???ng b??i h???c t??ch c???c b???n r??t ra ???????c t??? nh???ng l???n ????.</p><p><br></p><p>Tham kh???o c??u tr??? l???i ph???ng v???n m???u b???ng Ti???ng Vi???t:</p><p>\"T??i t???ng ???????c b???u ch???n l??m nh??n vi??n c???a th??ng ch??? trong v??ng hai th??ng ?????u l??m vi???c ??? ??i???u r???t ??t ng?????i ?????t ???????c t???i c??ng ty X. Th??nh t???u n??y ?????n t??? vi???c ??p d???ng chu???n service trong ch????ng tr??nh h???c v??o m???t n??i c?? ho???t ?????ng chuy??n nghi???p nh?? c??ng ty X. ??i???u n??y tuy kh??ng ??em l???i l???i th??? t??i ch??nh nh??ng c?? gi?? tr??? tinh th???n r???t l???n v???i t??i\"</p><p><br></p><p>Tham kh???o c??u tr??? l???i ph???ng v???n m???u b???ng Ti???ng Anh:</p><p>\"I was nominated as the employee of the month in just the first two months of my job - something very few people achieve at company X. This achievement comes from applying service standards in the curriculum to a place where there are professional activities like Company X. This does not bring financial advantages, but it is of great spiritual value to me \"</p><p>4. T??nh hu???ng kh?? kh??n nh???t trong c??ng vi???c b???n t???ng g???p l?? g??? C??ch b???n gi???i quy???t v???n ????? kh?? kh??n ???? nh?? th??? n??o? (What was the toughest job situation you\'ve ever encountered? How do you solve that difficult problem?)</p><p>Khi h???i c??u n??y, NTD mu???n bi???t b???n c?? kh??? n??ng t?? duy ????? t??m ra gi???i ph??p cho t???t c??? v???n ????? b???n g???p ph???i hay kh??ng.</p><p><br></p><p>Tip: Ngay c??? khi v???n ????? c???a b???n l?? kh??ng c?? ????? th???i gian ????? h???c t???p, nghi??n c???u, b???n c??ng c???n cho NTD th???y c??ch b???n ???? ??i???u ch???nh th??? t??? ??u ti??n trong l???ch l??m vi???c c???a m??nh ????? gi???i quy???t n??. Vi???c n??y ch???ng t??? b???n l?? ng?????i c?? tinh th???n tr??ch nhi???m v?? c?? th??? t??? m??nh t??m ra gi???i ph??p cho v???n ????? g???p ph???i.</p><p>B???n c?? th??? tr??? l???i b???ng c??ch n??u l??n c??c kh?? kh??n g???p ph???i khi th???c hi???n c??ng vi???c, ?????m b???o tu??n th??? c??c k??? ho???ch, ho??n th??nh ????ng th???i h???n v?? qu???n l?? ngu???n ng??n s??ch. H??y s??? d???ng ?????i t??? ???t??i??? v?? nh???n m???nh c??c y???u t??? quan tr???ng (d???a tr??n nhu c???u v?? v??n ho?? c???a c??ng ty).</p><p><br></p><p>Tham kh???o c??u tr??? l???i ph???ng v???n m???u b???ng Ti???ng Vi???t:</p><p>\"Trong qu?? tr??nh l??m c??ng vi???c ch??m s??c kh??ch h??ng, t??i t???ng g???p tr?????ng h???p kh??ch h??ng ph??n n??n v??? s???n ph???m c???a c??ng ty m???t c??ch r???t kh?? ch???u v?? th???m ch?? h??? l???n ti???ng v???i t??i. ??i???u ?????u ti??n t??i l??m ch??nh l?? xin l???i kh??ch h??ng v?? ???? c?? nh???ng ??i???u ch??a h??i l??ng khi s??? d???ng s???n ph???m c???a c??ng ty. Sau ???? t??i ???? c??? g???ng t??m hi???u nguy??n do v?? kh??ch h??ng kh?? ch???u ?????ng th???i h???i ?? ki???n c???a c???p tr??n v??? nh???ng ch??nh s??ch ??u ????i cho kh??ch h??ng n??y\"</p><p><br></p><p>Tham kh???o c??u tr??? l???i ph???ng v???n m???u b???ng Ti???ng Anh:</p><p>\"In the process of customer care, I have encountered a customer who complained about the company\'s products in a very annoying way and they even raised their voice at me. The first thing I did was apologize for their dissatisfaction when using the company\'s products. After that, I tried to find out the reason why the customers were upset and consulted with superiors about preferential policies for customers.\"</p><p><br></p><p>\"I would describe myself as a hardworking and optimistic person who knows how to control my emotions and stay calm in situations where others cannot. I want to bring out the best in value for customers, imparting passion and trust in the product to make sure that the customer feels they are making the best choice \"</p><p><br></p><p><br></p><p>Tham kh???o c??u tr??? l???i ph???ng v???n m???u b???ng Ti???ng Anh:</p><p>\"I think both ways of doing things work for me when completing a given task. When I work independently, I focus better and during teamwork, I work together and achieve successful quickly. \"</p><p>12. Th???i gian r???nh b???n th?????ng l??m g??? (What do you usually do in your free time?)</p><p>Qua c??u h???i n??y, nh?? tuy???n d???ng mu???n bi???t xem s??? th??ch, th??i quen c???a b???n c?? ph???n n??o ???? g???n li???n v???i c??ng vi???c m?? b???n ??ang ???ng tuy???n hay kh??ng, b???n c?? th???c s??? ??am m?? v???i c??ng vi???c n??y kh??ng, c??u tr??? l???i ph???ng v???n c???a b???n s??? th??? hi???n m???t ph???n n??o ????.</p><p><br></p><p>Tip: B???n n??n li???t k?? nh???ng s??? th??ch ho???c th??i quen th?????ng ng??y li??n quan ?????n k??? n??ng c???n thi???t cho c??ng vi???c hi???n t???i. Li??n k???t c??u tr??? l???i c???a b???n v???i c??c n??ng l???c ???????c v???ch ra trong m?? t??? c??ng vi???c. Ch??? ra c??ch m?? c??c k??? n??ng v?? n??ng l???c ph?? h???p ???????c ph???n ??nh trong c??c ho???t ?????ng b???n th??ch.</p><p><br></p><p>Tham kh???o c??u tr??? l???i ph???ng v???n m???u b???ng Ti???ng Vi???t:</p><p>\"T??i r???t th??ch t??m hi???u v??? t??m l?? h???c n??n th???i gian r???nh t??i th?????ng t??m th??m nh???ng t??i li???u ph??n t??ch v??? t??m l?? ho???c ????ng k?? nh???ng kh??a h???c t??m hi???u v??? b???n th??n v?? c??ch ph??n ??o??n h??nh vi x??c ?????nh t??nh c??ch nh?? DISC\"</p><p><br></p><p>Tham kh???o c??u tr??? l???i ph???ng v???n m???u b???ng Ti???ng Anh:</p><p>\"I love to learn about psychology so in my free time I often look for more psychological analysis materials or take courses on self-understanding and behavioral judgment like DISC\"</p><p><br></p>','2022-03-06 07:53:11',NULL,'','/api/file/images/upload/1/1667695990996_1667695990996_most-common-interview-questions.webp','nhung-cau-hoi-phong-van-viec-lam-thuong-gap--cach-tra-loi-hay-nhat-bang-tieng-anh-va-tieng-viet','Nh???ng c??u h???i ph???ng v???n vi???c l??m th?????ng g???p & c??ch tr??? l???i hay nh???t b???ng ti???ng Anh v?? ti???ng Vi???t','2022-11-21 05:53:15',1,'PUBLIC'),(28,'<p>Sau khi tr???i qua nh???ng ng??y th??ng c???ng hi???n h???t m??nh cho s??? nghi???p, b???n c??ng ???? quy???t ?????nh r???i kh???i n??i m?? b???n ???? l??m vi???c su???t bao n??m qua. B???n ???? l??m vi???c v???i m???t ng?????i trong m???t th???i gian d??i v?? b???n ngh?? kh?? c?? th??? t??m th???y ???????c m???t ai kh??c gi???ng nh?? h??? ??? n??i l??m vi???c m???i,... B???n lo l???ng r???ng s??? ????nh m???t t??nh b???n n??y d?? ???? tr???i qua nh???ng kho???ng th???i gian l??m vi???c v?? ?????ng h??nh v???i nhau.</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">C?? nhi???u ng?????i cho r???ng khi ngh??? vi???c ??? c??ng ty c?? th?? ?????ng ngh??a v???i vi???c c???t ?????t nh???ng m???i quan h??? v???i ?????ng nghi???p c?? v?? h??? cho r???ng nh???ng m???i quan h??? n??y kh??ng c?? t??c d???ng trong c??ng vi???c. V???y, l???i ??ch c???a vi???c gi??? m???i quan h??? v???i ?????ng nghi???p c?? sau khi ngh??? vi???c? v?? c??ch c??ch gi??p b???n gi??? v???ng m???i quan h??? v???i ?????ng nghi???p c??.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">L???i ??ch c???a vi???c gi??? m???i quan h??? v???i ?????ng nghi???p ngay c??? khi ngh??? vi???c</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">M???t quan h??? t???t v???i ?????ng nghi???p kh??ng ch??? mang t???i cho b???n nhi???u l???i ??ch trong qu?? tr??nh l??m vi???c hay khi b???n ???? ngh??? vi???c. Trong qu?? tr??nh c??n l??m vi???c, m???i quan h??? t???t v???i ?????ng nghi???p gi??p b???n gi???i quy???t, chia s??? nh???ng c??ng vi???c qu?? t???i, gi??p ????? b???n ho??n th??nh c??c nhi???m v??? kh?? kh??n hay c?? th??? c??ng t??n g???u trong gi??? ngh??? gi???i lao. ?????ng th???i, m???i quan h??? t???t v???i ?????ng nghi???p c??n gi??p b???n t???p trung v??o c??c c?? h???i ????? ph??t tri???n s??? nghi???p thay v?? ti??u t???n th???i gian v?? n??ng l?????ng cho nh???ng v???n ????? m?? m???i quan h??? ti??u c???c mang l???i.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Kh??ng ch??? th???, vi???c gi??? li??n l???c kh??ng ch??? v??? t??nh b???n n??i c??ng s???, m?? v???n ????? n??y c??ng r???t quan tr???ng ????? gi??? m???i quan h??? t???t v???i ?????ng nghi???p v?? l?? do ngh??? nghi???p. H??? c?? th??? l?? ng?????i gi???i thi???u cho b???n m???t vi???c l??m m???i th?? v??? h??n, nhi???u ch??? ????? t???t. Hay h??? c?? th??? gi??p b???n gi???i quy???t nh???ng v???n ????? ??? ch??? l??m m???i. Th???m ch??, khi b???n ??i xin vi???c, nh?? tuy???n d???ng c?? th??? s??? d???ng m???c tham kh???o trong h??? s?? c?? nh??n c???a b???n ????? ki???m tra v??? th??i ????? l??m vi???c hay nh???ng kinh nghi???m ???? c??, v???y n??n, b???n c??ng c???n h??a ?????ng v???i m???i ng?????i, ch??m ch??? l??m vi???c ????? khi nh?? tuy???n d???ng ki???m tra, th?? nh???ng ?????ng nghi???p s??? l?? ng?????i n??i t???t cho b???n.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">C??c c??ch gi??p b???n gi??? v???ng m???i quan h??? v???i ?????ng nghi???p c?? ngay c??? khi ngh??? vi???c</strong></h2><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">G???p g??? ngo??i gi??? l??m vi???c</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Vi???c b???n r???i ??i, b???n b???t ?????u c?? m???t cu???c s???ng m???i v?? k??? ho???ch c???a b???n c??ng b??? thay ?????i d???n nh??ng k??? ho???ch v?? th???i gian c???a ?????ng nghi???p c???a b???n v???n v???y. V??, n???u b???n ng?????ng ng??ng kh??ng li??n l???c v???i ?????ng nghi???p v?? lo l??m phi???n h??? th?? m???i quan h??? c???a c??c b???n s??? kh??ng c??n kh??ng kh??t nh?? x??a. V???y n??n, ?????ng ng???n ng???i m?? gi??? li??n l???c v???i h??? b???ng c??ch g???p g??? nhau tr?????c v?? sau khi l??m vi???c. B???n v?? ?????ng nghi???p c?? c?? chung s??? th??ch ??i b??? hay t???p gym v??o bu???i s??ng, vi???c ??i t???p th??? d???c m???t m??nh s??? r???t ch??n, b???n c?? th??? li??n h??? v???i ?????ng nghi???p c?? v?? h???n h??? c??ng ??i t???p th??? d???c v???i nhau.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">H??y c??? t???n d???ng nh???ng bu???i s??ng s???m ????? gi??? m???i quan h??? b???n b?? trong c??ng vi???c. B???t chuy???n v???i ?????ng nghi???p c??, r??? h??? c??ng nhau ??i l??m hay ??i u???ng c?? ph?? v??o cu???i tu???n. N???u nh?? v??n ph??ng l??m vi???c c???a b???n g???n v???i c??ng ty c??, b???n c?? th??? y??n t??m g???p g??? b???n c?? ??? ????, ho???c trong gi??? ngh??? tr??a v?? b???n c?? th??? c??ng ??i ??n tr??a v???i h???, hay th???m ch??, b???n c?? th??? gi???i thi???u b???n b?? m???i ??? ch??? l??m m???i v???i ?????ng nghi???p c??. N???u nh?? b???n l?? d??n c?? ????m, b???n c?? th??? t???n d???ng t???i ??a sau gi??? l??m vi???c, r??? h??? ??i u???ng ??? qu??n bar quen thu???c. S??? kh??ng thi???u c??ch gi??p b???n t???n d???ng t???i ??a th???i gian ????? g???p g??? h???, ch??? c???n s???p x???p l???ch ngh??? ng??i h???p l?? ????? b???n c?? th??? l??n k??? ho???ch v???i ?????ng nghi???p c?? c???a b???n.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">T??m ??i???m chung m???i</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">M???i ng?????i ?????u thay ?????i theo th???i gian, b???n kh??ng th??? duy tr?? m??i m???t t??nh b???n d???a tr??n nh???ng ??i???m chung m?? b???n ???? t???ng c??. N???u nh?? l??c tr?????c, b???n v???i ?????ng nghi???p k???t n???i v???i nhau b???ng c??ng vi???c, th?? hi???n t???i b???n c?? th??? t??m c??ch k???t n???i v???i ?????ng nghi???p c?? b???ng nh???ng ??i???u m?? c??? hai c??ng quan t??m, nh??: th??? lo???i phim, cu???n s??ch, game,???&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">T??m b???t c??? ??i???u g?? ???? v?? t???p trung v??o ch??ng thay v?? ch??? n??i chuy???n v???i nhau v??? c??ng vi???c d?? c??c b???n ???? t???ng l??m vi???c v???i nhau. H??y h???n ch??? n??i v??? c??ng vi???c c???a c??? hai v?? h??? kh??ng mu???n nghe b???n ???? thuy???t tr??nh nh?? th??? n??o v?? bu???i h???p c???a s???p b???n ????a ra nh???ng ?? t?????ng g??,..</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Kh??ng n??n th??? hi???n s??? ti??u c???c c???a b???n v??? c??ng ty c??</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">N???u b???n r???i c??ng vi???c b???i nh???ng ??i???u b???t m??n v???i c??ng vi???c hay s???p c???a b???n th?? khi ngh??? vi???c, b???n v???n c??n m???t s??? c???m x??c ti??u c???c v???i n??i l??m vi???c c??. Khi b???n c??n l??m ??? c??ng ty c??, b???n v???i ?????ng nghi???p l??m vi???c c??ng nhau v?? c??? hai ?????u c?? nh???ng c???m x??c b???t m??n v???i c??ng vi???c. V???y n??n, khi b???n v???n c??n ch??i v???i ?????ng nghi???p c??, h??y c??? g???ng kh??ng th??? hi???n nh???ng c???m x??c b???t m??n v??? c??ng ty m?? h??? v???n ??ang l??m vi???c. B???n c?? th??? l???ng nghe h??? than th??? v??? c??ng ty, v??? c??ng vi???c nh??m ch??n m?? h??? ??ang l??m. Nh??ng, b???n c???n l??u ?? kh??ng n??n n??i v??? m??i tr?????ng c??ng vi???c m???i c???a b???n tuy???t v???i ra sao hay nh???c v??? nh???ng sai l???m c???a ?????ng nghi???p trong c??ng vi???c hi???n t???i. D?? b???n ch??? mu???n xoa d???u h??? nh??ng ???? l?? c??ch kh??ng n??n c??n nh???c v?? kh?? ????? ph??t tri???n b???n v???ng m???t m???i quan h???</span></p><p><br></p>','2022-05-06 07:54:45',NULL,'','/api/file/images/upload/1/1667696085022_1667696085022_6-1200x900-1.jpg','giu-moi-quan-he-voi-ong-nghiep-ngay-ca-khi-nghi-viec--toi-a-hoc-uoc-gi','Gi??? m???i quan h??? v???i ?????ng nghi???p ngay c??? khi ngh??? vi???c ??? t??i ???? h???c ???????c g???','2022-11-06 07:54:45',1,'PUBLIC'),(29,'<h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">?????nh ngh??a CV l?? g???</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">CV l?? vi???t t???t c???a c???m t??? Ti???ng anh ???Curriculum Vitae???, c?? ngh??a l?? b???n t??m t???t v??? th??ng tin c?? nh??n, m???c ti??u ngh??? nghi???p ng???n h???n v?? d??i h???n, qu?? tr??nh h???c t???p c??ng nh?? c??c k??? n??ng c???a b???n th??n ????? g??y ???n t?????ng v???i nh?? tuy???n d???ng.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Th??ng qua CV xin vi???c, nh?? tuy???n d???ng s??? bi???t ???ng vi??n l?? ai, ?????n t??? ????u c?? th??nh t??ch, chuy??n m??n, s??? tr?????ng g??,??? ????? c??n nh???c xem ???ng vi??n c?? ph?? h???p v???i ti??u ch?? tuy???n d???ng hay kh??ng. V?? th???, chu???n b??? m???t b???n CV xin vi???c th???t ch???n chu l?? y???u t??? c???n ???????c ??u ti??n h??ng ?????u tr??n h??nh tr??nh t??m ki???m m???t c??ng vi???c nh?? ??.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">K??? n??ng vi???t CV ???n t?????ng v???i nh?? tuy???n d???ng</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">K??? n??ng vi???t CV ti???ng Anh&nbsp;hay ti???ng Vi???t c??ng ?????u c???n ch???n chu. ??i???u n??y c?? ngh??a l?? trong b???n CV g???i ?????n nh?? tuy???n d???ng s??? c???n ?????y ????? c??c m???c sau: th??ng tin c?? nh??n, m???c ti??u ngh??? nghi???p ng???n h???n v?? d??i h???n, h???c v???n, k??? n??ng, ch???ng ch???, kinh nghi??m vi???c l??m.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">V???i t???ng ?????i t?????ng,&nbsp;k??? n??ng vi???t CV xin vi???c&nbsp;nh???n m???nh ??? m???i m???c l?? kh??c nhau. N???u ng?????i ???? ??i l??m th?????ng nh???n m???nh ?????n m???c ti??u ng???n h???n, d??i h???n, kinh nghi???m l??m vi???c th?? v???i c??c b???n sinh vi??n m???i ra tr?????ng, CV c???n nh???n m???nh ?????n k??? n??ng v?? h???c v???n m?? c??c b???n c?? ???????c. Nh??ng nh??n chung, c??ch vi???t CV chu???n s??? nh?? sau:</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Th??ng tin c?? nh??n</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">S??? bao g???m m???c: h??? t??n, ng??y th??ng n??m sinh, s??? ??i???n tho???i, email, ?????a ch??? li??n h???. Nh?? tuy???n d???ng s??? d???a v??o nh???ng th??ng tin n??y ????? li??n h??? v???i b???n n???u nh?? CV ?????t y??u c???u. V?? th???, b???n c???n vi???t ?????y ????? v?? ch??nh x??c c??c th??ng tin n??y. M???t l??u ?? nh??? d??nh cho b???n l?? h??y ????? ???nh ch???p r?? n??t v?? d??ng email c?? t??n nghi??m t??c.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">M???c ti??u ngh??? nghi???p</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">C??c nh?? tuy???n d???ng n??i r???ng, h??? ch?? ?? nhi???u ?????n ph???n m???c ti??u ngh??? nghi???p trong CV m?? ???ng vi??n g???i v???. V?? th???, kh??ng n??i qu?? khi&nbsp;k??? n??ng vi???t CV xin vi???c&nbsp;l?? y???u t??? quan tr???ng trong ph???n n??y.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">M???c ti??u ngh??? nghi???p ch??nh l?? ?????nh h?????ng vi???c l??m hi???n t???i v?? t????ng lai c???a ???ng vi??n. M???c n??y s??? gi??p nh?? tuy???n d???ng ????nh gi?? ???????c t??nh c??ch c???a ???ng vi??n, c??ng nh?? bi???t ???????c ???ng vi??n c?? tinh th???n c???u ti???n v?? mu???n g???n b?? l??u d??i v???i doanh nghi???p hay kh??ng.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">??? ph???n n??y b???n c?? th??? chia ra 2 m???c ti??u ng???n h???n v?? d??i h???n. V???i m???c ti??u ng???n h???n, b???n h??y n??u nh???ng g?? mu???n h???c, mu???n trau d???i trong qu?? tr??nh l??m vi???c. ?????i v???i m???c ti??u d??i h???n, b???n h??y n??u nh???ng gi?? tr??? b???n t???o ???????c cho c??ng ty, mu???n th??ng ti???n c??ng vi???c trong t????ng lai c??ng nh?? s??? nghi???p v?? c?? c?? h???i ph??t tri???n b???n th??n m??nh qua t???ng ng??y.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Kinh nghi???m l??m vi???c</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Kinh nghi???m l??m vi???c ???????c xem l?? ph???n quan tr???ng nh???t trong m???t CV xin vi???c. ??? ph???n n??y, b???n h??y tr??nh b??y v??? qu?? tr??nh l??m vi???c (n???u c??) c???a b???n ???? tr???i qua nh?? th??? n??o. B???n ???? t???ng l??m ??? c??ng ty n??o? ???? ?????m nh???n nh???ng v??? tr?? n??o? B???n ???? c?? nh???ng kinh nghi???m, th??nh t???u hay k??? n??ng n??o trong qu?? tr??nh l??m vi???c.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">K??? n??ng vi???t CV ???n t?????ng&nbsp;???????c th??? hi???n qua c??ch tr??nh b??y chu???n ch???nh, li???t k?? c??ng vi???c theo th??? t??? th???i gian, ????a c??c con s??? v??o ????? d???n ch???ng. ?????ng th???i m?? t??? ng???n g???n, s??c t??ch nh??ng ?????y ????? v??? nh???ng c??ng vi???c m?? b???n ???? l??m c?? li??n quan ?????n v??? tr?? ??ang ???ng tuy???n.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">H???c v???n</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">H??y vi???t th???t ng???n g???n, r?? r??ng v??? t??n tr?????ng ?????i h???c, chuy??n ng??nh, lo???i b???ng v?? ch???ng ch??? b???n ???? h???c th??m (n???u c??). N??n ghi th??m gi???i th?????ng, d??? ??n ???? tham gia v?? ?????t th??nh t???u g??. ?????i v???i nh???ng b???n sinh vi??n m???i ra tr?????ng, b???n h??y ghi th??m h???c b???ng ???? ?????t ???????c (n???u c??) trong qu?? tr??nh h???c. ??i???u n??y s??? l?? ??i???m c???ng trong m???t nh?? tuy???n d???ng n???u nh?? th??nh t??ch b???n xu???t s???c.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">K??? n??ng v?? ch???ng ch???</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">????y l?? m???c kh?? quan tr???ng v?? kh??ng ???????c ph??p b??? qua khi b???n vi???t CV. B???n h??y n??u nh???ng k??? n??ng v?? ch???ng ch??? m?? trong qu?? tr??nh ng???i ??? gi???ng ???????ng hay ??i l??m b???n ???? h???c ???????c: giao ti???p t???t, l???p k??? ho???ch t???t, ch???ng ch??? ngo???i ng???, tin h???c v??n ph??ng, v?? c??c ch???ng ch??? kh??c li??n quan ?????n v??? tr?? b???n ??ang ???ng tuy???n???</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">M???t s??? ch?? ?? khi vi???t CV cho sinh vi??n m???i ra tr?????ng</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Ngo??i&nbsp;c??c k??? n??ng vi???t CV xin vi???c, ????? h??? s?? xin vi???c c???a b???n g??y ???n t?????ng v?? l???t v??o m???t xanh c???a nh?? tuy???n d???ng, b???n c???n l??u ?? m???t s??? ??i???m sau:&nbsp;</span></p><ul><li class=\"ql-align-justify\"><span style=\"background-color: initial;\">Trong m???t b???n CV s??? d???ng t???i ??a 2 ki???u ch???, nh???ng ki???u ch??? chuy??n nghi???p, d??? nh??n v?? hay ???????c s??? d???ng l??: Times New Roman, Arial, Tahoma, Serif. N???u trong m???t b???n CV c?? qu?? nhi???u ki???u ch??? v?? m??u s???c l???n x???n s??? l??m nh?? tuy???n d???ng r???i m???t v?? r???t d??? b??? qua CV c???a b???n.</span></li><li class=\"ql-align-justify\"><span style=\"background-color: initial;\">????? d??i ph?? h???p c???a m???t b???n CV xin vi???c cho sinh vi??n m???i ra tr?????ng th?????ng l?? 1 trang A4. Nh?? tuy???n d???ng ch??? m???t 15 ??? 20 gi??y ????? ?????c CV c???a b???n. V?? v???y, CV c???a b???n r???t d??? b??? b??? qua n???u vi???t qu?? d??i, lan man v?? kh??ng ????ng tr???ng t??m.</span></li><li class=\"ql-align-justify\"><span style=\"background-color: initial;\">Ch???c ch???n r???ng m???i v??? tr?? tuy???n d???ng s??? c?? nh???ng y??u c???u c??ng vi???c kh??c nhau. V?? th???, b???n kh??ng th??? d??ng c??ng m???t b???n CV ????? n???p v??o hai v??? tr?? kh??c nhau ???????c. B???n n??n n??u r?? ??i???m m???nh c???a b???n th??n cho ph?? h???p t???ng v??? tr?? m?? m??nh ???ng tuy???n.</span></li></ul><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Hi???n nay, CV xin vi???c l?? ph???n kh??ng th??? thi???u trong qu?? tr??nh ???ng tuy???n t??m vi???c l??m. ????y ???????c coi l?? c??nh c???a ?????u ti??n m?? b???n ph???i v?????t qua ????? ch???m tay t???i c??ng vi???c m?? ?????c. D???a v??o nh???ng&nbsp;k??? n??ng vi???t CV v?? ph???ng v???n xin vi???c&nbsp;tr??n ????y, b???n h??y ?????u t?? th???i gian v?? c??ng s???c ????? t???o n??n m???t b???n CV th???t s??? ???n t?????ng v?? thuy???t ph???c ???????c c??c nh?? tuy???n d???ng nh??!</span></p><p><br></p>','2022-07-06 07:56:55',NULL,'CV xin vi???c lu??n l?? m???t t??i li???u quan tr???ng m?? b???n ph???i g???i ?????n nh?? tuy???n d???ng khi ??i xin vi???c. D?? ???? bi???t ?????n t???m quan tr???ng c???a CV, nh??ng nhi???u ng?????i v???n ch??a bi???t l??m c??ch n??o ????? vi???t CV sao cho chu???n, g??y ???n t?????ng v???i nh?? tuy???n d???ng. Theo c??c chuy??n gia tuy???n d???ng, nh???n m???nh v??o nh???ng g?? l?? l???i th??? c???a m??nh l?? k??? n??ng vi???t CV v?? ph???ng v???n xin vi???c th??ng minh. V???y k??? n??ng vi???t CV ???n t?????ng g???m nh???ng g??? Kh??m ph?? ngay nh??!','/api/file/images/upload/1/1667696215036_1667696215036_shutterstock_2125009718.jpg','viet-cv-sao-cho-chuan-nhung-ky-nang-viet-cv-ma-ban-can-biet','Vi???t CV sao cho chu???n? Nh???ng k??? n??ng vi???t CV m?? b???n c???n bi???t','2022-11-06 07:56:55',1,'PUBLIC'),(30,'<h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">K??? n??ng thuy???t tr??nh l?? g???</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">K??? n??ng thuy???t tr??nh l?? kh??? n??ng truy???n ?????t th??ng ??i???p, v???n ????? m???t c??ch ????n gi???n, hi???u qu??? v?? h???p d???n ?????n m???t nh??m ng?????i nghe.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Trong bu???i thuy???t tr??nh, ng?????i n??i c???n h?????ng t???i m???c ti??u gi??p ng?????i nghe hi???u ???????c nh???ng g?? b???n th??n ??ang n??i, gi???i quy???t m???t v???n ????? c???a h???, hay ch??? ????n gi???n l?? ti???p nh???n m???t th??ng tin m???i m??? n??o ????.&nbsp;</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">L???i ??ch c???a k??? n??ng thuy???t tr??nh</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">K??? n??ng thuy???t tr??nh l?? k??? n??ng m???m quan tr???ng gi??p ng?????i n??i truy???n ?????t ???????c c??c th??ng tin ph???c t???p ?????n ng?????i nghe theo m???t c??ch ????n gi???n v?? th?? v??? nh???t.&nbsp;T???m quan tr???ng c???a k??? n??ng thuy???t tr??nh&nbsp;???????c th??? hi???n nhi???u trong c??ng vi???c v?? cu???c s???ng.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">?????u ti??n, c?? k??? n??ng thuy???t tr??nh t???t qu?? tr??nh ph???ng v???n xin vi???c c???a b???n s??? tr??? n??n thu???n l???i h??n. Nhi???u ng?????i ??i l??m ?????ng ?? r???ng k??? n??ng thuy???t tr??nh r???t quan tr???ng ?????i v???i th??nh c??ng c???a h??? trong c??ng vi???c. C??&nbsp;k??? n??ng thuy???t tr??nh v?? ????m ph??n&nbsp;t???t kh??ng ch??? t??ng c?? h???i th??nh c??ng c???a ng?????i lao ?????ng m?? c??n cho ph??p h??? ????ng g??p nhi???u h??n cho doanh nghi???p.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Vai tr?? c???a k??? n??ng thuy???t tr??nh&nbsp;c??n th??? hi???n ??? v??? tr?? qu???n l??. N???u k??? n??ng thuy???t tr??nh k??m, c??c nh?? qu???n l?? s??? kh??ng th??? truy???n ?????t ???????c c???m h???ng cho c??c th??nh vi??n trong ?????i nh??m. Th???m ch?? l?? s???n ph???m s??? kh??ng b??n ???????c, doanh nghi???p c??ng s??? kh??ng thu h??t ???????c ngu???n ?????u t?? v?? kh??ng th??? ph??t tri???n ???????c.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">M???c d??&nbsp;vai tr?? c???a k??? n??ng thuy???t tr??nh&nbsp;l?? r???t l???n nh??ng nhi???u ng?????i v???n mang trong m??nh n???i s??? n??y v???i m???t s??? bi???u hi???n nh??: C???m gi??c h???i h???p v?? s??? h??i khi ph???i thuy???t tr??nh tr?????c ????m ????ng, c?? nh???ng suy ngh?? ti??u c???c v??? c??c t??nh hu???ng x???u c?? th??? x???y ra v???i b???n th??n trong khi ??ang thuy???t tr??nh, c??ng c?? ??? v??ng c??? v?? l??ng, n??i l?? nh?? ho???c y???u ???t, th??? h???n h???n ho???c n??i kh??ng ra h??i. Nh???ng ng?????i mang n???i s??? ???n???ng h??n??? c??n c?? bi???u hi???n ho???ng h???t t???t ????? khi ??ang n??i ho???c r??i v??o t??nh tr???ng ???tim ?????p ch??n run???, m??? h??i nh??? nh???i, m???t ????? b???ng,???</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">V???y l??m th??? n??o ?????&nbsp;n??ng cao k??? n??ng thuy???t tr??nh tr?????c ????m ????ng?</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">C??ch r??n luy???n k??? n??ng thuy???t tr??nh tr?????c ????m ????ng</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">????? v?????t qua n???i s??? mang t??n ???thuy???t tr??nh tr?????c ????m ????ng??? l?? ??i???u kh??ng h??? d??? d??ng. Tuy nhi??n, n???u ki??n tr?? th???c hi???n c??c&nbsp;gi???i ph??p n??ng cao k??? n??ng thuy???t tr??nh&nbsp;d?????i ????y, k??? n??ng c???a b???n s??? tr??? n??n nhu???n nhuy???n h??n. Qua ????, c??ng vi???c s??? tr??? n??n thu???n l???i h??n</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">T???o c??c slide tr??nh b??y ????n gi???n</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Tr??n th???c t???, n???u slide tr??nh b??y n???i dung c??ng kh?? hi???u, b???n s??? c??ng g???p kh?? kh??n trong vi???c truy???n t???i c??c th??ng ??i???p, v???n ????? ?????n kh??n gi???. ?????&nbsp;n??ng cao k??? n??ng thuy???t tr??nh hi???u qu???, b???n n??n t???o c??c slide ????n gi???n.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">C??c chuy??n gia n??i r???ng, h??y l??m cho k??ch th?????c ph??ng ch??? c???a b??i thuy???t tr??nh g???p ????i ????? tu???i trung b??nh c???a ?????i t?????ng kh??n gi??? ??ang nghe. C?? ngh??a l?? ph??ng ch??? trong slide ch??? n???m trong kho???ng t??? 60 ?????n 80 pt.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">B??n c???nh ????, n???i dung c??c slide n??n l??m n???i b???t c??c ??i???m tr???ng t??m, kh??ng bao gi??? n??n l?? to??n b??? c??c ??i???m ch??nh. B???i kh??n gi??? s??? ch?? ?? ?????n slide, l??c n??y b???n s??? ch???ng c??n g?? ????? n??i v???i ng?????i nghe khi h??? ???? t??m th???y c??c th??ng tin c???n thi???t ngay tr??n slide.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Ki???m tra tr?????c khi tr??nh b??y</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Khi ???? s??? thuy???t tr??nh tr?????c ????m ????ng, b???t c??? m???t s??? c??? n??o x???y ra c??ng l??m cho bu???i thuy???t tr??nh tr??? n??n t???i t??? h??n. V?? th???, b???n h??y t???o m???t th??i quen ??i xung quanh ph??ng ????? ki???m tra t???m nh??n, ki???m tra micro v?? ch???y th??? b??i thuy???t tr??nh ????? ?????m b???o n?? s???n s??ng ho???t ?????ng??? Sau khi l??m nh???ng ??i???u n??y, ch???c h???n b???n s??? c???m th???y tho???i m??i h??n trong s??? quen thu???c v?? t??ng th??m s??? t??? tin.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">M??? ?????u b???ng m???t ??i???u m???i m??? m?? kh??n gi??? kh??ng bi???t</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Khi ng???i n??i tr?????c ????m ????ng, n???u ng?????i nghe kh??ng h???ng th??, n???i s??? n??y l???i c??ng l???n th??m. Khi ????, b???n s??? kh?? kh??n trong vi???c thuy???t tr??nh c???a m??nh. V?? th???, kh??i g???i h???ng th??, ch?? ?? c???a ng?????i nghe l??&nbsp;c??ch r??n luy???n k??? n??ng thuy???t tr??nh tr?????c ????m ????ng&nbsp;b???n c???n ch?? ??.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">H??y b???t ?????u bu???i thuy???t tr??nh b???ng m???t th??ng tin th???c s??? m???i m??? li??n quan ?????n ch??? ????? c???a b???n. V?? d??? nh??: ???B???n c?? bi???t khi b???n ????? m???t, d??? d??y c???a b???n c??ng s??? chuy???n sang m??u ????? kh??ng????. L??c n??y, nhi???u kh??? n??ng ng?????i nghe s??? ng???ng cao ?????u v?? ngh?? ???Th???t sao? Wow ???.???, v?? s??? ch?? ?? h??n v??o b??i thuy???t tr??nh c???a b???n.&nbsp;</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Cung c???p c??c th??ng tin gi?? tr???&nbsp;</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">????? n??ng cao k??? n??ng thuy???t tr??nh tr?????c ????m ????ng, b???n c???n ?????m b???o lu??n cung c???p cho ng?????i nghe c??c th??ng tin c?? gi?? tr???. Cho d?? th??ng ??i???p hay ?????n ????u m?? ng?????i nghe kh??ng th??? ??p d???ng v??o c??ng vi???c, cu???c s???ng th?? bu???i thuy???t tr??nh c???a b???n c??ng kh??ng th??? th??nh c??ng ???????c.&nbsp;&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Theo Di???n gi??? Qu??ch Tu???n Khanh ??? m???t trong nh???ng di???n gi??? h??ng ?????u Vi???t Nam: ???thuy???t tr??nh c??ng l?? m???t ph????ng ti???n truy???n th??ng, v?? nhi???m v??? c???a ng?????i thuy???t tr??nh l?? h?????ng ?????n l???i ??ch chung c???a ????m ????ng, ch??? kh??ng ph???i ????? th??? hi???n th????ng hi???u c?? nh??n. V?? th???, m???c ti??u c???a m???t b??i thuy???t tr??nh lu??n l?? ????? khi???n cho ng?????i kh??c thay ?????i t???t h??n, ho???c ????? gi???i quy???t v???n ????? ???? theo h?????ng t??ch c???c???.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">V?? th???, ????? ????nh tan n???i s??? thuy???t tr??nh tr?????c ????m ????ng b???n c???n t??m hi???u ?????y ????? c??c th??ng tin tr?????c khi di???n thuy???t. B???n c???n bi???t ng?????i nghe c???a b???n l?? ai, h??? c???n g?? v?? ??i???u g?? s??? t??c ?????ng l??m cho h??? thay ?????i. B??n c???nh ????, tr?????c khi thuy???t tr??nh b???n c??ng n??n ???x???c d???y??? ???????c s??? ch?? ?? c???a ng?????i nghe b???ng c??ch gi???i thi???u v??? b???n th??n, th???m quy???n, v?? chuy??n m??n ?????i v???i v???n ????? s???p tr??nh b??y. Khi ????, kh??n gi??? s??? x??c ?????nh ???????c l?? h??? c?? n??n tin ho???c n??n c?? th??i ????? nh?? th??? n??o ?????i v???i nh???ng th??ng tin m?? b???n s???p n??i.&nbsp;</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">T???o c???m x??c ??? c??ch r??n luy???n k??? n??ng thuy???t tr??nh hi???u qu???&nbsp;</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">M???t sai l???m m?? nhi???u ng?????i thuy???t tr??nh k??m ??ang m???c ph???i l?? ch??? t???p trung v??o n???i dung c???n tr??nh b??y m?? qu??n m???t ??i???u quan tr???ng l?? n??i nh?? th??? n??o. C?? nh???ng n???i dung th??? chuy???n t???i h???t ???????c qua kh???i l?????ng c??u ch??? ng???n ng???i c???a b??i thuy???t tr??nh trong th???i l?????ng kho???ng 30 ?????n 45 ph??t. Tuy nhi??n, n???u k???t h???p v???i c???m x??c ???????c th??? hi???n trong gi???ng n??i v?? ng??n ng??? c?? th??? khi tr??nh b??y, ng?????i nghe c?? th??? hi???u ???????c tr???n v???n n???i dung m?? b???n ??ang tr??nh b??y.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">?????&nbsp;r??n luy???n k??? n??ng thuy???t tr??nh tr?????c ????m ????ng, b???n c?? th??? s??? d???ng b???n ????? t?? duy, ??p d???ng c??c c??ng c??? gi???ng n??i v?? ng??n ng??? c?? th??? ????? n??ng cao kh??? n??ng tr??nh b??y t???t v?? truy???n ?????t ???????c c???m x??c m???t c??ch t??? nhi??n nh???t.&nbsp;</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Kh??ng n??n k??o qu?? d??i th???i gian thuy???t tr??nh</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">N???u c?? 30 ph??t ????? tr??nh b??y b???n ch??? n??n s??? d???ng 25 ph??t. N???u c?? m???t gi???, b???n h??y s??? d???ng 50 ph??t. H??y lu??n t??n tr???ng th???i gian c???a kh??n gi??? v?? k???t th??c s???m bu???i thuy???t tr??nh. ????? l??m ???????c ??i???u n??y, b???n c???n r??n luy???n k??? n??ng n??i trong ??i???m v?? nh???n m???nh v??o c??c ?? ch??nh c???n tr??nh b??y. Tr??n th???c t???, ng?????i nghe ch??? nghe ???????c kho???ng h??n m???t n???a l?????ng th??ng tin b???n cung c???p. V?? th??? v??o cu???i gi???, b???n h??y c???ng c??? v?? t??m l???i c??c ??i???m ch??nh ????? ng?????i nghe c?? th??? n???m ???????c c??c ?? m?? b???n ??ang mu???n truy???n t???i.</span></p><h3 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Tham kh???o nh???ng ng?????i thuy???t tr??nh kh??c&nbsp;</strong></h3><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">C??ch r??n luy???n k??? n??ng thuy???t tr??nh tr?????c ????m ????ng&nbsp;t???t nh???t l?? tham d??? c??ng nhi???u bu???i thuy???t tr??nh tr???c ti???p c??ng t???t. Qua ????, b???n c?? th??? h???c ???????c c??c k??? n??ng n??i c??ng nh?? ph???n ???ng c???a c?? th??? t??? nh???ng h???. B???n c?? th??? tham gia c??c kh??a h???c k??? n??ng thuy???t tr??nh, tham kh???o c??c b??i gi???ng k??? n??ng thuy???t tr??nh ???????c ph??t tr??n Youtube.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Vi???c&nbsp;c???i thi???n k??? n??ng thuy???t tr??nh tr?????c ????m ????ng&nbsp;s??? kh??ng th??? th???c hi???n ???????c trong m???t ng??y m???t ????m, m?? s??? m???t r???t nhi???u c??ng s???c v?? s??? n??? l???c t??? b???n. V?? th???, b???n h??y ki??n tr?? th???c hi???n theo c??c gi???i ph??p tr??n ????y ????? v?????t qua n???i s??? n??y. V?? xa h??n l?? t??ng c?? h???i tr??? th??nh m???t ng?????i thuy???t tr??nh m?? ng?????i s??? y??u th??ch, ?????ng th???i t???o d???ng ???????c th????ng hi???u c?? nh??n t??ch c???c trong m???t m???i ng?????i xung quanh.</span></p><p><br></p>','2022-08-06 07:58:20',NULL,'N???u b???n ??ang s??? thuy???t tr??nh tr?????c ????m ????ng, h??y nh??? r???ng b???n kh??ng ph???i l?? ng?????i duy nh???t c?? n???i s??? n??y. Theo k???t qu??? cu???c nhi???u cu???c kh???o s??t, c?? ?????n 75% ng?????i ???????c h???i th???a nh???n r???ng m??nh mang n???i s??? n??y. Tuy nhi??n, trong c??ng vi???c hay cu???c s???ng ?????u c???n ?????n k??? n??ng thuy???t tr??nh. K??? n??ng thuy???t tr??nh tr?????c ????m ????ng t???t l?? ??i???u m???u ch???t gi??p b???n thu ph???c nh??n t??m, ?????ng th???i t???o ?????ng l???c cho nh???ng ng?????i xung quanh.','/api/file/images/upload/1/1667696299811_1667696299811_New-Project-2.jpg','vuot-qua-noi-so-mang-ten-thuyet-trinh-truoc-am-ong','V?????t qua n???i s??? mang t??n thuy???t tr??nh tr?????c ????m ????ng','2022-11-06 07:58:20',1,'PUBLIC'),(31,'<p class=\"ql-align-justify\"><span style=\"background-color: initial;\">L??m th??? n??o ????? b???n nh???n ra ???????c m???t c??ng ty c?? n???n v??n h??a doanh nghi???p t???t? L??m sao ????? b???n bi???t b???n ph?? h???p v???i c??ng ty n??y? Kh??ng c?? c??ch n??o kh??c ngo??i vi???c b???n ph???i t??? tr???i nghi???m ch??ng. Tuy nhi??n, c??ng c?? m???t s??? d???u hi???u gi??p b???n c?? th??? ????nh gi?? t???ng th??? v??n h??a c??ng ty. Nh???ng d???u hi???u d?????i ????y c?? th??? gi??p b???n d??? ??o??n ???????c c??ng ty t???t.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Nh??n vi??n h??i l??ng v?? vui v???</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Qu?? tr??nh ph???ng v???n l?? m???t c??ch tuy???t v???i ????? gi??p b???n quan s??t ???????c nh???ng ng?????i m?? ch??ng ta s??? ti???p x??c trong t????ng lai. H??? c?? th??? l?? ng?????i tr?????ng nh??m, nh??n vi??n nh??n s???, gi??m ?????c hay tr??? l??. Trong bu???i ph???ng v???n, h??? c?? c??ch c?? x??? nh?? th??? n??o? th??i ????? c???a h??? ra sao?. Qua m???t v??i ?????c ??i???m hay m???t s??? c??u tr??? l???i t??? h???, b???n s??? nh???n th???y ???????c h??? c?? th??ch c??ng ty c???a m??nh hay kh??ng ho???c h??? c?? ??ang c??ng th???ng khi n??i v??? c??ng ty.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">M?? t??? c??ng vi???c r?? r??ng</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Khi b???n quy???t ?????nh ??i ph???ng v?? b???n h???i v??? c??ng vi???c c???a m??nh, n???u nh?? nh?? tuy???n d???ng cho b???n xem m???t b???n m?? t??? c??ng vi???c kh??ng h??? r?? r??ng, c??c con s??? ????? ??o l?????ng ????nh gi?? c??ng vi???c c???a b???n m?? h???, th?? b???n n??n l???a ch???n ???ng tuy???n ??? n??i kh??c. K??? c??? ?????i v???i m???t c??ng ty m???i th??nh l???p, n???u b???n m?? t??? c??ng vi???c kh??ng ???????c r?? r??ng ngay t??? ?????u s??? g??y ra s??? tranh c??i gi???a ng?????i lao ?????ng v?? ng?????i s??? d???ng lao ?????ng.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">V?? v???y, khi ???ng tuy???n, b???n nh???n ???????c m???t b???n m?? t??? c??ng vi???c r?? r??ng ho???c b???n h???i ng?????i tuy???n d???ng v??? c??c nhi???m v??? b??n ngo??i, c??ng v???i nh???ng th?????c ??o s??? l?????ng cho t???ng nhi???m v??? c???a b???n, n???u nh?? ng?????i ph???ng v???n b???n tr??? l???i b???n r?? r??ng v??? nh???ng s??? l?????ng nhi???m v??? hay th?????c ??o cho m???i nhi???m v??? m???t c??ch minh b???ch, b???n xem x??t l???a ch???n l??m vi???c t???i ????y.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Kh??ng gian l??m vi???c tho???i m??i</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Vi???c ??i ph???ng v???n tr???c ti???p s??? gi??p b???n nh??n th???y ???????c kh??ng gian ??? n??i l??m vi???c c???a c??ng ty. B???i v??n ph??ng c??ng ty l?? n??i nh??n vi??n d??nh 8 ti???ng/ 1 ng??y ????? l??m vi???c. Kh??ng gian l??m vi???c tho???i m??i, c??ng ty trang b??? ?????y ????? c??c c??ng c??? h??? tr???, nh??: m??y t??nh, m??y in, ??i???n tho???i, qu???t,.. V???i m???t m??i tr?????ng l??m vi???c tho???i m??i v?? ti???n nghi s??? khi???n m???i ng?????i y??n t??m l??m vi???c.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Khi ??i ph???ng v???n, b???n c?? th??? h???i nh?? tuy???n d???ng, c??ng ty c?? th??? trang b??? c??c c??ng c??? l??m vi???c n??o cho nh??n vi??n t???i n??i l??m vi???c c???a h???. Ngo??i ra, m???t s??? n??i cung c???p nh???ng qu?? ??n v???t, tr??, cafe hay nh???ng b???a ??n mi???n ph??. Hay ch??nh ?????a ch??? v??n ph??ng c??ng l?? m???t c??ch gi??p nh??n vi??n ??i l???i thu???n l???i v?? gi??? ch??n nh??n vi??n.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">C?? h???i ph??t tri???n s??? nghi???p</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">S??? h??i l??ng trong c??ng vi???c th?????ng ???????c g???n li???n v???i s??? th??ng ti???n c???a nh??n vi??n. C??c doanh nghi???p t???t th?????ng x??y d???ng m???t l??? tr??nh th??ng ti???n ph?? h???p cho nh??n vi??n ti???m n??ng. H??? s???n s??ng ?????u t?? v??o n??ng cao ki???n th???c chuy??n m??n c???a nh??n s??? ????, c??ng nh???m ????? l??i k??o nh??n t??i v??? c??ng ty c???a m??nh.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">N???u nh?? b???n h???i ng?????i ph???ng v???n v??? c?? h???i ph??t tri???n s??? nghi???p c???a m??nh, ng?????i ph???ng v???n s??? ch??? r?? cho b???n doanh nghi???p s??? c?? nh???ng h??? tr??? nh?? n??o cho s??? ph??t tri???n cho ng?????i lao ?????ng, c?? cam k???t ?????i v???i ph??t tri???n s??? nghi???p c???a nh??n vi??n.&nbsp;</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Th???ng th???n v?? minh b???ch&nbsp;</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">C??c c??u h???i v??? v??? tr?? m?? b???n ???ng tuy???n hay nh???ng quy???n l???i m?? b???n s??? ???????c nh???n l?? c??c c??u h???i c?? th??? h???i nh?? tuy???n d???ng v?? c???n ???????c tr??? l???i tr???c ti???p. B???n c?? th??? ch???p nh???n vi???c ng?????i ph???ng v???n b???n s??? kh??ng th??? gi???i th??ch m???i th??? chi ti???t, nh??ng s??? kh??ng ???n n???u ng?????i ph???ng v???n l???ng tr??nh nh???ng c??u h???i n??y v?? kh??ng ????a ?????a ch??? li??n h??? c???a ng?????i c?? th??? gi???i th??ch cho b???n v??? nh???ng v???n ????? n??y.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Quy???n l???i c???a nh??n vi??n</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">M???i ng?????i tham gia ph???ng v???n th?????ng hay ng???i n??i v??? v???n ????? ti???n l????ng, b???i h??? lo nh?? tuy???n d???ng ????nh gi?? h??? l?? nh???ng con ng?????i v???i v??ng. Tuy nhi??n, m???t c??ng ty c?? v??n h??a doanh nghi???p t???t, nh???ng gi?? tr??? c???a b???n ??em l???i ph?? h???p v???i nh???ng g?? c??ng ty ??ang c???n, b???n kh??ng c???n ng???n ng???i v??? vi???c h???i v??? m???c l????ng th?????ng th??ch ????ng.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">B???n c??n c?? th??? h???i v??? nh???ng l???i ??ch kh??c m?? b???n c?? th??? ???????c nh???n, s??? c??n b???ng gi???a c??ng vi???c v?? cu???c s???ng ri??ng t?? nh?? ng??y ngh???, th???i gian t??ng ca,??? D???a v??o c??c c??u tr??? l???i c???a c??ng ty, b???n s??? bi???t ???????c c??ng ty s??? nh??n nh???n v?? ????nh gi?? ???ng vi??n c???a m??nh nh?? th??? n??o.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Danh ti???ng c???a c??ng ty&nbsp;</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Kh??ng ch??? khi ??i ph???ng v???n b???n m???i t??m hi???u v??? doanh nghi???p. Th???i gian l?? v??ng b???c v?? s??? nghi???p c?? nh??n c???a m???i ng?????i l?? ??i???u quan tr???ng nh???t, b???n c??ng kh??ng mu???n l??ng ph?? th???i gian c???a m??nh v??o m???t c??ng ty kh??ng ph?? h???p. Kh??ng ch??? th??ng qua trang web, b???n c?? th??? truy c???p v??o c??c trang web kh??c v?? c??c trang m???ng x?? h???i, c??c group h???i nh??m v??? ????nh gi?? c??ng ty, b???n c?? th??? tham kh???o xem th??? h???ng c???a c??ng ty, m???c l????ng, ch??? ????? ????i ng??? v?? ph???n h???i c???a nh??n vi??n.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Nh???ng ?? ki???n ti??u c???c ?????u do nh???ng nh??n vi??n kh??ng h??i l??ng ????? l???i. Nh???ng nh??n vi??n c???m th???y h??i l??ng v???i c??ng vi???c hay ch??? ????? ????i ng??? c???a c??ng ty hi???n t???i s??? ??t khi ph???i xem x??t l???i c??ng ty. L??u ??: b???n c?? th??? tham kh???o nh???ng ?? ki???n c???a nh??n vi??n ????? l???i ????nh gi?? ????? ????a ra l???a ch???n cho b???n th??n.</span></p><p><br></p>','2022-11-06 07:59:15',NULL,'D???u hi???u nh???n bi???t b???n ??ang ???ng tuy???n v??o m???t c??ng ty t???t','/api/file/images/upload/1/1667696354612_1667696354612_shutterstock_2115699611.jpg','dau-hieu-nhan-biet-ban-ang-ung-tuyen-vao-mot-cong-ty-tot','D???u hi???u nh???n bi???t b???n ??ang ???ng tuy???n v??o m???t c??ng ty t???t','2022-11-06 07:59:15',1,'PUBLIC'),(32,'<h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Lu??n th??nh th???t</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">B???n lo l???ng l???i t??? ch???i c???a b???n l??m ?????ng nghi???p th??n thi???t th???t v???ng nh??ng vi???c n??i d???i s??? l??m m???i quan h??? c???a hai ng?????i g???p tr???c tr???c. B???n n??n th??nh th???t v???i ?????ng nghi???p c???a m??nh v??? l?? do t???i sao b???n kh??ng nh???n c??ng vi???c n??y. T???t nhi??n, b???n c??ng c???n l??u ?? kh??ng n??n c??ng k??ch n???i gi???n v???i ng?????i gi???i thi???u c??ng vi???c cho b???n ch??? v?? b???n kh??ng ph?? h???p ho???c n??i v??? nh???ng ????i ng??? c???a c??ng ty cung c???p cho b???n kh??ng nh?? k??? v???ng c???a b???n. Thay v??o ????, b???n n??n n??i v??? nh???ng l?? do li??n quan ?????n con ???????ng s??? nghi???p c???a b???n ho???c b???n ch??a ????p ???ng ???????c nh???ng y??u c???u c???a c??ng ty.&nbsp;</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">N???u nh?? ?????ng nghi???p c?? c???a b???n ???? gi???i thi???u v??? b???n cho nh??n s??? c???a c??ng ty ?????y th?? h??? c?? th??? c?? m???i quan h??? v???i c??ng ty ???? ho???c h??? ngh?? ???? l?? m???t n??i tuy???t v???i ????? l??m vi???c. V?? v???y, b???n kh??ng n??n n??i ti??u c???c v??? c??ng ty-n??i h??? ??ang l??m vi???c, b???i vi???c b???n ????nh gi?? c??ng ty nh?? vi???c b???n ????nh gi?? ng?????i gi???i thi???u b???n ??? m???c ????? n??o ????.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Theo s??t v??o c??u chuy???n c???a b???n</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Tr???i qua cu???c ph???ng v???n v???i nh?? tuy???n d???ng, b???n nh???n ra c??ng vi???c kh??ng ph?? h???p v???i b???n th??n, b???n n??n ????a ra nh???ng l?? do cho ng?????i ph???ng v???n, nh??n s??? v??? l?? do b???n t??? ch???i l???i m???i c??ng gi???ng nh?? l?? do m?? b???n tr??nh b??y v???i ?????ng nghi???p c???a m??nh. B???n s??? g???p r???c r???i n???u b???n n??i v???i ?????ng nghi???p m???t ??i???u nh??ng b???n l???i n??i v???i nh?? tuy???n d???ng m???t ??i???u kh??c. V??, khi h??? b???t chuy???n v???i nhau, h??? nh???n ra l?? do m?? b???n ????a ra cho h??? kh??ng h??? gi???ng nhau t?? n??o.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">B???n c??n ngh?? ra b???n s??? cung c???p th??m c??c th??ng tin c?? nh??n ho???c l?? do b???n t??? ch???i c??ng vi???c cho ?????ng nghi???p th??n thi???t, nh??ng b???n l???i ??ang ?????t h??? v??o t??nh hu???ng kh?? x???. Nh???ng th??ng tin m?? b???n cung c???p cho ng?????i ?????ng nghi???p c???a b???n c?? th??? c?? l???i cho ng?????i tuy???n d???ng, nh??ng h??? kh??ng ph???i chia s??? nh?? th??? n??o v???i ng?????i tuy???n d???ng do m???i quan h??? v???i b???n.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Nh??? vi???c c???m ??n</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Khi nh???n ???????c l???i gi???i thi???u, b???n ???? l??n k??? ho???ch cho vi???c c???m ??n ?????ng nghi???p c?? ???? gi???i thi???u b???n, b???ng c??ch ????a h??? ??i ??n tr??a, g???i h??? m???t m??n qu?? nh??? ho???c h???n ?????ng nghi???p c?? ???? ??i ch??i v??o ng??y ngh??? th?? gi??n, ???? l?? m???t v??i c??ch th??? hi???n b???n ????nh gi?? cao h???.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Vi???c n??i l???i c???m ??n v??o nh???ng d???p n??y l?? ??i???u c???n thi???t, ????y l?? vi???c th??? hi???n b???n l?? m???t ng?????i th???t l??ng, l?? c?? h???i ????? b???n chia s??? r???ng b???n th??n b???n r???t vui khi nh???n ???????c s??? ??u ??i t??? h???. H??y ?????m b???o r???ng b???n s??? l??m ??i???u g?? ???? ph?? h???p v???i m???i quan h??? c???a b???n v???i ?????ng nghi???p c?? v?? r???ng b???n kh??ng c?? ?? ?????nh t??? ch???i c?? h???i ???? nh??ng b???n c??ng c???m ??n h??? v?? ???? cho b???n m???t c?? h???i ????? kh??m ph?? ra nh???ng ??i???u m???i m??? trong c??ng vi???c.</span></p><h2 class=\"ql-align-justify\"><strong style=\"background-color: initial;\">Th??? hi???n s??? chuy??n nghi???p</strong></h2><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">Vi???c th??? hi???n s??? chuy??n nghi???p trong c??ng vi???c v?? cu???c s???ng th?????ng ng??y, gi??p ch??ng ta gi??? ???????c nh???ng m???i quan h??? ch???t l?????ng. B???n g???p l???i ng?????i ?????ng nghi???p c?? th??n thi???t sau khi b???n t??? ch???i l???i gi???i thi???u vi???c l??m, b???n n??n ki??n ?????nh v???i nh???ng l?? do m?? b???n ???? ????? c???p tr?????c ????. H???n ch??? vi???c n??i r?? ho???c ??i s??u v??o nh???ng chi ti???t kh??ng h???p l?? ????? n??i ra v??? l?? do b???n quy???t ?????nh t??? ch???i l???i m???i. C??? hai s??? c???m th???y kh?? x??? khi qu?? t???p trung v??o v???n ????? t???i sao b???n t??? ch???i v??? l??m vi???c t???i c??ng ty ????. B???n c?? th??? n??i v??? l?? do b???n kh??ng nh???n l???i m???i l??m vi???c nh??ng h??y gi??? cho cu???c tr?? chuy???n v??? ch??? ????? n??y th???t ng???n g???n v?? n??n chuy???n cu???c tr?? chuy???n sang m???t v???n ????? kh??c m?? kh??ng li??n quan t???i c??ng vi???c.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">T??? ch???i m???t l???i m???i kh??ng bao gi??? l?? ??i???u th?? v???. ?????ng ng???n ng???i vi???c ????a ra c??u tr??? l???i n???u b???n c???m th???y kh??ng mu???n l??m c??ng vi???c n??y, b???n n??n li??n h??? v???i ng?????i tuy???n d???ng hay ng?????i ?????ng nghi???p ???? ngay l???p t???c. M???c d?? h??? c?? th??? c???m th???y th???t v???ng nh??ng vi???c b???n t??? ch???i k???p th???i s??? gi??p h??? chuy???n sang ???????c ???ng vi??n ti???m n??ng ti???p theo. ?????ng v?? s??? ch???m tr??? c???a b???n khi???n cho qu?? tr??nh tuy???n d???ng c???a h??? b??? quay m??ng m??ng.</span></p><p class=\"ql-align-justify\"><span style=\"background-color: initial;\">B???n kh??ng n??n n??i nh???ng ??i???u ti??u c???c v??? c??ng ty hay quy tr??nh c???a c??ng ty ho???c l???i ????? ngh??? t??? c??ng ty, b???i nh???ng ??i???u n??y s??? g??y ???nh h?????ng ?????n c?? h???i tuy???n d???ng c???a b???n trong t????ng lai. V?? th???, h??y lu??n b??y t??? s??? bi???t ??n v?? ????nh gi?? cao l???i gi???i thi???u c???a ?????ng nghi???p b???n ho???c l???i m???i l??m vi???c t??? ph??a c??ng ty.</span></p><p><br></p>','2022-11-06 08:18:55',NULL,'B???n lu??n c?? m???i quan h??? t???t v???i ?????ng nghi???p c?? ??? c??ng ty, c??c b???n v???n hay h???n h?? nhau v??o th???i gian r???nh v?? gi??p ????? nhau trong c??ng vi???c. M???t h??m, b???n nh???n ???????c l???i gi???i thi???u c??ng vi???c t??? ng?????i ?????ng nghi???p c?? th??n thi???t, l?? m???t c??ng vi???c ??? c??ng ty c?? ti???ng. Vi???c nh???n ???????c m???t l???i gi???i thi???u l?? m???t l???i khen ng???i l???n khi n??i ?????n s??? nghi???p c???a b???n, nh???ng n??? l???c c???a b???n trong c??ng vi???c d???n c?? ???????c k???t qu???. Nh??ng khi b???n t??m hi???u v??? c??ng vi???c hay c?? h???i b???n ???????c gi???i thi???u th?? b???n ph??t hi???n b???n th??n kh??ng ph?? h???p, v???y b???n n??n l??m th??? n??o ????? t??? ch???i c??ng vi???c khi ???????c ?????ng nghi???p gi???i thi???u sao cho tinh t????','/api/file/images/upload/29/1667697534464_1667697534464_shutterstock_2123956601-1.jpg','ong-nghiep-cu-than-thiet-ru-re-nhay-viec-ung-xu-sao-cho-tinh-te','?????ng nghi???p c?? th??n thi???t r??? r?? nh???y vi???c, ???ng x??? sao cho tinh t????','2022-11-06 08:18:55',29,'PUBLIC');
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (34,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"Do you have any Certification about IT ?\"},{\"insert\":\"\\n\"}]}'),(35,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"What the level of you english?\"},{\"insert\":\"\\n\"}]}'),(36,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"how long have you worked with php?\"},{\"insert\":\"\\n\"}]}'),(37,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"Do you have any certificate ?\"},{\"insert\":\"\\n\"}]}'),(38,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"What level of english you are?\"},{\"insert\":\"\\n\"}]}'),(39,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"What are the types of automation testing?\"},{\"insert\":\"\\n\"}]}'),(40,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"What is automation testing?\"},{\"insert\":\"\\n\"}]}'),(41,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"When is a good time to automate a test?\"},{\"insert\":\"\\n\"}]}'),(42,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"B???n ???? h???c nh???ng g?? li??n quan ?????n data analysis ch??a?\"},{\"insert\":\"\\n\"}]}'),(43,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"B???n ??ang s??? d???ng ng??n ng??? n??o ?????  vi???t UI cho web\"},{\"insert\":\"\\n\"}]}'),(52,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"How long have you  been in embedded field?\"},{\"insert\":\"\\n\"}]}'),(53,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"Did you work some jobs relate to network?\"},{\"insert\":\"\\n\"}]}'),(54,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"Are You Ungraduated ?\"},{\"insert\":\"\\n\"}]}'),(55,'{\"ops\":[{\"attributes\":{\"size\":\"large\"},\"insert\":\"how long have you worked in database field?\"},{\"insert\":\"\\n\"}]}'),(65,'{\"ops\":[{\"insert\":\"Do you have any experience about this field?\"},{\"attributes\":{\"header\":2},\"insert\":\"\\n\"}]}');
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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'frontend'),(2,'rearctjs'),(3,'javascript'),(10,'Web'),(11,'Java'),(12,'Backend'),(13,'agriculture'),(14,'warter'),(15,'plant'),(16,'fresh'),(17,'json'),(18,'android'),(19,'mobile'),(20,'github'),(21,'devop'),(22,'fpt'),(23,'cantho'),(24,'embedded'),(25,'system'),(26,'net'),(27,'csharp'),(28,'software'),(29,'Web-java'),(30,'Chief'),(31,'Ways'),(32,'sensor'),(33,'Harbors'),(34,'Account'),(35,'post'),(39,'make'),(40,'morepost'),(41,'QA'),(42,'IT'),(43,'Oracle'),(44,'SQL'),(45,'Javascipt'),(46,'python'),(47,'tma'),(48,'devops'),(49,'php'),(50,'dotNet'),(51,'automation'),(52,'kms'),(53,'hoanglinhplus'),(54,'fullstack'),(55,'data'),(56,'chotot'),(57,'Plume'),(58,'Tester'),(59,'acb'),(60,'bank'),(61,'relationship'),(62,'education'),(63,'english'),(67,'interview'),(68,'hr'),(69,'Question_Answer'),(70,'carreer'),(71,'coworker'),(72,'cv'),(73,'preparation'),(74,'softskill'),(75,'hoanglinh'),(76,'company'),(77,'good_job'),(78,'onemount'),(79,'senior'),(80,'stock'),(81,'solfware'),(82,'shinhan'),(83,'insight'),(84,'c++'),(87,'network'),(88,'database'),(89,'test'),(90,'linux'),(91,'binance');
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
INSERT INTO `user_roles` VALUES (1,2),(26,1),(27,1),(28,1),(29,1),(51,1),(52,1);
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
INSERT INTO `user_skills` VALUES (29,14),(29,15),(26,15),(26,1),(26,14),(1,2),(1,1),(1,10),(1,19);
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ki??n giang','/api/file/images/upload/1/1667646768483_1667646768481_hoanglinh.png','hello i am hoanglinhplus, nice to meet you','2022-09-03 14:16:44','https://secretdeveloperisme.github.io/Curriculum_Vitae/HoangLinhPlusCV.html',NULL,'2000-11-25 07:00:00','linh07221@gmail.com',NULL,NULL,'nguyen hoang linh','m',_binary '','$2a$12$xCmz2Tsx3FS5f8AEoLkNoeI8iYsZeZDHOTSg2gBcQhPXI0ezc44wK',NULL,'hoanglinh'),(26,'Tan Hung, Long An','/api/file/images/upload/26/1667650461744_1667650461740_huynhdieu.png','If you have your doubts, it???s likely time to update your bio, and we have some of the best professional bio examples to get you started.','2022-06-07 21:05:46',NULL,NULL,'2000-04-25 07:00:00','dieu2504@gmail.com',NULL,NULL,NULL,'f',_binary '','$2a$10$FxzoQM9jMpQ2sXEwXi9epu3yhuPxIk0SGYbR8al6P2qtPEczAl6n.',NULL,'huynhdieu'),(27,'An Giang','/api/file/images/upload/1/1667659098032_1667659098032_huubang.png','I have a passionate with computer science ','2022-06-10 21:10:53',NULL,NULL,'2000-12-12 07:00:00','huubang@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$ixboSg7NMNDacOkNd9i3bOorv3mK.c35xY/psIp7zXVO4uJQGWcU6',NULL,'huubang'),(28,'Cai Rang, Can Tho','/api/file/images/upload/27/1667693394807_1667693394807_lapnghiep.png','Top Rated Freelancer || Blogger || Cross-Platform App Developer || Web Developer || Open Source Contributor','2022-01-12 23:09:02',NULL,NULL,'2000-07-08 07:00:00','nghiepit321@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$D1dbELyX5yT7iZUIqvFb0e5/HW4vWrdJtsIyYLjEiOx1B.6fSiXVu',NULL,'lapnghiep'),(29,'Long Ho, Vinh Long','/api/file/images/upload/1/1667696593675_1667696593675_minhman.webp','I am an automatic machine engineer. I really happy make friend with everyone.  ','2021-02-03 21:09:12',NULL,NULL,'2000-05-01 07:00:00','minhman2k@gmail.com',NULL,NULL,NULL,'m',_binary '\0','$2a$10$fWMCdJXO0ZOAjbFK95JSHuUQyYRbu2axz1G1IH6Lfts.IchenhtW2',NULL,'minhman'),(51,'Ha Noi','/api/file/images/upload/guest/1668338035668_1668338035659_nguyen_thi_hoa.png','I am from a countryside but with my motivation is not  small',NULL,NULL,NULL,'1997-11-22 07:00:00','thihoa@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$L/1uzblrgXHDZETXkGqolOF3yZ15kRLqHO5JxXFyNw562d4LngDzS',NULL,'thihoa'),(52,'Cai Rang Can Tho ','/api/file/images/upload/1/1669073760418_1669073760418_tran_thi_tuyet_mai.png','my full name is  nguyenn thi tuyet mai. i have a hobby, that is facing with the problems',NULL,NULL,NULL,'2000-09-07 07:00:00','tuyetmai53@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$74AZwdd/90zkvU2aPbKNHuHhU7Oqd/uSHMsFQk.ekHaINI.ER88RO',NULL,'tuyetmai');
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

-- Dump completed on 2022-11-22 20:13:54
