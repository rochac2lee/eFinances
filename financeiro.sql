-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: financeiro
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_user_id_foreign` (`user_id`),
  CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,'Prestação de Serviço','2021-10-19 01:26:59','2021-10-19 01:26:59'),(2,1,'Licença eZap','2021-10-19 01:27:09','2021-10-19 01:27:09'),(3,1,'Sites','2021-10-19 01:41:16','2021-10-19 01:41:16'),(4,1,'Infraestrutura','2021-10-22 10:43:34','2021-10-22 10:43:34');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_11_22_214132_create_categories_table',1),(5,'2019_11_22_214259_create_transactions_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `value` double(8,2) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_category_id_foreign` (`category_id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  CONSTRAINT `transactions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,1,'RH Center','2021-10-29',5000.00,1,'2021-10-19 01:27:27','2021-10-19 01:27:27'),(2,1,1,'LCG IT','2021-10-20',2000.00,1,'2021-10-19 01:27:52','2021-10-19 01:27:52'),(3,1,1,'RH Center','2021-11-30',5000.00,1,'2021-10-19 01:31:38','2021-10-19 01:31:38'),(4,1,1,'RH Center','2021-12-30',5000.00,1,'2021-10-19 01:32:11','2021-10-19 01:32:11'),(5,1,1,'LCG IT','2021-11-05',2000.00,1,'2021-10-19 01:32:34','2021-10-19 01:32:34'),(6,1,1,'LCG IT','2021-12-07',4000.00,1,'2021-10-19 01:33:36','2021-10-19 01:33:36'),(7,3,1,'Jquintana','2021-06-10',90.00,1,'2021-10-19 01:41:34','2021-10-19 01:41:34'),(8,3,1,'Jquintana','2021-07-10',90.00,1,'2021-10-19 01:42:00','2021-10-19 01:42:00'),(9,3,1,'Jquintana','2021-08-10',90.00,1,'2021-10-19 01:42:18','2021-10-19 01:42:18'),(10,3,1,'Jquintana','2021-09-10',90.00,1,'2021-10-19 01:42:49','2021-10-19 01:42:49'),(11,3,1,'Jquintana','2021-10-08',90.00,1,'2021-10-19 01:43:12','2021-10-19 01:43:12'),(12,3,1,'Jquintana','2021-11-10',90.00,1,'2021-10-19 01:43:35','2021-10-19 01:43:35'),(13,3,1,'Jquintana','2021-12-10',90.00,1,'2021-10-19 01:43:57','2021-10-19 01:43:57'),(14,3,1,'IB Nova Primavera','2021-01-08',90.00,1,'2021-10-19 01:49:12','2021-10-19 01:49:12'),(15,3,1,'IB Nova Primavera','2021-02-10',90.00,1,'2021-10-19 01:49:34','2021-10-19 01:49:34'),(16,3,1,'IB Nova Primavera','2021-03-10',90.00,1,'2021-10-19 01:49:52','2021-10-19 01:49:52'),(17,3,1,'IB Nova Primavera','2021-04-10',90.00,1,'2021-10-19 01:50:13','2021-10-19 01:50:13'),(18,3,1,'IB Nova Primavera','2021-05-10',90.00,1,'2021-10-19 01:50:40','2021-10-19 01:50:40'),(19,3,1,'IB Nova Primavera','2021-06-10',90.00,1,'2021-10-19 01:51:01','2021-10-19 01:51:01'),(20,3,1,'IB Nova Primavera','2021-07-10',90.00,1,'2021-10-19 01:51:26','2021-10-19 01:51:26'),(21,3,1,'IB Nova Primavera','2021-08-10',90.00,1,'2021-10-19 01:51:50','2021-10-19 01:51:50'),(22,3,1,'IB Nova Primavera','2021-09-10',90.00,1,'2021-10-19 01:52:06','2021-10-19 01:52:06'),(23,3,1,'IB Nova Primavera','2021-10-10',90.00,1,'2021-10-19 01:52:24','2021-10-19 01:52:24'),(24,3,1,'IB Nova Primavera','2021-11-10',90.00,1,'2021-10-19 01:53:07','2021-10-19 01:53:07'),(25,3,1,'IB Nova Primavera','2021-12-10',90.00,1,'2021-10-19 01:53:42','2021-10-19 01:53:42'),(26,3,1,'Berger - Integração','2021-06-10',660.00,1,'2021-10-19 01:54:44','2021-10-19 01:54:44'),(27,3,1,'Libras Estúdio','2021-05-10',90.00,1,'2021-10-19 01:55:25','2021-10-19 01:55:25'),(28,3,1,'Libras Estúdio','2021-06-10',90.00,1,'2021-10-19 01:55:49','2021-10-19 01:55:49'),(29,3,1,'Libras Estúdio','2021-07-10',90.00,1,'2021-10-19 01:56:21','2021-10-19 01:56:21'),(30,3,1,'Libras Estúdio','2021-10-10',90.00,1,'2021-10-19 01:56:36','2021-10-19 01:56:36'),(31,3,1,'Libras Estúdio','2021-08-10',90.00,1,'2021-10-19 01:57:07','2021-10-19 01:57:07'),(32,3,1,'Libras Estúdio','2021-09-10',90.00,1,'2021-10-19 01:57:24','2021-10-19 01:57:24'),(33,3,1,'Libras Estúdio','2021-11-10',90.00,1,'2021-10-19 01:57:55','2021-10-19 01:57:55'),(34,3,1,'Libras Estúdio','2021-12-10',90.00,1,'2021-10-19 01:58:14','2021-10-19 01:58:14'),(35,2,1,'Pata por Pata','2021-08-10',129.90,1,'2021-10-19 01:59:01','2021-10-19 01:59:01'),(36,2,1,'Pata por Pata','2021-09-10',189.90,1,'2021-10-19 01:59:30','2021-10-19 01:59:30'),(37,2,1,'Pata por Pata','2021-10-10',189.90,1,'2021-10-19 01:59:54','2021-10-19 01:59:54'),(38,3,1,'Adeweron','2021-08-10',490.00,1,'2021-10-19 02:01:02','2021-10-19 02:01:02'),(39,2,1,'Pata por Pata','2021-11-10',189.90,1,'2021-10-19 02:01:37','2021-10-19 02:01:37'),(40,2,1,'Pata por Pata','2021-12-10',189.90,1,'2021-10-19 02:01:53','2021-10-19 02:01:53'),(41,2,1,'Schaier','2021-10-08',259.70,1,'2021-10-19 02:03:26','2021-10-19 02:03:26'),(42,2,1,'Schraier','2021-11-10',259.70,1,'2021-10-19 02:04:03','2021-10-22 10:38:22'),(43,2,1,'Schaier','2021-12-10',259.70,1,'2021-10-19 02:04:23','2021-10-19 02:04:23'),(44,2,1,'La\' Fanny','2021-10-10',89.90,1,'2021-10-19 02:05:33','2021-10-19 02:05:33'),(45,2,1,'La\' Fanny','2021-11-10',89.90,1,'2021-10-19 02:05:53','2021-10-19 02:05:53'),(46,2,1,'La\' Fanny','2021-12-10',89.90,1,'2021-10-19 02:06:10','2021-10-19 02:06:10'),(47,1,1,'RH Center','2021-06-30',5000.00,1,'2021-10-19 02:07:54','2021-10-19 02:07:54'),(48,1,1,'RH Center','2021-07-30',5000.00,1,'2021-10-19 02:08:19','2021-10-19 02:08:19'),(49,1,1,'RH Center','2021-08-30',5000.00,1,'2021-10-19 02:08:40','2021-10-19 02:08:40'),(50,1,1,'RH Center','2021-09-30',5000.00,1,'2021-10-19 02:09:27','2021-10-19 02:09:27'),(51,1,1,'Magazine Brindes','2021-11-05',1500.00,1,'2021-10-19 02:11:28','2021-10-22 10:37:41'),(52,1,1,'Magazine Brindes','2021-12-10',3000.00,1,'2021-10-19 02:11:58','2021-10-19 02:11:58'),(53,3,1,'Jquintana','2021-09-10',1050.00,1,'2021-10-19 02:14:59','2021-10-19 02:14:59'),(54,3,1,'Adeweron','2021-10-21',240.00,1,'2021-10-22 10:39:10','2021-10-22 10:39:10'),(55,4,1,'Servidor','2021-10-20',399.99,0,'2021-10-22 10:43:57','2021-10-22 10:43:57');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Cleberli da Rocha','cleberli@encode.dev.br','2021-10-19 01:25:26','$2y$10$ynSItqOswNyGZ.wqxujuOe8/MKuY.S19m0dY.unNsGMMV9Sqo79Ma','9OU5KLEFjeDbQBIi0cJDipAds6d0usGSMwXuOE169uM2wztDNoGEyiklPXo5','2021-10-19 01:13:27','2021-10-19 01:25:26');
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

-- Dump completed on 2021-10-22 10:26:44
