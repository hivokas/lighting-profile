-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: personal_lighting_profile_managing_system
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu18.04.1

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
-- Table structure for table `flat_part_user`
--

DROP TABLE IF EXISTS `flat_part_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flat_part_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flat_part_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `brightness_percentage` int(10) unsigned NOT NULL DEFAULT '100',
  `reacts_to_movements` tinyint(1) NOT NULL DEFAULT '1',
  `turn_off_timer` int(10) unsigned NOT NULL DEFAULT '3600',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flat_part_user_flat_part_id_user_id_unique` (`flat_part_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flat_part_user`
--

LOCK TABLES `flat_part_user` WRITE;
/*!40000 ALTER TABLE `flat_part_user` DISABLE KEYS */;
INSERT INTO `flat_part_user` VALUES (1,2,1,100,1,3600),(2,12,1,100,1,3600),(3,3,1,100,1,3600),(4,11,1,99,1,10),(5,26,1,100,1,3600),(6,27,1,80,1,90),(8,55,1,12,1,12),(9,54,1,23,1,23);
/*!40000 ALTER TABLE `flat_part_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flat_parts`
--

DROP TABLE IF EXISTS `flat_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flat_parts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flat_type_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flat_parts`
--

LOCK TABLES `flat_parts` WRITE;
/*!40000 ALTER TABLE `flat_parts` DISABLE KEYS */;
INSERT INTO `flat_parts` VALUES (26,1,'toilet','2018-11-21 23:14:14','2018-11-21 23:14:14'),(27,1,'room #1','2018-11-21 23:14:14','2018-11-21 23:14:14'),(28,1,'kitchen','2018-11-21 23:14:14','2018-11-21 23:14:14'),(29,1,'entrance hall','2018-11-21 23:14:14','2018-11-21 23:14:14'),(30,2,'room #1','2018-11-21 23:14:14','2018-11-21 23:14:14'),(31,2,'entrance hall','2018-11-21 23:14:14','2018-11-21 23:14:14'),(32,2,'kitchen','2018-11-21 23:14:14','2018-11-21 23:14:14'),(33,2,'room #2','2018-11-21 23:14:14','2018-11-21 23:14:14'),(34,2,'toilet','2018-11-21 23:14:14','2018-11-21 23:14:14'),(35,3,'kitchen','2018-11-21 23:14:14','2018-11-21 23:14:14'),(36,3,'toilet','2018-11-21 23:14:14','2018-11-21 23:14:14'),(37,3,'room #1','2018-11-21 23:14:14','2018-11-21 23:14:14'),(38,3,'room #2','2018-11-21 23:14:14','2018-11-21 23:14:14'),(39,3,'room #3','2018-11-21 23:14:14','2018-11-21 23:14:14'),(40,3,'entrance hall','2018-11-21 23:14:14','2018-11-21 23:14:14'),(41,4,'room #3','2018-11-21 23:14:14','2018-11-21 23:14:14'),(42,4,'room #4','2018-11-21 23:14:14','2018-11-21 23:14:14'),(43,4,'room #1','2018-11-21 23:14:14','2018-11-21 23:14:14'),(44,4,'kitchen','2018-11-21 23:14:14','2018-11-21 23:14:14'),(45,4,'toilet','2018-11-21 23:14:14','2018-11-21 23:14:14'),(46,4,'entrance hall','2018-11-21 23:14:14','2018-11-21 23:14:14'),(47,4,'room #2','2018-11-21 23:14:14','2018-11-21 23:14:14'),(48,5,'toilet','2018-11-21 23:14:14','2018-11-21 23:14:14'),(49,5,'room #2','2018-11-21 23:14:14','2018-11-21 23:14:14'),(50,5,'room #4','2018-11-21 23:14:14','2018-11-21 23:14:14'),(51,5,'room #5','2018-11-21 23:14:14','2018-11-21 23:14:14'),(52,5,'entrance hall','2018-11-21 23:14:14','2018-11-21 23:14:14'),(53,5,'kitchen','2018-11-21 23:14:14','2018-11-21 23:14:14'),(54,5,'room #3','2018-11-21 23:14:14','2018-11-21 23:14:14'),(55,5,'room #1','2018-11-21 23:14:14','2018-11-21 23:14:14');
/*!40000 ALTER TABLE `flat_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flat_type_user`
--

DROP TABLE IF EXISTS `flat_type_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flat_type_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flat_type_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flat_type_user_flat_type_id_user_id_unique` (`flat_type_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flat_type_user`
--

LOCK TABLES `flat_type_user` WRITE;
/*!40000 ALTER TABLE `flat_type_user` DISABLE KEYS */;
INSERT INTO `flat_type_user` VALUES (5,1,1),(10,1,32),(1,2,1),(3,3,1),(8,5,1);
/*!40000 ALTER TABLE `flat_type_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flat_types`
--

DROP TABLE IF EXISTS `flat_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flat_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flat_types`
--

LOCK TABLES `flat_types` WRITE;
/*!40000 ALTER TABLE `flat_types` DISABLE KEYS */;
INSERT INTO `flat_types` VALUES (1,'one-roomed flat','2018-11-21 20:31:31','2018-11-21 23:07:59'),(2,'two-roomed flat','2018-11-21 20:31:31','2018-11-21 23:07:59'),(3,'three-roomed flat','2018-11-21 20:31:31','2018-11-21 23:07:59'),(4,'four-roomed flat','2018-11-21 20:31:31','2018-11-21 23:07:59'),(5,'five-roomed flat','2018-11-21 20:31:31','2018-11-21 23:07:59');
/*!40000 ALTER TABLE `flat_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flats`
--

DROP TABLE IF EXISTS `flats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `flat_type_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flats`
--

LOCK TABLES `flats` WRITE;
/*!40000 ALTER TABLE `flats` DISABLE KEYS */;
INSERT INTO `flats` VALUES (1,29,5,'necessitatibus quis','2018-11-21 20:31:31','2018-11-21 20:31:31'),(2,2,4,'odit error','2018-11-21 20:31:31','2018-11-21 20:31:31'),(3,4,2,'itaque amet','2018-11-21 20:31:31','2018-11-21 20:31:31'),(4,24,3,'iste rem','2018-11-21 20:31:31','2018-11-21 20:31:31'),(5,23,4,'similique voluptas','2018-11-21 20:31:31','2018-11-21 20:31:31'),(6,25,4,'possimus reprehenderit','2018-11-21 20:31:31','2018-11-21 20:31:31'),(7,7,2,'voluptatibus facere','2018-11-21 20:31:31','2018-11-21 20:31:31'),(8,11,5,'illum consequatur','2018-11-21 20:31:31','2018-11-21 20:31:31'),(9,21,5,'exercitationem deserunt','2018-11-21 20:31:31','2018-11-21 20:31:31'),(10,4,5,'laboriosam nihil','2018-11-21 20:31:31','2018-11-21 20:31:31'),(11,26,3,'ratione quis','2018-11-21 20:31:31','2018-11-21 20:31:31'),(12,30,2,'id aperiam','2018-11-21 20:31:31','2018-11-21 20:31:31'),(13,20,2,'corrupti nihil','2018-11-21 20:31:31','2018-11-21 20:31:31'),(14,3,5,'rerum iste','2018-11-21 20:31:31','2018-11-21 20:31:31'),(15,3,5,'reiciendis vel','2018-11-21 20:31:31','2018-11-21 20:31:31'),(16,11,3,'quasi consequatur','2018-11-21 20:31:31','2018-11-21 20:31:31'),(17,29,3,'nihil praesentium','2018-11-21 20:31:31','2018-11-21 20:31:31'),(18,29,1,'qui autem','2018-11-21 20:31:31','2018-11-21 20:31:31'),(19,30,5,'dolor corporis','2018-11-21 20:31:31','2018-11-21 20:31:31'),(20,30,4,'dolores consequatur','2018-11-21 20:31:31','2018-11-21 20:31:31'),(21,29,2,'aliquam commodi','2018-11-21 20:31:31','2018-11-21 20:31:31'),(22,18,2,'voluptate commodi','2018-11-21 20:31:31','2018-11-21 20:31:31'),(23,22,1,'ipsum ab','2018-11-21 20:31:31','2018-11-21 20:31:31'),(24,29,2,'commodi aut','2018-11-21 20:31:31','2018-11-21 20:31:31'),(25,3,3,'at voluptatem','2018-11-21 20:31:31','2018-11-21 20:31:31'),(26,6,3,'laudantium similique','2018-11-21 20:31:31','2018-11-21 20:31:31'),(27,7,2,'eum repellendus','2018-11-21 20:31:31','2018-11-21 20:31:31'),(28,9,4,'magnam molestiae','2018-11-21 20:31:31','2018-11-21 20:31:31'),(29,17,3,'facere illum','2018-11-21 20:31:31','2018-11-21 20:31:31'),(30,27,5,'eligendi corrupti','2018-11-21 20:31:31','2018-11-21 20:31:31'),(31,17,1,'voluptate quos','2018-11-21 20:31:31','2018-11-21 20:31:31'),(32,25,3,'debitis eaque','2018-11-21 20:31:31','2018-11-21 20:31:31'),(33,15,4,'commodi rerum','2018-11-21 20:31:31','2018-11-21 20:31:31'),(34,14,5,'maxime ducimus','2018-11-21 20:31:31','2018-11-21 20:31:31'),(35,18,5,'dolorum in','2018-11-21 20:31:31','2018-11-21 20:31:31'),(36,11,2,'aliquam ratione','2018-11-21 20:31:31','2018-11-21 20:31:31'),(37,12,5,'enim in','2018-11-21 20:31:31','2018-11-21 20:31:31'),(38,13,5,'itaque incidunt','2018-11-21 20:31:31','2018-11-21 20:31:31'),(39,11,2,'at id','2018-11-21 20:31:31','2018-11-21 20:31:31'),(40,3,4,'aliquid ad','2018-11-21 20:31:31','2018-11-21 20:31:31'),(41,10,4,'facere officia','2018-11-21 20:31:31','2018-11-21 20:31:31'),(42,11,2,'ut modi','2018-11-21 20:31:31','2018-11-21 20:31:31'),(43,9,3,'dolore pariatur','2018-11-21 20:31:31','2018-11-21 20:31:31'),(44,3,1,'expedita recusandae','2018-11-21 20:31:31','2018-11-21 20:31:31'),(45,11,3,'voluptatem et','2018-11-21 20:31:31','2018-11-21 20:31:31'),(46,18,1,'temporibus sint','2018-11-21 20:31:31','2018-11-21 20:31:31'),(47,22,4,'aspernatur suscipit','2018-11-21 20:31:31','2018-11-21 20:31:31'),(48,27,1,'sit voluptatem','2018-11-21 20:31:31','2018-11-21 20:31:31'),(49,10,5,'distinctio est','2018-11-21 20:31:31','2018-11-21 20:31:31'),(50,21,1,'quia hic','2018-11-21 20:31:31','2018-11-21 20:31:31');
/*!40000 ALTER TABLE `flats` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2018_10_30_210841_create_flat_types_table',1),(9,'2018_10_30_210856_create_flat_parts_table',1),(10,'2018_10_30_210909_create_flats_table',1),(11,'2018_10_30_211036_create_flat_part_user_table',1),(12,'2018_10_31_181853_create_flat_type_user_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `oauth_access_tokens` VALUES ('23d76dcb5c024cb9b47e8dbc288eb410607017d533fc654a30ddd4f5b8d94b9b2f74676d77b8630d',1,1,'app','[]',0,'2018-11-21 20:32:17','2018-11-21 20:32:17','2019-11-21 20:32:17'),('244551d2479b468f68ba73f93a9afd53aecfde92a322c5a249b8fe78f90d66ded0873bfea93a3a1f',1,1,'app','[]',0,'2018-11-21 23:33:40','2018-11-21 23:33:40','2019-11-21 23:33:40'),('81c8b5eaba02a044bb603f5f8c54d94a524f568a42532056ae863799e26beeff41c5a700aab420ad',32,1,'app','[]',0,'2018-11-21 23:33:05','2018-11-21 23:33:05','2019-11-21 23:33:05'),('d326acfe849acd0676145f260f52f1663c508baf0b882ee77ef2e77cedf2b16bda18a609de6cd418',1,1,'app','[]',0,'2018-11-21 20:31:42','2018-11-21 20:31:42','2019-11-21 20:31:42');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
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
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','FAc9h6RApKVXW6nyjT2zsNSRbIRFgfJwwz8hLNUK','http://localhost',1,0,0,'2018-11-21 20:31:33','2018-11-21 20:31:33'),(2,NULL,'Laravel Password Grant Client','38wGiit46uRcE0xE5ZNO8x37fF4T8qi8K2PYBjFQ','http://localhost',0,1,0,'2018-11-21 20:31:33','2018-11-21 20:31:33');
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
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2018-11-21 20:31:33','2018-11-21 20:31:33');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ilya Sakovich','me@hivokas.com','2018-11-21 20:31:28','$2y$10$aWGzCpGdwn6HztwLRosZIutbeFBWFC0ntcymtmsKGMw.o0uOdLdzS','rxLgWsaOiv','2018-11-21 20:31:28','2018-11-21 20:31:28'),(2,'Miss Verlie Lebsack PhD','carissa.thiel@example.org','2018-11-21 20:31:28','$2y$10$5aZ2vUH9HerNFkBMFZ7gT.gN83AxWwmee2BWUqWpZifkCug.entVm','XVyHXiRI03','2018-11-21 20:31:31','2018-11-21 20:31:31'),(3,'Evans Graham DDS','vbatz@example.com','2018-11-21 20:31:28','$2y$10$Tgi9tBB/IDE9nQGFfF7EIeAUb3/3Fp4eYBr9y8cwpEPSatG38Nj/a','xZcs1yHiD7','2018-11-21 20:31:31','2018-11-21 20:31:31'),(4,'Gardner Homenick','galtenwerth@example.org','2018-11-21 20:31:28','$2y$10$kH8IQoJR5.3SHRxQijtsdOGehCwLNVdckz9/FuO0pJ0tYxj3XLtB2','0NErLTA0x6','2018-11-21 20:31:31','2018-11-21 20:31:31'),(5,'Johathan Purdy','napoleon12@example.com','2018-11-21 20:31:28','$2y$10$FBDJXiLfHJ.H.CpYxkWs1OyJI5RyauQGDMPIfILQ7ZfKpKH/ME33O','oRSwSSAqrL','2018-11-21 20:31:31','2018-11-21 20:31:31'),(6,'Nicklaus Friesen','rafael.morar@example.com','2018-11-21 20:31:28','$2y$10$CNYYaPjd2VwyhAK90eo1mu8Cd4R5tCc/pYSGTFn1FIZkWlznXsely','tiynaFbOpG','2018-11-21 20:31:31','2018-11-21 20:31:31'),(7,'Will Williamson','hattie37@example.net','2018-11-21 20:31:28','$2y$10$pBn6gIFUz7PtinjF80gHUeAfVbTS9oyFYefDrRTo.kHd2nLgPn8Yy','RLgYHMcsPL','2018-11-21 20:31:31','2018-11-21 20:31:31'),(8,'Hilda Emmerich','von.raheem@example.org','2018-11-21 20:31:29','$2y$10$eAKNOwtgaLLgfZ8Z2KpYZ.dV.Xva8McY9Y/sn2cg6kWeVNkI6hNM.','FaWhBbZyBP','2018-11-21 20:31:31','2018-11-21 20:31:31'),(9,'Mrs. Aubree Hyatt','hillard57@example.net','2018-11-21 20:31:29','$2y$10$Sbi30gm0tcrMpL8DtQktXOdk3Z0it1wGbqHjK2gnu.RwuitJVbslK','c64CyPflS4','2018-11-21 20:31:31','2018-11-21 20:31:31'),(10,'Concepcion Howe','ybaumbach@example.org','2018-11-21 20:31:29','$2y$10$AhmGvZdeJ0noCxiwUIf/C.o3/Q4Rq.SpqRKf1qJKe8rNKQ5mh8S1e','uCWaIrpqzv','2018-11-21 20:31:31','2018-11-21 20:31:31'),(11,'Dr. Zula Dicki','hkozey@example.net','2018-11-21 20:31:29','$2y$10$sTgGdfGAiXkF3oedSP3.AOrkIYIjZ5E9dlbukGK0V1cl3G7lPGO42','M6yzDxL0WM','2018-11-21 20:31:31','2018-11-21 20:31:31'),(12,'Amari Grimes','champlin.wilfrid@example.net','2018-11-21 20:31:29','$2y$10$1rwhFhvROeZSKi11Ems6surGdL.Wt0lL2rs3qicESrRtTeAF1j8Ti','kbcQgtEj6I','2018-11-21 20:31:31','2018-11-21 20:31:31'),(13,'Mortimer McLaughlin','norn@example.org','2018-11-21 20:31:29','$2y$10$cDxx/HVn8YVGx9Q4gcx10eh0FnjMBkWl82Tv7tNvQAzRCWVJ1AQYi','gpyLkPOrur','2018-11-21 20:31:31','2018-11-21 20:31:31'),(14,'Miss Sunny Gorczany','lucius60@example.com','2018-11-21 20:31:29','$2y$10$wfsWZ0EjfDw6yeoFwnwwZOqlaJm9zVDOhgQ3eyZv.hxYM8Vk6gJDG','dQB8JfFrs1','2018-11-21 20:31:31','2018-11-21 20:31:31'),(15,'Mariane Kirlin IV','marquardt.barrett@example.com','2018-11-21 20:31:29','$2y$10$nfYBz2nltZyChO6epcKXrOOOgHNEJI5ckOIlaQFlgZq9fiLQp00Ji','O194s1Jmve','2018-11-21 20:31:31','2018-11-21 20:31:31'),(16,'Isobel Dickinson','shirley91@example.net','2018-11-21 20:31:29','$2y$10$kyy0YrwpH2URdt96RvZeZ.NM60R4w9y.staTkivAuoawfku6T/fAG','Q8h7axsosL','2018-11-21 20:31:31','2018-11-21 20:31:31'),(17,'Shad Bechtelar','qbergstrom@example.org','2018-11-21 20:31:29','$2y$10$jOWjhc38tEKjSa8Q6HFfceN3du4CXxhY0tcZ2TNHnUMAfkQLhYb3u','x3uPdlauNl','2018-11-21 20:31:31','2018-11-21 20:31:31'),(18,'Tessie Goodwin','shyanne.larkin@example.com','2018-11-21 20:31:29','$2y$10$CGg7uKeFabeXNvZLlacSVuw5.1LaEU9Gwn0KeCNTSHSEZDdCsVKhm','wN2McF8MDV','2018-11-21 20:31:31','2018-11-21 20:31:31'),(19,'Tania Koch','brock.witting@example.net','2018-11-21 20:31:29','$2y$10$hAC4KhJpxDnTQm0rgjfZke1njhxXKALptFJRh6Yuvj3dPEmS6a4be','KxItsFy8K2','2018-11-21 20:31:31','2018-11-21 20:31:31'),(20,'Zella Kertzmann II','igorczany@example.com','2018-11-21 20:31:29','$2y$10$/UN4fU6ZALnuq7R/2L3/OulxLaYqKEaITUCCWsItHnZspkTmmT3Ky','AfIjg68nMr','2018-11-21 20:31:31','2018-11-21 20:31:31'),(21,'Vicky Wilderman','wolf.maxie@example.com','2018-11-21 20:31:30','$2y$10$YcMajKRJ3gWrsK.3njfl5.Wzl6oto/Ip0zn9JAFuD8fFt5.QJMe1u','QdvCpdE9xE','2018-11-21 20:31:31','2018-11-21 20:31:31'),(22,'Xzavier Klein','ubernier@example.org','2018-11-21 20:31:30','$2y$10$kQZMsJyTAS4KBwBuBpiu/uWAPs2DzFJrpX/NEde8x4RIa50LVFrcm','zYvLnKeI1H','2018-11-21 20:31:31','2018-11-21 20:31:31'),(23,'Mr. Jamey DuBuque DVM','haley.aric@example.com','2018-11-21 20:31:30','$2y$10$s0NwB2Eq9dHSX./c6SrQ5Of7iMGFHNo2aWreO3ZU04HfvXtTQ5XfS','Leh8fnFO4F','2018-11-21 20:31:31','2018-11-21 20:31:31'),(24,'Eugenia Cartwright','ned.greenholt@example.com','2018-11-21 20:31:30','$2y$10$e4txwdGzhLOMwlZamVGkp.muhoyXiat2Cwm2DJsnwfBIepgamXh06','BoG4YITvfh','2018-11-21 20:31:31','2018-11-21 20:31:31'),(25,'Ms. Beatrice Jacobi','jazmin09@example.com','2018-11-21 20:31:30','$2y$10$l2MF9l.pNvO74z98vFWYAuE5vLNZsXKU8//WbXx1fZ18ZYPlqmk8q','ptjVTRlqGM','2018-11-21 20:31:31','2018-11-21 20:31:31'),(26,'Devante Stehr','shannon80@example.com','2018-11-21 20:31:30','$2y$10$lgBxlvRbHjo.BQ4UeqX4Z.8EtzACTiokMKUWS/TmwGOeQHFanAnmK','6R64i3hQLx','2018-11-21 20:31:31','2018-11-21 20:31:31'),(27,'Alexys Gorczany','kertzmann.dewitt@example.org','2018-11-21 20:31:30','$2y$10$8xev5Sc9oYWD/SMiGJGZZubRYQUNZ8iHVkhwdPf281JmuOWj69e86','lNASdrGufi','2018-11-21 20:31:31','2018-11-21 20:31:31'),(28,'Marquise Corkery','ledner.clementina@example.org','2018-11-21 20:31:30','$2y$10$7.dIhQv/n6CCpeVCqDrIyelL2mH8zLkgPnMBUflQ8KV1tjrhgJzAO','NepTKdT6ja','2018-11-21 20:31:31','2018-11-21 20:31:31'),(29,'Zack Weimann','bokeefe@example.com','2018-11-21 20:31:30','$2y$10$HZLCLBJwfqmIIfVs1JcL9eatiRltgz1Uh1H5i29fdcmj8Lw1jU5Re','tb5nLKJzL1','2018-11-21 20:31:31','2018-11-21 20:31:31'),(30,'Destiney Effertz','ullrich.joshuah@example.org','2018-11-21 20:31:30','$2y$10$NyB6XoYl9BJNl0jVqByr8epYTRm28.MFwBm1R34Or6dF466IV9Lru','jw0kKJilE1','2018-11-21 20:31:31','2018-11-21 20:31:31'),(31,'Brandi Stark','tdicki@example.org','2018-11-21 20:31:31','$2y$10$kY2837bG8XHhzj6h0v6sFu91JEJjdKptCcj.VTt9kXPWDsRaztSE.','pAmS9UKqw7','2018-11-21 20:31:31','2018-11-21 20:31:31'),(32,'hello','hello@world.com',NULL,'$2y$10$uEMRYYornxHh3egWUQ1KTeDN6bNTqhwsAxfHepPeB6SazuFregE2u',NULL,'2018-11-21 23:33:05','2018-11-21 23:33:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-21 23:47:15
