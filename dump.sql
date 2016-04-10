-- MySQL dump 10.15  Distrib 10.0.22-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: laravel-ecommerce
-- ------------------------------------------------------
-- Server version	10.0.22-MariaDB

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
-- Table structure for table `attribute_category`
--

DROP TABLE IF EXISTS `attribute_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_category_attribute_id_index` (`attribute_id`),
  KEY `attribute_category_category_id_index` (`category_id`),
  CONSTRAINT `attribute_category_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_category`
--

LOCK TABLES `attribute_category` WRITE;
/*!40000 ALTER TABLE `attribute_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `backend_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'meta_descr','varchar',NULL,NULL,NULL),(2,'cylinder_count','int',NULL,NULL,NULL),(3,'brand','foreignkey','Brand',NULL,NULL),(4,'compatible_car','foreignkey','Car',NULL,NULL);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'cat1',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attribute_options`
--

DROP TABLE IF EXISTS `eav_attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attribute_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eav_attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `eav_attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attribute_options`
--

LOCK TABLES `eav_attribute_options` WRITE;
/*!40000 ALTER TABLE `eav_attribute_options` DISABLE KEYS */;
INSERT INTO `eav_attribute_options` VALUES (1,6,'Audi C8',NULL,NULL),(2,6,'BMW X5',NULL,NULL),(3,7,'Company 1',NULL,NULL),(4,7,'Company 2',NULL,NULL),(5,6,'Toyota','2016-04-10 10:08:06','2016-04-10 10:08:06');
/*!40000 ALTER TABLE `eav_attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_attributes`
--

DROP TABLE IF EXISTS `eav_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `collection` tinyint(1) NOT NULL DEFAULT '0',
  `default_value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_attributes`
--

LOCK TABLES `eav_attributes` WRITE;
/*!40000 ALTER TABLE `eav_attributes` DISABLE KEYS */;
INSERT INTO `eav_attributes` VALUES (1,'city','City','Devio\\Eavquent\\Value\\Data\\Varchar','App\\Product',0,NULL),(2,'colors','Colors','Devio\\Eavquent\\Value\\Data\\Varchar','App\\Product',1,NULL),(3,'address','Address','Devio\\Eavquent\\Value\\Data\\Varchar','App\\Product',0,NULL),(4,'sizes','Sizes','Devio\\Eavquent\\Value\\Data\\Varchar','App\\Product',1,NULL),(6,'cars','Cars','App\\Eav\\Value\\Data\\Option','App\\Product',1,NULL),(7,'manufacturer','manufacturer','App\\Eav\\Value\\Data\\Option','App\\Product',0,NULL);
/*!40000 ALTER TABLE `eav_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_values_boolean`
--

DROP TABLE IF EXISTS `eav_values_boolean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_values_boolean` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` tinyint(1) NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_values_boolean`
--

LOCK TABLES `eav_values_boolean` WRITE;
/*!40000 ALTER TABLE `eav_values_boolean` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_values_boolean` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_values_datetime`
--

DROP TABLE IF EXISTS `eav_values_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_values_datetime` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` datetime NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_values_datetime`
--

LOCK TABLES `eav_values_datetime` WRITE;
/*!40000 ALTER TABLE `eav_values_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `eav_values_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_values_integer`
--

DROP TABLE IF EXISTS `eav_values_integer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_values_integer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` int(11) NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_values_integer`
--

LOCK TABLES `eav_values_integer` WRITE;
/*!40000 ALTER TABLE `eav_values_integer` DISABLE KEYS */;
INSERT INTO `eav_values_integer` VALUES (4,1,5,3),(5,2,5,3),(6,3,5,3);
/*!40000 ALTER TABLE `eav_values_integer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_values_option`
--

DROP TABLE IF EXISTS `eav_values_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_values_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` int(11) NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_values_option`
--

LOCK TABLES `eav_values_option` WRITE;
/*!40000 ALTER TABLE `eav_values_option` DISABLE KEYS */;
INSERT INTO `eav_values_option` VALUES (4,3,7,3),(35,1,6,3),(36,2,6,3),(37,5,6,3);
/*!40000 ALTER TABLE `eav_values_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eav_values_varchar`
--

DROP TABLE IF EXISTS `eav_values_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eav_values_varchar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eav_values_varchar`
--

LOCK TABLES `eav_values_varchar` WRITE;
/*!40000 ALTER TABLE `eav_values_varchar` DISABLE KEYS */;
INSERT INTO `eav_values_varchar` VALUES (1,'Kharkiv',1,3),(2,'foo',2,3),(3,'bar',2,3);
/*!40000 ALTER TABLE `eav_values_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2016_04_09_222036_create_main_tables',2),('2015_06_18_000000_create_eav_attributes_table',3),('2016_02_29_000000_create_eav_values_boolean_table',3),('2016_02_29_000000_create_eav_values_datetime_table',3),('2016_02_29_000000_create_eav_values_integer_table',3),('2016_02_29_000000_create_eav_values_varchar_table',3),('2016_04_09_231410_create_brands_and_cars_tables',3),('2016_04_10_083325_create_eav_values_option_table',4),('2016_04_10_085216_create_eav_attribute_options_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_int`
--

DROP TABLE IF EXISTS `product_attribute_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attribute_int` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attribute_int_product_id_foreign` (`product_id`),
  KEY `product_attribute_int_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_attribute_int_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_int_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_int`
--

LOCK TABLES `product_attribute_int` WRITE;
/*!40000 ALTER TABLE `product_attribute_int` DISABLE KEYS */;
INSERT INTO `product_attribute_int` VALUES (1,3,2,3,NULL,NULL),(2,4,2,4,NULL,NULL),(3,3,3,1,NULL,NULL),(4,3,4,1,NULL,NULL),(5,4,3,2,NULL,NULL),(6,4,4,2,NULL,NULL);
/*!40000 ALTER TABLE `product_attribute_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_varchar`
--

DROP TABLE IF EXISTS `product_attribute_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attribute_varchar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attribute_varchar_product_id_foreign` (`product_id`),
  KEY `product_attribute_varchar_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_attribute_varchar_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_varchar_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_varchar`
--

LOCK TABLES `product_attribute_varchar` WRITE;
/*!40000 ALTER TABLE `product_attribute_varchar` DISABLE KEYS */;
INSERT INTO `product_attribute_varchar` VALUES (1,3,1,'meta descr for prod 3',NULL,NULL),(2,4,1,'meta descr for prod 4',NULL,NULL);
/*!40000 ALTER TABLE `product_attribute_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `sale_price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,1,'s1','n1',1,'sdfdsf',1,1.00,NULL,NULL),(4,1,'s2','n2',3,'das f dsaf adsf dsaf adsf dsaf dasf adstyu67543453245r3452',2,2.00,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2016-04-10 13:28:17
