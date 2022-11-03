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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-03  8:11:43
