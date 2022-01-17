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
  `data_login` date DEFAULT NULL,
  `hora_login` time DEFAULT NULL,
  `hora_logout` time DEFAULT NULL,
  `clientes_codigo` int(11) DEFAULT NULL,
  `ip` varchar(45) DEFAULT 'não definido',
  `saldo_login` float DEFAULT '0',
  `saldo_logout` float DEFAULT '0',
  `data_logout` date DEFAULT NULL,
  `maquina` varchar(45) DEFAULT 'não definido',
  PRIMARY KEY (`codigo`),
  KEY `fk_log_acesso_maquinas_clientes1_idx` (`clientes_codigo`),
  CONSTRAINT `fk_log_acesso_maquinas_clientes1` FOREIGN KEY (`clientes_codigo`) REFERENCES `clientes` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_acesso_maquinas`
--

LOCK TABLES `log_acesso_maquinas` WRITE;
/*!40000 ALTER TABLE `log_acesso_maquinas` DISABLE KEYS */;
INSERT INTO `log_acesso_maquinas` VALUES (1,'2019-07-03','15:10:00','15:43:50',1,'não definido',0,0,'2019-07-16','não definido'),(2,'2019-07-04','18:17:42','15:43:50',1,'10.6.20.135',10,0,'2019-07-16','UNIVERSO'),(3,'2019-07-04','19:34:05','15:43:50',1,'10.6.20.135',10,0,'2019-07-16','UNIVERSO'),(4,'2019-07-04','19:47:25','15:43:50',1,'10.6.20.135',10,0,'2019-07-16','UNIVERSO'),(5,'2019-07-04','19:57:27','15:43:50',1,'10.6.20.135',10,0,'2019-07-16','UNIVERSO'),(6,'2019-07-04','19:58:29','15:43:50',1,'10.6.20.135',10,0,'2019-07-16','UNIVERSO'),(7,'2019-07-04','19:59:13','15:43:50',1,'10.6.20.135',10,0,'2019-07-16','UNIVERSO'),(8,'2019-07-04','20:46:31','15:43:50',1,'10.6.20.135',10,0,'2019-07-16','UNIVERSO'),(9,'2019-07-04','20:53:53','15:43:50',1,'10.6.20.135',10,0,'2019-07-16','UNIVERSO'),(10,'2019-07-04','20:54:10','20:54:28',2,'10.6.20.135',20.1,0,'2019-07-04','UNIVERSO'),(11,'2019-07-04','20:59:46','15:43:50',1,'10.6.20.135',10,0,'2019-07-16','UNIVERSO'),(12,'2019-07-05','16:58:42','15:43:50',1,'10.6.20.135',10,0,'2019-07-16','UNIVERSO'),(13,'2019-07-16','15:35:44','15:43:50',1,'10.6.30.112',10,0,'2019-07-16','UNIVERSO'),(14,'2019-07-16','15:37:33','15:43:50',1,'10.6.30.112',10,0,'2019-07-16','UNIVERSO'),(15,'2019-07-16','15:38:34','15:43:50',1,'10.6.30.112',10,0,'2019-07-16','UNIVERSO'),(16,'2019-07-16','15:40:27','15:43:50',1,'10.6.30.112',10,0,'2019-07-16','UNIVERSO'),(17,'2019-07-16','15:42:09','15:43:50',1,'10.6.30.112',10,0,'2019-07-16','UNIVERSO'),(18,'2019-07-16','15:43:27','15:43:50',1,'10.6.30.112',10,0,'2019-07-16','UNIVERSO');
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

-- Dump completed on 2019-07-16 15:48:29
