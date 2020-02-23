CREATE DATABASE  IF NOT EXISTS `AUR` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `AUR`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: AUR
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `AcceptedTerms`
--

DROP TABLE IF EXISTS `AcceptedTerms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AcceptedTerms` (
  `UsersID` int unsigned NOT NULL,
  `TermsID` int unsigned NOT NULL,
  `Revision` int unsigned NOT NULL DEFAULT '0',
  KEY `UsersID` (`UsersID`),
  KEY `TermsID` (`TermsID`),
  CONSTRAINT `AcceptedTerms_ibfk_1` FOREIGN KEY (`UsersID`) REFERENCES `Users` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `AcceptedTerms_ibfk_2` FOREIGN KEY (`TermsID`) REFERENCES `Terms` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AcceptedTerms`
--

LOCK TABLES `AcceptedTerms` WRITE;
/*!40000 ALTER TABLE `AcceptedTerms` DISABLE KEYS */;
/*!40000 ALTER TABLE `AcceptedTerms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccountTypes`
--

DROP TABLE IF EXISTS `AccountTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AccountTypes` (
  `ID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `AccountType` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountTypes`
--

LOCK TABLES `AccountTypes` WRITE;
/*!40000 ALTER TABLE `AccountTypes` DISABLE KEYS */;
INSERT INTO `AccountTypes` VALUES (1,'User'),(2,'Trusted User'),(3,'Developer'),(4,'Trusted User & Developer');
/*!40000 ALTER TABLE `AccountTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ApiRateLimit`
--

DROP TABLE IF EXISTS `ApiRateLimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApiRateLimit` (
  `IP` varchar(45) NOT NULL,
  `Requests` int NOT NULL,
  `WindowStart` bigint NOT NULL,
  PRIMARY KEY (`IP`),
  KEY `ApiRateLimitWindowStart` (`WindowStart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ApiRateLimit`
--

LOCK TABLES `ApiRateLimit` WRITE;
/*!40000 ALTER TABLE `ApiRateLimit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ApiRateLimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bans`
--

DROP TABLE IF EXISTS `Bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bans` (
  `IPAddress` varchar(45) NOT NULL,
  `BanTS` timestamp NOT NULL,
  PRIMARY KEY (`IPAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bans`
--

LOCK TABLES `Bans` WRITE;
/*!40000 ALTER TABLE `Bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DependencyTypes`
--

DROP TABLE IF EXISTS `DependencyTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DependencyTypes` (
  `ID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DependencyTypes`
--

LOCK TABLES `DependencyTypes` WRITE;
/*!40000 ALTER TABLE `DependencyTypes` DISABLE KEYS */;
INSERT INTO `DependencyTypes` VALUES (1,'depends'),(2,'makedepends'),(3,'checkdepends'),(4,'optdepends');
/*!40000 ALTER TABLE `DependencyTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Groups`
--

DROP TABLE IF EXISTS `Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Groups` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Groups`
--

LOCK TABLES `Groups` WRITE;
/*!40000 ALTER TABLE `Groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `Groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Licenses`
--

DROP TABLE IF EXISTS `Licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Licenses` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Licenses`
--

LOCK TABLES `Licenses` WRITE;
/*!40000 ALTER TABLE `Licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `Licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OfficialProviders`
--

DROP TABLE IF EXISTS `OfficialProviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OfficialProviders` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `Repo` varchar(64) NOT NULL,
  `Provides` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ProviderNameProvides` (`Name`,`Provides`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OfficialProviders`
--

LOCK TABLES `OfficialProviders` WRITE;
/*!40000 ALTER TABLE `OfficialProviders` DISABLE KEYS */;
/*!40000 ALTER TABLE `OfficialProviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageBases`
--

DROP TABLE IF EXISTS `PackageBases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackageBases` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `NumVotes` int unsigned NOT NULL DEFAULT '0',
  `Popularity` decimal(10,6) unsigned NOT NULL DEFAULT '0.000000',
  `OutOfDateTS` bigint unsigned DEFAULT NULL,
  `FlaggerComment` text NOT NULL,
  `SubmittedTS` bigint unsigned NOT NULL,
  `ModifiedTS` bigint unsigned NOT NULL,
  `FlaggerUID` int unsigned DEFAULT NULL,
  `SubmitterUID` int unsigned DEFAULT NULL,
  `MaintainerUID` int unsigned DEFAULT NULL,
  `PackagerUID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `FlaggerUID` (`FlaggerUID`),
  KEY `BasesNumVotes` (`NumVotes`),
  KEY `BasesSubmitterUID` (`SubmitterUID`),
  KEY `BasesMaintainerUID` (`MaintainerUID`),
  KEY `BasesPackagerUID` (`PackagerUID`),
  CONSTRAINT `PackageBases_ibfk_1` FOREIGN KEY (`FlaggerUID`) REFERENCES `Users` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `PackageBases_ibfk_2` FOREIGN KEY (`SubmitterUID`) REFERENCES `Users` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `PackageBases_ibfk_3` FOREIGN KEY (`MaintainerUID`) REFERENCES `Users` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `PackageBases_ibfk_4` FOREIGN KEY (`PackagerUID`) REFERENCES `Users` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageBases`
--

LOCK TABLES `PackageBases` WRITE;
/*!40000 ALTER TABLE `PackageBases` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackageBases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageBlacklist`
--

DROP TABLE IF EXISTS `PackageBlacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackageBlacklist` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageBlacklist`
--

LOCK TABLES `PackageBlacklist` WRITE;
/*!40000 ALTER TABLE `PackageBlacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackageBlacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageComaintainers`
--

DROP TABLE IF EXISTS `PackageComaintainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackageComaintainers` (
  `UsersID` int unsigned NOT NULL,
  `PackageBaseID` int unsigned NOT NULL,
  `Priority` int unsigned NOT NULL,
  KEY `ComaintainersPackageBaseID` (`PackageBaseID`),
  KEY `ComaintainersUsersID` (`UsersID`),
  CONSTRAINT `PackageComaintainers_ibfk_1` FOREIGN KEY (`UsersID`) REFERENCES `Users` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `PackageComaintainers_ibfk_2` FOREIGN KEY (`PackageBaseID`) REFERENCES `PackageBases` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageComaintainers`
--

LOCK TABLES `PackageComaintainers` WRITE;
/*!40000 ALTER TABLE `PackageComaintainers` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackageComaintainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageComments`
--

DROP TABLE IF EXISTS `PackageComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackageComments` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `PackageBaseID` int unsigned NOT NULL,
  `UsersID` int unsigned DEFAULT NULL,
  `Comments` text NOT NULL,
  `RenderedComment` text NOT NULL,
  `CommentTS` bigint unsigned NOT NULL DEFAULT '0',
  `EditedTS` bigint unsigned DEFAULT NULL,
  `EditedUsersID` int unsigned DEFAULT NULL,
  `DelTS` bigint unsigned DEFAULT NULL,
  `DelUsersID` int unsigned DEFAULT NULL,
  `PinnedTS` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EditedUsersID` (`EditedUsersID`),
  KEY `DelUsersID` (`DelUsersID`),
  KEY `CommentsUsersID` (`UsersID`),
  KEY `CommentsPackageBaseID` (`PackageBaseID`),
  CONSTRAINT `PackageComments_ibfk_1` FOREIGN KEY (`PackageBaseID`) REFERENCES `PackageBases` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `PackageComments_ibfk_2` FOREIGN KEY (`UsersID`) REFERENCES `Users` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `PackageComments_ibfk_3` FOREIGN KEY (`EditedUsersID`) REFERENCES `Users` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `PackageComments_ibfk_4` FOREIGN KEY (`DelUsersID`) REFERENCES `Users` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageComments`
--

LOCK TABLES `PackageComments` WRITE;
/*!40000 ALTER TABLE `PackageComments` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackageComments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageDepends`
--

DROP TABLE IF EXISTS `PackageDepends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackageDepends` (
  `PackageID` int unsigned NOT NULL,
  `DepTypeID` tinyint unsigned NOT NULL,
  `DepName` varchar(255) NOT NULL,
  `DepDesc` varchar(255) DEFAULT NULL,
  `DepCondition` varchar(255) DEFAULT NULL,
  `DepArch` varchar(255) DEFAULT NULL,
  KEY `DepTypeID` (`DepTypeID`),
  KEY `DependsPackageID` (`PackageID`),
  KEY `DependsDepName` (`DepName`),
  CONSTRAINT `PackageDepends_ibfk_1` FOREIGN KEY (`PackageID`) REFERENCES `Packages` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `PackageDepends_ibfk_2` FOREIGN KEY (`DepTypeID`) REFERENCES `DependencyTypes` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageDepends`
--

LOCK TABLES `PackageDepends` WRITE;
/*!40000 ALTER TABLE `PackageDepends` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackageDepends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageGroups`
--

DROP TABLE IF EXISTS `PackageGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackageGroups` (
  `PackageID` int unsigned NOT NULL,
  `GroupID` int unsigned NOT NULL,
  PRIMARY KEY (`PackageID`,`GroupID`),
  KEY `GroupID` (`GroupID`),
  CONSTRAINT `PackageGroups_ibfk_1` FOREIGN KEY (`PackageID`) REFERENCES `Packages` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `PackageGroups_ibfk_2` FOREIGN KEY (`GroupID`) REFERENCES `Groups` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageGroups`
--

LOCK TABLES `PackageGroups` WRITE;
/*!40000 ALTER TABLE `PackageGroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackageGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageKeywords`
--

DROP TABLE IF EXISTS `PackageKeywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackageKeywords` (
  `PackageBaseID` int unsigned NOT NULL,
  `Keyword` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`PackageBaseID`,`Keyword`),
  CONSTRAINT `PackageKeywords_ibfk_1` FOREIGN KEY (`PackageBaseID`) REFERENCES `PackageBases` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageKeywords`
--

LOCK TABLES `PackageKeywords` WRITE;
/*!40000 ALTER TABLE `PackageKeywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackageKeywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageLicenses`
--

DROP TABLE IF EXISTS `PackageLicenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackageLicenses` (
  `PackageID` int unsigned NOT NULL,
  `LicenseID` int unsigned NOT NULL,
  PRIMARY KEY (`PackageID`,`LicenseID`),
  KEY `LicenseID` (`LicenseID`),
  CONSTRAINT `PackageLicenses_ibfk_1` FOREIGN KEY (`PackageID`) REFERENCES `Packages` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `PackageLicenses_ibfk_2` FOREIGN KEY (`LicenseID`) REFERENCES `Licenses` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageLicenses`
--

LOCK TABLES `PackageLicenses` WRITE;
/*!40000 ALTER TABLE `PackageLicenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackageLicenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageNotifications`
--

DROP TABLE IF EXISTS `PackageNotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackageNotifications` (
  `PackageBaseID` int unsigned NOT NULL,
  `UserID` int unsigned NOT NULL,
  UNIQUE KEY `NotifyUserIDPkgID` (`UserID`,`PackageBaseID`),
  KEY `PackageBaseID` (`PackageBaseID`),
  CONSTRAINT `PackageNotifications_ibfk_1` FOREIGN KEY (`PackageBaseID`) REFERENCES `PackageBases` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `PackageNotifications_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `Users` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageNotifications`
--

LOCK TABLES `PackageNotifications` WRITE;
/*!40000 ALTER TABLE `PackageNotifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackageNotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageRelations`
--

DROP TABLE IF EXISTS `PackageRelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackageRelations` (
  `PackageID` int unsigned NOT NULL,
  `RelTypeID` tinyint unsigned NOT NULL,
  `RelName` varchar(255) NOT NULL,
  `RelCondition` varchar(255) DEFAULT NULL,
  `RelArch` varchar(255) DEFAULT NULL,
  KEY `RelTypeID` (`RelTypeID`),
  KEY `RelationsRelName` (`RelName`),
  KEY `RelationsPackageID` (`PackageID`),
  CONSTRAINT `PackageRelations_ibfk_1` FOREIGN KEY (`PackageID`) REFERENCES `Packages` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `PackageRelations_ibfk_2` FOREIGN KEY (`RelTypeID`) REFERENCES `RelationTypes` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageRelations`
--

LOCK TABLES `PackageRelations` WRITE;
/*!40000 ALTER TABLE `PackageRelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackageRelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageRequests`
--

DROP TABLE IF EXISTS `PackageRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackageRequests` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ReqTypeID` tinyint unsigned NOT NULL,
  `PackageBaseID` int unsigned DEFAULT NULL,
  `PackageBaseName` varchar(255) NOT NULL,
  `MergeBaseName` varchar(255) DEFAULT NULL,
  `UsersID` int unsigned DEFAULT NULL,
  `Comments` text NOT NULL,
  `ClosureComment` text NOT NULL,
  `RequestTS` bigint unsigned NOT NULL DEFAULT '0',
  `ClosedTS` bigint unsigned DEFAULT NULL,
  `ClosedUID` int unsigned DEFAULT NULL,
  `Status` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ReqTypeID` (`ReqTypeID`),
  KEY `ClosedUID` (`ClosedUID`),
  KEY `RequestsPackageBaseID` (`PackageBaseID`),
  KEY `RequestsUsersID` (`UsersID`),
  CONSTRAINT `PackageRequests_ibfk_1` FOREIGN KEY (`ReqTypeID`) REFERENCES `RequestTypes` (`ID`),
  CONSTRAINT `PackageRequests_ibfk_2` FOREIGN KEY (`PackageBaseID`) REFERENCES `PackageBases` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `PackageRequests_ibfk_3` FOREIGN KEY (`UsersID`) REFERENCES `Users` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `PackageRequests_ibfk_4` FOREIGN KEY (`ClosedUID`) REFERENCES `Users` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageRequests`
--

LOCK TABLES `PackageRequests` WRITE;
/*!40000 ALTER TABLE `PackageRequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackageRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageSources`
--

DROP TABLE IF EXISTS `PackageSources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackageSources` (
  `PackageID` int unsigned NOT NULL,
  `Source` varchar(8000) NOT NULL DEFAULT '/dev/null',
  `SourceArch` varchar(255) DEFAULT NULL,
  KEY `SourcesPackageID` (`PackageID`),
  CONSTRAINT `PackageSources_ibfk_1` FOREIGN KEY (`PackageID`) REFERENCES `Packages` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageSources`
--

LOCK TABLES `PackageSources` WRITE;
/*!40000 ALTER TABLE `PackageSources` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackageSources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageVotes`
--

DROP TABLE IF EXISTS `PackageVotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PackageVotes` (
  `UsersID` int unsigned NOT NULL,
  `PackageBaseID` int unsigned NOT NULL,
  `VoteTS` bigint unsigned DEFAULT NULL,
  UNIQUE KEY `VoteUsersIDPackageID` (`UsersID`,`PackageBaseID`),
  KEY `VotesUsersID` (`UsersID`),
  KEY `VotesPackageBaseID` (`PackageBaseID`),
  CONSTRAINT `PackageVotes_ibfk_1` FOREIGN KEY (`UsersID`) REFERENCES `Users` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `PackageVotes_ibfk_2` FOREIGN KEY (`PackageBaseID`) REFERENCES `PackageBases` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageVotes`
--

LOCK TABLES `PackageVotes` WRITE;
/*!40000 ALTER TABLE `PackageVotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackageVotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Packages`
--

DROP TABLE IF EXISTS `Packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Packages` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `PackageBaseID` int unsigned NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Version` varchar(255) NOT NULL DEFAULT '',
  `Description` varchar(255) DEFAULT NULL,
  `URL` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `PackageBaseID` (`PackageBaseID`),
  CONSTRAINT `Packages_ibfk_1` FOREIGN KEY (`PackageBaseID`) REFERENCES `PackageBases` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Packages`
--

LOCK TABLES `Packages` WRITE;
/*!40000 ALTER TABLE `Packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `Packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RelationTypes`
--

DROP TABLE IF EXISTS `RelationTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RelationTypes` (
  `ID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RelationTypes`
--

LOCK TABLES `RelationTypes` WRITE;
/*!40000 ALTER TABLE `RelationTypes` DISABLE KEYS */;
INSERT INTO `RelationTypes` VALUES (1,'conflicts'),(2,'provides'),(3,'replaces');
/*!40000 ALTER TABLE `RelationTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RequestTypes`
--

DROP TABLE IF EXISTS `RequestTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RequestTypes` (
  `ID` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RequestTypes`
--

LOCK TABLES `RequestTypes` WRITE;
/*!40000 ALTER TABLE `RequestTypes` DISABLE KEYS */;
INSERT INTO `RequestTypes` VALUES (1,'deletion'),(2,'orphan'),(3,'merge');
/*!40000 ALTER TABLE `RequestTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SSHPubKeys`
--

DROP TABLE IF EXISTS `SSHPubKeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SSHPubKeys` (
  `UserID` int unsigned NOT NULL,
  `Fingerprint` varchar(44) NOT NULL,
  `PubKey` varchar(4096) NOT NULL,
  PRIMARY KEY (`Fingerprint`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `SSHPubKeys_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SSHPubKeys`
--

LOCK TABLES `SSHPubKeys` WRITE;
/*!40000 ALTER TABLE `SSHPubKeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `SSHPubKeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sessions`
--

DROP TABLE IF EXISTS `Sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sessions` (
  `UsersID` int unsigned NOT NULL,
  `SessionID` char(32) NOT NULL,
  `LastUpdateTS` bigint unsigned NOT NULL,
  UNIQUE KEY `SessionID` (`SessionID`),
  KEY `UsersID` (`UsersID`),
  CONSTRAINT `Sessions_ibfk_1` FOREIGN KEY (`UsersID`) REFERENCES `Users` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sessions`
--

LOCK TABLES `Sessions` WRITE;
/*!40000 ALTER TABLE `Sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TU_VoteInfo`
--

DROP TABLE IF EXISTS `TU_VoteInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TU_VoteInfo` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Agenda` text NOT NULL,
  `User` varchar(32) NOT NULL,
  `Submitted` bigint unsigned NOT NULL,
  `End` bigint unsigned NOT NULL,
  `Quorum` decimal(2,2) unsigned NOT NULL,
  `SubmitterID` int unsigned NOT NULL,
  `Yes` tinyint unsigned NOT NULL DEFAULT '0',
  `No` tinyint unsigned NOT NULL DEFAULT '0',
  `Abstain` tinyint unsigned NOT NULL DEFAULT '0',
  `ActiveTUs` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SubmitterID` (`SubmitterID`),
  CONSTRAINT `TU_VoteInfo_ibfk_1` FOREIGN KEY (`SubmitterID`) REFERENCES `Users` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TU_VoteInfo`
--

LOCK TABLES `TU_VoteInfo` WRITE;
/*!40000 ALTER TABLE `TU_VoteInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `TU_VoteInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TU_Votes`
--

DROP TABLE IF EXISTS `TU_Votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TU_Votes` (
  `VoteID` int unsigned NOT NULL,
  `UserID` int unsigned NOT NULL,
  KEY `VoteID` (`VoteID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `TU_Votes_ibfk_1` FOREIGN KEY (`VoteID`) REFERENCES `TU_VoteInfo` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `TU_Votes_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `Users` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TU_Votes`
--

LOCK TABLES `TU_Votes` WRITE;
/*!40000 ALTER TABLE `TU_Votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `TU_Votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Terms`
--

DROP TABLE IF EXISTS `Terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Terms` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) NOT NULL,
  `URL` varchar(8000) NOT NULL,
  `Revision` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Terms`
--

LOCK TABLES `Terms` WRITE;
/*!40000 ALTER TABLE `Terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `Terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `AccountTypeID` tinyint unsigned NOT NULL DEFAULT '1',
  `Suspended` tinyint unsigned NOT NULL DEFAULT '0',
  `Username` varchar(32) NOT NULL,
  `Email` varchar(254) NOT NULL,
  `BackupEmail` varchar(254) DEFAULT NULL,
  `HideEmail` tinyint unsigned NOT NULL DEFAULT '0',
  `Passwd` varchar(255) NOT NULL,
  `Salt` char(32) NOT NULL DEFAULT '',
  `ResetKey` char(32) NOT NULL DEFAULT '',
  `RealName` varchar(64) NOT NULL DEFAULT '',
  `LangPreference` varchar(6) NOT NULL DEFAULT 'en',
  `Timezone` varchar(32) NOT NULL DEFAULT 'UTC',
  `Homepage` text,
  `IRCNick` varchar(32) NOT NULL DEFAULT '',
  `PGPKey` varchar(40) DEFAULT NULL,
  `LastLogin` bigint unsigned NOT NULL DEFAULT '0',
  `LastLoginIPAddress` varchar(45) DEFAULT NULL,
  `LastSSHLogin` bigint unsigned NOT NULL DEFAULT '0',
  `LastSSHLoginIPAddress` varchar(45) DEFAULT NULL,
  `InactivityTS` bigint unsigned NOT NULL DEFAULT '0',
  `RegistrationTS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CommentNotify` tinyint(1) NOT NULL DEFAULT '1',
  `UpdateNotify` tinyint(1) NOT NULL DEFAULT '0',
  `OwnershipNotify` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`),
  KEY `UsersAccountTypeID` (`AccountTypeID`),
  CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`AccountTypeID`) REFERENCES `AccountTypes` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'AUR'
--

--
-- Dumping routines for database 'AUR'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-23 17:44:20
