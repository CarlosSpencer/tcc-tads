CREATE DATABASE  IF NOT EXISTS `tcc` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tcc`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: tcc
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `log_acesso_maquinas`
--

DROP TABLE IF EXISTS `log_acesso_maquinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log_acesso_maquinas` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `fk_maquina` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora_login` time NOT NULL,
  `hora_logout` time NOT NULL,
  `clientes_codigo` int(11) NOT NULL,
  `ip` varchar(45) NOT NULL DEFAULT 'não definido',
  PRIMARY KEY (`codigo`),
  KEY `fk_maquina_idx` (`fk_maquina`),
  KEY `fk_log_acesso_maquinas_clientes1_idx` (`clientes_codigo`),
  CONSTRAINT `fk_log_acesso_maquinas_clientes1` FOREIGN KEY (`clientes_codigo`) REFERENCES `clientes` (`codigo`),
  CONSTRAINT `fk_maquina` FOREIGN KEY (`fk_maquina`) REFERENCES `maquina` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_acesso_maquinas`
--

LOCK TABLES `log_acesso_maquinas` WRITE;
/*!40000 ALTER TABLE `log_acesso_maquinas` DISABLE KEYS */;
INSERT INTO `log_acesso_maquinas` VALUES (1,1,'2019-07-03','15:10:00','15:30:00',1,'não definido');
/*!40000 ALTER TABLE `log_acesso_maquinas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-03 21:08:59
