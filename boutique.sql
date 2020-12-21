-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: boutique
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Fleurs'),(2,'Boisson');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `adresse` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Salah Eddine','salah.eddine.serrakh@gmail.com','0780885554','24 rue fulton'),(2,'Salah Eddine','salah.eddine.serrakh@gmail.com','0780885554','24 rue fulton'),(3,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL),(5,NULL,NULL,NULL,NULL),(6,'dzad','dzad','dazdza','554'),(7,'sasaz eaze','ezae@eaze.com','eazeazeaz ','55456'),(8,'z aze az','eae@eaz.com','eazeaze ','26644887'),(9,'eaz eaz eaz','eazez@eaze.com','eazezae','565651'),(10,'eaz eaz ez','eazeza@eaz.com','eazeaz','3232..'),(11,'aeaz azeaz','aezae@eaze.com','eazeaze zaeza','55354665'),(12,'eaz eaz eaz','eazeaze@eaze.com','eazeaze zae za','46565464'),(13,'daz eaz eaze','eazeaze@eaze.com','eazeaze ','867678673'),(14,'ze zaeaz eaz','eazeaz@eaz.com','eazeaz','5156'),(15,' aze az eaz','eaeaz@eaz.com','eazezaa','32152'),(16,'eaz eaze ','eazeaz@eza.com','ezaeza aze ','56565459'),(17,'eza eaz eaze','eazeaze@eaze.com','ezae az','6561655'),(18,'e azeaz e','sazeaz@eaz.com','eaze aze az','4655312865'),(19,' eaz ea','eazeazeaz@eaz.com','23 aez ','33554545248'),(20,'aze ae','eazezeaz@eaz.com','24  aze za ','321456578'),(21,'e aze az','ezaeaz@eaze.com','2',''),(22,'e azeaz e','eazeaz@ea.com','24 aez a','064587963'),(23,'SERRAKH Salah Eddine','salah.eddine.serrakh@gmail.com','24 rue fulton','0780885554'),(24,'Ali baba','ali.baba@gmai.com','25 rue fulton','33156548722');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande_client`
--

DROP TABLE IF EXISTS `commande_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande_client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `montant` decimal(6,2) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `no_confirmation` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_comcl` (`client_id`),
  CONSTRAINT `pk_comcl` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande_client`
--

LOCK TABLES `commande_client` WRITE;
/*!40000 ALTER TABLE `commande_client` DISABLE KEYS */;
INSERT INTO `commande_client` VALUES (1,36.00,'2020-12-03 23:00:00',786640016,13),(2,36.00,'2020-12-03 23:00:00',502088914,14),(3,36.00,'2020-12-03 23:00:00',618441264,15),(4,25.00,'2020-12-03 23:00:00',23405425,16),(5,86.00,'2020-12-03 23:00:00',111312685,17),(6,36.00,'2020-12-09 23:00:00',266245351,18),(7,25.00,'2020-12-09 23:00:00',633355612,19),(8,61.00,'2020-12-09 23:00:00',478583931,20),(9,36.00,'2020-12-09 23:00:00',735918662,21),(10,36.00,'2020-12-15 23:00:00',221675760,22),(11,72.00,'2020-12-15 23:00:00',970895929,23),(12,133.00,'2020-12-15 23:00:00',684607825,24);
/*!40000 ALTER TABLE `commande_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prix` decimal(5,2) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `dernier_maj` timestamp NULL DEFAULT NULL,
  `categorie_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_prod` (`categorie_id`),
  CONSTRAINT `pk_prod` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'Test 1',36.00,'just test','2020-11-26 18:05:01',1),(2,'Test 2',25.00,'justezae test','2020-11-26 18:05:25',2);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit_commande`
--

DROP TABLE IF EXISTS `produit_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit_commande` (
  `commande_client_id` int NOT NULL,
  `produit_id` int NOT NULL,
  `quantite` int DEFAULT NULL,
  PRIMARY KEY (`commande_client_id`,`produit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit_commande`
--

LOCK TABLES `produit_commande` WRITE;
/*!40000 ALTER TABLE `produit_commande` DISABLE KEYS */;
INSERT INTO `produit_commande` VALUES (2,1,1),(3,1,1),(4,2,1),(5,1,1),(5,2,2),(6,1,1),(7,2,1),(8,1,1),(8,2,1),(9,1,1),(10,1,1),(11,1,2),(12,1,3),(12,2,1);
/*!40000 ALTER TABLE `produit_commande` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-16 23:36:39
