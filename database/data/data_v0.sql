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
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `attachment_types`
--

LOCK TABLES `attachment_types` WRITE;
/*!40000 ALTER TABLE `attachment_types` DISABLE KEYS */;
INSERT INTO `attachment_types` VALUES (4,'audio'),(1,'normal'),(2,'picture'),(3,'video');
/*!40000 ALTER TABLE `attachment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comment_likes`
--

LOCK TABLES `comment_likes` WRITE;
/*!40000 ALTER TABLE `comment_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (8,'2022-09-07 06:01:14',NULL,'hello','hoanglinhplus','life is riding a bicycle','2022-09-07 06:01:14','https://hoanglinhplus.com',2,2,1),(17,'2022-09-10 16:48:27',NULL,'hello','hoanglinhplus','life is riding a bicycle','2022-09-10 16:48:27','https://hoanglinhplus.com',20,2,1),(18,'2022-09-10 16:48:50',NULL,'minhman logo 123321','minhmanhaha','that is a good idea yeah','2022-09-10 16:48:50','https://minhmanhaha.com.vn',20,3,5),(19,'2022-09-12 20:27:00',NULL,'van minh logo','vanminh farmers','that is a good idea haha','2022-09-12 20:27:00','https://vanminhfarmer.com.vn',21,5,1);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `company_notifications`
--

LOCK TABLES `company_notifications` WRITE;
/*!40000 ALTER TABLE `company_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `educations`
--

LOCK TABLES `educations` WRITE;
/*!40000 ALTER TABLE `educations` DISABLE KEYS */;
INSERT INTO `educations` VALUES (22,'2022-11-11 07:00:00',3.54,'Can Tho 532 Univesity','2018-10-12 07:00:00',NULL),(24,'2022-12-12 07:00:00',0,'Can Tho Univesity','2018-04-12 07:00:00',20),(25,'2019-12-02 07:00:00',0,'Binh Thuan Univesity','2015-04-12 07:00:00',21);
/*!40000 ALTER TABLE `educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employment_types`
--

LOCK TABLES `employment_types` WRITE;
/*!40000 ALTER TABLE `employment_types` DISABLE KEYS */;
INSERT INTO `employment_types` VALUES (1,'full-time'),(2,'part-time'),(3,'contract'),(4,'internship');
/*!40000 ALTER TABLE `employment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `follow_companies`
--

LOCK TABLES `follow_companies` WRITE;
/*!40000 ALTER TABLE `follow_companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `follow_tags`
--

LOCK TABLES `follow_tags` WRITE;
/*!40000 ALTER TABLE `follow_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `industries`
--

LOCK TABLES `industries` WRITE;
/*!40000 ALTER TABLE `industries` DISABLE KEYS */;
INSERT INTO `industries` VALUES (1,'c??ng ngh??? th??ng tin'),(2,'c??ng ngh??? th??ng tin'),(3,'y t???'),(4,'n??ng nghi???p'),(5,'du l???ch'),(6,'th???c ph???m v?? ????? u???ng'),(7,'s???n xu???t v?? d???ch v???');
/*!40000 ALTER TABLE `industries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `job_question`
--

LOCK TABLES `job_question` WRITE;
/*!40000 ALTER TABLE `job_question` DISABLE KEYS */;
INSERT INTO `job_question` VALUES (3,7,3),(4,7,4);
/*!40000 ALTER TABLE `job_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `job_skills`
--

LOCK TABLES `job_skills` WRITE;
/*!40000 ALTER TABLE `job_skills` DISABLE KEYS */;
INSERT INTO `job_skills` VALUES (2,6),(3,7),(4,7),(2,8),(1,6),(1,8);
/*!40000 ALTER TABLE `job_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `job_tags`
--

LOCK TABLES `job_tags` WRITE;
/*!40000 ALTER TABLE `job_tags` DISABLE KEYS */;
INSERT INTO `job_tags` VALUES (10,6),(11,6),(12,6),(1,7),(2,7),(3,7),(16,8),(13,8),(14,8),(15,8);
/*!40000 ALTER TABLE `job_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (6,10,'2022-09-11 07:33:56',NULL,NULL,0,'https://image.jpg','tma want to hire a backend  developer','ho chi minh',1000,500,NULL,'web backend developer','2022-09-11 07:33:56',18,1,1,1),(7,10,'2022-09-11 07:34:26',NULL,NULL,0,'https://image.jpg','tma want to hire a backend developer','ho chi minh',1000,500,NULL,'web front developer','2022-09-11 07:34:26',8,2,2,2),(8,12,'2022-09-12 20:28:51',NULL,'2023-01-12 07:00:00',0,'https://image-farmer.jpg','van minh want to hire a farmer to water plants','ho chi minh',1000,500,'2022-09-15 07:00:00','farmer job','2022-09-13 06:59:13',19,1,2,1);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `jobs_comments`
--

LOCK TABLES `jobs_comments` WRITE;
/*!40000 ALTER TABLE `jobs_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `organization_sizes`
--

LOCK TABLES `organization_sizes` WRITE;
/*!40000 ALTER TABLE `organization_sizes` DISABLE KEYS */;
INSERT INTO `organization_sizes` VALUES (1,'0-1 employees'),(2,'2-10 employees'),(3,'11-20 employees'),(4,'11-50 employees'),(5,'51-200 employees'),(6,'501-1000 employees'),(7,'1000+ employees');
/*!40000 ALTER TABLE `organization_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usernameParticipants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Engineer'),(2,'Senior Engineer'),(3,'Team Leader'),(4,'Project Manager');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'what do think about this job edited?'),(2,'how much experience have you work on this field'),(3,'do you have any certificates'),(4,'do you have any certificates');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'USER'),(2,'ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'java'),(2,'c++'),(3,'web'),(4,'nodejs'),(5,'javascript'),(6,'ui-ux'),(7,'graphic design'),(8,'embedded'),(9,'mobile'),(10,'linux'),(11,'java'),(12,'ui-ux');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'frontend'),(2,'rearctjs'),(3,'javascript'),(10,'Web'),(11,'Java'),(12,'Backend'),(13,'agriculture'),(14,'warter'),(15,'plant'),(16,'fresh');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_company_roles`
--

LOCK TABLES `user_company_roles` WRITE;
/*!40000 ALTER TABLE `user_company_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_company_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_notification_relationship`
--

LOCK TABLES `user_notification_relationship` WRITE;
/*!40000 ALTER TABLE `user_notification_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notification_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_notifications`
--

LOCK TABLES `user_notifications` WRITE;
/*!40000 ALTER TABLE `user_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,2),(2,1),(3,1),(20,1),(21,1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_skills`
--

LOCK TABLES `user_skills` WRITE;
/*!40000 ALTER TABLE `user_skills` DISABLE KEYS */;
INSERT INTO `user_skills` VALUES (20,1),(20,3),(20,2),(21,4),(21,5);
/*!40000 ALTER TABLE `user_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ki??n giang',NULL,'hello i am hoanglinhplus','2022-09-03 14:16:44',NULL,NULL,'2000-11-25 14:16:57','linh07221@gmail.com',NULL,NULL,'nguyen hoang linh','m',_binary '','$2a$12$xCmz2Tsx3FS5f8AEoLkNoeI8iYsZeZDHOTSg2gBcQhPXI0ezc44wK',NULL,'hoanglinh'),(2,'longan',NULL,'nice to meet you','2022-09-03 14:25:21',NULL,NULL,'1998-06-03 14:25:34','vana123@gmail.com',NULL,NULL,'nguyen van a','m',_binary '','$2a$12$w71H35UliCZ/NTh0x2t1sOSskBcJKOLoTuq5nUKttzvVbeuKlobEu',NULL,'vana123'),(3,'vinh long',NULL,'i am glad to meet you ','2022-09-03 14:27:44',NULL,'2022-09-03 14:27:50','2022-09-03 14:27:54','ngochoa@gmail.com',NULL,NULL,'tran ngoc hoa','f',_binary '','$2a$12$RozngUfanm1Gy.tbdfh4Ge537Oli7R1G/3MAMCcZrLQJibKy4fX0C',NULL,'ngochoa123'),(20,'long h???, v??nh long',NULL,'Hello everyone, i am an engineer',NULL,NULL,NULL,'2000-04-25 07:00:00','minhman123@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$LFvOE9vTy2NjDAi.khfu5uKtnDPO3XVMlOh5gCYi.a8882sWmdTi.',NULL,'MinhMan'),(21,'B??nh Thu???n',NULL,'Hello everyone, i am an worker',NULL,NULL,NULL,'1998-12-03 07:00:00','vanminh7676@gmail.com',NULL,NULL,NULL,'m',_binary '','$2a$10$wCefEiKwu7mXNa1clDWPE.nMXw3bHMYH28LFJU1EPPmgOJDn114x2',NULL,'VanMinh');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-17 15:11:05
