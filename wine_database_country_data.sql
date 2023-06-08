-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (x86_64)
--
-- Host: localhost    Database: wine_database
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `country_data`
--

DROP TABLE IF EXISTS `country_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_data` (
  `index` bigint DEFAULT NULL,
  `country` text,
  `country_id` bigint NOT NULL,
  PRIMARY KEY (`country_id`),
  KEY `ix_wine_database_country_data_index` (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_data`
--

LOCK TABLES `country_data` WRITE;
/*!40000 ALTER TABLE `country_data` DISABLE KEYS */;
INSERT INTO `country_data` VALUES (0,'Italy',1),(1,'Portugal',2),(2,'US',3),(3,'Spain',4),(4,'France',5),(5,'Germany',6),(6,'Chile',7),(7,'Australia',8),(8,'Austria',9),(9,'South Africa',10),(10,'New Zealand',11),(11,'Argentina',12),(12,'Israel',13),(13,'Greece',14),(14,'Romania',15),(15,'Hungary',16),(16,'Mexico',17),(17,'Canada',18),(18,'Czech Republic',19),(19,'Turkey',20),(20,'Croatia',21),(21,'Uruguay',22),(22,'Lebanon',23),(23,'Serbia',24),(24,'Georgia',25),(25,'Brazil',26),(26,'Slovenia',27),(27,'Morocco',28),(28,'Peru',29),(29,'India',30),(30,'Bulgaria',31),(31,'Cyprus',32),(32,'Armenia',33),(33,'Moldova',34),(34,'England',35),(35,'Switzerland',36),(36,'Bosnia and Herzegovina',37),(37,'Slovakia',38),(38,'Macedonia',39),(39,'Ukraine',40),(40,'Luxembourg',41),(41,'China',42),(42,'Egypt',43);
/*!40000 ALTER TABLE `country_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-08 19:33:40
