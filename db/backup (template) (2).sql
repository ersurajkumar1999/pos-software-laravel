-- MySQL dump 10.19  Distrib 10.3.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dbtemplate
-- ------------------------------------------------------
-- Server version	10.3.38-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_transactions`
--

DROP TABLE IF EXISTS `account_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_transactions_account_id_index` (`account_id`),
  KEY `account_transactions_transaction_id_index` (`transaction_id`),
  KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  KEY `account_transactions_created_by_index` (`created_by`),
  KEY `account_transactions_type_index` (`type`),
  KEY `account_transactions_sub_type_index` (`sub_type`),
  KEY `account_transactions_operation_date_index` (`operation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_transactions`
--

LOCK TABLES `account_transactions` WRITE;
/*!40000 ALTER TABLE `account_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_types_parent_account_type_id_index` (`parent_account_type_id`),
  KEY `account_types_business_id_index` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_types`
--

LOCK TABLES `account_types` WRITE;
/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `account_details` text DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_business_id_index` (`business_id`),
  KEY `accounts_account_type_id_index` (`account_type_id`),
  KEY `accounts_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES (1,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-11 13:03:56','2023-08-11 13:03:56'),(2,'default','logout',1,'App\\User',1,1,'App\\User','[]','2023-08-11 13:04:02','2023-08-11 13:04:02'),(3,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-11 13:04:07','2023-08-11 13:04:07'),(4,'default','logout',1,'App\\User',1,1,'App\\User','[]','2023-08-11 13:16:16','2023-08-11 13:16:16'),(5,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-11 13:16:24','2023-08-11 13:16:24'),(6,'default','logout',1,'App\\User',1,1,'App\\User','[]','2023-08-11 13:24:33','2023-08-11 13:24:33'),(7,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-23 02:23:30','2023-08-23 02:23:30'),(8,'default','logout',1,'App\\User',1,1,'App\\User','[]','2023-08-23 02:36:52','2023-08-23 02:36:52'),(9,'default','login',2,'App\\User',2,2,'App\\User','[]','2023-08-22 17:08:33','2023-08-22 17:08:33'),(10,'default','added',1,'App\\Transaction',2,2,'App\\User','{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2000}}','2023-08-22 17:11:23','2023-08-22 17:11:23'),(11,'default','added',2,'App\\Transaction',2,2,'App\\User','{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":800}}','2023-08-22 17:12:30','2023-08-22 17:12:30'),(12,'default','added',4,'App\\Transaction',2,2,'App\\User','{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2000}}','2023-08-22 17:15:41','2023-08-22 17:15:41'),(13,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-24 16:12:12','2023-08-24 16:12:12'),(14,'default','added',6,'App\\Transaction',1,1,'App\\User','{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}','2023-08-24 16:13:32','2023-08-24 16:13:32'),(15,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-24 16:26:23','2023-08-24 16:26:23'),(16,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-24 20:08:42','2023-08-24 20:08:42'),(17,'default','logout',1,'App\\User',1,1,'App\\User','[]','2023-08-24 20:10:41','2023-08-24 20:10:41'),(18,'default','login',3,'App\\User',3,3,'App\\User','[]','2023-08-24 10:40:47','2023-08-24 10:40:47'),(19,'default','login',3,'App\\User',3,3,'App\\User','[]','2023-08-24 10:42:57','2023-08-24 10:42:57'),(20,'default','added',9,'App\\Transaction',3,3,'App\\User','{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}','2023-08-24 10:49:26','2023-08-24 10:49:26'),(21,'default','added',4,'App\\Contact',3,3,'App\\User','[]','2023-08-24 11:05:44','2023-08-24 11:05:44'),(22,'default','added',10,'App\\Transaction',3,3,'App\\User','{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":228}}','2023-08-24 11:05:53','2023-08-24 11:05:53'),(23,'default','added',11,'App\\Transaction',3,3,'App\\User','{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1100}}','2023-08-24 11:08:46','2023-08-24 11:08:46'),(24,'default','logout',3,'App\\User',3,3,'App\\User','[]','2023-08-24 11:24:36','2023-08-24 11:24:36'),(25,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-24 20:54:39','2023-08-24 20:54:39'),(26,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-28 17:52:57','2023-08-28 17:52:57'),(27,'default','logout',1,'App\\User',1,1,'App\\User','[]','2023-08-28 18:37:14','2023-08-28 18:37:14'),(28,'default','login',3,'App\\User',3,3,'App\\User','[]','2023-08-28 09:07:30','2023-08-28 09:07:30'),(29,'default','login',3,'App\\User',3,3,'App\\User','[]','2023-08-29 05:02:13','2023-08-29 05:02:13'),(30,'default','logout',3,'App\\User',3,3,'App\\User','[]','2023-08-29 05:48:27','2023-08-29 05:48:27'),(31,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-29 15:18:33','2023-08-29 15:18:33'),(32,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-29 16:02:42','2023-08-29 16:02:42'),(33,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-29 16:04:24','2023-08-29 16:04:24'),(34,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-29 16:10:40','2023-08-29 16:10:40'),(35,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-29 18:09:25','2023-08-29 18:09:25'),(36,'default','logout',1,'App\\User',1,1,'App\\User','[]','2023-08-29 21:46:43','2023-08-29 21:46:43'),(37,'default','login',4,'App\\User',4,4,'App\\User','[]','2023-08-29 13:16:47','2023-08-29 13:16:47'),(38,'default','login',4,'App\\User',4,4,'App\\User','[]','2023-08-30 09:13:29','2023-08-30 09:13:29'),(39,'default','logout',4,'App\\User',4,4,'App\\User','[]','2023-08-30 12:56:45','2023-08-30 12:56:45'),(40,'default','login',4,'App\\User',4,4,'App\\User','[]','2023-08-30 13:01:48','2023-08-30 13:01:48'),(41,'default','login',4,'App\\User',4,4,'App\\User','[]','2023-08-30 13:11:33','2023-08-30 13:11:33'),(42,'default','logout',4,'App\\User',4,4,'App\\User','[]','2023-08-30 13:43:45','2023-08-30 13:43:45'),(43,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-08-30 22:13:50','2023-08-30 22:13:50'),(44,'default','logout',1,'App\\User',1,1,'App\\User','[]','2023-08-30 22:19:49','2023-08-30 22:19:49'),(45,'default','login',4,'App\\User',4,4,'App\\User','[]','2023-08-30 13:50:03','2023-08-30 13:50:03'),(46,'default','login',4,'App\\User',4,4,'App\\User','[]','2023-09-04 12:04:36','2023-09-04 12:04:36'),(47,'default','logout',4,'App\\User',4,4,'App\\User','[]','2023-09-04 12:07:14','2023-09-04 12:07:14'),(48,'default','login',4,'App\\User',4,4,'App\\User','[]','2023-09-05 11:42:18','2023-09-05 11:42:18'),(49,'default','added',5,'App\\User',4,4,'App\\User','{\"name\":\"Mr. Arima Cashier\"}','2023-09-05 14:27:08','2023-09-05 14:27:08'),(50,'default','edited',5,'App\\User',4,4,'App\\User','{\"name\":\"Mr. Arima Cashier\"}','2023-09-05 14:27:40','2023-09-05 14:27:40'),(51,'default','deleted',5,'App\\User',4,4,'App\\User','{\"name\":\"Mr. Arima Cashier\",\"id\":5}','2023-09-05 14:28:35','2023-09-05 14:28:35'),(52,'default','added',6,'App\\User',4,4,'App\\User','{\"name\":\"Mr. Arima Cashier\"}','2023-09-05 14:29:27','2023-09-05 14:29:27'),(53,'default','added',7,'App\\User',4,4,'App\\User','{\"name\":\"Mr. St. Joseph Cashier\"}','2023-09-05 14:33:39','2023-09-05 14:33:39'),(54,'default','added',8,'App\\User',4,4,'App\\User','{\"name\":\"Mr. St. Augustine Cashier\"}','2023-09-05 14:35:28','2023-09-05 14:35:28'),(55,'default','added',9,'App\\User',4,4,'App\\User','{\"name\":\"Mr. Sangre Grande Cashier\"}','2023-09-05 14:36:50','2023-09-05 14:36:50'),(56,'default','added',10,'App\\User',4,4,'App\\User','{\"name\":\"Mrs. Michelle Sorzano-Collins\"}','2023-09-05 14:39:06','2023-09-05 14:39:06'),(57,'default','added',11,'App\\User',4,4,'App\\User','{\"name\":\"Mr. Dennis Ramdass\"}','2023-09-05 14:42:00','2023-09-05 14:42:00'),(58,'default','added',12,'App\\User',4,4,'App\\User','{\"name\":\"Mr. Jolene Sumrah\"}','2023-09-05 14:43:17','2023-09-05 14:43:17'),(59,'default','logout',4,'App\\User',4,4,'App\\User','[]','2023-09-05 15:39:52','2023-09-05 15:39:52'),(60,'default','login',4,'App\\User',4,4,'App\\User','[]','2023-09-06 07:53:04','2023-09-06 07:53:04'),(61,'default','logout',4,'App\\User',4,4,'App\\User','[]','2023-09-06 07:53:58','2023-09-06 07:53:58'),(62,'default','login',4,'App\\User',4,4,'App\\User','[]','2023-09-06 07:59:32','2023-09-06 07:59:32'),(63,'default','logout',4,'App\\User',4,4,'App\\User','[]','2023-09-06 08:01:01','2023-09-06 08:01:01'),(64,'default','login',4,'App\\User',4,4,'App\\User','[]','2023-09-06 12:50:07','2023-09-06 12:50:07'),(65,'default','login',4,'App\\User',4,4,'App\\User','[]','2023-09-06 12:56:20','2023-09-06 12:56:20'),(66,'default','logout',4,'App\\User',4,4,'App\\User','[]','2023-09-06 12:57:23','2023-09-06 12:57:23'),(67,'default','logout',4,'App\\User',4,4,'App\\User','[]','2023-09-06 13:20:13','2023-09-06 13:20:13'),(68,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-09-06 21:50:17','2023-09-06 21:50:17'),(69,'default','logout',1,'App\\User',1,1,'App\\User','[]','2023-09-06 22:40:52','2023-09-06 22:40:52'),(70,'default','login',4,'App\\User',4,4,'App\\User','[]','2023-09-06 14:18:27','2023-09-06 14:18:27'),(71,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-09-06 23:08:20','2023-09-06 23:08:20'),(72,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-09-11 21:16:13','2023-09-11 21:16:13'),(73,'default','logout',1,'App\\User',1,1,'App\\User','[]','2023-09-11 21:20:20','2023-09-11 21:20:20'),(74,'default','login',13,'App\\User',5,13,'App\\User','[]','2023-09-11 11:50:53','2023-09-11 11:50:53'),(75,'default','added',12,'App\\Transaction',5,13,'App\\User','{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2000}}','2023-09-11 12:07:28','2023-09-11 12:07:28'),(76,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-09-26 16:18:50','2023-09-26 16:18:50'),(77,'default','logout',1,'App\\User',1,1,'App\\User','[]','2023-09-26 18:50:36','2023-09-26 18:50:36'),(78,'default','login',13,'App\\User',5,13,'App\\User','[]','2023-09-26 09:20:56','2023-09-26 09:20:56'),(79,'default','logout',13,'App\\User',5,13,'App\\User','[]','2023-09-26 09:21:15','2023-09-26 09:21:15'),(80,'default','login',1,'App\\User',1,1,'App\\User','[]','2023-10-05 18:40:46','2023-10-05 18:40:46'),(81,'default','logout',1,'App\\User',1,1,'App\\User','[]','2023-10-05 20:23:59','2023-10-05 20:23:59'),(82,'default','login',14,'App\\User',6,14,'App\\User','[]','2023-10-05 10:54:19','2023-10-05 10:54:19'),(83,'default','login',1,'App\\User',1,1,'App\\User','[]','2024-01-16 21:09:34','2024-01-16 21:09:34'),(84,'default','login',1,'App\\User',1,1,'App\\User','[]','2024-01-19 04:18:19','2024-01-19 04:18:19'),(85,'default','logout',1,'App\\User',1,1,'App\\User','[]','2024-01-19 04:18:52','2024-01-19 04:18:52'),(86,'default','login',1,'App\\User',1,1,'App\\User','[]','2024-01-21 06:22:23','2024-01-21 06:22:23'),(87,'default','added',13,'App\\Transaction',1,1,'App\\User','{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2000}}','2024-01-21 06:29:38','2024-01-21 06:29:38'),(88,'default','added',14,'App\\Transaction',1,1,'App\\User','{\"attributes\":{\"type\":\"sell_return\",\"final_total\":1000}}','2024-01-21 06:30:03','2024-01-21 06:30:03'),(89,'default','login',1,'App\\User',1,1,'App\\User','[]','2024-01-22 21:27:46','2024-01-22 21:27:46'),(90,'default','login',1,'App\\User',1,1,'App\\User','[]','2024-01-25 21:01:54','2024-01-25 21:01:54'),(91,'default','logout',1,'App\\User',1,1,'App\\User','[]','2024-01-25 21:01:59','2024-01-25 21:01:59'),(92,'default','login',1,'App\\User',1,1,'App\\User','[]','2024-01-25 21:02:02','2024-01-25 21:02:02'),(93,'default','login',1,'App\\User',1,1,'App\\User','[]','2024-01-25 21:04:44','2024-01-25 21:04:44'),(94,'default','login',1,'App\\User',1,1,'App\\User','[]','2024-01-25 21:09:30','2024-01-25 21:09:30'),(95,'default','login',15,'App\\User',7,15,'App\\User','[]','2024-02-01 12:31:24','2024-02-01 12:31:24'),(96,'default','login',15,'App\\User',7,15,'App\\User','[]','2024-02-01 12:33:16','2024-02-01 12:33:16'),(97,'default','logout',15,'App\\User',7,15,'App\\User','[]','2024-02-01 12:37:28','2024-02-01 12:37:28'),(98,'default','login',1,'App\\User',1,1,'App\\User','[]','2024-02-01 22:07:39','2024-02-01 22:07:39'),(99,'default','logout',1,'App\\User',1,1,'App\\User','[]','2024-02-01 22:08:36','2024-02-01 22:08:36'),(100,'default','login',15,'App\\User',7,15,'App\\User','[]','2024-02-01 12:39:05','2024-02-01 12:39:05'),(101,'default','added',19,'App\\Transaction',7,15,'App\\User','{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":16400}}','2024-02-01 12:50:57','2024-02-01 12:50:57'),(102,'default','added',20,'App\\Transaction',7,15,'App\\User','{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":10900}}','2024-02-01 12:52:32','2024-02-01 12:52:32');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcodes`
--

DROP TABLE IF EXISTS `barcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barcodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barcodes_business_id_foreign` (`business_id`),
  CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcodes`
--

LOCK TABLES `barcodes` WRITE;
/*!40000 ALTER TABLE `barcodes` DISABLE KEYS */;
INSERT INTO `barcodes` VALUES (1,'20 Labels per Sheet','Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20',4.0000,1.0000,8.5000,11.0000,0.5000,0.1250,0.0000,0.1875,2,0,0,20,NULL,'2017-12-18 06:13:44','2017-12-18 06:13:44'),(2,'30 Labels per sheet','Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30',2.6250,1.0000,8.5000,11.0000,0.5000,0.1880,0.0000,0.1250,3,0,0,30,NULL,'2017-12-18 06:04:39','2017-12-18 06:10:40'),(3,'32 Labels per sheet','Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32',2.0000,1.2500,8.5000,11.0000,0.5000,0.2500,0.0000,0.0000,4,0,0,32,NULL,'2017-12-18 05:55:40','2017-12-18 05:55:40'),(4,'40 Labels per sheet','Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40',2.0000,1.0000,8.5000,11.0000,0.5000,0.2500,0.0000,0.0000,4,0,0,40,NULL,'2017-12-18 05:58:40','2017-12-18 05:58:40'),(5,'50 Labels per Sheet','Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50',1.5000,1.0000,8.5000,11.0000,0.5000,0.5000,0.0000,0.0000,5,0,0,50,NULL,'2017-12-18 05:51:10','2017-12-18 05:51:10'),(6,'Continuous Rolls - 31.75mm x 25.4mm','Label Size: 31.75mm x 25.4mm, Gap: 3.18mm',1.2500,1.0000,1.2500,0.0000,0.1250,0.0000,0.1250,0.0000,1,0,1,NULL,NULL,'2017-12-18 05:51:10','2017-12-18 05:51:10');
/*!40000 ALTER TABLE `barcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(10) unsigned NOT NULL,
  `waiter_id` int(10) unsigned DEFAULT NULL,
  `table_id` int(10) unsigned DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `booking_status` varchar(191) NOT NULL,
  `booking_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_contact_id_foreign` (`contact_id`),
  KEY `bookings_business_id_foreign` (`business_id`),
  KEY `bookings_created_by_foreign` (`created_by`),
  KEY `bookings_table_id_index` (`table_id`),
  KEY `bookings_waiter_id_index` (`waiter_id`),
  KEY `bookings_location_id_index` (`location_id`),
  KEY `bookings_booking_status_index` (`booking_status`),
  KEY `bookings_correspondent_id_index` (`correspondent_id`),
  CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brands_business_id_foreign` (`business_id`),
  KEY `brands_created_by_foreign` (`created_by`),
  CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) DEFAULT NULL,
  `tax_label_1` varchar(10) DEFAULT NULL,
  `tax_number_2` varchar(100) DEFAULT NULL,
  `tax_label_2` varchar(10) DEFAULT NULL,
  `code_label_1` varchar(191) DEFAULT NULL,
  `code_1` varchar(191) DEFAULT NULL,
  `code_label_2` varchar(191) DEFAULT NULL,
  `code_2` varchar(191) DEFAULT NULL,
  `default_sales_tax` int(10) unsigned DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT 0.00,
  `owner_id` int(10) unsigned NOT NULL,
  `time_zone` varchar(191) NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT 1,
  `accounting_method` enum('fifo','lifo','avco') NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') NOT NULL DEFAULT 'includes',
  `logo` varchar(191) DEFAULT NULL,
  `sku_prefix` varchar(191) DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_type` enum('add_expiry','add_manufacturing') NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT 1,
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) unsigned DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `transaction_edit_days` int(10) unsigned NOT NULL DEFAULT 30,
  `stock_expiry_alert_days` int(10) unsigned NOT NULL DEFAULT 30,
  `keyboard_shortcuts` text DEFAULT NULL,
  `pos_settings` text DEFAULT NULL,
  `manufacturing_settings` text DEFAULT NULL,
  `woocommerce_api_settings` text DEFAULT NULL,
  `woocommerce_skipped_orders` text DEFAULT NULL,
  `woocommerce_wh_oc_secret` varchar(191) DEFAULT NULL,
  `woocommerce_wh_ou_secret` varchar(191) DEFAULT NULL,
  `woocommerce_wh_od_secret` varchar(191) DEFAULT NULL,
  `woocommerce_wh_or_secret` varchar(191) DEFAULT NULL,
  `essentials_settings` longtext DEFAULT NULL,
  `weighing_scale_setting` text NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT 1,
  `enable_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT 1,
  `enable_purchase_status` tinyint(1) DEFAULT 1,
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT 0,
  `enable_racks` tinyint(1) NOT NULL DEFAULT 0,
  `enable_row` tinyint(1) NOT NULL DEFAULT 0,
  `enable_position` tinyint(1) NOT NULL DEFAULT 0,
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT 1,
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT 1,
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT 1,
  `currency_symbol_placement` enum('before','after') NOT NULL DEFAULT 'before',
  `enabled_modules` text DEFAULT NULL,
  `date_format` varchar(191) NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') NOT NULL DEFAULT '24',
  `currency_precision` tinyint(4) NOT NULL DEFAULT 2,
  `quantity_precision` tinyint(4) NOT NULL DEFAULT 2,
  `ref_no_prefixes` text DEFAULT NULL,
  `theme_color` char(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `crm_settings` text DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text DEFAULT NULL,
  `sms_settings` text DEFAULT NULL,
  `custom_labels` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_screen` tinyint(11) NOT NULL DEFAULT 0,
  `unit_selection_on_pos_screen` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_owner_id_foreign` (`owner_id`),
  KEY `business_currency_id_foreign` (`currency_id`),
  KEY `business_default_sales_tax_foreign` (`default_sales_tax`),
  CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (1,'Superadmin Business',91,'2023-08-11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25.00,1,'Asia/Kolkata',1,'fifo',0.00,'includes',NULL,NULL,0,'add_expiry','keep_selling',0,1,0,NULL,1.000,30,30,'{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}','{\"amount_rounding_method\":null,\"cmmsn_calculation_type\":\"invoice_value\",\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"square_public_key\":null,\"square_secret_key\":null,\"cash_denominations\":null,\"enable_cash_denomination_on\":\"pos_screen\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}',1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before','[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]','m/d/Y','24',2,2,'{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_requisition\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}',NULL,NULL,NULL,0,NULL,1.0000,1.0000,NULL,1.0000,1.0000,NULL,NULL,NULL,'year','{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}','{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}','{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}','{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}',1,0,0,'2023-08-11 13:03:45','2024-01-25 21:12:32'),(7,'TracPARTS',47,'2024-02-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25.00,15,'America/Guyana',1,'fifo',0.00,'includes',NULL,NULL,0,'add_expiry','keep_selling',0,1,0,NULL,1.000,30,30,'{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}','{\"amount_rounding_method\":\"1\",\"cmmsn_calculation_type\":\"invoice_value\",\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"square_public_key\":null,\"square_secret_key\":null,\"cash_denominations\":\"1,5,10,20,50,100,500,1000,2000,5000\",\"enable_cash_denomination_on\":\"pos_screen\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}',1,1,1,1,1,0,7,0,1,1,1,1,NULL,1,1,'before','[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]','m/d/Y','24',2,2,'{\"purchase\":\"PO\",\"purchase_return\":\"PRetrn\",\"purchase_requisition\":\"PReq\",\"purchase_order\":\"POrder\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":\"Exp\",\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":\"Drft\",\"sales_order\":\"SOrder\"}','green',NULL,NULL,0,NULL,1.0000,1.0000,NULL,1.0000,1.0000,NULL,NULL,NULL,'year','{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}','{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}','{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}','{\"default_credit_limit\":null,\"enable_purchase_order\":\"1\",\"default_datatable_page_entries\":\"25\"}',1,0,0,'2024-02-01 12:31:07','2024-02-01 12:49:29');
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_locations`
--

DROP TABLE IF EXISTS `business_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `location_id` varchar(191) DEFAULT NULL,
  `name` varchar(256) NOT NULL,
  `landmark` text DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip_code` char(7) NOT NULL,
  `invoice_scheme_id` int(10) unsigned NOT NULL,
  `invoice_layout_id` int(10) unsigned NOT NULL,
  `sale_invoice_layout_id` int(11) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT 1,
  `receipt_printer_type` enum('browser','printer') NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `featured_products` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `default_payment_accounts` text DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_locations_business_id_index` (`business_id`),
  KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  KEY `business_locations_sale_invoice_layout_id_index` (`sale_invoice_layout_id`),
  KEY `business_locations_selling_price_group_id_index` (`selling_price_group_id`),
  KEY `business_locations_receipt_printer_type_index` (`receipt_printer_type`),
  KEY `business_locations_printer_id_index` (`printer_id`),
  CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_locations`
--

LOCK TABLES `business_locations` WRITE;
/*!40000 ALTER TABLE `business_locations` DISABLE KEYS */;
INSERT INTO `business_locations` VALUES (1,1,'BL0001','Superadmin Business','456','USA','State','City','zip',1,1,1,NULL,1,'browser',NULL,'1','2','','',NULL,1,'{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}',NULL,NULL,NULL,NULL,NULL,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(11,7,'BL0001','TracPARTS','Eccles, East Bank Demerara','Guyana','NA','EBD','413741',10,10,10,NULL,1,'browser',NULL,'','','','',NULL,1,'{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}',NULL,NULL,NULL,NULL,NULL,'2024-02-01 12:31:08','2024-02-01 12:31:08');
/*!40000 ALTER TABLE `business_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_denominations`
--

DROP TABLE IF EXISTS `cash_denominations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_denominations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `amount` decimal(22,4) NOT NULL,
  `total_count` int(11) NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_denominations_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_denominations`
--

LOCK TABLES `cash_denominations` WRITE;
/*!40000 ALTER TABLE `cash_denominations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_denominations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_register_transactions`
--

DROP TABLE IF EXISTS `cash_register_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_register_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cash_register_id` int(10) unsigned NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pay_method` varchar(191) DEFAULT NULL,
  `type` enum('debit','credit') NOT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  KEY `cash_register_transactions_type_index` (`type`),
  KEY `cash_register_transactions_transaction_type_index` (`transaction_type`),
  CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_register_transactions`
--

LOCK TABLES `cash_register_transactions` WRITE;
/*!40000 ALTER TABLE `cash_register_transactions` DISABLE KEYS */;
INSERT INTO `cash_register_transactions` VALUES (5,2,1000.0000,'cash','credit','sell',6,'2023-08-24 16:13:32','2023-08-24 16:13:32'),(10,5,5000.0000,'cash','credit','initial',NULL,'2024-01-21 06:28:50','2024-01-21 06:28:50'),(11,5,2000.0000,'cash','credit','sell',13,'2024-01-21 06:29:38','2024-01-21 06:29:38'),(12,6,16400.0000,'cash','credit','sell',19,'2024-02-01 12:50:57','2024-02-01 12:50:57'),(13,6,10900.0000,'cash','credit','sell',20,'2024-02-01 12:52:32','2024-02-01 12:52:32');
/*!40000 ALTER TABLE `cash_register_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_registers`
--

DROP TABLE IF EXISTS `cash_registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_registers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `status` enum('close','open') NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_card_slips` int(11) NOT NULL DEFAULT 0,
  `total_cheques` int(11) NOT NULL DEFAULT 0,
  `denominations` text DEFAULT NULL,
  `closing_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_registers_business_id_foreign` (`business_id`),
  KEY `cash_registers_user_id_foreign` (`user_id`),
  KEY `cash_registers_location_id_index` (`location_id`),
  CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_registers`
--

LOCK TABLES `cash_registers` WRITE;
/*!40000 ALTER TABLE `cash_registers` DISABLE KEYS */;
INSERT INTO `cash_registers` VALUES (2,1,1,1,'close','2024-01-21 07:28:40',1000.0000,0,0,NULL,NULL,'2023-08-24 16:12:00','2024-01-21 06:28:40'),(5,1,1,1,'open',NULL,0.0000,0,0,NULL,NULL,'2024-01-21 06:28:00','2024-01-21 06:28:50'),(6,7,11,15,'open',NULL,0.0000,0,0,NULL,NULL,'2024-02-01 12:48:00','2024-02-01 12:48:56');
/*!40000 ALTER TABLE `cash_registers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `short_code` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `woocommerce_cat_id` int(11) DEFAULT NULL,
  `category_type` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_business_id_foreign` (`business_id`),
  KEY `categories_created_by_foreign` (`created_by`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_woocommerce_cat_id_index` (`woocommerce_cat_id`),
  CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorizables`
--

DROP TABLE IF EXISTS `categorizables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) NOT NULL,
  `categorizable_id` bigint(20) unsigned NOT NULL,
  KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorizables`
--

LOCK TABLES `categorizables` WRITE;
/*!40000 ALTER TABLE `categorizables` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorizables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `type` varchar(191) NOT NULL,
  `supplier_business_name` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `prefix` varchar(191) DEFAULT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `middle_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_id` varchar(191) DEFAULT NULL,
  `contact_status` varchar(191) NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `address_line_1` text DEFAULT NULL,
  `address_line_2` text DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) NOT NULL,
  `landline` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `converted_by` int(11) DEFAULT NULL,
  `converted_on` datetime DEFAULT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_rp` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_address` text DEFAULT NULL,
  `shipping_custom_field_details` longtext DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_field_1` varchar(191) DEFAULT NULL,
  `export_custom_field_2` varchar(191) DEFAULT NULL,
  `export_custom_field_3` varchar(191) DEFAULT NULL,
  `export_custom_field_4` varchar(191) DEFAULT NULL,
  `export_custom_field_5` varchar(191) DEFAULT NULL,
  `export_custom_field_6` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `crm_source` varchar(191) DEFAULT NULL,
  `crm_life_stage` varchar(191) DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `custom_field5` varchar(191) DEFAULT NULL,
  `custom_field6` varchar(191) DEFAULT NULL,
  `custom_field7` varchar(191) DEFAULT NULL,
  `custom_field8` varchar(191) DEFAULT NULL,
  `custom_field9` varchar(191) DEFAULT NULL,
  `custom_field10` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_business_id_foreign` (`business_id`),
  KEY `contacts_created_by_foreign` (`created_by`),
  KEY `contacts_type_index` (`type`),
  KEY `contacts_contact_status_index` (`contact_status`),
  KEY `contacts_crm_source_index` (`crm_source`),
  KEY `contacts_crm_life_stage_index` (`crm_life_stage`),
  KEY `contacts_converted_by_index` (`converted_by`),
  CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,1,'customer',NULL,'Walk-In Customer',NULL,NULL,NULL,NULL,NULL,'CO0001','active',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0.0000,1,NULL,NULL,0.0000,0,0,0,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(8,7,'customer',NULL,'Walk-In Customer',NULL,NULL,NULL,NULL,NULL,'CO0001','active',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,0.0000,15,NULL,NULL,0.0000,0,0,0,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-01 12:31:07','2024-02-01 12:31:07');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_call_logs`
--

DROP TABLE IF EXISTS `crm_call_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_call_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `call_type` varchar(191) DEFAULT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `mobile_name` varchar(191) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crm_call_logs_business_id_index` (`business_id`),
  KEY `crm_call_logs_user_id_index` (`user_id`),
  KEY `crm_call_logs_contact_id_index` (`contact_id`),
  KEY `crm_call_logs_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_call_logs`
--

LOCK TABLES `crm_call_logs` WRITE;
/*!40000 ALTER TABLE `crm_call_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_call_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_campaigns`
--

DROP TABLE IF EXISTS `crm_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_campaigns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `campaign_type` enum('sms','email') NOT NULL DEFAULT 'email',
  `subject` varchar(191) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `sent_on` datetime DEFAULT NULL,
  `contact_ids` text NOT NULL,
  `additional_info` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crm_campaigns_business_id_foreign` (`business_id`),
  KEY `crm_campaigns_created_by_index` (`created_by`),
  CONSTRAINT `crm_campaigns_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_campaigns`
--

LOCK TABLES `crm_campaigns` WRITE;
/*!40000 ALTER TABLE `crm_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_followup_invoices`
--

DROP TABLE IF EXISTS `crm_followup_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_followup_invoices` (
  `follow_up_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_followup_invoices`
--

LOCK TABLES `crm_followup_invoices` WRITE;
/*!40000 ALTER TABLE `crm_followup_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_followup_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_lead_users`
--

DROP TABLE IF EXISTS `crm_lead_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_lead_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `crm_lead_users_user_id_index` (`user_id`),
  KEY `crm_lead_users_contact_id_index` (`contact_id`),
  CONSTRAINT `crm_lead_users_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_lead_users`
--

LOCK TABLES `crm_lead_users` WRITE;
/*!40000 ALTER TABLE `crm_lead_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_lead_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_proposal_templates`
--

DROP TABLE IF EXISTS `crm_proposal_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_proposal_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `subject` text NOT NULL,
  `body` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crm_proposal_templates_business_id_foreign` (`business_id`),
  KEY `crm_proposal_templates_created_by_index` (`created_by`),
  CONSTRAINT `crm_proposal_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_proposal_templates`
--

LOCK TABLES `crm_proposal_templates` WRITE;
/*!40000 ALTER TABLE `crm_proposal_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_proposal_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_proposals`
--

DROP TABLE IF EXISTS `crm_proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_proposals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `subject` text NOT NULL,
  `body` longtext NOT NULL,
  `sent_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crm_proposals_business_id_foreign` (`business_id`),
  KEY `crm_proposals_contact_id_foreign` (`contact_id`),
  KEY `crm_proposals_sent_by_index` (`sent_by`),
  CONSTRAINT `crm_proposals_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `crm_proposals_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_proposals`
--

LOCK TABLES `crm_proposals` WRITE;
/*!40000 ALTER TABLE `crm_proposals` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_schedule_logs`
--

DROP TABLE IF EXISTS `crm_schedule_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_schedule_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` bigint(20) unsigned NOT NULL,
  `log_type` enum('call','sms','meeting','email') NOT NULL DEFAULT 'email',
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `subject` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crm_schedule_logs_schedule_id_foreign` (`schedule_id`),
  KEY `crm_schedule_logs_created_by_index` (`created_by`),
  CONSTRAINT `crm_schedule_logs_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `crm_schedules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_schedule_logs`
--

LOCK TABLES `crm_schedule_logs` WRITE;
/*!40000 ALTER TABLE `crm_schedule_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_schedule_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_schedule_users`
--

DROP TABLE IF EXISTS `crm_schedule_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_schedule_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` bigint(20) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crm_schedule_users_schedule_id_foreign` (`schedule_id`),
  KEY `crm_schedule_users_user_id_index` (`user_id`),
  CONSTRAINT `crm_schedule_users_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `crm_schedules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_schedule_users`
--

LOCK TABLES `crm_schedule_users` WRITE;
/*!40000 ALTER TABLE `crm_schedule_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_schedule_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_schedules`
--

DROP TABLE IF EXISTS `crm_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `schedule_type` enum('call','sms','meeting','email') NOT NULL DEFAULT 'email',
  `allow_notification` tinyint(1) NOT NULL DEFAULT 1,
  `notify_via` text DEFAULT NULL,
  `notify_before` int(11) DEFAULT NULL,
  `notify_type` enum('minute','hour','day') NOT NULL DEFAULT 'hour',
  `created_by` int(11) NOT NULL,
  `is_recursive` tinyint(1) NOT NULL DEFAULT 0,
  `recursion_days` int(11) DEFAULT NULL,
  `followup_additional_info` text DEFAULT NULL,
  `follow_up_by` varchar(191) DEFAULT NULL,
  `follow_up_by_value` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crm_schedules_created_by_index` (`created_by`),
  KEY `crm_schedules_business_id_index` (`business_id`),
  KEY `crm_schedules_contact_id_index` (`contact_id`),
  KEY `crm_schedules_schedule_type_index` (`schedule_type`),
  KEY `crm_schedules_notify_type_index` (`notify_type`),
  CONSTRAINT `crm_schedules_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_schedules`
--

LOCK TABLES `crm_schedules` WRITE;
/*!40000 ALTER TABLE `crm_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `code` varchar(25) NOT NULL,
  `symbol` varchar(25) NOT NULL,
  `thousand_separator` varchar(10) NOT NULL,
  `decimal_separator` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'Albania','Leke','ALL','Lek',',','.',NULL,NULL),(2,'America','Dollars','USD','$',',','.',NULL,NULL),(3,'Afghanistan','Afghanis','AF','؋',',','.',NULL,NULL),(4,'Argentina','Pesos','ARS','$',',','.',NULL,NULL),(5,'Aruba','Guilders','AWG','ƒ',',','.',NULL,NULL),(6,'Australia','Dollars','AUD','$',',','.',NULL,NULL),(7,'Azerbaijan','New Manats','AZ','ман',',','.',NULL,NULL),(8,'Bahamas','Dollars','BSD','$',',','.',NULL,NULL),(9,'Barbados','Dollars','BBD','$',',','.',NULL,NULL),(10,'Belarus','Rubles','BYR','p.',',','.',NULL,NULL),(11,'Belgium','Euro','EUR','€',',','.',NULL,NULL),(12,'Beliz','Dollars','BZD','BZ$',',','.',NULL,NULL),(13,'Bermuda','Dollars','BMD','$',',','.',NULL,NULL),(14,'Bolivia','Bolivianos','BOB','$b',',','.',NULL,NULL),(15,'Bosnia and Herzegovina','Convertible Marka','BAM','KM',',','.',NULL,NULL),(16,'Botswana','Pula\'s','BWP','P',',','.',NULL,NULL),(17,'Bulgaria','Leva','BG','лв',',','.',NULL,NULL),(18,'Brazil','Reais','BRL','R$',',','.',NULL,NULL),(19,'Britain [United Kingdom]','Pounds','GBP','£',',','.',NULL,NULL),(20,'Brunei Darussalam','Dollars','BND','$',',','.',NULL,NULL),(21,'Cambodia','Riels','KHR','៛',',','.',NULL,NULL),(22,'Canada','Dollars','CAD','$',',','.',NULL,NULL),(23,'Cayman Islands','Dollars','KYD','$',',','.',NULL,NULL),(24,'Chile','Pesos','CLP','$',',','.',NULL,NULL),(25,'China','Yuan Renminbi','CNY','¥',',','.',NULL,NULL),(26,'Colombia','Pesos','COP','$',',','.',NULL,NULL),(27,'Costa Rica','Colón','CRC','₡',',','.',NULL,NULL),(28,'Croatia','Kuna','HRK','kn',',','.',NULL,NULL),(29,'Cuba','Pesos','CUP','₱',',','.',NULL,NULL),(30,'Cyprus','Euro','EUR','€','.',',',NULL,NULL),(31,'Czech Republic','Koruny','CZK','Kč',',','.',NULL,NULL),(32,'Denmark','Kroner','DKK','kr',',','.',NULL,NULL),(33,'Dominican Republic','Pesos','DOP ','RD$',',','.',NULL,NULL),(34,'East Caribbean','Dollars','XCD','$',',','.',NULL,NULL),(35,'Egypt','Pounds','EGP','£',',','.',NULL,NULL),(36,'El Salvador','Colones','SVC','$',',','.',NULL,NULL),(37,'England [United Kingdom]','Pounds','GBP','£',',','.',NULL,NULL),(38,'Euro','Euro','EUR','€','.',',',NULL,NULL),(39,'Falkland Islands','Pounds','FKP','£',',','.',NULL,NULL),(40,'Fiji','Dollars','FJD','$',',','.',NULL,NULL),(41,'France','Euro','EUR','€','.',',',NULL,NULL),(42,'Ghana','Cedis','GHS','¢',',','.',NULL,NULL),(43,'Gibraltar','Pounds','GIP','£',',','.',NULL,NULL),(44,'Greece','Euro','EUR','€','.',',',NULL,NULL),(45,'Guatemala','Quetzales','GTQ','Q',',','.',NULL,NULL),(46,'Guernsey','Pounds','GGP','£',',','.',NULL,NULL),(47,'Guyana','Dollars','GYD','$',',','.',NULL,NULL),(48,'Holland [Netherlands]','Euro','EUR','€','.',',',NULL,NULL),(49,'Honduras','Lempiras','HNL','L',',','.',NULL,NULL),(50,'Hong Kong','Dollars','HKD','$',',','.',NULL,NULL),(51,'Hungary','Forint','HUF','Ft',',','.',NULL,NULL),(52,'Iceland','Kronur','ISK','kr',',','.',NULL,NULL),(53,'India','Rupees','INR','₹',',','.',NULL,NULL),(54,'Indonesia','Rupiahs','IDR','Rp',',','.',NULL,NULL),(55,'Iran','Rials','IRR','﷼',',','.',NULL,NULL),(56,'Ireland','Euro','EUR','€','.',',',NULL,NULL),(57,'Isle of Man','Pounds','IMP','£',',','.',NULL,NULL),(58,'Israel','New Shekels','ILS','₪',',','.',NULL,NULL),(59,'Italy','Euro','EUR','€','.',',',NULL,NULL),(60,'Jamaica','Dollars','JMD','J$',',','.',NULL,NULL),(61,'Japan','Yen','JPY','¥',',','.',NULL,NULL),(62,'Jersey','Pounds','JEP','£',',','.',NULL,NULL),(63,'Kazakhstan','Tenge','KZT','лв',',','.',NULL,NULL),(64,'Korea [North]','Won','KPW','₩',',','.',NULL,NULL),(65,'Korea [South]','Won','KRW','₩',',','.',NULL,NULL),(66,'Kyrgyzstan','Soms','KGS','лв',',','.',NULL,NULL),(67,'Laos','Kips','LAK','₭',',','.',NULL,NULL),(68,'Latvia','Lati','LVL','Ls',',','.',NULL,NULL),(69,'Lebanon','Pounds','LBP','£',',','.',NULL,NULL),(70,'Liberia','Dollars','LRD','$',',','.',NULL,NULL),(71,'Liechtenstein','Switzerland Francs','CHF','CHF',',','.',NULL,NULL),(72,'Lithuania','Litai','LTL','Lt',',','.',NULL,NULL),(73,'Luxembourg','Euro','EUR','€','.',',',NULL,NULL),(74,'Macedonia','Denars','MKD','ден',',','.',NULL,NULL),(75,'Malaysia','Ringgits','MYR','RM',',','.',NULL,NULL),(76,'Malta','Euro','EUR','€','.',',',NULL,NULL),(77,'Mauritius','Rupees','MUR','₨',',','.',NULL,NULL),(78,'Mexico','Pesos','MXN','$',',','.',NULL,NULL),(79,'Mongolia','Tugriks','MNT','₮',',','.',NULL,NULL),(80,'Mozambique','Meticais','MZ','MT',',','.',NULL,NULL),(81,'Namibia','Dollars','NAD','$',',','.',NULL,NULL),(82,'Nepal','Rupees','NPR','₨',',','.',NULL,NULL),(83,'Netherlands Antilles','Guilders','ANG','ƒ',',','.',NULL,NULL),(84,'Netherlands','Euro','EUR','€','.',',',NULL,NULL),(85,'New Zealand','Dollars','NZD','$',',','.',NULL,NULL),(86,'Nicaragua','Cordobas','NIO','C$',',','.',NULL,NULL),(87,'Nigeria','Nairas','NGN','₦',',','.',NULL,NULL),(88,'North Korea','Won','KPW','₩',',','.',NULL,NULL),(89,'Norway','Krone','NOK','kr',',','.',NULL,NULL),(90,'Oman','Rials','OMR','﷼',',','.',NULL,NULL),(91,'Pakistan','Rupees','PKR','₨',',','.',NULL,NULL),(92,'Panama','Balboa','PAB','B/.',',','.',NULL,NULL),(93,'Paraguay','Guarani','PYG','Gs',',','.',NULL,NULL),(94,'Peru','Nuevos Soles','PE','S/.',',','.',NULL,NULL),(95,'Philippines','Pesos','PHP','Php',',','.',NULL,NULL),(96,'Poland','Zlotych','PL','zł',',','.',NULL,NULL),(97,'Qatar','Rials','QAR','﷼',',','.',NULL,NULL),(98,'Romania','New Lei','RO','lei',',','.',NULL,NULL),(99,'Russia','Rubles','RUB','руб',',','.',NULL,NULL),(100,'Saint Helena','Pounds','SHP','£',',','.',NULL,NULL),(101,'Saudi Arabia','Riyals','SAR','﷼',',','.',NULL,NULL),(102,'Serbia','Dinars','RSD','Дин.',',','.',NULL,NULL),(103,'Seychelles','Rupees','SCR','₨',',','.',NULL,NULL),(104,'Singapore','Dollars','SGD','$',',','.',NULL,NULL),(105,'Slovenia','Euro','EUR','€','.',',',NULL,NULL),(106,'Solomon Islands','Dollars','SBD','$',',','.',NULL,NULL),(107,'Somalia','Shillings','SOS','S',',','.',NULL,NULL),(108,'South Africa','Rand','ZAR','R',',','.',NULL,NULL),(109,'South Korea','Won','KRW','₩',',','.',NULL,NULL),(110,'Spain','Euro','EUR','€','.',',',NULL,NULL),(111,'Sri Lanka','Rupees','LKR','₨',',','.',NULL,NULL),(112,'Sweden','Kronor','SEK','kr',',','.',NULL,NULL),(113,'Switzerland','Francs','CHF','CHF',',','.',NULL,NULL),(114,'Suriname','Dollars','SRD','$',',','.',NULL,NULL),(115,'Syria','Pounds','SYP','£',',','.',NULL,NULL),(116,'Taiwan','New Dollars','TWD','NT$',',','.',NULL,NULL),(117,'Thailand','Baht','THB','฿',',','.',NULL,NULL),(118,'Trinidad and Tobago','Dollars','TTD','TT$',',','.',NULL,NULL),(119,'Turkey','Lira','TRY','TL',',','.',NULL,NULL),(120,'Turkey','Liras','TRL','£',',','.',NULL,NULL),(121,'Tuvalu','Dollars','TVD','$',',','.',NULL,NULL),(122,'Ukraine','Hryvnia','UAH','₴',',','.',NULL,NULL),(123,'United Kingdom','Pounds','GBP','£',',','.',NULL,NULL),(124,'United States of America','Dollars','USD','$',',','.',NULL,NULL),(125,'Uruguay','Pesos','UYU','$U',',','.',NULL,NULL),(126,'Uzbekistan','Sums','UZS','лв',',','.',NULL,NULL),(127,'Vatican City','Euro','EUR','€','.',',',NULL,NULL),(128,'Venezuela','Bolivares Fuertes','VEF','Bs',',','.',NULL,NULL),(129,'Vietnam','Dong','VND','₫',',','.',NULL,NULL),(130,'Yemen','Rials','YER','﷼',',','.',NULL,NULL),(131,'Zimbabwe','Zimbabwe Dollars','ZWD','Z$',',','.',NULL,NULL),(132,'Iraq','Iraqi dinar','IQD','د.ع',',','.',NULL,NULL),(133,'Kenya','Kenyan shilling','KES','KSh',',','.',NULL,NULL),(134,'Bangladesh','Taka','BDT','৳',',','.',NULL,NULL),(135,'Algerie','Algerian dinar','DZD','د.ج',' ','.',NULL,NULL),(136,'United Arab Emirates','United Arab Emirates dirham','AED','د.إ',',','.',NULL,NULL),(137,'Uganda','Uganda shillings','UGX','USh',',','.',NULL,NULL),(138,'Tanzania','Tanzanian shilling','TZS','TSh',',','.',NULL,NULL),(139,'Angola','Kwanza','AOA','Kz',',','.',NULL,NULL),(140,'Kuwait','Kuwaiti dinar','KWD','KD',',','.',NULL,NULL),(141,'Bahrain','Bahraini dinar','BHD','BD',',','.',NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_packages`
--

DROP TABLE IF EXISTS `custom_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `business_id` int(11) DEFAULT NULL,
  `sale_product` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_packages`
--

LOCK TABLES `custom_packages` WRITE;
/*!40000 ALTER TABLE `custom_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(5,2) NOT NULL,
  `price_calculation_type` varchar(191) DEFAULT 'percentage',
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_groups_business_id_foreign` (`business_id`),
  KEY `customer_groups_created_by_index` (`created_by`),
  KEY `customer_groups_price_calculation_type_index` (`price_calculation_type`),
  KEY `customer_groups_selling_price_group_id_index` (`selling_price_group_id`),
  CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_configurations`
--

DROP TABLE IF EXISTS `dashboard_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_configurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `color` varchar(191) NOT NULL,
  `configuration` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_configurations_business_id_foreign` (`business_id`),
  CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_configurations`
--

LOCK TABLES `dashboard_configurations` WRITE;
/*!40000 ALTER TABLE `dashboard_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_variations`
--

DROP TABLE IF EXISTS `discount_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_variations` (
  `discount_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  KEY `discount_variations_discount_id_index` (`discount_id`),
  KEY `discount_variations_variation_id_index` (`variation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_variations`
--

LOCK TABLES `discount_variations` WRITE;
/*!40000 ALTER TABLE `discount_variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `spg` varchar(100) DEFAULT NULL COMMENT 'Applicable in specified selling price group only. Use of applicable_in_spg column is discontinued',
  `applicable_in_cg` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discounts_business_id_index` (`business_id`),
  KEY `discounts_brand_id_index` (`brand_id`),
  KEY `discounts_category_id_index` (`category_id`),
  KEY `discounts_location_id_index` (`location_id`),
  KEY `discounts_priority_index` (`priority`),
  KEY `discounts_spg_index` (`spg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_and_notes`
--

DROP TABLE IF EXISTS `document_and_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_and_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) NOT NULL,
  `heading` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_and_notes_business_id_index` (`business_id`),
  KEY `document_and_notes_notable_id_index` (`notable_id`),
  KEY `document_and_notes_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_and_notes`
--

LOCK TABLES `document_and_notes` WRITE;
/*!40000 ALTER TABLE `document_and_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_and_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_allowances_and_deductions`
--

DROP TABLE IF EXISTS `essentials_allowances_and_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_allowances_and_deductions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `description` varchar(191) NOT NULL,
  `type` enum('allowance','deduction') NOT NULL,
  `amount` decimal(22,4) NOT NULL,
  `amount_type` enum('fixed','percent') NOT NULL,
  `applicable_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_allowances_and_deductions_business_id_index` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_allowances_and_deductions`
--

LOCK TABLES `essentials_allowances_and_deductions` WRITE;
/*!40000 ALTER TABLE `essentials_allowances_and_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_allowances_and_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_attendances`
--

DROP TABLE IF EXISTS `essentials_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_attendances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `clock_in_time` datetime DEFAULT NULL,
  `clock_out_time` datetime DEFAULT NULL,
  `essentials_shift_id` int(11) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `clock_in_note` text DEFAULT NULL,
  `clock_out_note` text DEFAULT NULL,
  `clock_in_location` text DEFAULT NULL,
  `clock_out_location` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_attendances_user_id_index` (`user_id`),
  KEY `essentials_attendances_business_id_index` (`business_id`),
  KEY `essentials_attendances_essentials_shift_id_index` (`essentials_shift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_attendances`
--

LOCK TABLES `essentials_attendances` WRITE;
/*!40000 ALTER TABLE `essentials_attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_document_shares`
--

DROP TABLE IF EXISTS `essentials_document_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_document_shares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `value_type` enum('user','role') NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_document_shares_document_id_index` (`document_id`),
  KEY `essentials_document_shares_value_type_index` (`value_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_document_shares`
--

LOCK TABLES `essentials_document_shares` WRITE;
/*!40000 ALTER TABLE `essentials_document_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_document_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_documents`
--

DROP TABLE IF EXISTS `essentials_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_documents`
--

LOCK TABLES `essentials_documents` WRITE;
/*!40000 ALTER TABLE `essentials_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_holidays`
--

DROP TABLE IF EXISTS `essentials_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `business_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_holidays_business_id_index` (`business_id`),
  KEY `essentials_holidays_location_id_index` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_holidays`
--

LOCK TABLES `essentials_holidays` WRITE;
/*!40000 ALTER TABLE `essentials_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_kb`
--

DROP TABLE IF EXISTS `essentials_kb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_kb` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint(20) unsigned NOT NULL,
  `title` varchar(191) NOT NULL,
  `content` longtext DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `kb_type` varchar(191) NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT 'id from essentials_kb table',
  `share_with` varchar(191) DEFAULT NULL COMMENT 'public, private, only_with',
  `created_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_kb_business_id_index` (`business_id`),
  KEY `essentials_kb_parent_id_index` (`parent_id`),
  KEY `essentials_kb_created_by_index` (`created_by`),
  CONSTRAINT `essentials_kb_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `essentials_kb` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_kb`
--

LOCK TABLES `essentials_kb` WRITE;
/*!40000 ALTER TABLE `essentials_kb` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_kb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_kb_users`
--

DROP TABLE IF EXISTS `essentials_kb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_kb_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kb_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_kb_users_kb_id_index` (`kb_id`),
  KEY `essentials_kb_users_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_kb_users`
--

LOCK TABLES `essentials_kb_users` WRITE;
/*!40000 ALTER TABLE `essentials_kb_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_kb_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_leave_types`
--

DROP TABLE IF EXISTS `essentials_leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_leave_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(191) NOT NULL,
  `max_leave_count` int(11) DEFAULT NULL,
  `leave_count_interval` enum('month','year') DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_leave_types_business_id_index` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_leave_types`
--

LOCK TABLES `essentials_leave_types` WRITE;
/*!40000 ALTER TABLE `essentials_leave_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_leaves`
--

DROP TABLE IF EXISTS `essentials_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_leaves` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `essentials_leave_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `ref_no` varchar(191) DEFAULT NULL,
  `status` enum('pending','approved','cancelled') DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_leaves_essentials_leave_type_id_index` (`essentials_leave_type_id`),
  KEY `essentials_leaves_business_id_index` (`business_id`),
  KEY `essentials_leaves_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_leaves`
--

LOCK TABLES `essentials_leaves` WRITE;
/*!40000 ALTER TABLE `essentials_leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_messages`
--

DROP TABLE IF EXISTS `essentials_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_messages_business_id_index` (`business_id`),
  KEY `essentials_messages_user_id_index` (`user_id`),
  KEY `essentials_messages_location_id_index` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_messages`
--

LOCK TABLES `essentials_messages` WRITE;
/*!40000 ALTER TABLE `essentials_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_payroll_group_transactions`
--

DROP TABLE IF EXISTS `essentials_payroll_group_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_payroll_group_transactions` (
  `payroll_group_id` bigint(20) unsigned NOT NULL,
  `transaction_id` int(11) NOT NULL,
  KEY `essentials_payroll_group_transactions_payroll_group_id_foreign` (`payroll_group_id`),
  CONSTRAINT `essentials_payroll_group_transactions_payroll_group_id_foreign` FOREIGN KEY (`payroll_group_id`) REFERENCES `essentials_payroll_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_payroll_group_transactions`
--

LOCK TABLES `essentials_payroll_group_transactions` WRITE;
/*!40000 ALTER TABLE `essentials_payroll_group_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_payroll_group_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_payroll_groups`
--

DROP TABLE IF EXISTS `essentials_payroll_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_payroll_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL COMMENT 'payroll for work location',
  `name` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `payment_status` varchar(191) NOT NULL DEFAULT 'due',
  `gross_total` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_payroll_groups`
--

LOCK TABLES `essentials_payroll_groups` WRITE;
/*!40000 ALTER TABLE `essentials_payroll_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_payroll_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_reminders`
--

DROP TABLE IF EXISTS `essentials_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  `repeat` enum('one_time','every_day','every_week','every_month') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_reminders_business_id_index` (`business_id`),
  KEY `essentials_reminders_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_reminders`
--

LOCK TABLES `essentials_reminders` WRITE;
/*!40000 ALTER TABLE `essentials_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_shifts`
--

DROP TABLE IF EXISTS `essentials_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_shifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `type` enum('fixed_shift','flexible_shift') NOT NULL DEFAULT 'fixed_shift',
  `business_id` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `is_allowed_auto_clockout` tinyint(1) NOT NULL DEFAULT 0,
  `auto_clockout_time` time DEFAULT NULL,
  `holidays` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_shifts_type_index` (`type`),
  KEY `essentials_shifts_business_id_index` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_shifts`
--

LOCK TABLES `essentials_shifts` WRITE;
/*!40000 ALTER TABLE `essentials_shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_to_dos`
--

DROP TABLE IF EXISTS `essentials_to_dos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_to_dos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `task` text NOT NULL,
  `date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `task_id` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `estimated_hours` varchar(191) DEFAULT NULL,
  `priority` varchar(191) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_to_dos_status_index` (`status`),
  KEY `essentials_to_dos_priority_index` (`priority`),
  KEY `essentials_to_dos_created_by_index` (`created_by`),
  KEY `essentials_to_dos_business_id_index` (`business_id`),
  KEY `essentials_to_dos_task_id_index` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_to_dos`
--

LOCK TABLES `essentials_to_dos` WRITE;
/*!40000 ALTER TABLE `essentials_to_dos` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_to_dos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_todo_comments`
--

DROP TABLE IF EXISTS `essentials_todo_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_todo_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `task_id` int(11) NOT NULL,
  `comment_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_todo_comments_task_id_index` (`task_id`),
  KEY `essentials_todo_comments_comment_by_index` (`comment_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_todo_comments`
--

LOCK TABLES `essentials_todo_comments` WRITE;
/*!40000 ALTER TABLE `essentials_todo_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_todo_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_todos_users`
--

DROP TABLE IF EXISTS `essentials_todos_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_todos_users` (
  `todo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_todos_users`
--

LOCK TABLES `essentials_todos_users` WRITE;
/*!40000 ALTER TABLE `essentials_todos_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_todos_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_user_allowance_and_deductions`
--

DROP TABLE IF EXISTS `essentials_user_allowance_and_deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_user_allowance_and_deductions` (
  `user_id` int(11) NOT NULL,
  `allowance_deduction_id` int(11) NOT NULL,
  KEY `essentials_user_allowance_and_deductions_user_id_index` (`user_id`),
  KEY `allow_deduct_index` (`allowance_deduction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_user_allowance_and_deductions`
--

LOCK TABLES `essentials_user_allowance_and_deductions` WRITE;
/*!40000 ALTER TABLE `essentials_user_allowance_and_deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_user_allowance_and_deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_user_sales_targets`
--

DROP TABLE IF EXISTS `essentials_user_sales_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_user_sales_targets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `target_start` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `target_end` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `commission_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_user_sales_targets`
--

LOCK TABLES `essentials_user_sales_targets` WRITE;
/*!40000 ALTER TABLE `essentials_user_sales_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_user_sales_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essentials_user_shifts`
--

DROP TABLE IF EXISTS `essentials_user_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essentials_user_shifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `essentials_shift_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `essentials_user_shifts_user_id_index` (`user_id`),
  KEY `essentials_user_shifts_essentials_shift_id_index` (`essentials_shift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essentials_user_shifts`
--

LOCK TABLES `essentials_user_shifts` WRITE;
/*!40000 ALTER TABLE `essentials_user_shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `essentials_user_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_categories_business_id_foreign` (`business_id`),
  CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_categories`
--

LOCK TABLES `expense_categories` WRITE;
/*!40000 ALTER TABLE `expense_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_sub_taxes`
--

DROP TABLE IF EXISTS `group_sub_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) unsigned NOT NULL,
  `tax_id` int(10) unsigned NOT NULL,
  KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  KEY `group_sub_taxes_tax_id_foreign` (`tax_id`),
  CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_sub_taxes`
--

LOCK TABLES `group_sub_taxes` WRITE;
/*!40000 ALTER TABLE `group_sub_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_sub_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_layouts`
--

DROP TABLE IF EXISTS `invoice_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `header_text` text DEFAULT NULL,
  `invoice_no_prefix` varchar(191) DEFAULT NULL,
  `quotation_no_prefix` varchar(191) DEFAULT NULL,
  `invoice_heading` varchar(191) DEFAULT NULL,
  `sub_heading_line1` varchar(191) DEFAULT NULL,
  `sub_heading_line2` varchar(191) DEFAULT NULL,
  `sub_heading_line3` varchar(191) DEFAULT NULL,
  `sub_heading_line4` varchar(191) DEFAULT NULL,
  `sub_heading_line5` varchar(191) DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) DEFAULT NULL,
  `invoice_heading_paid` varchar(191) DEFAULT NULL,
  `quotation_heading` varchar(191) DEFAULT NULL,
  `sub_total_label` varchar(191) DEFAULT NULL,
  `discount_label` varchar(191) DEFAULT NULL,
  `tax_label` varchar(191) DEFAULT NULL,
  `total_label` varchar(191) DEFAULT NULL,
  `round_off_label` varchar(191) DEFAULT NULL,
  `total_due_label` varchar(191) DEFAULT NULL,
  `paid_label` varchar(191) DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT 0,
  `client_id_label` varchar(191) DEFAULT NULL,
  `client_tax_label` varchar(191) DEFAULT NULL,
  `date_label` varchar(191) DEFAULT NULL,
  `date_time_format` varchar(191) DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT 1,
  `show_brand` tinyint(1) NOT NULL DEFAULT 0,
  `show_sku` tinyint(1) NOT NULL DEFAULT 1,
  `show_cat_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `show_lot` tinyint(1) NOT NULL DEFAULT 0,
  `show_image` tinyint(1) NOT NULL DEFAULT 0,
  `show_sale_description` tinyint(1) NOT NULL DEFAULT 0,
  `sales_person_label` varchar(191) DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT 0,
  `table_product_label` varchar(191) DEFAULT NULL,
  `table_qty_label` varchar(191) DEFAULT NULL,
  `table_unit_price_label` varchar(191) DEFAULT NULL,
  `table_subtotal_label` varchar(191) DEFAULT NULL,
  `cat_code_label` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_business_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_location_name` tinyint(1) NOT NULL DEFAULT 1,
  `show_landmark` tinyint(1) NOT NULL DEFAULT 1,
  `show_city` tinyint(1) NOT NULL DEFAULT 1,
  `show_state` tinyint(1) NOT NULL DEFAULT 1,
  `show_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_country` tinyint(1) NOT NULL DEFAULT 1,
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT 1,
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT 0,
  `show_email` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax_1` tinyint(1) NOT NULL DEFAULT 1,
  `show_tax_2` tinyint(1) NOT NULL DEFAULT 0,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `show_payments` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_label` varchar(191) DEFAULT NULL,
  `commission_agent_label` varchar(191) DEFAULT NULL,
  `show_commission_agent` tinyint(1) NOT NULL DEFAULT 0,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT 0,
  `highlight_color` varchar(10) DEFAULT NULL,
  `footer_text` text DEFAULT NULL,
  `module_info` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int(10) unsigned NOT NULL,
  `show_qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `qr_code_fields` text DEFAULT NULL,
  `design` varchar(190) DEFAULT 'classic',
  `cn_heading` varchar(191) DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) DEFAULT NULL,
  `cn_amount_label` varchar(191) DEFAULT NULL,
  `table_tax_headings` text DEFAULT NULL,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT 0,
  `prev_bal_label` varchar(191) DEFAULT NULL,
  `change_return_label` varchar(191) DEFAULT NULL,
  `product_custom_fields` text DEFAULT NULL,
  `contact_custom_fields` text DEFAULT NULL,
  `location_custom_fields` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_layouts_business_id_foreign` (`business_id`),
  CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_layouts`
--

LOCK TABLES `invoice_layouts` WRITE;
/*!40000 ALTER TABLE `invoice_layouts` DISABLE KEYS */;
INSERT INTO `invoice_layouts` VALUES (1,'Default',NULL,'Invoice No.',NULL,'Invoice',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Subtotal','Discount','Tax','Total',NULL,'Total Due','Total Paid',0,NULL,NULL,'Date',NULL,1,0,1,1,0,0,0,0,NULL,0,'Product','Quantity','Unit Price','Subtotal',NULL,NULL,0,0,1,1,1,1,1,1,1,0,0,1,0,0,1,1,'Customer',NULL,0,0,'#000000',NULL,NULL,'{\"proforma_heading\":null,\"sales_order_heading\":null,\"due_date_label\":null,\"total_quantity_label\":null,\"item_discount_label\":null,\"discounted_unit_price_label\":null,\"total_items_label\":null,\"num_to_word_format\":\"international\",\"tax_summary_label\":null}',1,1,0,NULL,'classic',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2023-08-11 13:03:45','2023-08-24 22:23:12'),(10,'Default','<p style=\"text-align: center;\">Unit 101<br />Harbour Bridge Mall<br />Bagotstown<br />East Bank Demerara<br />Guyana, South America.<br /><br /></p>','Invoice No.',NULL,'INVOICE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'QUOTATION','Subtotal','Discount','Tax','Total','Rounding','Total Due','Total Paid',0,NULL,NULL,'Date',NULL,1,0,1,1,0,0,0,0,'Sales Rep',0,'Product Code','Quantity','Unit Price','Subtotal',NULL,'1706808895_WhatsApp_Image_2023-10-24_at_2.27.09_PM-removebg-preview.png',1,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,'Customer',NULL,0,0,'#000000','<p style=\"text-align: center;\"><strong>TRACPARTS - Your Authorised DT Spare Parts (Germany) Distribution Partner in Guyana</strong></p>',NULL,'{\"proforma_heading\":\"PROFORMA INVOICE\",\"sales_order_heading\":null,\"due_date_label\":\"Due Date\",\"total_quantity_label\":null,\"item_discount_label\":null,\"discounted_unit_price_label\":null,\"total_items_label\":\"QTY Total\",\"show_total_in_words\":\"1\",\"num_to_word_format\":\"international\",\"tax_summary_label\":null}',1,7,0,NULL,'classic',NULL,NULL,NULL,NULL,0,NULL,'Change Return',NULL,NULL,NULL,'2024-02-01 12:31:07','2024-02-01 12:34:55');
/*!40000 ALTER TABLE `invoice_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_schemes`
--

DROP TABLE IF EXISTS `invoice_schemes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_schemes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `scheme_type` enum('blank','year') NOT NULL,
  `prefix` varchar(191) DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT 0,
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_schemes_business_id_foreign` (`business_id`),
  KEY `invoice_schemes_scheme_type_index` (`scheme_type`),
  CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_schemes`
--

LOCK TABLES `invoice_schemes` WRITE;
/*!40000 ALTER TABLE `invoice_schemes` DISABLE KEYS */;
INSERT INTO `invoice_schemes` VALUES (1,1,'Default','blank','',1,2,4,1,'2023-08-11 13:03:45','2024-01-21 06:29:38'),(10,7,'Default','blank','EBD-',0,2,6,1,'2024-02-01 12:31:07','2024-02-01 12:52:32');
/*!40000 ALTER TABLE `invoice_schemes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) NOT NULL,
  `woocommerce_media_id` int(11) DEFAULT NULL,
  `model_media_type` varchar(191) DEFAULT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_business_id_index` (`business_id`),
  KEY `media_uploaded_by_index` (`uploaded_by`),
  KEY `media_woocommerce_media_id_index` (`woocommerce_media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,4,'1693418137_766294834_WhatsApp_Image_2023-08-30_at_1.53.07_PM-removebg-preview.png',NULL,4,'App\\User',NULL,NULL,4,'2023-08-30 12:55:37','2023-08-30 12:55:37');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfg_ingredient_groups`
--

DROP TABLE IF EXISTS `mfg_ingredient_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mfg_ingredient_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfg_ingredient_groups`
--

LOCK TABLES `mfg_ingredient_groups` WRITE;
/*!40000 ALTER TABLE `mfg_ingredient_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfg_ingredient_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfg_recipe_ingredients`
--

DROP TABLE IF EXISTS `mfg_recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mfg_recipe_ingredients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mfg_recipe_id` int(10) unsigned NOT NULL,
  `variation_id` int(11) NOT NULL,
  `mfg_ingredient_group_id` int(11) DEFAULT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `waste_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `sub_unit_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mfg_recipe_ingredients_mfg_recipe_id_foreign` (`mfg_recipe_id`),
  CONSTRAINT `mfg_recipe_ingredients_mfg_recipe_id_foreign` FOREIGN KEY (`mfg_recipe_id`) REFERENCES `mfg_recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfg_recipe_ingredients`
--

LOCK TABLES `mfg_recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `mfg_recipe_ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfg_recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfg_recipes`
--

DROP TABLE IF EXISTS `mfg_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mfg_recipes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  `instructions` text DEFAULT NULL,
  `waste_percent` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ingredients_cost` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `extra_cost` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `final_price` decimal(22,4) NOT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mfg_recipes_product_id_index` (`product_id`),
  KEY `mfg_recipes_variation_id_index` (`variation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfg_recipes`
--

LOCK TABLES `mfg_recipes` WRITE;
/*!40000 ALTER TABLE `mfg_recipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfg_recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2017_07_05_071953_create_currencies_table',1),(9,'2017_07_05_073658_create_business_table',1),(10,'2017_07_22_075923_add_business_id_users_table',1),(11,'2017_07_23_113209_create_brands_table',1),(12,'2017_07_26_083429_create_permission_tables',1),(13,'2017_07_26_110000_create_tax_rates_table',1),(14,'2017_07_26_122313_create_units_table',1),(15,'2017_07_27_075706_create_contacts_table',1),(16,'2017_08_04_071038_create_categories_table',1),(17,'2017_08_08_115903_create_products_table',1),(18,'2017_08_09_061616_create_variation_templates_table',1),(19,'2017_08_09_061638_create_variation_value_templates_table',1),(20,'2017_08_10_061146_create_product_variations_table',1),(21,'2017_08_10_061216_create_variations_table',1),(22,'2017_08_19_054827_create_transactions_table',1),(23,'2017_08_31_073533_create_purchase_lines_table',1),(24,'2017_10_15_064638_create_transaction_payments_table',1),(25,'2017_10_31_065621_add_default_sales_tax_to_business_table',1),(26,'2017_11_20_051930_create_table_group_sub_taxes',1),(27,'2017_11_20_063603_create_transaction_sell_lines',1),(28,'2017_11_21_064540_create_barcodes_table',1),(29,'2017_11_23_181237_create_invoice_schemes_table',1),(30,'2017_12_25_122822_create_business_locations_table',1),(31,'2017_12_25_160253_add_location_id_to_transactions_table',1),(32,'2017_12_25_163227_create_variation_location_details_table',1),(33,'2018_01_04_115627_create_sessions_table',1),(34,'2018_01_05_112817_create_invoice_layouts_table',1),(35,'2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations',1),(36,'2018_01_08_104124_create_expense_categories_table',1),(37,'2018_01_08_123327_modify_transactions_table_for_expenses',1),(38,'2018_01_09_111005_modify_payment_status_in_transactions_table',1),(39,'2018_01_09_111109_add_paid_on_column_to_transaction_payments_table',1),(40,'2018_01_25_172439_add_printer_related_fields_to_business_locations_table',1),(41,'2018_01_27_184322_create_printers_table',1),(42,'2018_01_30_181442_create_cash_registers_table',1),(43,'2018_01_31_125836_create_cash_register_transactions_table',1),(44,'2018_02_07_173326_modify_business_table',1),(45,'2018_02_08_105425_add_enable_product_expiry_column_to_business_table',1),(46,'2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table',1),(47,'2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table',1),(48,'2018_02_08_155348_add_exchange_rate_to_transactions_table',1),(49,'2018_02_09_124945_modify_transaction_payments_table_for_contact_payments',1),(50,'2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table',1),(51,'2018_02_12_114605_add_quantity_sold_in_purchase_lines_table',1),(52,'2018_02_13_183323_alter_decimal_fields_size',1),(53,'2018_02_14_161928_add_transaction_edit_days_to_business_table',1),(54,'2018_02_15_161032_add_document_column_to_transactions_table',1),(55,'2018_02_17_124709_add_more_options_to_invoice_layouts',1),(56,'2018_02_19_111517_add_keyboard_shortcut_column_to_business_table',1),(57,'2018_02_19_121537_stock_adjustment_move_to_transaction_table',1),(58,'2018_02_20_165505_add_is_direct_sale_column_to_transactions_table',1),(59,'2018_02_21_105329_create_system_table',1),(60,'2018_02_23_100549_version_1_2',1),(61,'2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table',1),(62,'2018_02_26_103612_add_sales_commission_agent_column_to_business_table',1),(63,'2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt',1),(64,'2018_02_26_134500_add_commission_agent_to_transactions_table',1),(65,'2018_02_27_121422_add_item_addition_method_to_business_table',1),(66,'2018_02_27_170232_modify_transactions_table_for_stock_transfer',1),(67,'2018_03_05_153510_add_enable_inline_tax_column_to_business_table',1),(68,'2018_03_06_210206_modify_product_barcode_types',1),(69,'2018_03_13_181541_add_expiry_type_to_business_table',1),(70,'2018_03_16_113446_product_expiry_setting_for_business',1),(71,'2018_03_19_113601_add_business_settings_options',1),(72,'2018_03_26_125334_add_pos_settings_to_business_table',1),(73,'2018_03_26_165350_create_customer_groups_table',1),(74,'2018_03_27_122720_customer_group_related_changes_in_tables',1),(75,'2018_03_29_110138_change_tax_field_to_nullable_in_business_table',1),(76,'2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table',1),(77,'2018_03_29_134340_add_inline_discount_fields_in_purchase_lines',1),(78,'2018_03_31_140921_update_transactions_table_exchange_rate',1),(79,'2018_04_03_103037_add_contact_id_to_contacts_table',1),(80,'2018_04_03_122709_add_changes_to_invoice_layouts_table',1),(81,'2018_04_09_135320_change_exchage_rate_size_in_business_table',1),(82,'2018_04_17_123122_add_lot_number_to_business',1),(83,'2018_04_17_160845_add_product_racks_table',1),(84,'2018_04_20_182015_create_res_tables_table',1),(85,'2018_04_24_105246_restaurant_fields_in_transaction_table',1),(86,'2018_04_24_114149_add_enabled_modules_business_table',1),(87,'2018_04_24_133704_add_modules_fields_in_invoice_layout_table',1),(88,'2018_04_27_132653_quotation_related_change',1),(89,'2018_05_02_104439_add_date_format_and_time_format_to_business',1),(90,'2018_05_02_111939_add_sell_return_to_transaction_payments',1),(91,'2018_05_14_114027_add_rows_positions_for_products',1),(92,'2018_05_14_125223_add_weight_to_products_table',1),(93,'2018_05_14_164754_add_opening_stock_permission',1),(94,'2018_05_15_134729_add_design_to_invoice_layouts',1),(95,'2018_05_16_183307_add_tax_fields_invoice_layout',1),(96,'2018_05_18_191956_add_sell_return_to_transaction_table',1),(97,'2018_05_21_131349_add_custom_fileds_to_contacts_table',1),(98,'2018_05_21_131607_invoice_layout_fields_for_sell_return',1),(99,'2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table',1),(100,'2018_05_22_123527_create_reference_counts_table',1),(101,'2018_05_22_154540_add_ref_no_prefixes_column_to_business_table',1),(102,'2018_05_24_132620_add_ref_no_column_to_transaction_payments_table',1),(103,'2018_05_24_161026_add_location_id_column_to_business_location_table',1),(104,'2018_05_25_180603_create_modifiers_related_table',1),(105,'2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table',1),(106,'2018_05_31_114645_add_res_order_status_column_to_transactions_table',1),(107,'2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table',1),(108,'2018_06_05_111905_modify_products_table_for_modifiers',1),(109,'2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table',1),(110,'2018_06_07_152443_add_is_service_staff_to_roles_table',1),(111,'2018_06_07_182258_add_image_field_to_products_table',1),(112,'2018_06_13_133705_create_bookings_table',1),(113,'2018_06_15_173636_add_email_column_to_contacts_table',1),(114,'2018_06_27_182835_add_superadmin_related_fields_business',1),(115,'2018_07_10_101913_add_custom_fields_to_products_table',1),(116,'2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table',1),(117,'2018_07_17_163920_add_theme_skin_color_column_to_business_table',1),(118,'2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table',1),(119,'2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table',1),(120,'2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table',1),(121,'2018_07_26_124720_change_design_column_type_in_invoice_layouts_table',1),(122,'2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table',1),(123,'2018_07_28_103614_add_credit_limit_column_to_contacts_table',1),(124,'2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table',1),(125,'2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods',1),(126,'2018_08_14_104036_add_opening_balance_type_to_transactions_table',1),(127,'2018_09_04_155900_create_accounts_table',1),(128,'2018_09_06_114438_create_selling_price_groups_table',1),(129,'2018_09_06_154057_create_variation_group_prices_table',1),(130,'2018_09_07_102413_add_permission_to_access_default_selling_price',1),(131,'2018_09_07_134858_add_selling_price_group_id_to_transactions_table',1),(132,'2018_09_10_112448_update_product_type_to_single_if_null_in_products_table',1),(133,'2018_09_10_152703_create_account_transactions_table',1),(134,'2018_09_10_173656_add_account_id_column_to_transaction_payments_table',1),(135,'2018_09_19_123914_create_notification_templates_table',1),(136,'2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table',1),(137,'2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table',1),(138,'2018_09_26_105557_add_transaction_payments_for_existing_expenses',1),(139,'2018_09_27_111609_modify_transactions_table_for_purchase_return',1),(140,'2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table',1),(141,'2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table',1),(142,'2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table',1),(143,'2018_10_03_185947_add_default_notification_templates_to_database',1),(144,'2018_10_09_153105_add_business_id_to_transaction_payments_table',1),(145,'2018_10_16_135229_create_permission_for_sells_and_purchase',1),(146,'2018_10_22_114441_add_columns_for_variable_product_modifications',1),(147,'2018_10_22_134428_modify_variable_product_data',1),(148,'2018_10_30_181558_add_table_tax_headings_to_invoice_layout',1),(149,'2018_10_31_122619_add_pay_terms_field_transactions_table',1),(150,'2018_10_31_161328_add_new_permissions_for_pos_screen',1),(151,'2018_10_31_174752_add_access_selected_contacts_only_to_users_table',1),(152,'2018_10_31_175627_add_user_contact_access',1),(153,'2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table',1),(154,'2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table',1),(155,'2018_11_08_105621_add_role_permissions',1),(156,'2018_11_26_114135_add_is_suspend_column_to_transactions_table',1),(157,'2018_11_28_104410_modify_units_table_for_multi_unit',1),(158,'2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines',1),(159,'2018_11_29_115918_add_primary_key_in_system_table',1),(160,'2018_12_03_185546_add_product_description_column_to_products_table',1),(161,'2018_12_06_114937_modify_system_table_and_users_table',1),(162,'2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table',1),(163,'2018_12_14_103307_modify_system_table',1),(164,'2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table',1),(165,'2018_12_18_170656_add_invoice_token_column_to_transaction_table',1),(166,'2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table',1),(167,'2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table',1),(168,'2018_12_24_154933_create_notifications_table',1),(169,'2019_01_08_112015_add_document_column_to_transaction_payments_table',1),(170,'2019_01_10_124645_add_account_permission',1),(171,'2019_01_16_125825_add_subscription_no_column_to_transactions_table',1),(172,'2019_01_28_111647_add_order_addresses_column_to_transactions_table',1),(173,'2019_02_13_173821_add_is_inactive_column_to_products_table',1),(174,'2019_02_19_103118_create_discounts_table',1),(175,'2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table',1),(176,'2019_02_21_134324_add_permission_for_discount',1),(177,'2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table',1),(178,'2019_03_09_102425_add_sub_type_column_to_transactions_table',1),(179,'2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table',1),(180,'2019_03_12_120336_create_activity_log_table',1),(181,'2019_03_15_132925_create_media_table',1),(182,'2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table',1),(183,'2019_05_10_132311_add_missing_column_indexing',1),(184,'2019_05_14_091812_add_show_image_column_to_invoice_layouts_table',1),(185,'2019_05_25_104922_add_view_purchase_price_permission',1),(186,'2019_06_17_103515_add_profile_informations_columns_to_users_table',1),(187,'2019_06_18_135524_add_permission_to_view_own_sales_only',1),(188,'2019_06_19_112058_add_database_changes_for_reward_points',1),(189,'2019_06_28_133732_change_type_column_to_string_in_transactions_table',1),(190,'2019_07_13_111420_add_is_created_from_api_column_to_transactions_table',1),(191,'2019_07_15_165136_add_fields_for_combo_product',1),(192,'2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table',1),(193,'2019_07_22_152649_add_not_for_selling_in_product_table',1),(194,'2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table',1),(195,'2019_08_08_162302_add_sub_units_related_fields',1),(196,'2019_08_26_133419_update_price_fields_decimal_point',1),(197,'2019_09_02_160054_remove_location_permissions_from_roles',1),(198,'2019_09_03_185259_add_permission_for_pos_screen',1),(199,'2019_09_04_163141_add_location_id_to_cash_registers_table',1),(200,'2019_09_04_184008_create_types_of_services_table',1),(201,'2019_09_06_131445_add_types_of_service_fields_to_transactions_table',1),(202,'2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table',1),(203,'2019_09_12_105616_create_product_locations_table',1),(204,'2019_09_17_122522_add_custom_labels_column_to_business_table',1),(205,'2019_09_18_164319_add_shipping_fields_to_transactions_table',1),(206,'2019_09_19_170927_close_all_active_registers',1),(207,'2019_09_23_161906_add_media_description_cloumn_to_media_table',1),(208,'2019_10_18_155633_create_account_types_table',1),(209,'2019_10_22_163335_add_common_settings_column_to_business_table',1),(210,'2019_10_29_132521_add_update_purchase_status_permission',1),(211,'2019_11_09_110522_add_indexing_to_lot_number',1),(212,'2019_11_19_170824_add_is_active_column_to_business_locations_table',1),(213,'2019_11_21_162913_change_quantity_field_types_to_decimal',1),(214,'2019_11_25_160340_modify_categories_table_for_polymerphic_relationship',1),(215,'2019_12_02_105025_create_warranties_table',1),(216,'2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table',1),(217,'2019_12_05_183955_add_more_fields_to_users_table',1),(218,'2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table',1),(219,'2019_12_11_121307_add_draft_and_quotation_list_permissions',1),(220,'2019_12_12_180126_copy_expense_total_to_total_before_tax',1),(221,'2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table',1),(222,'2019_12_25_173413_create_dashboard_configurations_table',1),(223,'2020_01_08_133506_create_document_and_notes_table',1),(224,'2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table',1),(225,'2020_01_16_174818_add_round_off_amount_field_to_transactions_table',1),(226,'2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table',1),(227,'2020_02_18_172447_add_import_fields_to_transactions_table',1),(228,'2020_03_13_135844_add_is_active_column_to_selling_price_groups_table',1),(229,'2020_03_16_115449_add_contact_status_field_to_contacts_table',1),(230,'2020_03_26_124736_add_allow_login_column_in_users_table',1),(231,'2020_04_13_154150_add_feature_products_column_to_business_loactions',1),(232,'2020_04_15_151802_add_user_type_to_users_table',1),(233,'2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table',1),(234,'2020_04_28_111436_add_shipping_address_to_contacts_table',1),(235,'2020_06_01_094654_add_max_sale_discount_column_to_users_table',1),(236,'2020_06_12_162245_modify_contacts_table',1),(237,'2020_06_22_103104_change_recur_interval_default_to_one',1),(238,'2020_07_09_174621_add_balance_field_to_contacts_table',1),(239,'2020_07_23_104933_change_status_column_to_varchar_in_transaction_table',1),(240,'2020_09_07_171059_change_completed_stock_transfer_status_to_final',1),(241,'2020_09_21_123224_modify_booking_status_column_in_bookings_table',1),(242,'2020_09_22_121639_create_discount_variations_table',1),(243,'2020_10_05_121550_modify_business_location_table_for_invoice_layout',1),(244,'2020_10_16_175726_set_status_as_received_for_opening_stock',1),(245,'2020_10_23_170823_add_for_group_tax_column_to_tax_rates_table',1),(246,'2020_11_04_130940_add_more_custom_fields_to_contacts_table',1),(247,'2020_11_10_152841_add_cash_register_permissions',1),(248,'2020_11_17_164041_modify_type_column_to_varchar_in_contacts_table',1),(249,'2020_12_18_181447_add_shipping_custom_fields_to_transactions_table',1),(250,'2020_12_22_164303_add_sub_status_column_to_transactions_table',1),(251,'2020_12_24_153050_add_custom_fields_to_transactions_table',1),(252,'2020_12_28_105403_add_whatsapp_text_column_to_notification_templates_table',1),(253,'2020_12_29_165925_add_model_document_type_to_media_table',1),(254,'2021_02_08_175632_add_contact_number_fields_to_users_table',1),(255,'2021_02_11_172217_add_indexing_for_multiple_columns',1),(256,'2021_02_23_122043_add_more_columns_to_customer_groups_table',1),(257,'2021_02_24_175551_add_print_invoice_permission_to_all_roles',1),(258,'2021_03_03_162021_add_purchase_order_columns_to_purchase_lines_and_transactions_table',1),(259,'2021_03_11_120229_add_sales_order_columns',1),(260,'2021_03_16_120705_add_business_id_to_activity_log_table',1),(261,'2021_03_16_153427_add_code_columns_to_business_table',1),(262,'2021_03_18_173308_add_account_details_column_to_accounts_table',1),(263,'2021_03_18_183119_add_prefer_payment_account_columns_to_transactions_table',1),(264,'2021_03_22_120810_add_more_types_of_service_custom_fields',1),(265,'2021_03_24_183132_add_shipping_export_custom_field_details_to_contacts_table',1),(266,'2021_03_25_170715_add_export_custom_fields_info_to_transactions_table',1),(267,'2021_04_15_063449_add_denominations_column_to_cash_registers_table',1),(268,'2021_05_22_083426_add_indexing_to_account_transactions_table',1),(269,'2021_07_08_065808_add_additional_expense_columns_to_transaction_table',1),(270,'2021_07_13_082918_add_qr_code_columns_to_invoice_layouts_table',1),(271,'2021_07_21_061615_add_fields_to_show_commission_agent_in_invoice_layout',1),(272,'2021_08_13_105549_add_crm_contact_id_to_users_table',1),(273,'2021_08_25_114932_add_payment_link_fields_to_transaction_payments_table',1),(274,'2021_09_01_063110_add_spg_column_to_discounts_table',1),(275,'2021_09_03_061528_modify_cash_register_transactions_table',1),(276,'2021_10_05_061658_add_source_column_to_transactions_table',1),(277,'2021_12_16_121851_add_parent_id_column_to_expense_categories_table',1),(278,'2022_04_14_075120_add_payment_type_column_to_transaction_payments_table',1),(279,'2022_04_21_083327_create_cash_denominations_table',1),(280,'2022_05_10_055307_add_delivery_date_column_to_transactions_table',1),(281,'2022_06_13_123135_add_currency_precision_and_quantity_precision_fields_to_business_table',1),(282,'2022_06_28_133342_add_secondary_unit_columns_to_products_sell_line_purchase_lines_tables',1),(283,'2022_07_13_114307_create_purchase_requisition_related_columns',1),(284,'2022_08_25_132707_add_service_staff_timer_fields_to_products_and_users_table',1),(285,'2018_06_27_185405_create_packages_table',2),(286,'2018_06_28_182803_create_subscriptions_table',2),(287,'2018_07_17_182021_add_rows_to_system_table',2),(288,'2018_07_19_131721_add_options_to_packages_table',2),(289,'2018_08_17_155534_add_min_termination_alert_days',2),(290,'2018_08_28_105945_add_business_based_username_settings_to_system_table',2),(291,'2018_08_30_105906_add_superadmin_communicator_logs_table',2),(292,'2018_11_02_130636_add_custom_permissions_to_packages_table',2),(293,'2018_11_05_161848_add_more_fields_to_packages_table',2),(294,'2018_12_10_124621_modify_system_table_values_null_default',2),(295,'2019_05_10_135434_add_missing_database_column_indexes',2),(296,'2019_08_16_115300_create_superadmin_frontend_pages_table',2),(297,'2018_10_01_151252_create_documents_table',3),(298,'2018_10_02_151803_create_document_shares_table',3),(299,'2018_10_09_134558_create_reminders_table',3),(300,'2018_11_16_170756_create_to_dos_table',3),(301,'2019_02_22_120329_essentials_messages',3),(302,'2019_02_22_161513_add_message_permissions',3),(303,'2019_03_29_164339_add_essentials_version_to_system_table',3),(304,'2019_05_17_153306_create_essentials_leave_types_table',3),(305,'2019_05_17_175921_create_essentials_leaves_table',3),(306,'2019_05_21_154517_add_essentials_settings_columns_to_business_table',3),(307,'2019_05_21_181653_create_table_essentials_attendance',3),(308,'2019_05_30_110049_create_essentials_payrolls_table',3),(309,'2019_06_04_105723_create_essentials_holidays_table',3),(310,'2019_06_28_134217_add_payroll_columns_to_transactions_table',3),(311,'2019_08_26_103520_add_approve_leave_permission',3),(312,'2019_08_27_103724_create_essentials_allowance_and_deduction_table',3),(313,'2019_08_27_105236_create_essentials_user_allowances_and_deductions',3),(314,'2019_09_20_115906_add_more_columns_to_essentials_to_dos_table',3),(315,'2019_09_23_120439_create_essentials_todo_comments_table',3),(316,'2019_12_05_170724_add_hrm_columns_to_users_table',3),(317,'2019_12_09_105809_add_allowance_and_deductions_permission',3),(318,'2020_03_28_152838_create_essentials_shift_table',3),(319,'2020_03_30_162029_create_user_shifts_table',3),(320,'2020_03_31_134558_add_shift_id_to_attendance_table',3),(321,'2020_11_05_105157_modify_todos_date_column_type',3),(322,'2020_11_11_174852_add_end_time_column_to_essentials_reminders_table',3),(323,'2020_11_26_170527_create_essentials_kb_table',3),(324,'2020_11_30_112615_create_essentials_kb_users_table',3),(325,'2021_02_12_185514_add_clock_in_location_to_essentials_attendances_table',3),(326,'2021_02_16_190203_add_essentials_module_indexing',3),(327,'2021_02_27_133448_add_columns_to_users_table',3),(328,'2021_03_04_174857_create_payroll_groups_table',3),(329,'2021_03_04_175025_create_payroll_group_transactions_table',3),(330,'2021_03_09_123914_add_auto_clockout_to_essentials_shifts',3),(331,'2021_06_17_121451_add_location_id_to_table',3),(332,'2021_09_28_091541_create_essentials_user_sales_targets_table',3),(333,'2020_03_19_130231_add_contact_id_to_users_table',4),(334,'2020_03_27_133605_create_schedules_table',4),(335,'2020_03_27_133628_create_schedule_users_table',4),(336,'2020_03_30_112834_create_schedule_logs_table',4),(337,'2020_04_02_182331_add_crm_module_version_to_system_table',4),(338,'2020_04_08_153231_modify_cloumn_in_contacts_table',4),(339,'2020_04_09_101052_create_lead_users_table',4),(340,'2020_04_16_114747_create_crm_campaigns_table',4),(341,'2021_01_07_155757_add_followup_additional_info_column_to_crm_schedules_table',4),(342,'2021_02_02_140021_add_additional_info_to_crm_campaigns_table',4),(343,'2021_02_02_173651_add_new_columns_to_contacts_table',4),(344,'2021_02_04_120439_create_call_logs_table',4),(345,'2021_02_08_172047_add_mobile_name_column_to_crm_call_logs_table',4),(346,'2021_02_16_190038_add_crm_module_indexing',4),(347,'2021_02_19_120846_create_crm_followup_invoices',4),(348,'2021_02_22_132125_add_follow_up_by_to_crm_schedules_table',4),(349,'2021_03_24_160736_add_department_and_designation_to_users_table',4),(350,'2021_06_15_152924_create_proposal_templates_table',4),(351,'2021_06_16_114448_add_recursive_fields_to_crm_schedules_table',4),(352,'2021_06_16_125740_create_proposals_table',4),(353,'2021_09_24_065738_add_crm_settings_column_to_business_table',4),(354,'2020_09_29_184909_add_product_catalogue_version',5),(355,'2019_11_12_163135_create_projects_table',6),(356,'2019_11_12_164431_create_project_members_table',6),(357,'2019_11_14_112230_create_project_tasks_table',6),(358,'2019_11_14_112258_create_project_task_members_table',6),(359,'2019_11_18_154617_create_project_task_comments_table',6),(360,'2019_11_19_134807_create_project_time_logs_table',6),(361,'2019_12_11_102549_add_more_fields_in_transactions_table',6),(362,'2019_12_11_102735_create_invoice_lines_table',6),(363,'2020_01_07_172852_add_project_permissions',6),(364,'2020_01_08_115422_add_project_module_version_to_system_table',6),(365,'2020_07_10_114514_set_location_id_on_existing_invoice',6),(366,'2018_10_10_110400_add_module_version_to_system_table',7),(367,'2018_10_10_122845_add_woocommerce_api_settings_to_business_table',7),(368,'2018_10_10_162041_add_woocommerce_category_id_to_categories_table',7),(369,'2018_10_11_173839_create_woocommerce_sync_logs_table',7),(370,'2018_10_16_123522_add_woocommerce_tax_rate_id_column_to_tax_rates_table',7),(371,'2018_10_23_111555_add_woocommerce_attr_id_column_to_variation_templates_table',7),(372,'2018_12_03_163945_add_woocommerce_permissions',7),(373,'2019_02_18_154414_change_woocommerce_sync_logs_table',7),(374,'2019_04_19_174129_add_disable_woocommerce_sync_column_to_products_table',7),(375,'2019_06_08_132440_add_woocommerce_wh_oc_secret_column_to_business_table',7),(376,'2019_10_01_171828_add_woocommerce_media_id_columns',7),(377,'2020_09_07_124952_add_woocommerce_skipped_orders_fields_to_business_table',7),(378,'2021_02_16_190608_add_woocommerce_module_indexing',7),(379,'2019_07_15_114211_add_manufacturing_module_version_to_system_table',8),(380,'2019_07_15_114403_create_mfg_recipes_table',8),(381,'2019_07_18_180217_add_production_columns_to_transactions_table',8),(382,'2019_07_26_110753_add_manufacturing_settings_column_to_business_table',8),(383,'2019_07_26_170450_add_manufacturing_permissions',8),(384,'2019_08_08_110035_create_mfg_recipe_ingredients_table',8),(385,'2019_08_08_172837_add_recipe_add_edit_permissions',8),(386,'2019_08_12_114610_add_ingredient_waste_percent_columns',8),(387,'2019_11_05_115136_create_ingredient_groups_table',8),(388,'2020_02_22_120303_add_column_to_mfg_recipe_ingredients_table',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
INSERT INTO `model_has_permissions` VALUES (80,'App\\User',10),(80,'App\\User',11),(80,'App\\User',12),(104,'App\\User',7),(105,'App\\User',5),(105,'App\\User',6),(106,'App\\User',9),(107,'App\\User',8);
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\User',1),(18,'App\\User',15);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) NOT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `whatsapp_text` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `cc` varchar(191) DEFAULT NULL,
  `bcc` varchar(191) DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_templates`
--

LOCK TABLES `notification_templates` WRITE;
/*!40000 ALTER TABLE `notification_templates` DISABLE KEYS */;
INSERT INTO `notification_templates` VALUES (1,1,'new_sale','<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(2,1,'payment_received','<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>','Dear {contact_name}, We have received a payment of {received_amount}. {business_name}',NULL,'Payment Received, from {business_name}',NULL,NULL,0,0,0,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(3,1,'payment_reminder','<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}',NULL,'Payment Reminder, from {business_name}',NULL,NULL,0,0,0,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(4,1,'new_booking','<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}',NULL,'Booking Confirmed - {business_name}',NULL,NULL,0,0,0,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(5,1,'new_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}',NULL,'New Order, from {business_name}',NULL,NULL,0,0,0,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(6,1,'payment_paid','<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}',NULL,'Payment Paid, from {business_name}',NULL,NULL,0,0,0,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(7,1,'items_received','<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}',NULL,'Items received, from {business_name}',NULL,NULL,0,0,0,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(8,1,'items_pending','<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}',NULL,'Items Pending, from {business_name}',NULL,NULL,0,0,0,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(9,1,'new_quotation','<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(10,1,'purchase_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>','We have a new purchase order with reference number {order_ref_number}. {business_name}',NULL,'New Purchase Order, from {business_name}',NULL,NULL,0,0,0,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(11,2,'new_sale','<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-08-22 17:06:08','2023-08-22 17:06:08'),(12,2,'payment_received','<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>','Dear {contact_name}, We have received a payment of {received_amount}. {business_name}',NULL,'Payment Received, from {business_name}',NULL,NULL,0,0,0,'2023-08-22 17:06:08','2023-08-22 17:06:08'),(13,2,'payment_reminder','<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}',NULL,'Payment Reminder, from {business_name}',NULL,NULL,0,0,0,'2023-08-22 17:06:08','2023-08-22 17:06:08'),(14,2,'new_booking','<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}',NULL,'Booking Confirmed - {business_name}',NULL,NULL,0,0,0,'2023-08-22 17:06:08','2023-08-22 17:06:08'),(15,2,'new_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}',NULL,'New Order, from {business_name}',NULL,NULL,0,0,0,'2023-08-22 17:06:08','2023-08-22 17:06:08'),(16,2,'payment_paid','<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}',NULL,'Payment Paid, from {business_name}',NULL,NULL,0,0,0,'2023-08-22 17:06:08','2023-08-22 17:06:08'),(17,2,'items_received','<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}',NULL,'Items received, from {business_name}',NULL,NULL,0,0,0,'2023-08-22 17:06:08','2023-08-22 17:06:08'),(18,2,'items_pending','<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}',NULL,'Items Pending, from {business_name}',NULL,NULL,0,0,0,'2023-08-22 17:06:08','2023-08-22 17:06:08'),(19,2,'new_quotation','<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-08-22 17:06:08','2023-08-22 17:06:08'),(20,2,'purchase_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>','We have a new purchase order with reference number {order_ref_number}. {business_name}',NULL,'New Purchase Order, from {business_name}',NULL,NULL,0,0,0,'2023-08-22 17:06:08','2023-08-22 17:06:08'),(21,3,'new_sale','<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-08-24 10:40:28','2023-08-24 10:40:28'),(22,3,'payment_received','<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>','Dear {contact_name}, We have received a payment of {received_amount}. {business_name}',NULL,'Payment Received, from {business_name}',NULL,NULL,0,0,0,'2023-08-24 10:40:28','2023-08-24 10:40:28'),(23,3,'payment_reminder','<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}',NULL,'Payment Reminder, from {business_name}',NULL,NULL,0,0,0,'2023-08-24 10:40:28','2023-08-24 10:40:28'),(24,3,'new_booking','<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}',NULL,'Booking Confirmed - {business_name}',NULL,NULL,0,0,0,'2023-08-24 10:40:28','2023-08-24 10:40:28'),(25,3,'new_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}',NULL,'New Order, from {business_name}',NULL,NULL,0,0,0,'2023-08-24 10:40:28','2023-08-24 10:40:28'),(26,3,'payment_paid','<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}',NULL,'Payment Paid, from {business_name}',NULL,NULL,0,0,0,'2023-08-24 10:40:28','2023-08-24 10:40:28'),(27,3,'items_received','<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}',NULL,'Items received, from {business_name}',NULL,NULL,0,0,0,'2023-08-24 10:40:28','2023-08-24 10:40:28'),(28,3,'items_pending','<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}',NULL,'Items Pending, from {business_name}',NULL,NULL,0,0,0,'2023-08-24 10:40:28','2023-08-24 10:40:28'),(29,3,'new_quotation','<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-08-24 10:40:28','2023-08-24 10:40:28'),(30,3,'purchase_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>','We have a new purchase order with reference number {order_ref_number}. {business_name}',NULL,'New Purchase Order, from {business_name}',NULL,NULL,0,0,0,'2023-08-24 10:40:28','2023-08-24 10:40:28'),(31,4,'new_sale','<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-08-29 08:47:05','2023-08-29 08:47:05'),(32,4,'payment_received','<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>','Dear {contact_name}, We have received a payment of {received_amount}. {business_name}',NULL,'Payment Received, from {business_name}',NULL,NULL,0,0,0,'2023-08-29 08:47:05','2023-08-29 08:47:05'),(33,4,'payment_reminder','<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}',NULL,'Payment Reminder, from {business_name}',NULL,NULL,0,0,0,'2023-08-29 08:47:05','2023-08-29 08:47:05'),(34,4,'new_booking','<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}',NULL,'Booking Confirmed - {business_name}',NULL,NULL,0,0,0,'2023-08-29 08:47:05','2023-08-29 08:47:05'),(35,4,'new_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}',NULL,'New Order, from {business_name}',NULL,NULL,0,0,0,'2023-08-29 08:47:05','2023-08-29 08:47:05'),(36,4,'payment_paid','<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}',NULL,'Payment Paid, from {business_name}',NULL,NULL,0,0,0,'2023-08-29 08:47:05','2023-08-29 08:47:05'),(37,4,'items_received','<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}',NULL,'Items received, from {business_name}',NULL,NULL,0,0,0,'2023-08-29 08:47:05','2023-08-29 08:47:05'),(38,4,'items_pending','<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}',NULL,'Items Pending, from {business_name}',NULL,NULL,0,0,0,'2023-08-29 08:47:05','2023-08-29 08:47:05'),(39,4,'new_quotation','<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-08-29 08:47:05','2023-08-29 08:47:05'),(40,4,'purchase_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>','We have a new purchase order with reference number {order_ref_number}. {business_name}',NULL,'New Purchase Order, from {business_name}',NULL,NULL,0,0,0,'2023-08-29 08:47:05','2023-08-29 08:47:05'),(41,5,'new_sale','<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-09-11 11:48:55','2023-09-11 11:48:55'),(42,5,'payment_received','<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>','Dear {contact_name}, We have received a payment of {received_amount}. {business_name}',NULL,'Payment Received, from {business_name}',NULL,NULL,0,0,0,'2023-09-11 11:48:55','2023-09-11 11:48:55'),(43,5,'payment_reminder','<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}',NULL,'Payment Reminder, from {business_name}',NULL,NULL,0,0,0,'2023-09-11 11:48:55','2023-09-11 11:48:55'),(44,5,'new_booking','<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}',NULL,'Booking Confirmed - {business_name}',NULL,NULL,0,0,0,'2023-09-11 11:48:55','2023-09-11 11:48:55'),(45,5,'new_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}',NULL,'New Order, from {business_name}',NULL,NULL,0,0,0,'2023-09-11 11:48:55','2023-09-11 11:48:55'),(46,5,'payment_paid','<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}',NULL,'Payment Paid, from {business_name}',NULL,NULL,0,0,0,'2023-09-11 11:48:55','2023-09-11 11:48:55'),(47,5,'items_received','<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}',NULL,'Items received, from {business_name}',NULL,NULL,0,0,0,'2023-09-11 11:48:55','2023-09-11 11:48:55'),(48,5,'items_pending','<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}',NULL,'Items Pending, from {business_name}',NULL,NULL,0,0,0,'2023-09-11 11:48:55','2023-09-11 11:48:55'),(49,5,'new_quotation','<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-09-11 11:48:55','2023-09-11 11:48:55'),(50,5,'purchase_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>','We have a new purchase order with reference number {order_ref_number}. {business_name}',NULL,'New Purchase Order, from {business_name}',NULL,NULL,0,0,0,'2023-09-11 11:48:55','2023-09-11 11:48:55'),(51,6,'new_sale','<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-10-05 10:51:28','2023-10-05 10:51:28'),(52,6,'payment_received','<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>','Dear {contact_name}, We have received a payment of {received_amount}. {business_name}',NULL,'Payment Received, from {business_name}',NULL,NULL,0,0,0,'2023-10-05 10:51:28','2023-10-05 10:51:28'),(53,6,'payment_reminder','<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}',NULL,'Payment Reminder, from {business_name}',NULL,NULL,0,0,0,'2023-10-05 10:51:28','2023-10-05 10:51:28'),(54,6,'new_booking','<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}',NULL,'Booking Confirmed - {business_name}',NULL,NULL,0,0,0,'2023-10-05 10:51:28','2023-10-05 10:51:28'),(55,6,'new_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}',NULL,'New Order, from {business_name}',NULL,NULL,0,0,0,'2023-10-05 10:51:28','2023-10-05 10:51:28'),(56,6,'payment_paid','<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}',NULL,'Payment Paid, from {business_name}',NULL,NULL,0,0,0,'2023-10-05 10:51:28','2023-10-05 10:51:28'),(57,6,'items_received','<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}',NULL,'Items received, from {business_name}',NULL,NULL,0,0,0,'2023-10-05 10:51:28','2023-10-05 10:51:28'),(58,6,'items_pending','<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}',NULL,'Items Pending, from {business_name}',NULL,NULL,0,0,0,'2023-10-05 10:51:28','2023-10-05 10:51:28'),(59,6,'new_quotation','<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2023-10-05 10:51:28','2023-10-05 10:51:28'),(60,6,'purchase_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>','We have a new purchase order with reference number {order_ref_number}. {business_name}',NULL,'New Purchase Order, from {business_name}',NULL,NULL,0,0,0,'2023-10-05 10:51:28','2023-10-05 10:51:28'),(61,7,'new_sale','<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2024-02-01 12:31:07','2024-02-01 12:31:07'),(62,7,'payment_received','<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>','Dear {contact_name}, We have received a payment of {received_amount}. {business_name}',NULL,'Payment Received, from {business_name}',NULL,NULL,0,0,0,'2024-02-01 12:31:07','2024-02-01 12:31:07'),(63,7,'payment_reminder','<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}',NULL,'Payment Reminder, from {business_name}',NULL,NULL,0,0,0,'2024-02-01 12:31:07','2024-02-01 12:31:07'),(64,7,'new_booking','<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>','Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}',NULL,'Booking Confirmed - {business_name}',NULL,NULL,0,0,0,'2024-02-01 12:31:07','2024-02-01 12:31:07'),(65,7,'new_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}',NULL,'New Order, from {business_name}',NULL,NULL,0,0,0,'2024-02-01 12:31:07','2024-02-01 12:31:07'),(66,7,'payment_paid','<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}',NULL,'Payment Paid, from {business_name}',NULL,NULL,0,0,0,'2024-02-01 12:31:07','2024-02-01 12:31:07'),(67,7,'items_received','<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}',NULL,'Items received, from {business_name}',NULL,NULL,0,0,0,'2024-02-01 12:31:07','2024-02-01 12:31:07'),(68,7,'items_pending','<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>','This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}',NULL,'Items Pending, from {business_name}',NULL,NULL,0,0,0,'2024-02-01 12:31:07','2024-02-01 12:31:07'),(69,7,'new_quotation','<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>','Dear {contact_name}, Thank you for shopping with us. {business_name}',NULL,'Thank you from {business_name}',NULL,NULL,0,0,0,'2024-02-01 12:31:07','2024-02-01 12:31:07'),(70,7,'purchase_order','<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>','We have a new purchase order with reference number {order_ref_number}. {business_name}',NULL,'New Purchase Order, from {business_name}',NULL,NULL,0,0,0,'2024-02-01 12:31:07','2024-02-01 12:31:07');
/*!40000 ALTER TABLE `notification_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_products`
--

DROP TABLE IF EXISTS `package_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `remaining_quantity` int(12) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_products`
--

LOCK TABLES `package_products` WRITE;
/*!40000 ALTER TABLE `package_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `location_count` int(11) NOT NULL COMMENT 'No. of Business Locations, 0 = infinite option.',
  `user_count` int(11) NOT NULL,
  `product_count` int(11) NOT NULL,
  `bookings` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable bookings',
  `kitchen` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable kitchen',
  `order_screen` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable order_screen',
  `tables` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable tables',
  `invoice_count` int(11) NOT NULL,
  `interval` enum('days','months','years') NOT NULL,
  `interval_count` int(11) NOT NULL,
  `trial_days` int(11) NOT NULL,
  `price` decimal(22,4) NOT NULL,
  `custom_permissions` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_one_time` tinyint(1) NOT NULL DEFAULT 0,
  `enable_custom_link` tinyint(1) NOT NULL DEFAULT 0,
  `custom_link` varchar(191) DEFAULT NULL,
  `custom_link_text` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,'superadmin private package','superadmin package with all modules permissions',0,0,0,0,0,0,0,0,'years',50,1,395.0000,'{\"crm_module\":\"1\",\"essentials_module\":\"1\",\"manufacturing_module\":\"1\",\"productcatalogue_module\":\"1\",\"project_module\":\"1\",\"woocommerce_module\":\"1\"}',1,1,1,1,0,0,'','',NULL,'2023-08-11 13:11:12','2023-08-11 13:11:12'),(2,'Test Package','TEst package Description',0,0,0,0,0,0,0,0,'years',1,1,95.0000,'{\"essentials_module\":\"1\",\"productcatalogue_module\":\"1\"}',1,1,1,0,0,0,'','','2023-08-29 08:49:12','2023-08-11 13:12:00','2023-08-29 08:49:12'),(3,'POS','4 Locations',4,0,0,0,0,0,0,0,'months',12,0,0.0000,'{\"essentials_module\":\"1\",\"productcatalogue_module\":\"1\"}',1,1,1,0,0,0,'','',NULL,'2023-08-22 17:04:03','2024-02-01 12:38:30');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'profit_loss_report.view','web','2023-08-11 13:02:44',NULL),(2,'direct_sell.access','web','2023-08-11 13:02:44',NULL),(3,'product.opening_stock','web','2023-08-11 13:02:45','2023-08-11 13:02:45'),(4,'crud_all_bookings','web','2023-08-11 13:02:45','2023-08-11 13:02:45'),(5,'crud_own_bookings','web','2023-08-11 13:02:45','2023-08-11 13:02:45'),(6,'access_default_selling_price','web','2023-08-11 13:02:45','2023-08-11 13:02:45'),(7,'purchase.payments','web','2023-08-11 13:02:45','2023-08-11 13:02:45'),(8,'sell.payments','web','2023-08-11 13:02:45','2023-08-11 13:02:45'),(9,'edit_product_price_from_sale_screen','web','2023-08-11 13:02:45','2023-08-11 13:02:45'),(10,'edit_product_discount_from_sale_screen','web','2023-08-11 13:02:45','2023-08-11 13:02:45'),(11,'roles.view','web','2023-08-11 13:02:45','2023-08-11 13:02:45'),(12,'roles.create','web','2023-08-11 13:02:45','2023-08-11 13:02:45'),(13,'roles.update','web','2023-08-11 13:02:45','2023-08-11 13:02:45'),(14,'roles.delete','web','2023-08-11 13:02:45','2023-08-11 13:02:45'),(15,'account.access','web','2023-08-11 13:02:46','2023-08-11 13:02:46'),(16,'discount.access','web','2023-08-11 13:02:46','2023-08-11 13:02:46'),(17,'view_purchase_price','web','2023-08-11 13:02:46','2023-08-11 13:02:46'),(18,'view_own_sell_only','web','2023-08-11 13:02:46','2023-08-11 13:02:46'),(19,'edit_product_discount_from_pos_screen','web','2023-08-11 13:02:46','2023-08-11 13:02:46'),(20,'edit_product_price_from_pos_screen','web','2023-08-11 13:02:46','2023-08-11 13:02:46'),(21,'access_shipping','web','2023-08-11 13:02:46','2023-08-11 13:02:46'),(22,'purchase.update_status','web','2023-08-11 13:02:46','2023-08-11 13:02:46'),(23,'list_drafts','web','2023-08-11 13:02:46','2023-08-11 13:02:46'),(24,'list_quotations','web','2023-08-11 13:02:46','2023-08-11 13:02:46'),(25,'view_cash_register','web','2023-08-11 13:02:47','2023-08-11 13:02:47'),(26,'close_cash_register','web','2023-08-11 13:02:47','2023-08-11 13:02:47'),(27,'print_invoice','web','2023-08-11 13:02:47','2023-08-11 13:02:47'),(28,'user.view','web','2023-08-11 13:02:47',NULL),(29,'user.create','web','2023-08-11 13:02:47',NULL),(30,'user.update','web','2023-08-11 13:02:47',NULL),(31,'user.delete','web','2023-08-11 13:02:47',NULL),(32,'supplier.view','web','2023-08-11 13:02:47',NULL),(33,'supplier.create','web','2023-08-11 13:02:47',NULL),(34,'supplier.update','web','2023-08-11 13:02:47',NULL),(35,'supplier.delete','web','2023-08-11 13:02:47',NULL),(36,'customer.view','web','2023-08-11 13:02:47',NULL),(37,'customer.create','web','2023-08-11 13:02:47',NULL),(38,'customer.update','web','2023-08-11 13:02:47',NULL),(39,'customer.delete','web','2023-08-11 13:02:47',NULL),(40,'product.view','web','2023-08-11 13:02:47',NULL),(41,'product.create','web','2023-08-11 13:02:47',NULL),(42,'product.update','web','2023-08-11 13:02:47',NULL),(43,'product.delete','web','2023-08-11 13:02:47',NULL),(44,'purchase.view','web','2023-08-11 13:02:47',NULL),(45,'purchase.create','web','2023-08-11 13:02:47',NULL),(46,'purchase.update','web','2023-08-11 13:02:47',NULL),(47,'purchase.delete','web','2023-08-11 13:02:47',NULL),(48,'sell.view','web','2023-08-11 13:02:47',NULL),(49,'sell.create','web','2023-08-11 13:02:47',NULL),(50,'sell.update','web','2023-08-11 13:02:47',NULL),(51,'sell.delete','web','2023-08-11 13:02:47',NULL),(52,'purchase_n_sell_report.view','web','2023-08-11 13:02:47',NULL),(53,'contacts_report.view','web','2023-08-11 13:02:47',NULL),(54,'stock_report.view','web','2023-08-11 13:02:47',NULL),(55,'tax_report.view','web','2023-08-11 13:02:47',NULL),(56,'trending_product_report.view','web','2023-08-11 13:02:47',NULL),(57,'register_report.view','web','2023-08-11 13:02:47',NULL),(58,'sales_representative.view','web','2023-08-11 13:02:47',NULL),(59,'expense_report.view','web','2023-08-11 13:02:47',NULL),(60,'business_settings.access','web','2023-08-11 13:02:47',NULL),(61,'barcode_settings.access','web','2023-08-11 13:02:47',NULL),(62,'invoice_settings.access','web','2023-08-11 13:02:47',NULL),(63,'brand.view','web','2023-08-11 13:02:47',NULL),(64,'brand.create','web','2023-08-11 13:02:47',NULL),(65,'brand.update','web','2023-08-11 13:02:47',NULL),(66,'brand.delete','web','2023-08-11 13:02:47',NULL),(67,'tax_rate.view','web','2023-08-11 13:02:47',NULL),(68,'tax_rate.create','web','2023-08-11 13:02:47',NULL),(69,'tax_rate.update','web','2023-08-11 13:02:47',NULL),(70,'tax_rate.delete','web','2023-08-11 13:02:47',NULL),(71,'unit.view','web','2023-08-11 13:02:47',NULL),(72,'unit.create','web','2023-08-11 13:02:47',NULL),(73,'unit.update','web','2023-08-11 13:02:47',NULL),(74,'unit.delete','web','2023-08-11 13:02:47',NULL),(75,'category.view','web','2023-08-11 13:02:47',NULL),(76,'category.create','web','2023-08-11 13:02:47',NULL),(77,'category.update','web','2023-08-11 13:02:47',NULL),(78,'category.delete','web','2023-08-11 13:02:47',NULL),(79,'expense.access','web','2023-08-11 13:02:47',NULL),(80,'access_all_locations','web','2023-08-11 13:02:47',NULL),(81,'dashboard.data','web','2023-08-11 13:02:47',NULL),(82,'location.1','web','2023-08-11 13:03:45','2023-08-11 13:03:45'),(83,'essentials.create_message','web','2023-08-11 13:06:50','2023-08-11 13:06:50'),(84,'essentials.view_message','web','2023-08-11 13:06:50','2023-08-11 13:06:50'),(85,'essentials.approve_leave','web','2023-08-11 13:06:52','2023-08-11 13:06:52'),(86,'essentials.assign_todos','web','2023-08-11 13:06:53','2023-08-11 13:06:53'),(87,'essentials.add_allowance_and_deduction','web','2023-08-11 13:06:53','2023-08-11 13:06:53'),(88,'project.create_project','web','2023-08-11 13:08:17','2023-08-11 13:08:17'),(89,'project.edit_project','web','2023-08-11 13:08:17','2023-08-11 13:08:17'),(90,'project.delete_project','web','2023-08-11 13:08:17','2023-08-11 13:08:17'),(91,'woocommerce.syc_categories','web','2023-08-11 13:08:35','2023-08-11 13:08:35'),(92,'woocommerce.sync_products','web','2023-08-11 13:08:35','2023-08-11 13:08:35'),(93,'woocommerce.sync_orders','web','2023-08-11 13:08:35','2023-08-11 13:08:35'),(94,'woocommerce.map_tax_rates','web','2023-08-11 13:08:35','2023-08-11 13:08:35'),(95,'woocommerce.access_woocommerce_api_settings','web','2023-08-11 13:08:35','2023-08-11 13:08:35'),(96,'manufacturing.access_recipe','web','2023-08-11 13:09:59','2023-08-11 13:09:59'),(97,'manufacturing.access_production','web','2023-08-11 13:09:59','2023-08-11 13:09:59'),(98,'manufacturing.add_recipe','web','2023-08-11 13:09:59','2023-08-11 13:09:59'),(99,'manufacturing.edit_recipe','web','2023-08-11 13:09:59','2023-08-11 13:09:59'),(100,'view_customer_ledger','web',NULL,NULL),(101,'show_received_status','web',NULL,NULL),(102,'location.2','web','2023-08-22 17:06:08','2023-08-22 17:06:08'),(103,'location.3','web','2023-08-24 10:40:28','2023-08-24 10:40:28'),(104,'location.4','web','2023-08-29 08:47:05','2023-08-29 08:47:05'),(105,'location.5','web','2023-08-29 13:19:40','2023-08-29 13:19:40'),(106,'location.6','web','2023-08-29 13:21:37','2023-08-29 13:21:37'),(107,'location.7','web','2023-08-29 13:22:58','2023-08-29 13:22:58'),(108,'purchase_requisition.create','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(109,'purchase_order.create','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(110,'purchase_order.update','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(111,'direct_sell.update','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(112,'edit_sell_payment','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(113,'draft.update','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(114,'quotation.update','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(115,'expense.add','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(116,'purchase_requisition.view_all','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(117,'purchase_order.view_all','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(118,'direct_sell.view','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(119,'draft.view_all','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(120,'quotation.view_all','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(121,'all_expense.access','web','2023-08-30 12:49:43','2023-08-30 12:49:43'),(122,'edit_purchase_payment','web','2023-08-30 13:24:55','2023-08-30 13:24:55'),(123,'access_sell_return','web','2023-08-30 13:24:55','2023-08-30 13:24:55'),(124,'view_paid_sells_only','web','2023-09-05 12:07:30','2023-09-05 12:07:30'),(125,'customer.view_own','web','2023-09-05 12:07:30','2023-09-05 12:07:30'),(126,'purchase_requisition.view_own','web','2023-09-05 12:07:30','2023-09-05 12:07:30'),(127,'purchase_order.view_own','web','2023-09-05 12:07:30','2023-09-05 12:07:30'),(128,'view_export_buttons','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(129,'delete_purchase_payment','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(130,'purchase_requisition.delete','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(131,'purchase_order.delete','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(132,'view_due_sells_only','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(133,'view_partial_sells_only','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(134,'view_overdue_sells_only','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(135,'direct_sell.delete','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(136,'view_commission_agent_sell','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(137,'delete_sell_payment','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(138,'access_own_sell_return','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(139,'edit_invoice_number','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(140,'draft.delete','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(141,'quotation.delete','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(142,'access_pending_shipments_only','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(143,'access_commission_agent_shipping','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(144,'view_product_stock_value','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(145,'access_printers','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(146,'expense.edit','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(147,'expense.delete','web','2023-09-05 12:11:37','2023-09-05 12:11:37'),(148,'edit_account_transaction','web','2023-09-05 12:11:38','2023-09-05 12:11:38'),(149,'delete_account_transaction','web','2023-09-05 12:11:38','2023-09-05 12:11:38'),(150,'supplier.view_own','web','2023-09-05 12:11:38','2023-09-05 12:11:38'),(151,'customer_irrespective_of_sell','web','2023-09-05 12:11:38','2023-09-05 12:11:38'),(152,'location.8','web','2023-09-06 12:52:08','2023-09-06 12:52:08'),(153,'location.9','web','2023-09-11 11:48:55','2023-09-11 11:48:55'),(154,'location.10','web','2023-10-05 10:51:28','2023-10-05 10:51:28'),(155,'location.11','web','2024-02-01 12:31:08','2024-02-01 12:31:08');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_invoice_lines`
--

DROP TABLE IF EXISTS `pjt_invoice_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_invoice_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `task` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `rate` decimal(22,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `total` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_invoice_lines_transaction_id_foreign` (`transaction_id`),
  KEY `pjt_invoice_lines_tax_rate_id_index` (`tax_rate_id`),
  CONSTRAINT `pjt_invoice_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_invoice_lines`
--

LOCK TABLES `pjt_invoice_lines` WRITE;
/*!40000 ALTER TABLE `pjt_invoice_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_invoice_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_project_members`
--

DROP TABLE IF EXISTS `pjt_project_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_project_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_project_members_project_id_foreign` (`project_id`),
  KEY `pjt_project_members_user_id_index` (`user_id`),
  CONSTRAINT `pjt_project_members_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `pjt_projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_project_members`
--

LOCK TABLES `pjt_project_members` WRITE;
/*!40000 ALTER TABLE `pjt_project_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_project_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_project_task_comments`
--

DROP TABLE IF EXISTS `pjt_project_task_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_project_task_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_task_id` int(10) unsigned NOT NULL,
  `comment` text NOT NULL,
  `commented_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_project_task_comments_project_task_id_foreign` (`project_task_id`),
  CONSTRAINT `pjt_project_task_comments_project_task_id_foreign` FOREIGN KEY (`project_task_id`) REFERENCES `pjt_project_tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_project_task_comments`
--

LOCK TABLES `pjt_project_task_comments` WRITE;
/*!40000 ALTER TABLE `pjt_project_task_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_project_task_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_project_task_members`
--

DROP TABLE IF EXISTS `pjt_project_task_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_project_task_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_task_id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_project_task_members_project_task_id_foreign` (`project_task_id`),
  KEY `pjt_project_task_members_user_id_index` (`user_id`),
  CONSTRAINT `pjt_project_task_members_project_task_id_foreign` FOREIGN KEY (`project_task_id`) REFERENCES `pjt_project_tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_project_task_members`
--

LOCK TABLES `pjt_project_task_members` WRITE;
/*!40000 ALTER TABLE `pjt_project_task_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_project_task_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_project_tasks`
--

DROP TABLE IF EXISTS `pjt_project_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_project_tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `task_id` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `priority` enum('low','medium','high','urgent') NOT NULL DEFAULT 'low',
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `status` enum('completed','not_started','in_progress','on_hold','cancelled') NOT NULL DEFAULT 'not_started',
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_project_tasks_project_id_foreign` (`project_id`),
  KEY `pjt_project_tasks_business_id_index` (`business_id`),
  KEY `pjt_project_tasks_created_by_index` (`created_by`),
  CONSTRAINT `pjt_project_tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `pjt_projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_project_tasks`
--

LOCK TABLES `pjt_project_tasks` WRITE;
/*!40000 ALTER TABLE `pjt_project_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_project_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_project_time_logs`
--

DROP TABLE IF EXISTS `pjt_project_time_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_project_time_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `project_task_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_project_time_logs_project_id_foreign` (`project_id`),
  KEY `pjt_project_time_logs_project_task_id_foreign` (`project_task_id`),
  KEY `pjt_project_time_logs_user_id_index` (`user_id`),
  KEY `pjt_project_time_logs_created_by_index` (`created_by`),
  CONSTRAINT `pjt_project_time_logs_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `pjt_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pjt_project_time_logs_project_task_id_foreign` FOREIGN KEY (`project_task_id`) REFERENCES `pjt_project_tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_project_time_logs`
--

LOCK TABLES `pjt_project_time_logs` WRITE;
/*!40000 ALTER TABLE `pjt_project_time_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_project_time_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pjt_projects`
--

DROP TABLE IF EXISTS `pjt_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pjt_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `status` enum('not_started','in_progress','on_hold','cancelled','completed') NOT NULL,
  `lead_id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pjt_projects_business_id_index` (`business_id`),
  KEY `pjt_projects_contact_id_index` (`contact_id`),
  KEY `pjt_projects_lead_id_index` (`lead_id`),
  KEY `pjt_projects_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pjt_projects`
--

LOCK TABLES `pjt_projects` WRITE;
/*!40000 ALTER TABLE `pjt_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `pjt_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `connection_type` enum('network','windows','linux') NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `port` varchar(191) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `printers_business_id_foreign` (`business_id`),
  CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printers`
--

LOCK TABLES `printers` WRITE;
/*!40000 ALTER TABLE `printers` DISABLE KEYS */;
/*!40000 ALTER TABLE `printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_locations`
--

DROP TABLE IF EXISTS `product_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  KEY `product_locations_product_id_index` (`product_id`),
  KEY `product_locations_location_id_index` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_locations`
--

LOCK TABLES `product_locations` WRITE;
/*!40000 ALTER TABLE `product_locations` DISABLE KEYS */;
INSERT INTO `product_locations` VALUES (1,2),(2,2),(3,1),(4,3),(5,3),(6,4),(6,5),(6,6),(6,7),(7,4),(7,5),(7,6),(7,7),(8,4),(8,5),(8,6),(8,7),(9,4),(9,5),(9,6),(9,7),(10,4),(10,5),(10,6),(10,7),(11,4),(11,5),(11,6),(11,7),(12,4),(12,5),(12,6),(12,7),(13,4),(13,5),(13,6),(13,7),(14,4),(14,5),(14,6),(14,7),(15,4),(15,5),(15,6),(15,7),(16,4),(16,5),(16,6),(16,7),(17,4),(17,5),(17,6),(17,7),(18,4),(18,5),(18,6),(18,7),(19,4),(19,5),(19,6),(19,7),(20,4),(20,5),(20,6),(20,7),(21,4),(21,5),(21,6),(21,7),(22,4),(22,5),(22,6),(22,7),(23,4),(23,5),(23,6),(23,7),(24,4),(24,5),(24,6),(24,7),(25,4),(25,5),(25,6),(25,7),(26,4),(26,5),(26,6),(26,7),(27,4),(27,5),(27,6),(27,7),(28,4),(28,5),(28,6),(28,7),(29,4),(29,5),(29,6),(29,7),(30,4),(30,5),(30,6),(30,7),(31,4),(31,5),(31,6),(31,7),(32,4),(32,5),(32,6),(32,7),(33,4),(33,5),(33,6),(33,7),(34,4),(34,5),(34,6),(34,7),(35,4),(35,5),(35,6),(35,7),(36,4),(36,5),(36,6),(36,7),(37,4),(37,5),(37,6),(37,7),(38,4),(38,5),(38,6),(38,7),(39,4),(39,5),(39,6),(39,7),(40,4),(40,5),(40,6),(40,7),(41,4),(41,5),(41,6),(41,7),(42,4),(42,5),(42,6),(42,7),(43,4),(43,5),(43,6),(43,7),(44,4),(44,5),(44,6),(44,7),(45,4),(45,5),(45,6),(45,7),(46,4),(46,5),(46,6),(46,7),(47,4),(47,5),(47,6),(47,7),(48,4),(48,5),(48,6),(48,7),(49,4),(49,5),(49,6),(49,7),(50,4),(50,5),(50,6),(50,7),(51,4),(51,5),(51,6),(51,7),(52,4),(52,5),(52,6),(52,7),(53,4),(53,5),(53,6),(53,7),(54,4),(54,5),(54,6),(54,7),(55,4),(55,5),(55,6),(55,7),(56,4),(56,5),(56,6),(56,7),(57,4),(57,5),(57,6),(57,7),(58,4),(58,5),(58,6),(58,7),(59,4),(59,5),(59,6),(59,7),(60,4),(60,5),(60,6),(60,7),(61,4),(61,5),(61,6),(61,7),(62,4),(62,5),(62,6),(62,7),(63,4),(63,5),(63,6),(63,7),(64,4),(64,5),(64,6),(64,7),(65,4),(65,5),(65,6),(65,7),(66,4),(66,5),(66,6),(66,7),(67,4),(67,5),(67,6),(67,7),(68,4),(68,5),(68,6),(68,7),(69,4),(69,5),(69,6),(69,7),(70,4),(70,5),(70,6),(70,7),(71,4),(71,5),(71,6),(71,7),(72,4),(72,5),(72,6),(72,7),(73,4),(73,5),(73,6),(73,7),(74,4),(74,5),(74,6),(74,7),(75,4),(75,5),(75,6),(75,7),(76,4),(76,5),(76,6),(76,7),(77,4),(77,5),(77,6),(77,7),(78,4),(78,5),(78,6),(78,7),(79,4),(79,5),(79,6),(79,7),(80,4),(80,5),(80,6),(80,7),(81,4),(81,5),(81,6),(81,7),(82,4),(82,5),(82,6),(82,7),(83,4),(83,5),(83,6),(83,7),(84,4),(84,5),(84,6),(84,7),(85,4),(85,5),(85,6),(85,7),(86,4),(86,5),(86,6),(86,7),(87,4),(87,5),(87,6),(87,7),(88,4),(88,5),(88,6),(88,7),(89,4),(89,5),(89,6),(89,7),(90,4),(90,5),(90,6),(90,7),(91,4),(91,5),(91,6),(91,7),(92,4),(92,5),(92,6),(92,7),(93,4),(93,5),(93,6),(93,7),(94,4),(94,5),(94,6),(94,7),(95,4),(95,5),(95,6),(95,7),(96,4),(96,5),(96,6),(96,7),(97,4),(97,5),(97,6),(97,7),(98,4),(98,5),(98,6),(98,7),(99,4),(99,5),(99,6),(99,7),(100,4),(100,5),(100,6),(100,7),(101,4),(101,5),(101,6),(101,7),(102,4),(102,5),(102,6),(102,7),(103,4),(103,5),(103,6),(103,7),(104,4),(104,5),(104,6),(104,7),(105,4),(105,5),(105,6),(105,7),(106,4),(106,5),(106,6),(106,7),(107,4),(107,5),(107,6),(107,7),(108,4),(108,5),(108,6),(108,7),(109,4),(109,5),(109,6),(109,7),(110,4),(110,5),(110,6),(110,7),(111,4),(111,5),(111,6),(111,7),(112,4),(112,5),(112,6),(112,7),(113,4),(113,5),(113,6),(113,7),(114,4),(114,5),(114,6),(114,7),(115,4),(115,5),(115,6),(115,7),(116,4),(116,5),(116,6),(116,7),(117,4),(117,5),(117,6),(117,7),(118,4),(118,5),(118,6),(118,7),(119,4),(119,5),(119,6),(119,7),(120,4),(120,5),(120,6),(120,7),(121,4),(121,5),(121,6),(121,7),(122,4),(122,5),(122,6),(122,7),(123,4),(123,5),(123,6),(123,7),(124,4),(124,5),(124,6),(124,7),(125,4),(125,5),(125,6),(125,7),(126,4),(126,5),(126,6),(126,7),(127,4),(127,5),(127,6),(127,7),(128,4),(128,5),(128,6),(128,7),(129,4),(129,5),(129,6),(129,7),(130,4),(130,5),(130,6),(130,7),(131,4),(131,5),(131,6),(131,7),(132,4),(132,5),(132,6),(132,7),(133,4),(133,5),(133,6),(133,7),(134,4),(134,5),(134,6),(134,7),(135,4),(135,5),(135,6),(135,7),(136,4),(136,5),(136,6),(136,7),(137,4),(137,5),(137,6),(137,7),(138,4),(138,5),(138,6),(138,7),(139,4),(139,5),(139,6),(139,7),(140,4),(140,5),(140,6),(140,7),(141,4),(141,5),(141,6),(141,7),(142,4),(142,5),(142,6),(142,7),(143,4),(143,5),(143,6),(143,7),(144,4),(144,5),(144,6),(144,7),(145,4),(145,5),(145,6),(145,7),(146,4),(146,5),(146,6),(146,7),(147,4),(147,5),(147,6),(147,7),(148,4),(148,5),(148,6),(148,7),(149,4),(149,5),(149,6),(149,7),(150,4),(150,5),(150,6),(150,7),(151,4),(151,5),(151,6),(151,7),(152,4),(152,5),(152,6),(152,7),(153,4),(153,5),(153,6),(153,7),(154,4),(154,5),(154,6),(154,7),(155,4),(155,5),(155,6),(155,7),(156,4),(156,5),(156,6),(156,7),(157,4),(157,5),(157,6),(157,7),(158,4),(158,5),(158,6),(158,7),(159,4),(159,5),(159,6),(159,7),(160,4),(160,5),(160,6),(160,7),(161,4),(161,5),(161,6),(161,7),(162,4),(162,5),(162,6),(162,7),(163,4),(163,5),(163,6),(163,7),(164,4),(164,5),(164,6),(164,7),(165,4),(165,5),(165,6),(165,7),(166,4),(166,5),(166,6),(166,7),(167,4),(167,5),(167,6),(167,7),(168,4),(168,5),(168,6),(168,7),(169,4),(169,5),(169,6),(169,7),(170,4),(170,5),(170,6),(170,7),(171,4),(171,5),(171,6),(171,7),(172,4),(172,5),(172,6),(172,7),(173,4),(173,5),(173,6),(173,7),(174,4),(174,5),(174,6),(174,7),(175,4),(175,5),(175,6),(175,7),(176,4),(176,5),(176,6),(176,7),(177,4),(177,5),(177,6),(177,7),(178,4),(178,5),(178,6),(178,7),(179,4),(179,5),(179,6),(179,7),(180,4),(180,5),(180,6),(180,7),(181,4),(181,5),(181,6),(181,7),(182,4),(182,5),(182,6),(182,7),(183,4),(183,5),(183,6),(183,7),(184,4),(184,5),(184,6),(184,7),(185,4),(185,5),(185,6),(185,7),(186,4),(186,5),(186,6),(186,7),(187,4),(187,5),(187,6),(187,7),(188,4),(188,5),(188,6),(188,7),(189,4),(189,5),(189,6),(189,7),(190,4),(190,5),(190,6),(190,7),(191,4),(191,5),(191,6),(191,7),(192,4),(192,5),(192,6),(192,7),(193,4),(193,5),(193,6),(193,7),(194,4),(194,5),(194,6),(194,7),(195,4),(195,5),(195,6),(195,7),(196,4),(196,5),(196,6),(196,7),(197,4),(197,5),(197,6),(197,7),(198,4),(198,5),(198,6),(198,7),(199,4),(199,5),(199,6),(199,7),(200,4),(200,5),(200,6),(200,7),(201,4),(201,5),(201,6),(201,7),(202,4),(202,5),(202,6),(202,7),(203,4),(203,5),(203,6),(203,7),(204,4),(204,5),(204,6),(204,7),(205,4),(205,5),(205,6),(205,7),(206,4),(206,5),(206,6),(206,7),(207,4),(207,5),(207,6),(207,7),(208,4),(208,5),(208,6),(208,7),(209,4),(209,5),(209,6),(209,7),(210,4),(210,5),(210,6),(210,7),(211,4),(211,5),(211,6),(211,7),(212,4),(212,5),(212,6),(212,7),(213,4),(213,5),(213,6),(213,7),(214,4),(214,5),(214,6),(214,7),(215,4),(215,5),(215,6),(215,7),(216,4),(216,5),(216,6),(216,7),(217,4),(217,5),(217,6),(217,7),(218,4),(218,5),(218,6),(218,7),(219,4),(219,5),(219,6),(219,7),(220,4),(220,5),(220,6),(220,7),(221,4),(221,5),(221,6),(221,7),(222,4),(222,5),(222,6),(222,7),(223,4),(223,5),(223,6),(223,7),(224,4),(224,5),(224,6),(224,7),(225,4),(225,5),(225,6),(225,7),(226,4),(226,5),(226,6),(226,7),(227,4),(227,5),(227,6),(227,7),(228,4),(228,5),(228,6),(228,7),(229,4),(229,5),(229,6),(229,7),(230,4),(230,5),(230,6),(230,7),(231,4),(231,5),(231,6),(231,7),(232,4),(232,5),(232,6),(232,7),(233,4),(233,5),(233,6),(233,7),(234,4),(234,5),(234,6),(234,7),(235,4),(235,5),(235,6),(235,7),(236,4),(236,5),(236,6),(236,7),(237,4),(237,5),(237,6),(237,7),(238,4),(238,5),(238,6),(238,7),(239,4),(239,5),(239,6),(239,7),(240,4),(240,5),(240,6),(240,7),(241,4),(241,5),(241,6),(241,7),(242,4),(242,5),(242,6),(242,7),(243,4),(243,5),(243,6),(243,7),(244,4),(244,5),(244,6),(244,7),(245,4),(245,5),(245,6),(245,7),(246,4),(246,5),(246,6),(246,7),(247,4),(247,5),(247,6),(247,7),(248,4),(248,5),(248,6),(248,7),(249,4),(249,5),(249,6),(249,7),(250,4),(250,5),(250,6),(250,7),(251,4),(251,5),(251,6),(251,7),(252,4),(252,5),(252,6),(252,7),(253,4),(253,5),(253,6),(253,7),(254,4),(254,5),(254,6),(254,7),(255,4),(255,5),(255,6),(255,7),(256,4),(256,5),(256,6),(256,7),(257,4),(257,5),(257,6),(257,7),(258,4),(258,5),(258,6),(258,7),(259,4),(259,5),(259,6),(259,7),(260,4),(260,5),(260,6),(260,7),(261,4),(261,5),(261,6),(261,7),(262,4),(262,5),(262,6),(262,7),(263,4),(263,5),(263,6),(263,7),(264,4),(264,5),(264,6),(264,7),(265,4),(265,5),(265,6),(265,7),(266,4),(266,5),(266,6),(266,7),(267,4),(267,5),(267,6),(267,7),(268,4),(268,5),(268,6),(268,7),(269,4),(269,5),(269,6),(269,7),(270,4),(270,5),(270,6),(270,7),(271,4),(271,5),(271,6),(271,7),(272,4),(272,5),(272,6),(272,7),(273,4),(273,5),(273,6),(273,7),(274,4),(274,5),(274,6),(274,7),(275,4),(275,5),(275,6),(275,7),(276,4),(276,5),(276,6),(276,7),(277,4),(277,5),(277,6),(277,7),(278,4),(278,5),(278,6),(278,7),(279,4),(279,5),(279,6),(279,7),(280,4),(280,5),(280,6),(280,7),(281,4),(281,5),(281,6),(281,7),(282,4),(282,5),(282,6),(282,7),(283,4),(283,5),(283,6),(283,7),(284,4),(284,5),(284,6),(284,7),(285,4),(285,5),(285,6),(285,7),(286,4),(286,5),(286,6),(286,7),(287,4),(287,5),(287,6),(287,7),(288,4),(288,5),(288,6),(288,7),(289,4),(289,5),(289,6),(289,7),(290,4),(290,5),(290,6),(290,7),(291,4),(291,5),(291,6),(291,7),(292,4),(292,5),(292,6),(292,7),(293,4),(293,5),(293,6),(293,7),(294,4),(294,5),(294,6),(294,7),(295,4),(295,5),(295,6),(295,7),(296,4),(296,5),(296,6),(296,7),(297,4),(297,5),(297,6),(297,7),(298,4),(298,5),(298,6),(298,7),(299,4),(299,5),(299,6),(299,7),(300,4),(300,5),(300,6),(300,7),(301,4),(301,5),(301,6),(301,7),(302,4),(302,5),(302,6),(302,7),(303,4),(303,5),(303,6),(303,7),(304,4),(304,5),(304,6),(304,7),(305,4),(305,5),(305,6),(305,7),(306,4),(306,5),(306,6),(306,7),(307,4),(307,5),(307,6),(307,7),(308,4),(308,5),(308,6),(308,7),(309,4),(309,5),(309,6),(309,7),(310,4),(310,5),(310,6),(310,7),(311,4),(311,5),(311,6),(311,7),(312,4),(312,5),(312,6),(312,7),(313,4),(313,5),(313,6),(313,7),(314,4),(314,5),(314,6),(314,7),(315,4),(315,5),(315,6),(315,7),(316,4),(316,5),(316,6),(316,7),(317,4),(317,5),(317,6),(317,7),(318,4),(318,5),(318,6),(318,7),(319,4),(319,5),(319,6),(319,7),(320,4),(320,5),(320,6),(320,7),(321,4),(321,5),(321,6),(321,7),(322,4),(322,5),(322,6),(322,7),(323,4),(323,5),(323,6),(323,7),(324,4),(324,5),(324,6),(324,7),(325,4),(325,5),(325,6),(325,7),(326,4),(326,5),(326,6),(326,7),(327,4),(327,5),(327,6),(327,7),(328,4),(328,5),(328,6),(328,7),(329,4),(329,5),(329,6),(329,7),(330,4),(330,5),(330,6),(330,7),(331,4),(331,5),(331,6),(331,7),(332,4),(332,5),(332,6),(332,7),(333,4),(333,5),(333,6),(333,7),(334,4),(334,5),(334,6),(334,7),(335,4),(335,5),(335,6),(335,7),(336,4),(336,5),(336,6),(336,7),(337,4),(337,5),(337,6),(337,7),(338,4),(338,5),(338,6),(338,7),(339,4),(339,5),(339,6),(339,7),(340,4),(340,5),(340,6),(340,7),(341,4),(341,5),(341,6),(341,7),(342,4),(342,5),(342,6),(342,7),(343,4),(343,5),(343,6),(343,7),(344,4),(344,5),(344,6),(344,7),(345,4),(345,5),(345,6),(345,7),(346,4),(346,5),(346,6),(346,7),(347,4),(347,5),(347,6),(347,7),(348,4),(348,5),(348,6),(348,7),(349,4),(349,5),(349,6),(349,7),(350,4),(350,5),(350,6),(350,7),(351,4),(351,5),(351,6),(351,7),(352,4),(352,5),(352,6),(352,7),(353,4),(353,5),(353,6),(353,7),(354,4),(354,5),(354,6),(354,7),(355,4),(355,5),(355,6),(355,7),(356,4),(356,5),(356,6),(356,7),(357,4),(357,5),(357,6),(357,7),(358,4),(358,5),(358,6),(358,7),(359,4),(359,5),(359,6),(359,7),(360,4),(360,5),(360,6),(360,7),(361,4),(361,5),(361,6),(361,7),(362,4),(362,5),(362,6),(362,7),(363,4),(363,5),(363,6),(363,7),(364,4),(364,5),(364,6),(364,7),(365,4),(365,5),(365,6),(365,7),(366,4),(366,5),(366,6),(366,7),(367,4),(367,5),(367,6),(367,7),(368,4),(368,5),(368,6),(368,7),(369,4),(369,5),(369,6),(369,7),(370,4),(370,5),(370,6),(370,7),(371,4),(371,5),(371,6),(371,7),(372,4),(372,5),(372,6),(372,7),(373,4),(373,5),(373,6),(373,7),(374,4),(374,5),(374,6),(374,7),(375,4),(375,5),(375,6),(375,7),(376,4),(376,5),(376,6),(376,7),(377,4),(377,5),(377,6),(377,7),(378,4),(378,5),(378,6),(378,7),(379,4),(379,5),(379,6),(379,7),(380,4),(380,5),(380,6),(380,7),(381,4),(381,5),(381,6),(381,7),(382,4),(382,5),(382,6),(382,7),(383,4),(383,5),(383,6),(383,7),(384,4),(384,5),(384,6),(384,7),(385,4),(385,5),(385,6),(385,7),(386,4),(386,5),(386,6),(386,7),(387,4),(387,5),(387,6),(387,7),(388,4),(388,5),(388,6),(388,7),(389,4),(389,5),(389,6),(389,7),(390,4),(390,5),(390,6),(390,7),(391,4),(391,5),(391,6),(391,7),(392,4),(392,5),(392,6),(392,7),(393,4),(393,5),(393,6),(393,7),(394,4),(394,5),(394,6),(394,7),(395,4),(395,5),(395,6),(395,7),(396,4),(396,5),(396,6),(396,7),(397,4),(397,5),(397,6),(397,7),(398,4),(398,5),(398,6),(398,7),(399,4),(399,5),(399,6),(399,7),(400,4),(400,5),(400,6),(400,7),(401,4),(401,5),(401,6),(401,7),(402,4),(402,5),(402,6),(402,7),(403,4),(403,5),(403,6),(403,7),(404,4),(404,5),(404,6),(404,7),(405,4),(405,5),(405,6),(405,7),(406,4),(406,5),(406,6),(406,7),(407,4),(407,5),(407,6),(407,7),(408,4),(408,5),(408,6),(408,7),(409,4),(409,5),(409,6),(409,7),(410,4),(410,5),(410,6),(410,7),(411,4),(411,5),(411,6),(411,7),(412,4),(412,5),(412,6),(412,7),(413,4),(413,5),(413,6),(413,7),(414,4),(414,5),(414,6),(414,7),(415,4),(415,5),(415,6),(415,7),(416,4),(416,5),(416,6),(416,7),(417,4),(417,5),(417,6),(417,7),(418,4),(418,5),(418,6),(418,7),(419,4),(419,5),(419,6),(419,7),(420,4),(420,5),(420,6),(420,7),(421,4),(421,5),(421,6),(421,7),(422,4),(422,5),(422,6),(422,7),(423,4),(423,5),(423,6),(423,7),(424,4),(424,5),(424,6),(424,7),(425,4),(425,5),(425,6),(425,7),(426,4),(426,5),(426,6),(426,7),(427,4),(427,5),(427,6),(427,7),(428,4),(428,5),(428,6),(428,7),(429,4),(429,5),(429,6),(429,7),(430,4),(430,5),(430,6),(430,7),(431,4),(431,5),(431,6),(431,7),(432,4),(432,5),(432,6),(432,7),(433,4),(433,5),(433,6),(433,7),(434,4),(434,5),(434,6),(434,7),(435,4),(435,5),(435,6),(435,7),(436,4),(436,5),(436,6),(436,7),(437,4),(437,5),(437,6),(437,7),(438,4),(438,5),(438,6),(438,7),(439,4),(439,5),(439,6),(439,7),(440,4),(440,5),(440,6),(440,7),(441,4),(441,5),(441,6),(441,7),(442,4),(442,5),(442,6),(442,7),(443,4),(443,5),(443,6),(443,7),(444,4),(444,5),(444,6),(444,7),(445,4),(445,5),(445,6),(445,7),(446,4),(446,5),(446,6),(446,7),(447,4),(447,5),(447,6),(447,7),(448,4),(448,5),(448,6),(448,7),(449,4),(449,5),(449,6),(449,7),(450,4),(450,5),(450,6),(450,7),(451,4),(451,5),(451,6),(451,7),(452,4),(452,5),(452,6),(452,7),(453,4),(453,5),(453,6),(453,7),(454,4),(454,5),(454,6),(454,7),(455,4),(455,5),(455,6),(455,7),(456,4),(456,5),(456,6),(456,7),(457,4),(457,5),(457,6),(457,7),(458,4),(458,5),(458,6),(458,7),(459,4),(459,5),(459,6),(459,7),(460,4),(460,5),(460,6),(460,7),(461,4),(461,5),(461,6),(461,7),(462,4),(462,5),(462,6),(462,7),(463,4),(463,5),(463,6),(463,7),(464,4),(464,5),(464,6),(464,7),(465,4),(465,5),(465,6),(465,7),(466,4),(466,5),(466,6),(466,7),(467,4),(467,5),(467,6),(467,7),(468,4),(468,5),(468,6),(468,7),(469,4),(469,5),(469,6),(469,7),(470,4),(470,5),(470,6),(470,7),(471,4),(471,5),(471,6),(471,7),(472,4),(472,5),(472,6),(472,7),(473,4),(473,5),(473,6),(473,7),(474,4),(474,5),(474,6),(474,7),(475,4),(475,5),(475,6),(475,7),(476,4),(476,5),(476,6),(476,7),(477,4),(477,5),(477,6),(477,7),(478,4),(478,5),(478,6),(478,7),(479,4),(479,5),(479,6),(479,7),(480,4),(480,5),(480,6),(480,7),(481,4),(481,5),(481,6),(481,7),(482,4),(482,5),(482,6),(482,7),(483,4),(483,5),(483,6),(483,7),(484,4),(484,5),(484,6),(484,7),(485,4),(485,5),(485,6),(485,7),(486,4),(486,5),(486,6),(486,7),(487,4),(487,5),(487,6),(487,7),(488,4),(488,5),(488,6),(488,7),(489,4),(489,5),(489,6),(489,7),(490,4),(490,5),(490,6),(490,7),(491,4),(491,5),(491,6),(491,7),(492,4),(492,5),(492,6),(492,7),(493,4),(493,5),(493,6),(493,7),(494,4),(494,5),(494,6),(494,7),(495,4),(495,5),(495,6),(495,7),(496,4),(496,5),(496,6),(496,7),(497,4),(497,5),(497,6),(497,7),(498,4),(498,5),(498,6),(498,7),(499,4),(499,5),(499,6),(499,7),(500,4),(500,5),(500,6),(500,7),(501,4),(501,5),(501,6),(501,7),(502,4),(502,5),(502,6),(502,7),(503,4),(503,5),(503,6),(503,7),(504,4),(504,5),(504,6),(504,7),(505,4),(505,5),(505,6),(505,7),(506,4),(506,5),(506,6),(506,7),(507,4),(507,5),(507,6),(507,7),(508,4),(508,5),(508,6),(508,7),(509,4),(509,5),(509,6),(509,7),(510,4),(510,5),(510,6),(510,7),(511,4),(511,5),(511,6),(511,7),(512,4),(512,5),(512,6),(512,7),(513,4),(513,5),(513,6),(513,7),(514,4),(514,5),(514,6),(514,7),(515,4),(515,5),(515,6),(515,7),(516,4),(516,5),(516,6),(516,7),(517,4),(517,5),(517,6),(517,7),(518,4),(518,5),(518,6),(518,7),(519,4),(519,5),(519,6),(519,7),(520,4),(520,5),(520,6),(520,7),(521,4),(521,5),(521,6),(521,7),(522,4),(522,5),(522,6),(522,7),(523,4),(523,5),(523,6),(523,7),(524,4),(524,5),(524,6),(524,7),(525,4),(525,5),(525,6),(525,7),(526,4),(526,5),(526,6),(526,7),(527,4),(527,5),(527,6),(527,7),(528,4),(528,5),(528,6),(528,7),(529,4),(529,5),(529,6),(529,7),(530,4),(530,5),(530,6),(530,7),(531,4),(531,5),(531,6),(531,7),(532,4),(532,5),(532,6),(532,7),(533,4),(533,5),(533,6),(533,7),(534,4),(534,5),(534,6),(534,7),(535,4),(535,5),(535,6),(535,7),(536,4),(536,5),(536,6),(536,7),(537,4),(537,5),(537,6),(537,7),(538,4),(538,5),(538,6),(538,7),(539,4),(539,5),(539,6),(539,7),(540,4),(540,5),(540,6),(540,7),(541,4),(541,5),(541,6),(541,7),(542,4),(542,5),(542,6),(542,7),(543,4),(543,5),(543,6),(543,7),(544,4),(544,5),(544,6),(544,7),(545,4),(545,5),(545,6),(545,7),(546,4),(546,5),(546,6),(546,7),(547,4),(547,5),(547,6),(547,7),(548,4),(548,5),(548,6),(548,7),(549,4),(549,5),(549,6),(549,7),(550,4),(550,5),(550,6),(550,7),(551,4),(551,5),(551,6),(551,7),(552,4),(552,5),(552,6),(552,7),(553,4),(553,5),(553,6),(553,7),(554,4),(554,5),(554,6),(554,7),(555,4),(555,5),(555,6),(555,7),(556,4),(556,5),(556,6),(556,7),(557,4),(557,5),(557,6),(557,7),(558,4),(558,5),(558,6),(558,7),(559,4),(559,5),(559,6),(559,7),(560,4),(560,5),(560,6),(560,7),(561,4),(561,5),(561,6),(561,7),(562,4),(562,5),(562,6),(562,7),(563,4),(563,5),(563,6),(563,7),(564,4),(564,5),(564,6),(564,7),(565,4),(565,5),(565,6),(565,7),(566,4),(566,5),(566,6),(566,7),(567,4),(567,5),(567,6),(567,7),(568,4),(568,5),(568,6),(568,7),(569,4),(569,5),(569,6),(569,7),(570,4),(570,5),(570,6),(570,7),(571,4),(571,5),(571,6),(571,7),(572,4),(572,5),(572,6),(572,7),(573,4),(573,5),(573,6),(573,7),(574,4),(574,5),(574,6),(574,7),(575,4),(575,5),(575,6),(575,7),(576,4),(576,5),(576,6),(576,7),(577,4),(577,5),(577,6),(577,7),(578,4),(578,5),(578,6),(578,7),(579,4),(579,5),(579,6),(579,7),(580,4),(580,5),(580,6),(580,7),(581,4),(581,5),(581,6),(581,7),(582,4),(582,5),(582,6),(582,7),(583,4),(583,5),(583,6),(583,7),(584,4),(584,5),(584,6),(584,7),(585,4),(585,5),(585,6),(585,7),(586,4),(586,5),(586,6),(586,7),(587,4),(587,5),(587,6),(587,7),(588,4),(588,5),(588,6),(588,7),(589,4),(589,5),(589,6),(589,7),(590,4),(590,5),(590,6),(590,7),(591,4),(591,5),(591,6),(591,7),(592,4),(592,5),(592,6),(592,7),(593,4),(593,5),(593,6),(593,7),(594,4),(594,5),(594,6),(594,7),(595,4),(595,5),(595,6),(595,7),(596,4),(596,5),(596,6),(596,7),(597,4),(597,5),(597,6),(597,7),(598,4),(598,5),(598,6),(598,7),(599,4),(599,5),(599,6),(599,7),(600,4),(600,5),(600,6),(600,7),(601,4),(601,5),(601,6),(601,7),(602,4),(602,5),(602,6),(602,7),(603,4),(603,5),(603,6),(603,7),(604,4),(604,5),(604,6),(604,7),(605,4),(605,5),(605,6),(605,7),(606,4),(606,5),(606,6),(606,7),(607,4),(607,5),(607,6),(607,7),(608,4),(608,5),(608,6),(608,7),(609,4),(609,5),(609,6),(609,7),(610,4),(610,5),(610,6),(610,7),(611,4),(611,5),(611,6),(611,7),(612,4),(612,5),(612,6),(612,7),(613,4),(613,5),(613,6),(613,7),(614,4),(614,5),(614,6),(614,7),(615,4),(615,5),(615,6),(615,7),(616,4),(616,5),(616,6),(616,7),(617,4),(617,5),(617,6),(617,7),(618,4),(618,5),(618,6),(618,7),(619,4),(619,5),(619,6),(619,7),(620,4),(620,5),(620,6),(620,7),(621,4),(621,5),(621,6),(621,7),(622,4),(622,5),(622,6),(622,7),(623,4),(623,5),(623,6),(623,7),(624,4),(624,5),(624,6),(624,7),(625,4),(625,5),(625,6),(625,7),(626,4),(626,5),(626,6),(626,7),(627,4),(627,5),(627,6),(627,7),(628,4),(628,5),(628,6),(628,7),(629,4),(629,5),(629,6),(629,7),(630,4),(630,5),(630,6),(630,7),(631,4),(631,5),(631,6),(631,7),(632,4),(632,5),(632,6),(632,7),(633,4),(633,5),(633,6),(633,7),(634,4),(634,5),(634,6),(634,7),(635,4),(635,5),(635,6),(635,7),(636,4),(636,5),(636,6),(636,7),(637,4),(637,5),(637,6),(637,7),(638,4),(638,5),(638,6),(638,7),(639,4),(639,5),(639,6),(639,7),(640,4),(640,5),(640,6),(640,7),(641,4),(641,5),(641,6),(641,7),(642,4),(642,5),(642,6),(642,7),(643,4),(643,5),(643,6),(643,7),(644,4),(644,5),(644,6),(644,7),(645,4),(645,5),(645,6),(645,7),(646,4),(646,5),(646,6),(646,7),(647,4),(647,5),(647,6),(647,7),(648,4),(648,5),(648,6),(648,7),(649,4),(649,5),(649,6),(649,7),(650,4),(650,5),(650,6),(650,7),(651,4),(651,5),(651,6),(651,7),(652,4),(652,5),(652,6),(652,7),(653,4),(653,5),(653,6),(653,7),(654,4),(654,5),(654,6),(654,7),(655,4),(655,5),(655,6),(655,7),(656,9),(657,1),(658,11),(659,11),(660,11);
/*!40000 ALTER TABLE `product_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_racks`
--

DROP TABLE IF EXISTS `product_racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_racks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `rack` varchar(191) DEFAULT NULL,
  `row` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_racks_business_id_index` (`business_id`),
  KEY `product_racks_location_id_index` (`location_id`),
  KEY `product_racks_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_racks`
--

LOCK TABLES `product_racks` WRITE;
/*!40000 ALTER TABLE `product_racks` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_racks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variations`
--

DROP TABLE IF EXISTS `product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_variations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variations_name_index` (`name`),
  KEY `product_variations_product_id_index` (`product_id`),
  CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=661 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variations`
--

LOCK TABLES `product_variations` WRITE;
/*!40000 ALTER TABLE `product_variations` DISABLE KEYS */;
INSERT INTO `product_variations` VALUES (3,NULL,'DUMMY',3,1,'2023-08-24 16:13:28','2023-08-24 16:13:28'),(657,NULL,'DUMMY',657,1,'2024-01-25 21:10:21','2024-01-25 21:10:21'),(658,NULL,'DUMMY',658,1,'2024-02-01 12:43:48','2024-02-01 12:43:48'),(659,NULL,'DUMMY',659,1,'2024-02-01 12:45:50','2024-02-01 12:45:50'),(660,NULL,'DUMMY',660,1,'2024-02-01 12:47:43','2024-02-01 12:47:43');
/*!40000 ALTER TABLE `product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `type` enum('single','variable','modifier','combo') DEFAULT NULL,
  `package_product` tinyint(1) NOT NULL DEFAULT 0,
  `unit_id` int(11) unsigned DEFAULT NULL,
  `secondary_unit_id` int(11) DEFAULT NULL,
  `sub_unit_ids` text DEFAULT NULL,
  `brand_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `sub_category_id` int(10) unsigned DEFAULT NULL,
  `tax` int(10) unsigned DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(191) DEFAULT NULL,
  `product_custom_field1` varchar(191) DEFAULT NULL,
  `product_custom_field2` varchar(191) DEFAULT NULL,
  `product_custom_field3` varchar(191) DEFAULT NULL,
  `product_custom_field4` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `woocommerce_media_id` int(11) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `woocommerce_product_id` int(11) DEFAULT NULL,
  `woocommerce_disable_sync` tinyint(1) NOT NULL DEFAULT 0,
  `preparation_time_in_minutes` int(11) DEFAULT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT 0,
  `not_for_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_sub_category_id_foreign` (`sub_category_id`),
  KEY `products_tax_foreign` (`tax`),
  KEY `products_name_index` (`name`),
  KEY `products_business_id_index` (`business_id`),
  KEY `products_unit_id_index` (`unit_id`),
  KEY `products_created_by_index` (`created_by`),
  KEY `products_warranty_id_index` (`warranty_id`),
  KEY `products_type_index` (`type`),
  KEY `products_tax_type_index` (`tax_type`),
  KEY `products_barcode_type_index` (`barcode_type`),
  KEY `products_secondary_unit_id_index` (`secondary_unit_id`),
  KEY `products_woocommerce_product_id_index` (`woocommerce_product_id`),
  KEY `products_woocommerce_media_id_index` (`woocommerce_media_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=661 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'Test1',1,'single',0,1,NULL,NULL,NULL,NULL,NULL,NULL,'exclusive',1,NULL,'0003','C128',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,0,0,'2023-08-24 16:13:28','2023-08-24 16:13:28'),(657,'Test2',1,'single',0,1,NULL,NULL,NULL,NULL,NULL,7,'exclusive',1,NULL,'0657','C128',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,0,0,'2024-01-25 21:10:21','2024-01-25 21:10:21'),(658,'4 Circuit Valve',7,'single',0,7,NULL,NULL,NULL,NULL,NULL,8,'exclusive',1,0.0000,'12345','C128',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,0,NULL,NULL,0,0,'2024-02-01 12:43:48','2024-02-01 12:43:48'),(659,'Belt Tensioner',7,'single',0,7,NULL,NULL,NULL,NULL,NULL,NULL,'exclusive',1,0.0000,'0659','C128',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,0,NULL,NULL,0,0,'2024-02-01 12:45:50','2024-02-01 12:45:50'),(660,'Brake Shoe Bushing',7,'single',0,7,NULL,NULL,NULL,NULL,NULL,8,'inclusive',1,0.0000,'0660','C128',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,0,NULL,NULL,0,0,'2024-02-01 12:47:43','2024-02-01 12:47:43');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_lines`
--

DROP TABLE IF EXISTS `purchase_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `variation_id` int(10) unsigned NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) unsigned DEFAULT NULL,
  `purchase_requisition_line_id` int(11) DEFAULT NULL,
  `purchase_order_line_id` int(11) DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `po_quantity_purchased` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  KEY `purchase_lines_product_id_foreign` (`product_id`),
  KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  KEY `purchase_lines_lot_number_index` (`lot_number`),
  CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_lines`
--

LOCK TABLES `purchase_lines` WRITE;
/*!40000 ALTER TABLE `purchase_lines` DISABLE KEYS */;
INSERT INTO `purchase_lines` VALUES (2,5,3,3,100.0000,0.0000,100.0000,0.00,100.0000,100.0000,0.0000,NULL,NULL,NULL,2.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,'2023-08-24 16:13:28','2024-01-21 06:30:03'),(6,15,657,657,100.0000,0.0000,0.0100,0.00,0.0100,0.0114,0.0014,7,NULL,NULL,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,'2024-01-25 21:10:41','2024-01-25 21:10:41'),(7,16,658,658,100.0000,0.0000,0.0100,0.00,0.0100,0.0114,0.0014,8,NULL,NULL,2.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,'2024-02-01 12:43:55','2024-02-01 12:52:32'),(8,17,659,659,100.0000,0.0000,0.0100,0.00,0.0100,0.0100,0.0000,NULL,NULL,NULL,1.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,'2024-02-01 12:45:55','2024-02-01 12:50:57'),(9,18,660,660,100.0000,0.0000,0.0100,0.00,0.0100,0.0114,0.0014,8,NULL,NULL,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,'2024-02-01 12:47:51','2024-02-01 12:47:51');
/*!40000 ALTER TABLE `purchase_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_counts`
--

DROP TABLE IF EXISTS `reference_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ref_type` varchar(191) NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reference_counts_business_id_index` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_counts`
--

LOCK TABLES `reference_counts` WRITE;
/*!40000 ALTER TABLE `reference_counts` DISABLE KEYS */;
INSERT INTO `reference_counts` VALUES (1,'contacts',1,1,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(2,'business_location',1,1,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(3,'contacts',1,2,'2023-08-22 17:06:08','2023-08-22 17:06:08'),(4,'business_location',1,2,'2023-08-22 17:06:08','2023-08-22 17:06:08'),(5,'sell_payment',3,2,'2023-08-22 17:11:23','2023-08-22 17:15:41'),(6,'sell_payment',2,1,'2023-08-24 16:13:32','2024-01-21 06:29:38'),(7,'contacts',2,3,'2023-08-24 10:40:28','2023-08-24 11:05:44'),(8,'business_location',1,3,'2023-08-24 10:40:28','2023-08-24 10:40:28'),(9,'sell_payment',2,3,'2023-08-24 10:49:26','2023-08-24 11:08:46'),(10,'purchase',1,3,'2023-08-24 11:05:53','2023-08-24 11:05:53'),(11,'contacts',1,4,'2023-08-29 08:47:05','2023-08-29 08:47:05'),(12,'business_location',5,4,'2023-08-29 08:47:05','2023-09-06 12:52:08'),(13,'username',1,4,'2023-09-05 14:27:08','2023-09-05 14:27:08'),(14,'contacts',1,5,'2023-09-11 11:48:55','2023-09-11 11:48:55'),(15,'business_location',1,5,'2023-09-11 11:48:55','2023-09-11 11:48:55'),(16,'sell_payment',1,5,'2023-09-11 12:07:28','2023-09-11 12:07:28'),(17,'contacts',1,6,'2023-10-05 10:51:28','2023-10-05 10:51:28'),(18,'business_location',1,6,'2023-10-05 10:51:28','2023-10-05 10:51:28'),(19,'sell_return',1,1,'2024-01-21 06:30:03','2024-01-21 06:30:03'),(20,'contacts',1,7,'2024-02-01 12:31:07','2024-02-01 12:31:07'),(21,'business_location',1,7,'2024-02-01 12:31:08','2024-02-01 12:31:08'),(22,'sell_payment',2,7,'2024-02-01 12:50:57','2024-02-01 12:52:32');
/*!40000 ALTER TABLE `reference_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_product_modifier_sets`
--

DROP TABLE IF EXISTS `res_product_modifier_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product',
  KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`),
  CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_product_modifier_sets`
--

LOCK TABLES `res_product_modifier_sets` WRITE;
/*!40000 ALTER TABLE `res_product_modifier_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `res_product_modifier_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_tables`
--

DROP TABLE IF EXISTS `res_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `res_tables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `res_tables_business_id_foreign` (`business_id`),
  CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_tables`
--

LOCK TABLES `res_tables` WRITE;
/*!40000 ALTER TABLE `res_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `res_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (25,2),(25,19),(26,2),(26,19),(48,2),(48,19),(49,2),(49,19),(50,2),(50,19),(51,2),(51,19),(80,2),(80,19);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_business_id_foreign` (`business_id`),
  CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin#1','web',1,1,0,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(2,'Cashier#1','web',1,0,0,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(18,'Admin#7','web',7,1,0,'2024-02-01 12:31:07','2024-02-01 12:31:07'),(19,'Cashier#7','web',7,0,0,'2024-02-01 12:31:07','2024-02-01 12:31:07');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_line_warranties`
--

DROP TABLE IF EXISTS `sell_line_warranties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_line_warranties`
--

LOCK TABLES `sell_line_warranties` WRITE;
/*!40000 ALTER TABLE `sell_line_warranties` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell_line_warranties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_price_groups`
--

DROP TABLE IF EXISTS `selling_price_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `selling_price_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_price_groups_business_id_foreign` (`business_id`),
  CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_price_groups`
--

LOCK TABLES `selling_price_groups` WRITE;
/*!40000 ALTER TABLE `selling_price_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_price_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_adjustment_lines`
--

DROP TABLE IF EXISTS `stock_adjustment_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `variation_id` int(10) unsigned NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`),
  KEY `stock_adjustment_lines_lot_no_line_id_index` (`lot_no_line_id`),
  CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_adjustment_lines`
--

LOCK TABLES `stock_adjustment_lines` WRITE;
/*!40000 ALTER TABLE `stock_adjustment_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_adjustment_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_adjustments_temp`
--

DROP TABLE IF EXISTS `stock_adjustments_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_adjustments_temp`
--

LOCK TABLES `stock_adjustments_temp` WRITE;
/*!40000 ALTER TABLE `stock_adjustments_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_adjustments_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `package_id` int(10) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `trial_end_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `package_price` decimal(22,4) NOT NULL,
  `package_details` longtext NOT NULL,
  `created_id` int(10) unsigned NOT NULL,
  `paid_via` varchar(191) DEFAULT NULL,
  `payment_transaction_id` varchar(191) DEFAULT NULL,
  `status` enum('approved','waiting','declined') NOT NULL DEFAULT 'waiting',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_business_id_foreign` (`business_id`),
  KEY `subscriptions_package_id_index` (`package_id`),
  KEY `subscriptions_created_id_index` (`created_id`),
  CONSTRAINT `subscriptions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,1,1,'2023-08-11','2073-08-12','2073-08-11',395.0000,'{\"location_count\":0,\"user_count\":0,\"product_count\":0,\"invoice_count\":0,\"name\":\"superadmin private package\",\"crm_module\":\"1\",\"essentials_module\":\"1\",\"manufacturing_module\":\"1\",\"productcatalogue_module\":\"1\",\"project_module\":\"1\",\"woocommerce_module\":\"1\"}',1,'offline','111','approved',NULL,'2023-08-11 13:12:53','2023-08-11 13:12:53'),(7,7,3,'2024-02-01','2025-02-01','2025-02-01',0.0000,'{\"location_count\":\"4\",\"user_count\":\"0\",\"product_count\":\"0\",\"invoice_count\":\"0\",\"name\":\"POS\",\"essentials_module\":\"1\",\"productcatalogue_module\":\"1\"}',1,'offline',NULL,'approved',NULL,'2024-02-01 12:37:55','2024-02-01 12:38:30');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superadmin_communicator_logs`
--

DROP TABLE IF EXISTS `superadmin_communicator_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superadmin_communicator_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_ids` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superadmin_communicator_logs`
--

LOCK TABLES `superadmin_communicator_logs` WRITE;
/*!40000 ALTER TABLE `superadmin_communicator_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `superadmin_communicator_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superadmin_frontend_pages`
--

DROP TABLE IF EXISTS `superadmin_frontend_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superadmin_frontend_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `content` longtext NOT NULL,
  `is_shown` tinyint(1) NOT NULL,
  `menu_order` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superadmin_frontend_pages`
--

LOCK TABLES `superadmin_frontend_pages` WRITE;
/*!40000 ALTER TABLE `superadmin_frontend_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `superadmin_frontend_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES (1,'db_version','6.2.1'),(2,'default_business_active_status','1'),(3,'superadmin_version','4.0'),(4,'app_currency_id','2'),(5,'invoice_business_name','Lookpos'),(6,'invoice_business_landmark','Landmark'),(7,'invoice_business_zip','Zip'),(8,'invoice_business_state','State'),(9,'invoice_business_city','City'),(10,'invoice_business_country','Country'),(11,'email','superadmin@example.com'),(12,'package_expiry_alert_days','5'),(13,'enable_business_based_username','0'),(14,'essentials_version','3.1'),(15,'crm_version','1.4'),(16,'productcatalogue_version','0.8'),(17,'project_version','1.6'),(18,'woocommerce_version','2.9'),(19,'manufacturing_version','2.0'),(20,'superadmin_register_tc',NULL),(21,'welcome_email_subject',NULL),(22,'welcome_email_body',NULL),(23,'additional_js',NULL),(24,'additional_css',NULL),(25,'offline_payment_details','123'),(26,'superadmin_enable_register_tc','0'),(27,'allow_email_settings_to_businesses','0'),(28,'enable_new_business_registration_notification','0'),(29,'enable_new_subscription_notification','0'),(30,'enable_welcome_email','0'),(31,'enable_offline_payment','1');
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `for_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) unsigned NOT NULL,
  `woocommerce_tax_rate_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_rates_business_id_foreign` (`business_id`),
  KEY `tax_rates_created_by_foreign` (`created_by`),
  KEY `tax_rates_woocommerce_tax_rate_id_index` (`woocommerce_tax_rate_id`),
  CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
INSERT INTO `tax_rates` VALUES (7,1,'Vat',14.0000,0,0,1,NULL,NULL,'2024-01-25 21:07:56','2024-01-25 21:07:56'),(8,7,'VAT14',14.0000,0,0,15,NULL,NULL,'2024-02-01 12:37:11','2024-02-01 12:37:11');
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_payments`
--

DROP TABLE IF EXISTS `transaction_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) unsigned DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `method` varchar(191) DEFAULT NULL,
  `payment_type` varchar(191) DEFAULT NULL,
  `transaction_no` varchar(191) DEFAULT NULL,
  `card_transaction_number` varchar(191) DEFAULT NULL,
  `card_number` varchar(191) DEFAULT NULL,
  `card_type` varchar(191) DEFAULT NULL,
  `card_holder_name` varchar(191) DEFAULT NULL,
  `card_month` varchar(191) DEFAULT NULL,
  `card_year` varchar(191) DEFAULT NULL,
  `card_security` varchar(5) DEFAULT NULL,
  `cheque_number` varchar(191) DEFAULT NULL,
  `bank_account_number` varchar(191) DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `paid_through_link` tinyint(1) NOT NULL DEFAULT 0,
  `gateway` varchar(191) DEFAULT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT 0,
  `payment_for` int(11) DEFAULT NULL COMMENT 'stores the contact id',
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `payment_ref_no` varchar(191) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_payments_created_by_index` (`created_by`),
  KEY `transaction_payments_parent_id_index` (`parent_id`),
  KEY `transaction_payments_payment_type_index` (`payment_type`),
  CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_payments`
--

LOCK TABLES `transaction_payments` WRITE;
/*!40000 ALTER TABLE `transaction_payments` DISABLE KEYS */;
INSERT INTO `transaction_payments` VALUES (4,6,1,0,1000.0000,'cash',NULL,NULL,NULL,NULL,'credit',NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-24 18:13:32',1,0,NULL,0,1,NULL,NULL,NULL,'SP2023/0001',NULL,'2023-08-24 16:13:32','2023-08-24 16:13:32'),(8,13,1,0,2000.0000,'cash',NULL,NULL,NULL,NULL,'credit',NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-21 07:29:38',1,0,NULL,0,1,NULL,NULL,NULL,'SP2024/0002',NULL,'2024-01-21 06:29:38','2024-01-21 06:29:38'),(9,19,7,0,16400.0000,'cash',NULL,NULL,NULL,NULL,'credit',NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-01 13:50:57',15,0,NULL,0,8,NULL,NULL,NULL,'SP2024/0001',NULL,'2024-02-01 12:50:57','2024-02-01 12:50:57'),(10,20,7,0,10900.0000,'cash',NULL,NULL,NULL,NULL,'credit',NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-01 13:52:32',15,0,NULL,0,8,NULL,NULL,NULL,'SP2024/0002',NULL,'2024-02-01 12:52:32','2024-02-01 12:52:32');
/*!40000 ALTER TABLE `transaction_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_sell_lines`
--

DROP TABLE IF EXISTS `transaction_sell_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_sell_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `variation_id` int(10) unsigned NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_waste_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) unsigned DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text DEFAULT NULL,
  `woocommerce_line_items_id` int(11) DEFAULT NULL,
  `so_line_id` int(11) DEFAULT NULL,
  `so_quantity_invoiced` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  KEY `transaction_sell_lines_children_type_index` (`children_type`),
  KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`),
  KEY `transaction_sell_lines_line_discount_type_index` (`line_discount_type`),
  KEY `transaction_sell_lines_discount_id_index` (`discount_id`),
  KEY `transaction_sell_lines_lot_no_line_id_index` (`lot_no_line_id`),
  KEY `transaction_sell_lines_sub_unit_id_index` (`sub_unit_id`),
  KEY `transaction_sell_lines_woocommerce_line_items_id_index` (`woocommerce_line_items_id`),
  CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_sell_lines`
--

LOCK TABLES `transaction_sell_lines` WRITE;
/*!40000 ALTER TABLE `transaction_sell_lines` DISABLE KEYS */;
INSERT INTO `transaction_sell_lines` VALUES (4,6,3,3,1.0000,0.0000,0.0000,0.0000,1000.0000,1000.0000,'fixed',0.0000,1000.0000,0.0000,NULL,NULL,NULL,'',NULL,NULL,0.0000,NULL,NULL,NULL,'',NULL,'2023-08-24 16:13:32','2023-08-24 16:13:32'),(8,13,3,3,2.0000,0.0000,0.0000,1.0000,1000.0000,1000.0000,'fixed',0.0000,1000.0000,0.0000,NULL,NULL,NULL,'',NULL,NULL,0.0000,NULL,NULL,NULL,'',NULL,'2024-01-21 06:29:38','2024-01-21 06:30:03'),(9,19,658,658,1.0000,0.0000,0.0000,0.0000,10000.0000,10000.0000,'fixed',0.0000,11400.0000,1400.0000,8,NULL,NULL,'',NULL,NULL,0.0000,NULL,NULL,NULL,'',NULL,'2024-02-01 12:50:57','2024-02-01 12:50:57'),(10,19,659,659,1.0000,0.0000,0.0000,0.0000,5000.0000,5000.0000,'fixed',0.0000,5000.0000,0.0000,NULL,NULL,NULL,'',NULL,NULL,0.0000,NULL,NULL,NULL,'',NULL,'2024-02-01 12:50:57','2024-02-01 12:50:57'),(11,20,658,658,1.0000,0.0000,0.0000,0.0000,10000.0000,10000.0000,'fixed',0.0000,11400.0000,1400.0000,8,NULL,NULL,'',NULL,NULL,0.0000,NULL,NULL,NULL,'',NULL,'2024-02-01 12:52:32','2024-02-01 12:52:32');
/*!40000 ALTER TABLE `transaction_sell_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

DROP TABLE IF EXISTS `transaction_sell_lines_purchase_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sell_line_id` int(10) unsigned DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) unsigned DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) unsigned NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sell_line_id` (`sell_line_id`),
  KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  KEY `purchase_line_id` (`purchase_line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

LOCK TABLES `transaction_sell_lines_purchase_lines` WRITE;
/*!40000 ALTER TABLE `transaction_sell_lines_purchase_lines` DISABLE KEYS */;
INSERT INTO `transaction_sell_lines_purchase_lines` VALUES (1,3,NULL,1,1.0000,0.0000,'2023-08-22 17:15:41','2023-08-22 17:15:41'),(2,4,NULL,2,1.0000,0.0000,'2023-08-24 16:13:32','2023-08-24 16:13:32'),(3,5,NULL,3,1.0000,0.0000,'2023-08-24 10:49:26','2023-08-24 10:49:26'),(4,6,NULL,4,1.0000,0.0000,'2023-08-24 11:08:46','2023-08-24 11:08:46'),(5,8,NULL,2,2.0000,1.0000,'2024-01-21 06:29:38','2024-01-21 06:30:03'),(6,9,NULL,7,1.0000,0.0000,'2024-02-01 12:50:57','2024-02-01 12:50:57'),(7,10,NULL,8,1.0000,0.0000,'2024-02-01 12:50:57','2024-02-01 12:50:57'),(8,11,NULL,7,1.0000,0.0000,'2024-02-01 12:52:32','2024-02-01 12:52:32');
/*!40000 ALTER TABLE `transaction_sell_lines_purchase_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned DEFAULT NULL,
  `res_table_id` int(10) unsigned DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) unsigned DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `sub_type` varchar(20) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `sub_status` varchar(191) DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` enum('paid','due','partial') DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') DEFAULT NULL,
  `contact_id` int(11) unsigned DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) DEFAULT NULL,
  `ref_no` varchar(191) DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `subscription_no` varchar(191) DEFAULT NULL,
  `subscription_repeat_on` varchar(191) DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) unsigned DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `discount_type` enum('fixed','percentage') DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT 0.0000,
  `rp_redeemed` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `shipping_status` varchar(191) DEFAULT NULL,
  `delivered_to` varchar(191) DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `shipping_custom_field_1` varchar(191) DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_fields_info` longtext DEFAULT NULL,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Difference of rounded total and actual total',
  `additional_expense_key_1` varchar(191) DEFAULT NULL,
  `additional_expense_value_1` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_2` varchar(191) DEFAULT NULL,
  `additional_expense_value_2` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_3` varchar(191) DEFAULT NULL,
  `additional_expense_value_3` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_4` varchar(191) DEFAULT NULL,
  `additional_expense_value_4` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `final_total` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `expense_category_id` int(10) unsigned DEFAULT NULL,
  `expense_sub_category_id` int(11) DEFAULT NULL,
  `expense_for` int(10) unsigned DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0,
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `mfg_parent_production_purchase_id` int(11) DEFAULT NULL,
  `mfg_wasted_units` decimal(22,4) DEFAULT NULL,
  `mfg_production_cost` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_is_final` tinyint(1) NOT NULL DEFAULT 0,
  `woocommerce_order_id` int(11) DEFAULT NULL,
  `crm_is_order_request` tinyint(1) NOT NULL DEFAULT 0,
  `essentials_duration` decimal(8,2) NOT NULL,
  `essentials_duration_unit` varchar(20) DEFAULT NULL,
  `essentials_amount_per_unit_duration` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `essentials_allowances` text DEFAULT NULL,
  `essentials_deductions` text DEFAULT NULL,
  `purchase_requisition_ids` text DEFAULT NULL,
  `prefer_payment_method` varchar(191) DEFAULT NULL,
  `prefer_payment_account` int(11) DEFAULT NULL,
  `sales_order_ids` text DEFAULT NULL,
  `purchase_order_ids` text DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `service_custom_field_1` text DEFAULT NULL,
  `service_custom_field_2` text DEFAULT NULL,
  `service_custom_field_3` text DEFAULT NULL,
  `service_custom_field_4` text DEFAULT NULL,
  `service_custom_field_5` text DEFAULT NULL,
  `service_custom_field_6` text DEFAULT NULL,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT 0,
  `rp_earned` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `order_addresses` text DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `pjt_project_id` int(10) unsigned DEFAULT NULL,
  `pjt_title` varchar(191) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_tax_id_foreign` (`tax_id`),
  KEY `transactions_business_id_index` (`business_id`),
  KEY `transactions_type_index` (`type`),
  KEY `transactions_contact_id_index` (`contact_id`),
  KEY `transactions_transaction_date_index` (`transaction_date`),
  KEY `transactions_created_by_index` (`created_by`),
  KEY `transactions_location_id_index` (`location_id`),
  KEY `transactions_expense_for_foreign` (`expense_for`),
  KEY `transactions_expense_category_id_index` (`expense_category_id`),
  KEY `transactions_sub_type_index` (`sub_type`),
  KEY `transactions_return_parent_id_index` (`return_parent_id`),
  KEY `type` (`type`),
  KEY `transactions_status_index` (`status`),
  KEY `transactions_sub_status_index` (`sub_status`),
  KEY `transactions_res_table_id_index` (`res_table_id`),
  KEY `transactions_res_waiter_id_index` (`res_waiter_id`),
  KEY `transactions_res_order_status_index` (`res_order_status`),
  KEY `transactions_payment_status_index` (`payment_status`),
  KEY `transactions_discount_type_index` (`discount_type`),
  KEY `transactions_commission_agent_index` (`commission_agent`),
  KEY `transactions_transfer_parent_id_index` (`transfer_parent_id`),
  KEY `transactions_types_of_service_id_index` (`types_of_service_id`),
  KEY `transactions_packing_charge_type_index` (`packing_charge_type`),
  KEY `transactions_recur_parent_id_index` (`recur_parent_id`),
  KEY `transactions_selling_price_group_id_index` (`selling_price_group_id`),
  KEY `transactions_delivery_date_index` (`delivery_date`),
  KEY `transactions_pjt_project_id_foreign` (`pjt_project_id`),
  KEY `transactions_woocommerce_order_id_index` (`woocommerce_order_id`),
  CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  CONSTRAINT `transactions_pjt_project_id_foreign` FOREIGN KEY (`pjt_project_id`) REFERENCES `pjt_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (5,1,1,NULL,NULL,NULL,'opening_stock',NULL,'received',NULL,0,'paid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-01 18:13:28',10000.0000,NULL,0.0000,NULL,0.0000,0,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,10000.0000,NULL,NULL,NULL,NULL,NULL,0,0,1.000,NULL,NULL,NULL,3,1,NULL,NULL,0.0000,0,NULL,0,0.00,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-24 16:13:28','2023-08-24 16:13:28'),(6,1,1,NULL,NULL,NULL,'sell',NULL,'final',NULL,0,'paid',NULL,1,NULL,'0001','',NULL,NULL,NULL,'2023-08-24 18:13:32',1000.0000,NULL,0.0000,'percentage',0.0000,0,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,1000.0000,NULL,NULL,NULL,NULL,NULL,0,0,1.000,NULL,NULL,NULL,NULL,1,NULL,NULL,0.0000,0,NULL,0,0.00,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,1.0000,'days',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2023-08-24 16:13:32','2023-08-24 16:13:32'),(13,1,1,NULL,NULL,NULL,'sell',NULL,'final',NULL,0,'paid',NULL,1,NULL,'0002','',NULL,NULL,NULL,'2024-01-21 07:29:38',2000.0000,NULL,0.0000,'percentage',0.0000,0,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,2000.0000,NULL,NULL,NULL,NULL,NULL,0,0,1.000,NULL,NULL,NULL,NULL,1,NULL,NULL,0.0000,0,NULL,0,0.00,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,1.0000,'days',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2024-01-21 06:29:38','2024-01-21 06:29:38'),(14,1,1,NULL,NULL,NULL,'sell_return',NULL,'final',NULL,0,'due',NULL,1,NULL,'CN2024/0001',NULL,NULL,NULL,NULL,'2024-01-21 07:29:00',1000.0000,NULL,0.0000,'percentage',0.0000,0,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,1000.0000,NULL,NULL,NULL,NULL,NULL,0,0,1.000,NULL,NULL,13,NULL,1,NULL,NULL,0.0000,0,NULL,0,0.00,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-21 06:30:03','2024-01-21 06:30:03'),(15,1,1,NULL,NULL,NULL,'opening_stock',NULL,'received',NULL,0,'paid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-01 22:10:41',0.0114,NULL,0.0000,NULL,0.0000,0,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,1.1400,NULL,NULL,NULL,NULL,NULL,0,0,1.000,NULL,NULL,NULL,657,1,NULL,NULL,0.0000,0,NULL,0,0.00,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-25 21:10:41','2024-01-25 21:10:41'),(16,7,11,NULL,NULL,NULL,'opening_stock',NULL,'received',NULL,0,'paid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-01 13:43:55',0.0114,NULL,0.0000,NULL,0.0000,0,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,1.1400,NULL,NULL,NULL,NULL,NULL,0,0,1.000,NULL,NULL,NULL,658,15,NULL,NULL,0.0000,0,NULL,0,0.00,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-01 12:43:55','2024-02-01 12:43:55'),(17,7,11,NULL,NULL,NULL,'opening_stock',NULL,'received',NULL,0,'paid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-01 13:45:55',0.0100,NULL,0.0000,NULL,0.0000,0,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,1.0000,NULL,NULL,NULL,NULL,NULL,0,0,1.000,NULL,NULL,NULL,659,15,NULL,NULL,0.0000,0,NULL,0,0.00,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-01 12:45:55','2024-02-01 12:45:55'),(18,7,11,NULL,NULL,NULL,'opening_stock',NULL,'received',NULL,0,'paid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-01-01 13:47:51',0.0114,NULL,0.0000,NULL,0.0000,0,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,1.1400,NULL,NULL,NULL,NULL,NULL,0,0,1.000,NULL,NULL,NULL,660,15,NULL,NULL,0.0000,0,NULL,0,0.00,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-01 12:47:51','2024-02-01 12:47:51'),(19,7,11,NULL,NULL,NULL,'sell',NULL,'final',NULL,0,'paid',NULL,8,NULL,'EBD-000000','',NULL,NULL,NULL,'2024-02-01 13:50:57',16400.0000,NULL,0.0000,'percentage',0.0000,0,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,16400.0000,NULL,NULL,NULL,NULL,NULL,0,0,1.000,NULL,NULL,NULL,NULL,15,NULL,NULL,0.0000,0,NULL,0,0.00,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,1.0000,'days',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2024-02-01 12:50:57','2024-02-01 12:50:57'),(20,7,11,NULL,NULL,NULL,'sell',NULL,'final',NULL,0,'paid',NULL,8,NULL,'EBD-000001','',NULL,NULL,NULL,'2024-02-01 13:52:32',11400.0000,NULL,0.0000,'fixed',500.0000,0,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,NULL,0.0000,10900.0000,NULL,NULL,NULL,NULL,NULL,0,0,1.000,NULL,NULL,NULL,NULL,15,NULL,NULL,0.0000,0,NULL,0,0.00,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,1.0000,'days',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2024-02-01 12:52:32','2024-02-01 12:52:32');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_of_services`
--

DROP TABLE IF EXISTS `types_of_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types_of_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `location_price_group` text DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `types_of_services_business_id_index` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_of_services`
--

LOCK TABLES `types_of_services` WRITE;
/*!40000 ALTER TABLE `types_of_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `types_of_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(10) unsigned NOT NULL,
  `actual_name` varchar(191) NOT NULL,
  `short_name` varchar(191) NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `units_business_id_foreign` (`business_id`),
  KEY `units_created_by_foreign` (`created_by`),
  KEY `units_base_unit_id_index` (`base_unit_id`),
  CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,1,'Pieces','Pc(s)',0,NULL,NULL,1,NULL,'2023-08-11 13:03:45','2023-08-11 13:03:45'),(7,7,'Pieces','Pc(s)',0,NULL,NULL,15,NULL,'2024-02-01 12:31:07','2024-02-01 12:31:07');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_contact_access`
--

DROP TABLE IF EXISTS `user_contact_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_contact_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_contact_access_user_id_index` (`user_id`),
  KEY `user_contact_access_contact_id_index` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_contact_access`
--

LOCK TABLES `user_contact_access` WRITE;
/*!40000 ALTER TABLE `user_contact_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contact_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) NOT NULL DEFAULT 'user',
  `surname` char(10) DEFAULT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `language` char(7) NOT NULL DEFAULT 'en',
  `contact_no` char(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `business_id` int(10) unsigned DEFAULT NULL,
  `essentials_department_id` int(11) DEFAULT NULL,
  `essentials_designation_id` int(11) DEFAULT NULL,
  `essentials_salary` decimal(22,4) DEFAULT NULL,
  `essentials_pay_period` varchar(191) DEFAULT NULL,
  `essentials_pay_cycle` varchar(191) DEFAULT NULL,
  `available_at` datetime DEFAULT NULL COMMENT 'Service staff avilable at. Calculated from product preparation_time_in_minutes',
  `paused_at` datetime DEFAULT NULL COMMENT 'Service staff available time paused at, Will be nulled on resume.',
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('active','inactive','terminated') NOT NULL DEFAULT 'active',
  `crm_contact_id` int(10) unsigned DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT 0,
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT 0.00,
  `selected_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') DEFAULT NULL,
  `blood_group` char(10) DEFAULT NULL,
  `contact_number` char(20) DEFAULT NULL,
  `alt_number` varchar(191) DEFAULT NULL,
  `family_number` varchar(191) DEFAULT NULL,
  `fb_link` varchar(191) DEFAULT NULL,
  `twitter_link` varchar(191) DEFAULT NULL,
  `social_media_1` varchar(191) DEFAULT NULL,
  `social_media_2` varchar(191) DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `guardian_name` varchar(191) DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `bank_details` longtext DEFAULT NULL,
  `id_proof_name` varchar(191) DEFAULT NULL,
  `id_proof_number` varchar(191) DEFAULT NULL,
  `crm_department` varchar(191) DEFAULT NULL COMMENT 'Contact person''s department',
  `crm_designation` varchar(191) DEFAULT NULL COMMENT 'Contact person''s designation',
  `location_id` int(11) DEFAULT NULL COMMENT 'user primary work location',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_business_id_foreign` (`business_id`),
  KEY `users_user_type_index` (`user_type`),
  KEY `users_essentials_department_id_index` (`essentials_department_id`),
  KEY `users_essentials_designation_id_index` (`essentials_designation_id`),
  KEY `users_crm_contact_id_index` (`crm_contact_id`),
  CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_crm_contact_id_foreign` FOREIGN KEY (`crm_contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user','Mr','super','admin','superadmin','superadmin@gmail.com','$2y$10$.nyZk4ed8d2nDILpCRGQQOvIvUeLU/MNnTF9yoY7Kj7oluycr7SJK','en',NULL,NULL,'6uLTmHHaEn1Y9flpmRQ9V5eFydOcGXMl2YRlOGiqbtvu3Lu7FiWVUie6jard',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'active',NULL,0,0.00,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-08-11 13:03:45','2023-08-29 18:09:46'),(15,'user','Mr.','Omar',NULL,'admin_tracparts','tracparts@computingcore.net','$2y$10$IhFEzKB4dtDGcWsSs.5UAuxURguOEXOL47VmhiPC2gGFypK.lF1PG','en',NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'active',NULL,0,0.00,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-01 12:31:07','2024-02-01 12:31:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_group_prices`
--

DROP TABLE IF EXISTS `variation_group_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variation_group_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `variation_id` int(10) unsigned NOT NULL,
  `price_group_id` int(10) unsigned NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`),
  CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_group_prices`
--

LOCK TABLES `variation_group_prices` WRITE;
/*!40000 ALTER TABLE `variation_group_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_group_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_location_details`
--

DROP TABLE IF EXISTS `variation_location_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variation_location_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `product_variation_id` int(10) unsigned NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_location_details_location_id_foreign` (`location_id`),
  KEY `variation_location_details_product_id_index` (`product_id`),
  KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  KEY `variation_location_details_variation_id_index` (`variation_id`),
  CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_location_details`
--

LOCK TABLES `variation_location_details` WRITE;
/*!40000 ALTER TABLE `variation_location_details` DISABLE KEYS */;
INSERT INTO `variation_location_details` VALUES (2,3,3,3,1,98.0000,'2023-08-24 16:13:28','2024-01-21 06:30:03'),(5,657,657,657,1,100.0000,'2024-01-25 21:10:41','2024-01-25 21:10:41'),(6,658,658,658,11,98.0000,'2024-02-01 12:43:55','2024-02-01 12:52:32'),(7,659,659,659,11,99.0000,'2024-02-01 12:45:55','2024-02-01 12:50:57'),(8,660,660,660,11,100.0000,'2024-02-01 12:47:51','2024-02-01 12:47:51');
/*!40000 ALTER TABLE `variation_location_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_templates`
--

DROP TABLE IF EXISTS `variation_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variation_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) unsigned NOT NULL,
  `woocommerce_attr_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_templates_business_id_foreign` (`business_id`),
  KEY `variation_templates_woocommerce_attr_id_index` (`woocommerce_attr_id`),
  CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_templates`
--

LOCK TABLES `variation_templates` WRITE;
/*!40000 ALTER TABLE `variation_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_value_templates`
--

DROP TABLE IF EXISTS `variation_value_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variation_value_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `variation_template_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_value_templates_name_index` (`name`),
  KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`),
  CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_value_templates`
--

LOCK TABLES `variation_value_templates` WRITE;
/*!40000 ALTER TABLE `variation_value_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_value_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variations`
--

DROP TABLE IF EXISTS `variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `sub_sku` varchar(191) DEFAULT NULL,
  `product_variation_id` int(10) unsigned NOT NULL,
  `woocommerce_variation_id` int(11) DEFAULT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `profit_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text DEFAULT NULL COMMENT 'Contains the combo variation details',
  PRIMARY KEY (`id`),
  KEY `variations_product_id_foreign` (`product_id`),
  KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  KEY `variations_name_index` (`name`),
  KEY `variations_sub_sku_index` (`sub_sku`),
  KEY `variations_variation_value_id_index` (`variation_value_id`),
  KEY `variations_woocommerce_variation_id_index` (`woocommerce_variation_id`),
  CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=661 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variations`
--

LOCK TABLES `variations` WRITE;
/*!40000 ALTER TABLE `variations` DISABLE KEYS */;
INSERT INTO `variations` VALUES (3,'DUMMY',3,'0003',3,NULL,NULL,100.0000,100.0000,900.0000,1000.0000,1000.0000,'2023-08-24 16:13:28','2023-08-24 16:13:28',NULL,'[]'),(657,'DUMMY',657,'0657',657,NULL,NULL,0.0100,0.0100,9999900.0000,1000.0000,1140.0000,'2024-01-25 21:10:21','2024-01-25 21:10:21',NULL,'[]'),(658,'DUMMY',658,'12345',658,NULL,NULL,0.0100,0.0100,99999900.0000,10000.0000,11400.0000,'2024-02-01 12:43:48','2024-02-01 12:43:48',NULL,'[]'),(659,'DUMMY',659,'0659',659,NULL,NULL,0.0100,0.0100,49999900.0000,5000.0000,5000.0000,'2024-02-01 12:45:50','2024-02-01 12:45:50',NULL,'[]'),(660,'DUMMY',660,'0660',660,NULL,NULL,0.0100,0.0100,8771829.8200,877.1900,1000.0000,'2024-02-01 12:47:43','2024-02-01 12:47:43',NULL,'[]');
/*!40000 ALTER TABLE `variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warranties`
--

DROP TABLE IF EXISTS `warranties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warranties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warranties_business_id_index` (`business_id`),
  KEY `warranties_duration_type_index` (`duration_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warranties`
--

LOCK TABLES `warranties` WRITE;
/*!40000 ALTER TABLE `warranties` DISABLE KEYS */;
/*!40000 ALTER TABLE `warranties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `woocommerce_sync_logs`
--

DROP TABLE IF EXISTS `woocommerce_sync_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `woocommerce_sync_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `sync_type` varchar(191) NOT NULL,
  `operation_type` varchar(191) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `woocommerce_sync_logs`
--

LOCK TABLES `woocommerce_sync_logs` WRITE;
/*!40000 ALTER TABLE `woocommerce_sync_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `woocommerce_sync_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbtemplate'
--

--
-- Dumping routines for database 'dbtemplate'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 18:53:07
