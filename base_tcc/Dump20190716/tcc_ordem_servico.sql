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
-- Table structure for table `ordem_servico`
--

DROP TABLE IF EXISTS `ordem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ordem_servico` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `data_abertura` date NOT NULL,
  `data_fechamento` date DEFAULT NULL,
  `clientes_codigo` int(11) NOT NULL,
  `status_codigo` int(11) NOT NULL,
  `problema_informado` text,
  `diagnostico` text,
  `funcionario_codigo` int(11) DEFAULT NULL,
  `venda_codigo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_ordem_servico_clientes1_idx` (`clientes_codigo`),
  KEY `fk_os_status_idx` (`status_codigo`),
  KEY `fk_os_funcionario_idx` (`funcionario_codigo`),
  KEY `fk_ordem_servico_venda1_idx` (`venda_codigo`),
  CONSTRAINT `fk_ordem_servico_clientes1` FOREIGN KEY (`clientes_codigo`) REFERENCES `clientes` (`codigo`),
  CONSTRAINT `fk_ordem_servico_venda1` FOREIGN KEY (`venda_codigo`) REFERENCES `venda` (`codigo`),
  CONSTRAINT `fk_os_funcionario` FOREIGN KEY (`funcionario_codigo`) REFERENCES `funcionario` (`codigo`),
  CONSTRAINT `fk_os_status` FOREIGN KEY (`status_codigo`) REFERENCES `status_os` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico`
--

LOCK TABLES `ordem_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_servico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-16 15:48:30
