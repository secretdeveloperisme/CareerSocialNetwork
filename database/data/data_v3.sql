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
INSERT INTO `applications` VALUES (7,22,'PENDING'),(8,2,'PENDING'),(8,3,'APPROVED'),(12,2,'PENDING'),(12,20,'APPROVED'),(13,2,'PENDING'),(15,20,'PENDING'),(16,20,'APPROVED'),(16,22,'PENDING');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment_types`
--

LOCK TABLES `attachment_types` WRITE;
/*!40000 ALTER TABLE `attachment_types` DISABLE KEYS */;
INSERT INTO `attachment_types` VALUES (9,'application/json'),(10,'application/octet-stream'),(13,'application/pdf'),(4,'audio'),(8,'image/jpeg'),(12,'image/png'),(1,'normal'),(2,'picture'),(11,'text/plain'),(3,'video');
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
INSERT INTO `bookmarks` VALUES (2,8),(22,12),(1,12),(1,16);
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
INSERT INTO `comment_likes` VALUES (6,1,'LIKE'),(6,2,'LIKE'),(6,3,'UNLIKE'),(17,22,'LIKE'),(18,1,'LIKE'),(19,22,'LIKE'),(49,22,'LIKE'),(53,1,'LIKE');
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (3,'This job is very nice',NULL,8,NULL,20,NULL),(6,'how can i apply for this job',NULL,8,NULL,20,NULL),(7,'what\'s up',NULL,8,NULL,20,NULL),(8,'really useful',NULL,8,NULL,20,NULL),(12,'ok really useful',NULL,8,8,20,NULL),(15,'you just click the button of this job',NULL,8,6,2,NULL),(16,'you just click the button of this job',NULL,12,NULL,2,NULL),(17,'you just click the button of this job dfsfsfsdf',NULL,12,16,2,NULL),(18,'you just click the button of this job dfsfsfsdf',NULL,12,16,2,NULL),(19,'<p><strong style=\"color: rgb(230, 0, 0);\">hehehjefdfdsf</strong></p>',NULL,12,NULL,22,NULL),(30,'you just click the button of this job dfsfsfsdf',NULL,12,16,2,NULL),(31,'you just click the button of this job dfsfsfsdf',NULL,12,30,2,NULL),(35,'<p>fdsfsdfsdfds</p>',NULL,12,31,22,NULL),(47,'<p>sdfsfdf</p>',NULL,12,NULL,22,NULL),(49,'<p><span class=\"ql-font-serif\">I will apply for this job</span></p>',NULL,13,NULL,2,NULL),(50,'<p>thank you for applying</p>',NULL,13,49,22,NULL),(51,'<p><strong>not at all</strong></p>',NULL,13,50,22,NULL),(52,'<p>sdfsdfsdf</p>',NULL,12,31,22,NULL),(53,'<h1>this is really helpful</h1>',NULL,16,NULL,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (8,'2022-09-07 06:01:14',NULL,'/api/file/images/upload/guest/1665407864784_1665407864784_nguyen_thi_hoa.png','hoanglinhplus','life is riding a bicycle','2022-09-07 06:01:14','https://hoanglinhplus.com',2,2,1),(17,'2022-09-10 16:48:27','2022-10-17 20:09:04','/api/file/images/upload/guest/1665407864784_1665407864784_nguyen_thi_hoa.png','hoanglinhplus','life is riding a bicycle','2022-09-10 16:48:27','https://hoanglinhplus.com',20,2,1),(18,'2022-09-10 16:48:50',NULL,'/api/file/images/upload/guest/1665407864784_1665407864784_nguyen_thi_hoa.png','minhmanhaha','that is a good idea yeah','2022-09-10 16:48:50','https://minhmanhaha.com.vn',20,3,5),(19,'2022-09-12 20:27:00',NULL,'/api/file/images/upload/guest/1665407864784_1665407864784_nguyen_thi_hoa.png','vanminh farmers','that is a good idea haha','2022-09-12 20:27:00','https://vanminhfarmer.com.vn',21,5,1),(20,'2022-10-08 15:42:32',NULL,'/api/file/images/upload/guest/1665448174284_1665448174278_company-icon.png','hoanglinhplus','life is riding a bicycle','2022-10-08 15:42:32','https://hoanglinhplus.com',21,2,1),(21,'2022-10-10 20:08:22',NULL,'/api/file/images/upload/guest/1665448174284_1665448174278_company-icon.png','hoanglinhplus','life is riding a bicycle','2022-10-10 20:08:22','https://hoanglinhplus.com',1,2,1),(22,'2022-10-10 20:17:45',NULL,'/api/file/images/upload/guest/1665407864784_1665407864784_nguyen_thi_hoa.png','huynhdieu','bring more success','2022-10-19 06:08:45','http://127.0.0.1:8080/company/create-company',22,2,2),(24,'2022-10-19 06:04:33',NULL,'/api/file/images/upload/22/1666134272742_1666134272739_php.png','test','45334534534','2022-10-25 19:28:19','http://127.0.0.1:8080/company/create',22,4,3),(25,'2022-10-19 19:25:40',NULL,'/api/file/images/upload/22/1666182340393_1666182340391_python-14-569257.png','test','dsfdsfsdfsdfsdfsdfsdfsdfs','2022-10-29 13:55:09','http://127.0.0.1:8080/company/create',22,2,4),(26,'2022-10-22 11:44:42',NULL,'/api/file/images/upload/1/1666413881650_1666413881647_fpt.jpg','fpt software','accompany the future ','2022-10-22 11:44:42','http://fpt.com.vn',1,1,6),(27,'2022-10-22 12:18:23',NULL,'/api/file/images/upload/2/1666415903437_1666415903437_KMS.jpg','KMS tennology','Bright Minds. Brilliant Solutions.','2022-10-22 12:18:23','https://ksm.com',2,2,3),(30,'2022-10-25 19:23:12',NULL,'/api/file/images/upload/22/1666700592136_1666700592136_github.png','test','sdfsdfsdfdsfdsfsdfsdfs','2022-10-29 13:55:09','http://127.0.0.1:8080/company/create',22,3,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (2,NULL,NULL,NULL,20),(4,NULL,NULL,NULL,20),(5,NULL,NULL,NULL,3),(8,'2022-09-29 07:43:50',NULL,'2022-09-29 07:43:50',3),(9,'2022-09-29 07:46:24',NULL,'2022-09-29 07:46:24',20),(13,'2022-10-22 16:31:58',NULL,'2022-10-22 16:31:58',22),(16,'2022-10-22 19:17:48',NULL,'2022-10-22 19:17:48',22),(17,'2022-10-22 21:09:11',NULL,'2022-10-22 21:09:11',22),(18,'2022-10-24 07:12:31',NULL,'2022-10-24 07:12:31',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educations`
--

LOCK TABLES `educations` WRITE;
/*!40000 ALTER TABLE `educations` DISABLE KEYS */;
INSERT INTO `educations` VALUES (22,'2022-11-23 07:00:00',3.61,'Can Tho  University, BIO','2018-10-07 07:00:00',22),(24,'2022-12-12 07:00:00',0,'Can Tho Univesity','2018-04-12 07:00:00',20),(25,'2019-12-02 07:00:00',0,'Binh Thuan Univesity','2015-04-12 07:00:00',21),(33,'2022-10-24 07:00:00',4.53,'chat','2022-10-18 07:00:00',22);
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
INSERT INTO `follow_companies` VALUES (8,3),(8,20),(20,8),(2,22),(22,20),(22,19),(22,22),(1,22);
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
INSERT INTO `follow_tags` VALUES (20,1),(22,18),(22,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industries`
--

LOCK TABLES `industries` WRITE;
/*!40000 ALTER TABLE `industries` DISABLE KEYS */;
INSERT INTO `industries` VALUES (1,'công nghệ thông tin'),(2,'công nghệ thông tin'),(3,'y tế'),(4,'nông nghiệp'),(5,'du lịch'),(6,'thực phẩm và đồ uống'),(7,'sản xuất và dịch vụ');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_question`
--

LOCK TABLES `job_question` WRITE;
/*!40000 ALTER TABLE `job_question` DISABLE KEYS */;
INSERT INTO `job_question` VALUES (3,7,3),(4,7,4),(6,12,5),(26,12,25),(27,13,26),(28,12,27),(29,18,28),(30,18,29),(31,18,30),(32,19,31),(33,20,32),(34,20,33);
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
INSERT INTO `job_skills` VALUES (2,6),(3,7),(4,7),(1,6),(1,8),(2,8),(1,11),(6,11);
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
INSERT INTO `job_tags` VALUES (11,6),(12,6),(1,7),(2,7),(3,7),(13,8),(14,8),(15,8),(16,8),(13,11),(14,11),(15,11),(12,12),(11,13),(12,13),(18,15),(19,15),(20,16),(21,16),(10,6),(10,12),(11,17),(22,17),(23,17),(22,18),(24,18),(25,18),(26,19),(27,19),(28,19),(24,20),(25,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (6,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(7,10,'2022-09-11 07:34:26',NULL,'2022-10-08 18:38:51',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend developer','ho chi minh',1000,500,NULL,'web front developer','2022-09-11 07:34:26',8,2,2,2),(8,12,'2022-09-12 20:28:51',NULL,'2023-01-12 07:00:00',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','van minh want to hire a farmer to water plants','ho chi minh',1000,500,'2022-09-15 07:00:00','farmer job','2022-10-08 14:36:04',19,1,2,1),(11,10,'2022-10-08 18:49:01',NULL,NULL,0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','van minh want to hire a farmer to water plants','ho chi minh',1000,500,NULL,'embedded system','2022-10-08 18:49:01',19,1,1,1),(12,10,'2022-10-12 19:30:53',NULL,NULL,1,'/api/file/images/upload/22/1665577852877_1665577852877_nguyen_thi_hoa.png','<p><img src=\"/api/file/images/upload/guest/1665577655594_1665577655594_minhman.webp\">ssdfsdfsdfdsfsf</p>','ho chi minh',1500,1000,NULL,'Web back end developer','2022-10-12 19:30:53',22,2,2,2),(13,10,'2022-10-16 11:10:22',NULL,NULL,2,'/api/file/images/upload/22/1665893421207_1665893421203_Java_logo_icon.png','<p><span style=\"color: rgba(0, 0, 0, 0.9);\">ob Locations</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">VN-Hanoi</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Overview</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">The primary focus of the&nbsp;Software Developer&nbsp;will be to develop new features and enhancements to the Fortna product suite. The Developer will collaborate with Fortna testing, implementation and delivery teams to analyze requirements for highly scalable and transactional applications.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Responsibilities</span></p><p><br></p><ul><li>Participating in Software Design, Coding, Review, Testing and Integration, depending on company\'s software project.</li><li>Assisting Software QA and Infrastructure Engineers in Qualifying, Deploying and Packaging Company’s software product and libraries.</li><li>Assisting Software QA in development of component and project test plans and test automation.</li><li>Collaborating with other team members to foster a team atmosphere.</li><li>Maintaining high quality software source code and documentation.</li><li>Providing remote support and troubleshooting for Client\'s systems.</li><li><br></li></ul><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Qualifications</span></p><p><br></p><ul><li>BS/BA in Computer Science or related field</li><li>Java development experience with a demonstrated track record of Object-Oriented Analysis and Design (OOAD)</li><li>Have experience with Java Core, especially with Network Programming, Multi-Thread Programming. (2 years+)</li><li>Good at Data Structure and Algorithm. Deep understanding of Design Pattern and Software Development Principles and Concepts.</li><li>Having the desire to pick up and learn new technical skills.</li><li>Strong interpersonal, organizational, time management and problem-solving skills</li><li>Good at English (both Writing and Speaking).</li><li>Experience working in a team-oriented, collaborative environment</li><li>Strong interpersonal, organizational, time management and problem solving skills</li><li>Excellent written and oral communication skills</li><li>Excellent listening and interpersonal skills</li><li>Ability to travel nationally and internationally</li><li><br></li></ul><p><span style=\"color: rgba(0, 0, 0, 0.9);\">DESIRED QUALIFICATIONS:</span></p><p><br></p><ul><li>Experience with Oracle</li><li>Understanding of distributed architectures</li><li>Able to prioritize and execute tasks in a high-pressure environment</li><li>Having experience of building high performance Java backend system.</li><li>Having experience of working with both Windows and Linux system, able to understand or write the shell script.</li><li><br></li></ul><p><span style=\"color: rgba(0, 0, 0, 0.9);\">About Us</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">WHAT WE DO</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Headquartered in Atlanta with locations globally, Fortna is an award-winning, end-to-end design-build firm whose expertise spans over seven decades of service. Founded in 1946, we provide strategy, automation design &amp; systems integration, and warehouse execution software to the world’s most recognized brands.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">What Sets Us Apart</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">At Fortna, our three mission-critical pillars connect our people across the globe and help distinguish us as a leader in the marketplace.</span></p><p><br></p><ul><li>Our PEOPLE are at the heart of everything we do. We are guided by a set of business principles and ethics that are baked into the excellence we bring to each project from start to finish.</li><li>Our PASSION unites our Associates through our shared passion and commitment to integrity, hard work, and a collaborative approach. We love what we do, and it shows.</li><li>We PROMISE to be accountable, act with integrity, and deliver results for our clients. Our diverse team of global Associates work as “One Team” to deliver on our promises to Clients.</li><li><br></li></ul><p><span style=\"color: rgba(0, 0, 0, 0.9);\">What You Can Expect</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Perks and benefits: At Fortna, our people are everything – so the perks and benefits you’ll receive from being part of the Fortna team are generous. From competitive compensation packages and health insurance offerings to Associate-led committees created to drive positive change, the employee experience at Fortna is truly unmatched.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Talent Development: We believe every Associate deserves the resources and support to grow and thrive. That’s why a career at Fortna comes with powerful professional development opportunities. Learn directly from the industry’s best and brightest. Our training, mentoring and on-the-job experiences are designed to enhance your skillset – preparing you for increasingly challenging roles and accelerating your career.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Statement to Third Party Agencies -&nbsp;To ALL recruitment agencies: Fortna only accepts resumes from agencies on the Fortna preferred supplier list. Do not forward resumes to our applicant tracking system, Fortna employees, or any Fortna office location. Fortna is not responsible for any fees or charges associated with unsolicited resumes</span></p>','ho chi minh',4000,3000,NULL,'Java backend developer','2022-10-16 11:10:22',22,3,2,2),(15,2,'2022-10-19 08:03:05',NULL,NULL,3,'/api/file/images/upload/22/1666141384475_1666141384475_android.png','<p>sdfsfsdfsdfds<img src=\"/api/file/images/upload/22/1666141379283_1666141379280_download.png\"></p>','can tho',1500,100,NULL,'android developer','2022-10-19 08:03:05',22,3,1,3),(16,1,'2022-10-19 19:44:23',NULL,NULL,2,'/api/file/images/upload/22/1666183463160_1666183463158_GitHub-logo.png','<p><span style=\"color: rgba(0, 0, 0, 0.9);\">Meet our Team</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">We represent Hitachi Vantara to enterprise clients across industries, establishing business relationships to understand customer challenges so that we can deliver profitable business for Hitachi products, services and solutions. We collaborate as a team and cross-functionally to ensure the success of our customers; success that is celebrated and shared. Our solutions bring value to every line of business and we need people like you to build those deep relationships and to passionately articulate our value proposition.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">The Role</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">This position will be a key member to the VDC Service Desk team, which support all BAU (Business as usual) users activities for Hitachi Vantara Vietnam, and a part of global function (Service Desk / Desktop Operation).</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">There’s many opportunities to interact and support IT and non-IT users, support business growth and have chance to participate in many other aspect of information system, like security compliant, end point security etc..</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">What You’ll Be Doing</span></p><p><br></p><ul><li>Set up new / refreshing desktops/ laptops for HVN users.</li><li>Make sure endpoint devices are compliant with Hitachi Vantara global policies</li><li>Support local activities for ISO 27001 compliant (monthly tasks, asset management,..)</li><li>Support System and Network team in various Core Infrastructure project</li><li>Propose and improve working process (Built machine image, ticketing system)</li><li>Working on In-house service desk system and industry’s de-facto standard for ITIL ticketing system (Service-now)</li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">What You Bring To The Team</span></p><p><br></p><ul><li>Take challenge and ownership</li><li>Proactive and careful</li><li>Understand IT Operation Standard.</li><li>Adaptability with new change.</li><li>Critical thinking and Problem Solving Skills.</li><li>Strong IT knowledge and wide range experience.</li><li>Good English</li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Preferred</span></p><p><br></p><ul><li>PowerShell/script experience</li><li>Network – CCNA</li><li>Windows/Linux Administrator</li><li>IT Service Management (ITIL) experience</li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Our Company</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Hitachi Vantara is part of the Global Hitachi family. We balance innovation with an open, friendly culture and the backing of a long-established parent company, known for its ethical reputation. We guide customers from what’s now to what’s next by unlocking the value of their data and applications to solve their digital challenges, achieving outcomes that benefit both business and society.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Our people are our biggest asset, they drive our innovation advantage and we strive to offer a flexible and collaborative workplace where they can thrive. Diversity of thought is welcomed and our employee base is represented by several active Employee Resource Group communities. We offer industry leading benefits packages (flexible working, generous pension and private healthcare) and promote a creative and inclusive culture. If driving real change gives you a sense of pride and you are passionate about powering social good, we’d love to hear from you.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Our Values</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Research tells us that some applicants, especially those from underrepresented groups, can be put off from applying for roles if they need flexibility or feel they don’t meet all of the set criteria. We strive to create an inclusive environment for all and are open to considering home working, compressed/flexible hours and part-time arrangements. Get in touch with us to explore how we might be able to accommodate your specific needs.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">With Japanese Roots Going Back Over 100 Years, Our Culture Is Founded On The Values Of Our Parent Company Expressed As The Hitachi Spirit</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">We are proud to say we are an equal opportunity employer and welcome all applicants for employment without attention to race, colour, religion, sex, sexual orientation, gender identity, national origin, veteran or disability status.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Wa – Harmony, Trust, Respect</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Makoto – Sincerity, Fairness, Honesty, Integrity</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Kaitakusha-Seishin – Pioneering Spirit, Challenge</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Location</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Floor 3rd ,4th Helios Building - Floor 9th QTSC9 Building, Quang Trung Software City, Tan Chanh Hiep Ward, District 12, Ho Chi Minh City, Vietnam </span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">We are an equal opportunity employer. All applicants will be considered for employment without attention to age, race, color, religion, sex, sexual orientation, gender identity, national origin, veteran or disability status.</span></p>','other',3333,2222,NULL,'we want to hire github developer','2022-10-19 19:44:23',22,2,3,2),(17,10,'2022-10-22 11:46:49',NULL,NULL,0,'/api/file/images/upload/1/1666414009191_1666414009191_Java_logo_icon.png','<p>Hỗ trợ chuyển vùng về QUY NHON gói 300M</p><p>Signing bonus skill Java + embedded C/C++, senior Automation Test</p><p>Quà pass thử việc 6-7M khi Onboard trong tháng 10</p><p>AS12:</p><ul><li>02 deve02 .NET, cần WFO site DN - nếu làm ở Huế thì phải oniste DN 3 tháng</li><li>02 deve02 PH, 07 deve02 up full-skill</li><li>02 Python</li></ul><p>G3:</p><ul><li>DEVE03 Java có ENG</li><li>DEVE02 Java không ENG</li><li>1 DEVE02 up Android có ENG</li><li>1 DEVE02 up Angular có ENG</li></ul><p>G52: 15 Java( DEVE02 up)</p><p>R: 7 Java( DEVE02 up)</p><p>M2: Frontend/ Reactjs/ Angular &gt;2 năm kinh nghiệm</p><p>G55: DEVE03 Fullstack ( .Net, angular)- có thể remote fulltime , English tốt, PV khách hàng</p><p>G5:</p><ul><li>1 Team lead .NET</li><li>1 ROR</li><li>1 BI</li><li>1 Fullstack (nodejs/reactjs)- có thể Remote Fulltime, EN tốt</li><li>1 Automation</li><li>1 Cloud dev</li><li>2 Test ( 1 Test03, 1 test02)</li></ul><p>JODC: Đơn vị Offshore chuyên thị trường Nhật</p><ul><li>DEV1 từ 6 tháng kinh nghiệm + N3 up</li><li>BrSE/BA/PM/Senior Dev từ 2 năm kinh nghiệm + N2up</li></ul><p>IVS.DN: Chuyên mảng Test duy nhất ở ĐN</p><ul><li>Auto/ manual Test senior có EN hoặc JP N3+</li></ul><p>Remote: Auto Test</p><p>GST: Đơn vị chuyên Mobile</p><ul><li>3 Techlead</li><li>3 iOS</li><li>3 Android</li></ul><p>GAM IVI:</p><ul><li>5 C++ ( Dev03 up)</li><li>01 Junior Test, 1 Tester lead</li></ul><p>GAM PDC: Reactjs , 2 Test02, 3 Test03</p><p>GAM DAP: 2 DEVE02, 5 DEV03 Embedded</p><p>GAM MAD: 6 DEV02 up Embedded , 5 DEV02 up C++</p><p>Đọc tới đây thì IB mình tìm hiểu từng đơn vị nhé:</p><p>PhuongLTK2@fsoft.com.vn</p><p>Zalo: 0968 801 378</p><p>Skype: live:kimphuongd96</p>','can tho',2000,1000,NULL,'Java software developer','2022-10-22 11:46:49',26,1,1,2),(18,4,'2022-10-22 12:13:01',NULL,NULL,1,'/api/file/images/upload/1/1666415580207_1666415580205_embedded.jpg','<p>Job description:</p><ul><li>Development and maintenance of the Device drivers for various microcontrollers</li><li>Work with various kinds of microcontroller from Renesas, ST, …</li><li>Perform design, analysis and integrated testing on hardware and software, system diagnostic and failure management.</li></ul><p>Qualification:</p><p>Must have:</p><ul><li>Working experience in programming in C, Embedded system development</li><li>Development experience on 16/32 bit microcontroller families like Renesas, ST, ...</li><li>Knowledge on Compilers, Debuggers for different micro-controllers</li><li>Experience with Vector products (e.g. CANoe, CANalyzer, Davinci, etc.)</li><li>Good knowledge of hardware, software embedded system concepts and architecture.</li><li>Good understanding of the embedded software build process (compiling, linking, programming, etc.).</li><li>Ability to troubleshoot issues to resolution. Strong problem solving and root cause analysis skills.</li><li>Ability and ease with using lab tools such as debuggers, emulators, oscilloscopes, etc.</li><li>Experience with configuration management software (SVN, GIT)</li><li>Ability to analyze / study new technical, new hardware</li><li>Teamwork and communication skills.</li><li>Good at English communication</li></ul><p>Nice to have:</p><ul><li>Work experience on AUTOSAR compliant BSW software, MCAL driver development is a strong plus.</li><li>Overall understanding of automotive system</li><li>Known Japanese is a strong plus</li></ul><p>Benefits:</p><p>Successful candidates will be part of a friendly, motivated and committed talent teams with various benefits and attractive offers:</p><p>· Competitive salary in labor market</p><p>· “FPT care” health insurance is exclusive for FPT employees.</p><p>· Company shuttle buses provide convenient way of transportation for all employees.</p><p>· Annual Summer Vacation</p><p>· 13th month salary</p><p>· Monthly project performance bonus.</p><p>· Other allowances: lunch allowance, extra-Job allowance</p><p>· F-Town Campus provides many facilities for FPT employees such as football ground, basketball &amp; volleyball, gym center, restaurant, cafeteria, etc.</p>','can tho',3000,2500,NULL,'Embedded Engineer','2022-10-22 12:13:01',26,1,2,1),(19,100,'2022-10-22 12:20:31',NULL,NULL,2,'/api/file/images/upload/2/1666416030972_1666416030972_NET_Core_Logo.png','<p><span style=\"color: rgba(0, 0, 0, 0.9);\">Company Description</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">KMS was established in 2009 as a U.S.-based software development &amp; consulting company with development centers in Vietnam. Over 13 years of operation, we have been trusted globally for the superlative quality of software services, products, technology solutions and engineers\' expertise.</span></p><p><br></p><ul><li>KMS Technology focuses on custom software development and a wide variety of consulting services</li><li>KMS Healthcare specialises in the healthcare industry, provides a unique blend of consultative healthcare technology solutions backed by the power of full lifecycle development support</li><li>KMS Solutions serves the Asia Pacific region, bringing the world\'s innovative technologies to help organizations achieve their business goals through world-class digital capabilities and fit-for-purpose solutions</li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Besides providing services, KMS builds and successfully launches its own software companies through its internal startup incubator, KMS Labs. The most notable companies with millions of users worldwide include QASymphony, Kobiton, Katalon, Grove, and Visily.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">KMS is committed to providing tangible contributions and long-lasting impacts to the communities through leveraging our IT expertise. The company has also been recognized by prestigious industry awards as a great workplace in Vietnam, Asia, and the U.S. for many years in a row.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Job Description</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Your key responsibilities:</span></p><p><br></p><ul><li>Understand and support the client\'s requirements</li><li>Follow your passion</li><li>Enjoy every single working day with your nice colleagues and our kind clients</li><li>Take your skill to the next level</li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">The responsibility includes design, coding, troubleshooting, and working with the project team as well as customers on features/bug fixes</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Qualifications</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Your key qualifications:</span></p><p><br></p><ul><li>Final year student/ new graduate/ less than 1 year of experience</li><li>Ready to work full-time</li><li>Passion for .NET technology</li><li>Strong fundamental of .NET Framework, C#, SQL, OOP, data structure and algorithms</li><li>Understanding thoroughly of projects being done in university or during the internship</li><li>Good English skills (especially reading and writing)</li><li>Have good communication and be a good team-player</li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Additional Information</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">Perks you Enjoy</span></p><p><br></p><ul><li>Working in one of the Best Places to Work in Vietnam</li><li>Building large-scale &amp; global software products</li><li>Working &amp; growing with Passionate &amp; Talented Team</li><li>Diverse careers opportunities with Software Outsourcing, Software Product Development, IT Solutions &amp; Consulting</li><li>Attractive Salary and Benefits</li><li>Performance appraisals every year</li><li>Onsite opportunities: short-term and long-term assignments in North American (U.S, Canada), Europe, Asia.</li><li>Flexible working time</li><li>Various training on hot-trend technologies, best practices, and soft skills</li><li>Premium healthcare insurance for you and your loved ones</li><li>Company trip every summer, big annual year-end party every year, team building, etc.</li><li>Fitness &amp; sports activities: football, tennis, table-tennis, badminton, yoga, swimming…</li><li>Joining community development activities: 1% Pledge, charity every quarter, blood donation, public seminars, career orientation talks,…</li><li>Free in-house entertainment facilities (foosball, ping pong, gym…), coffee (latte, cappuccino, espresso), and snack (instant noodles, cookies, candies…)</li></ul><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.9);\">And much more...Send your&nbsp;</span><u style=\"color: rgba(0, 0, 0, 0.9);\">Resume including Academic Transcript</u><span style=\"color: rgba(0, 0, 0, 0.9);\">&nbsp;to join us and let yourself explore other fantastic things!</span></p>','da nang',3000,2500,NULL,'Fresher .Net Software Engineer, based in Da Nang','2022-10-22 12:20:31',27,1,1,1),(20,10,'2022-10-22 21:07:11',NULL,NULL,1,'/api/file/images/upload/22/1666447630567_1666447630567_embedded.jpg','<p>fsfsfsdsdfsdf<img src=\"/api/file/images/upload/22/1666447627954_1666447627954_NET_Core_Logo.png\"></p>','can tho',2000,1000,NULL,'embedded engineer ','2022-10-25 19:16:54',27,2,1,2),(21,10,'2022-09-11 07:33:56',NULL,'2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(22,10,'2022-09-11 07:33:56',NULL,'2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(23,10,'2022-09-11 07:33:56',NULL,'2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(24,10,'2022-09-11 07:33:56',NULL,'2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(25,10,'2022-09-11 07:33:56',NULL,'2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(26,10,'2022-09-11 07:33:56',NULL,'2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(27,10,'2022-09-11 07:33:56',NULL,'2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(28,10,'2022-09-11 07:33:56',NULL,'2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(29,10,'2022-09-11 07:33:56',NULL,'2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(30,10,'2022-09-11 07:33:56',NULL,'2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(31,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(32,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(33,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(34,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(35,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(36,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(37,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(38,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(39,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(40,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(41,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(42,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(43,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(44,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(45,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(46,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(47,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(48,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(49,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(50,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(51,10,'2022-09-11 07:33:56','2022-10-08 18:38:54','2022-10-08 18:38:48',0,'/api/file/images/upload/guest/1665448429796_1665448429796_designer_developer.png','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1);
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
INSERT INTO `likes` VALUES (12,'LIKE',1),(16,'LIKE',1),(12,'LIKE',2),(12,'UNLIKE',22),(13,'LIKE',22);
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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (4,'2022-09-30 07:52:45',NULL,'hello world','TEXT','2022-09-30 07:52:45',8,20),(6,'2022-09-30 07:54:15',NULL,'hello world','TEXT','2022-09-30 07:54:15',9,20),(9,'2022-09-30 07:54:44',NULL,'hello world','TEXT','2022-09-30 07:54:44',4,20),(11,'2022-09-30 20:32:52',NULL,'hello world','TEXT','2022-09-30 20:32:52',9,20),(12,'2022-09-30 20:33:27',NULL,'hello world','TEXT','2022-09-30 20:33:27',9,20),(13,'2022-09-30 21:07:16',NULL,'hello world','TEXT','2022-09-30 21:07:16',9,3),(14,'2022-09-30 21:07:30',NULL,'hello world','TEXT','2022-09-30 21:07:30',9,2),(15,'2022-09-30 21:19:27',NULL,'hello world','TEXT','2022-09-30 21:19:27',9,3),(22,'2022-10-22 19:52:57',NULL,'good mornig','TEXT','2022-10-22 19:52:57',16,22),(23,'2022-10-22 19:53:54',NULL,'good mornig','TEXT','2022-10-22 19:53:54',16,22),(24,'2022-10-22 20:47:13',NULL,'HELLO MY name van a','TEXT','2022-10-22 20:47:13',16,2),(25,'2022-10-23 10:29:16',NULL,'what about you ?','TEXT','2022-10-23 10:29:16',16,2),(26,'2022-10-23 10:29:59',NULL,'I\'m fine thank you and you?','TEXT','2022-10-23 10:29:59',16,22),(27,'2022-10-23 11:00:26',NULL,'hello ','TEXT','2022-10-23 11:00:26',13,22),(28,'2022-10-23 11:00:40',NULL,'what is your name ','TEXT','2022-10-23 11:00:40',13,22),(29,'2022-10-23 11:00:53',NULL,'what is your name sdfdsfdsffffffffff','TEXT','2022-10-23 11:00:53',13,22),(30,'2022-10-23 11:01:50',NULL,'what is your name sdfdsfdsffffffffff','TEXT','2022-10-23 11:01:50',13,22),(31,'2022-10-23 11:10:54',NULL,'hello','TEXT','2022-10-23 11:10:54',16,22),(32,'2022-10-23 11:13:35',NULL,'hi how about you','TEXT','2022-10-23 11:13:35',16,22),(33,'2022-10-23 11:15:34',NULL,'heheheh','TEXT','2022-10-23 11:15:34',16,2),(34,'2022-10-23 11:15:42',NULL,'sdfsdfsfsdf','TEXT','2022-10-23 11:15:42',16,22),(35,'2022-10-23 11:22:55',NULL,'what you name ?','TEXT','2022-10-23 11:22:55',16,2),(36,'2022-10-23 11:25:37',NULL,'how are you','TEXT','2022-10-23 11:25:37',16,22),(37,'2022-10-23 11:26:38',NULL,'how can you do it','TEXT','2022-10-23 11:26:38',16,2),(38,'2022-10-23 11:27:42',NULL,'nono','TEXT','2022-10-23 11:27:42',16,22),(39,'2022-10-23 11:28:28',NULL,'what your name','TEXT','2022-10-23 11:28:28',16,22),(40,'2022-10-23 11:28:59',NULL,'abc d','TEXT','2022-10-23 11:28:59',16,22),(41,'2022-10-23 11:29:30',NULL,'sdfsdfds','TEXT','2022-10-23 11:29:30',16,22),(42,'2022-10-23 11:31:17',NULL,'dddddd','TEXT','2022-10-23 11:31:17',16,22),(43,'2022-10-23 11:52:07',NULL,'hey','TEXT','2022-10-23 11:52:07',16,2),(44,'2022-10-23 11:52:15',NULL,'what your name','TEXT','2022-10-23 11:52:15',16,22),(45,'2022-10-23 11:52:39',NULL,'i am find thank you','TEXT','2022-10-23 11:52:39',16,2),(46,'2022-10-23 11:52:52',NULL,'i am find thank you','TEXT','2022-10-23 11:52:52',16,2),(47,'2022-10-23 11:53:05',NULL,'gfgf','TEXT','2022-10-23 11:53:05',16,2),(48,'2022-10-23 11:53:16',NULL,'gfgf','TEXT','2022-10-23 11:53:16',16,2),(49,'2022-10-23 11:53:27',NULL,'what your name','TEXT','2022-10-23 11:53:27',16,22),(50,'2022-10-23 11:53:38',NULL,'gfgf','TEXT','2022-10-23 11:53:38',16,2),(51,'2022-10-23 11:55:19',NULL,'hello what you name','TEXT','2022-10-23 11:55:19',16,2),(52,'2022-10-23 12:03:10',NULL,'?','TEXT','2022-10-23 12:03:10',16,2),(53,'2022-10-23 12:03:27',NULL,'how are you ','TEXT','2022-10-23 12:03:27',16,22),(54,'2022-10-23 12:03:41',NULL,'im fine thank you and you ','TEXT','2022-10-23 12:03:41',16,22),(55,'2022-10-23 12:03:47',NULL,'hihih','TEXT','2022-10-23 12:03:47',16,2),(56,'2022-10-23 12:12:15',NULL,'what about you ','TEXT','2022-10-23 12:12:15',16,2),(57,'2022-10-23 12:12:29',NULL,'nono ','TEXT','2022-10-23 12:12:29',16,22),(58,'2022-10-23 12:12:46',NULL,'now now','TEXT','2022-10-23 12:12:46',16,22),(59,'2022-10-23 12:13:03',NULL,'what about you ','TEXT','2022-10-23 12:13:03',16,2),(60,'2022-10-23 12:13:13',NULL,'now now','TEXT','2022-10-23 12:13:13',16,22),(61,'2022-10-23 12:17:21',NULL,'hello','TEXT','2022-10-23 12:17:21',17,22),(62,'2022-10-23 12:17:39',NULL,'ưhat','TEXT','2022-10-23 12:17:39',16,2),(63,'2022-10-23 13:45:31',NULL,'how','TEXT','2022-10-23 13:45:31',16,22),(64,'2022-10-23 13:47:06',NULL,'chat.zalo.me','TEXT','2022-10-23 13:47:06',17,22),(65,'2022-10-23 13:47:59',NULL,'what your name','TEXT','2022-10-23 13:47:59',17,22),(66,'2022-10-23 13:48:52',NULL,'here','TEXT','2022-10-23 13:48:52',17,22),(67,'2022-10-23 13:50:41',NULL,'dsfsdfsd','TEXT','2022-10-23 13:50:41',17,22),(68,'2022-10-23 13:52:42',NULL,'chat','TEXT','2022-10-23 13:52:42',17,22),(69,'2022-10-23 13:53:29',NULL,'test','TEXT','2022-10-23 13:53:29',17,22),(70,'2022-10-23 13:55:22',NULL,'dfsdf','TEXT','2022-10-23 13:55:22',17,22),(71,'2022-10-23 14:23:47',NULL,'attachment','IMAGE','2022-10-23 14:23:47',17,22),(72,'2022-10-23 14:24:23',NULL,'attachment','IMAGE','2022-10-23 14:24:23',17,22),(73,'2022-10-23 14:25:22',NULL,'attachment','IMAGE','2022-10-23 14:25:22',17,22),(74,'2022-10-23 14:25:58',NULL,'attachment','IMAGE','2022-10-23 14:25:58',17,22),(75,'2022-10-23 14:26:38',NULL,'How do you think about it','TEXT','2022-10-25 06:02:12',17,22),(79,'2022-10-23 14:55:44',NULL,'attachment','IMAGE','2022-10-23 14:55:44',16,2),(80,'2022-10-23 14:57:33',NULL,'attachment','IMAGE','2022-10-23 14:57:33',16,22),(81,'2022-10-24 06:31:33',NULL,'what about you and your are beautiful and i have a dream. Me and You will live together forgever how about you hhhhhhhhhhhhhhhhhhhhhhhhh','TEXT','2022-10-24 06:31:33',16,22),(83,'2022-10-24 07:12:43',NULL,'hello ban dieu','TEXT','2022-10-24 07:12:43',18,1),(84,'2022-10-24 07:13:49',NULL,'hello','TEXT','2022-10-24 07:13:49',18,1),(85,'2022-10-24 07:24:54',NULL,'hello ban linh','TEXT','2022-10-24 07:24:54',18,22),(86,'2022-10-24 07:25:12',NULL,'hi','TEXT','2022-10-24 07:25:12',18,1),(87,'2022-10-24 07:25:35',NULL,'attachment','IMAGE','2022-10-24 07:25:35',18,1),(88,'2022-10-24 07:29:40',NULL,'lai la minh ne dieu','TEXT','2022-10-24 07:29:40',18,1),(89,'2022-10-24 07:31:29',NULL,'what about you','TEXT','2022-10-24 07:31:29',18,1),(90,'2022-10-24 07:31:50',NULL,'heyhey','TEXT','2022-10-24 07:31:50',18,1),(91,'2022-10-24 07:32:10',NULL,'dfdf','TEXT','2022-10-24 07:32:10',18,1),(92,'2022-10-24 07:32:31',NULL,'attachment','IMAGE','2022-10-24 07:32:31',18,1),(93,'2022-10-24 07:34:41',NULL,'hihi','TEXT','2022-10-24 07:34:41',18,1),(94,'2022-10-24 07:34:46',NULL,'aaaa','TEXT','2022-10-24 07:34:46',18,1),(95,'2022-10-24 07:35:08',NULL,'abc edf','TEXT','2022-10-24 07:35:08',18,1),(96,'2022-10-24 07:35:18',NULL,'zzzzz','TEXT','2022-10-24 07:35:18',18,1),(97,'2022-10-24 07:35:30',NULL,'dsfsfsfsdfsdfsfs','TEXT','2022-10-24 07:35:30',18,1),(98,'2022-10-24 07:35:35',NULL,'ddd','TEXT','2022-10-24 07:35:35',16,22),(99,'2022-10-24 07:35:38',NULL,'ssss','TEXT','2022-10-24 07:35:38',18,1),(100,'2022-10-24 07:35:48',NULL,'aaaaaaaaaaaaaaa','TEXT','2022-10-24 07:35:48',18,22),(101,'2022-10-24 07:36:46',NULL,'ssss','TEXT','2022-10-24 07:36:46',18,22),(102,'2022-10-24 07:36:59',NULL,'aaa','TEXT','2022-10-24 07:36:59',18,22),(103,'2022-10-24 07:37:20',NULL,'aaa','TEXT','2022-10-24 07:37:20',18,22),(104,'2022-10-24 07:37:41',NULL,'aaaaaaaaaaaaa','TEXT','2022-10-24 07:37:41',18,22),(105,'2022-10-24 07:39:01',NULL,'aaaa','TEXT','2022-10-24 07:39:01',18,22),(106,'2022-10-24 07:39:02',NULL,'aaa','TEXT','2022-10-24 07:39:02',18,22),(107,'2022-10-24 07:39:21',NULL,'a','TEXT','2022-10-24 07:39:21',18,22),(108,'2022-10-24 07:39:31',NULL,'aaaa','TEXT','2022-10-24 07:39:31',18,22),(109,'2022-10-24 07:39:46',NULL,'aaaaa','TEXT','2022-10-24 07:39:46',18,22),(110,'2022-10-24 07:40:03',NULL,'what do you think about','TEXT','2022-10-24 07:40:03',18,1),(111,'2022-10-24 07:40:09',NULL,'hey man','TEXT','2022-10-24 07:40:09',18,1),(112,'2022-10-24 07:40:19',NULL,'attachment','IMAGE','2022-10-24 07:40:19',18,1),(113,'2022-10-24 07:58:39',NULL,'hello','TEXT','2022-10-24 07:58:39',18,22),(114,'2022-10-24 07:59:09',NULL,'attachment','IMAGE','2022-10-24 07:59:09',18,22),(115,'2022-10-24 07:59:40',NULL,'nonoooooooô','TEXT','2022-10-24 21:15:40',18,22),(116,'2022-10-25 06:06:17',NULL,'what about you','TEXT','2022-10-25 06:06:17',17,22),(117,'2022-10-25 06:07:09',NULL,'hello long time no see','TEXT','2022-10-25 06:07:09',17,20),(118,'2022-10-25 06:09:29',NULL,'hello','TEXT','2022-10-25 06:09:29',17,22),(119,'2022-10-25 06:09:41',NULL,'what about you hehe','TEXT','2022-10-25 06:10:06',17,22),(122,'2022-10-25 06:10:45',NULL,'nonodsfdsfsdfdsf','TEXT','2022-10-25 06:11:06',17,20),(123,'2022-10-25 06:11:10',NULL,'dsfdfdsfsd','TEXT','2022-10-25 06:11:10',17,20),(124,'2022-10-25 06:13:33',NULL,'sdfsdfsd','TEXT','2022-10-25 06:13:33',17,20),(125,'2022-10-25 06:16:10',NULL,'dsfsdfsdf','TEXT','2022-10-25 06:16:10',17,20),(126,'2022-10-25 06:16:18',NULL,'dfsdfds','TEXT','2022-10-25 06:16:18',17,20),(128,'2022-10-29 13:26:51',NULL,'hello ban dieu','TEXT','2022-10-29 13:26:51',17,20),(129,'2022-10-30 12:14:40',NULL,'attachment','IMAGE','2022-10-30 12:14:40',16,2),(130,'2022-10-30 12:15:00',NULL,'chat','TEXT','2022-10-30 12:15:00',16,2);
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
INSERT INTO `participants` VALUES (21,4),(20,9),(3,8),(3,9),(22,13),(3,13),(2,16),(22,16),(20,17),(22,17),(22,18),(1,18);
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`post_id`),
  KEY `FK5lidm6cqbc7u4xhqpxm898qme` (`user_id`),
  CONSTRAINT `FK5lidm6cqbc7u4xhqpxm898qme` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'what do think about this job edited?'),(2,'how much experience have you work on this field'),(3,'do you have any  1'),(4,'do you have any certificates 2'),(5,'do you have any certificates 3'),(25,'how many years are you in web dev'),(26,'Really join'),(27,'that is new question'),(28,'how many year have you been this fields'),(29,'what do think about our company?'),(30,'what is the thread in c++'),(31,'do you have any certificates  about C#'),(32,'how many year have you been this field?'),(33,'dsfsdfsdf');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'java'),(2,'c++'),(3,'web'),(4,'nodejs'),(5,'javascript'),(6,'ui-ux'),(7,'graphic design'),(8,'embedded'),(9,'mobile'),(10,'linux'),(11,'java'),(12,'ui-ux');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'frontend'),(2,'rearctjs'),(3,'javascript'),(10,'Web'),(11,'Java'),(12,'Backend'),(13,'agriculture'),(14,'warter'),(15,'plant'),(16,'fresh'),(17,'json'),(18,'android'),(19,'mobile'),(20,'github'),(21,'devop'),(22,'fpt'),(23,'cantho'),(24,'embedded'),(25,'system'),(26,'net'),(27,'csharp'),(28,'software');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_company_roles`
--

DROP TABLE IF EXISTS `user_company_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_company_roles` (
  `company_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company_id`,`user_id`),
  KEY `FK5tyfrt88x7ieu9dgdcxofulu7` (`user_id`),
  CONSTRAINT `FK5tyfrt88x7ieu9dgdcxofulu7` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKmrq17glp5v32l0rsfqq4m08p` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_company_roles`
--

LOCK TABLES `user_company_roles` WRITE;
/*!40000 ALTER TABLE `user_company_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_company_roles` ENABLE KEYS */;
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
INSERT INTO `user_roles` VALUES (1,2),(2,1),(3,1),(20,1),(21,1),(22,1);
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
INSERT INTO `user_skills` VALUES (20,1),(20,3),(20,2),(21,4),(21,5),(1,5),(1,5),(1,6),(1,2),(22,7),(22,9),(22,1),(22,6),(22,3);
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
/*!50001 VIEW `popular_companies` AS select `top_ca`.`company_id` AS `company_id`,coalesce(`top_cf`.`number_of_follows`,0) AS `number_of_follows`,`top_ca`.`number_of_applications` AS `number_of_applications` from ((select `c`.`company_id` AS `company_id`,coalesce(sum(`ja`.`number_of_application`),0) AS `number_of_applications` from (`companies` `c` left join (select `j`.`company_id` AS `company_id`,count(`a`.`job_id`) AS `number_of_application` from (`jobs` `j` left join `applications` `a` on((`j`.`job_id` = `a`.`job_id`))) group by `j`.`job_id`,`j`.`company_id`) `ja` on((`c`.`company_id` = `ja`.`company_id`))) group by `c`.`company_id`) `top_ca` left join (select `c`.`company_id` AS `company_id`,count(`c`.`company_id`) AS `number_of_follows` from (`companies` `c` join `follow_companies` `fc` on((`c`.`company_id` = `fc`.`company_id`))) group by `c`.`company_id`) `top_cf` on((`top_ca`.`company_id` = `top_cf`.`company_id`))) order by `number_of_follows` desc,`top_ca`.`number_of_applications` desc limit 10 */;
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
/*!50001 VIEW `popular_jobs` AS select `top_ja`.`job_id` AS `job_id`,coalesce(`top_jf`.`number_of_likes`,0) AS `number_of_like`,`top_ja`.`number_of_applications` AS `number_of_applications` from ((select `j`.`job_id` AS `job_id`,sum(`ja`.`number_of_application`) AS `number_of_applications` from (`jobs` `j` left join (select `j`.`job_id` AS `job_id`,count(`a`.`job_id`) AS `number_of_application` from (`jobs` `j` left join `applications` `a` on((`j`.`job_id` = `a`.`job_id`))) group by `j`.`job_id`,`j`.`company_id`) `ja` on((`j`.`job_id` = `ja`.`job_id`))) group by `j`.`job_id`) `top_ja` left join (select `l`.`job_id` AS `job_id`,count(`l`.`job_id`) AS `number_of_likes` from (`jobs` join `likes` `l` on((`jobs`.`job_id` = `l`.`job_id`))) where (`l`.`type_like` = 'LIKE') group by `l`.`job_id`) `top_jf` on((`top_ja`.`job_id` = `top_jf`.`job_id`))) order by `top_ja`.`number_of_applications` desc,`top_jf`.`number_of_likes` desc limit 10 */;
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

-- Dump completed on 2022-10-31  8:12:18
