-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hotel
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilio` (
  `idDomicilio` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `provincia_id` int DEFAULT NULL,
  PRIMARY KEY (`idDomicilio`),
  KEY `provincia_id_idx` (`provincia_id`),
  CONSTRAINT `provincia_id` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`idProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilio`
--

LOCK TABLES `domicilio` WRITE;
/*!40000 ALTER TABLE `domicilio` DISABLE KEYS */;
INSERT INTO `domicilio` VALUES (1,'Calle 121','Buenos Aires',1),(2,'Calle 221','Cordoba',2),(3,'Calle 321','Rosario',3),(4,'Calle 421','Mendoza',4),(5,'Calle 521','San Miguel de Tucuman',5),(6,'Calle 621','Formosa',6),(7,'Calle 721','Posadas',7),(8,'Calle 322','Rosario',3);
/*!40000 ALTER TABLE `domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitacion` (
  `idHabitacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(3) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idHabitacion`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
INSERT INTO `habitacion` VALUES (1,'100','accesible','limpia vacia',100),(2,'101','accesible','limpia vacia',100),(3,'102','classic','sucia vacia',250),(4,'103','classic','limpia ocupada',250),(5,'104','classic city view','sucia vacia',300),(6,'105','classic city view','limpia ocupada',300),(7,'106','suite','limpia vacia',400),(8,'107','suite','limpia vacia',400);
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huesped`
--

DROP TABLE IF EXISTS `huesped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huesped` (
  `idHuesped` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `empresa` varchar(300) DEFAULT NULL,
  `telefono` varchar(45) NOT NULL,
  `id_domicilio` int DEFAULT NULL,
  `numeroReserva` int NOT NULL,
  PRIMARY KEY (`idHuesped`),
  KEY `domicilio_id_idx` (`id_domicilio`),
  CONSTRAINT `domicilio_id` FOREIGN KEY (`id_domicilio`) REFERENCES `domicilio` (`idDomicilio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huesped`
--

LOCK TABLES `huesped` WRITE;
/*!40000 ALTER TABLE `huesped` DISABLE KEYS */;
INSERT INTO `huesped` VALUES (1,'Juan','Perez','Fantasy','123456789',1,10),(2,'Maria','Martinez','Fantasy','223456789',2,11),(3,'Roberto','Martinez','Fantasy','323456789',2,11),(4,'Martin','Gimenez',NULL,'423456789',3,12),(5,'Cecilia','Lopez','Coca','523456789',4,13),(6,'Miguel','Lopez','Coca','623456789',4,13),(7,'Lionel','Messi',NULL,'723456789',3,17),(8,'Zoe','Heredia',NULL,'823456789',5,14),(9,'Alejandro','Luque',NULL,'923456789',6,15),(10,'Angel','Lovato','Pepsi','233456789',7,16);
/*!40000 ALTER TABLE `huesped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huespedreserva`
--

DROP TABLE IF EXISTS `huespedreserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huespedreserva` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idHuesped` int NOT NULL,
  `idReserva` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reservas_id_idx` (`idReserva`),
  KEY `huesped_id` (`idHuesped`),
  CONSTRAINT `huesped_id` FOREIGN KEY (`idHuesped`) REFERENCES `huesped` (`idHuesped`),
  CONSTRAINT `reserva_id` FOREIGN KEY (`idReserva`) REFERENCES `reserva` (`idReserva`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huespedreserva`
--

LOCK TABLES `huespedreserva` WRITE;
/*!40000 ALTER TABLE `huespedreserva` DISABLE KEYS */;
INSERT INTO `huespedreserva` VALUES (1,1,1),(2,2,2),(3,3,2),(4,4,3),(5,5,4),(6,6,4),(7,7,7),(8,8,5),(9,9,6),(10,10,8);
/*!40000 ALTER TABLE `huespedreserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `idPago` int NOT NULL AUTO_INCREMENT,
  `monto` decimal(10,2) NOT NULL,
  `formadepago` varchar(45) NOT NULL,
  `reserva_id` int NOT NULL,
  PRIMARY KEY (`idPago`),
  KEY `id_reserva_idx` (`reserva_id`),
  CONSTRAINT `id_reserva` FOREIGN KEY (`reserva_id`) REFERENCES `reserva` (`idReserva`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,1000.00,'Transferencia',1),(2,1000.00,'Transferencia',2),(3,2500.00,'Transferencia',3),(4,2500.00,'Transferencia',4),(5,3000.00,'Transferencia',5),(6,3000.00,'Transferencia',6),(7,4000.00,'Efectivo',7),(8,4000.00,'Efectivo',8),(9,1000.00,'Transferencia',2),(10,2500.00,'Transferencia',4);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `idProvincia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'buenos aires'),(2,'cordoba'),(3,'santa fe'),(4,'mendoza'),(5,'tucuman'),(6,'formosa'),(7,'misiones');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `idReserva` int NOT NULL AUTO_INCREMENT,
  `numeroReserva` int NOT NULL,
  `estado` varchar(45) NOT NULL,
  `ingreso` date NOT NULL,
  `egreso` date NOT NULL,
  `habitacion` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`idReserva`),
  UNIQUE KEY `numeroreserva_UNIQUE` (`numeroReserva`),
  KEY `habitacion_id_idx` (`habitacion`),
  CONSTRAINT `habitacion` FOREIGN KEY (`habitacion`) REFERENCES `habitacion` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,10,'Confirmado','2023-10-02','2023-10-12','100'),(2,11,'Confirmado','2023-10-02','2023-10-12','101'),(3,12,'Confirmado','2023-10-02','2023-10-12','102'),(4,13,'Confirmado','2023-09-28','2023-10-07','103'),(5,14,'Confirmado','2023-10-02','2023-10-12','104'),(6,15,'Confirmado','2023-09-28','2023-10-07','105'),(7,16,'Confirmado','2023-10-02','2023-10-12','107'),(8,17,'Confirmado','2023-10-02','2023-10-12','106');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-18 21:43:50
