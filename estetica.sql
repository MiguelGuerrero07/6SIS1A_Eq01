-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: estetica
-- ------------------------------------------------------
-- Server version	5.7.31-log

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
-- Table structure for table `ccol`
--

DROP TABLE IF EXISTS `ccol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccol` (
  `id_cil` int(11) NOT NULL,
  `nom_col` varchar(45) NOT NULL,
  `cp_col` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccol`
--

LOCK TABLES `ccol` WRITE;
/*!40000 ALTER TABLE `ccol` DISABLE KEYS */;
/*!40000 ALTER TABLE `ccol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdelegacion`
--

DROP TABLE IF EXISTS `cdelegacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdelegacion` (
  `id_delg` int(11) NOT NULL,
  `nom_del` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_delg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdelegacion`
--

LOCK TABLES `cdelegacion` WRITE;
/*!40000 ALTER TABLE `cdelegacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdelegacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdireccion`
--

DROP TABLE IF EXISTS `cdireccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdireccion` (
  `id_dr` int(11) NOT NULL AUTO_INCREMENT,
  `calle_dr` varchar(45) NOT NULL,
  `numint_dr` int(11) DEFAULT NULL,
  `numext_dr` int(11) DEFAULT NULL,
  `id_delg` int(11) NOT NULL,
  `id_col` int(11) NOT NULL,
  PRIMARY KEY (`id_dr`),
  KEY `fk_CDireccion_CCol_idx` (`id_col`),
  KEY `fk_CDireccion_CDelegacion1_idx` (`id_delg`),
  CONSTRAINT `fk_CDireccion_CCol` FOREIGN KEY (`id_col`) REFERENCES `ccol` (`id_cil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CDireccion_CDelegacion1` FOREIGN KEY (`id_delg`) REFERENCES `cdelegacion` (`id_delg`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdireccion`
--

LOCK TABLES `cdireccion` WRITE;
/*!40000 ALTER TABLE `cdireccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdireccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cempleado`
--

DROP TABLE IF EXISTS `cempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cempleado` (
  `id_cemp` int(11) NOT NULL AUTO_INCREMENT,
  `tip_cemp` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cemp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cempleado`
--

LOCK TABLES `cempleado` WRITE;
/*!40000 ALTER TABLE `cempleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `cempleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cservicios`
--

DROP TABLE IF EXISTS `cservicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cservicios` (
  `id_cser` int(11) NOT NULL AUTO_INCREMENT,
  `tip_cser` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cservicios`
--

LOCK TABLES `cservicios` WRITE;
/*!40000 ALTER TABLE `cservicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `cservicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csucursal`
--

DROP TABLE IF EXISTS `csucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csucursal` (
  `id_sucur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_sucurl` varchar(45) NOT NULL,
  `id_dr` int(11) NOT NULL,
  PRIMARY KEY (`id_sucur`),
  KEY `fk_CSucursal_CDireccion1_idx` (`id_dr`),
  CONSTRAINT `fk_CSucursal_CDireccion1` FOREIGN KEY (`id_dr`) REFERENCES `cdireccion` (`id_dr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csucursal`
--

LOCK TABLES `csucursal` WRITE;
/*!40000 ALTER TABLE `csucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `csucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcita`
--

DROP TABLE IF EXISTS `dcita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcita` (
  `id_dcit` int(11) NOT NULL AUTO_INCREMENT,
  `fec_dcit` date DEFAULT NULL,
  `hini_dcit` time DEFAULT NULL,
  `hfin_dcit` time DEFAULT NULL,
  `ECitaEmpleado_id_ece` int(11) NOT NULL,
  `MServicio_id_cser` int(11) NOT NULL,
  `CSucursal_id_sucur` int(11) NOT NULL,
  `MCita_id_mci` int(11) NOT NULL,
  PRIMARY KEY (`id_dcit`),
  KEY `fk_DCita_ECitaEmpleado1_idx` (`ECitaEmpleado_id_ece`),
  KEY `fk_DCita_MServicio1_idx` (`MServicio_id_cser`),
  KEY `fk_DCita_CSucursal1_idx` (`CSucursal_id_sucur`),
  KEY `fk_DCita_MCita1_idx` (`MCita_id_mci`),
  CONSTRAINT `fk_DCita_CSucursal1` FOREIGN KEY (`CSucursal_id_sucur`) REFERENCES `csucursal` (`id_sucur`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_DCita_ECitaEmpleado1` FOREIGN KEY (`ECitaEmpleado_id_ece`) REFERENCES `ecitaempleado` (`id_ece`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_DCita_MCita1` FOREIGN KEY (`MCita_id_mci`) REFERENCES `mcita` (`id_mci`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_DCita_MServicio1` FOREIGN KEY (`MServicio_id_cser`) REFERENCES `mservicio` (`id_mser`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcita`
--

LOCK TABLES `dcita` WRITE;
/*!40000 ALTER TABLE `dcita` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecitaempleado`
--

DROP TABLE IF EXISTS `ecitaempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecitaempleado` (
  `id_ece` int(11) NOT NULL AUTO_INCREMENT,
  `hini_ece` time DEFAULT NULL,
  `hfin_ece` time DEFAULT NULL,
  `fec_ecel` date DEFAULT NULL,
  `MEmpleado_id_emp` int(11) NOT NULL,
  PRIMARY KEY (`id_ece`),
  KEY `fk_ECitaEmpleado_MEmpleado1_idx` (`MEmpleado_id_emp`),
  CONSTRAINT `fk_ECitaEmpleado_MEmpleado1` FOREIGN KEY (`MEmpleado_id_emp`) REFERENCES `mempleado` (`id_emp`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecitaempleado`
--

LOCK TABLES `ecitaempleado` WRITE;
/*!40000 ALTER TABLE `ecitaempleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecitaempleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mcita`
--

DROP TABLE IF EXISTS `mcita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mcita` (
  `id_mci` int(11) NOT NULL AUTO_INCREMENT,
  `apartado_mcit` float DEFAULT NULL,
  PRIMARY KEY (`id_mci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcita`
--

LOCK TABLES `mcita` WRITE;
/*!40000 ALTER TABLE `mcita` DISABLE KEYS */;
/*!40000 ALTER TABLE `mcita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mempleado`
--

DROP TABLE IF EXISTS `mempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mempleado` (
  `id_emp` int(11) NOT NULL AUTO_INCREMENT,
  `nom_emp` varchar(45) NOT NULL,
  `appat_emp` varchar(45) NOT NULL,
  `CEmpleado_id_cemp` int(11) NOT NULL,
  PRIMARY KEY (`id_emp`),
  KEY `fk_MEmpleado_CEmpleado1_idx` (`CEmpleado_id_cemp`),
  CONSTRAINT `fk_MEmpleado_CEmpleado1` FOREIGN KEY (`CEmpleado_id_cemp`) REFERENCES `cempleado` (`id_cemp`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mempleado`
--

LOCK TABLES `mempleado` WRITE;
/*!40000 ALTER TABLE `mempleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `mempleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mservicio`
--

DROP TABLE IF EXISTS `mservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mservicio` (
  `id_mser` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ser` varchar(45) NOT NULL,
  `paq_Ser` varchar(100) NOT NULL,
  `dur_ser` time NOT NULL,
  `costo_ser` float NOT NULL,
  `id_cser` int(11) NOT NULL,
  PRIMARY KEY (`id_mser`),
  KEY `fk_MServicio_CServicios1_idx` (`id_cser`),
  CONSTRAINT `fk_MServicio_CServicios1` FOREIGN KEY (`id_cser`) REFERENCES `cservicios` (`id_cser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mservicio`
--

LOCK TABLES `mservicio` WRITE;
/*!40000 ALTER TABLE `mservicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `mservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musuario`
--

DROP TABLE IF EXISTS `musuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musuario` (
  `id_musr` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_musr` varchar(45) NOT NULL,
  `pass_musr` varchar(45) NOT NULL,
  `priv_musr` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_musr`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musuario`
--

LOCK TABLES `musuario` WRITE;
/*!40000 ALTER TABLE `musuario` DISABLE KEYS */;
INSERT INTO `musuario` VALUES (1,'juan','juan',1),(2,'miguel','miguel',0);
/*!40000 ALTER TABLE `musuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-17 23:42:29
