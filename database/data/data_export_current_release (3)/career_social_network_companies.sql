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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-14  7:51:47
