-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ptc-db
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2-log

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) DEFAULT NULL,
  `report_choice_id` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `selected` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `comment` text COLLATE utf8_unicode_ci,
  `commentable_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'comments',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_commentable_id` (`commentable_id`),
  KEY `index_comments_on_commentable_type` (`commentable_type`),
  KEY `index_comments_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flaggings`
--

DROP TABLE IF EXISTS `flaggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flaggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flaggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flaggable_id` int(11) DEFAULT NULL,
  `flagger_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flagger_id` int(11) DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_flaggings_on_flaggable_type_and_flaggable_id` (`flaggable_type`,`flaggable_id`),
  KEY `access_flaggings` (`flagger_type`,`flagger_id`,`flaggable_type`,`flaggable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flaggings`
--

LOCK TABLES `flaggings` WRITE;
/*!40000 ALTER TABLE `flaggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `flaggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendly_id_slugs`
--

DROP TABLE IF EXISTS `friendly_id_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendly_id_slugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sluggable_id` int(11) NOT NULL,
  `sluggable_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope` (`slug`,`sluggable_type`,`scope`),
  KEY `index_friendly_id_slugs_on_slug_and_sluggable_type` (`slug`,`sluggable_type`),
  KEY `index_friendly_id_slugs_on_sluggable_id` (`sluggable_id`),
  KEY `index_friendly_id_slugs_on_sluggable_type` (`sluggable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendly_id_slugs`
--

LOCK TABLES `friendly_id_slugs` WRITE;
/*!40000 ALTER TABLE `friendly_id_slugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendly_id_slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_categories`
--

DROP TABLE IF EXISTS `report_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_categories`
--

LOCK TABLES `report_categories` WRITE;
/*!40000 ALTER TABLE `report_categories` DISABLE KEYS */;
INSERT INTO `report_categories` VALUES (1,'Authentication','Authentication generally means verifying the identity of a user. Most websites and services require you to register your details and then log in to use the service, often using a username and password. Only the true owner of the identity specified by the username should know the matching password. Related to authentication is session management, which is maintaining the state of authentication across multiple transactions.','icons/Buzz-Private-icon.png','2014-04-03 11:21:38','2014-04-03 11:21:38'),(2,'Data at rest','Data at rest refers to inactive data which is stored physically in any digital form (e.g. harddisk, USB drive, CDs and DVDs etc.).','icons/It-Infrastructure-Hdd-icon.png','2014-04-03 11:21:38','2014-04-03 11:21:38'),(3,'Data in Motion','Data in motion means any data which is not at rest, so is actively being transfered from one place to another. This transfer could be over a network, but also within the memory and CPU of a computer. Generally speaking, a USB drive containing data and is being physically moved does not count as data in motion.','icons/It-Infrastructure-Remote-working-icon.png','2014-04-03 11:21:38','2014-04-03 11:21:38'),(4,'Privacy & EULA','Many web services have a privacy policy that outlines what they can and cannot do with any data they obtain from its users, either directly or indirectly. Some services sell your data to third parties and some just use it for internal marketing purposes. Most websites monitor their traffic levels and may use cookies to track visitor uniqueness.','icons/Buzz-Visible-icon.png','2014-04-03 11:21:38','2014-04-03 11:21:38'),(5,'Disclosure','Many services have a support support channel that users can use to report problems with the product, service or website. However, not many services make it clear how to raise security issues to them nor do they tend to outline how security reports are handled. A disclosure policy outlines how security problems should be raised, what the expecations are for handling the problems and may outline timeframes etc.','icons/Users-Talk-icon.png','2014-04-03 11:21:39','2014-04-03 11:21:39'),(6,'Advertising','Many web services are free to its users. These services are often supported by displaying advertisments to the users. The adverts are often delivered by large advertising networks and may track users and target ads based on previous activity. Some services also offer premium versions that do not show adverts.','icons/Business-Money-bag-icon.png','2014-04-03 11:21:39','2014-04-03 11:21:39'),(7,'Incident History','If a service suffers a significant security breach, users and the press may be notified and the breach becomes public knowledge. There are a number of websites that track publicly disclosed incidents. Some services even provide a detailed analysis of the breach so that other companies can avoid making the same mistakes. However, it should be noted and an unknown percentage of incidents go unreported.','icons/Office-Stuff-Planner-icon.png','2014-04-03 11:21:39','2014-04-03 11:21:39'),(8,'Software','Many online services also have client applications that are used on desktops, mobile phones etc. When a service has a bug in their hosted software, they can update it with the user noticing. With client software however, things are generally not as transparent. If there is a vulnerability in the client software and the user does not keep it up to date, then the user may be at risk.','icons/Office-Stuff-Planner-icon.png','2014-04-03 11:21:39','2014-04-03 11:21:39');
/*!40000 ALTER TABLE `report_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_choices`
--

DROP TABLE IF EXISTS `report_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_item_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `bonus` tinyint(1) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `help` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_choices`
--

LOCK TABLES `report_choices` WRITE;
/*!40000 ALTER TABLE `report_choices` DISABLE KEYS */;
INSERT INTO `report_choices` VALUES (1,1,'No documentation','No authentication documentation is publicly available',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(2,1,'Basic documentation','Has some authentication documentation but does not go into details',0,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(3,1,'High-level overview','Provides a high-level overview of authentication but does not contain technical details',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(4,1,'Detailed technical documentation','Has well detailed technical design and implementation documentation for authentication',0,25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(5,1,'Support documentation','Has basic help or support authentication documentation',1,5,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(6,2,'None, trust assumed','No authentication available, trust is assumed',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(7,2,'None, not applicable','Authentication not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(8,2,'Username and password','Username and passwords available for authentication',1,5,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(9,2,'OpenID','OpenID available for authentication',1,10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(10,2,'SMS two-factor','SMS two-factor available for authentication',1,25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(11,2,'Mobile two-factor','Mobile two-factor application available for authentication',1,25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(12,2,'Mutual SSL/TLS','Mutual SSL/TLS available for authentication',1,25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(13,2,'SAML','SAML available for authentication',1,25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(14,3,'None, trust assumed','Authorisation not available, trust assumed',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(15,3,'None, not applicable','Authorisation not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(16,3,'O-Auth','O-Auth available for authorisation',1,25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(17,3,'XACML','XACML available for authorisation',1,25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(18,4,'Not applicable','Password policy not appliacble',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(19,4,'Very limited character set','Password policy uses a very limited character set (e.g. only alpha numerics)',1,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(20,4,'Very limited password length','Password policy uses a very limited password length (e.g. only up to 8 characters)',1,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(21,4,'Restricted character set','Password policy uses a restricted character set (e.g. no special characters)',1,-5,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(22,4,'Restricted password length','Password policy uses a restricted password length (e.g. only up to 16 characters)',1,-5,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(23,4,'Unrestricted password character set','Password policy uses an unrestricted character set',1,10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(24,4,'Unlimited password length','Password policy uses an unlimited password length',1,10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(25,5,'Not applicable','Password recovery is not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(26,5,'Email containing existing password','Password reset sends existing password via email',1,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(27,5,'Email containing new password','Password reset sends a new password via email',1,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(28,5,'Email containing reset URL','Password reset sends a reset URL',1,10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(29,5,'Fixed security questions','Password reset uses fixed security questions (e.g. first pet, mother\'s maiden name)',1,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(30,5,'User selected security questions','Password reset uses user selected security questions',1,5,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(31,6,'Not applicable','Session management not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(32,6,'Insecure cookie','Authentication session management uses an insecure cookie',1,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(33,6,'Secure cookie','Authentication session management uses a secure cookie',1,10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(34,6,'URL parameter token','Authentication session management uses a URL parameter token',1,5,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(35,7,'Not applicable','Credential storage not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(36,7,'Unknown','Unknown method used for credential storage',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(37,7,'Plaintext','Credentials are stored in plain text',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(38,7,'Insecure hash','An insecure hash is used for credential storage (e.g. MD5)',0,-25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(39,7,'Inappropriate hash','An inappropriate secure hash is used for credential storage (e.g. SHA-256)',0,-5,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(40,7,'Appropriate hash','An appropriate secure hash is used for credential storage (e.g. scrypt)',0,25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(41,7,'Inappropriate Encrption','Encryption of the credentials is used inappropriately',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(42,7,'Appropriate Encrption','Encryption of the credentials is used appropriately',0,25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(43,8,'No documentation','No documentation for data at rest is publicly available',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(44,8,'Basic documentation','Has some documentation regarding data at rest, but doesn not go into details',0,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(45,8,'High-level overview','Provides a high-level overview on data at rest, but does not contain technical details',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(46,8,'Detailed technical documentation','Has well detailed technical design and implementation documentation',0,25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(47,8,'Support documentation','Only has basic help or support documentation',1,5,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(48,9,'Not applicable','Data encryption is not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(49,9,'Unknown','Method of encrypting stored data not specified or closed proprietry systems',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(50,9,'No encryption','No encryption is used to protect stored data',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(51,9,'Obfuscation','Stored data is only obfuscated (e.g. base64 or proprietry method)',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(52,9,'Weak encryption','A weak encryption system is used to protect stored data (e.g DES)',0,-25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(53,9,'Strong encrpytion','A strong encryption system is used to protect stored data (e.g. AES-256)',0,50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(54,10,'Not applicable','Data retention period is not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(55,10,'Not specified','Data is retained for an unspecified amount of time',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(56,10,'Indefinitely','Data is retained indefinitely',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(57,10,'2+ years','Data is retained for 2 or more years',0,-20,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(58,10,'0 to 2 years','Data is retained for up to 2 years',0,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(59,10,'Less than 1 day','Data is retained for less than a day',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(60,10,'Temporary (cache)','Data is only held temporarily (e.g. in memory)',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(61,10,'User controlled','Use is able to control the data retention period',0,10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(62,11,'Not applicable','Data scope is not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(63,11,'Unspecified','Types of data stored is unspecified',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(64,11,'Personal','Types of data stored includes personal information (e.g. address)',1,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(65,11,'Financial','Types of data stored includes financial information (e.g. credit card details)',1,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(66,11,'User activity','Types of data stored includes user activity (e.g. browsing habbits)',1,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(67,11,'User generated content','Types of data stored includes user generated content (e.g. uploaded images)',1,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(68,12,'No documentation','No documentation for data in motion is publicly available',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(69,12,'Basic documentation','Has some documentation for data in motion, but does not go into details',0,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(70,12,'High-level overview','Provides a high-level overview of data in motion but does not contain technical details',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(71,12,'Detailed technical documentation','Has well detailed technical design and implementation documentation for data in motion',0,25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(72,12,'Support documentation','Only has basic help or support documentation for data in motion',1,5,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(73,13,'Not applicable','Transport encryption is not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(74,13,'Unknown','Transport encryption method Not specified or uses closed proprietry systems',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(75,13,'No encryption','No transport encryption is used',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(76,13,'Obfuscation','Obfuscation is the only means of protecting data transport',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(77,13,'Weak encryption','Weak encryption is the only means of protecting data transport (e.g. 3DES)',0,-25,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(78,13,'Strong encrpytion','Strong encryption is used to protect the data ransport (e.g. AES-256)',0,50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(79,14,'Not applicable','Service does not publicly use TLS so not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(80,14,'Qualys SSL Labs score D or worse','Received a Qualys SSL Labs score of D or worse',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(81,14,'Qualys SSL Labs score B or C','Received a Qualys SSL Labs score of B or C',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(82,14,'Qualys SSL Labs score A','Received a Qualys SSL Labs score of A',0,10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(83,15,'Not applicable','A privacy policy is not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(84,15,'Not available','A privacy policy is not publicly available',0,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(85,15,'Available but hard to find','The privacy policy is available, but hard to find',0,-5,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(86,15,'Available and easy to find','The privacy policy is available and easy to find',0,10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(87,16,'Not applicable','A EULA is not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(88,16,'Not available','The EULA is not publicly available',0,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(89,16,'Available but hard to find','The EULA is available, but hard to find',0,-5,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(90,16,'Available and easy to find','The EULA is available and easy to find',0,10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(91,17,'Not applicable','Sales and marketing data collection not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(92,17,'Unknown','Use of personal data for internal sales and marketing is unknown',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(93,17,'Collected','Collects personal information for internal sales or marketing purposes',0,-5,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(94,17,'Not collected','Does not collect personal information for internal sales or marketing purposes',0,10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(95,18,'Not applicable','Third party data sharing not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(96,18,'Unknown','Unknown whether personal information is provided to third parties',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(97,18,'Shared','Shares personal information with third parties',0,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(98,18,'Sold','Sells personal information to third parties',0,-10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(99,18,'Not shared','Does not share personal information with third parties',0,10,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(100,19,'Not applicable','Data analytics not applicable',0,0,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(101,19,'Unknown','Unknown whether data is collected for analytics',0,-50,'','2014-04-03 11:21:38','2014-04-03 11:21:38'),(102,19,'Tracking information','Uses tracking information for data analytics',0,-10,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(103,19,'Does not track','Does not track for data analytics',0,10,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(104,20,'Not available','A disclosure policy is not available',0,-10,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(105,20,'Available but hard to find','A disclosure policy is available, but hard to find',0,-5,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(106,20,'Available and easy to find','A disclosure policy is available and is easy to find',0,10,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(107,21,'Not available','No security contact details are documented',0,-10,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(108,21,'Available but hard to find','Security contact details are available but are hard to find',0,-5,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(109,21,'Available and easy to find','Security contact details are available and are easy to find',0,10,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(110,22,'Not available','Does not operate a bug bounty or recognition program',0,0,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(111,22,'Formal recognition','Provides formal recogition for submitted vulnerabilities',0,10,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(112,22,'Token bounties','Provides token bounties such as t-shirts for vulnerabilities',0,20,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(113,22,'Monetary bounties','Provides monetary boutnies for vulnerabilties found',0,10,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(114,24,'Not applicable','Does not display any adverts on its site',0,0,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(115,24,'Partner or sponsorship','Displays adverts on its site, but only fixed partner or sponsor ads',0,0,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(116,24,'Advertising Networks','Displays adverts on its site, distributed using an ad network',0,-10,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(117,24,'History of serving malware','Has a history of serving malware through advertising on its site',1,-50,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(118,25,'Not applicable','Does not display any adverts in its client software',0,0,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(119,25,'Partner or sponsorship','Displays adverts in its client software, but only fixed partner or sponsor ads',0,0,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(120,25,'Advertising Networks','Displays adverts in its client software, distributed using an ad network',0,-10,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(121,25,'History of serving malware','Has a history of serving malware through advertising in its client software',1,-50,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(122,26,'Not applicable','No public disclosures as has no known incident history',0,0,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(123,26,'Contraversial disclosures','Has provided contravserial, contradictory or misleading information in a public disclosure of an incident',0,0,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(124,26,'Minimal details','Has provided on minimal details on incidents',0,0,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(125,26,'Detailed analysis','Has provided detailed technical analisys of incidents',0,50,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(126,27,'None','There have been no known security incidents',0,0,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(127,27,'Previous minor incident','There have been one or more minor security incidents prior to the last 6 months',0,-10,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(128,27,'Recent minor incident','There have been one or more minor security incidents within the last 6 months',0,-20,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(129,27,'Previous major incident','There have been one or more major security incidents prior to the last 6 months',0,-20,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(130,27,'Recent major incident','There have been one or more major security incidents within the last 6 months',0,-40,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(131,28,'Not applicable','Service does not have client software',0,0,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(132,28,'None','No known client software vulnerabilities at present',0,0,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(133,28,'Previous vulnerabilities','Client software has previously had known serious vulnerabilties but patches are available',0,-10,'','2014-04-03 11:21:39','2014-04-03 11:21:39'),(134,28,'Unpatched vulnerabilties','Client software currently has unpatched serious known vulnerabilities',0,-50,'','2014-04-03 11:21:39','2014-04-03 11:21:39');
/*!40000 ALTER TABLE `report_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_items`
--

DROP TABLE IF EXISTS `report_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `help` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_items`
--

LOCK TABLES `report_items` WRITE;
/*!40000 ALTER TABLE `report_items` DISABLE KEYS */;
INSERT INTO `report_items` VALUES (1,1,'Design and documentation','Documentation detailing design, architecture or usage','2014-04-03 11:21:38','2014-04-03 11:21:38'),(2,1,'Authentication mechanisms','Methods available for authentication','2014-04-03 11:21:38','2014-04-03 11:21:38'),(3,1,'Authorisation mechanisms','Methods available for service/API authorisation','2014-04-03 11:21:38','2014-04-03 11:21:38'),(4,1,'Password policy','Restrictions on password selection and usage','2014-04-03 11:21:38','2014-04-03 11:21:38'),(5,1,'Recovery process','Password reset etc.','2014-04-03 11:21:38','2014-04-03 11:21:38'),(6,1,'Session management','How authentication sessions are maintained across transactions','2014-04-03 11:21:38','2014-04-03 11:21:38'),(7,1,'Credential storage','How sensitive credentials are stored','2014-04-03 11:21:38','2014-04-03 11:21:38'),(8,2,'Design and documentation','Documentation detailing design, architecture or usage','2014-04-03 11:21:38','2014-04-03 11:21:38'),(9,2,'Data encryption','','2014-04-03 11:21:38','2014-04-03 11:21:38'),(10,2,'Data retention','How long data is stored for','2014-04-03 11:21:38','2014-04-03 11:21:38'),(11,2,'Data scope','The type of data stored','2014-04-03 11:21:38','2014-04-03 11:21:38'),(12,3,'Design and documentation','Documentation detailing design, architecture or usage','2014-04-03 11:21:38','2014-04-03 11:21:38'),(13,3,'Transport encryption','','2014-04-03 11:21:38','2014-04-03 11:21:38'),(14,3,'Qualys SSL/TLS score','','2014-04-03 11:21:38','2014-04-03 11:21:38'),(15,4,'Privacy policy','','2014-04-03 11:21:38','2014-04-03 11:21:38'),(16,4,'End User Licence Agreement','','2014-04-03 11:21:38','2014-04-03 11:21:38'),(17,4,'Sales and Marketing','','2014-04-03 11:21:38','2014-04-03 11:21:38'),(18,4,'Third parties','','2014-04-03 11:21:38','2014-04-03 11:21:38'),(19,4,'Data analytics','','2014-04-03 11:21:38','2014-04-03 11:21:38'),(20,5,'Disclosure policy','','2014-04-03 11:21:39','2014-04-03 11:21:39'),(21,5,'Documented security contact','','2014-04-03 11:21:39','2014-04-03 11:21:39'),(22,5,'Bug bounty program','','2014-04-03 11:21:39','2014-04-03 11:21:39'),(23,5,'History and reputation','','2014-04-03 11:21:39','2014-04-03 11:21:39'),(24,6,'Adverts on site','','2014-04-03 11:21:39','2014-04-03 11:21:39'),(25,6,'Adverts on client software','','2014-04-03 11:21:39','2014-04-03 11:21:39'),(26,7,'Public disclosures','','2014-04-03 11:21:39','2014-04-03 11:21:39'),(27,7,'Recent Events','','2014-04-03 11:21:39','2014-04-03 11:21:39'),(28,8,'Known serious vulnerabilities','Please link to CVEs etc where possible.','2014-04-03 11:21:39','2014-04-03 11:21:39');
/*!40000 ALTER TABLE `report_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20131012222839');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hosting_provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenshot_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `score` float DEFAULT NULL,
  `score_updated_at` datetime DEFAULT NULL,
  `moderated` tinyint(1) DEFAULT '0',
  `flagged` tinyint(1) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `moderator` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  KEY `index_users_on_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user@example.com','$2a$10$htiERez5ydFrLzLZMBB7iuJ3kZ8HLcnJEikAF3YmAnMIXRY37fESq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2014-04-03 11:21:38','2014-04-03 11:21:38','user',NULL,NULL),(2,'mod@example.com','$2a$10$Tda9OfClbEGx9Y4nvI1X/u49y7XelcRKBFQi7bGihQEtl1O30A9DK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2014-04-03 11:21:38','2014-04-03 11:21:38','mod',NULL,1),(3,'admin@example.com','$2a$10$AmHvJk845NtrajJEa5RHYu/B2kYviBPVPsp047o59F8/kDGn7G1T.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2014-04-03 11:21:38','2014-04-03 11:21:38','admin',1,NULL);
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

-- Dump completed on 2014-04-03 11:21:27