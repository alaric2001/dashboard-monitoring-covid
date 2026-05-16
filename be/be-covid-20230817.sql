-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: localhost    Database: be-covid
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialization` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Dougie Sapena','Male','2021-12-06','20266 Reindahl Terrace','591-133-2124','Oxybenzone, Octinoxate, Petrolatum','2023-08-09 16:55:38','2023-08-09 16:55:38'),(2,'Fernandina Caulier','Female','2020-06-18','9 Charing Cross Road','670-156-0747','PENTOXIFYLLINE','2023-08-09 16:55:38','2023-08-09 16:55:38'),(3,'Jodi Naerup','Male','2021-05-01','49229 Sachtjen Place','141-246-5703','Calcium carbonate','2023-08-09 16:55:38','2023-08-09 16:55:38'),(4,'Doria Bedberry','Female','2021-11-25','85 John Wall Avenue','797-500-7746','Psyllium Dietary Fiber Supplement','2023-08-09 16:55:38','2023-08-09 16:55:38'),(5,'Donnell Havock','Male','2020-10-24','31 Waubesa Center','823-229-7172','Johnson Grass','2023-08-09 16:55:38','2023-08-09 16:55:38'),(6,'Abel Windebank','Male','2023-07-26','3 Mccormick Drive','804-474-2108','Atenolol','2023-08-09 16:55:38','2023-08-09 16:55:38'),(7,'Carlin Cuxon','Female','2020-10-30','379 Twin Pines Circle','261-401-8604','Dextroamphetamine Saccharate, Amphetamine Aspartate, Dextroamphetamine Sulfate, and Amphetamine Sulfate','2023-08-09 16:55:38','2023-08-09 16:55:38'),(8,'Ollie Stangroom','Female','2023-07-18','83 Waxwing Point','229-191-9120','Glycopyrrolate','2023-08-09 16:55:38','2023-08-09 16:55:38'),(9,'Edi Bart','Female','2020-06-22','82 Karstens Lane','478-752-1371','DROSERA, ARNICA MONTANA, BRYONIA, CETRARIA ISLANDICA, BELLADONNA, COCCUS CACTI, STANNUM METALLICUM, CHAMOMILLA, COFFEA CRUDA','2023-08-09 16:55:38','2023-08-09 16:55:38'),(10,'Jesselyn Kynvin','Female','2023-02-01','1919 Tennyson Road','299-670-5222','Levofloxacin','2023-08-09 16:55:38','2023-08-09 16:55:38');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ews`
--

DROP TABLE IF EXISTS `ews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_check` int(11) NOT NULL DEFAULT 0,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ews_patient_id_foreign` (`patient_id`),
  CONSTRAINT `ews_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ews`
--

LOCK TABLES `ews` WRITE;
/*!40000 ALTER TABLE `ews` DISABLE KEYS */;
/*!40000 ALTER TABLE `ews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heart_rate`
--

DROP TABLE IF EXISTS `heart_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heart_rate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `heart_beats` int(11) NOT NULL,
  `patient_check` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `heart_rate_patient_id_foreign` (`patient_id`),
  CONSTRAINT `heart_rate_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heart_rate`
--

LOCK TABLES `heart_rate` WRITE;
/*!40000 ALTER TABLE `heart_rate` DISABLE KEYS */;
INSERT INTO `heart_rate` VALUES (1,1,69,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(2,2,131,0,'2023-08-09 14:22:14','2023-08-09 15:54:32'),(3,3,65,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(4,4,63,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(5,5,103,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(6,6,102,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(7,7,56,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(8,8,103,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(9,9,130,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(10,10,97,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(11,11,102,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(12,12,113,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(13,13,64,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(14,14,81,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(15,15,55,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(16,16,126,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(17,17,39,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(18,18,102,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(19,19,98,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(20,20,48,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(21,21,138,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(22,22,84,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(23,23,112,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(24,24,54,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(25,25,62,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(26,26,92,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(27,27,73,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(28,28,89,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(29,29,103,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(30,30,78,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(31,31,113,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(32,32,115,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(33,33,54,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(34,34,137,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(35,35,126,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(36,36,124,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(37,37,114,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(38,38,63,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(39,39,120,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(40,40,48,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(41,41,31,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(42,42,124,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(43,43,63,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(44,44,73,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(45,45,53,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(46,46,75,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(47,47,110,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(48,48,111,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(49,49,82,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(50,50,107,0,'2023-08-09 14:22:14','2023-08-09 14:22:14'),(51,1,84,0,'2023-08-10 05:45:52','2023-08-10 05:45:52'),(52,1,80,0,'2023-08-10 05:45:52','2023-08-10 05:45:52'),(53,1,84,0,'2023-08-10 05:46:48','2023-08-10 05:46:48'),(54,1,80,0,'2023-08-10 05:46:48','2023-08-10 05:46:48'),(55,1,81,0,'2023-08-10 05:46:48','2023-08-10 05:46:48'),(56,1,89,0,'2023-08-10 05:46:48','2023-08-10 05:46:48'),(57,1,86,0,'2023-08-10 05:46:48','2023-08-10 05:46:48'),(58,1,83,0,'2023-08-10 05:46:48','2023-08-10 05:46:48'),(59,1,55,0,'2023-08-10 05:47:19','2023-08-10 05:47:19'),(60,1,20,0,'2023-08-10 05:47:33','2023-08-10 05:47:33'),(61,1,80,0,'2023-08-10 05:48:02','2023-08-10 05:48:02'),(62,1,70,0,'2023-08-11 01:36:57','2023-08-11 01:36:57'),(63,1,65,0,'2023-08-11 01:37:28','2023-08-11 01:37:28'),(64,35,80,0,'2023-08-11 13:16:25','2023-08-11 13:16:25'),(65,41,99,0,'2023-08-11 13:16:34','2023-08-11 13:16:34'),(66,42,91,0,'2023-08-11 13:16:48','2023-08-11 13:16:48'),(67,41,78,0,'2023-08-11 13:17:02','2023-08-11 13:17:02'),(68,1,55,0,'2023-08-16 13:42:06','2023-08-16 13:42:06'),(69,1,75,0,'2023-08-16 13:42:15','2023-08-16 13:42:15'),(70,1,60,0,'2023-08-16 13:42:30','2023-08-16 13:42:30');
/*!40000 ALTER TABLE `heart_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labs`
--

DROP TABLE IF EXISTS `labs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lab_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` bigint(20) unsigned NOT NULL,
  `test_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sample_collection_date` date DEFAULT NULL,
  `dispatch_to_lab_date` date DEFAULT NULL,
  `sample_received_date` date DEFAULT NULL,
  `processed_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `labs_patient_id_foreign` (`patient_id`),
  CONSTRAINT `labs_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labs`
--

LOCK TABLES `labs` WRITE;
/*!40000 ALTER TABLE `labs` DISABLE KEYS */;
/*!40000 ALTER TABLE `labs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicines` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `patient_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medicines_patient_id_foreign` (`patient_id`),
  CONSTRAINT `medicines_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_06_12_122641_create_permission_table',1),(6,'2023_06_17_120912_create_roles_table',1),(7,'2023_06_21_101051_create_table_permission_roles',1),(8,'2023_08_02_221859_create_patients_table',1),(9,'2023_08_03_012336_create_patient_examinations_table',1),(10,'2023_08_03_134358_create_respiration_rate_table',1),(11,'2023_08_03_151501_create_heart_rate_table',1),(12,'2023_08_03_154524_create_spo2_table',1),(13,'2023_08_03_160347_create_temperature_table',1),(14,'2023_08_03_162649_create_nibp_table',1),(15,'2023_08_04_042635_create_labs_table',1),(16,'2023_08_04_061529_create_doctors_table',1),(17,'2023_08_04_061908_create_radiologies_table',1),(18,'2023_08_04_063610_create_nurses_table',1),(19,'2023_08_04_065658_create_medicines_table',1),(20,'2023_08_04_080318_create_wards_table',1),(21,'2023_08_04_080419_create_rooms_table',1),(22,'2023_08_09_021554_create_ews_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nibp`
--

DROP TABLE IF EXISTS `nibp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nibp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `systolic` int(11) NOT NULL,
  `diastolic` int(11) NOT NULL,
  `patient_check` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nibp_patient_id_foreign` (`patient_id`),
  CONSTRAINT `nibp_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nibp`
--

LOCK TABLES `nibp` WRITE;
/*!40000 ALTER TABLE `nibp` DISABLE KEYS */;
INSERT INTO `nibp` VALUES (1,1,108,61,1,'2023-08-09 14:28:20','2023-08-16 09:24:58'),(2,2,108,52,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(3,3,136,67,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(4,4,103,58,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(5,5,130,62,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(6,6,125,65,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(7,7,134,52,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(8,8,97,66,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(9,9,136,55,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(10,10,106,50,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(11,11,118,56,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(12,12,106,70,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(13,13,118,57,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(14,14,132,68,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(15,15,111,59,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(16,16,120,54,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(17,17,147,50,0,'2023-08-09 14:28:20','2023-08-10 03:34:21'),(18,18,91,54,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(19,19,147,67,0,'2023-08-09 14:28:20','2023-08-10 03:38:46'),(20,20,148,52,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(21,21,133,70,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(22,22,129,61,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(23,23,118,61,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(24,24,127,69,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(25,25,123,67,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(26,26,106,62,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(27,27,136,60,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(28,28,119,69,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(29,29,147,57,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(30,30,118,67,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(31,31,126,66,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(32,32,90,64,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(33,33,130,56,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(34,34,137,55,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(35,35,122,58,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(36,36,122,63,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(37,37,146,57,0,'2023-08-09 14:28:20','2023-08-10 03:39:32'),(38,38,94,54,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(39,39,106,50,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(40,40,118,56,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(41,41,136,67,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(42,42,126,59,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(43,43,138,67,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(44,44,143,60,1,'2023-08-09 14:28:20','2023-08-09 15:00:47'),(45,45,106,66,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(46,46,124,66,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(47,47,130,55,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(48,48,111,60,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(49,49,116,50,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(50,50,93,56,0,'2023-08-09 14:28:20','2023-08-09 14:28:20'),(51,1,119,79,0,'2023-08-10 03:51:03','2023-08-10 03:51:03'),(52,1,115,70,0,'2023-08-10 03:51:18','2023-08-10 03:51:18'),(53,1,108,80,0,'2023-08-10 03:52:47','2023-08-10 03:52:47'),(54,1,100,50,0,'2023-08-10 04:21:27','2023-08-10 04:21:27'),(55,1,140,70,0,'2023-08-10 04:21:39','2023-08-10 04:21:39'),(56,1,120,60,0,'2023-08-10 04:21:53','2023-08-10 04:21:53'),(57,1,110,66,0,'2023-08-10 04:22:00','2023-08-10 04:22:00'),(58,1,100,70,0,'2023-08-10 17:39:25','2023-08-10 17:39:25'),(59,38,120,70,0,'2023-08-16 12:42:11','2023-08-16 12:42:11'),(60,8,120,70,0,'2023-08-16 13:21:10','2023-08-16 13:21:10');
/*!40000 ALTER TABLE `nibp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_examinations`
--

DROP TABLE IF EXISTS `patient_examinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_examinations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `weight` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `blood` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_id` bigint(20) unsigned NOT NULL,
  `covid_case` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_examinations_patient_id_foreign` (`patient_id`),
  CONSTRAINT `patient_examinations_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_examinations`
--

LOCK TABLES `patient_examinations` WRITE;
/*!40000 ALTER TABLE `patient_examinations` DISABLE KEYS */;
INSERT INTO `patient_examinations` VALUES (1,64,181,'A-','Aspernatur dolore ducimus aut ut. Sit sed iusto voluptatem nesciunt fugiat. Dolorum et laboriosam magni fuga quos.',2,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(2,81,177,'A-','Magnam labore et commodi odit. Natus omnis autem nulla quaerat quia quam error. Officiis facere aut dignissimos corporis voluptate ullam quos.',22,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(3,91,160,'O+','Qui dolores aliquid repellat a perferendis autem. Ut labore eaque rerum debitis magni cupiditate eum rem. Soluta repellat ad error repellendus placeat velit.',13,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(4,98,183,'O-','Quis consequatur enim occaecati dolorem sit et. Magnam numquam dolores enim. Nihil dolorem animi tempore quo quae.',9,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(5,93,172,'AB-','Ratione ut laboriosam vero. Repellendus adipisci fugit voluptate beatae non quia molestias. Rem repudiandae occaecati sit dolorem excepturi sit. Et voluptates ut consequatur molestiae qui.',32,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(6,58,193,'A-','Dolor iste ullam ut magnam ducimus voluptates. Laborum non id ad nihil nihil nisi. Quia consequatur dolor tempora et adipisci. Harum minima tempore natus saepe ea et et. Suscipit sunt ducimus earum.',12,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(7,89,143,'B+','Sint vitae laudantium perspiciatis eos. Qui at suscipit aut qui. In odio porro ipsam vero incidunt.',33,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(8,40,145,'A-','Perspiciatis laborum corporis inventore et. Et recusandae voluptatem id et autem consequatur. Sequi autem illo ea non quam est vitae possimus.',26,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(9,72,163,'AB+','Maxime possimus quisquam hic suscipit rerum eum ut. Quis quod pariatur delectus doloremque delectus incidunt architecto. Officia cum sed similique et.',41,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(10,68,158,'AB+','Tenetur optio odio autem doloremque commodi ipsa. Sed neque occaecati optio dolorem excepturi. Qui sed ut nam dolorum necessitatibus reiciendis. Quia itaque accusantium modi id itaque.',15,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(11,78,177,'AB-','Fugiat quae neque dicta voluptas iure ut vero repellat. Eum amet ratione id expedita placeat. Expedita sint velit quod doloribus sint. Suscipit dolorem nemo sunt veniam dignissimos dignissimos.',34,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(12,75,160,'AB+','Quam soluta quibusdam ab ipsam. Ea et blanditiis eos id est amet sit. Sit blanditiis distinctio provident voluptatum quidem eius consequatur. Quo natus at id blanditiis modi tempora repellat.',35,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(13,59,195,'B-','Ea ut eligendi quia commodi et. Tenetur voluptas nobis iusto sit. Eligendi doloribus ab non et inventore explicabo. Omnis ea at repellat adipisci rerum.',40,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(14,73,188,'O+','Qui error sed odio ipsa ducimus. Labore porro consequuntur ut. Quaerat aperiam perferendis consectetur soluta animi.',26,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(15,112,192,'A-','Ut et earum omnis nihil tempore odit est. Nihil voluptatibus iusto doloremque error laudantium. Quo et ut quia accusamus illum odit quod. Quaerat dolorum expedita voluptas odio.',33,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(16,83,140,'B-','Et amet ut qui nostrum. Aut velit libero aut accusantium in dicta doloremque. Quaerat vel sit aperiam consequatur rerum commodi.',40,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(17,107,193,'B-','Suscipit quo dolores vitae voluptate quis inventore aliquid. Deserunt id in dolorem occaecati vero.',45,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(18,103,192,'A-','Aut molestiae maxime quis praesentium et consequatur. Consectetur in nostrum harum blanditiis. Inventore at deserunt sit est sed et.',39,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(19,49,160,'A-','Veniam in repudiandae sit quisquam nemo aut illo sunt. Officiis ipsam et illo et libero. Architecto dolores aut commodi eius. Voluptatem ea ut necessitatibus cupiditate natus culpa dolor.',20,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(20,73,172,'O+','Omnis consectetur labore eius assumenda quam iure ut molestiae. Id aut aperiam totam nam perspiciatis. Cum recusandae molestiae est nam similique et adipisci.',18,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(21,100,150,'A+','Sint ipsa similique inventore. Accusantium iste deleniti consectetur consequatur. Iure dolorem in tempora rem nam. Quis voluptatibus et rem sed.',2,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(22,68,193,'B+','Dolor rem aut ducimus atque vel dolor. Soluta facere voluptatem sequi et accusantium dolores maiores. Et accusamus dolores enim quidem.',12,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(23,48,167,'AB-','Quae assumenda rem quasi occaecati quae qui. Aut non sapiente minima at atque. Harum id dolor ut cumque.',50,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(24,109,148,'A-','Vel qui maxime est sit id et dolores. Ut blanditiis fugit eum qui. Distinctio accusamus est ipsum veniam sapiente molestias.',3,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(25,96,149,'O+','Totam nisi aperiam et. Et nisi sit fugit explicabo. Doloribus molestiae cupiditate non eius odit. Doloremque soluta at non placeat quae quia.',50,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(26,40,174,'AB-','Unde omnis animi laboriosam enim est delectus dicta est. Occaecati quia veritatis vero repellat dolorem quam. Doloribus totam et quas nam dolorem in suscipit.',7,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(27,108,140,'A-','Et atque provident at reiciendis ea. Ratione ipsam labore non eveniet. Et ex beatae odio error eveniet dolore. Quia consectetur quia placeat exercitationem.',22,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(28,95,195,'O+','Sapiente cupiditate incidunt reiciendis nulla voluptate ipsa. Ipsa et nam et minima. Sed id enim et eum expedita. Quaerat adipisci tenetur recusandae delectus nam.',48,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(29,50,158,'O+','Id a reprehenderit laboriosam sit eum necessitatibus id. Velit et minima animi.',32,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(30,90,142,'AB+','In repudiandae iusto itaque necessitatibus asperiores. Rerum et est ut dolores reiciendis eligendi animi necessitatibus. Et explicabo voluptas ut nostrum at ut.',7,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(31,42,176,'B+','Sint dolorum maiores in placeat. Officiis amet assumenda voluptatum et ipsa quas. Atque eum saepe voluptatem et recusandae placeat. Ea quasi totam accusantium consequatur rerum ut.',2,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(32,99,173,'A+','Inventore nemo numquam libero et distinctio labore. Assumenda saepe ut et perferendis optio id. Velit eveniet fugiat vel cumque aperiam ut.',38,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(33,57,183,'O+','Officiis est sed sit iusto quae vel. Et quidem id consectetur aut inventore est sapiente autem. Id repudiandae neque voluptatum pariatur numquam esse omnis.',43,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(34,40,198,'O-','Quisquam porro eum vitae cum nemo. Inventore eum quaerat iure consequuntur sint. Dolorum eos perferendis aliquam consequatur id ex.',4,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(35,71,167,'A+','Ut dolores dolor repellat magnam ipsam cupiditate molestiae. Nam aperiam ea provident voluptates accusantium. Dolore placeat nesciunt quam iusto. Rerum id dolor cumque culpa voluptas quo.',46,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(36,97,166,'AB-','Est ut sunt eos. Ut nemo nostrum dolore veritatis et est. Ut repellat deleniti in aut consequatur. Eum quam beatae sunt deserunt earum atque voluptatem.',38,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(37,67,156,'A+','Ea quis ab non laudantium quia rerum eos. Nam sit fuga aut et nihil blanditiis. Quis fugiat placeat amet aperiam. Assumenda dolorem dolorem ut dolor consectetur aliquid.',24,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(38,82,164,'AB-','Delectus at veritatis dolores eveniet aut eum distinctio. Eos nihil aut ut alias aperiam. Cupiditate rerum ut sequi perspiciatis fuga.',19,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(39,64,177,'AB-','Ab perspiciatis et qui et facere iste excepturi reiciendis. Recusandae quia ipsa id rerum qui. Sed dolores iste beatae. Non consequatur quasi omnis repellat non ut repudiandae.',18,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(40,97,146,'B+','Quisquam ea aut magnam et reiciendis. Est aut atque in. Dolorum nobis quo consequatur consequuntur alias id. Ipsum aut omnis veritatis.',44,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(41,69,189,'O+','Nam corrupti et dolorem quos. Repudiandae et ipsum est veniam. Magnam dolorem voluptatem corporis voluptatibus in labore neque.',11,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(42,59,172,'O-','Dicta perferendis consequuntur velit voluptatibus est in beatae. Voluptatibus dolorem esse quia facilis perspiciatis. Similique ipsam veniam laudantium beatae a corporis qui.',10,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(43,91,143,'A-','Aut quae est natus ratione. Nihil soluta delectus vero ipsa culpa. Quod excepturi et explicabo est modi itaque.',31,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(44,101,142,'B-','Nam qui et enim reiciendis veritatis ratione. Iure et similique ex voluptatibus corporis sed dignissimos laborum. Ullam blanditiis est qui in ut ipsa in. Dolore voluptatum eos ea voluptatibus magnam.',33,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(45,104,186,'B-','Et tenetur asperiores est ut autem omnis earum. Vel cupiditate amet aliquid possimus provident inventore. Non dignissimos sint id omnis impedit id beatae.',31,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(46,69,191,'O-','Rerum dicta quae repellendus excepturi. Cum dolorem velit fuga. Pariatur in et amet qui non ut id magni. Qui esse in excepturi cum sit nisi.',42,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(47,58,192,'AB-','Veritatis ipsum quidem necessitatibus iusto illo nihil. Molestiae magnam rem quae voluptas. Quia odit repellendus minima.',9,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(48,53,184,'O+','Qui ipsum et cumque nulla ut. Quaerat quo est architecto nemo doloremque voluptatem voluptas. Omnis et rerum dolorum et consequatur voluptas. Quam rerum est itaque id aut deleniti perferendis.',33,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(49,64,175,'A+','Sint odit sit perferendis dolor totam. Quia unde temporibus quidem qui impedit. Non consequatur quo nihil nobis ut. Non non eos dolores ex aperiam asperiores.',27,1,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(50,98,143,'A-','Ad culpa et mollitia aut adipisci nemo possimus. Amet id nesciunt neque quia aperiam qui esse est. Sint voluptatem iusto doloribus saepe. Nulla rerum quisquam quam provident quos.',45,0,'2023-08-09 14:07:04','2023-08-09 14:07:04'),(51,34,100,'quam','ultrices',1,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(52,56,230,'in','parturient montes nascetur ridiculus mus vivamus vestibulum',2,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(53,180,114,'porttitor','massa volutpat convallis',3,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(54,44,116,'rutrum','mattis nibh ligula nec',4,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(55,44,116,'est','dui vel nisl duis',5,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(56,82,187,'amet','sapien ut',6,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(57,70,280,'tortor','platea dictumst morbi vestibulum velit id',7,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(58,140,224,'ultrices','massa tempor convallis nulla',8,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(59,51,265,'integer','sociis natoque penatibus et magnis',9,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(60,88,247,'nulla','quam pharetra magna ac',10,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(61,58,213,'viverra','morbi vel lectus in quam',11,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(62,78,212,'vestibulum','lorem ipsum dolor sit amet consectetuer',12,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(63,50,273,'at','dolor morbi vel lectus in quam',13,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(64,193,282,'consequat','venenatis turpis enim blandit',14,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(65,156,143,'molestie','eleifend quam a odio in hac habitasse',15,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(66,158,250,'in','non pretium quis lectus suspendisse',16,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(67,32,189,'maecenas','magna',17,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(68,102,194,'felis','rutrum at lorem integer tincidunt ante',18,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(69,30,110,'faucibus','aliquet',19,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(70,46,244,'ridiculus','consequat dui nec nisi volutpat eleifend donec',20,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(71,180,214,'faucibus','vel',21,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(72,154,101,'vivamus','quis orci nullam molestie nibh in',22,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(73,164,175,'posuere','mauris morbi non lectus aliquam sit amet',23,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(74,97,121,'amet','vel enim sit',24,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(75,76,164,'nulla','nisi at nibh in hac habitasse',25,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(76,48,232,'ut','mattis pulvinar nulla pede ullamcorper augue a',26,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(77,80,149,'adipiscing','purus phasellus in felis donec',27,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(78,111,185,'nulla','vel dapibus at',28,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(79,87,200,'phasellus','auctor gravida',29,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(80,164,295,'augue','erat fermentum justo nec',30,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(81,63,118,'proin','urna pretium nisl ut',31,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(82,90,279,'augue','a pede posuere nonummy integer non',32,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(83,46,155,'suspendisse','sapien sapien non mi integer ac neque',33,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(84,124,237,'molestie','nascetur ridiculus mus etiam vel',34,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(85,181,135,'laoreet','porttitor pede justo eu massa',35,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(86,184,271,'amet','pharetra magna vestibulum',36,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(87,135,132,'bibendum','adipiscing molestie',37,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(88,176,276,'erat','primis in faucibus orci luctus',38,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(89,145,228,'accumsan','nullam molestie nibh in lectus',39,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(90,33,240,'iaculis','montes',40,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(91,57,224,'ac','erat nulla tempus vivamus in felis',41,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(92,86,228,'pellentesque','in est risus auctor',42,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(93,113,261,'sed','rutrum at lorem',43,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(94,182,266,'suspendisse','ligula nec sem duis',44,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(95,189,248,'ut','est congue',45,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(96,78,109,'tempor','semper',46,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(97,86,198,'ipsum','et ultrices',47,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(98,64,294,'luctus','mattis pulvinar',48,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(99,71,272,'id','neque',49,1,'2023-08-09 14:15:02','2023-08-09 14:15:02'),(100,145,250,'sagittis','sed justo pellentesque viverra pede ac',50,1,'2023-08-09 14:15:02','2023-08-09 14:15:02');
/*!40000 ALTER TABLE `patient_examinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admission_date` date NOT NULL,
  `discharge_date` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` date DEFAULT NULL,
  `id_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referred` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_of_kin_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relationship` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_of_kin_address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_of_kin_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Cruz Schaefer V','2013-07-06','2015-12-10','Female','1992-08-05','4631257320394187','2706 Karolann Ford Suite 315\nBenjaminhaven, PA 81363','1-989-629-0210','University','Medical Secretary','https://via.placeholder.com/200x200.png/009955?text=people+libero','Hospital A','Mrs. Herta Cronin III','Spouse','34257 Lonny Stream\nNorth Glen, KS 84427-0740','731-313-7145','2023-08-09 14:07:04','2023-08-09 14:07:04'),(2,'Shea Terry','1995-06-22','2013-02-03','Female','2020-10-10','9089846053118881','4150 Bayer Skyway\nSouth Allisonmouth, NJ 50349-6894','+1-208-296-5769','Master','Railroad Conductors','https://via.placeholder.com/200x200.png/002200?text=people+rerum','Hospital B','Emmitt Medhurst DDS','Child','45595 McCullough Pike Suite 663\nPort Rocioside, MI 04016-3994','(305) 950-4564','2023-08-09 14:07:04','2023-08-09 14:07:04'),(3,'Dr. Lottie Schiller','1976-01-06','1970-06-24','Male','1972-06-12','8523969510093702','4509 Osinski Harbor Apt. 858\nWest Maxie, AL 50729-0938','(980) 614-0191','High School','Legal Secretary','https://via.placeholder.com/200x200.png/0011dd?text=people+consectetur','Hospital C','Dr. Eli Kerluke II','Sibling','6025 Christiansen Village Apt. 026\nWillaside, SC 96581-3615','763.827.2734','2023-08-09 14:07:04','2023-08-09 14:07:04'),(4,'Amelia Marks','1994-06-23','1983-03-29','Female','1986-10-14','4031811937801027','8740 Greenholt View Suite 543\nJohnstontown, MN 77786','+14583954622','Master','Dental Laboratory Technician','https://via.placeholder.com/200x200.png/00ee88?text=people+ut','Hospital B','Hilton Harber','Sibling','546 Hayes Summit\nNorth Mathildechester, FL 29061','603.794.9382','2023-08-09 14:07:04','2023-08-09 14:07:04'),(5,'Miguel Pfeffer','2015-03-22','2010-07-28','Male','2011-12-03','3797938808123032','65680 Ocie Place Apt. 509\nKihnberg, NY 44567','202-533-0253','College','Claims Examiner','https://via.placeholder.com/200x200.png/00ee33?text=people+aspernatur','Hospital C','Magdalena Weber','Sibling','51452 Cydney Harbors Suite 372\nRennerhaven, UT 07027-1669','+14434169240','2023-08-09 14:07:04','2023-08-09 14:07:04'),(6,'Freeda Pfeffer','1974-05-05','2015-10-26','Male','1982-08-27','7716589561242590','4465 Abdul Trail Suite 300\nRodriguezbury, MN 79507','1-706-240-8542','Master','Portable Power Tool Repairer','https://via.placeholder.com/200x200.png/004444?text=people+sint','Hospital A','Frank O\'Kon','Spouse','78499 Boyle Points\nSouth Mario, UT 53370','207-539-0170','2023-08-09 14:07:04','2023-08-09 14:07:04'),(7,'Colleen Schmitt','1986-06-16','1998-10-21','Female','1987-07-09','2046949056211773','30248 Brendan Lake Suite 652\nWalterville, GA 83758-7024','+1-214-932-3374','High School','Pile-Driver Operator','https://via.placeholder.com/200x200.png/007777?text=people+asperiores','Hospital A','Prof. Zetta Windler','Spouse','93254 Hal Garden\nHoegerborough, PA 84871-8626','+1-818-363-6181','2023-08-09 14:07:04','2023-08-09 14:07:04'),(8,'Dr. Alvena Jerde V','1981-05-01','1984-05-24','Female','2012-08-05','1702832224910424','68201 Abby Underpass\nWest Jeffereyborough, UT 74982','+1.240.959.0884','University','Paste-Up Worker','https://via.placeholder.com/200x200.png/0000cc?text=people+maiores','Hospital B','Marjolaine Bogan','Sibling','338 Purdy Turnpike\nSchoenfort, NM 63197','(281) 935-9852','2023-08-09 14:07:04','2023-08-09 14:07:04'),(9,'Miss Gladys Douglas','1984-05-14','1996-08-18','Male','1982-06-09','3942185304408635','26194 Beier Via Suite 320\nLake Eulahmouth, LA 18514','+1 (346) 208-7142','College','Infantry','https://via.placeholder.com/200x200.png/006655?text=people+omnis','Hospital C','Titus Watsica','Other','1231 Hollie Islands Suite 258\nWest Tianna, MN 37362','+1.801.522.6146','2023-08-09 14:07:04','2023-08-09 14:07:04'),(10,'Ruben Daugherty','2021-07-01','2021-02-12','Male','1987-11-16','5893426193695695','457 Nico Square\nWalshview, NM 96351-6396','+1-865-303-7961','University','Fire-Prevention Engineer','https://via.placeholder.com/200x200.png/008888?text=people+facere','Hospital A','Reginald Harvey II','Spouse','50913 Mueller Walks Suite 480\nNorth Michalefurt, ME 20995-1452','+1 (386) 537-5187','2023-08-09 14:07:04','2023-08-09 14:07:04'),(11,'Jannie Dietrich','1987-03-18','2002-12-14','Female','2014-12-19','3312967922661427','476 Walsh Neck\nKaylinhaven, SD 69752-7265','+1 (682) 337-2381','High School','Administrative Law Judge','https://via.placeholder.com/200x200.png/005511?text=people+quo','Hospital C','Mr. Trevion Ortiz','Spouse','566 Patsy Square Apt. 692\nLake Novella, ND 88724','+1-563-442-1406','2023-08-09 14:07:04','2023-08-09 14:07:04'),(12,'Werner Tromp','2009-09-22','1976-07-12','Female','1973-08-17','7910915293320335','56254 Giovanny Mills Apt. 209\nJoeland, NY 79263','1-808-328-2721','Master','TSA','https://via.placeholder.com/200x200.png/005555?text=people+eveniet','Hospital A','Claude Jones','Child','8343 Wyman Shoal Suite 269\nLake Savanna, MI 76897-5687','(260) 570-1404','2023-08-09 14:07:04','2023-08-09 14:07:04'),(13,'Dovie Greenholt II','1994-10-10','2021-07-24','Female','2013-02-23','8692585777950748','768 Jedediah Hill Suite 151\nNorth Alessandroton, PA 69136-6659','(432) 825-8680','High School','Welder','https://via.placeholder.com/200x200.png/00bbbb?text=people+est','Hospital B','Jeramy Kling','Child','80120 Pete Freeway Apt. 308\nNew Margaritamouth, MN 03678-4111','407.603.7352','2023-08-09 14:07:04','2023-08-09 14:07:04'),(14,'Carlos Willms DDS','1980-09-12','1997-01-22','Male','2022-11-16','5302073793380987','8464 Klocko Roads\nKristoferfort, DC 90720-4073','443.270.9520','University','Maintenance Worker','https://via.placeholder.com/200x200.png/008855?text=people+eligendi','Hospital B','Consuelo Walsh','Other','19063 Emory Valley\nEast Archibald, SD 80025-3903','520.382.0471','2023-08-09 14:07:04','2023-08-09 14:07:04'),(15,'Fannie Roberts','1982-08-01','2013-02-20','Female','1989-05-04','2127311625693602','671 Will Grove Suite 349\nNorth Melany, KY 32056-6115','+17652151344','University','Tractor Operator','https://via.placeholder.com/200x200.png/0099aa?text=people+sunt','Hospital A','Dr. Reynold Flatley II','Child','70861 Miller Rue Suite 200\nWest Priscillamouth, LA 91495-8025','1-657-895-8562','2023-08-09 14:07:04','2023-08-09 14:07:04'),(16,'Tamara Kshlerin DDS','1998-07-28','2022-06-13','Female','2021-03-20','8810277437149114','76903 Kameron Trail Apt. 357\nWest Jorgeville, MA 47596','1-503-574-4345','Master','Security Guard','https://via.placeholder.com/200x200.png/003388?text=people+corporis','Hospital A','Kristian Grimes','Other','176 Olin Estate Suite 654\nLake Norbertoville, ME 73827','(574) 817-1580','2023-08-09 14:07:04','2023-08-09 14:07:04'),(17,'Prof. Monte Rolfson','2014-01-24','2008-11-24','Female','2011-01-16','6556824873770191','418 Rahsaan Mills Suite 117\nWymanmouth, MD 31981','(364) 805-6319','Master','Sociologist','https://via.placeholder.com/200x200.png/0066ee?text=people+quae','Hospital C','Kenya Wilderman Jr.','Other','3405 Victoria Trafficway Suite 501\nLindgrenburgh, UT 83812','+1-210-917-7062','2023-08-09 14:07:04','2023-08-09 14:07:04'),(18,'Prof. Rocky Herman DVM','2003-11-02','1995-11-06','Male','2010-11-15','8420210122709014','805 Enola Island\nWest Williamview, NC 48152-7335','+1 (775) 383-3691','University','Broadcast News Analyst','https://via.placeholder.com/200x200.png/00cc00?text=people+illo','Hospital B','Mr. Santiago Auer','Sibling','66682 Brad Avenue\nAddisonhaven, KS 00678','276-826-0179','2023-08-09 14:07:04','2023-08-09 14:07:04'),(19,'Clark Mertz','2001-02-24','1973-12-05','Female','2004-10-07','1883805176447320','6957 Thelma Manor\nLake Bryana, DE 16986-2667','+1.269.562.1930','Master','Insurance Sales Agent','https://via.placeholder.com/200x200.png/002233?text=people+aut','Hospital C','Reginald Stracke','Parent','6807 Farrell Crossing\nTurnertown, IA 82072-1224','930.415.1616','2023-08-09 14:07:04','2023-08-09 14:07:04'),(20,'Efren Schmidt','1991-03-30','2018-09-12','Male','2014-06-07','8405114960366089','8515 Fay Terrace Suite 520\nWhitechester, OK 90084-0225','+1.470.245.2016','University','Aircraft Assembler','https://via.placeholder.com/200x200.png/00ccaa?text=people+autem','Hospital A','Melba Mayer','Spouse','835 Gleichner Mills\nElliotchester, SC 86019','680.651.7916','2023-08-09 14:07:04','2023-08-09 14:07:04'),(21,'Leilani Reilly','1999-04-30','1980-09-10','Male','2018-10-27','1757818792078975','16544 Shaina Roads Suite 201\nEast Frederick, OR 76669','678.744.0849','High School','Umpire and Referee','https://via.placeholder.com/200x200.png/007733?text=people+ea','Hospital A','Micaela King','Sibling','958 Goodwin Terrace\nAbbigailshire, VA 33070','(571) 434-8900','2023-08-09 14:07:04','2023-08-09 14:07:04'),(22,'Morton Paucek','1970-09-22','2016-02-29','Male','2010-01-16','7307131227543859','8441 Hamill Route Apt. 944\nAntoniaborough, AZ 34614-9201','+1-541-699-9389','Master','Computer Operator','https://via.placeholder.com/200x200.png/00ddee?text=people+sunt','Hospital B','Dusty Koch MD','Parent','2440 Dare Brooks\nWest Wilberview, IN 84390-8655','+1 (938) 966-2412','2023-08-09 14:07:04','2023-08-09 14:07:04'),(23,'Prof. Cole Becker Sr.','1995-12-05','1970-01-04','Male','1983-11-20','3969996566272936','1526 Nader Viaduct\nWest Reinholdland, WI 45178','774-822-1426','High School','Private Sector Executive','https://via.placeholder.com/200x200.png/0099bb?text=people+reiciendis','Hospital B','Monique Lesch Jr.','Sibling','513 Georgiana Cape Apt. 363\nCormierview, NH 83538','1-854-777-6470','2023-08-09 14:07:04','2023-08-09 14:07:04'),(24,'Coby Lockman','2010-05-22','1988-01-22','Female','2016-09-24','4205664646899737','17625 Carroll Ports Apt. 693\nAndresmouth, AR 17279-0554','+1.231.595.9157','University','Structural Iron and Steel Worker','https://via.placeholder.com/200x200.png/00dd44?text=people+dolorem','Hospital A','Miss Mozelle Ortiz DDS','Child','53487 Funk Crescent\nRevafurt, MA 38893-2554','+1.423.804.7336','2023-08-09 14:07:04','2023-08-09 14:07:04'),(25,'Matilda Parker','1994-12-22','1991-10-05','Female','1975-03-21','9893872238469215','3978 Harold Freeway\nJeremyshire, ME 89385-0265','(682) 514-4206','Master','Motor Vehicle Inspector','https://via.placeholder.com/200x200.png/004499?text=people+laudantium','Hospital B','Mr. Madyson Emmerich DDS','Other','44602 Pfeffer Meadows Suite 435\nWest Maximillianport, SD 74734-8312','(872) 233-7394','2023-08-09 14:07:04','2023-08-09 14:07:04'),(26,'Mrs. Ludie Koepp V','2019-10-26','2021-04-12','Male','2010-01-11','9574793873279511','49864 Kade Divide\nNew Daren, AZ 76270','+1.402.917.5093','College','Craft Artist','https://via.placeholder.com/200x200.png/00dd33?text=people+provident','Hospital C','Percy Hudson','Other','668 Pacocha Spring\nLake Johannberg, NE 69868-4535','+1-845-776-4558','2023-08-09 14:07:04','2023-08-09 14:07:04'),(27,'Prof. Lowell Von II','2013-11-12','1988-01-10','Female','2007-11-25','9930100871224028','39139 Hermiston Common\nLabadiestad, WV 63941-5702','323-828-0356','Master','Human Resources Specialist','https://via.placeholder.com/200x200.png/007777?text=people+laudantium','Hospital C','Rosina Mann','Other','4588 Cormier Burgs\nLake Joelhaven, WA 02205','+1-541-938-6911','2023-08-09 14:07:04','2023-08-09 14:07:04'),(28,'Jarred Kozey','1998-03-15','1995-11-27','Female','2004-02-17','7967696721901233','842 Abbie Springs Suite 909\nSouth Talontown, AL 74334-6719','(540) 685-0747','High School','Sound Engineering Technician','https://via.placeholder.com/200x200.png/00bb44?text=people+quae','Hospital B','Charlie Wilderman','Sibling','3306 Bianka Tunnel\nKemmerville, MN 92049-4795','832.551.3100','2023-08-09 14:07:04','2023-08-09 14:07:04'),(29,'Adelia Monahan III','2016-05-28','2009-09-22','Female','2000-09-11','6846683513695796','3061 Pfannerstill Burg Apt. 448\nWest Freeda, OR 20378','646-226-7987','Master','Legal Support Worker','https://via.placeholder.com/200x200.png/00ee33?text=people+minus','Hospital C','Dr. Leanne Reilly MD','Child','2451 Mary Creek\nLake Dejon, GA 00388','+1-513-688-7810','2023-08-09 14:07:04','2023-08-09 14:07:04'),(30,'Prof. Dock Ritchie','2012-03-06','2016-10-08','Male','2015-02-19','9813757953227417','809 Christ Road\nHaagmouth, NV 45755','(539) 963-3454','High School','Precision Etcher and Engraver','https://via.placeholder.com/200x200.png/0044ff?text=people+repudiandae','Hospital A','Mrs. Lydia Kuhn I','Sibling','20405 Kristin Mills\nPort Imaniville, WV 47431-5134','+1.985.239.4696','2023-08-09 14:07:04','2023-08-09 14:07:04'),(31,'Alejandrin Bradtke','1995-11-12','2011-04-21','Female','1971-08-26','7089358907836106','7051 Cecelia Forest Suite 103\nWeberhaven, FL 06686','1-539-707-9604','College','Administrative Services Manager','https://via.placeholder.com/200x200.png/00ddee?text=people+nemo','Hospital B','Kelton Mante','Spouse','735 Hirthe Lights\nLake Montana, CO 53475-4718','+1 (585) 232-0715','2023-08-09 14:07:04','2023-08-09 14:07:04'),(32,'Olen Torp','1985-11-17','2015-09-30','Male','2023-01-24','4999391948558371','23001 Rahsaan Forges Suite 666\nRueckerborough, ID 67109-5439','786-696-6401','Master','Office and Administrative Support Worker','https://via.placeholder.com/200x200.png/0000ff?text=people+est','Hospital A','Antonina Wiza','Sibling','296 Bergstrom Oval Suite 429\nMarcellabury, CO 05000-4387','+1-248-996-1231','2023-08-09 14:07:04','2023-08-09 14:07:04'),(33,'Meaghan Thompson','2014-09-10','1976-03-25','Male','1991-03-11','3416147576828297','667 Fritsch Squares Suite 012\nNorth Darylton, AK 50750','360-451-3397','College','Command Control Center Specialist','https://via.placeholder.com/200x200.png/000099?text=people+non','Hospital A','Dr. Tommie Marvin MD','Spouse','847 Berry Mews\nEast Uriah, AR 64884','862-799-4992','2023-08-09 14:07:04','2023-08-09 14:07:04'),(34,'Dr. Logan Mills MD','2001-05-25','1978-04-07','Male','1983-11-19','5392871882038932','3069 Kendall Views\nNew Keanu, NY 81210-4922','+1-986-512-1067','College','Grounds Maintenance Worker','https://via.placeholder.com/200x200.png/00bb00?text=people+in','Hospital C','Leslie Pollich','Spouse','3654 Kamryn Branch Apt. 087\nNew Karl, MS 92114','725.519.6616','2023-08-09 14:07:04','2023-08-09 14:07:04'),(35,'Eden Champlin','2002-07-09','2009-04-01','Male','2005-09-13','8845466441926586','9249 Moen Harbor Suite 306\nStrosinville, CT 79321','+1-680-917-1137','High School','Pastry Chef','https://via.placeholder.com/200x200.png/0077cc?text=people+expedita','Hospital B','Mara Rohan','Parent','495 Collin Tunnel\nLake Zitamouth, WI 40508-7008','+1.630.444.9095','2023-08-09 14:07:04','2023-08-09 14:07:04'),(36,'Prof. Lolita Rice','2014-01-02','2018-12-14','Male','2011-12-04','4013845818894423','943 Ashlee Inlet\nStrackebury, IN 13577-9120','(631) 441-5768','College','Paralegal','https://via.placeholder.com/200x200.png/00cccc?text=people+voluptates','Hospital B','Laron Bosco','Child','37606 Brionna View Apt. 074\nBorerfort, ME 57651-4482','802-244-2069','2023-08-09 14:07:04','2023-08-09 14:07:04'),(37,'Daisy Smitham','2011-01-16','2012-09-03','Female','1988-05-04','8769014746705390','3957 Berge Camp Suite 267\nMaryborough, AZ 06772','+1-984-968-4362','Master','Immigration Inspector OR Customs Inspector','https://via.placeholder.com/200x200.png/008877?text=people+eveniet','Hospital B','Katrine Rempel','Child','5242 Leuschke Keys\nEast Markus, UT 19258','+1.307.574.3862','2023-08-09 14:07:04','2023-08-09 14:07:04'),(38,'Dr. Javier Tillman','2005-03-11','1997-12-03','Male','2017-06-26','4226530634748584','1432 Alysa Dale Suite 717\nWest Arlie, ID 53184-8996','+1.507.554.7570','Master','Food Cooking Machine Operators','https://via.placeholder.com/200x200.png/009922?text=people+ea','Hospital A','Lydia Turner','Spouse','12979 Candida Plain Suite 949\nCaleton, OR 42650-5541','984.874.8022','2023-08-09 14:07:04','2023-08-09 14:07:04'),(39,'Rosa Rosenbaum Jr.','1992-11-19','2007-11-19','Male','1998-11-19','6277614056173508','23667 Hamill Flats Apt. 664\nNorth Leanneburgh, GA 93626-1627','+1-517-304-8535','College','Curator','https://via.placeholder.com/200x200.png/006633?text=people+et','Hospital A','Rhoda Monahan','Child','3671 Baumbach Centers\nLake Lottieland, MT 37126-9430','838.248.6881','2023-08-09 14:07:04','2023-08-09 14:07:04'),(40,'Annette Nitzsche III','2018-02-02','1980-08-29','Female','2012-11-29','9249380615079857','8871 Wunsch Freeway\nLake Citlallishire, LA 12711','+1-479-798-5162','High School','Insulation Worker','https://via.placeholder.com/200x200.png/00eebb?text=people+animi','Hospital B','Michaela Gerhold','Parent','614 Rolfson Valleys Suite 391\nPort Harveystad, MT 38925-9160','+1-334-801-8580','2023-08-09 14:07:04','2023-08-09 14:07:04'),(41,'Prof. Gladyce Jakubowski','1990-05-20','2019-07-26','Male','2005-08-07','0164952162437386','2131 Alvena Curve Suite 180\nLake Winnifred, TX 74970-0686','+17319912559','High School','Cashier','https://via.placeholder.com/200x200.png/00dd11?text=people+ipsam','Hospital C','Diamond Kessler','Parent','486 Bernhard Fields\nEast Calliebury, MN 50804','+1-570-895-6165','2023-08-09 14:07:04','2023-08-09 14:07:04'),(42,'Garret Brakus','2014-10-01','2013-12-24','Male','1971-04-05','8057524912142246','315 Beer Groves Suite 143\nSouth Perry, NE 96341','+1-463-285-3002','University','Auditor','https://via.placeholder.com/200x200.png/00aa33?text=people+eos','Hospital A','Trinity Padberg','Child','3135 Candida Square\nLake Zackfort, MA 14096','+1.551.922.4606','2023-08-09 14:07:04','2023-08-09 14:07:04'),(43,'Hermann Hauck','1976-09-29','1990-03-17','Male','2000-10-10','5055601914167756','69461 Jessica Street\nSwaniawskiton, HI 57964','(337) 994-3354','University','Pesticide Sprayer','https://via.placeholder.com/200x200.png/0099aa?text=people+placeat','Hospital B','Norwood Walker','Sibling','722 O\'Hara Springs\nEast Arlieberg, LA 59378','631-774-0812','2023-08-09 14:07:04','2023-08-09 14:07:04'),(44,'Declan Collier I','1980-11-02','2022-02-26','Male','2006-05-27','7368466545285311','39530 Rosella Island Apt. 051\nWymanmouth, NJ 87454','+1-779-231-7432','Master','Engraver','https://via.placeholder.com/200x200.png/004477?text=people+vitae','Hospital B','Mr. Joseph Witting III','Spouse','145 Kulas Alley\nSouth Kanefurt, LA 02822','470-465-7492','2023-08-09 14:07:04','2023-08-09 14:07:04'),(45,'Mr. Deon Funk Sr.','1971-10-12','1973-01-26','Female','1995-06-06','1351052677158210','702 Cora Place\nWittington, MS 14346','215.214.3762','Master','Coaches and Scout','https://via.placeholder.com/200x200.png/0055bb?text=people+consequatur','Hospital A','Ruby Labadie','Other','436 Kariane Ports\nNorth Jadeview, MD 32055','+1-254-858-3377','2023-08-09 14:07:04','2023-08-09 14:07:04'),(46,'Chasity Altenwerth','1983-05-09','2000-11-02','Male','2006-01-10','1721457605927627','5893 Fadel Islands\nSunnyview, WI 19741-0660','+1-719-699-0062','Master','Statistician','https://via.placeholder.com/200x200.png/002222?text=people+aut','Hospital B','Mr. Will Gutmann II','Spouse','1754 Paolo Course Suite 990\nWolfffurt, GA 13269-0561','+1-430-547-6191','2023-08-09 14:07:04','2023-08-09 14:07:04'),(47,'Baron Heidenreich V','2015-12-11','1970-04-19','Male','2020-07-04','8443062367756547','6680 Turcotte Dam\nDanielachester, WV 46349-0501','1-351-814-9183','High School','Industrial-Organizational Psychologist','https://via.placeholder.com/200x200.png/003300?text=people+autem','Hospital A','Prof. Lenny Stark','Spouse','112 Kessler Hollow\nLoweton, IN 51751-2340','+1.435.473.0487','2023-08-09 14:07:04','2023-08-09 14:07:04'),(48,'Francesca Boyle','1978-07-15','1982-12-20','Female','1981-06-29','5912518848036199','24587 Bobby Via Apt. 731\nEast Elenora, PA 28902-2045','+1-951-348-4659','Master','Jeweler','https://via.placeholder.com/200x200.png/004488?text=people+rem','Hospital A','Chelsie Schoen','Child','9358 Blick Greens Apt. 098\nStreichstad, UT 15180-3595','+1-915-842-8700','2023-08-09 14:07:04','2023-08-09 14:07:04'),(49,'Karson Mills','1973-02-06','1994-10-31','Male','1994-12-08','3336767706188691','9176 Ricky Isle\nNorth Houston, WI 06061-5702','(475) 660-6678','High School','Photoengraver','https://via.placeholder.com/200x200.png/00ccbb?text=people+voluptas','Hospital B','Schuyler Abshire Jr.','Other','54570 Eryn Flat\nEast Briahaven, KS 47873-1775','352-460-6577','2023-08-09 14:07:04','2023-08-09 14:07:04'),(50,'Maximus Runte','1994-10-18','2019-03-29','Female','2003-09-22','0680557122482783','482 Russel Rue\nEast Tyrel, VT 54791-7602','+1 (330) 429-0669','High School','Fishing OR Forestry Supervisor','https://via.placeholder.com/200x200.png/008855?text=people+officia','Hospital A','Hank Schultz','Other','490 Cormier Key\nGreenholtfurt, CT 44060','(786) 480-3879','2023-08-09 14:07:04','2023-08-09 14:07:04');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'master','2023-08-09 14:07:02','2023-08-09 14:07:02'),(2,'ipd_management','2023-08-09 14:07:02','2023-08-09 14:07:02');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'auth-token','a7ed484d0168d6c7e988e16199e4ac09bc8f0e234f0c10dfc62d361cde849ff2','[\"*\"]',NULL,'2023-08-17 03:33:08','2023-08-10 03:33:08','2023-08-10 03:33:08');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radiologies`
--

DROP TABLE IF EXISTS `radiologies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radiologies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `radiology_exam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved_date` date DEFAULT NULL,
  `processed_date` date DEFAULT NULL,
  `result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `radiologies_patient_id_foreign` (`patient_id`),
  KEY `radiologies_doctor_id_foreign` (`doctor_id`),
  CONSTRAINT `radiologies_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radiologies_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radiologies`
--

LOCK TABLES `radiologies` WRITE;
/*!40000 ALTER TABLE `radiologies` DISABLE KEYS */;
/*!40000 ALTER TABLE `radiologies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respiration_rate`
--

DROP TABLE IF EXISTS `respiration_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respiration_rate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `breaths` int(11) NOT NULL,
  `patient_check` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `respiration_rate_patient_id_foreign` (`patient_id`),
  CONSTRAINT `respiration_rate_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respiration_rate`
--

LOCK TABLES `respiration_rate` WRITE;
/*!40000 ALTER TABLE `respiration_rate` DISABLE KEYS */;
INSERT INTO `respiration_rate` VALUES (1,1,6,0,'2023-08-09 14:20:22','2023-08-09 15:56:28'),(2,2,6,1,'2023-08-09 14:20:22','2023-08-09 15:58:36'),(3,3,39,1,'2023-08-09 14:20:22','2023-08-09 15:28:23'),(4,4,37,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(5,5,30,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(6,6,31,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(7,7,17,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(8,8,6,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(9,9,13,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(10,10,6,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(11,11,4,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(12,12,27,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(13,13,31,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(14,14,10,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(15,15,39,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(16,16,39,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(17,17,39,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(18,18,2,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(19,19,22,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(20,20,36,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(21,21,6,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(22,22,14,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(23,23,12,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(24,24,9,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(25,25,6,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(26,26,23,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(27,27,21,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(28,28,27,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(29,29,28,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(30,30,1,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(31,31,4,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(32,32,34,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(33,33,10,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(34,34,29,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(35,35,13,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(36,36,18,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(37,37,13,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(38,38,18,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(39,39,33,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(40,40,39,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(41,41,33,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(42,42,36,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(43,43,40,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(44,44,6,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(45,45,38,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(46,46,15,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(47,47,19,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(48,48,12,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(49,49,2,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(50,50,10,0,'2023-08-09 14:20:22','2023-08-09 14:20:22'),(51,1,24,0,'2023-08-10 05:50:02','2023-08-10 05:50:02'),(52,1,15,0,'2023-08-10 05:50:39','2023-08-10 05:50:39'),(53,1,18,0,'2023-08-10 05:50:52','2023-08-10 05:50:52'),(54,1,25,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(55,2,16,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(56,3,16,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(57,4,26,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(58,5,27,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(59,6,16,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(60,7,26,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(61,8,16,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(62,9,19,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(63,10,19,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(64,11,17,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(65,12,24,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(66,13,24,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(67,14,16,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(68,15,21,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(69,16,18,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(70,17,17,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(71,18,25,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(72,19,18,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(73,20,22,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(74,21,26,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(75,22,23,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(76,23,20,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(77,24,28,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(78,25,30,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(79,26,24,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(80,27,28,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(81,28,24,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(82,29,23,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(83,30,30,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(84,31,24,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(85,32,21,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(86,33,16,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(87,34,15,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(88,35,28,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(89,36,22,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(90,37,23,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(91,38,16,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(92,39,15,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(93,40,22,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(94,41,23,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(95,42,19,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(96,43,25,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(97,44,17,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(98,45,15,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(99,46,23,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(100,47,22,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(101,48,16,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(102,49,29,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(103,50,29,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(104,1,27,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(105,1,25,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(106,1,20,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(107,1,21,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(108,1,27,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(109,1,25,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(110,1,28,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(111,1,30,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(112,1,27,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(113,1,25,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(114,1,20,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(115,1,29,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(116,1,27,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(117,1,28,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(118,1,20,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(119,1,30,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(120,1,27,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(121,1,25,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(122,1,20,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(123,1,30,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(124,1,27,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(125,1,25,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(126,1,24,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(127,1,23,0,'2023-08-10 05:51:02','2023-08-10 05:51:02'),(128,1,23,0,'2023-08-10 05:51:03','2023-08-10 05:51:03'),(129,1,5,0,'2023-08-10 05:51:45','2023-08-10 05:51:45'),(130,1,45,0,'2023-08-10 05:52:56','2023-08-10 05:52:56'),(131,1,14,0,'2023-08-10 05:53:20','2023-08-10 05:53:20'),(132,2,60,0,'2023-08-10 05:54:16','2023-08-10 05:54:16'),(133,1,60,0,'2023-08-16 11:55:03','2023-08-16 11:55:03'),(134,37,15,0,'2023-08-16 12:40:50','2023-08-16 12:40:50'),(135,22,15,0,'2023-08-16 12:43:03','2023-08-16 12:43:03'),(136,5,15,0,'2023-08-16 12:44:22','2023-08-16 12:44:22'),(137,4,15,0,'2023-08-16 12:45:26','2023-08-16 12:45:26'),(138,7,15,0,'2023-08-16 13:20:28','2023-08-16 13:20:28'),(139,1,20,0,'2023-08-16 13:40:16','2023-08-16 13:40:16'),(140,1,25,0,'2023-08-16 13:41:11','2023-08-16 13:41:11'),(141,1,17,0,'2023-08-16 13:41:23','2023-08-16 13:41:23');
/*!40000 ALTER TABLE `respiration_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,2,2,NULL,NULL);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','2023-08-09 14:07:01','2023-08-09 14:07:01'),(2,'Rumah Sakit','2023-08-09 14:07:01','2023-08-09 14:07:01');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` bigint(20) unsigned DEFAULT NULL,
  `ward_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rooms_patient_id_foreign` (`patient_id`),
  KEY `rooms_ward_id_foreign` (`ward_id`),
  CONSTRAINT `rooms_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE SET NULL,
  CONSTRAINT `rooms_ward_id_foreign` FOREIGN KEY (`ward_id`) REFERENCES `wards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'AU-QLD',2,9,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(2,'GT-PE',3,6,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(3,'US-IA',7,9,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(4,'PK-PB',NULL,5,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(5,'BR-SC',5,4,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(6,'MV-05',6,3,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(7,'MY-02',4,6,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(8,'GH-WP',8,7,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(9,'PS-RFH',9,2,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(10,'IR-27',10,10,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(11,'PE-JUN',11,4,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(12,'GL-U-A',12,6,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(13,'AU-WA',13,10,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(14,'TJ-RR',14,10,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(15,'TC-GT',15,3,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(16,'IS-3',16,2,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(17,'PG-MBA',17,3,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(18,'US-ID',18,1,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(19,'CA-ON',19,4,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(20,'AU-QLD',20,10,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(21,'SR-SI',21,10,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(22,'TH-23',22,8,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(23,'GB-SCT',23,9,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(24,'RU-SAK',24,9,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(25,'NA-KU',25,9,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(26,'VN-33',26,3,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(27,'BW-CE',27,1,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(28,'ID-KU',28,1,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(29,'US-CA',29,6,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(30,'US-IA',30,9,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(31,'FR-N',31,4,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(32,'US-AZ',32,5,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(33,'US-OH',33,4,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(34,'BR-MT',34,5,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(35,'VU-MAP',35,7,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(36,'US-NY',36,10,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(37,'BR-AM',37,8,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(38,'NP-BA',38,9,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(39,'IR-23',39,3,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(40,'DE-SN',40,5,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(41,'RU-BEL',41,10,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(42,'MR-11',42,2,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(43,'US-LA',43,5,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(44,'SD-01',44,9,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(45,'BO-C',45,6,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(46,'BR-PA',46,3,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(47,'MY-13',47,4,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(48,'US-NH',48,5,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(49,'SE-S',49,1,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(50,'US-MI',50,3,'2023-08-10 10:26:56','2023-08-10 10:26:56'),(51,'US-ID',1,1,'2023-08-10 17:32:45','2023-08-10 17:32:45'),(52,'LL-00',NULL,4,'2023-08-16 09:09:06','2023-08-16 09:09:06'),(53,'LL-40',NULL,4,'2023-08-16 09:09:20','2023-08-16 09:09:20'),(54,'JR-45',NULL,2,'2023-08-16 09:09:44','2023-08-16 09:09:44'),(55,'JR-33',NULL,2,'2023-08-16 09:09:51','2023-08-16 09:09:51');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spo2`
--

DROP TABLE IF EXISTS `spo2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spo2` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `blood_oxygen` int(11) NOT NULL,
  `patient_check` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spo2_patient_id_foreign` (`patient_id`),
  CONSTRAINT `spo2_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spo2`
--

LOCK TABLES `spo2` WRITE;
/*!40000 ALTER TABLE `spo2` DISABLE KEYS */;
INSERT INTO `spo2` VALUES (1,1,67,0,'2023-08-09 14:23:40','2023-08-16 12:53:30'),(2,2,65,0,'2023-08-09 14:23:40','2023-08-16 09:24:55'),(3,3,99,0,'2023-08-09 14:23:40','2023-08-16 10:32:06'),(4,4,73,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(5,5,87,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(6,6,98,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(7,7,70,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(8,8,78,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(9,9,84,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(10,10,72,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(11,11,93,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(12,12,62,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(13,13,98,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(14,14,63,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(15,15,65,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(16,16,93,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(17,17,99,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(18,18,79,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(19,19,92,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(20,20,75,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(21,21,82,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(22,22,69,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(23,23,94,0,'2023-08-09 14:23:40','2023-08-09 14:23:40'),(24,24,68,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(25,25,73,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(26,26,69,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(27,27,64,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(28,28,60,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(29,29,79,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(30,30,75,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(31,31,84,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(32,32,100,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(33,33,97,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(34,34,88,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(35,35,74,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(36,36,99,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(37,37,77,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(38,38,70,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(39,39,92,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(40,40,63,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(41,41,74,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(42,42,72,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(43,43,64,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(44,44,70,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(45,45,62,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(46,46,66,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(47,47,84,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(48,48,61,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(49,49,97,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(50,50,77,0,'2023-08-09 14:23:41','2023-08-09 14:23:41'),(51,1,90,0,'2023-08-11 02:13:59','2023-08-11 02:13:59'),(52,1,90,0,'2023-08-11 02:18:14','2023-08-11 02:18:14'),(53,1,80,0,'2023-08-11 02:19:03','2023-08-11 02:19:03'),(54,29,90,0,'2023-08-11 13:12:21','2023-08-11 13:12:21'),(55,26,90,0,'2023-08-11 13:12:27','2023-08-11 13:12:27'),(56,28,97,0,'2023-08-11 13:12:45','2023-08-11 13:12:45'),(57,38,97,0,'2023-08-11 13:12:52','2023-08-11 13:12:52'),(58,45,97,0,'2023-08-11 13:13:08','2023-08-11 13:13:08'),(59,40,99,0,'2023-08-11 13:13:15','2023-08-11 13:13:15'),(60,4,99,0,'2023-08-11 13:13:34','2023-08-11 13:13:34'),(61,7,94,0,'2023-08-11 13:13:41','2023-08-11 13:13:41'),(62,8,84,0,'2023-08-11 13:13:48','2023-08-11 13:13:48'),(63,12,84,0,'2023-08-11 13:14:10','2023-08-11 13:14:10'),(64,15,85,0,'2023-08-11 13:14:16','2023-08-11 13:14:16'),(65,18,88,0,'2023-08-11 13:14:23','2023-08-11 13:14:23'),(66,22,88,0,'2023-08-11 13:14:38','2023-08-11 13:14:38'),(67,24,91,0,'2023-08-11 13:14:46','2023-08-11 13:14:46'),(68,48,84,0,'2023-08-11 13:15:04','2023-08-11 13:15:04'),(69,50,93,0,'2023-08-11 13:15:12','2023-08-11 13:15:12'),(70,10,93,0,'2023-08-11 13:17:37','2023-08-11 13:17:37'),(71,14,93,0,'2023-08-11 13:17:42','2023-08-11 13:17:42'),(72,20,93,0,'2023-08-11 13:17:47','2023-08-11 13:17:47'),(73,42,93,0,'2023-08-11 13:18:05','2023-08-11 13:18:05'),(74,41,93,0,'2023-08-11 13:18:11','2023-08-11 13:18:11'),(75,37,93,0,'2023-08-11 13:18:15','2023-08-11 13:18:15'),(76,35,93,0,'2023-08-11 13:18:31','2023-08-11 13:18:31'),(77,30,93,0,'2023-08-11 13:18:48','2023-08-11 13:18:48'),(78,43,93,0,'2023-08-11 13:18:54','2023-08-11 13:18:54'),(79,44,93,0,'2023-08-11 13:18:59','2023-08-11 13:18:59'),(80,25,93,0,'2023-08-11 13:19:30','2023-08-11 13:19:30'),(81,27,93,0,'2023-08-11 13:19:39','2023-08-11 13:19:39'),(82,46,93,0,'2023-08-11 13:19:44','2023-08-11 13:19:44'),(83,1,66,0,'2023-08-14 09:15:04','2023-08-14 09:15:04'),(84,1,66,0,'2023-08-16 08:58:21','2023-08-16 08:58:21'),(85,22,99,0,'2023-08-16 12:42:43','2023-08-16 12:42:43'),(86,5,99,0,'2023-08-16 12:44:00','2023-08-16 12:44:00'),(87,2,99,0,'2023-08-16 12:44:53','2023-08-16 12:44:53'),(88,8,99,0,'2023-08-16 13:20:53','2023-08-16 13:20:53');
/*!40000 ALTER TABLE `spo2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temperature`
--

DROP TABLE IF EXISTS `temperature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temperature` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `patient_temp` double(8,2) NOT NULL,
  `patient_check` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `temperature_patient_id_foreign` (`patient_id`),
  CONSTRAINT `temperature_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temperature`
--

LOCK TABLES `temperature` WRITE;
/*!40000 ALTER TABLE `temperature` DISABLE KEYS */;
INSERT INTO `temperature` VALUES (1,1,39.10,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(2,2,43.90,1,'2023-08-09 14:24:48','2023-08-09 14:58:01'),(3,3,35.40,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(4,4,42.10,1,'2023-08-09 14:24:48','2023-08-16 10:07:23'),(5,5,42.90,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(6,6,37.50,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(7,7,44.80,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(8,8,45.00,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(9,9,42.50,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(10,10,41.20,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(11,11,42.10,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(12,12,34.80,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(13,13,44.20,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(14,14,44.50,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(15,15,38.20,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(16,16,31.70,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(17,17,37.60,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(18,18,37.40,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(19,19,41.70,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(20,20,32.00,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(21,21,42.70,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(22,22,31.20,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(23,23,43.80,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(24,24,32.50,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(25,25,33.30,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(26,26,34.10,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(27,27,44.30,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(28,28,36.50,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(29,29,40.40,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(30,30,33.30,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(31,31,31.00,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(32,32,31.60,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(33,33,37.90,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(34,34,41.40,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(35,35,30.70,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(36,36,43.20,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(37,37,30.90,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(38,38,34.60,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(39,39,41.80,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(40,40,35.70,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(41,41,34.30,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(42,42,35.50,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(43,43,43.40,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(44,44,34.80,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(45,45,32.90,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(46,46,44.00,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(47,47,42.30,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(48,48,34.70,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(49,49,40.30,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(50,50,38.10,0,'2023-08-09 14:24:48','2023-08-09 14:24:48'),(51,1,39.00,0,'2023-08-10 17:32:10','2023-08-10 17:32:10'),(52,1,33.00,0,'2023-08-10 17:33:22','2023-08-10 17:33:22'),(53,1,37.00,0,'2023-08-11 02:19:44','2023-08-11 02:19:44'),(54,4,34.30,0,'2023-08-11 13:11:27','2023-08-11 13:11:27'),(55,7,32.00,0,'2023-08-11 13:11:43','2023-08-11 13:11:43'),(56,8,31.00,0,'2023-08-11 13:11:51','2023-08-11 13:11:51'),(57,8,31.00,0,'2023-08-16 08:58:06','2023-08-16 08:58:06'),(58,38,37.00,0,'2023-08-16 12:41:31','2023-08-16 12:41:31'),(59,22,37.00,0,'2023-08-16 12:43:15','2023-08-16 12:43:15'),(60,5,37.00,0,'2023-08-16 12:43:40','2023-08-16 12:43:40'),(61,4,37.00,0,'2023-08-16 12:45:39','2023-08-16 12:45:39'),(62,7,37.00,0,'2023-08-16 13:20:17','2023-08-16 13:20:17'),(63,8,37.00,0,'2023-08-16 13:21:30','2023-08-16 13:21:30');
/*!40000 ALTER TABLE `temperature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@gmail.com',1,NULL,'$2y$10$9nr6wcUGDI/lBLU9iZH2puExK0SiCZnMem0pRabQMzgtw3DkWO3NK',NULL,NULL,NULL),(2,'Rumah Sakit','rumahsakit@gmail.com',2,NULL,'$2y$10$BWbO496GZsrPlR2aP5uuyeY1HvanyM1XhMR5NcMt1TL7F5M7mN.Sy',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wards`
--

DROP TABLE IF EXISTS `wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ward_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rates` decimal(24,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wards`
--

LOCK TABLES `wards` WRITE;
/*!40000 ALTER TABLE `wards` DISABLE KEYS */;
INSERT INTO `wards` VALUES (1,'Asteraceae','5','Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.','Cirsium edule Nutt.',3220834.00,'2023-08-09 14:15:22','2023-08-09 14:15:22'),(2,'Clusiaceae','3','Vestibulum rutrum rutrum neque.','Hypericum pulchrum L.',2340177.00,'2023-08-09 14:15:22','2023-08-09 14:15:22'),(3,'Cucurbitaceae','5','Etiam faucibus cursus urna.','Sicyos lasiocephalus Skottsb.',1794448.00,'2023-08-09 14:15:22','2023-08-09 14:15:22'),(4,'Poaceae','2','Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.','Leymus innovatus (Beal) Pilg.',490716.00,'2023-08-09 14:15:22','2023-08-09 14:15:22'),(5,'Arthopyreniaceae','5','Cras non velit nec nisi vulputate nonummy.','Leptorhaphis epidermidis (Ach.) Th. Fr.',277038.00,'2023-08-09 14:15:22','2023-08-09 14:15:22'),(6,'Polemoniaceae','2','Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.','Phlox hoodii Richardson',1081365.00,'2023-08-09 14:15:22','2023-08-09 14:15:22'),(7,'Urticaceae','2','Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.','Urera Gaudich.',1036054.00,'2023-08-09 14:15:22','2023-08-09 14:15:22'),(8,'Sphinctrinaceae','1','Maecenas tincidunt lacus at velit.','Sphinctrina anglica Nyl.',3983962.00,'2023-08-09 14:15:22','2023-08-09 14:15:22'),(9,'Loasaceae','3','In sagittis dui vel nisl. Duis ac nibh.','Mentzelia jonesii (Urb. & Gilg) H.J. Thomp. & Roberts',2404986.00,'2023-08-09 14:15:22','2023-08-09 14:15:22'),(10,'Loasaceae','2','Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.','Mentzelia dispersa S. Watson var. dispersa',3496489.00,'2023-08-09 14:15:22','2023-08-09 14:15:22');
/*!40000 ALTER TABLE `wards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'be-covid'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-17  9:29:58
