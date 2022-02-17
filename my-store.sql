-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: my_store
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
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uxwxratwdisgopesaubuggmeadkjzhiicdhn` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_zyatjofbwongrxvcfvykxaugzpbngmqwokjo` (`dateRead`),
  KEY `fk_edobyjgcsrzjwzmapiyynlsydisdfaaforhu` (`pluginId`),
  CONSTRAINT `fk_edobyjgcsrzjwzmapiyynlsydisdfaaforhu` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rcinrznaedytgnxrglvyluyvtrbrnfewcmgw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ypyhrpkmrsmchzgamaijmxnasdfkvvvhgbod` (`sessionId`,`volumeId`),
  KEY `idx_ffdlbkzqklrkxjflugfvsxbvkwsdyimjwrsw` (`volumeId`),
  CONSTRAINT `fk_wgjahcondvoabkbtdlkbjamvlenlmeoslqrz` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gwejmpybenogptlfuhqcgeaghvximwzpllxb` (`filename`,`folderId`),
  KEY `idx_qaigohcruxigpnlwscgvpgiertejxkjaqcry` (`folderId`),
  KEY `idx_ebvmbhqzlqzavemrtbhmgzauiazjweolmjqa` (`volumeId`),
  KEY `fk_naplyvoqxvbajbyvbgxrmabkierhheccoetu` (`uploaderId`),
  CONSTRAINT `fk_naplyvoqxvbajbyvbgxrmabkierhheccoetu` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nuatzdeuvatbpdpzlgvqiixzdvtjiufmxngc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pbznigvlcggedzufaugnnfnkbdnoagojupjg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tvowhoasrracvyxzrbyrermuffvyopxcmkyr` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assettransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lfsgxusdnqflepeargscxkcntxjknkrthvuj` (`volumeId`,`assetId`,`location`),
  KEY `idx_ctbvgtsotizixfjfvdtgmkzfcndhtyysxzja` (`assetId`,`format`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransformindex`
--

LOCK TABLES `assettransformindex` WRITE;
/*!40000 ALTER TABLE `assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assettransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lgtlgrnhprunpwrkhphvkvuwvgfxmzufwnru` (`name`),
  KEY `idx_cisdzkffmcshgdscljgxikoeneryamafwenx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iazbmlaxzdxsjkqmtpgkytnocabzsdmddmxl` (`groupId`),
  KEY `fk_khtlwmkuawaikdubpsirkfirkfrftubnbixj` (`parentId`),
  CONSTRAINT `fk_khtlwmkuawaikdubpsirkfirkfrftubnbixj` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sgfdpnbnycxtzeaddcskrjsgqpufszwyzykt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tghktvxukduvrfhzctrmtiniyhnffotmfgtx` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zypfeaeyhzlefonzojcfcochdeqvtbsnuwrw` (`name`),
  KEY `idx_ymmmgylstgyrcbjnvvngvjkghvaiuvzosyqs` (`handle`),
  KEY `idx_hlhcedkrumikskzosttsgteffxdxcoswbaiz` (`structureId`),
  KEY `idx_cvtaefziyvajxuytwadpmsufadafldrcpnsw` (`fieldLayoutId`),
  KEY `idx_rirmftmidrsbqaxndvqajpwkdyewwuqnoqzi` (`dateDeleted`),
  CONSTRAINT `fk_libhirqxojvmzmvzbtlmcobtfpojdahvxxyb` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tejfykmvvtzztvvsfnsasolgthnrvwnkbxqz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kfqjlctoyzeoqoqpkrndzlbmtudsigqfpjbw` (`groupId`,`siteId`),
  KEY `idx_cttymdozroykscuzyvtipvqgtgxofmjxkhxs` (`siteId`),
  CONSTRAINT `fk_tiirpotaztbunnjgyvqijbeddybgrdgtxquu` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wrltouqvhawbzonkssvwzuubjlutflvgkmwc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_teokcoamiliwlaqoyiqxbtplbbpewuinxrqh` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_gelskzezpnejxuasuxbcqvryvxfmfcvkyhpp` (`siteId`),
  KEY `fk_dhdqgnuepesaddmejhswjjugmjtsdyzdaqut` (`userId`),
  CONSTRAINT `fk_dhdqgnuepesaddmejhswjjugmjtsdyzdaqut` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_gelskzezpnejxuasuxbcqvryvxfmfcvkyhpp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tdbrkqkxpwpegttfjbsshfxdqdfaxljvreue` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_ulenrguqumkheexvamoxzmmqeilfsduljfdp` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_lsvajnsnffjyegqzbltommfhlnwrsvtclrvl` (`siteId`),
  KEY `fk_lpppbbtarjmtrjtgqthnsxixiclzhefobbrm` (`fieldId`),
  KEY `fk_vsfwewtvdurzzglaefkhznujpnefgypgfoub` (`userId`),
  CONSTRAINT `fk_fveunptvfovnicoocfmvoflnkwgslqtpmitq` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_lpppbbtarjmtrjtgqthnsxixiclzhefobbrm` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_lsvajnsnffjyegqzbltommfhlnwrsvtclrvl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vsfwewtvdurzzglaefkhznujpnefgypgfoub` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_blrixrffrtftudmieaiowbynkrpynoosmfcb` (`elementId`,`siteId`),
  KEY `idx_zlkwuhwgngtfqccfokzeclbnusqeeydnxref` (`siteId`),
  KEY `idx_abmtnjixtzjmnmodbtjjhtedddnmqzuftilp` (`title`),
  CONSTRAINT `fk_hbmcyipqmhzdmjmartalmzrjlxqgdqjjaaun` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_helqzkgdybcjoldsdgekvnvjolxzcyxrpldz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2022-02-17 10:10:17','2022-02-17 10:10:17','98abbeea-b61e-4bb5-b108-26367fba678e'),(2,2,1,'Home','2022-02-17 11:55:34','2022-02-17 11:55:34','1da207c0-05a4-4f86-bcb8-380c41e3511a'),(3,3,1,'Home','2022-02-17 11:55:34','2022-02-17 11:55:34','aba5ee83-ffad-449e-b911-817d53e226df');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_avxwwjgcfepwqacwzuhmnjwfrosnxlgqyqcx` (`userId`),
  CONSTRAINT `fk_avxwwjgcfepwqacwzuhmnjwfrosnxlgqyqcx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ubxwplmfvdznjazgxlnwtekwyvuimewuched` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourceId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bwkpexmltbpeqmpsudvveuwizxzqnltyyrcv` (`creatorId`,`provisional`),
  KEY `idx_xxnuwpplsnnejqksjnywwontrlfwsowesufy` (`saved`),
  KEY `fk_ebivxxykyyidtuppilunepnwhaqsdejavlto` (`sourceId`),
  CONSTRAINT `fk_ebivxxykyyidtuppilunepnwhaqsdejavlto` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zrvbccboqavcwaujbphneasdjjtbvxunvfpq` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementindexsettings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_flanjbbbirzerdtexmgepniwxgygidpktuzt` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uzqtqrtzogbtyiazvlkwzwxvmhvqamygwfiu` (`dateDeleted`),
  KEY `idx_aussvujnwxaszxrogxnjaivkvjlnmzmqohhq` (`fieldLayoutId`),
  KEY `idx_iiqekwrjlmpkoemgcthrihairjsdtxdqmbiq` (`type`),
  KEY `idx_xskpcfywhscdvhslbpldlpccpodmrgibonhf` (`enabled`),
  KEY `idx_mcvbbcqcjqwodacgnifqprdryyutrfckixvg` (`archived`,`dateCreated`),
  KEY `idx_xcwbqxqihwdnvvuxxwozpkvzxejnouinleox` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_tampevdhzppqoasixeygvfckosfuvnnoyych` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_yfcumicwcxmtrkirzmnwsbybezlvtlhiojwe` (`canonicalId`),
  KEY `fk_byyyeclgwxxzvrnmfdpnebiebjkvoyakabkt` (`draftId`),
  KEY `fk_wltqrdleliovnjrtuycvamveemvmmexmytsr` (`revisionId`),
  CONSTRAINT `fk_byyyeclgwxxzvrnmfdpnebiebjkvoyakabkt` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uqmcvmpkpddewnuurekbejwbqsiqhinvrsaa` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wltqrdleliovnjrtuycvamveemvmmexmytsr` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yfcumicwcxmtrkirzmnwsbybezlvtlhiojwe` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-02-17 10:10:17','2022-02-17 10:10:17',NULL,NULL,'482338c2-213e-4f1e-972a-b49456f432d5'),(2,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2022-02-17 11:55:34','2022-02-17 11:55:34',NULL,NULL,'6ebb6a42-5c83-4861-9a38-c2e7486f05d7'),(3,2,NULL,1,2,'craft\\elements\\Entry',1,0,'2022-02-17 11:55:34','2022-02-17 11:55:34',NULL,NULL,'8ce2e5f7-4ecf-493c-b845-c6c49e685233');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hmahqowdccrthcsqigdrwbveroinbiivtpkm` (`elementId`,`siteId`),
  KEY `idx_rztoebonpgvzrlcllfftewcxabingmtemgea` (`siteId`),
  KEY `idx_abifmxrjsbcxlwvcwzpkwuktaaogdfdfulos` (`slug`,`siteId`),
  KEY `idx_uzovgzhfdstazjhsywloddpizvhdgrvxaulx` (`enabled`),
  KEY `idx_bcnqktwmdcovajnkefpfpmflpwszmnrjvozm` (`uri`,`siteId`),
  CONSTRAINT `fk_dxnhgmlwpqariwpzgfecaywbmcrdinqazflz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lfyvcrdhlzcxvwxnnsasvwulzesxbqcihyzd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2022-02-17 10:10:17','2022-02-17 10:10:17','2d547015-a3ee-43a8-ae06-d565fbd7d744'),(2,2,1,'home','__home__',1,'2022-02-17 11:55:34','2022-02-17 11:55:34','41b80657-a958-4910-8b87-726265903442'),(3,3,1,'home','__home__',1,'2022-02-17 11:55:34','2022-02-17 11:55:34','dd1987a3-505d-4280-a65d-cccc3ed4640b');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tkwdveubaatzbeslqgzxwthcxbthkxseglde` (`postDate`),
  KEY `idx_gsfhnfgskjokdfqkcqvqnlmpwkytoqsinudm` (`expiryDate`),
  KEY `idx_ojmzdaoboahslivevvxntpwdiyntpmrcbhhy` (`authorId`),
  KEY `idx_illgktnrvwairnbbmuhxxuvuakfwaynbxcvf` (`sectionId`),
  KEY `idx_txoaikcmfkzbsgheohnkrddwfkwivyhnmvsj` (`typeId`),
  KEY `fk_ihxbdelugkrkntsafwacjxtwcqaqndedzwro` (`parentId`),
  CONSTRAINT `fk_fygvwxsdazjddmazdqhtacdgrueobynpgoai` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ihxbdelugkrkntsafwacjxtwcqaqndedzwro` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nzkfxabyieylmttvdrjxnketdvltriiynuji` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pjpdcaiwrouvbysbbucsmgodluhwvlwgsndb` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tyaarcyyzukdswacjnunotlroutesuhefvik` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (2,2,NULL,2,NULL,'2022-02-17 11:55:00',NULL,NULL,'2022-02-17 11:55:34','2022-02-17 11:55:34','be972c83-f554-47a2-a35e-0f72ed3ad1a0'),(3,2,NULL,2,NULL,'2022-02-17 11:55:00',NULL,NULL,'2022-02-17 11:55:34','2022-02-17 11:55:34','ef9100c4-cc38-4457-8a5f-f62871bea5f7');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bcmzzpnwofokodbbqocmepwblucirnzrpyvs` (`name`,`sectionId`),
  KEY `idx_zwqsnkidbsscarpgccyqghhmebqwvtqyajtm` (`handle`,`sectionId`),
  KEY `idx_vmlxrpmretxbzrcnkidyriepepqsvezzbmxj` (`sectionId`),
  KEY `idx_iczegedmkctajttoadslwzyaytyzemsesqey` (`fieldLayoutId`),
  KEY `idx_vcarszpqypvepumbnabwsunyqzvhkbcwypyk` (`dateDeleted`),
  CONSTRAINT `fk_mddexyarovpjudnwvsvldffdqvilhelwjjsj` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zaacszwobmuymdgoiafeautxkqxaaiaaecqi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,1,'Home','home',1,'site',NULL,NULL,1,'2022-02-17 11:50:50','2022-02-17 11:52:15','2022-02-17 11:54:17','a9306415-99d1-4d20-9fc4-631262e70e7b'),(2,2,2,'Home','home',0,'site',NULL,'{section.name|raw}',1,'2022-02-17 11:55:34','2022-02-17 11:55:34',NULL,'9caac479-4301-4ed2-9880-76b4028dcd22');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ybspbwfgbugmenjasczmxxvujyrdpwtsiyfy` (`name`),
  KEY `idx_bnaqaocqfkthwukrypednobnannlqvcwllvh` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2022-02-17 10:10:17','2022-02-17 10:10:17',NULL,'9aade32a-cb40-41b4-b76e-59776081160d');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ggsfvtnoqpzpjcbgupazjbwgocjndlvojgrv` (`layoutId`,`fieldId`),
  KEY `idx_lpeumghhvmainqcxqutafwsqdghjvzsapipp` (`sortOrder`),
  KEY `idx_pyjgrndowndcpwehbovugqlyrivfvljmhfxz` (`tabId`),
  KEY `idx_quhegbkymaofydlbsefahucwjnhcckyrffak` (`fieldId`),
  CONSTRAINT `fk_alizrkxvhbccbjcenbxrmtkqwnltonjrhsjq` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nytvsumkhbpsapdwnsmgsgygkccfydeiviql` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yswgyiwuducvchpljbvignextddsjndfsekw` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wvdftbdaqnrbfhrnapdcxqbuoepbmenauuyt` (`dateDeleted`),
  KEY `idx_pouzrpzvimifxvgacyazblnbbddwbpfioczf` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2022-02-17 11:50:50','2022-02-17 11:50:50','2022-02-17 11:54:17','dbce3a0c-28b1-4440-8cfe-d3e48d89f475'),(2,'craft\\elements\\Entry','2022-02-17 11:55:34','2022-02-17 11:55:34',NULL,'db035e2a-5164-4404-9dda-78be42471308');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ifznqtorzyzxwqkysvrqvdhoqdpnjljrknep` (`sortOrder`),
  KEY `idx_yosmcrrjbvaksrgxfiimlphuyqambtfxuxfb` (`layoutId`),
  CONSTRAINT `fk_pnvdaxwvpatuthvkxnjeaogtkioucancjpom` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (2,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-02-17 11:52:15','2022-02-17 11:52:15','fa4e3e65-46f5-417c-a1f4-15a603705935'),(3,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2022-02-17 11:55:34','2022-02-17 11:55:34','08fdfcd0-4f8d-47a5-b6f8-3bc085954e8b');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plobuszsveplmjaocfasnwcrzdvpvqwvuxyj` (`handle`,`context`),
  KEY `idx_mdhgxinmzimqranwnrgktqvweozybkehjoxd` (`groupId`),
  KEY `idx_qwdayzyghmcmoqeijkhpcamdrhsifvmbqurv` (`context`),
  CONSTRAINT `fk_nbpoupeppmwcbntqffweohhwckseyguqdnqq` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_klcgttbnyepyxkprgjfaewdmrovrcgsdnpuh` (`name`),
  KEY `idx_cetzaelhondaepzdtfwynlciacvgtubghhxq` (`handle`),
  KEY `idx_kvejofzwxkabyaihutcbrmwdsfpwsewthmdn` (`fieldLayoutId`),
  KEY `idx_uyyfvzduqrwmpxbfqhofisyqyesqmublbmap` (`sortOrder`),
  CONSTRAINT `fk_bkbhwkeiiyhdnwietazhafiaukhdjssevkxd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_twqhdwfkrfsuxaomkmcvtkcdkbcmthzhkvau` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yxmnrxiihpjxsqrssqyyjhvpfialuoifdbrl` (`accessToken`),
  UNIQUE KEY `idx_ivwzoyotbrnrvqdqgykhgnvtmebrtjyujszv` (`name`),
  KEY `fk_oweejhqgjqlvalbcozzswkufttvkwsgvcvzc` (`schemaId`),
  CONSTRAINT `fk_oweejhqgjqlvalbcozzswkufttvkwsgvcvzc` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'3.7.33','3.7.33',0,'sgtsuwdsouip','2@szfbqxhbuj','2022-02-17 10:10:17','2022-02-17 12:41:01','23533af6-d15b-4c11-a651-5f919cb7af7d');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `ownerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hjsiqllmzfjqvicusdkrrflpwhxlkwyzrimi` (`ownerId`),
  KEY `idx_tzlfhprjdvwnbbonxifzziiowcmkscfdnbyt` (`fieldId`),
  KEY `idx_wwadfcokbexdckcrpkycwisgnxqngrgtdqec` (`typeId`),
  KEY `idx_hqrzapurgjxnfctijwognmmtkbbnqrgqzulg` (`sortOrder`),
  CONSTRAINT `fk_bipokdfkhytnormatnezlikrgtqfpurntiaa` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kxjlsnwtdbnqovudwwcdbiqtgiuseijvylyc` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ydvdjfydtsvngtpjlvgzgkwlepkehjiqwydm` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yvqfaqlouzfvzvcfisnxwffkmibushkjpluh` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jugyzljzvntksxwvhcseixgaxnhtlyljtmdc` (`name`,`fieldId`),
  KEY `idx_xqxclnlnmfdxdaupwrvkueancnyslurunujx` (`handle`,`fieldId`),
  KEY `idx_lxxpnakaolyigrtiwwulvmmzglladrkdqkxp` (`fieldId`),
  KEY `idx_qlqxdwqrpcrlfrrthiiwwovtjlskswmwlyvs` (`fieldLayoutId`),
  CONSTRAINT `fk_kpjkyxtupvqwxghgsjiykanujynmbvdxvngf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xcyqxhqtvidmtvsomfottigsotoatutpgcnr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yxggpdwijydbwilwpirnktktlptsajoquutk` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','31cfa879-ac13-4a3f-a36a-a7864c1e16e0'),(2,'craft','m150403_183908_migrations_table_changes','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','9a51f1e5-c09f-4de4-81c1-897c8e772927'),(3,'craft','m150403_184247_plugins_table_changes','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','d3232364-118a-4946-9038-1878d99d914f'),(4,'craft','m150403_184533_field_version','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','f4fe49c6-d3dc-4006-b0cb-bee97e495989'),(5,'craft','m150403_184729_type_columns','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','6020a774-5d90-4572-9adb-efd25ce27964'),(6,'craft','m150403_185142_volumes','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','6fe0da6e-ba98-4055-a864-d6674a322963'),(7,'craft','m150428_231346_userpreferences','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','c396ba3c-40da-49a4-ae18-264ec63e6b92'),(8,'craft','m150519_150900_fieldversion_conversion','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','3029ff7e-4d8a-49b5-9c77-a0e18cea4ce7'),(9,'craft','m150617_213829_update_email_settings','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','b6ce7239-dd2c-44b8-8c53-643e2c35abfa'),(10,'craft','m150721_124739_templatecachequeries','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','addd20e7-8c68-4137-92e1-30387cfd70f1'),(11,'craft','m150724_140822_adjust_quality_settings','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','ad313e49-25b5-4938-b38e-3364e4b3079a'),(12,'craft','m150815_133521_last_login_attempt_ip','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','5387682f-d4cc-4e91-b39a-b62dfe5b0eb4'),(13,'craft','m151002_095935_volume_cache_settings','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','b8edb613-8fbd-4c4f-bdc1-b116d2ce96b5'),(14,'craft','m151005_142750_volume_s3_storage_settings','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','aed894d7-1753-4073-8fa7-8b0c2972dc56'),(15,'craft','m151016_133600_delete_asset_thumbnails','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','03e7cf0b-2f1d-443d-a837-0c295c86069d'),(16,'craft','m151209_000000_move_logo','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','97da79b9-acf6-41d4-8ec9-ec27178380fa'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','8a0526da-f1c4-4fc2-831d-2958b42a9f47'),(18,'craft','m151215_000000_rename_asset_permissions','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','5df7a124-a103-4a0a-a10c-53dbd8935f46'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','ce500910-7ab5-4862-85ee-bc04ac50d5c7'),(20,'craft','m160708_185142_volume_hasUrls_setting','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','c85caa29-0aa6-4910-addc-bfc36784d1f8'),(21,'craft','m160714_000000_increase_max_asset_filesize','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','b6106c87-63da-45d9-b190-7aca468d0c2d'),(22,'craft','m160727_194637_column_cleanup','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','ae18698a-1f8a-4dfe-b65e-02b7277e7148'),(23,'craft','m160804_110002_userphotos_to_assets','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','d1a04c0e-c76d-4fcc-b02b-24c59f215ae1'),(24,'craft','m160807_144858_sites','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','a249e97f-7ac2-4a17-816f-550574c8effd'),(25,'craft','m160829_000000_pending_user_content_cleanup','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','beed68d6-e505-426a-84db-3dc45de0361d'),(26,'craft','m160830_000000_asset_index_uri_increase','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','14e05104-d0c2-418e-a255-badc2408f9ea'),(27,'craft','m160912_230520_require_entry_type_id','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','58b940bb-e1d1-4fc8-8292-4da21c1f31e8'),(28,'craft','m160913_134730_require_matrix_block_type_id','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','db4fdf68-6d58-4f71-8686-5b85346ea77f'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','a41ec0da-e027-43cd-aeb0-086dd04869c0'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','4efaeca1-03e7-418c-a2d5-a6d3d8d8b056'),(31,'craft','m160925_113941_route_uri_parts','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','0e9ea195-0430-48a7-831d-30066f6bc6b8'),(32,'craft','m161006_205918_schemaVersion_not_null','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','7e6d50c2-9664-492b-ab25-0b6e70a9c9a4'),(33,'craft','m161007_130653_update_email_settings','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','589c4470-4012-46ef-8964-aa5338628b10'),(34,'craft','m161013_175052_newParentId','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','df1edfbb-3eff-477c-b1c0-53c24954156d'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','17f88d3a-97f4-4394-ab5f-d2954b14c4a6'),(36,'craft','m161021_182140_rename_get_help_widget','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','f320fe14-a7fa-4f97-b69a-46371f603298'),(37,'craft','m161025_000000_fix_char_columns','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','755c326f-94f5-40fd-8e2b-8a9371228fb0'),(38,'craft','m161029_124145_email_message_languages','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','dcf3f988-43a9-4169-90be-5cae1e7c55d2'),(39,'craft','m161108_000000_new_version_format','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','0d51cba7-5407-43ce-8438-2e025b4ece2c'),(40,'craft','m161109_000000_index_shuffle','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','8fa3dd9c-4e68-4e50-ade5-7558042edec1'),(41,'craft','m161122_185500_no_craft_app','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','31b9bb4d-a486-4387-842b-764510d374f3'),(42,'craft','m161125_150752_clear_urlmanager_cache','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','84194ed4-4fec-40c3-9199-a972c3f5cd52'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','9b7d7f05-becb-44c8-94d3-4b1eb40c16a8'),(44,'craft','m170114_161144_udates_permission','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','16360fea-3e99-4f11-984f-8c8e842d8ad8'),(45,'craft','m170120_000000_schema_cleanup','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','9c342d82-3721-4c99-8135-ee89b217c561'),(46,'craft','m170126_000000_assets_focal_point','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','ad4d2d84-305f-42d0-bdcc-704a247544a3'),(47,'craft','m170206_142126_system_name','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','8fd7543e-9a8b-4a5f-9e02-377a48228cd9'),(48,'craft','m170217_044740_category_branch_limits','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','d44e41e8-2d41-4c7e-8a70-5f991cd02869'),(49,'craft','m170217_120224_asset_indexing_columns','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','264b915d-aa37-4dae-9a0c-84013ccb857b'),(50,'craft','m170223_224012_plain_text_settings','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','210a3daf-e7d5-4952-a13b-1883226b38f2'),(51,'craft','m170227_120814_focal_point_percentage','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','c3e8d8ff-c76d-4328-bb43-3a3debacfb46'),(52,'craft','m170228_171113_system_messages','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','c46d15d2-b713-4969-a789-beae5c3bbc6a'),(53,'craft','m170303_140500_asset_field_source_settings','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','131b08a8-53b8-42da-b3a7-1a639dbfd7ad'),(54,'craft','m170306_150500_asset_temporary_uploads','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','2c89f019-80c5-46bf-b5bc-83618c549702'),(55,'craft','m170523_190652_element_field_layout_ids','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','0610667a-e9b4-4348-a022-27d4f52cdf02'),(56,'craft','m170621_195237_format_plugin_handles','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','74384359-87c7-4d7f-94bd-6cbd207527c5'),(57,'craft','m170630_161027_deprecation_line_nullable','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','d40beda1-dcfe-4050-98fc-f68c5997ffe7'),(58,'craft','m170630_161028_deprecation_changes','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','29cf69b2-033a-4f73-820e-54199e62cf3f'),(59,'craft','m170703_181539_plugins_table_tweaks','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','ef69ce5b-2ccd-4d23-ae32-8011cf46fb2a'),(60,'craft','m170704_134916_sites_tables','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','cd9ad2e2-6ee5-427d-b70c-d763ba3221ea'),(61,'craft','m170706_183216_rename_sequences','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','cf26e970-1df8-4ecc-b9a2-593edc1fc2d9'),(62,'craft','m170707_094758_delete_compiled_traits','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','ee9c5659-82fb-4b39-8bfd-a7dd5b887f80'),(63,'craft','m170731_190138_drop_asset_packagist','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','68baed8c-e23d-47d4-824c-fef7f816dc68'),(64,'craft','m170810_201318_create_queue_table','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','937510cc-35b6-42a8-bc77-b59a181938d2'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','4bfa996d-dcb6-47f0-8b28-982714a4ed1c'),(66,'craft','m170914_204621_asset_cache_shuffle','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','2c01f380-8d18-40ea-aa4d-65c9b2e07b9e'),(67,'craft','m171011_214115_site_groups','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','fc8fcaf5-1c1e-4bfc-b566-4d7213e4beda'),(68,'craft','m171012_151440_primary_site','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','22245a61-de4b-4e96-9645-4c721636f936'),(69,'craft','m171013_142500_transform_interlace','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','df043e49-a24b-4e22-80f0-3ff343724bf5'),(70,'craft','m171016_092553_drop_position_select','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','26927e63-4071-498e-a209-75c3c27ba571'),(71,'craft','m171016_221244_less_strict_translation_method','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','b921c695-6839-4a47-a136-07135b4b4b43'),(72,'craft','m171107_000000_assign_group_permissions','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','5a75898a-b672-474c-9f58-a8f3e5db019e'),(73,'craft','m171117_000001_templatecache_index_tune','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','f6e81351-7946-4828-93ad-9f97af5e73b6'),(74,'craft','m171126_105927_disabled_plugins','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','3e1aa40d-1418-4a56-a8ab-562bc5c6c4fc'),(75,'craft','m171130_214407_craftidtokens_table','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','3c5314d5-f44a-4178-999b-c8a51b88269b'),(76,'craft','m171202_004225_update_email_settings','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','08f2bf79-8437-43fc-a840-698ca0ea4b6d'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','cd2f7c98-586e-46a5-b8f5-cd86d2885cc8'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','f05d3dc4-f5e2-4e9a-8e60-432d25109c87'),(79,'craft','m171218_143135_longtext_query_column','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','c8d6ab6d-463f-4bfb-acf6-78cfec52bd9a'),(80,'craft','m171231_055546_environment_variables_to_aliases','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','391cd625-d53a-4694-af20-ca3854c5f200'),(81,'craft','m180113_153740_drop_users_archived_column','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','13fe9cb1-01ee-4864-88b6-a3ecd4f11abe'),(82,'craft','m180122_213433_propagate_entries_setting','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','a67b5e9c-b9e9-41c4-844a-e437f8555b1d'),(83,'craft','m180124_230459_fix_propagate_entries_values','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','d4e9a67d-8e08-48ed-8396-fadeb39f12b6'),(84,'craft','m180128_235202_set_tag_slugs','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','3a5087b6-4ae8-431a-9fe4-d17164d748e3'),(85,'craft','m180202_185551_fix_focal_points','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','db06e3ca-cb15-4dd1-8948-c42d8a7b1c39'),(86,'craft','m180217_172123_tiny_ints','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','d68beeb2-d4af-4236-bb5e-e1483cf7878b'),(87,'craft','m180321_233505_small_ints','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','168517b7-f914-4fe3-bf76-5df29b87b57d'),(88,'craft','m180404_182320_edition_changes','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','aeca0f83-3c08-497b-98af-fc094d9a7e87'),(89,'craft','m180411_102218_fix_db_routes','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','a9f027c0-d4d0-48e3-8fd7-8d11aaec3a2a'),(90,'craft','m180416_205628_resourcepaths_table','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','de2734cc-d544-453f-8237-f1fa51c91d6c'),(91,'craft','m180418_205713_widget_cleanup','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','6d002e28-d8eb-4050-94bf-1eafd75c815f'),(92,'craft','m180425_203349_searchable_fields','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','b7606e5e-bf34-41d3-a415-bde417fb9c33'),(93,'craft','m180516_153000_uids_in_field_settings','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','c651f9ef-bcec-4692-95c1-84df97835060'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','b9f044c3-7114-44a6-a728-8d5cdd7e6b7d'),(95,'craft','m180518_173000_permissions_to_uid','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','f824c2dd-78d2-451c-b5b3-206877d3578e'),(96,'craft','m180520_173000_matrix_context_to_uids','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','3697a570-d80a-4834-a044-045195dc78f0'),(97,'craft','m180521_172900_project_config_table','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','1a4c49b5-5040-4ee0-acb2-92ee437f54a1'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','38377d50-fce1-4842-afe3-06a0e95c9e60'),(99,'craft','m180731_162030_soft_delete_sites','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','499c155c-d622-44a8-a7d1-b44bbc36282a'),(100,'craft','m180810_214427_soft_delete_field_layouts','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','0ece1b3c-f472-4832-b39e-61a0efdb2fd7'),(101,'craft','m180810_214439_soft_delete_elements','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','ee7d265b-8ecc-4cbf-82df-9ae6bc879827'),(102,'craft','m180824_193422_case_sensitivity_fixes','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','35b41703-31e5-47ae-bac4-1d8a2bbe1618'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','4e6f2faa-dda1-4c56-9073-a617111ae207'),(104,'craft','m180904_112109_permission_changes','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','fbb75c94-3009-4d2b-9e3e-03b3dda64868'),(105,'craft','m180910_142030_soft_delete_sitegroups','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','40651021-8d40-466f-8fe9-955ec39a8817'),(106,'craft','m181011_160000_soft_delete_asset_support','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','41e537a1-1111-4ca9-a153-ea74c7bb7dd5'),(107,'craft','m181016_183648_set_default_user_settings','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','9cfdfc68-11d1-46ac-acf1-03f81f9a8869'),(108,'craft','m181017_225222_system_config_settings','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','dfc80d3b-d65d-4dea-baa1-d2ae81615e1f'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','0f96fbe5-fc82-4cc1-8144-1bd640107937'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','ea7306a0-2fa5-45ce-93a2-3501ed9956cb'),(111,'craft','m181112_203955_sequences_table','2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 10:10:18','b44313cc-b980-4934-b862-771874832e3e'),(112,'craft','m181121_001712_cleanup_field_configs','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','434b7ecf-a5d7-43ef-9cce-9b677744bb3f'),(113,'craft','m181128_193942_fix_project_config','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','2018a22a-c15c-48fb-b609-8a5da62c8f13'),(114,'craft','m181130_143040_fix_schema_version','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','5f6e8a69-df90-4d1e-b342-4142a08b86ea'),(115,'craft','m181211_143040_fix_entry_type_uids','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','92b1630e-05db-40b9-99b4-454511154511'),(116,'craft','m181217_153000_fix_structure_uids','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','49132ca4-b169-4802-8b65-6bba8a2284c1'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','2d0b284f-bbdb-4d0f-9897-623fce819bcc'),(118,'craft','m190108_110000_cleanup_project_config','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','1f0801cd-6fa0-457a-95a9-d3f1251c5c78'),(119,'craft','m190108_113000_asset_field_setting_change','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','b3589326-5977-4a4b-b708-1d26496e7ea2'),(120,'craft','m190109_172845_fix_colspan','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','c0af5e44-8cce-450e-afc5-48945b2b46d7'),(121,'craft','m190110_150000_prune_nonexisting_sites','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','f76bdea6-630b-4b74-8462-1240f45cafbb'),(122,'craft','m190110_214819_soft_delete_volumes','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','d231aa65-3296-4acd-81cd-75cee2d357db'),(123,'craft','m190112_124737_fix_user_settings','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','0eec03b4-32f7-4a4d-af2a-e7b193a70b5e'),(124,'craft','m190112_131225_fix_field_layouts','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','b9053083-caea-466c-b498-157c2777e948'),(125,'craft','m190112_201010_more_soft_deletes','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','80d50355-a9c8-4134-be2b-710f1d686c0e'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','267b68b1-8c98-419f-86ac-e6488fcc8510'),(127,'craft','m190121_120000_rich_text_config_setting','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','1f665e0d-afae-4066-9e4a-1e6d2e4cca69'),(128,'craft','m190125_191628_fix_email_transport_password','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','e0a24355-c1af-4252-8a0e-d8ccdf9e698e'),(129,'craft','m190128_181422_cleanup_volume_folders','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','cffb23b7-3bb1-4787-ad31-2322687424a8'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','310ebec9-4bcb-4914-bcdf-d95567c0bf4d'),(131,'craft','m190218_143000_element_index_settings_uid','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','15489497-97c5-4297-9d09-2f930b4e2be2'),(132,'craft','m190312_152740_element_revisions','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','7fbbd027-93ea-4a60-af4d-6c1b5b65af5c'),(133,'craft','m190327_235137_propagation_method','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','02afa25f-1bac-4e26-9a08-e4ab79385ded'),(134,'craft','m190401_223843_drop_old_indexes','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','aceece6f-cae9-4b0e-9ae2-ed2ae09ac0ee'),(135,'craft','m190416_014525_drop_unique_global_indexes','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','fed909e3-aac3-4677-b37c-1b47a3a84508'),(136,'craft','m190417_085010_add_image_editor_permissions','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','d3c31253-6f9a-4886-a644-e50533a66e6a'),(137,'craft','m190502_122019_store_default_user_group_uid','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','c78c0ede-0fc0-4ffa-a498-f405f61103b1'),(138,'craft','m190504_150349_preview_targets','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','1dd1377a-7c0a-4851-bfe8-7778d6482e17'),(139,'craft','m190516_184711_job_progress_label','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','c696485b-d3a1-4ea5-819f-687ed06fb270'),(140,'craft','m190523_190303_optional_revision_creators','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','60b48a1f-f453-4ad3-b2b7-de652cc82237'),(141,'craft','m190529_204501_fix_duplicate_uids','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','8dffded2-a023-42c2-9678-b37652101e6b'),(142,'craft','m190605_223807_unsaved_drafts','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','58d94219-66dc-4ccc-97ff-30a0142b56f2'),(143,'craft','m190607_230042_entry_revision_error_tables','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','ae763f5c-4666-4de3-ba88-244e3d11d3c8'),(144,'craft','m190608_033429_drop_elements_uid_idx','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','8ab0e479-d45f-4bcc-a4a7-4d91f80b5919'),(145,'craft','m190617_164400_add_gqlschemas_table','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','bebd5add-0b98-434d-bc8e-bc987ea5f5c7'),(146,'craft','m190624_234204_matrix_propagation_method','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','58c75280-9321-40cd-93c9-fc9543feb821'),(147,'craft','m190711_153020_drop_snapshots','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','c69914f0-33b4-4862-bf9a-a993ae1d867a'),(148,'craft','m190712_195914_no_draft_revisions','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','b5672add-5935-4a6a-8db0-5a2266c4fa08'),(149,'craft','m190723_140314_fix_preview_targets_column','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','5b7cb4bc-3652-4fc5-907b-4617e9a10be5'),(150,'craft','m190820_003519_flush_compiled_templates','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','b0602438-33c4-436a-9a3c-bd9cba4a7e17'),(151,'craft','m190823_020339_optional_draft_creators','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','1ce5845a-f4bd-4f8f-add2-c0689e090e84'),(152,'craft','m190913_152146_update_preview_targets','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','ed0ed482-854d-48de-a8a5-473dc55d187d'),(153,'craft','m191107_122000_add_gql_project_config_support','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','60b6ddd6-efac-4220-a418-7f6934623516'),(154,'craft','m191204_085100_pack_savable_component_settings','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','de0c2c36-93fe-40bd-8541-5f1ebcf377fd'),(155,'craft','m191206_001148_change_tracking','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','c2d7b8c5-0fcd-415a-bd12-948433edbdaa'),(156,'craft','m191216_191635_asset_upload_tracking','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','87eacb55-52a0-4b49-9192-db7fe5150115'),(157,'craft','m191222_002848_peer_asset_permissions','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','54294086-0de1-4f73-9ec1-282fb9697938'),(158,'craft','m200127_172522_queue_channels','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','631fa911-18f5-4c4c-ae80-c7cca0d8b934'),(159,'craft','m200211_175048_truncate_element_query_cache','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','06184431-c0b3-4a1d-b4ab-6740a6139215'),(160,'craft','m200213_172522_new_elements_index','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','cf1d317b-0d39-49f0-8e9f-3fcd391c39ec'),(161,'craft','m200228_195211_long_deprecation_messages','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','6d3fb7d2-edcd-4b41-9900-0a2b6580f8a7'),(162,'craft','m200306_054652_disabled_sites','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','7368fbce-7409-49be-88d6-2785a3e5b023'),(163,'craft','m200522_191453_clear_template_caches','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','e88263a5-18fc-43e2-acf8-d0ea1923834f'),(164,'craft','m200606_231117_migration_tracks','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','f06f6e19-af74-4832-b0c4-975584670aca'),(165,'craft','m200619_215137_title_translation_method','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','60724b31-0407-4aeb-a13e-af325575cb54'),(166,'craft','m200620_005028_user_group_descriptions','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','92f1ec6b-62f8-4d6e-8038-501af272ac08'),(167,'craft','m200620_230205_field_layout_changes','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','511c87e6-aa4f-47a6-9372-0bc1e4c9688a'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','0af3753d-f185-485b-bf6f-e574c00aeb74'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','174efc91-90db-4644-9435-436ca6db4fee'),(170,'craft','m200630_183000_drop_configmap','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','6199615a-acbf-4b0a-a1f6-0cf369dd7c23'),(171,'craft','m200715_113400_transform_index_error_flag','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','b88cd3e1-56dd-4e63-8e57-c70dce6c7dd2'),(172,'craft','m200716_110900_replace_file_asset_permissions','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','d8e040cf-3507-4e8c-9b37-9229c147d0b2'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','14e1f837-27a4-45bb-805c-649708908033'),(174,'craft','m200720_175543_drop_unique_constraints','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','68191179-8dd2-42cf-b3e9-fef104baaed1'),(175,'craft','m200825_051217_project_config_version','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','b77093d4-42b8-48f8-a800-8f70a4b5a8a7'),(176,'craft','m201116_190500_asset_title_translation_method','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','6c2ce45c-6c00-4c39-a255-65696467a7c2'),(177,'craft','m201124_003555_plugin_trials','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','6f72e74b-4516-4d97-bdc0-7aa1b704114a'),(178,'craft','m210209_135503_soft_delete_field_groups','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','12b06bb3-f469-445e-a14a-a9c867726572'),(179,'craft','m210212_223539_delete_invalid_drafts','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','1e37cb59-0cda-4684-91f8-df7f94244838'),(180,'craft','m210214_202731_track_saved_drafts','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','e831825d-2361-4b69-9b26-a95910ed07b2'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','be37dc49-a2c3-4dd4-970a-c7dda12d21df'),(182,'craft','m210302_212318_canonical_elements','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','b7ad9d16-702c-46e4-a662-b4ca029980e0'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','9ed19e46-5d93-41c9-9d5a-425052ef2a53'),(184,'craft','m210329_214847_field_column_suffixes','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','b8e9ab4e-307e-4578-931d-5dc9579afb60'),(185,'craft','m210331_220322_null_author','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','07ab21f3-cd5b-47f7-a41d-90852e278eb7'),(186,'craft','m210405_231315_provisional_drafts','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','1bf06b8c-5869-4edd-ba93-9024baf2c285'),(187,'craft','m210602_111300_project_config_names_in_config','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','2ce90bde-f5fc-40d2-9759-c20e5f86ed59'),(188,'craft','m210611_233510_default_placement_settings','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','325a7699-4078-4818-9816-9b3689114236'),(189,'craft','m210613_145522_sortable_global_sets','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','8ea283ff-d2bc-4b8c-89d9-8ca29dc65f26'),(190,'craft','m210613_184103_announcements','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','eedd98fc-a577-485f-a8de-1af98759be23'),(191,'craft','m210829_000000_element_index_tweak','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','d0f62fd2-38a9-405a-bb75-67d35aefada7'),(192,'craft','m220209_095604_add_indexes','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','63d63786-8546-44a9-8166-499ae2eb3a9a'),(193,'craft','m220214_000000_truncate_sessions','2022-02-17 10:10:19','2022-02-17 10:10:19','2022-02-17 10:10:19','eac7be3c-d9d9-4c4d-9958-d3d32faf5ad8');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qotmdzpdwdouhxwguwjnwonkheeuwxqfvcej` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1645101661'),('email.fromEmail','\"waisalriyanto.rpl2.16@gmail.com\"'),('email.fromName','\"landing-page-craft.com\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.autocapitalize','true'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.autocomplete','false'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.autocorrect','true'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.class','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.disabled','false'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.id','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.instructions','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.label','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.max','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.min','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.name','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.orientation','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.placeholder','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.readonly','false'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.requirable','false'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.size','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.step','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.tip','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.title','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.warning','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.elements.0.width','100'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.name','\"Content\"'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.fieldLayouts.db035e2a-5164-4404-9dda-78be42471308.tabs.0.sortOrder','1'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.handle','\"home\"'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.hasTitleField','false'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.name','\"Home\"'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.section','\"a3ca295a-6e18-4561-922e-ede8c0f90f4c\"'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.sortOrder','1'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.titleFormat','\"{section.name|raw}\"'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.titleTranslationKeyFormat','null'),('entryTypes.9caac479-4301-4ed2-9880-76b4028dcd22.titleTranslationMethod','\"site\"'),('fieldGroups.9aade32a-cb40-41b4-b76e-59776081160d.name','\"Common\"'),('meta.__names__.486d93ec-5876-4d6e-b235-15963051a3b6','\"landing-page-craft\"'),('meta.__names__.9aade32a-cb40-41b4-b76e-59776081160d','\"Common\"'),('meta.__names__.9caac479-4301-4ed2-9880-76b4028dcd22','\"Home\"'),('meta.__names__.a3ca295a-6e18-4561-922e-ede8c0f90f4c','\"Home\"'),('meta.__names__.eb7859f1-a74d-4a53-9e88-225a9c6a49bc','\"landing-page-craft\"'),('sections.a3ca295a-6e18-4561-922e-ede8c0f90f4c.defaultPlacement','\"end\"'),('sections.a3ca295a-6e18-4561-922e-ede8c0f90f4c.enableVersioning','true'),('sections.a3ca295a-6e18-4561-922e-ede8c0f90f4c.handle','\"home\"'),('sections.a3ca295a-6e18-4561-922e-ede8c0f90f4c.name','\"Home\"'),('sections.a3ca295a-6e18-4561-922e-ede8c0f90f4c.propagationMethod','\"all\"'),('sections.a3ca295a-6e18-4561-922e-ede8c0f90f4c.siteSettings.eb7859f1-a74d-4a53-9e88-225a9c6a49bc.enabledByDefault','true'),('sections.a3ca295a-6e18-4561-922e-ede8c0f90f4c.siteSettings.eb7859f1-a74d-4a53-9e88-225a9c6a49bc.hasUrls','true'),('sections.a3ca295a-6e18-4561-922e-ede8c0f90f4c.siteSettings.eb7859f1-a74d-4a53-9e88-225a9c6a49bc.template','\"home.twig\"'),('sections.a3ca295a-6e18-4561-922e-ede8c0f90f4c.siteSettings.eb7859f1-a74d-4a53-9e88-225a9c6a49bc.uriFormat','\"__home__\"'),('sections.a3ca295a-6e18-4561-922e-ede8c0f90f4c.type','\"single\"'),('siteGroups.486d93ec-5876-4d6e-b235-15963051a3b6.name','\"landing-page-craft\"'),('sites.eb7859f1-a74d-4a53-9e88-225a9c6a49bc.baseUrl','\"@web\"'),('sites.eb7859f1-a74d-4a53-9e88-225a9c6a49bc.enabled','true'),('sites.eb7859f1-a74d-4a53-9e88-225a9c6a49bc.handle','\"default\"'),('sites.eb7859f1-a74d-4a53-9e88-225a9c6a49bc.hasUrls','true'),('sites.eb7859f1-a74d-4a53-9e88-225a9c6a49bc.language','\"en-US\"'),('sites.eb7859f1-a74d-4a53-9e88-225a9c6a49bc.name','\"landing-page-craft\"'),('sites.eb7859f1-a74d-4a53-9e88-225a9c6a49bc.primary','true'),('sites.eb7859f1-a74d-4a53-9e88-225a9c6a49bc.siteGroup','\"486d93ec-5876-4d6e-b235-15963051a3b6\"'),('sites.eb7859f1-a74d-4a53-9e88-225a9c6a49bc.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"landing-page-craft.com\"'),('system.schemaVersion','\"3.7.33\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_bllxtvykoyvtaqydgwdxdytsypjhnagpibjh` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_jfdgyndjgyfyfgmicormputtsxvjmtqkrzrw` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pwjgzantcurqrreohsguorsvrmknwturyepy` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_evwyreakpogiebojulfkridgdmhxegtkayyj` (`sourceId`),
  KEY `idx_yzjnavqazglmdgopwqvcidzqormdbhwvmssa` (`targetId`),
  KEY `idx_ttqcjdiqtlukwjuduvlebesefbpqmamlkfqt` (`sourceSiteId`),
  CONSTRAINT `fk_dzfujfdfkoggqhjnfamizchpzuuriznpjehc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hzfnmsqvrdnptumctrnrmywnqilusppfdqtj` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kqdnndhelghcaiqenpjdpxhlbgczundzpjzd` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ygwckcoypnagvsnylivaghziyryuynsfdfoc` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('131d6940','@craft/web/assets/axios/dist'),('17e5e177','@craft/web/assets/pluginstore/dist'),('19415760','@craft/web/assets/fabric/dist'),('1d4107','@craft/web/assets/jqueryui/dist'),('1ff6785b','@craft/web/assets/d3/dist'),('28e85136','@craft/web/assets/garnish/dist'),('3ed8bee7','@craft/web/assets/sites/dist'),('45d38cbb','@craft/web/assets/admintable/dist'),('472dbeb0','@craft/web/assets/recententries/dist'),('48797b4e','@craft/web/assets/focusvisible/dist'),('4ba19e5c','@craft/web/assets/updateswidget/dist'),('5c07a5bb','@craft/web/assets/jquerytouchevents/dist'),('5c547ad9','@craft/web/assets/jquerypayment/dist'),('6811a0f4','@craft/web/assets/craftsupport/dist'),('76bab646','@craft/web/assets/selectize/dist'),('7976c060','@craft/web/assets/cp/dist'),('80e5ba22','@craft/web/assets/fileupload/dist'),('8882d236','@craft/web/assets/elementresizedetector/dist'),('938a2c8c','@craft/web/assets/updates/dist'),('afad111','@bower/jquery/dist'),('b251781e','@craft/web/assets/login/dist'),('b2d7f07','@craft/web/assets/utilities/dist'),('b38ba517','@craft/web/assets/picturefill/dist'),('c83d02a3','@craft/web/assets/vue/dist'),('d15eeb48','@craft/web/assets/feed/dist'),('d97dbe8d','@craft/web/assets/installer/dist'),('dc1ddaf8','@craft/web/assets/velocity/dist'),('dc4efbe4','@craft/web/assets/iframeresizer/dist'),('e10e1f66','@craft/web/assets/editsection/dist'),('e75c5b44','@craft/web/assets/dashboard/dist'),('ee69bf91','@craft/web/assets/xregexp/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourceId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xhkdnbnsicqskupjbbswgqzmiwuhzrtsdpja` (`sourceId`,`num`),
  KEY `fk_cswvgjfmfeeyyovlosxxfkhpynkidoejaqwz` (`creatorId`),
  CONSTRAINT `fk_cswvgjfmfeeyyovlosxxfkhpynkidoejaqwz` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vdpcuimlxgugbqedqyfygxlyrfrmurolgdxa` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_vnlcwghcmrekvecribesaabsyuqsqvdbbcke` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' waisal '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' waisalriyanto rpl2 16 gmail com '),(1,'slug',0,1,''),(2,'title',0,1,' home '),(2,'slug',0,1,' home ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xficsoiubykskuiakhfmlapfieuhipljicgs` (`handle`),
  KEY `idx_lvukzdatjjzknkzgzdvlwvcfjorycvldajzx` (`name`),
  KEY `idx_epvtgwqpcyxzziyngfcdgmaigyqnpjjhneqb` (`structureId`),
  KEY `idx_bluluneuxsubsgyoxovqgbfahnveyufnnnkj` (`dateDeleted`),
  CONSTRAINT `fk_maauicbzojrxkvlibxyfetkvthlftwnpdnfd` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','channel',1,'all','end',NULL,'2022-02-17 11:50:49','2022-02-17 11:50:49','2022-02-17 11:54:17','f3e52e37-e1be-4b0d-bb22-0666f8a94fe7'),(2,NULL,'Home','home','single',1,'all','end',NULL,'2022-02-17 11:55:33','2022-02-17 11:55:33',NULL,'a3ca295a-6e18-4561-922e-ede8c0f90f4c');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qavxexkokrvjbslkrohrbvmjqsevfsawphnc` (`sectionId`,`siteId`),
  KEY `idx_ochxesnpkenyulpbcafwpukcdggentksxuzv` (`siteId`),
  CONSTRAINT `fk_fmdbzdzoybcammynrxgsublcohamemqrbvec` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fndpmdxhxzarhbzgtozkiyzyyehkyanqoygs` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,0,NULL,NULL,1,'2022-02-17 11:50:50','2022-02-17 11:50:50','3c90208e-928c-4833-9857-16004768cece'),(2,2,1,1,'__home__','home.twig',1,'2022-02-17 11:55:33','2022-02-17 11:55:33','68056bdb-533c-44eb-bf66-cc74479cdd7b');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ywxjiznwqlltohkxvggefmtockeowchrxkiy` (`uid`),
  KEY `idx_yynjukhcslgybddcwuwzzklmddfknklmcads` (`token`),
  KEY `idx_uesxjeupqzfhvbymgbudhvookxnpfosraawd` (`dateUpdated`),
  KEY `idx_rndwwqnxyfwsqhactkwdfvgvywdjwcxypnsf` (`userId`),
  CONSTRAINT `fk_gscvwzfjmgtipwgwchaeoqrogfwigefmupnx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'Stp3NrXLa0JlOv0AbUBMbl0rXbXFTdE_qZdhhw0CajHOqdBn9nGTzUvXuJrVFpVLBN-V3c5DNf_m41cP54uVDwXhqT3C3Gd8l4Ae','2022-02-17 11:33:13','2022-02-17 13:20:50','4cfa9293-02e0-4dfd-b608-7f3903663336');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rtwkvbtplnsimzydfbxtariyokiuefkoqwqv` (`userId`,`message`),
  CONSTRAINT `fk_intbjackkwoyisyabyspkjntrfgrydxnsrzo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yexogtqxwzzohvzcfyuqgmdeuruiksjdfhyf` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'landing-page-craft','2022-02-17 10:10:17','2022-02-17 12:41:01',NULL,'486d93ec-5876-4d6e-b235-15963051a3b6');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fneikilyorkgykojorysdfigfjzdctqmxsuq` (`dateDeleted`),
  KEY `idx_suhlflprdzlofxhanhvovahmsgodatzrfcbd` (`handle`),
  KEY `idx_ylnfyqgmhniwnqcymapsxlwjurmdlobfhdvy` (`sortOrder`),
  KEY `fk_ctamgpcfbwxyxcgxfawyxknmqigfrayzlism` (`groupId`),
  CONSTRAINT `fk_ctamgpcfbwxyxcgxfawyxknmqigfrayzlism` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,1,'landing-page-craft','default','en-US',1,'@web',1,'2022-02-17 10:10:17','2022-02-17 12:40:43',NULL,'eb7859f1-a74d-4a53-9e88-225a9c6a49bc');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ypotkpukgoheitqwviefutaaqlfffiaiokbe` (`structureId`,`elementId`),
  KEY `idx_gzfebibxzdaqjobhpycjxqgusuftdhulyiws` (`root`),
  KEY `idx_bbbtggfgsvsdslcopmotncatdrntifedvgzb` (`lft`),
  KEY `idx_naizfgpslgqmlywstfqytyixsrldhlfyavkk` (`rgt`),
  KEY `idx_wocyxpgpobidhebdthialuwypycnsxenrhua` (`level`),
  KEY `idx_ukkyzpkckotbcuqyeiqontntpmmdqdbwifir` (`elementId`),
  CONSTRAINT `fk_numgdnkgstgdzxyfzxgjruatbvkyuthaaydc` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zvtqvikcwozmwkgenuwvcjqfaqaarzlowsoe` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_auasmeqbkslnkzdzmmazqpnsbqhxxnoosclq` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ravlxteoekhfyhhypkrknlisxmochypjqlwd` (`key`,`language`),
  KEY `idx_kuybfnweyblgefjrvwqvdaojqyvraptnhngs` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yvxkdedqwoewqfchuywdokwooglvfvsczzcl` (`name`),
  KEY `idx_fiwlfhmtnmsqbzzbourffynweyvwuaodgqop` (`handle`),
  KEY `idx_wuqqwrazottuuhnioorwmfttpzsuuxovndaj` (`dateDeleted`),
  KEY `fk_foshftwqwghjjsijmyibxitxcaxhuazoantq` (`fieldLayoutId`),
  CONSTRAINT `fk_foshftwqwghjjsijmyibxitxcaxhuazoantq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lyrafrinbgjhwtudekqbzwzqvucwetvbqdik` (`groupId`),
  CONSTRAINT `fk_fwtoeavhtdiccmfymruzhvepvnzpnvigcmzi` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lsgknpugbkuabpmghejgelhultsxzywqqmwz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatecacheelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cacheId` int NOT NULL,
  `elementId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dkveonlbldyrxdhumreurfudnpniqzxmrywk` (`cacheId`),
  KEY `idx_phjyygehxjpifpxpqqqeaplvincvrrckduix` (`elementId`),
  CONSTRAINT `fk_egxbpcmrflbinhccyffvxounpnbkfwimiqwr` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tzqjfvrpprqcqhdairzsjlnysnglstecrtwe` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecacheelements`
--

LOCK TABLES `templatecacheelements` WRITE;
/*!40000 ALTER TABLE `templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatecachequeries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cacheId` int NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fvsuvrqgupntmxogqhiryhxwywtdkjitqlts` (`cacheId`),
  KEY `idx_roxdbfugavnjikfpohbvshtwfocjlwxninmt` (`type`),
  CONSTRAINT `fk_kaypifrixqvauaamqtgsspswuwqhemiboiug` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecachequeries`
--

LOCK TABLES `templatecachequeries` WRITE;
/*!40000 ALTER TABLE `templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templatecaches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteId` int NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nevtdaltpnhnsibnowvuhqmjqxunxfdfudkz` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_akbnpxpgmrsjaeyisejctmnmwpqhtllgiwvd` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_entsjrdhlxvqpupfxykuhbjdiwzvoncqnjnq` (`siteId`),
  CONSTRAINT `fk_pexuyojnasxqchgzxniqjkdmldfgywmgxtjb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecaches`
--

LOCK TABLES `templatecaches` WRITE;
/*!40000 ALTER TABLE `templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nrnwaqiprhdnixjakbifuivxrnmvkfecwqgp` (`token`),
  KEY `idx_kfcakduobwqmyjeaemlvjhcdqvqtgebkekqb` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_slcexytvnitozoxxrrdqynqimonqtljtpcng` (`handle`),
  KEY `idx_nxidyazlqlworbfcsjjqyrzfjuegskmgbzjy` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rutrklylhkkojukgujzsrsedhrekjmqbjyce` (`groupId`,`userId`),
  KEY `idx_wpstocqiwvvfnqujrfffugleeunigwfubvzt` (`userId`),
  CONSTRAINT `fk_ctpqcdfmzsmknpyirgewytomeomtrsqnwnxq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vgeyjjmizjmswdcgmqtvrpjylryersaikdha` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fpmysovxwpfvrteqzvjbpaebdappgfkutiob` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_alwmjzcxrrypbtxlchprcbegccbosauybcno` (`permissionId`,`groupId`),
  KEY `idx_zkqpnukmsyblppwkqaspqdqiyilkkespqhat` (`groupId`),
  CONSTRAINT `fk_jrrkfighshlozodrnimooafujuofqeillsts` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pumfmemotzydsypydgjzabtzjpbfxhibgsqo` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rxmtdzbsuuqniopizotmctyanudoeoxkuzba` (`permissionId`,`userId`),
  KEY `idx_lrkgmjsjujljdzzvbjoepqxmgfnyedenfikt` (`userId`),
  CONSTRAINT `fk_hkuzutyhrufalvevxvodhnhfkqusrvotpwpl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xnxivkgsathjmxynpowegaqginxzrwrqlwex` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_danwslcjutkzdmbsdzjwdudbxvvgmknxmxfn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mogswgbqjdrpbgvlieklnokuexiqgtggtqxr` (`uid`),
  KEY `idx_yetjavojupqzjpipnbdfupwxajhenepgkyty` (`verificationCode`),
  KEY `idx_zrgzzlplaivyhpqjajtyqedsxqgrcnpevnwh` (`email`),
  KEY `idx_stbmcjkhdqbotpahdllpvbxtgedvtwrjrhbw` (`username`),
  KEY `fk_nlnopoufpgbxivtvzwgucqznfrubjaezezzo` (`photoId`),
  CONSTRAINT `fk_nlnopoufpgbxivtvzwgucqznfrubjaezezzo` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pvyaolcqajvxcopiempotkykfefdmluucoxu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'waisal',NULL,NULL,NULL,'waisalriyanto.rpl2.16@gmail.com','$2y$13$kkDo6hkqoigKXyHX4LsGcOMB3PSVXs2MGJGVUzAYdbxYnvxhsczHi',1,0,0,0,'2022-02-17 11:33:13',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2022-02-17 10:10:18','2022-02-17 10:10:18','2022-02-17 11:33:15','6baa9235-0234-413e-8956-5ede80c85100');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hgbozpluyjjwqqepzmmmkcxkinxnmdkablrq` (`name`,`parentId`,`volumeId`),
  KEY `idx_didphrompnrclzefumypnibsgjfvczopikbr` (`parentId`),
  KEY `idx_tbktwkdogllnbjvwphbxgeouoogoqlnwjbye` (`volumeId`),
  CONSTRAINT `fk_rngnqbnaidbxscrarpirumoqrixhwjkcbvof` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vyousajpefsjjchvzmskehbasmvhkghpcjgh` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_muxvtawgodmjgtwkmlwzncgcgapbldukofxp` (`name`),
  KEY `idx_owwhpjjzcfldhqekflqbegrftcgffjcrxsbm` (`handle`),
  KEY `idx_flzayacezsshxdhxgmojspylvttbsvxkgupa` (`fieldLayoutId`),
  KEY `idx_qhqisruoaqseloupzkkhkthajrummgzwemix` (`dateDeleted`),
  CONSTRAINT `fk_crnzbhqutuwzkczkxlrtnpdpgcekwbopyfeg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jeekebczbaoglznixvxuoseliabaiacaoidp` (`userId`),
  CONSTRAINT `fk_gpllpjvgviwlizgrivqffivrzvxcizkezzji` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-02-17 11:33:15','2022-02-17 11:33:15','900cc0cd-01a4-4dda-934c-e5b86e1f6fea'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-02-17 11:33:15','2022-02-17 11:33:15','51eb326c-0633-4f80-b6cc-535d9e5ba8e8'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-02-17 11:33:15','2022-02-17 11:33:15','9060b709-dbd3-48cc-bb38-db3aa1286b2c'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-02-17 11:33:15','2022-02-17 11:33:15','ff22dd9a-cdf3-4c03-ac68-4ab1bf8b8b8d');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-17 20:21:42
