CREATE DATABASE  IF NOT EXISTS `fitmate` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fitmate`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: i6d105.p.ssafy.io    Database: fitmate
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carousel`
--

DROP TABLE IF EXISTS `carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carousel` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `img_src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carousel`
--

LOCK TABLES `carousel` WRITE;
/*!40000 ALTER TABLE `carousel` DISABLE KEYS */;
INSERT INTO `carousel` VALUES (1,'https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/b11d3ed2-689b-41a7-9731-eecc94c51241KakaoTalk_20220217_150924355.png'),(2,'https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/2a2eef36-f2f7-4571-b077-c5648e62f4deKakaoTalk_20220217_150924532.png'),(3,'https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/b526b129-e00f-4e4f-88ab-f049814ae8a2KakaoTalk_20220217_150924784.png');
/*!40000 ALTER TABLE `carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_room`
--

DROP TABLE IF EXISTS `chat_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `access_code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `host_no` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbrslxtaynvdh8i1125syoea0m` (`host_no`),
  CONSTRAINT `FKbrslxtaynvdh8i1125syoea0m` FOREIGN KEY (`host_no`) REFERENCES `member` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_room`
--

LOCK TABLES `chat_room` WRITE;
/*!40000 ALTER TABLE `chat_room` DISABLE KEYS */;
INSERT INTO `chat_room` VALUES (1,'stylist991e8ca4-dde2-4fbd-85c8-53e42210ee4e','stylist??? ?????????',4),(2,'??????ca07b5c1-60c3-4b6e-bfd7-7da107d30fd0','????????? ?????????',9),(3,'??????2d2e360a-2e27-4229-b9cd-9549c5f444d8','????????? ?????????',7),(4,'??????????????????1a0f8206e-a272-4540-bf38-ad186b9f27e0','??????????????????1??? ?????????',10),(5,'??????1ba04e29-e2b8-4aa7-8f46-cb11beb03836','????????? ?????????',12),(6,'??????43ecb35d-0a30-46fa-b22e-44a901c7d0d9','????????? ?????????',13),(7,'??????05e4fbb1-f693-45ad-8b8d-bbb1748f3b8f','????????? ?????????',14),(8,'?????????5447ea7d-0b19-4370-af76-4f8865079df8','???????????? ?????????',15),(9,'???????????????cdd93c65-44b3-44c9-9323-0e38885929bb','?????????????????? ?????????',17);
/*!40000 ALTER TABLE `chat_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `writer` bigint NOT NULL,
  `qna` bigint NOT NULL,
  PRIMARY KEY (`no`),
  KEY `FKsi4ytkc92j7fli6sqw0ggv8hn` (`writer`),
  KEY `FK12p10fj54n9qnunq6fduf69wd` (`qna`),
  CONSTRAINT `FK12p10fj54n9qnunq6fduf69wd` FOREIGN KEY (`qna`) REFERENCES `qna` (`no`),
  CONSTRAINT `FKsi4ytkc92j7fli6sqw0ggv8hn` FOREIGN KEY (`writer`) REFERENCES `member` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'?????? 1','2022-02-18 06:52:01',15,1),(2,'???????????? ????????? ?????????.','2022-02-18 06:57:02',2,2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `follower` bigint NOT NULL,
  `following` bigint NOT NULL,
  PRIMARY KEY (`no`),
  KEY `FKon174ytyau6iulr7uyxfoui4m` (`follower`),
  KEY `FK2epu4q2ky0f1xr15tf5136xmn` (`following`),
  CONSTRAINT `FK2epu4q2ky0f1xr15tf5136xmn` FOREIGN KEY (`following`) REFERENCES `portfolio` (`no`),
  CONSTRAINT `FKon174ytyau6iulr7uyxfoui4m` FOREIGN KEY (`follower`) REFERENCES `member` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (1,1,1),(2,6,1),(3,5,1),(9,6,2),(14,9,3),(29,9,1),(30,4,2),(31,4,3),(32,3,3),(33,5,5),(34,5,2),(35,5,3),(36,5,4),(38,6,5),(39,14,8),(40,14,6),(41,14,5),(42,14,1),(43,13,8),(44,13,1),(45,16,8),(46,13,7),(47,10,9),(48,2,2),(52,6,8),(53,6,6),(55,18,4),(56,4,4);
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `count_of_follower` int NOT NULL DEFAULT '0',
  `grade` float NOT NULL DEFAULT '0',
  `stylist` bigint NOT NULL,
  PRIMARY KEY (`no`),
  KEY `FKeva7t4unfdjowgaick94yvv7m` (`stylist`),
  CONSTRAINT `FKeva7t4unfdjowgaick94yvv7m` FOREIGN KEY (`stylist`) REFERENCES `portfolio` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,6,5,1),(2,4,0,2),(3,4,0,3),(4,3,0,4),(5,3,0,5),(6,2,0,6),(7,1,0,7),(8,4,0,8),(9,1,0,9);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_entity`
--

DROP TABLE IF EXISTS `like_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_entity` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `member` bigint NOT NULL,
  `style` bigint NOT NULL,
  PRIMARY KEY (`no`),
  KEY `FKjcwh5dr8uckvux54qypy4oimj` (`member`),
  KEY `FK9kue4m09lwrvwujvne5t537dc` (`style`),
  CONSTRAINT `FK9kue4m09lwrvwujvne5t537dc` FOREIGN KEY (`style`) REFERENCES `style` (`no`),
  CONSTRAINT `FKjcwh5dr8uckvux54qypy4oimj` FOREIGN KEY (`member`) REFERENCES `member` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_entity`
--

LOCK TABLES `like_entity` WRITE;
/*!40000 ALTER TABLE `like_entity` DISABLE KEYS */;
INSERT INTO `like_entity` VALUES (2,1,1),(3,6,2),(6,9,1),(8,9,2),(9,4,2),(10,4,1),(11,5,7),(12,5,2),(13,5,1),(14,5,6),(15,5,5),(16,5,4),(17,6,17),(18,6,13),(19,4,10),(20,18,32),(21,18,22),(22,18,26),(23,18,21),(24,18,20),(26,16,32);
/*!40000 ALTER TABLE `like_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) DEFAULT NULL,
  `bottom` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` int NOT NULL,
  `height` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `shoe_size` int NOT NULL,
  `social` varchar(255) NOT NULL,
  `top` int NOT NULL,
  `weight` int NOT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `UK_mbmcqelty0fbrvxp1q58dn57t` (`email`),
  UNIQUE KEY `UK_hh9kg6jti4n1eoiertn2k6qsc` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'ROLE_MEMBER',0,'ssafy@naver.com',0,0,'ssafy@','ssafy','$2a$10$0jQEn.S7Ud1Iw77vznrmj.7roR85373NEnH3fzXWhWcxK7DKfNLjS','','https://hongjunland.s3.ap-northeast-2.amazonaws.com/default_profile.jpg',0,'normal',0,0),(2,'ROLE_ADMIN',0,'admin@ssafy.com',0,0,'?????????','?????????','$2a$10$D0CdV3vwZVTA.TN6rRsdE.QYWVX7MPo5F5Mbx0hK6rQom/Ih1sOGK','string','https://hongjunland.s3.ap-northeast-2.amazonaws.com/default_profile.jpg',0,'string',0,0),(3,'ROLE_MEMBER',0,'ssafy1@naver.com',0,0,'??????1','SSAFY1','$2a$10$mh1Ucv3jlK6lysjSqIygteuCndLR.Rry9pYIJLfwuUCfcCiYu14.G','','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/521747ad-eebe-415b-bb18-7f35aa2805d8KakaoTalk_20220211_113330097_03.jpg',0,'normal',0,0),(4,'ROLE_STYLIST',0,'stylist@naver.com',0,0,'?????????','stylist','$2a$10$PDWeL.xTXLAc09U7ZnO6ruj9Ca4WPSuCohrqs6G6QIoJaEdHkbfE6','01012345678','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/99af04ab-6f96-4275-bfd1-4d4e67f154d6KakaoTalk_20220210_103240548_21.jpg',0,'normal',0,0),(5,'ROLE_MEMBER',90,'whdgur1068@naver.com',0,186,'?????????','??????','$2a$10$TryjGUVXtsudAjfmV1ojKeo9kqltJlAzvWMQEOBge1EaSMusZjQke','01072501068','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/6ba4214c-8534-41f4-89cd-60e7842944c0KakaoTalk_20220208_170649007.png',285,'normal',105,87),(6,'ROLE_MEMBER',34,'dtc03003@naver.com',0,179,'?????????','?????????','$2a$10$YnyltPllQ3DnVjefI4NN.ewFycMTocATBgRPFvlDy7mNDDrjx6wM2','01041985291','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/bc763a2f-c808-42b6-bbe6-44f72b863350%EB%AF%B8%EC%96%B4%EC%BA%A3.jpg',265,'normal',105,73),(7,'ROLE_STYLIST',0,'hhjj9798@naver.com',1,0,'?????????','??????','$2a$10$3yQXDh92nR5CS.ZQ5XKoWeqocEbv7xKCMrad7vwPWAGAkZEi7vhpu','01042285752','https://hongjunland.s3.ap-northeast-2.amazonaws.com/default_profile.jpg',0,'normal',0,0),(8,'ROLE_MEMBER',0,'hjhch323@naver.com',1,160,'?????????','?????????','$2a$10$qFaZiZbkwPH9onAWJPhIP.kue3xh8BE5ZgG8N60yO8a2vA/dWStwq','01042285752','https://hongjunland.s3.ap-northeast-2.amazonaws.com/default_profile.jpg',240,'normal',0,0),(9,'ROLE_STYLIST',0,'joyuri@naver.com',1,0,'?????????','??????','$2a$10$gclB92eWPdbHbU/78D.LguqOSmT6TjeVwKnrXNVQkKjdqPjjh2OGi','01012345678','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/94f6b983-ccb3-46ed-a34d-b3fb75d29314profile.jpg',0,'normal',0,0),(10,'ROLE_STYLIST',0,'zunza96@naver.com',0,0,'?????????','??????????????????1','$2a$10$ohOgNUH4xf6Gm5jPcnbNMuVomcWW7QSdxwXmpzScPXQXgp6VshMp.','01033333333','https://hongjunland.s3.ap-northeast-2.amazonaws.com/default_profile.jpg',0,'normal',0,0),(11,'ROLE_MEMBER',123,'zunza96@nate.com',0,123,'?????????','?????????','$2a$10$ePDnMi/XSy/CKLAu3Ndrg.VDUu7eLWjagXifC/sI4lY5aUxCj9rqK','01033333333','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/e998b742-85eb-484c-890c-a2505ddd9d99profile.jpg',123,'kakao',123,123),(12,'ROLE_STYLIST',0,'lee324@naver.com',1,0,'?????????','??????','$2a$10$UfT3hufOwxEaCN2LHilwjeKGf7ma9NPi5mE3QvmXWI6wuYOCrFegG','01012345678','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/2db95084-25ec-4ffb-8a41-31d8c426d84b54cf5f3dcec281bde5aa3c81c6b14644.jpg',0,'normal',0,0),(13,'ROLE_STYLIST',0,'kim96@ssafy.com',0,0,'?????????','??????','$2a$10$NldDlHkSRaT.AiNhFZSv/ezyBJYcCruOeDlN5dZ/WQ4uBouJiaL5u','01012345678','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/2cad9277-110d-4e5d-bbd9-1a9e38e67ab31ef62179600e16640f36632fce495b40.jpg',0,'normal',0,0),(14,'ROLE_STYLIST',0,'lee96@ssafy.com',0,0,'?????????','??????','$2a$10$7tZlpex9.s90D0SY4z2kE.VmK9oeA4.FLai06wsjomMPTL5rXZH4G','01012345678','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/cf56486d-4cac-4218-927a-03a1655ef8f91235123543534364578679.jpg',0,'normal',0,0),(15,'ROLE_STYLIST',0,'l2e97@ssafy.com',1,0,'?????????','?????????','$2a$10$Wrb7/IcYmYoHJicNJRFnouMssgqcF04wXToAHjmxih3Nl.FAy/70i','01012345678','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/7a889ab7-5f70-40ca-9009-931fe21f40998265c146a55a41aa07a551357ec4f4b1.jpg',0,'normal',0,0),(16,'ROLE_MEMBER',0,'yogjesi@naver.com',1,159,'?????????','????????????','$2a$10$MhoHbpQvi/QXq/RkfQFgmudoGimY3YIfsffggs8JVpwxUdEv/DgAu','01054036559','https://hongjunland.s3.ap-northeast-2.amazonaws.com/default_profile.jpg',0,'normal',0,0),(17,'ROLE_STYLIST',0,'runtoeternity@naver.com',1,0,'?????????','???????????????','$2a$10$YqalkdYaDHGZuZH04vttcOZFO9JG2QX7gG8S3nPuqen2Aftyv3vHy','01054036559','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/a904043d-379b-44dd-8463-338e85492489%EC%84%B1%EC%A7%80%EC%98%812.jpeg',0,'normal',0,0),(18,'ROLE_MEMBER',213,'zunza96@gmail.com',1,123,'?????????','??????12','$2a$10$Gy0vYKd3YvLGiH1LNmB9M.MsQdmW8j3kxGQssDuskHEAY4JJv1h3S','01033333333','https://hongjunland.s3.ap-northeast-2.amazonaws.com/default_profile.jpg',213,'normal',213,123);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `chat_room_no` bigint NOT NULL,
  `sender_no` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7cgs0mhny75otf6givtk0wtuv` (`chat_room_no`),
  KEY `FKjhkbh9eijcs7qyrcjv20r8oq5` (`sender_no`),
  CONSTRAINT `FK7cgs0mhny75otf6givtk0wtuv` FOREIGN KEY (`chat_room_no`) REFERENCES `chat_room` (`id`),
  CONSTRAINT `FKjhkbh9eijcs7qyrcjv20r8oq5` FOREIGN KEY (`sender_no`) REFERENCES `member` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'asd',2,9),(2,'zxc',2,9),(3,'qwd',2,9),(4,'efw',2,9),(5,'vxd',2,9),(6,'xcv',2,9),(7,'asd',2,9),(8,'qwd',2,9),(9,'sdfc',2,9),(10,'sdf',2,9),(11,'??????????????????',4,10),(12,'??????????????????',4,10),(13,'??????????????????',4,10),(14,'??????????????????',4,10),(15,'??????????????????',4,10),(16,'?????????',4,11),(17,'?????????',4,11),(18,'???????????????',4,11),(19,'???????????????',4,10),(20,'???????????????',3,11),(21,'?????????',3,11),(22,'???????????????',4,11),(23,'??????????????????',4,11),(24,'asd',2,9),(25,'asd',2,9),(26,'http://localhost:8080/room/%EC%AA%BC%EC%9C%A8',2,9),(27,'asdf',2,9),(28,'asd',2,3),(29,'asd',2,3),(30,'qwfdc',2,3),(31,'???????????????',1,4),(32,'???????????????',1,3),(33,'asdsa',4,10),(34,'dsa',4,10),(35,'as',4,10),(36,'???????????????!',8,13),(37,'???????????????!',8,15),(38,'???',8,13),(39,'????????????!',8,13),(40,'???????????????',8,6),(41,'???',8,13),(42,'qwe',4,10),(43,'???????????????',1,16),(44,'????????????',1,16),(45,'?????????',1,16),(46,'asd',1,4),(47,'?????? ????????????',1,6),(48,'???????',1,6),(49,'??????',1,16),(50,'???',1,6),(51,'?????????',4,4),(52,'asda',4,10),(53,'asdas',4,10),(54,'das',4,10),(55,'das',4,10),(56,'das',4,10),(57,'das',4,10);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `writer` bigint NOT NULL,
  PRIMARY KEY (`no`),
  KEY `FKctgkrlw7w7qvlk7yxpkn1iqvy` (`writer`),
  CONSTRAINT `FKctgkrlw7w7qvlk7yxpkn1iqvy` FOREIGN KEY (`writer`) REFERENCES `member` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'???????????? ???????????????.','2022-02-17 15:15:56','??? ??????',1);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `state` int DEFAULT NULL,
  `reservation_no` bigint DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `FKkh3hsokjjrjguaomrm40mdqpe` (`reservation_no`),
  CONSTRAINT `FKkh3hsokjjrjguaomrm40mdqpe` FOREIGN KEY (`reservation_no`) REFERENCES `reservation` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,2,1),(2,2,2),(3,2,4),(4,2,45),(5,2,46),(6,2,49),(7,2,50),(8,2,51),(9,2,52),(10,2,54),(11,2,53),(12,2,55);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio`
--

DROP TABLE IF EXISTS `portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `about` varchar(1000) DEFAULT NULL,
  `bio` varchar(1000) DEFAULT NULL,
  `latest_style` datetime DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `stylist` bigint NOT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `UK_rfvui6mga86jam0rm96urhx7s` (`stylist`),
  CONSTRAINT `FK6va49ib27xjvx4xv7pmfducuj` FOREIGN KEY (`stylist`) REFERENCES `member` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio`
--

LOCK TABLES `portfolio` WRITE;
/*!40000 ALTER TABLE `portfolio` DISABLE KEYS */;
INSERT INTO `portfolio` VALUES (1,'?????? ????????? ????????????','???????????????\n???????????????????????????.\n','2022-02-18 06:15:57',100000,4),(2,'???????????????.','???????????????',NULL,1000000,9),(3,'1?????? ????????? ???????????????????????? ????????? ??????!!\n??????????????? ???????????? ?????? ??? ????????? ?????????????????????!','???????????? ???????????????!',NULL,15000,7),(4,'?????????','??????????????? ',NULL,300000,10),(5,'I LOVE ???','?????? ?????? ???????????????.','2022-02-18 06:17:12',5000,12),(6,'?????? ????????? 4.9???!!!\n???????????? ?????? ??? ??????????????? ???????????? ?????? ????????????.\n?????? ???????????????!','????????? ?????? ????????? ?????? ??????','2022-02-18 06:25:49',15000,13),(7,'????????? ?????? ???????????? ??? 8??? \n?????? ??? ???????????????.','????????? ?????? ?????? ???????????? ??????','2022-02-18 06:40:50',15000,14),(8,'????????? ???????????? ?????????????????????!','???????????? ?????????','2022-02-18 06:51:11',5000,15),(9,'??????????????? ?????????????????????!','??????????????? ?????????????????? ?????? ??? ?????? ????????? ???????????????.','2022-02-18 07:45:06',65000,17);
/*!40000 ALTER TABLE `portfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `writer` bigint NOT NULL,
  PRIMARY KEY (`no`),
  KEY `FKdnimploah4e4199wpfqscsr48` (`writer`),
  CONSTRAINT `FKdnimploah4e4199wpfqscsr48` FOREIGN KEY (`writer`) REFERENCES `member` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'sadas','2022-02-18 06:32:43','dasd',10),(2,'??????????????? ?????? ????????? ???????????? ?????? ???????????? ??????????','2022-02-18 06:56:10','???????????????!!',13);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_token`
--

DROP TABLE IF EXISTS `refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_token` (
  `token_key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`token_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_token`
--

LOCK TABLES `refresh_token` WRITE;
/*!40000 ALTER TABLE `refresh_token` DISABLE KEYS */;
INSERT INTO `refresh_token` VALUES ('1','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU2ODM5ODB9._XCDp3zR6lnRKTzQ3rcNutp6PFyVk2wVQfuA7EaS890'),('10','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NTU5MzZ9.oTN-sE4_UztY8I7MLtfUJGZ49WGddwPbs33Its8orL4'),('11','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3MTM0ODh9.ola0NmzGqb9T9nQZi-5lfkeYY2ZwKJtckyKD0aXCHgc'),('12','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3Mzc2MTR9.pL46Vn32xzVaHljzPDz5vLG057HuBmaKyTCHjEf4rfM'),('13','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NTUwMjh9.tlE4f-5ewjIqxZucrFvgDO5MP0r5ZAztXYDGPiefTAk'),('14','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NTU1NjF9.CvY09qRcd9OschqxS517eOI6Sy4Utys-E3p1HMmAQls'),('15','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NDMzNzB9.bqbipc-brKP2NitAfiGiytSyAZy-jfubtXBKoHJKjew'),('16','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NTU1NTl9.AUwADnn9bLLQVyZDtQADpaQPihss52oc6-NA3MiYsic'),('17','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NTMwMjV9.hbD32I9WN60-ArOum8ymVcbkLrV-Z6sAIx5QTRDe01s'),('18','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NTUyODB9.9RucxmpptZBnosqImOzlTIHyWxN_3a304eG5f28l5Fc'),('2','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NDQxODR9.qt79a4NZzfdcY5X4L7jyaJYV43Wx793dq-xSOytSW0M'),('3','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NTUzNDF9.9ARV9y42XhNQksBVd13PcSLzkmBwILM7__TTRPAeMXI'),('4','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NTUyMTN9.c5xxOsYR4tJ3qBfch3kRfxdKua0HUfEuMST4aDX-8cY'),('5','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NTUyNDB9.19aBASNoYWC6HuQUWJsOeSL0Fsxp7yDx4K2wfSBpnlg'),('6','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NTUwMTd9.09Ij-CqEQA_kOs6c9c5DxeD8nrdupiBkCFHq29rqWUM'),('7','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NTAyNjh9.Ww_DjKGBPHZ17d4Si_YLC9HG_CIgjdhCJW-ZVhSha5A'),('8','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NTAyODl9.srqXebpVe7_nO_C487CIcorb8U0a8OOyQzr74K6Wqto'),('9','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NDU3NTUzMjR9.HFET1PTY8dPQHm_ika1sUeJ_6Oh4OJhCwywAANKybIE');
/*!40000 ALTER TABLE `refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `cost` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `start_time` datetime NOT NULL,
  `state` int DEFAULT NULL,
  `customer` bigint DEFAULT NULL,
  `portfolio` bigint DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `FK3tfwk4ibddp8ijboogun3k3g2` (`customer`),
  KEY `FKbohmi4osc7kg99ci9j7u0g40u` (`portfolio`),
  CONSTRAINT `FK3tfwk4ibddp8ijboogun3k3g2` FOREIGN KEY (`customer`) REFERENCES `member` (`no`),
  CONSTRAINT `FKbohmi4osc7kg99ci9j7u0g40u` FOREIGN KEY (`portfolio`) REFERENCES `portfolio` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,100000,'2022-02-17 15:25:48','2022-02-17 17:00:00','2022-02-17 16:00:00',2,1,1),(2,100000,'2022-02-17 15:28:39','2022-02-17 20:00:00','2022-02-17 19:00:00',2,6,1),(4,100000,'2022-02-17 15:44:55','2022-02-28 20:00:00','2022-02-28 19:00:00',0,6,1),(9,100000,'2022-02-17 16:01:18','2022-02-17 18:00:00','2022-02-17 17:00:00',2,5,1),(11,100000,'2022-02-17 16:01:33','2022-02-17 19:00:00','2022-02-17 18:00:00',2,5,1),(13,100000,'2022-02-17 16:02:36','2022-02-18 10:00:00','2022-02-18 09:00:00',0,5,1),(17,100000,'2022-02-17 16:11:53','2022-02-28 10:00:00','2022-02-28 09:00:00',0,5,1),(19,100000,'2022-02-17 16:12:11','2022-02-28 11:00:00','2022-02-28 10:00:00',0,5,1),(21,100000,'2022-02-17 16:12:28','2022-02-28 12:00:00','2022-02-28 11:00:00',0,5,1),(23,100000,'2022-02-17 16:14:25','2022-02-28 13:00:00','2022-02-28 12:00:00',0,5,1),(25,100000,'2022-02-17 16:16:30','2022-02-27 10:00:00','2022-02-27 09:00:00',0,5,1),(29,100000,'2022-02-17 16:20:38','2022-02-27 11:00:00','2022-02-27 10:00:00',0,5,1),(31,100000,'2022-02-17 16:21:20','2022-02-27 12:00:00','2022-02-27 11:00:00',0,5,1),(34,100000,'2022-02-17 16:21:55','2022-02-27 13:00:00','2022-02-27 12:00:00',0,5,1),(38,100000,'2022-02-17 16:24:44','2022-02-27 14:00:00','2022-02-27 13:00:00',0,5,1),(40,100000,'2022-02-17 16:24:55','2022-02-27 15:00:00','2022-02-27 14:00:00',0,5,1),(42,100000,'2022-02-17 16:28:05','2022-02-18 11:00:00','2022-02-18 10:00:00',0,5,1),(45,100000,'2022-02-18 05:28:59','2022-03-30 20:00:00','2022-03-30 19:00:00',0,6,1),(46,100000,'2022-02-18 06:06:12','2022-02-18 12:00:00','2022-02-18 11:00:00',0,5,1),(47,15000,'2022-02-18 07:35:20','2022-02-18 10:00:00','2022-02-18 09:00:00',0,6,6),(49,65000,'2022-02-18 07:56:07','2022-03-24 03:00:00','2022-03-24 02:00:00',0,7,9),(50,100000,'2022-02-18 07:56:45','2022-02-19 04:00:00','2022-02-19 03:00:00',0,10,1),(51,15000,'2022-02-18 07:59:53','2022-02-18 19:00:00','2022-02-18 18:00:00',0,13,7),(52,5000,'2022-02-18 09:46:10','2022-03-01 04:00:00','2022-03-01 03:00:00',0,6,8),(53,65000,'2022-02-18 09:48:56','2022-04-01 04:00:00','2022-04-01 03:00:00',0,6,9),(54,65000,'2022-02-18 09:49:01','2022-02-18 23:00:00','2022-02-18 22:00:00',0,5,9),(55,5000,'2022-02-18 10:12:25','2022-02-18 21:00:00','2022-02-18 20:00:00',0,6,8),(56,100000,'2022-02-18 10:39:54','2022-02-18 21:00:00','2022-02-18 20:00:00',0,16,1),(57,65000,'2022-02-18 10:49:17','2022-02-18 14:00:00','2022-02-18 13:00:00',0,18,9),(58,15000,'2022-02-18 10:49:47','2022-02-18 15:00:00','2022-02-18 14:00:00',0,18,7);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `rating` int DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `writer` bigint DEFAULT NULL,
  `portfolio` bigint DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `FK5v4o1yeqvnsmucwwvi61y6b8t` (`writer`),
  KEY `FK20rlji0k91en43xy3jidk490b` (`portfolio`),
  CONSTRAINT `FK20rlji0k91en43xy3jidk490b` FOREIGN KEY (`portfolio`) REFERENCES `portfolio` (`no`),
  CONSTRAINT `FK5v4o1yeqvnsmucwwvi61y6b8t` FOREIGN KEY (`writer`) REFERENCES `member` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'?????? ?????? ????????????!!!\n?????? ???????????????~~~','2022-02-18 06:13:53',5,'https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/9d61d041-41db-4e4a-8609-0f7788c1d37254cf5f3dcec281bde5aa3c81c6b14644.jpg',6,1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `style` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `portfolio` bigint DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `FK6efwn032qjiwil1le0e2pm77h` (`portfolio`),
  CONSTRAINT `FK6efwn032qjiwil1le0e2pm77h` FOREIGN KEY (`portfolio`) REFERENCES `portfolio` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES (1,'??? ?????????','2022-02-17 15:23:15','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/82a93831-2ad7-471a-b211-642fe189c026KakaoTalk_20220211_113330097_02.jpg',1),(2,'????????? ??????????????????.','2022-02-17 15:26:19','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/76d86e97-1992-4471-8206-4428f5b874c9KakaoTalk_20220206_192908861_22.jpg',1),(3,'?????? ????????? ?????????','2022-02-18 06:01:36','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/2c722f86-c098-4e1e-ad70-7dd4d083fc6f5bcfb3ccd93fedea4abba0da22ed75f3.jpg',5),(4,'????????? ?????????????????? ??????','2022-02-18 06:02:25','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/abfb93d7-2cd5-4d5c-94f5-be751f56d20aa6f0ebe6cd32c98564a398ef6a832f1c.jpg',5),(5,'?????? ????????? ??? ?????? ?????? ??????','2022-02-18 06:03:13','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/f36e108f-0ffc-456f-8738-ddd33399b44494d14b1cc727f20506914d252c941345.jpg',5),(6,'??????????????? ???????????? ??????','2022-02-18 06:04:10','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/ce477b8a-57de-4bc2-97d3-58419910b482b94e314e21747ceac7437ace4e89d4da.jpg',5),(7,'??????','2022-02-18 06:11:43','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/535821b3-5477-48e1-8426-bc83f1b451e4KakaoTalk_20220210_103240548_03.jpg',1),(8,'????????????','2022-02-18 06:15:21','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/845467b4-728c-4925-b28a-3ac6b29bd076KakaoTalk_20220210_103240548_08.jpg',1),(9,'???????????? ?????????!!','2022-02-18 06:15:53','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/1ef7206a-3b71-414d-b49c-6c571a44e565da17840c8cbebefb04ebb3e2898c4a54.jpg',5),(10,'?????????','2022-02-18 06:15:57','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/90a16c62-04ea-4ae9-9cb6-7ff655e056c1KakaoTalk_20220211_113330097.jpg',1),(11,'?????? ????????? ?????? ?????????','2022-02-18 06:16:30','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/9aa8642a-bc5e-4589-8876-ce1b108e2bba1234123412341234.jpg',5),(12,'?????? ????????? ???????','2022-02-18 06:17:12','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/e9fcd490-508e-4f3a-bf3e-d1b4fd00a128702aed101fb0794e38ff08f611408f1e.jpg',5),(13,'????????? ??????!','2022-02-18 06:23:21','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/a743d85b-46da-44e5-9f4e-0646d87bd032636ed7e2395242cebd2a32b8fd40c1b7.jpg',6),(14,'?????? ???????????? ?????? ??????','2022-02-18 06:24:08','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/505f76b0-1499-4be1-9e76-35706398fe93646112bd0b286a5e04867866ba998360.jpg',6),(15,'????????? ???????????? ?????? ???~','2022-02-18 06:24:36','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/4fc88ced-41f4-4fdb-b1e7-2a347d0db94ca2c7c22816f6c2d26061b3cfc59aee40.jpg',6),(16,'???????????? ??????','2022-02-18 06:25:10','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/7a7871a7-e1da-445e-abdc-2caa4d99caa0e62832ca112354d3f3839c5fb7622dd1.jpg',6),(17,'????????? ?????? ?????? ???','2022-02-18 06:25:49','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/579785ad-7b09-474d-bd50-06669698baa32d7b90bd27f9fd3066da2f601af4a4c6.jpg',6),(18,'???????????? ??????....','2022-02-18 06:35:54','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/d5eee8ff-1951-4a21-bb30-9488df38d020b0af25d3837cb7acc1183b8e143a4f72.jpg',7),(19,'????????? ????????? ???','2022-02-18 06:38:03','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/12ec0504-5bda-4802-afd1-a179b82e20afe4762b2c7e25174e8163c6e0a5c20a57.jpg',7),(20,'?????????~','2022-02-18 06:38:46','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/c4921406-9a44-4c20-8677-7699c7dde8f6f47c05db2e855d09608ebcdcae101c52.jpg',7),(21,'?????? ???????????? ?????????!','2022-02-18 06:40:18','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/9ea5e669-7d5a-4427-b0bb-7b8188c4c3ab2532323235235532523.jpg',7),(22,'??????!','2022-02-18 06:40:50','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/85b39459-93dd-4246-a6aa-57f074aac9c7c3ff55a797c04263d6a1f48e4b6c2fe1.jpg',7),(23,'?????????!','2022-02-18 06:48:01','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/1f2a1957-c97b-4d07-9f37-95de1649799a34343344334344.jpg',8),(24,'????????????','2022-02-18 06:48:29','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/eb0c8fdb-7bb7-4b79-b655-1641f39de04bd7a7887eb460ddbfbdab75c01cf1733e.jpg',8),(25,'???????????? ???','2022-02-18 06:49:09','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/55a3edce-a14d-496b-847b-61896177277a326c3b7b3daaa60e9e41a81ab8c1f62c.jpg',8),(26,'?????? ??????????????? ?????????~','2022-02-18 06:50:47','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/807e11c4-c67c-4eb2-9f76-8ba72897a154696b08e8015b1a7499dd05a3f10f3043.jpg',8),(27,'??????','2022-02-18 06:51:11','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/e0f7bf3f-65f8-4544-ac18-b7c9ff5babd4827eb2f9022fa0f9a4c6e8f349cfda34.jpg',8),(28,'??? ?????? ?????? ????????? ??? +2kg\n??????????????? ?????? ??????...\n\n??? ?????? ??????????????????, ????????? ????????????\n???????????????','2022-02-18 07:38:27','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/ef68d3e3-7051-4a87-84f7-393d574f31b220200324_013843.jpg',9),(29,'????????? ???????????? ?????? ??????\n???????????????\n\n\n????????? ????????? ???','2022-02-18 07:40:18','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/d863470e-9248-4398-b04f-e07037c97e9420200324_021615.jpg',9),(30,'???????????? ?????? ????????????.\n??????... ??????????????? ???????????? ??????????????????\n??????????????? ?????? ?????????????','2022-02-18 07:41:25','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/43784964-bb22-4113-b517-e0cfb730f7931546773747909.jpg',9),(31,'??? ?????? ??? ????????????\n22??????????','2022-02-18 07:43:59','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/b2ebb568-cc25-46f1-8d22-6e2816045997PicsPlay_1428604751659.jpg',9),(32,'????????? ?????????','2022-02-18 07:45:06','https://hongjunland.s3.ap-northeast-2.amazonaws.com/static/de019250-b553-4192-91e8-381cdfc587a8%EC%82%AC%EB%B3%B8_-N_0661_R2.jpg',9);
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style_comment`
--

DROP TABLE IF EXISTS `style_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `style_comment` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `writer` bigint NOT NULL,
  `style` bigint NOT NULL,
  PRIMARY KEY (`no`),
  KEY `FKe7xd0lr8gnqmsp7913s2j7984` (`writer`),
  KEY `FKlaijad062rudgwp3oqiscl06d` (`style`),
  CONSTRAINT `FKe7xd0lr8gnqmsp7913s2j7984` FOREIGN KEY (`writer`) REFERENCES `member` (`no`),
  CONSTRAINT `FKlaijad062rudgwp3oqiscl06d` FOREIGN KEY (`style`) REFERENCES `style` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style_comment`
--

LOCK TABLES `style_comment` WRITE;
/*!40000 ALTER TABLE `style_comment` DISABLE KEYS */;
INSERT INTO `style_comment` VALUES (1,'????????????','2022-02-17 16:34:01',5,2),(2,'?????????','2022-02-17 18:03:38',3,2),(3,'???????????????','2022-02-17 21:11:12',9,1),(4,' ??? ?????????','2022-02-17 21:49:03',6,2),(5,'?????? ?????????!','2022-02-17 22:07:12',7,1),(6,'?????? ????????? ????????????!','2022-02-18 07:31:06',16,27),(7,'????????? ??? ??????????','2022-02-18 07:31:10',16,27),(8,'?????? ????????? ????????????!!!','2022-02-18 10:12:02',6,17),(9,'????????? ?????????!!','2022-02-18 10:56:26',16,32);
/*!40000 ALTER TABLE `style_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) DEFAULT NULL,
  `style` bigint NOT NULL,
  PRIMARY KEY (`no`),
  KEY `FKgj7iirjq6l0tf4uscfgxr9q27` (`style`),
  CONSTRAINT `FKgj7iirjq6l0tf4uscfgxr9q27` FOREIGN KEY (`style`) REFERENCES `style` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'??????',1),(2,'?????????',1),(3,'????????????',2),(4,'??????',2),(5,'?????????',2),(6,'??????',3),(7,'??????',3),(8,'??????',3),(9,'??????',4),(10,'?????????',4),(11,'??????',4),(12,'?????????',4),(13,'???',5),(14,'??????',5),(15,'?????????',5),(16,'????????????',6),(17,'?????????',6),(18,'???',7),(19,'?????? ?????????',7),(20,'?????????',7),(21,'?????????',8),(22,'????????????',8),(23,'?????????',8),(24,'?????????',9),(25,'?????????',9),(26,'???',9),(27,'??????',10),(28,'?????????',10),(29,'??????',10),(30,'??????',10),(31,'?????????',11),(32,'?????????',11),(33,'?????????',11),(34,'?????????',12),(35,'??????',12),(36,'??????',12),(37,'?????????',13),(38,'??????',13),(39,'?????????',13),(40,'??????',14),(41,'??????',14),(42,'??????',15),(43,'??????',15),(44,'?????????',15),(45,'?????????',16),(46,'????????????',16),(47,'?????????',16),(48,'??????',16),(49,'?????????',17),(50,'??????',17),(51,'?????????',17),(52,'??????',18),(53,'??????',18),(54,'??????',18),(55,'?????????',19),(56,'??????',19),(57,'??????',20),(58,'?????????',20),(59,'?????????',21),(60,'??????',21),(61,'??????',22),(62,'??????',22),(63,'??????',22),(64,'???',22),(65,'?????? ',23),(66,'??????',23),(67,'??????',23),(68,'?????????',24),(69,'?????????',24),(70,'??????',24),(71,'?????????',24),(72,'?????????',25),(73,'??????',25),(74,'??????',25),(75,'??????',26),(76,'??????',27),(77,'??????',27),(78,'??????',27),(79,'??????',28),(80,'?????????',28),(81,'?????????',28),(82,'?????????',28),(83,'?????????',28),(84,'??????',28),(85,'??????',28),(86,'20???',28),(87,'?????????',28),(88,'??????',28),(89,'??????',28),(90,'????????????',28),(91,'??????',28),(92,'?????????',29),(93,'??????',29),(94,'??????',29),(95,'??????',29),(96,'?????????',29),(97,'??????',29),(98,'??????',29),(99,'??????',29),(100,'??????',29),(101,'?????????',29),(102,'??????',29),(103,'?????????',29),(104,'??????',30),(105,'?????????',30),(106,'??????',30),(107,'?????????',30),(108,'??????',30),(109,'??????',30),(110,'????????????',30),(111,'?????????',30),(112,'??????',30),(113,'??????',30),(114,'?????????',30),(115,'??????',30),(116,'??????',30),(117,'??????',30),(118,'20???',30),(119,'10???',30),(120,'30???',30),(121,'??????',31),(122,'??????',31),(123,'????????????',31),(124,'?????????',31),(125,'?????????',31),(126,'???',31),(127,'??????',31),(128,'????????????',31),(129,'??????????????????',31),(130,'??????',32),(131,'??????',32),(132,'?????????',32),(133,'?????????',32),(134,'??????',32),(135,'??????',32),(136,'?????????',32),(137,'????????????',32),(138,'20???',32),(139,'30???',32);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-18 11:27:32
