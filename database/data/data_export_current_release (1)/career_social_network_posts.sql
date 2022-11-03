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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,'Eos deleniti est omnis quo tenetur cum. Aut totam et ad sint maiores. Nobis et veritatis. Dolores nemo eum non ex neque eum debitis.','2022-11-01 06:23:59',NULL,'This is Decription','http://placeimg.com/640/480','international-mobility-analyst1','International Mobility Analyst','2022-11-01 06:23:59',20,'PUBLIC'),(5,'Quos dolor quibusdam omnis eos. Eveniet accusamus suscipit a.','2022-11-01 06:35:40',NULL,'This is Decription','http://placeimg.com/640/480','forward-solutions-orchestrator21','Forward Solutions Orchestrator','2022-11-01 06:35:40',20,'PUBLIC'),(6,'Iste est dicta. Nemo inventore aut.','2022-11-01 06:35:44',NULL,'This is Decription','http://placeimg.com/640/480','national-data-manager1','National Data Manager','2022-11-01 06:35:44',20,'PRIVATE'),(7,'Animi qui soluta totam esse omnis accusamus odio mollitia. Sed aperiam et voluptatem est veritatis.','2022-11-01 06:35:47',NULL,'This is Decription','http://placeimg.com/640/480','customer-quality-officer1','Customer Quality Officer','2022-11-01 06:35:47',20,'PRIVATE'),(8,'Quo qui animi. Reiciendis quos maiores quia architecto repellat.','2022-11-01 06:57:27',NULL,'This is Decription','http://placeimg.com/640/480','central-applications-coordinator1','Central Applications Coordinator','2022-11-01 06:57:27',20,'PUBLIC'),(9,'Aliquid modi qui. Earum doloremque sit omnis autem.','2022-11-01 07:34:40',NULL,'This is Decription','http://placeimg.com/640/480','chief-brand-analyst1','Chief Brand Analyst','2022-11-01 07:34:40',20,'PUBLIC'),(10,'<h1 class=\"ql-align-center\"><strong class=\"ql-font-monospace ql-size-huge\">Title</strong></h1><ol><li>that is the title</li></ol><p><br></p><p><br></p><p><br></p><p><img src=\"/api/file/images/upload/22/1667363940870_1667363940870_huubang.png\"></p>','2022-11-02 11:40:16',NULL,'this is description hehe','/api/file/images/upload/22/1667364015459_1667364015459_tran_thi_tuyet_mai.png','that-is-the-post-i-have-just-created5','that is the post I have just created','2022-11-02 11:40:16',22,'PUBLIC'),(12,'<p>sdfsdf </p>','2022-11-02 16:37:56','2022-11-02 16:38:37','dsfsdfs','/api/file/images/upload/22/1667381875383_1667381875381_hoanglinh.png','srgfsdfs-sdf-hoang-linh4','srgfsdfs sdf Hoàng Linh','2022-11-02 16:38:37',22,'PRIVATE'),(13,'Eos deleniti est omnis quo tenetur cum. Aut totam et ad sint maiores. Nobis et veritatis. Dolores nemo eum non ex neque eum debitis.','2022-11-01 06:23:59',NULL,'This is Decription','http://placeimg.com/640/480','international-mobility-analyst6','International Mobility Analyst','2022-11-01 06:23:59',20,'PUBLIC'),(14,'Quos dolor quibusdam omnis eos. Eveniet accusamus suscipit a.','2022-11-01 06:35:40',NULL,'This is Decription','http://placeimg.com/640/480','forward-solutions-orchestrator2','Forward Solutions Orchestrator','2022-11-01 06:35:40',20,'PUBLIC'),(15,'Iste est dicta. Nemo inventore aut.','2022-11-01 06:35:44',NULL,'This is Decription','http://placeimg.com/640/480','national-data-manager2','National Data Manager','2022-11-01 06:35:44',20,'PRIVATE'),(16,'Animi qui soluta totam esse omnis accusamus odio mollitia. Sed aperiam et voluptatem est veritatis.','2022-11-01 06:35:47',NULL,'This is Decription','http://placeimg.com/640/480','customer-quality-officer2','Customer Quality Officer','2022-11-01 06:35:47',20,'PRIVATE'),(17,'Quo qui animi. Reiciendis quos maiores quia architecto repellat.','2022-11-01 06:57:27',NULL,'This is Decription','http://placeimg.com/640/480','central-applications-2','Central Applications Coordinator','2022-11-01 06:57:27',20,'PUBLIC'),(18,'Aliquid modi qui. Earum doloremque sit omnis autem.','2022-11-01 07:34:40',NULL,'This is Decription','http://placeimg.com/640/480','chief-brand-analyst2','Chief Brand Analyst','2022-11-01 07:34:40',20,'PUBLIC'),(19,'<h1 class=\"ql-align-center\"><strong class=\"ql-font-monospace ql-size-huge\">Title</strong></h1><ol><li>that is the title</li></ol><p><br></p><p><br></p><p><br></p><p><img src=\"/api/file/images/upload/22/1667363940870_1667363940870_huubang.png\"></p>','2022-11-02 11:40:16',NULL,'this is description hehe','/api/file/images/upload/22/1667364015459_1667364015459_tran_thi_tuyet_mai.png','that-is-the-post-i-have-just-created6','that is the post I have just created','2022-11-02 11:40:16',22,'PUBLIC'),(20,'Eos deleniti est omnis quo tenetur cum. Aut totam et ad sint maiores. Nobis et veritatis. Dolores nemo eum non ex neque eum debitis.','2022-11-01 06:23:59',NULL,'This is Decription','http://placeimg.com/640/480','international-mobility-analyst4','International Mobility Analyst','2022-11-01 06:23:59',20,'PUBLIC'),(21,'Quos dolor quibusdam omnis eos. Eveniet accusamus suscipit a.','2022-11-01 06:35:40',NULL,'This is Decription','http://placeimg.com/640/480','forward-solutions-5','Forward Solutions Orchestrator','2022-11-01 06:35:40',20,'PUBLIC'),(22,'Iste est dicta. Nemo inventore aut.','2022-11-01 06:35:44',NULL,'This is Decription','http://placeimg.com/640/480','national-data-manager3','National Data Manager','2022-11-01 06:35:44',20,'PRIVATE'),(23,'Animi qui soluta totam esse omnis accusamus odio mollitia. Sed aperiam et voluptatem est veritatis.','2022-11-01 06:35:47',NULL,'This is Decription','http://placeimg.com/640/480','customer-quality-officer3','Customer Quality Officer','2022-11-01 06:35:47',20,'PRIVATE'),(24,'Quo qui animi. Reiciendis quos maiores quia architecto repellat.','2022-11-01 06:57:27',NULL,'This is Decription','http://placeimg.com/640/480','central-applications-3','Central Applications Coordinator','2022-11-01 06:57:27',20,'PUBLIC'),(25,'Aliquid modi qui. Earum doloremque sit omnis autem.','2022-11-01 07:34:40',NULL,'This is Decription','http://placeimg.com/640/480','chief-brand-analyst3','Chief Brand Analyst','2022-11-01 07:34:40',20,'PUBLIC'),(26,'<h1 class=\"ql-align-center\"><strong class=\"ql-font-monospace ql-size-huge\">Title</strong></h1><ol><li>that is the title</li></ol><p><br></p><p><br></p><p><br></p><p><img src=\"/api/file/images/upload/22/1667363940870_1667363940870_huubang.png\"></p>','2022-11-02 11:40:16',NULL,'this is description hehe','/api/file/images/upload/22/1667364015459_1667364015459_tran_thi_tuyet_mai.png','that-is-the-post-i-have-just-created7','that is the post I have just created','2022-11-02 11:40:16',22,'PUBLIC');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-03  8:11:54
