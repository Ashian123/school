-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `audit_trail`
--

DROP TABLE IF EXISTS `audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_trail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `current_user` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `audited_time` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_agent` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_trail`
--

LOCK TABLES `audit_trail` WRITE;
/*!40000 ALTER TABLE `audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biometric_details`
--

DROP TABLE IF EXISTS `biometric_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biometric_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cand_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Filename` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `active_flag` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_modified_time` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cand_id_index` (`cand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biometric_details`
--

LOCK TABLES `biometric_details` WRITE;
/*!40000 ALTER TABLE `biometric_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `biometric_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_group`
--

DROP TABLE IF EXISTS `blood_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blood` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_group`
--

LOCK TABLES `blood_group` WRITE;
/*!40000 ALTER TABLE `blood_group` DISABLE KEYS */;
INSERT INTO `blood_group` VALUES (1,'A+'),(2,'B+'),(3,'AB+'),(4,'O+'),(5,'A-'),(6,'B-'),(7,'AB-'),(8,'O-');
/*!40000 ALTER TABLE `blood_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cand_admission_details`
--

DROP TABLE IF EXISTS `cand_admission_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cand_admission_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cand_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cand_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reg_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `course` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `course_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `initial` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `father_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mother_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dob` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile_no` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active_status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Yes',
  `last_modified_time` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cand_admission_details`
--

LOCK TABLES `cand_admission_details` WRITE;
/*!40000 ALTER TABLE `cand_admission_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cand_admission_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cand_marks_details`
--

DROP TABLE IF EXISTS `cand_marks_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cand_marks_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cand_id` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `marks` json DEFAULT NULL,
  `approved` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_modified_time` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cand_marks_details`
--

LOCK TABLES `cand_marks_details` WRITE;
/*!40000 ALTER TABLE `cand_marks_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `cand_marks_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_details`
--

DROP TABLE IF EXISTS `college_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `college_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `college_name` longtext,
  `college_place` varchar(250) DEFAULT NULL,
  `college_district` varchar(250) DEFAULT NULL,
  `college_state` varchar(250) DEFAULT NULL,
  `college_pin` varchar(100) DEFAULT NULL,
  `college_phone` varchar(250) DEFAULT NULL,
  `college_mail` varchar(250) DEFAULT NULL,
  `college_logo` longtext,
  `college_t_logo` longtext,
  `file_size` int DEFAULT NULL,
  `img_size` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_details`
--

LOCK TABLES `college_details` WRITE;
/*!40000 ALTER TABLE `college_details` DISABLE KEYS */;
INSERT INTO `college_details` VALUES (1,'ENGINEERING COLLEGE OF INSTITUTE','PAVOORCHATRAM','TENKASI','TAMIL NADU','627808','546434684',NULL,'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','download.png',0,0);
/*!40000 ALTER TABLE `college_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_details`
--

DROP TABLE IF EXISTS `community_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `community` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_details`
--

LOCK TABLES `community_details` WRITE;
/*!40000 ALTER TABLE `community_details` DISABLE KEYS */;
INSERT INTO `community_details` VALUES (1,'Scheduled Castes'),(2,'Scheduled Tribes'),(3,'Schedule Caste(Pc)'),(4,'Scheduled Castes Arundhathiar'),(5,'Scheduled Castes Arundhathiar(PC)'),(6,'Scheduled Tribes(PC)'),(7,'Most Backward Classes(PC)'),(8,'Denotified Communities(PC)'),(9,'Backward Classes(PC)'),(10,'Backward Classes Muslims(PC)'),(11,'Other Backward Classes'),(12,'Other Backward Classes(PC)'),(13,'Others'),(14,'Others(PC)'),(15,'Most Backward Classess'),(16,'Denotified Communities'),(17,'Backward Classes'),(18,'Backward Classes Muslims');
/*!40000 ALTER TABLE `community_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_details`
--

DROP TABLE IF EXISTS `course_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_title` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `course` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `teacher` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `t_design` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `all_teacher` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_details`
--

LOCK TABLES `course_details` WRITE;
/*!40000 ALTER TABLE `course_details` DISABLE KEYS */;
/* INSERT INTO `course_details` VALUES (19,'11','A','Vinayagam','[\"Vinayagam\", \"Ragavan\"]'); */
/*!40000 ALTER TABLE `course_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(450) DEFAULT NULL,
  `last_modified_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (3,'1_5_2022_14_43_20_18.jpg','Wed Jun 01 2022 14:45:11 GMT+0530 (India Standard Time)'),(4,'1_5_2022_14_47_49_17.jpg','Wed Jun 01 2022 14:49:08 GMT+0530 (India Standard Time)'),(5,'1_5_2022_14_56_57_16.jpg','Wed Jun 01 2022 15:02:09 GMT+0530 (India Standard Time)'),(6,'1_5_2022_15_8_35_15.jpg','Wed Jun 01 2022 15:09:37 GMT+0530 (India Standard Time)'),(7,'1_5_2022_15_8_35_14.jpg','Wed Jun 01 2022 15:09:52 GMT+0530 (India Standard Time)'),(8,'1_5_2022_15_8_35_13.jpg','Wed Jun 01 2022 15:10:00 GMT+0530 (India Standard Time)'),(9,'1_5_2022_15_8_35_12.jpg','Wed Jun 01 2022 15:10:07 GMT+0530 (India Standard Time)'),(10,'1_5_2022_15_8_35_11.jpg','Wed Jun 01 2022 15:10:14 GMT+0530 (India Standard Time)'),(11,'1_5_2022_15_8_35_10.jpg','Wed Jun 01 2022 15:10:20 GMT+0530 (India Standard Time)'),(12,'1_5_2022_15_8_35_9.jpg','Wed Jun 01 2022 15:10:27 GMT+0530 (India Standard Time)'),(13,'1_5_2022_15_8_35_8.jpg','Wed Jun 01 2022 15:10:35 GMT+0530 (India Standard Time)'),(14,'1_5_2022_15_13_13_7.jpg','Wed Jun 01 2022 15:25:25 GMT+0530 (India Standard Time)');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_details`
--

DROP TABLE IF EXISTS `state_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_details`
--

LOCK TABLES `state_details` WRITE;
/*!40000 ALTER TABLE `state_details` DISABLE KEYS */;
INSERT INTO `state_details` VALUES (1,'Andaman and Nicobar Islands'),(2,'Andhra Pradesh'),(3,'Arunachal Pradesh'),(4,'Assam'),(5,'Bihar'),(6,'Chandigarh'),(7,'Chhattisgarh'),(8,'Dadra and Nagar Haveli'),(9,'Daman and Diu'),(10,'Delhi'),(11,'Goa'),(12,'Gujarat'),(13,'Haryana'),(14,'Himachal Pradesh'),(15,'Jammu and Kashmir'),(16,'Jharkhand'),(17,'Karnataka'),(18,'Kenmore'),(19,'Kerala'),(20,'Lakshadweep'),(21,'Madhya Pradesh'),(22,'Maharashtra'),(23,'Manipur'),(24,'Meghalaya'),(25,'Mizoram'),(26,'Nagaland'),(27,'Narora'),(28,'Natwar'),(29,'Odisha'),(30,'Paschim Medinipur'),(31,'Puducherry'),(32,'Punjab'),(33,'Rajasthan'),(34,'Sikkim'),(35,'Tamil Nadu'),(36,'Telangana'),(37,'Tripura'),(39,'Uttar Pradesh'),(40,'Uttarakhand'),(42,'West Bengal'),(43,'Others');
/*!40000 ALTER TABLE `state_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_events`
--

DROP TABLE IF EXISTS `student_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_title` varchar(100) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `month` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `event_id` varchar(45) DEFAULT NULL,
  `events` json DEFAULT NULL,
  `last_modified_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_events`
--

LOCK TABLES `student_events` WRITE;
/*!40000 ALTER TABLE `student_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_material_file`
--

DROP TABLE IF EXISTS `student_material_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_material_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_id` varchar(450) DEFAULT NULL,
  `file_pdf` longtext,
  `last_modified_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_material_file`
--

LOCK TABLES `student_material_file` WRITE;
/*!40000 ALTER TABLE `student_material_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_material_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_materials`
--

DROP TABLE IF EXISTS `student_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_materials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_title` varchar(45) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `details` json DEFAULT NULL,
  `last_modified_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_materials`
--

LOCK TABLES `student_materials` WRITE;
/*!40000 ALTER TABLE `student_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_meeting`
--

DROP TABLE IF EXISTS `student_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_meeting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(100) DEFAULT NULL,
  `cand_id` varchar(100) DEFAULT NULL,
  `meeting_link` json DEFAULT NULL,
  `meeting_number` varchar(100) DEFAULT NULL,
  `last_modified_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_meeting`
--

LOCK TABLES `student_meeting` WRITE;
/*!40000 ALTER TABLE `student_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_menu`
--

DROP TABLE IF EXISTS `student_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `realMenu` varchar(100) DEFAULT NULL,
  `menu` varchar(450) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_menu`
--

LOCK TABLES `student_menu` WRITE;
/*!40000 ALTER TABLE `student_menu` DISABLE KEYS */;
INSERT INTO `student_menu` VALUES (1,'Calendar','student_calendar','Enabled'),(2,'Marks','student_marks','Enabled'),(3,'Fees','student_fees','Enabled'),(4,'Fees Receipt','student_receipt','Enabled'),(5,'Time-Table','student_timeTable','Enabled'),(6,'Materials','student_materials','Enabled'),(7,'Virtual Classes','student_vr_class','Enabled'),(8,'Attendance','student_attendance','Enabled');
/*!40000 ALTER TABLE `student_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_time_table`
--

DROP TABLE IF EXISTS `student_time_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_time_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_title` varchar(45) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `semester` varchar(45) DEFAULT NULL,
  `table_struct` json DEFAULT NULL,
  `table_values` json DEFAULT NULL,
  `last_modified_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_time_table`
--

LOCK TABLES `student_time_table` WRITE;
/*!40000 ALTER TABLE `student_time_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_time_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Tamil'),(2,'English'),(3,'Mathematics'),(4,'Physics'),(5,'Chemistry');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_details`
--

DROP TABLE IF EXISTS `teacher_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cand_id` varchar(100) DEFAULT NULL,
  `cand_name` varchar(100) DEFAULT NULL,
  `initial` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `address` varchar(450) DEFAULT NULL,
  `photo` longtext,
  `last_modified_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_details`
--

LOCK TABLES `teacher_details` WRITE;
/*!40000 ALTER TABLE `teacher_details` DISABLE KEYS */;
INSERT INTO `teacher_details` VALUES (6,'VINA610739','Vinayagam','Mr','987654321','vinayak@gmail.com','Tamil','BE','tirunelveli','http://localhost:8000/admin/TeacherDetails','8/6/2022, 1:55:45 pm'),(7,'RAGA129430','Ragavan','Mr','987654321','ragav@gmail.com','Tamil','BE','tirunelveli','http://localhost:8000/admin/TeacherDetails','8/6/2022, 1:56:39 pm');
/*!40000 ALTER TABLE `teacher_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_type` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_modified_time` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `_index` (`user_id`(100),`password`(100))
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (6,'admin','admin','Admin','D0814A21F099110104AF0B67867C30D6',NULL,'03/25/2021 19:08:13'),(229,'VINA610739','Vinayagam','Staff','17F501748D48F6E209D7F12C4C7EFEC1','vinayak@gmail.com','8/6/2022, 1:55:45 pm'),(230,'RAGA129430','Ragavan','Staff','17F501748D48F6E209D7F12C4C7EFEC1','ragav@gmail.com','8/6/2022, 1:56:39 pm');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;

INSERT INTO `user_details` (`id`, `user_id`, `name`, `user_type`, `password`, `email_id`, `last_modified_time`) VALUES (NULL, 'sadmin', 'sadmin', 'SAdmin', 'D0814A21F099110104AF0B67867C30D6', NULL, '03/25/2021 19:08:13');

INSERT INTO `user_details` (`id`, `user_id`, `name`, `user_type`, `password`, `email_id`, `last_modified_time`) VALUES (NULL, 'ITadmin', 'ITadmin', 'ITadmin', 'D0814A21F099110104AF0B67867C30D6', NULL, '03/25/2021 19:08:13');

UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-08 15:51:42
ALTER TABLE `college_details` ADD `alert_settings` INT NOT NULL AFTER `img_size`;
