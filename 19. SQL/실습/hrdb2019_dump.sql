CREATE DATABASE  IF NOT EXISTS `hrdb2019` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hrdb2019`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: hrdb2019
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` char(3) NOT NULL,
  `dept_name` varchar(10) NOT NULL,
  `unit_id` char(1) DEFAULT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('ACC','회계','B','2015-04-01'),('ADV','홍보','C','2015-06-01'),('GEN','총무','B','2014-03-01'),('HRD','인사','B','2013-05-01'),('MKT','영업','C','2013-05-01'),('STG','전략기획',NULL,'2018-06-01'),('SYS','정보시스템','A','2013-01-01');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` char(5) NOT NULL,
  `emp_name` varchar(4) NOT NULL,
  `eng_name` varchar(20) DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `hire_date` date NOT NULL,
  `retire_date` date DEFAULT NULL,
  `dept_id` char(3) NOT NULL,
  `phone` char(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('S0001','홍길동','hong','M','2013-01-01',NULL,'SYS','010-1234-1234','hong@d-friends.co.kr',8500),('S0002','일지매','jiemae','M','2013-01-12',NULL,'GEN','017-111-1222','jimae@d-friends.co.kr',8200),('S0003','강우동',NULL,'M','2014-04-01',NULL,'SYS','010-1222-2221','woodong@d-friends.co.kr',6500),('S0004','김삼순','samsam','F','2014-08-01',NULL,'MKT','010-3212-3212','samsoon.kim@d-friends.co.kr',7000),('S0005','오삼식','three','M','2015-01-01','2017-01-31','MKT','010-9876-5432','samsik@d-friends.co.kr',6400),('S0006','김치국','kimchi','M','2015-03-01',NULL,'HRD','010-8765-8765','chikook@d-friends.co.kr',6000),('S0007','안경태',NULL,'M','2015-05-01',NULL,'ACC','017-543-3456','ahn@d-friends.co.kr',6000),('S0008','박여사','parks','F','2015-08-01','2016-09-30','HRD','010-2345-5432','yeosa@d-friends.co.kr',6300),('S0009','최사모','samoya','F','2015-10-01',NULL,'SYS','011-899-9988','samo@d-friends.co.kr',5800),('S0010','정효리',NULL,'F','2016-01-01',NULL,'MKT','010-9988-9900','hyori.jung@d-friends.co.kr',5000),('S0011','오감자','fivegamja','M','2016-02-01',NULL,'SYS','010-6655-7788','gamja@d-friends.co.kr',4700),('S0012','최일국','ilgook','M','2016-02-01',NULL,'GEN','010-8703-7123','ilkook@d-friends.co.kr',6500),('S0013','한국인','korea','M','2016-04-01',NULL,'SYS','010-6611-1266','hankook@d-friends.co.kr',4500),('S0014','이최고','first','M','2016-04-01',NULL,'MKT','010-2345-9886','one@d-friends.co.kr',5000),('S0015','박치기',NULL,'M','2016-06-01','2017-05-31','MKT','010-8800-0010','chichi@d-friends.co.kr',4700),('S0016','한사랑','onelove','F','2016-06-01',NULL,'HRD','010-3215-0987','love@d-friends.co.kr',7200),('S0017','나도야','nado','M','2017-12-01',NULL,'ACC','010-3399-9933','yaya@d-friends.co.kr',4000),('S0018','이리와',NULL,'M','2018-01-01','2018-06-30','HRD','010-5521-1252','comeon@d-friends.co.kr',5300),('S0019','정주고',NULL,'M','2018-01-01',NULL,'SYS','010-7777-2277','give@d-friends.co.kr',6000),('S0020','고소해','gogo','F','2018-04-01',NULL,'STG','010-9966-1230','haha@d-friends.co.kr',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `unit_id` char(1) NOT NULL,
  `unit_name` varchar(10) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES ('A','제1본부'),('B','제2본부'),('C','제3본부');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacation`
--

DROP TABLE IF EXISTS `vacation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacation` (
  `vacation_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` char(5) NOT NULL,
  `begin_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(50) NOT NULL DEFAULT '개인사유',
  `duration` int GENERATED ALWAYS AS (((to_days(`end_date`) - to_days(`begin_date`)) + 1)) VIRTUAL,
  PRIMARY KEY (`vacation_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `vacation_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `vacation_chk_1` CHECK ((`end_date` >= `begin_date`))
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacation`
--

LOCK TABLES `vacation` WRITE;
/*!40000 ALTER TABLE `vacation` DISABLE KEYS */;
INSERT INTO `vacation` (`vacation_id`, `emp_id`, `begin_date`, `end_date`, `reason`) VALUES (1,'S0001','2013-01-12','2013-01-12','감기몸살'),(2,'S0001','2013-03-21','2013-03-21','글쎄요'),(3,'S0001','2013-06-13','2013-06-14','글쎄요'),(4,'S0001','2013-07-07','2013-07-07','중요 행사 준비'),(5,'S0002','2013-07-21','2013-07-25','놀고싶어서'),(6,'S0001','2013-08-01','2013-08-01','치통이 심해서'),(7,'S0001','2013-08-03','2013-08-08','놀고싶어서'),(8,'S0002','2013-11-17','2013-11-17','두통'),(9,'S0001','2013-12-01','2013-12-15','비밀'),(10,'S0002','2014-02-10','2014-02-13','두통'),(11,'S0002','2014-04-19','2014-04-19','놀고싶어서'),(12,'S0002','2014-06-15','2014-06-18','데이트'),(13,'S0003','2014-09-17','2014-09-17','휴식이 필요'),(14,'S0003','2014-10-26','2014-10-26','중요 행사 준비'),(15,'S0001','2014-10-26','2014-10-29','치통이 심해서'),(16,'S0003','2015-01-18','2015-01-18','치통이 심해서'),(17,'S0005','2015-03-25','2015-03-29','이사'),(18,'S0006','2015-04-08','2015-04-08','궁금해하지 마세요'),(19,'S0005','2015-04-08','2015-04-17','휴식이 필요'),(20,'S0002','2015-04-15','2015-04-15','그냥'),(21,'S0007','2015-06-06','2015-06-06','비밀'),(22,'S0005','2015-06-06','2015-06-06','두통'),(23,'S0002','2015-06-06','2015-06-06','궁금해하지 마세요'),(24,'S0002','2015-06-28','2015-07-02','두통'),(25,'S0006','2015-06-28','2015-07-01','그냥'),(26,'S0005','2015-06-28','2015-07-01','아이가 가지 말래서'),(27,'S0007','2015-07-11','2015-07-11','비밀'),(28,'S0006','2015-07-15','2015-07-15','그냥'),(29,'S0006','2015-07-16','2015-07-25','병원진료'),(30,'S0003','2015-07-18','2015-07-18','가족행사'),(31,'S0001','2015-07-18','2015-07-29','개인사유'),(32,'S0003','2015-09-12','2015-09-16','배탈'),(33,'S0008','2015-09-12','2015-09-12','가족행사'),(34,'S0003','2015-10-08','2015-10-17','집안 청소'),(35,'S0001','2015-11-19','2015-11-19','슬퍼서'),(36,'S0008','2015-12-27','2015-12-27','그냥'),(37,'S0001','2016-01-20','2016-01-22','그냥'),(38,'S0007','2016-01-20','2016-01-20','머리가 지끈지끈'),(39,'S0001','2016-04-04','2016-04-07','피곤해서'),(40,'S0007','2016-04-04','2016-04-07','이사'),(41,'S0006','2016-04-04','2016-04-04','홈쇼핑'),(42,'S0011','2016-04-04','2016-04-08','머리가 지끈지끈'),(43,'S0008','2016-04-04','2016-04-08','너무 외로워서'),(44,'S0013','2016-05-09','2016-05-09','개인사유'),(45,'S0001','2016-05-09','2016-05-12','놀고싶어서'),(46,'S0012','2016-07-25','2016-07-25','그냥'),(47,'S0013','2016-07-25','2016-07-25','개인사유'),(48,'S0016','2016-07-25','2016-07-25','피곤해서'),(49,'S0008','2016-07-25','2016-07-25','병원진료'),(50,'S0001','2016-08-06','2016-08-07','치통이 심해서'),(51,'S0003','2016-08-28','2016-09-01','두통'),(52,'S0012','2016-08-28','2016-08-28','감기몸살'),(53,'S0002','2016-10-02','2016-10-03','글쎄요'),(54,'S0001','2016-10-02','2016-10-02','중요 행사 준비'),(55,'S0007','2016-10-02','2016-10-02','비밀'),(56,'S0016','2016-10-07','2016-10-07','개인사유'),(57,'S0001','2016-10-16','2016-10-17','배탈'),(58,'S0011','2016-10-16','2016-10-20','글쎄요'),(59,'S0007','2016-10-16','2016-10-20','치통이 심해서'),(60,'S0013','2016-10-16','2016-10-16','궁금해하지 마세요'),(61,'S0005','2016-10-16','2016-10-17','너무 외로워서'),(62,'S0016','2016-11-28','2016-11-28','집안 청소'),(63,'S0005','2016-12-02','2016-12-02','머리가 지끈지끈'),(64,'S0010','2016-12-26','2016-12-29','아이가 가지 말래서'),(65,'S0001','2016-12-26','2016-12-26','비밀'),(66,'S0012','2016-12-26','2016-12-29','중요 행사 준비'),(67,'S0001','2017-01-28','2017-01-28','가족행사'),(68,'S0010','2017-01-28','2017-01-28','머리가 지끈지끈'),(69,'S0012','2017-03-10','2017-03-10','두통'),(70,'S0001','2017-03-10','2017-03-11','가족행사'),(71,'S0012','2017-04-30','2017-04-30','두통'),(72,'S0007','2017-04-30','2017-04-30','집안 청소'),(73,'S0003','2017-05-08','2017-05-08','데이트'),(74,'S0007','2017-05-08','2017-05-08','배탈'),(75,'S0007','2017-07-14','2017-07-14','두통'),(76,'S0003','2017-07-14','2017-07-20','아이가 가지 말래서'),(77,'S0001','2017-08-06','2017-08-10','이사'),(78,'S0013','2017-08-12','2017-08-12','중요 행사 준비'),(79,'S0011','2017-08-12','2017-08-12','머리가 지끈지끈'),(80,'S0011','2017-11-03','2017-11-05','글쎄요'),(81,'S0002','2017-11-03','2017-11-03','너무 외로워서'),(82,'S0003','2017-11-18','2017-11-18','휴식이 필요'),(83,'S0010','2017-11-30','2017-12-01','놀고싶어서'),(84,'S0007','2018-02-03','2018-02-03','데이트'),(85,'S0011','2018-03-07','2018-03-11','궁금해하지 마세요'),(86,'S0016','2018-03-07','2018-03-07','글쎄요'),(87,'S0002','2018-03-07','2018-03-09','배탈'),(88,'S0017','2018-04-22','2018-04-22','이사'),(89,'S0002','2018-04-22','2018-04-26','집안 청소'),(90,'S0006','2018-04-25','2018-05-04','개인사유'),(91,'S0001','2018-05-05','2018-05-06','홈쇼핑'),(92,'S0002','2018-05-05','2018-05-06','아이가 가지 말래서'),(93,'S0017','2018-05-20','2018-05-23','집안 청소'),(94,'S0012','2018-05-30','2018-06-01','그냥'),(95,'S0019','2018-05-30','2018-06-03','집안 청소'),(96,'S0017','2018-06-03','2018-06-06','치통이 심해서'),(97,'S0012','2018-06-03','2018-06-06','집안 청소'),(98,'S0012','2018-07-18','2018-07-18','홈쇼핑'),(99,'S0007','2018-08-10','2018-08-10','글쎄요'),(100,'S0013','2018-08-10','2018-08-15','슬퍼서'),(101,'S0007','2018-08-17','2018-08-19','집안 청소'),(102,'S0019','2018-09-08','2018-09-08','너무 외로워서');
/*!40000 ALTER TABLE `vacation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hrdb2019'
--

--
-- Dumping routines for database 'hrdb2019'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-01 11:59:29
