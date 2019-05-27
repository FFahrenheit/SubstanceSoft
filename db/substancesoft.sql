-- MySQL dump 10.16  Distrib 10.1.28-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: substancesoft
-- ------------------------------------------------------
-- Server version	10.1.28-MariaDB

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
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistencia` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) NOT NULL,
  `entrada` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `salida` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`clave`),
  KEY `usuario` (`usuario`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` VALUES (1,'Admin100','2019-05-21 05:03:40','2019-05-21 05:05:10'),(2,'Admin100','2019-05-21 05:03:56','2019-05-21 05:05:16'),(4,'Admin100','2019-05-21 05:12:38','2019-05-21 05:13:13'),(5,'Admin100','2019-05-21 05:14:22','2019-05-21 05:18:42'),(6,'Admin100','2019-05-21 05:20:41','2019-05-21 05:20:47'),(7,'Admin100','2019-05-21 05:21:22','2019-05-21 05:21:57'),(8,'Admin100','2019-05-21 05:22:16','2019-05-21 05:22:27'),(9,'Admin100','2019-05-21 05:44:16','2019-05-21 05:50:41'),(10,'Admin100','2019-05-21 05:50:49','2019-05-21 05:50:57'),(11,'Admin100','2019-05-21 05:51:05','2019-05-21 05:51:12'),(12,'Admin100','2019-05-21 05:55:34','2019-05-21 05:55:53'),(13,'Admin100','2019-05-21 05:56:03','2019-05-21 05:57:33'),(14,'Admin100','2019-05-21 05:58:02','2019-05-21 13:17:17'),(15,'chef1','2019-05-21 06:25:31','2019-05-21 13:17:31'),(16,'chef1','2019-05-21 13:18:51','2019-05-21 13:21:08'),(17,'Admin100','2019-05-21 13:20:56','2019-05-21 13:24:37'),(18,'chef1','2019-05-21 13:21:36','2019-05-21 17:32:41'),(19,'Admin100','2019-05-21 17:22:58','2019-05-21 17:26:03'),(20,'Admin100','2019-05-21 17:30:34','2019-05-21 17:47:26'),(21,'chef1','2019-05-21 17:32:55','2019-05-21 17:40:26'),(22,'chef1','2019-05-21 17:46:30','2019-05-21 17:47:13'),(23,'Admin100','2019-05-21 17:47:49','2019-05-21 17:48:39'),(24,'Admin100','2019-05-21 17:49:05','2019-05-21 18:06:22'),(25,'chef1','2019-05-21 18:06:05','2019-05-21 18:11:53'),(26,'Admin100','2019-05-21 18:07:04','2019-05-21 18:09:03'),(27,'Admin100','2019-05-21 18:09:19','2019-05-21 18:36:54'),(28,'chef1','2019-05-21 18:16:32','2019-05-21 18:19:39'),(29,'chef1','2019-05-21 18:19:54','2019-05-21 18:20:09'),(30,'chef1','2019-05-21 18:23:37','2019-05-21 18:39:47'),(31,'Admin100','2019-05-21 18:37:10','2019-05-21 18:46:53'),(32,'chef1','2019-05-26 02:17:01',NULL),(33,'chef2','2019-05-26 02:31:55',NULL);
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mensaje-entrada` AFTER INSERT ON `asistencia` FOR EACH ROW BEGIN


		INSERT INTO mensajes(destinatario, texto) VALUES 


		(


			(SELECT username FROM usuario WHERE tipo = 'admin'),


			(SELECT CONCAT('El usuario ', NEW.usuario, ' ha registrado su entrada'))


        );


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mensaje-salida` AFTER UPDATE ON `asistencia` FOR EACH ROW BEGIN


		INSERT INTO mensajes(destinatario, texto) VALUES 


		(


			(SELECT username FROM usuario WHERE tipo = 'admin'),


			(SELECT CONCAT('El usuario ', NEW.usuario, ' ha registrado su salida'))


        );


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ayuda`
--

DROP TABLE IF EXISTS `ayuda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ayuda` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `solicitante` int(11) NOT NULL,
  `solicitado` int(11) NOT NULL,
  `estado` enum('enviado','rechazado','aceptado','') NOT NULL DEFAULT 'enviado',
  PRIMARY KEY (`clave`),
  KEY `solicitante` (`solicitante`),
  KEY `solicitado` (`solicitado`),
  CONSTRAINT `ayuda_ibfk_1` FOREIGN KEY (`solicitante`) REFERENCES `cocina` (`clave`),
  CONSTRAINT `ayuda_ibfk_2` FOREIGN KEY (`solicitado`) REFERENCES `cocina` (`clave`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ayuda`
--

LOCK TABLES `ayuda` WRITE;
/*!40000 ALTER TABLE `ayuda` DISABLE KEYS */;
INSERT INTO `ayuda` VALUES (12,4,1,'aceptado'),(13,4,1,'rechazado'),(14,4,1,'enviado');
/*!40000 ALTER TABLE `ayuda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mensaje_ayuda` AFTER INSERT ON `ayuda` FOR EACH ROW BEGIN


INSERT INTO mensajes_ayuda (destinatario, mensaje, ayuda,tipo)


VALUES


(


    NEW.solicitante, (SELECT CONCAT('Se ha pedido ayuda a la cocina ',(SELECT nombre FROM cocina WHERE clave = NEW.solicitado))),


    NEW.clave, 'aviso'


);


INSERT INTO mensajes_ayuda (destinatario, mensaje, ayuda,tipo)


VALUES


(


    NEW.solicitado, (SELECT CONCAT('La cocina ',


    (SELECT nombre FROM cocina WHERE clave = NEW.solicitante), ' le solicita ayuda')),


    NEW.clave, 'solicitud'


);


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar-mensajes` AFTER UPDATE ON `ayuda` FOR EACH ROW BEGIN 


IF(NEW.estado = 'aceptado')


	THEN


    	INSERT INTO mensajes_ayuda (destinatario, mensaje, tipo)


        VALUES


        (


            NEW.solicitante, (SELECT CONCAT('La cocina ', (SELECT nombre FROM cocina WHERE clave = NEW.solicitado), ' ha enviado ayuda')), 'aviso'


        );


        UPDATE mensajes_ayuda SET mensaje = (SELECT concat(mensaje, ' (aceptada)')), tipo = 'aviso' WHERE ayuda = NEW.clave AND tipo != 'aviso';


	END IF;


IF(NEW.estado = 'rechazado')


	THEN


        	INSERT INTO mensajes_ayuda (destinatario, mensaje, tipo)


        VALUES


        (


            NEW.solicitante, (SELECT CONCAT('La cocina ', (SELECT nombre FROM cocina WHERE clave = NEW.solicitado), ' ha rechazado la peticion de ayuda')),'aviso'


        );


        UPDATE mensajes_ayuda SET mensaje = concat(mensaje, ' (rechazada)'), tipo = 'aviso' WHERE ayuda = NEW.clave AND tipo = 'solicitud';


   END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `chefs`
--

DROP TABLE IF EXISTS `chefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chefs` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) NOT NULL,
  `cocina` int(11) NOT NULL,
  PRIMARY KEY (`clave`),
  KEY `usuario` (`usuario`,`cocina`),
  KEY `cocina` (`cocina`),
  CONSTRAINT `chefs_ibfk_1` FOREIGN KEY (`cocina`) REFERENCES `cocina` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chefs_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chefs`
--

LOCK TABLES `chefs` WRITE;
/*!40000 ALTER TABLE `chefs` DISABLE KEYS */;
INSERT INTO `chefs` VALUES (4,'chef1',1),(5,'chef2',4);
/*!40000 ALTER TABLE `chefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cocina`
--

DROP TABLE IF EXISTS `cocina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cocina` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`clave`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cocina`
--

LOCK TABLES `cocina` WRITE;
/*!40000 ALTER TABLE `cocina` DISABLE KEYS */;
INSERT INTO `cocina` VALUES (4,'Bebidas'),(1,'Mexicana');
/*!40000 ALTER TABLE `cocina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos` (
  `ip` varchar(20) NOT NULL,
  `alias` varchar(30) NOT NULL DEFAULT 'Equipo conectado',
  `conexion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES ('192.168.0.100','COcinita','2019-05-27 00:44:25'),('192.168.15.174','Mi equipo cool','2019-05-26 02:04:49'),('192.168.84.123','Equipo conectado','2019-05-21 17:48:08'),('192.168.84.147','123','2019-05-23 12:27:52');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechas`
--

DROP TABLE IF EXISTS `fechas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fechas` (
  `clave` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  `valor` datetime NOT NULL,
  PRIMARY KEY (`clave`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechas`
--

LOCK TABLES `fechas` WRITE;
/*!40000 ALTER TABLE `fechas` DISABLE KEYS */;
INSERT INTO `fechas` VALUES (1,'fecha_in','2019-02-01 23:59:59'),(2,'fecha_fin','2019-06-05 23:59:59'),(3,'Encendido','2019-05-23 23:55:00'),(4,'Apagado','2019-05-23 02:00:59');
/*!40000 ALTER TABLE `fechas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcion`
--

DROP TABLE IF EXISTS `funcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcion` (
  `clave` tinyint(4) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`clave`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcion`
--

LOCK TABLES `funcion` WRITE;
/*!40000 ALTER TABLE `funcion` DISABLE KEYS */;
INSERT INTO `funcion` VALUES (1,'Mesero '),(2,'Chef'),(3,'Cajero '),(4,'Cajero drive-through'),(5,'Individual: Liberar mesa'),(6,'Individual:Consulta inventario'),(7,'Individual: Consulta cuenta'),(8,'Individual: Pedir ticket');
/*!40000 ALTER TABLE `funcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_ingredientes`
--

DROP TABLE IF EXISTS `historial_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historial_ingredientes` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `ingrediente` int(11) NOT NULL,
  `cantidad` decimal(10,4) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo` enum('uso','surtido') NOT NULL,
  PRIMARY KEY (`clave`),
  KEY `ingrediente` (`ingrediente`),
  CONSTRAINT `historial_ingredientes_ibfk_1` FOREIGN KEY (`ingrediente`) REFERENCES `ingrediente` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_ingredientes`
--

LOCK TABLES `historial_ingredientes` WRITE;
/*!40000 ALTER TABLE `historial_ingredientes` DISABLE KEYS */;
INSERT INTO `historial_ingredientes` VALUES (1,1,-10.0000,'2019-04-23 05:18:15','uso'),(2,2,-0.0100,'2019-04-23 05:18:15','uso'),(3,1,-10.0000,'2019-04-23 05:24:48','uso'),(4,2,-0.0100,'2019-04-23 05:24:48','uso'),(5,4,1.0000,'2019-04-23 05:41:07','surtido'),(6,1,11.0000,'2019-04-23 06:04:22','surtido'),(7,1,-10.0000,'2019-04-28 02:30:08','uso'),(8,2,-0.0100,'2019-04-28 02:30:08','uso'),(9,1,-0.5000,'2019-04-28 03:27:11','uso'),(11,1,-0.5000,'2019-04-28 03:32:06','uso'),(13,4,100.0000,'2019-05-05 15:39:11','surtido'),(15,2,1.0000,'2019-05-06 17:27:00','surtido'),(16,4,5.0000,'2019-05-12 20:45:19','surtido'),(18,1,4.0000,'2019-05-26 19:55:57','surtido'),(19,6,5.0000,'2019-05-26 19:57:02','surtido'),(21,6,-2.0000,'2019-05-26 20:01:24','uso'),(22,6,5.0000,'2019-05-26 20:01:48','surtido'),(23,2,3.0000,'2019-05-26 20:02:29','surtido'),(24,6,10.0000,'2019-05-26 20:12:03','surtido'),(25,1,23.0000,'2019-05-26 20:14:12','surtido'),(26,2,10.0000,'2019-05-26 20:15:29','surtido'),(27,4,10.0000,'2019-05-26 20:16:03','surtido'),(28,6,10.0000,'2019-05-26 20:16:57','surtido'),(29,4,4.0000,'2019-05-26 20:21:53','surtido'),(30,4,15.0000,'2019-05-26 20:24:02','surtido'),(32,4,6.0000,'2019-05-26 20:35:01','surtido'),(33,7,8.0000,'2019-05-26 21:12:03','surtido'),(34,6,10.0000,'2019-05-26 21:13:07','surtido'),(35,1,7.0000,'2019-05-26 21:14:52','surtido'),(36,6,10.0000,'2019-05-26 21:19:04','surtido'),(37,6,10.0000,'2019-05-26 21:21:31','surtido'),(38,6,10.0000,'2019-05-26 21:23:24','surtido'),(39,1,10.0000,'2019-05-26 21:24:26','surtido'),(40,7,5.0000,'2019-05-26 21:25:23','surtido'),(41,1,1.0000,'2019-05-26 21:26:58','surtido'),(42,1,1.0000,'2019-05-26 21:29:38','surtido'),(43,6,1.0000,'2019-05-26 21:31:54','surtido'),(44,7,1.0000,'2019-05-26 21:32:34','surtido'),(45,6,1.0000,'2019-05-26 21:34:11','surtido'),(47,2,2.0000,'2019-05-26 21:40:43','surtido'),(48,2,1.0000,'2019-05-26 21:42:59','surtido'),(49,2,1.0000,'2019-05-26 21:45:34','surtido'),(50,2,1.0000,'2019-05-26 21:47:19','surtido'),(51,2,1.0000,'2019-05-26 21:49:37','surtido'),(52,2,20.0000,'2019-05-26 21:51:21','surtido'),(53,6,1.0000,'2019-05-26 21:52:16','surtido'),(54,4,1.0000,'2019-05-26 21:55:08','surtido');
/*!40000 ALTER TABLE `historial_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarios` (
  `nombre` varchar(30) NOT NULL,
  `venta` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES ('00:00 a 01:00',NULL),('01:00 a 02:00',NULL),('02:00 a 03:00',NULL),('03:00 a 04:00',NULL),('04:00 a 05:00',NULL),('05:00 a 06:00',NULL),('06:00 a 07:00',NULL),('07:00 a 08:00',NULL),('08:00 a 09:00',NULL),('09:00 a 10:00',NULL),('10:00 a 11:00',NULL),('11:00 a 12:00',NULL),('12:00 a 13:00',NULL),('13:00 a 14:00',NULL),('14:00 a 15:00',NULL),('15:00 a 16:00',NULL),('16:00 a 17:00',NULL),('17:00 a 18:00',NULL),('18:00 a 19:00',NULL),('19:00 a 20:00',NULL),('20:00 a 21:00',NULL),('21:00 a 22:00',2364.2),('22:00 a 23:00',NULL),('23:00 a 24:00',NULL);
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `horarios_venta`
--

DROP TABLE IF EXISTS `horarios_venta`;
/*!50001 DROP VIEW IF EXISTS `horarios_venta`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `horarios_venta` (
  `SUM(total)` tinyint NOT NULL,
  `hour(fecha)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingrediente` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `cantidad` decimal(10,4) DEFAULT '0.0000',
  `especificacion` enum('kg','mg','lt','ml','pza') NOT NULL,
  `existencia_critica` float(10,4) DEFAULT '0.0000',
  PRIMARY KEY (`clave`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES (1,'pollo',180.0000,'kg',4.0000),(2,'queso',40.0900,'lt',1.0000),(3,'maiz',115.0000,'kg',1.0000),(4,'Agua',162.0000,'lt',10.0000),(6,'Otro mas',83.0000,'kg',1.0000),(7,'Anda',26.0000,'kg',1.0000);
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `historial_de_ingrediente` BEFORE UPDATE ON `ingrediente` FOR EACH ROW BEGIN


	IF (NEW.cantidad < OLD.cantidad)


    THEN 


    	INSERT INTO historial_ingredientes(ingrediente,cantidad,tipo) 


        VALUES (


            NEW.clave,


            (NEW.cantidad  - OLD.cantidad),


            'uso'


        );


    END IF;


    IF (NEW.cantidad > OLD.cantidad)


    THEN 


        	INSERT INTO historial_ingredientes(ingrediente,cantidad,tipo) 


        VALUES (


            NEW.clave,


            (NEW.cantidad  - OLD.cantidad),


            'surtido'


        );


    END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destinatario` varchar(30) NOT NULL,
  `texto` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `destinatario` (`destinatario`),
  CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`destinatario`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
INSERT INTO `mensajes` VALUES (24,'Admin100','El platillo Caviar de la mesa 2 est√° listo','2019-04-17 23:33:45',1),(25,'Admin100','El platillo Caviar de la mesa 2 est√° listo','2019-04-17 23:34:06',1),(26,'Admin100','La cuenta en la mesa 2 ha sido pagada','2019-04-18 00:00:46',1),(27,'Admin100','La cuenta en la mesa 2 ha sido cerrada','2019-04-18 00:00:51',1),(41,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:38:07',1),(42,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:38:13',1),(43,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:38:27',1),(44,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:38:58',1),(45,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:38:59',1),(46,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:00',1),(47,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:00',1),(48,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:01',1),(49,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:01',1),(50,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:03',1),(51,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:05',1),(52,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:10',1),(53,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:12',1),(54,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:13',1),(55,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:16',1),(56,'Admin100','La cuenta en la mesa 1 ha sido pagada','2019-04-21 04:01:56',1),(57,'Admin100','La cuenta en la mesa 0 ha sido pagada','2019-04-21 04:03:40',1),(58,'Admin100','El platillo Caviar de la mesa 0 esta listo','2019-04-22 02:48:12',1),(59,'Admin100','El platillo Sopa du macaco de la mesa 0 esta listo','2019-04-23 05:18:15',1),(60,'Admin100','El platillo Sopa du macaco de la mesa 0 esta listo','2019-04-23 05:20:00',1),(61,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:24:48',1),(62,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:24:51',1),(63,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:24:52',1),(64,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:24:53',1),(65,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:24:53',1),(66,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:24:54',1),(67,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:25:04',1),(68,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:25:05',1),(69,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:51:24',1),(70,'Admin100','Hey muy buenas a todos, guap√≠simos','2019-04-28 02:02:07',1),(71,'Admin100','haha','2019-04-28 02:03:36',1),(72,'Admin100','El platillo Sopa du macaco de la mesa 0 esta listo','2019-04-28 02:30:08',1),(73,'Admin100','La cuenta en la mesa 2 ha sido cerrada','2019-04-28 03:02:31',1),(74,'Admin100','holaaa','2019-05-03 01:25:11',1),(75,'Admin100','La cuenta en la mesa 2 ha sido cerrada','2019-05-05 21:29:30',1),(76,'Admin100','La cuenta en la mesa 2 ha sido cerrada','2019-05-05 21:39:38',1),(77,'Admin100','La cuenta en la mesa 0 ha sido cerrada','2019-05-05 21:45:41',1),(78,'Admin100','La cuenta en la mesa 0 ha sido cerrada','2019-05-05 21:46:17',1),(79,'Admin100','La cuenta en la mesa 1 ha sido pagada','2019-05-14 04:19:15',1),(80,'Admin100','El platillo pizza de la mesa 0 esta listo','2019-05-20 01:49:47',1),(81,'Admin100','El usuario Admin100 se\r\n             ha registrado una su salida','2019-05-21 05:50:41',1),(82,'Admin100','El usuario Admin100 se\r\n             ha registrado una su salida','2019-05-21 05:50:57',1),(83,'Admin100','El usuario Admin100 se\r\n             ha registrado una su salida','2019-05-21 05:51:12',1),(84,'Admin100','El usuario Admin100 se\r\n             ha registrado una su salida','2019-05-21 05:55:53',1),(85,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 05:57:33',1),(86,'Admin100','El usuario Admin100 ha registrado\r\n                           su entrada','2019-05-21 05:58:02',1),(87,'Admin100','El usuario chef1 ha registrado\r\n                           su entrada','2019-05-21 06:25:31',1),(88,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 13:17:17',1),(89,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 13:17:31',1),(90,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 13:18:51',1),(91,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 13:20:56',1),(92,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 13:21:08',1),(93,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 13:21:36',1),(94,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 13:24:37',1),(95,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 17:22:58',1),(96,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 17:26:03',1),(97,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 17:30:34',1),(98,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 17:32:41',1),(99,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 17:32:55',1),(100,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 17:40:26',1),(101,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 17:46:30',1),(102,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 17:47:13',1),(103,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 17:47:26',1),(104,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 17:47:49',1),(105,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 17:48:39',1),(106,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 17:49:05',1),(107,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 18:06:05',1),(108,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 18:06:22',1),(109,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 18:07:04',1),(110,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 18:09:03',1),(111,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 18:09:19',1),(112,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 18:11:53',1),(113,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 18:16:32',1),(114,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 18:19:39',1),(115,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 18:19:54',1),(116,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 18:20:09',1),(117,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 18:23:37',1),(118,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 18:36:54',1),(119,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 18:37:10',1),(120,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 18:39:47',1),(121,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 18:46:53',1),(122,'Admin100','El platillo Hamburguesa Ranch de la mesa 0 esta listo','2019-05-24 04:28:03',1),(123,'admin','La cuenta en la mesa 0 ha sido cerrada','2019-05-24 06:08:00',0),(124,'Admin100','La cuenta en la mesa 0 ha sido cerrada','2019-05-24 06:08:06',1),(125,'Admin100','La cuenta en la mesa 2 ha sido cerrada','2019-05-24 06:08:11',1),(126,'Admin100','La cuenta en la mesa 0 ha sido cerrada','2019-05-24 06:08:16',1),(127,'Admin100','La cuenta en la mesa 0 ha sido cerrada','2019-05-24 06:08:22',1),(128,'Admin100','La cuenta en la mesa 0 ha sido cerrada','2019-05-24 06:08:28',1),(129,'Admin100','La cuenta en la mesa 0 ha sido pagada','2019-05-24 06:10:51',1),(130,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-26 02:17:01',0),(131,'Admin100','El usuario chef2 ha registrado su entrada','2019-05-26 02:31:55',0),(132,'Admin100','El usuario yo ha registrado su entrada','2019-05-26 02:52:14',0);
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes_ayuda`
--

DROP TABLE IF EXISTS `mensajes_ayuda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensajes_ayuda` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `destinatario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mensaje` varchar(100) NOT NULL DEFAULT 'Mensaje vac√≠o',
  `ayuda` int(11) DEFAULT NULL,
  `tipo` enum('solicitud','aviso') NOT NULL DEFAULT 'solicitud',
  PRIMARY KEY (`clave`),
  KEY `destinatario` (`destinatario`),
  KEY `ayuda` (`ayuda`),
  CONSTRAINT `mensajes_ayuda_ibfk_1` FOREIGN KEY (`ayuda`) REFERENCES `ayuda` (`clave`),
  CONSTRAINT `mensajes_ayuda_ibfk_2` FOREIGN KEY (`destinatario`) REFERENCES `cocina` (`clave`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes_ayuda`
--

LOCK TABLES `mensajes_ayuda` WRITE;
/*!40000 ALTER TABLE `mensajes_ayuda` DISABLE KEYS */;
INSERT INTO `mensajes_ayuda` VALUES (1,4,'2019-05-26 04:34:20','Se ha pedido ayuda a la cocina Mexicana',12,'aviso'),(2,1,'2019-05-26 04:34:20','La cocina Bebidas le solicita ayuda (aceptada)',12,'aviso'),(3,4,'2019-05-26 05:15:18','La cocina Mexicana ha enviado ayuda',NULL,'aviso'),(4,4,'2019-05-26 05:15:34','Se ha pedido ayuda a la cocina Mexicana',13,'aviso'),(5,1,'2019-05-26 05:15:34','La cocina Bebidas le solicita ayuda (rechazada)',13,'aviso'),(6,4,'2019-05-26 05:15:39','La cocina Mexicana ha rechazado la peticion de ayuda',NULL,'aviso'),(7,4,'2019-05-26 05:25:53','Se ha pedido ayuda a la cocina Mexicana',14,'aviso'),(8,1,'2019-05-26 05:25:53','La cocina Bebidas le solicita ayuda',14,'solicitud');
/*!40000 ALTER TABLE `mensajes_ayuda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesa` (
  `numero` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
INSERT INTO `mesa` VALUES (-1,-1),(0,0),(1,10),(2,10),(12,5),(23,12),(50,0),(122,0);
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden` (
  `clave` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(30) NOT NULL,
  `mesa` int(11) NOT NULL,
  `estado` enum('abierta','cerrada','pagada') NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `total` decimal(10,4) DEFAULT '0.0000',
  `impresiones` tinyint(4) NOT NULL DEFAULT '0',
  `clientes` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`clave`),
  KEY `usuario` (`usuario`,`mesa`),
  KEY `mesa` (`mesa`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`mesa`) REFERENCES `mesa` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,'2019-03-05 04:52:39','Admin100',1,'pagada','',0.0000,0,1),(18,'2019-03-10 10:09:58','Admin100',2,'pagada','Mesa cool',8132.2002,0,1),(19,'2019-03-12 05:23:44','Admin100',1,'pagada','Mesa m√É¬°s cool a√É¬∫n',240.0000,0,1),(20,'2019-03-17 20:09:59','admin',1,'pagada','Prueba comandas',2048.2000,0,1),(21,'2019-03-18 02:18:40','Admin100',0,'pagada','Orden chico 1',360.0000,0,1),(22,'2019-03-19 18:18:19','Admin100',2,'pagada','Orden nueva',5484.0000,0,1),(23,'2019-03-19 18:33:19','Admin100',2,'pagada','Orden mesa 2',1928.0000,0,1),(24,'2019-03-19 20:22:23','Admin100',2,'cerrada','Orden nueva',240.0000,1,1),(25,'2019-03-19 20:32:44','Admin100',0,'pagada','Lentes',240.0000,0,1),(26,'2019-03-19 20:33:17','Admin100',0,'pagada','Anillo',120.0000,0,1),(27,'2019-04-02 03:00:01','Admin100',0,'pagada','Katia',360.0000,0,1),(28,'2019-04-02 19:13:09','Admin100',0,'pagada','Orden nueva',100.0000,0,1),(29,'2019-04-16 18:26:26','Admin100',0,'pagada','Hola',323.2000,1,1),(30,'2019-04-16 18:27:09','Admin100',1,'abierta','',0.0000,0,1),(31,'2019-04-28 03:02:01','Admin100',2,'cerrada','Hola',14.0000,2,1),(32,'2019-04-28 03:17:49','Admin100',2,'cerrada','Q',0.0000,1,1),(33,'2019-05-05 21:29:51','Admin100',2,'cerrada','Prueba drive',14.0000,0,1),(34,'2019-05-05 21:42:54','Admin100',0,'cerrada','Juan',0.0000,0,1),(35,'2019-05-05 21:43:41','Admin100',0,'cerrada','juanito',0.0000,0,1),(36,'2019-05-05 21:44:18','Admin100',0,'cerrada','El queso',0.0000,0,1),(37,'2019-05-05 21:45:03','Admin100',0,'abierta','queso',0.0000,0,1),(38,'2019-05-05 21:45:17','Admin100',0,'abierta','queso',0.0000,0,1),(39,'2019-05-05 21:45:24','Admin100',0,'cerrada','yp',1200.2000,2,1),(40,'2019-05-05 21:56:19','Admin100',-1,'abierta','jej',0.0000,0,1),(41,'2019-05-05 21:56:53','Admin100',-1,'abierta','jj',0.0000,1,1),(42,'2019-05-20 01:35:37','admin',0,'cerrada','jjajaj',0.0000,0,1);
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notificacion_orden` BEFORE UPDATE ON `orden` FOR EACH ROW BEGIN


	IF (OLD.estado = 'abierta' AND NEW.estado = 'cerrada')


	THEN


		INSERT INTO mensajes(destinatario, texto) VALUES 


		(


			OLD.usuario,


				(SELECT CONCAT('La cuenta en la mesa ',


                  (OLD.mesa), ' ha sido cerrada'))


        );


    END IF;


            


    IF (NEW.estado = 'pagada')


     THEN


    	INSERT INTO mensajes(destinatario, texto) VALUES 


		(


			OLD.usuario,


				(SELECT CONCAT('La cuenta en la mesa ',


                  (OLD.mesa), ' ha sido pagada'))


        );


     END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `clave` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` enum('pedido','listo','entregado','') NOT NULL,
  `hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `platillo` int(11) NOT NULL,
  `orden` bigint(11) NOT NULL,
  PRIMARY KEY (`clave`),
  KEY `platillo` (`platillo`,`orden`),
  KEY `orden` (`orden`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`platillo`) REFERENCES `platillo` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`orden`) REFERENCES `orden` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (2,'entregado','2019-03-10 12:27:07',1,18),(3,'entregado','2019-03-10 12:29:57',4,18),(4,'entregado','2019-03-10 12:30:04',3,18),(5,'entregado','2019-03-10 12:30:04',3,18),(6,'entregado','2019-03-10 12:30:04',3,18),(20,'entregado','2019-03-12 01:53:07',4,18),(21,'entregado','2019-03-12 02:00:05',4,18),(23,'entregado','2019-03-12 02:02:48',4,18),(24,'entregado','2019-03-12 02:05:09',4,18),(25,'entregado','2019-03-12 02:05:12',4,18),(26,'entregado','2019-03-12 02:06:11',3,18),(27,'entregado','2019-03-12 05:23:53',4,19),(28,'entregado','2019-03-12 05:23:53',4,19),(29,'entregado','2019-03-17 20:10:31',3,20),(30,'entregado','2019-03-17 20:11:09',4,20),(31,'entregado','2019-03-17 20:22:52',1,20),(33,'entregado','2019-03-18 02:28:36',4,21),(34,'entregado','2019-03-18 02:28:36',4,21),(35,'entregado','2019-03-18 02:28:36',4,21),(36,'entregado','2019-03-19 18:18:26',3,22),(37,'entregado','2019-03-19 18:18:26',3,22),(38,'entregado','2019-03-19 18:18:27',3,22),(39,'listo','2019-03-19 18:33:39',3,23),(40,'listo','2019-03-19 18:39:33',6,23),(41,'entregado','2019-04-17 23:10:38',4,24),(42,'entregado','2019-03-19 20:33:42',4,25),(44,'entregado','2019-03-19 20:33:42',4,25),(46,'entregado','2019-04-02 03:00:16',4,27),(47,'entregado','2019-04-02 03:00:16',4,27),(48,'entregado','2019-04-02 03:00:16',4,27),(51,'entregado','2019-04-07 22:50:40',6,28),(52,'pedido','2019-04-16 18:00:56',4,24),(55,'entregado','2019-04-21 02:56:35',3,29),(56,'listo','2019-04-21 04:03:08',4,26),(57,'entregado','2019-04-21 04:32:32',6,29),(58,'listo','2019-04-22 02:47:47',3,26),(60,'pedido','2019-05-05 21:39:38',9,31),(61,'entregado','2019-05-05 21:41:44',9,33),(64,'entregado','2019-05-05 21:45:31',1,39),(66,'entregado','2019-05-05 21:51:07',1,29),(67,'pedido','2019-05-26 02:37:30',1,42),(68,'pedido','2019-05-26 02:43:26',4,31),(69,'pedido','2019-05-26 02:43:55',1,23);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sumar-pedido` AFTER INSERT ON `pedidos` FOR EACH ROW BEGIN


update orden set total = 


(select sum(platillo.precio) from platillo, (select * from orden) as ord, 


pedidos where platillo.clave= pedidos.platillo and ord.clave = NEW.clave and 


ord.clave=pedidos.orden) 


where clave = NEW.clave;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notifiacion_platillo` BEFORE UPDATE ON `pedidos` FOR EACH ROW BEGIN


	IF NEW.estado = 'listo'


	THEN


		INSERT INTO mensajes(destinatario, texto) VALUES 


		(


			(SELECT usuario FROM orden WHERE clave = OLD.orden),


				(SELECT CONCAT('El platillo ', 


				(SELECT nombre FROM platillo  WHERE clave = OLD.platillo),


				' de la mesa ',


				(SELECT mesa FROM orden WHERE clave = OLD.orden),


				' esta listo' ))


        );


       END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `restar-ingrediente` AFTER UPDATE ON `pedidos` FOR EACH ROW BEGIN


	IF (OLD.estado = 'pedido' AND 


        (NEW.estado = 'listo' OR NEW.estado = 'entregado'))


		THEN


        	UPDATE ingrediente 


			SET cantidad = cantidad - 


        	(


           		(SELECT recetas.cantidad FROM 


         		recetas, 


                (SELECT * from ingrediente) as ing 


         		WHERE platillo = NEW.platillo


         		AND ing.clave = recetas.ingrediente 


         		AND ingrediente.clave = ing.clave)


    		)*(1 + 


                  ((SELECT valor from preferencias 


                    WHERE nombre ='razon_desperdicio')/100))


			WHERE ingrediente.clave IN 


			(SELECT ingrediente from recetas WHERE platillo = NEW.platillo);


    	END IF;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `permiso` tinyint(4) NOT NULL,
  PRIMARY KEY (`clave`),
  KEY `username` (`username`,`permiso`),
  KEY `permiso` (`permiso`),
  CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`username`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`permiso`) REFERENCES `funcion` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (9,'chef1',2),(12,'chef1',5),(14,'chef1',6),(11,'chef1',7),(13,'chef1',8),(10,'chef2',2);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platillo`
--

DROP TABLE IF EXISTS `platillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platillo` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(35) NOT NULL,
  `precio` float NOT NULL DEFAULT '0',
  `dificultad` enum('1','2','3','4','5') DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `imagen` longblob,
  `cocina` int(11) NOT NULL,
  `categoria` enum('Bebidas','Sopas','Rapida','Postres','Guisados','Otros') DEFAULT NULL,
  PRIMARY KEY (`clave`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `cocina` (`cocina`),
  CONSTRAINT `platillo_ibfk_1` FOREIGN KEY (`cocina`) REFERENCES `cocina` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platillo`
--

LOCK TABLES `platillo` WRITE;
/*!40000 ALTER TABLE `platillo` DISABLE KEYS */;
INSERT INTO `platillo` VALUES (1,'Hamburguesa Ranch',100.2,'1','Uma delisia','ˇÿˇ‡\0JFIF\0\0\0\0\0\0ˇÌ\0,Photoshop 3.0\08BIMÌ\0\0\0\0\0\0H3\0\0\0GLÃ\0\0ˇ€\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ˇ€\0C			\r\r2!!22222222222222222222222222222222222222222222222222ˇ¿\0]l\"\0ˇƒ\0\0\0\0\0\0\0\0\0\0\0	\nˇƒ\0µ\0\0\0}\0!1AQa\"q2Åë°#B±¡R—$3brÇ	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÉÑÖÜáàâäíìîïñóòôö¢£§•¶ß®©™≤≥¥µ∂∑∏π∫¬√ƒ≈∆«»… “”‘’÷◊ÿŸ⁄·‚„‰ÂÊÁËÈÍÒÚÛÙıˆ˜¯˘˙ˇƒ\0\0\0\0\0\0\0\0	\nˇƒ\0µ\0\0w\0!1AQaq\"2ÅBë°±¡	#3Rbr—\n$4·%Ò\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÇÉÑÖÜáàâäíìîïñóòôö¢£§•¶ß®©™≤≥¥µ∂∑∏π∫¬√ƒ≈∆«»… “”‘’÷◊ÿŸ⁄‚„‰ÂÊÁËÈÍÚÛÙıˆ˜¯˘˙ˇ⁄\0\0\0?\0˜˙JZ3@	E.i(\0¢ó4fÄ\nJZ3@	E.hÕ\0%π£4\0îRÊå–QKö3@	E.hÕ\0%π£4\0îRÊå–QKö3@	E.hÕ\0î¥fÄä\\—ö\0J)sFh(•Õ†¢ó4fÄä\\—ö\0J)sFh(•Õ†¢ó4fÄä\\—ö\0))h†¢ó4fÄä\\—ö\0J)sFh(•Õ†¢ó4fÄä\\—ö\0J)sFh(•Õ†¢ó4fÄ\n(¢Ää\\—ö\0J)sFh(•Õ†¢ó4fÄä(†§•¶ìé¥\0Ω)•¿¨ÕZ‚U±∏[i6\\ÿFﬁçÉä˘ßUÒ6øŒìÍWÖ≤Fá9™ån’dH¸Èæ|ﬁù|r<Y´≈Â—êûÎW≈⁄≤˝æ‡∞Ï≠úU˚1\\˙Ë›D:∫è©§˚\\?Û—?Ô°_!?çı¡ZÍrOvzêxõTnó/«Ω?dªÖœÆ>◊¸ıO˚ËQˆ»¸µO˚ËW»Î‚FE9ôœ„I˝ø|FDí\0=—ÏBÁ◊Çd#Éü•/òµÚ<zˆ¶Ô%\0ˇ\0∂Eh[¯œ_∑`â®\\Ä?È°≈…Öœ™wZ]¬æi∑¯ï‚(:ﬁÃG˚G?Œ∂-æ0ÍÒL»ˇ\0Ô(•Ïò\\˜˙+∆≠˛2‹`,°ëO˜X©≠ª?ã˙\\ÑãY¢ˇ\0uÉ\nóNHw=*óÀXx˜@‘ÿÔ—“_ñ∑ÌÔ≠Óót$´Íå˝*ZhX£–¿é¥π§‚åQE\0£Q@(≈PEPä1E\0båQE\0£Q@(≈Pä1E\0båQE\0£Q@(≈Pä1E\0QE\0båQE\0£Q@(≈Pä1E\0båQE\0£Q@(≈Pä1E\0båQE\0QE\0£Q@(≈Pä1E\0båQE\0%¥î\0≈P‘.vÚl8}ßiÙ8´«°¨MUàF≈\0xùüåı}1Ó#ûY.·NŸ[8Á¶{W?™‹ZxãP{ã@P∞ﬂ$l9VÓ=Î{ƒ6üb◊gEåysÂîë«<ë\\§—Æó©EqmíØé¬∑VÆåi,ﬁrT6Céïb›ml`óñﬁ|A §äÜ„$í;t≠õÄ©2G?(‹´é’&µ¢çKHàÿå6œﬁu\0ê=»\0„ø4‰J+h◊∫gàı•‹È«¿Ìhû‡˚UK˝È˜okª.ü)4xSJΩ”oYπç‡ÇµwIÏ=F?ùoÀó˜M<£ôs∆Öæõ¶¶\0∞€H<qìJöv‘‹I=+ÆKiW∑Ø·V¢“·â]p}Ä\0~j“‰4qrÈ≤	\\Áæ1L6oÊªÈ¨K!dÄs⁄≥ß≥ñRÿÚ:\n´à„º¶@I#ÿf£+¿âúp‘œ¢\\8-Y¡\'8«Fm&Då‚&\0.vëLFí¨õPí§ÙÕ[\"X”Á!y«<”¨Óc[∏ë∞€o#Ωt∫üÜñÕÂ¢˘ôlûﬁ√÷ÑÜsºÀÛ0˙ÊØ€kWñ,ôca˝÷\"£Ç‹˘¢å´\'›„M8⁄ûUπ êF;˙TÚÖŒ√K¯≠´Ÿ.ó	ˇ\0M?ùw\Z_≈çÏ*›nÅœS‘\n©¨é3”∏≈fÃ\'á\'q#5ú†äπı≈áàtÕEAµΩÜ\\Ùπ¸´HHßıÒ‘:µ≈∏9]\nÙ!±]óÒK_“ÿ*ﬁ…\"è·êÓ≠fÈvœ©ÅfºCK¯ÂΩBﬁY«øπS∂ü}Ò£PG˝Œùn∞üª.‚ÁJüg πÌõá≠!qÎ^oÒ#_÷I∑hß!W‹M2ÁRøø!.µÁ!∫ÖëﬂÙQÏ⁄‹“rÿ˜)/m¢ˇ\0Y<I˛ÛÅT¶Ò&ç˙›RÕ>≥/¯◊áæòéÀ∑Ì◊{∫pZö/]Ã@]2◊πñoË\r®Ød˙û∫˛8‚ø€§ˇ\0≤€øïWì‚Üc8mQ“7?“ºπº?2|≤*0w.,öE—Ì—∂-’üöx⁄∂ƒ˛¶ã!˚%‹Ùñ¯ù·Å˜o]ˇ\0›Öø¬≠i^<—5õ±mc5ƒíû¬Ÿ>§∆ºÓ\"Ú◊Jç˛ƒüÈ]nù:Zƒê¿™™\0(˜4ùàj+cºYCt4k¬fp3ZÍrµ$¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0§•§†\0Ù¨≠JÒü•kU{ò˜°†&ÒnüÊ€ôÇÂ¢…˙éıÊ˜êàÚOÉœ~’Ó:≈ßﬁ»=k uç8Ÿ› ÅñHe˙zVê}ùétØˆÜüÂë˚¯Œ3ÈRÈñór≈,ROÂ«ëÄx éáÿ˙\Z≥∏Ç{ôÔ¿£µh[[Ô•;	 z÷¢cV¬^%ºΩkÖàb5.[?\\—5⁄<_ª∆©Ê“89ïäÜ\0‘[,AäêGaB–Dˆ“ªFÜ„∏≠òµ X§0~Wú˙W;«ñ0rCö—ÜÊ ·V9ï˙dá÷Ä±£™“A>eÁì‘z÷µú÷”Ä|›≥¿Æ[Tè7*bÀI∑cÎRXÀ<å≤Eª#™˛5HGeõÓ|Áwe¶Õ§ƒ~@ü/ÁM”åÇ6‹«yË*ÚÃ·¬˝‚:’&&è3ÒóÖø≥§ãPH«í≥+2ép¿◊†5•µˆõ\Z[`£F–\Zoà!K˚)b+òÿl’O_Iôˆ7\'t$†\'∫éîıœj\Z±k(¶-…åÇ;b´IßgiMª ˚◊y%¢\\L&‹¿Ò–‡\Zä„HÛSdg>b	Îı´MpW:v\0fi‡Ä:˚VT˙{ lRy‹Yù ˙gøøµg‹¡≤RjŒ>ÒŒ>πÙ¢».yıŒíYõhqûzä√π≥xúÇß–zÙâ4…é‘ío¸˙’[çYS-\ZoÈ¿5.œ9@˘Í¨;ˆ#Ò´PÕ4DÌëÇ˙gΩt˜eRÈÖ>ô¨;ùÊ,Ì¡Íx¨˘\Z)2;{ßG,…œ˜óäÈto>ò1‰ƒÁ¯Yá\"π`ç˛Û#”ﬁ§$\\„≥\nV.3qzßg‚iÆ‚V3í“tKtüJ“ìÌN§…Ú˜)oÊ@Ø!¥øª“Æƒ.„˝•Îˇ\0÷>ı÷Ë~3¥i_˚J«Ì≥uGñbªΩâÍ\Z:UX…ju∞L—æˆΩ∂∑¯!ès +V›Ç≠∏∞Â»Âæµü£¯Ç]o{i^“⁄UY~b„\'ıÆèO¥ó!.bÚ¶:t˙VRfu\ZkB8,‰êÙ&∂¨¥∆»»≠k9vé+^+eL`TôÏÌ|∞8´‡`Pù@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@%-%\0-5ÜF)‘Pßj‚ºÛƒöa∏Ñï<gp˜ˆØVπãzû;W#´YÚN)ß`<¶#i\"#´8Œï}¢Y7ap√∑®©u+g{6ó˝ì‹R∆K√º}3Ì[ß†◊ºrî\\Ì=Å™Ø´Â\\‡+]∂ }ië∆Éñ¿˙v¶$e4nÓ2\0\n:‚ùiyÅ√+–Ù˙VÉ¡Â‰Á98 ”†ræ£©¢„&Úxùëﬂlc%G$‚¥Ïí £€Ó8d=>µÖkkó,Œ¬ùßÚ5≠£¥´!W|∞s“{Kö·cv€ÕéÁ\r*Ù≠Xñ\\)bp3‘~UKÕyg/	.3ÚåÒ≈Mu x–´ç 2W°4”≥≤œKvÔY˙u¥FÌ¶Çe;òâ#∏=i“Ímµ-£n%»_E«z——‡\\â\"åø.\0Ô‹’s\n≈˘$Ú·»m=H™$Ms>Õ˛Z±∆Óıµ®XøŸ∑ÚA?LıÆuo&Oëm\0u\0é¸séjîë,’D`	7ëê{g¨{ù>\'ïòÁûzr;äµj\\è¥óª˘…Ê¨3F$?.úÒTò¨d√•a2≤rÀ¿Î”ÎM∏∂%3à˜gÇ£ÇkM¢1‰Ì øçEnà€F>bNCﬂ¸jÆ#}Ít ˇ\0yåÉ‘V}«áô–,†≤Éìœ$˙◊]$„iV?8∆;\Zé› Y\0%F75+ç#œµ¥jU`ŒyÁ“π]C√œÄ©«·^Î-¨2Øò™	Ó;V6£¢%‘dy[sË9©–6<¸˚9v∂I¶5–\'pC^â¨¯9sé¸s^w©i≥ŸH¡–ÅQ$RfÜìÆ…¶›â£ê§££ååˇ\0ı´–¨<w´…:‹€»≥úØô§1+ﬂcg?ÅØ2:Ù¸jh5)Ì˛„°5ûèrÆ}°¢j—^⁄G*Öó;Ü∏íæGÁƒ´˝%ëZFh¡Œ÷? Ω´¬ø¥ÕY9• x˘´7√πÍ•™v˜±œdue=<U†¿˜®‘QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0fäJ\0Z(¢Ä\Z√\"≤u+]Ëx≠ääh√©†6÷4Âñ7ç◊Éﬂ“πVFµå¬‹2ÒèZı\rV« ê+á÷t÷ëK†ƒ©˜}˝™·+ÀÕ0Ub8n∏È®© /œ‚j≠ŒÈ| yˆˆ©„òyr7.2z’∞.¬£Ô2ïC¯‚ô<jßérqë“¢¥∫!⁄2Ñ∆«êOJ–T\\êÉås≈ \r6\"/≤Â1è_ŒëdUæü»G˘§\'?•XGkn“˘ùÖfŸªL?vYIlπ£`5°co!íb1Äû¶†G∏I…g¡<˝ΩÍ¬7ŸŒ· `£\0cík)Øeº∏u\\2ßÙ¶ÄΩ†ZÆ°‚¶ÛXîçéZ“˚f§≤»ˆ±Ö$nMe¯IûMJÓu<`Æœ‘VıÉãPL67Qìí}™[‘l‡/˛$x˛ﬂR€„ä0ÿ@#‹ö⁄¥¯∞±®∂Òö˜∏∂O©\\ˇ\0*ÍnÙªK≈e1£Ü_ƒ{◊õ¯áCÑ }çËHÍΩP¨vñ∫Óáx¶m2˝$\rí—É»>Î◊ÙÆé–A®⁄≤+â	 ‡◊ÕÛÿyrÊ6√u8?ùhiæ&◊tiRDûIÛÛûG„Bm\n«∫ÃæTàìNªóç¨1üzu…{p·TXÙ?J‰|;Ò7L÷%Kmi⁄b1Ê8I˜Æ˙;8uÅV€\\©B\n9ˇ\0ıVäD¥f€ ûU›÷«Qﬁ≠%úa‹.HÛ”¶Æüwo#ïî®ƒÜﬂ>i€œFjÆ+ïvç∏o¿`SJÜ¿ÁµJ∑0…ÂéÏsìå“HËÆc˘v˝‡yÄ2nÙ¯Ê~$π\\uÆW[ÂΩ H6d∑LˆÆÿ™ﬁôœ99ŒMA®û‹„%∞Á:–ÖÍ~0òÂ2GR69«5ï´iVñw\rin€û <…XIØv‘Ù˚d”g˚D+\"®.	Á†»Øfñ‡¥[ôÆ\'b¯∆qì¡• Ösõö’Ñ∆4à;})-ÆÁµî2H Ev⁄nçkd”E.%ºE.ËqX70,àLê¨`ìÄ´»®tö‘•#¨ü≈OGtGî…yV5Ó~\Z¯è§kq¢ôñà˚ézö˘8⁄∫3‰/_jû÷ˆÊŒ@—HUÅ‚≥qæÂ\\˚Ü+Ñêd0#\ZòkÊ	|Z‘tßé∆Û`ËUœÚØtÔç4Õzky’da˛≠è5õãC:∫*$î8ÎRR—E\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0RR“P—E\0RR—@.`áäÂ5K+µaëäÕΩ¥!‚Ä<w_“fπå`èæÛÆQ⁄HÿåÙÁÎ⁄ïâR~^+Ä÷Ù_-Ãë±èOÓ÷∞ïÙ`d⁄jäØ∂Xÿˇ\0ß6™>◊∫&+˝—⁄¢äÖ˛nWÈ÷ï èÃ›ç‹u≠,êy.I$î8‡ìö|)p·pGπ^ıM	~Á{„ßJµé&;sÍNi0-≠‘±£ èF	=™úÑizd˜üôŒ◊5l‹ÖëÉ¸Ã1ü≠`^›çS^Üƒê É˜ì¿ﬂ Ñ3∑ƒ)c°âù?{7ŒÙœ#¸˙TzÑ≠,2\\Fπpÿ\0VT⁄√O•4»J}Å;\08»´6@›⁄lt\'≠g‘≠À∂ö‚£è8ï¿⁄29≠[õ;;ª%‹ÉuïéñE^ò#ppEjÀ*=†U;\nêFFr¥Ó&yßå¥Ïu≈® êN∆π©-úªÅ^õnó˜»@≈Áæ”ûÜ∞5#c6ÃmŒ1ûÜµ±8Y≠Ûëœµi¯{≈˙ÁÖ%cπÛmA…∑îíüá•IsçÒ∑∂3Yí√ípiXtÔƒ˝_Ú‡ªactxh•?#fÆäÎHçùÃ Ÿv$ÉÙ⁄æXedì‡Æ€¬ˇ\0µ]À∑7/=®80Lr–ı_‘Qp±Îã4%äo5G\\˙”∑…Üˇ\0ñå}™Æõ´È^%∂2€4q\\Ø-6}1‘u©‹¡(U@}˜f©HM<•ÿTÇπ<⁄°41≤2r‹piÈq#F‹0y»‡”÷A!û1»\"™‚2ÓÁ£@#ç¡¿¨»t=&ÀÕ∏$è√≤k°ÿ†ªp£¶O«#B·XÅút¶¥é\"ÎI“º;·ÌCSâ]ß∏r£ﬁÎ“∏;KYµD7,å\"Cúcåw5Î⁄éì°f-•\0¶Ì›{÷π¢]E†H˙J˘èù≠\Z/*øJµ$˜&«ï][M7õ‰.∂‘Ÿ•!Vƒu9b∫È4ÎÅginÒïπ∏9+”“]x^-†êØú—Ów#°Ù.	Çgì<~SëZ˙>ØußNØ¨•Nx5B[XÖÀà.@;∂Üná§÷Úa’~±úÉX⁄≈û˘·/ä†§v˙ü\'¶¸Û^±¶Î6∫åKyñEˆ<è¬æ2∑ª!≤≠ıï◊h>0Ω“fWÜ·ÜL‘8&Uœ¨ï√äuy∑Ö~$YÍ±\"]8ä^õª^Å L°ïÉ–éıìMn2ÕÅ≥KHä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†íñä\0(¢ä\0);““w†¶∫Ü\\\Zuã®YSÅ\\v•`0ËÀï<^ç,aÖajVÅ8ÊÄ<sQµk	vH3}««ÈTJd|á\"ΩT”VHﬁ)({W®ÈÚÿ?S¥ú,É°ˆ>ı¥g}Z„,‹¶G*˝™Dú¢ón\\b≥ö‚xÿe„–‘ëﬁC#0vÿOPﬁµc±t \0ñf‰ÄNOjÁ¥∏ÊGÂ‹9299¬s◊‹Û«“µØ¶ImLú≥éHÔä~ë`ˆˆB0p¨˚» gÛ•p	@p\"çJ≈›\0V•ëuèÀ¿aQãnäVeN∑≠H÷ó>ræ”ﬂ+éÇ≠MÂ…`Çu¡¨;{ø≤@Í0’h^=‘%â˚ß®ÎEÄ¡î>ô´3⁄ñï	%¡˛/√ﬁ©ﬂﬁ‹¥¡≈ïŒﬁA\"\"Aœ“µeàÕqΩWΩ™¸o$J%îû2*˘ÖcÄæ|&ÁäDœ!ù\n˛∏¨9e@‹∏9‰W±!ô∆\ZR¿gÂnA™≥ÿX]7˙Mï¥ÉÊ0)sèb±$g˚—)nßo∆Ωj_Ë3BtıBÉ£„ä®æ	”Ñ£»/±øÅø•∆È¬Â$å¿Ó€8dˇ\0Î~uÈ˙6©<ˆk¯˙,ª≥ûŸ±‚í√√6÷ä´*åÚ=¬µ£±¥TÚŸWˇ\0ˇ\0?ùem.\"uhoïÅ8«°&òJ≈(E\'9Á∏´÷¢[uŸÔàé∫ä∂÷p›1GÕ‘„ì˘–§\'c<md m A®ÃT…‚ñÓ∆Ú .Ë˙Ù˛µL^YÉì”äæbl,ñO+∂1”mCˆimYdäGFÈëÈ[*bm´#v\0Ç√å˝jÍi≤:èır\'¶i‹Gõo∑˝©xè9Aú˜N:Åﬁ∏›rÓÓXµ≠nVh÷r!∂åûÉ>ïÏ-°≠ŒWî˝Éw¸kâÒgÇı∆Ü#\Z†F-ì˜X’©°5©„2X©Ÿkl¶Iÿ`€‘ö›>ãM—\ZKŸ	9:ìÌ]<öû\Z”º´höΩÀmFHœgZ“`œÖ†ÉS∏ÛÆßs#ñ‰Á–SQ[í‰ymÂìyä`PÉèΩ∆i∞§®ƒﬂé¶>v˝k§m?Ì!Óà	OìïùßÈSïπkg!îÑŸ•(Xiå∞øíŸ√∆ƒ◊§¯_‚∆úR9_|}√äÛ/Ï˝D/ùˆetnIåÙ¶«s±∂|»„≥\n Q]KL˙ªDÒEñ¨ãÂ B>„øOZË@’Ú~ï‚YlŸUúÖœØOß•z6ôÒCP∞µﬁˆ„Q∂Q¸-∂U˙ˇ\0x{÷2¶÷≈\\ˆÏ—^caÒóHΩÅd[;∞«Çø.A¸ÍÛ|S∞∏X›c‹®˛µ.-fzÊØÒr…[¶‹Í\\\n[?ä±ﬂOÂC§œüf‹ *l¨Ùö+2ﬂRY°çŒUòd©ÌÌWbò8‡–\"j(Õ\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0RR“P—E\0Rw•§Ô@EPPÕu‰T‘îÃÍZp`H _È‡´#¶TıW•KpF+P”C@† ’4Fà!Â3í;÷GÉÛ(«∏ØTΩ∞(«ÂÆOT“6±ö›Fz≤Öit\Z9eÉlä„ß∑j‘Åœ»W#Èˆ˛Il⁄«®≠+X¢Œ‹°´6â#›å1Uë¡˙WC\rºB?∫0}iÌgn√>ı7úX‹2∏‰{÷Ñ1‡∏\nG#5m¨\"LêßZb¢⁄>_•U¿gŸêåÄsûqJcd;Büläªlª7dN)œ9E\"°∞(˝ù¿rIÌäïl‰sô6™û˘ÈV#∏2\'<Sï’∏œJWc!{uAàÊ\0cé¥è-61g#∏_ÂS2Æ89™Ôl{\r%&\r>ªJ6Z±êqπõqåeL\nåONqMíœÄTg⁄´K\0…‹ÑV™Hõ⁄]‹y∏fÁÆ{÷ı∑âZ’ÿJ©)N0˙ıŒ¬p6˘x*y„ó\0Hf9…9ÎTöèA≥Ò$cimçË√≠hƒñ◊#&≥û+ÃÌ÷`ÜD»R{◊G¶Í≤∆3é;P+Tˆ…$xxVOˆ{\Z°Ñq\\ô†ic^Ü3–Uào„dFf\nO‰j«ò&Lgp>î\\D´w‰Ä≤ƒ$C‘˜˘,Ìµ+Få1xXîûG–÷ô$Â;ΩXÅﬂxÿ•	‰bïÄ∆πÏ∂çÊ£ãïèêX|Èä‚|_°∑ào†∫ùã¡‡†·∏Ï+◊⁄˘V2&Cêqê:’Õ6ÀUB»Jå∆új5∏úOú£ñÁR‘€Né‹√d*=Û≠KÌ,⁄@UJ£∫`®Îé‰◊©˝íMKê÷p¨åÖDûXœ‡kÇÒáuH¥iÔû)$ñ‚`ë‰ëÍ}´uR˚í‚qQ\\Õi>»2…ª<≠fÍO$◊Ä€¬§±;∆8J›÷§m6k}$ß˙B®ﬁx˘Xˆ˙’kãt∞RŒ1Ö‡ìÀ\Z¶ìBπœ‹3¡è62™àsÉSÿÍí[∞⁄˘S‘Nkk´§í‡3Ì¿√9¨ñà∆≈à1ú„=çc%b”4Ø\'{k•ª≤m™¸≤vÕniöƒzÇ€˜rÙ1ì¸´öÇ]—ÌsïÈë»™ÚáµùdàëŒU≥P—qìG˝ïy;™AπáP\nú◊i·]tç◊OÁß*¸m¸ø≠pûÒj«szé8?+íGˇ\0™ΩjŸ„øùßâ√§áp¡ŒÌXI4m)›\Z÷s;∞‰◊Qc∏®&≥4›<`V¸0à≈Ië0ÈKIK@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@%-%\0-Q@\'zZ(\0¢ä(\0¢ä(\0®§à:‚•¢Ä0Ô¥‡‡úW+}ß≤Å^ÜËt¨ª€ëO‰˙ñå$vñ\0^„≥Vl3∞>LŸGSﬁΩ\nˇ\0M*Nπ≠KJ[ÄsÚH:8>µqóp*€^€kù {÷§dJõ£`~ÜπáÛ≠ ù~n«˚√⁄ßÇÒ°p ‹w•ì∑.™/#´g”⁄≠Gxó1^1◊…∫Éês¯R∞Åné‹Åúäå‹eé:‘Ú©Û™æc,É”ΩQfØ©©ïr:ö é\\Áh5j9¿\\…§–Ó\\.Ÿ˜†?&ìÕE|ÌQ»?∫j\Z\ZeÅ»ÎN)∏sÉéïr94ÚÃ›:Rÿbºa–°\\ìŒj¥ñ\n¿ÌÍx´Hﬂ?ΩK“ªâËjîÖbê≥í8†∆ﬁ«†™ó2JﬂSèJ€ï¡…‡Ù™2⁄%ÇÜb0*‘â±F€VìÓª6’˜‚∫;\ryUÄ}OJÁŒúAﬁ†ÜÎUû÷H_x»œß{ä«°Y^âÅW¡\\dZê\\*êcê1«È^S´5úª∞=\rni∫⁄§ü}∑u&òXÓ.fïêúÁ=)tıÅÿø›êéO≠aˇ\0l¥Ö^1∆\0ÎZñ“£«ΩÚß∑jHMß∫∑h⁄≈ ûçå’≠6Úﬁ=ˆoÁ¿F‡á®®ô^i!Y0y≠jBÆí†PPÅåÅä¶≠∞è\Z’<.5…uY&m≈¸∆å÷fõ‡ÎùwYπºæ\rú]U∏˜≈{éßgm´§yW	»~0~µÃÎvzà“üL§JÛI„˘≠#;Ë»qÏy•´Z.ózlbÚ‚éC}ÏWój–±|ú»ﬂ–W°x∑√gI—lÏ†_2 ∆Idœﬁ∏ã]]G-MÑ|…,ún5R’ËÃeûò˜∂o}eÚ2À28jßø%£xé?ä6É]åz≠ùéÜÒŸ·â;«ß\\z÷;…¿J6œçÀ!ÍsÍj\\4\Zï ⁄z⁄:\'gîêuZÍ|5ØÍ~æå»ÜÁMsÛÏ¿ıÜπ	‰;Ãd∏è∏˚Øˇ\0◊´zfØqßŒÆyF\rYJ7-3Î\rÚõX¶ÖÉG\"ÜR;Ç2+eNGÛ˛Ö„€Ì3…ö[≠,`Ko÷KqÍß∫˚ïÌ˙v£Ì¨SƒŸIT2ücXJ6e\ZtR»•§EPEPEPEPEPEPEPEPEPEPEPEPEPIKF(\0¢ä(\0§•§Ô@EPEPEPMesN¢Ä3Æ¨ñE<W7•„$\nÌ≠UûŸdä\0Ú˝KKKà^)TÌ=Íß‘{◊qˆ›\"Ï¡xûdg&9î}ÒÙÏ}´⁄u\r/9 W\'™i1\\BOx€∑ß∏Ù5QïÄ„-Ôlï=E[[Êe!â’ÃÎZ>•·Îü¥Ÿ9íy£}}Ù4∫_â≠µÚü‹±∑•kt ±‘%‚Ö*O9‚ù!Ü\\~5ò¿1‹ßßGpØˇ\0™®í‰è2©9U¢+ê£ñ…ı°.\"òÄTt¶InK|ä¢êºˇ\0îÛú’®¶≤Õ◊µg∆énZWë◊.iX\rmÍWé=Èÿk!ne\'⁄ßK¨ç¨9®qÕúÜˆ´;’◊≤º—ÿ‘Çb;ı©±F¬¶Á)íJÒU!üﬁúÛ–ÊÑÀ:˘x?w<Ê´]4{:£“öÁp>ûûµ\Z≥`é1ÈÎTô63ÔaIdAÚ˜ÁUâJ¸•ä∞Ë√∏≠[ïÚ‰‹ÉvGOJœöUõ(Í2=™Æ≈©K´o*Jé¯∑≠<LÚRw„5 ¥	,nªò™rˆı¢¡Z›DâùŸ‡M0±Í\Z~§â\\Äp1é¶¥Æu∏ÓWbß¶zbº∆ﬂTa.√ùˇ\0^+^œT~rΩs∫ù»hÔmôç´yﬂºœFE:ﬁ¥´BﬂΩÑÇHn™}´\Z∆Ä*ºz€“ØPÒÄyŒiä∆Fß†Ég%µÍ˘∂U˘ì5¬¯õ¬W[-tm1KZ;2e´◊ﬁÓêá⁄À”˙÷tÒÀß‹õªEÛm|„%}≈Tf‚KW<CYô∞‘$∑äùú!∑≥òû˛Ê∞ÃM4K-‹Jõ[*OŸØ]ÒÉàß∑‘-&gDè˜±Ù…´«µYØn|D÷~V–ØÂ¨J8≠¢”DΩ\n0Ø€/¿Kp˘8˘∏„⁄õ}`m§êD¡Ç˝Ëÿ‰°Æ¡÷”H±∫X°4(<Ÿcÿ{◊ÙŸÃ∑7$ªgÆsJq@Ç√P{Ñ÷ÃÎ\"r»x#¸E{èÄºkm®€EjÏëJú ºSE–Á‘¨•∏ò2™©Úúu>ıB⁄ÚÁNª·ê pk	B˚ö&}ôk8uÛVAÕ|˘§|W‘,4ƒ∏ÚíÒ\"¿ö8lyOÛÎûÒçèäÙµΩ¥8x‰#rü¬π‹Z,Í(¶+Ü˙@QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0î¥î\0¥QE\0ùÈi;–—E\0QE\0QE\0QE\0QE–áä¡‘t–¿êµ“‘2ƒ`–õ_È¿£«\"Faêk <[‡	=ˆï∏ëÛ4ƒ>ïÙ5˛öOÃ^ÈÏåpΩ)ß`ª>}“<Yq`‚€RË<¡‘}k≥∑º∑ºÑI´‹Uœ¯œX/qnΩŸÂ±¬ø◊–˚◊ei©¯RÎ ‘m⁄M9€iq∆”Íc˙}kE!ùb· ’€{§R7sÎU˛√$ñÀsf‚ÍŸÜxqıÍ≤ Ñï…R:Ü‡ä¥”fhŸpA¶ya˙qÙˆ¨≈ïÄ„ëÎSãÃ®¡aé>îó π-“ú0∏8\'ÍòÁ;è>µ7ú£ä\0kHTåÉV#îí3P∂÷∂(8Ÿ¡$éûÙöÿúå‚¶I\nÄ{÷j∏jUúg°°‹“Ø◊≠&HbAÌU√ßÎH“≤ŸÕ+ù»î‹U)¨Im¿„π¿´\\A©$òd∆h\'Àh‹‡`gúöc£	¬∆‰û„÷¥$T¡˜¨ªÑ8≤dmËsTÑ0([á;àl»¸Í¥óÔçßOCW\Z„(Ÿ\n=y™oún}§˜¶2ıñ≤“∫¨çÇã∞”€xâaåG‰éºuØ<€Â¨å§ÌÈäu•À\'ŒN÷ãä«´È∫ì›Oç€[Æ	Î[ÚﬁåpØéMynü™˝ù3e€πÆÇ«Vív√?A“Ö!rõÊ¬_)¶¥îG>„¬˝÷™ZeÜô>ÆnÆm=Da◊ﬁ¨ƒ°pK{‘ÚònP-∆N √Ç>Ü≠Hñé_∆˛2XJöRÛ+yí\0:üÚ+Œlº5q|^]HõkcíÖyr:ÊΩçoö…ˆ\\ fµŒo‚_≠T’∆ù®€¥R*∫Jx+∆~µ¥dû‰4y•æºOπ∂∆;p|®d<?·\\éßg\\°y6N„q€^°q§FÀo ±[Z‰¢ƒπ›ˇ\0◊ÆZ„M∂Yd∫Ω¿.ÿE=@Ù≈S\\⁄Æé.9Ê±òËåtaÔ^ÖÎWm/\\Y≠[6Û\r∑g†˛Ú˙‡Ûä„ı;Y\"gíŸ…˚ùJ÷}ï‘∂íâ‡ò#+g\0„¸öÁî-£4ã>…∞ªYëHlÇ3Z`‰WÄ¯o‚§ñöf˚®|Ûî6÷+ÍC^©·_\ZÈ˛)¥Û¨ƒà@À,Äd~UŒ‚—gWEFí©)\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0RR“P—E\0Rw•¢Ä\n(¢Ä\n(¢Ä\n(¢Ä\n(¢Ä\n(¢Ä\n(¢Ä#x√V]Êû≤Å[÷\\ä\0·/¥≤§·k\nÔOY£ñ%t<aêk”\'≥Y‚±Ætêƒê(ÇÉOä◊pÇ Äı¿®otã{—ô¢˚:k∂˛∆9˚µ∫AÓ—p<∫„BΩ±%≠[œèÆ”¡WzÀï ≈\'pxØG∏”Ÿ›¨õÕ.û&Ñ:7q¯’©˜çåJ§Ü9àß¨§ÒúVƒ⁄\'0HO˚-˛5ïsk5ªì$L=˚V™IÄÂõÊ´+7n+9w1˜•Wm›©Åu€pòwê:u®<¬x«Jpp@Í÷ïÄ≤éxŒqR4ﬂ.*™∑ÅDÑÖ‰})XH~J_µñ‚©á!π§vÚ>R;Qaó~”êqQ˘†çÃZ™%ÿ0z˚Såª◊äV…ìs˘ëú÷´	8«^µeàHŒ{ÒU]¬ÂáZ∆2¶‹0˘èP;‘*ë≤1ëü ¶ìÊà»5—≤ù…≈;Gip‹eâ⁄;\Z’∂◊<π0GS≈cJI\0Û\n´&‡22•»;Î[ˆﬁ≤ÔÎ]:éËTN:\ZÚ´mBx¿]«ØeÆ2Hº;féVÑwƒ-ã8b‹l=*É@ˆôö0œ?2u€Ó=™Öéµ“\rŒ§û’≤nH≥úzb©;	î.	ñ‹à‹3cúïœ›ÈÕtÉŒäÙ\'®ÆÜ[!,Ö‚%%œﬁ^ˇ\0QQ¥dÚo6°«:9Ù÷µR\"«ûÍ\ZUƒRÊm›6v5Õﬁ⁄‹4õ˛ äWÔ`ıØY‘4ÙË:˛5…Í∫$·¸ƒR°„45p8¯ní\"Tˇ\0ÑWQ·mb}WáR”]ä!˝˝æy+ﬂ£⁄π´˚&Åâe¡û1QŸ_<2áqåòVmt)_Ëzƒ:ùî7PH)WröﬂCë_2¯c‚˙§∆›d˚Ê	˜#=Î◊|„¯|S!m›F‡¢MŸ˝c(4Qﬂ—P«0qú‘’\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0î¥ò†¢ä(\0¢äNÙ\0¥QE\0QE\0QE\0QE\0QE\0QE\0QE\0!”\Z∑j}êπÈM{d#†´PE∆úÆçu§u¬◊^@5¿≠⁄Ä<Ú„LeœÀY”Yúe»Ù\"Ωkq“≤ÆtÄr@†7π—`rYçΩGJ»π“Ó`…\n}VΩÁIe\'Â¨πl]Jµ6ÄÛ◊,å>\\c≠A#:∂G\"ª{≠2ø÷D7xpk\Z„√ÂI0Iüˆ[è÷≠Mu9{µ3rCI-åˆÁ˜àÀÔä≠)cWp$ê‡ÉQo€…\rQ/f¸)ûp\rá^hâ⁄@›G4“∆>@Ê¢ 9 ıß\'9\\–è&Ù…\0{{‘.^ø1¶I”ÒÈP¥ÑEárBÿ‡ÚπÎMw\'ï<TŒsüª◊5òG≠&‰≤√±5]π‚úA-Ëqö7q“òà\0˘±HŸ^ÜñE ez”ù†––‹º-ª\'Î]∑àbUﬂÕscïÈQÇT„\'¨°ÿkhYC7\'Ø5±%‹[≤)Sª®<äÚtπñ3Ú±´∞k∫í«Ä=+	C4=áÒ/“¶º”Ì.-AÅ”∏ÆN◊≈¨®2ƒ„éµ°∑ÙªŸƒO”xÍ~æµJV&∆≠¢¨ÆÀ…ΩÖp◊ZWìt€Y£\\‡q^Ÿg¶òL∑@loπ*øQ\\∂ß°J.$`ëHù∑\03ˇ\0◊ß£«õ¡3C)W¡ s÷∫?ÍSi⁄åW˙dõ&ç∑<,p⁄™jZPÅAh|Ü\'¯ª÷QFµîœ®e5.=ôıáÜ<Gµß«u	+û3’∏5’G eØí4øj60:€ﬁ…:‡K‡ÁﬁΩ[·«ƒ	\'u—ıâ$˚cs“6DûŸ5Ñ°b÷ß≤Êñ™¡8êqVE@EPEPEPEPEPEPEPEPEPIöZJ\0Z(¢Ä\nNÙ¥ùËh¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0LSZ0{SË†\nrŸ´Ç≥Æ4•l¸µªäB†–s£ë—J üLeœÀ^Ü+ïJm=\\tÁRŸ∑FPG°óq¢€KìÂîc›xØG∏—¡Ëµïq§—iß`<‚„√Ú)ÃLÆnÜ≤Æ,%ÅæxY~¢Ω&m5îüñ©ÀfpAPG¶*ïF<÷K~r£–S0Í:ü•ww\Z=¥ôÃ[IÓºV]«áIÜPG£èÎV¶∫éÁ,“‡P3°»≠ÀçÊwBHıNk*kL1GcUqÀì∆M5äÄzÊ¶Ú∂úA£ F<ûi‹\n≈∞˚éiC&Ì›\Zô°¿ıÑHV!ñEIaÉQûG+Sc\\Xêj~oóÉÈEÑHc\n=EBÍI„ﬁù≤ì∏ìöê:c⁄ùÇ‰j£0ÊëÅ‰P˚7ÜÓhiP0„ ˙R∞\\Ä°Sï&§I$å´AiÓ¡ÜEEΩº≤1”Ω¶∞ÒïÏ\n∞ªΩ=\rhGxoæË-…G«È\\\Z  Âà„ÈVR˝Éá\'ß•\n»,z4~[»YÉ.“?’I∆?:‰ıO$W\r$tÙ™xûÓ2À∫> kj√S∂‘ˇ\0„Ô/Å∑h8qÙßÃ+5ˆë5ô/Âz∞?ÃUç\'ZñŒX˛”xë∑)T˙©Í\rzíËZ~£dR‹•Ã]6∑…\"öÛ˝o¬ÚY›π∑î∆ ›$‡Rj‡{óÜ|o•^ië‹=Ú(D⁄R=IÆœL÷¨u[:∆Í+à¡¡h€\"æ@[ã≠\"oôq€~doZıoÜ^)µ∑êY-ÃQ√ ‚7\0›∞ﬁû∆±ù;jäL˜êŸÈN¨˚K° ’AÈYZ(¢Ä\n(¢Ä\n(¢Ä\n(¢Ä\n(¢Ä\n(¢Ä\n(¢Ä\n(¢Ä\nJZJ\0Z(¢Ä\nNÙ¥î\0¥QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0Üñä\0aE#•C%™∑j≥E\0eM¶´gÂ¨ÈÙÄsÖÆñöP‘≈O£ëú-gÀ•≤ìÚ◊†5≤∑aU‰∞V(Œﬁ…◊±™w\Z|sM?˚ÀöÙ)tî`~Z°6åAE¿Û{è\rŸ…ùä—1ÓG‰küø–f≥ùK≈ˇ\0=t˙äıâÙÇ3≈eœb…û*î⁄Ê¯z˛tﬂ\0ßêwjt\rV\"w«ÉËN3]Ù÷FÛ `ÂêgÈA‘!È6pÜNkE+îïˆ<‚M3Pèô-èP3T\Z5Js‹^ë4§{„ë·SíHË¬§∑∑[ªrZdû6»å\Z¶ÏMè8#ë‘˛4èn˚rwá¬∂ç9ìyU?¿U[ﬂDÍZ“·„ês∂NTˇ\0Ö\n¢é\nKI|»Hˆ¶%õ,Ä\ZÌÏº%p“üµîçt;â˙T:èÑØaKIÑË›⁄ÒßÌ¨r2¨ÉÓåc–SvªÌ8≠{M>{âL[gi3ç•qÕh›x[SÜ–D≤3ç˘\'™sB±ÃÑv*åƒ≤q»¸*—ªxdhßµm‡‡éÑ°©‚Ã‰yVÚ∂;…£FfDê˛ò®√‹€‰£Ωà=Î]º£!I>FA„Ê¥ø!SÓ(∑`+ÿ¯™Í“PÃƒÌË¿‡è∆ª3≈\Z~Æã¢Ia—‘·á¯◊6îé2A˙w¨ŸÙπ†}Ò9‘≠$\Z£y·\rEw€ Ü6Ô∑Ø‡?•yÌÊÖ•‹4ãä™¸<Å⁄¢±Ò6©§0Y¯¡œ\'&ª;È⁄îKooL4dè£u£õ∏XÜ~\'Í∫T&Œ·Ñÿ\\F”) ŸıÍ˛ÒÚk∞à/º®/â;UrA˛…˛ùk»µ-I’¢ilÆL2ıQöÁÕ˝ˇ\0Ö/£Uìx$ƒ≠è_Ò©ï4ı@ôıƒráÔöîWë¯O‚∆ü®ZΩGäÈ!~`„‘WßŸjﬁ[§—8x‹eXw¨\Zkrã¥RöZ@QE\0QE\0RdS^EE%à\0í{PÈ3Ô\\û≠ÒA“˜(π7RÉçñ√?^ï¡jˇ\0u9É\r6ŒTË\ZSΩˇ\0¿~¥Ï¬«¥ΩS∫’Ù˚,˝™ˆﬁvíUS˘fæi‘ºk‚\rA±q™]>Ô‡G*ß[K–uO…æ0 p“JNW(CÕ„Ô¬˚NØ∑§yo‰(¥Ò÷â}0ä⁄‚YÙƒ˛Ê⁄/ÉtÕ9w^µœÎ ™˝vó	l°-°Hó—°‹•¬∫Ç;‘πœÿ‹ªëö€åíÄÊÄ&¢ä(\0¢äNÙ\0¥QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0bä(\nÉL1)©(†\n≤Z+v¨ÀΩ-YOÀ[¥÷@√ö\0‡o¥¬ÑÒ\\Œ••â≤W‰ì◊◊Î^©wd≤)‚πùCL íÅßcÃg”Ó¢;A`Õ–ÉëV<2.\"∫∏≥ö\"ô˝‡qÉﬂÛˆÆ¢kfâ˜m‰zäñPÄæJ´ÙŒ˘NWVcnËñ„ÅR6ñ√¯Mniq+®‡VﬂÿQó†©$‡ˇ\0≥õ=\r1Ùˆ•wüŸ©˝—Q…•°tPüõ6HQìﬂ¢ÕΩ\rvm£ÆÔªN˛»PøvÄ<˙ÁH∂∏pÛ⁄«#‚eÊü†âv≈EÙQäÏÊ—˘‡TcF>î\\7◊|)g≠bI7√p±ı>ƒw¨´?[@·¶ºû@vß +’ß—»v©%≥˜iÛ0<ÎQé-§}>gÛ@ «&cÈö‚Rk∆ê≈5ãóPsü•{¥∫c(Œ⁄œkIKà‘9˛ º˛uj£Ac…\'–.\ZÿI5å»å3ñ^EdÀ£¬WvıÓ?gl\rrzœÅÌon\ZÊ’æœ3ú∞tü_j•V˚°XÛ(ﬁˆ¿âŸ£Ùj‘”ı(/1k™πÚèxŒ?\ZÏ ),∑“ªë« 0?>kù◊º/>ïöE¬[d`¸øQ⁄©J,EØFiÙ´ë,]Tn…_∆∫ˇ\0|Lº–,µXL∂ƒÚ„á_qÎ\\3‹ZK˚ôâ^Îˇ\0÷´≠ym1Ïnõ‘P–œßtèh˙úQµΩ¸\'Ã8Uf⁄ŸÙ¡Ô]\nH§uØèTœh	éO2ﬂ<›+’|\rÒN;[HÙ˝nYSÂé‰Ú@Ùnˇ\0çf·ÿg∏Êäƒ≤Ò>ë{oÁ¡©Z…∞îqıÕeﬂ¸HÕéÒ˝§∑ΩR›KüœßÎQf\\H^Ó˙ﬁ öÊh·ây/#Ò5„:˜«TUhÙã-¨x\\rÔë≈y¶£‚mkƒw^mıÏ≥êrüë>ÄqMA∞=≥ƒ¥€=—iõŸπƒ≠ïåÊAÔ^u®xß[Ò$ÖØØAüı)Ú∆”ø„˙◊5o\Z*ÓîñrxœÙˆ´q‹Öì{„n:g˙{˝9´QHfáÔŸv \0‰û8ˇ\0?J¬øêãÑ∂ÅZ‚w8H‚Á¸˛ï4⁄Ãóì•çú@…#mTñ¸+∫ÁÜ!—– ÿöˆOø)?Ÿ_A¸È7a∂eË\rÚ¬‹Í·dòÚ-–¸ã˛ÒÓ}´∑ÜµR5\nÄ`*\0´V∂\r!f∑ÏÙûÑ≠E…1†∞ë»‡÷µ∂í«ΩûàÀWR^¬ê÷∂>P¶ãÖ≈8(-\0-Q@\'zZNÙ\0¥QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0#.j•≈™»:U B3@µÊïª8ZÀ\Z[,ù;◊r´ï≤\\ÁÄ2ÙÀfåäﬁAÖ®„Ñ%MåPHE-\0›É4mÍ(3=©<ïÙ©h†\nÔl≠⁄¢˚\nzU⁄(2}=Xt¨π4p[•tÿÕ4∆ßµ\0s\r£\rΩ+6ÁI`xZÓKéï⁄#v†\0Èå?Ñ’iÏR¨ô®\"ΩÈËGATÆ4•l·hÕ§—lúÂÏmÿ˙òó¸+X=ç‰Lˆ`Zœ‘c%‘v¸+’e—∫‡UÙñQ˜i¶÷¿xEœÉµ˚$ycà8S“\'ü¬∞\rÀG1YP£©¡q˘ä˙k^’«xª¬i™⁄=ÕºJ/„óèı∏˛˛5j}≈c…Ó¶¬oÇFRzÖ<\Zß•$o√2ˆ<’Ë¢¥úbEx‰œn~¢¢óMÑ∏h\'W∂9ùh-∏vg∏w`^hV0†\0x«z¨ˆ“ZØ∆y^xˇ\0ÎS§ÉænÄQ`L∂u¶∆›√=3U%‘§îŒƒéÀ≈Pî≤•∞lW]˚√€:∞ªπBm-Hr·€∞˛µ\rÿ£¥Öˇ\0≥¨◊QªåŸ◊*ˇ\0Tá∑‘˜ØH∞∞.G\rÖ°ëáÿi÷!VM‹Ac¶Ñä◊é@8ß¢ü@	åR—E\0î¥î\0¥QE\0ùÈi;–—E\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0SJN¢Ä\"0©ÌPÀf≠⁄≠—@w\ZZ6pµœj\Zwóû8ÆÏ®#ö ‘-C!‚Ä>fÒ¶ìô‚ó˝»ÚÓ«ûò„¯Ä¸y¸jñü-®\\òb2ºd\ZÓ˛-È≈tª]F5%Ì\'‰èÓ∞¡˝q^wlÒ≤°⁄§eø*ËÉ∫NÍ“Œ;ªö-Œ~‚éÉ‹˙◊©∆ô∆6Á®^ïπ}qm(TƒúppxÆvi‘#°c¡ ;UIìb•º]J±∆ôé\0‰◊–æ\r—ì°Z⁄∫mõ§Ì˛∂y«√µ›˚Í≥‹¿v∆?º˝A¸Î‹ÙÀ]Œ8ÆylÈV\\Et∞ƒ@™∂0lA≈hï QE\0QE\0î¥î\0¥QE\0QIﬁÄä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†ä(†´›&‰5bô\"ÂM\0yóèÙœ∑xgS∑Á03/˚À»˛UÛuï¡\0œ#Ω}m≠@Xês≈|°®Ÿù7ZΩ¥)˛¶f@†\'•\\ÜK0PX`VV≥‡ñ<\nπ ›ë”VáÉtÔÌÿ@FQÕ¢Û˛O`πÌæ—Üó¢ŸŸ„ÊDœ´MzïgÖá•[Ôqë]•î!cêãQ¶’≈IH)h\0¢ä(\0¢ä(\0¢äJ\0Z(¢Ä\nNÙ¥ùËh¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0(¢ä\0)•-Ö´Eò€ä˘≥‚vùˆµ¬å-‘a˝≤>S˛}ÎÈ˝B=—öÒã˙QõIÇıÁ∂ó˝÷ˇ\0ÎÅN;Å„n£i9Í}kµ¯Ob%÷ÔÆ»»äœ´˛µqB\'n:}œµzw¬OŸı  ÄcÈV¿ˆçÑäÍ¢QÙ¨=\"< 5æ£≥h¢ä\0(¢ä\0(¢ä\0))i(h¢ä\0);““w†¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(\0¢ä(Ω nC\\ãÙ•‘¥´À6\\˘±∞^ﬂ≠z$É*kô÷cIÔ@%ºÜ&!WkÇTèÛöÙﬂÑ€RLclÀ«¸∏ZGa‚ÕNx@‚@=\0«ı&ªÉÓ~›™≈¸?∫o«ÊoTøÈc˜k[†¨ç,˛Ì~ïÆ:\nÄä(†ä(†ä(†íñíÄ?ˇŸ',4,'Rapida'),(3,'caviar',123,'2','Uma delisiosa','',1,'Bebidas'),(4,'pizza',120,'1','pizza',NULL,1,'Rapida'),(6,'Sopa du macaco',100,'5','Uma delisia',NULL,1,'Sopas'),(9,'Sprite',14,'1','Sprite 500ml',NULL,1,'Bebidas');
/*!40000 ALTER TABLE `platillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `platillos_populares`
--

DROP TABLE IF EXISTS `platillos_populares`;
/*!50001 DROP VIEW IF EXISTS `platillos_populares`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `platillos_populares` (
  `suma` tinyint NOT NULL,
  `nombre` tinyint NOT NULL,
  `cocina` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `preferencias`
--

DROP TABLE IF EXISTS `preferencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferencias` (
  `nombre` varchar(30) NOT NULL,
  `valor` tinyint(1) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferencias`
--

LOCK TABLES `preferencias` WRITE;
/*!40000 ALTER TABLE `preferencias` DISABLE KEYS */;
INSERT INTO `preferencias` VALUES ('acceso_codigo',1),('apagado_dinamico',0),('aplicacion_movil',1),('ayuda_chefs',1),('desperdicio_diario',0),('forma_impresa',1),('forma_visual',0),('notificacion_chef',0),('razon_desperdicio',0);
/*!40000 ALTER TABLE `preferencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`clave`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (2,'Navarro');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recetas` (
  `clave` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,4) NOT NULL,
  `ingrediente` int(11) NOT NULL,
  `platillo` int(11) NOT NULL,
  PRIMARY KEY (`clave`),
  KEY `ingrediente` (`ingrediente`,`platillo`),
  KEY `platillo` (`platillo`),
  CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`platillo`) REFERENCES `platillo` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recetas_ibfk_2` FOREIGN KEY (`ingrediente`) REFERENCES `ingrediente` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (1,0.5000,1,3),(4,10.0000,1,6),(5,0.0100,2,6);
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `surtido_ingredientes`
--

DROP TABLE IF EXISTS `surtido_ingredientes`;
/*!50001 DROP VIEW IF EXISTS `surtido_ingredientes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `surtido_ingredientes` (
  `nombre` tinyint NOT NULL,
  `suma` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `surtidos`
--

DROP TABLE IF EXISTS `surtidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surtidos` (
  `clave` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(10,4) NOT NULL,
  `frecuencia` int(11) NOT NULL,
  `ingrediente` int(11) NOT NULL,
  `proveedor` int(11) NOT NULL,
  `nombre_trigger` varchar(50) NOT NULL,
  PRIMARY KEY (`clave`),
  KEY `ingrediente` (`ingrediente`,`proveedor`),
  KEY `proveedor` (`proveedor`),
  CONSTRAINT `surtidos_ibfk_1` FOREIGN KEY (`ingrediente`) REFERENCES `ingrediente` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `surtidos_ibfk_2` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surtidos`
--

LOCK TABLES `surtidos` WRITE;
/*!40000 ALTER TABLE `surtidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `surtidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `titulos_ingredientes`
--

DROP TABLE IF EXISTS `titulos_ingredientes`;
/*!50001 DROP VIEW IF EXISTS `titulos_ingredientes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `titulos_ingredientes` (
  `nombre` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `titulos_ingredientes_2`
--

DROP TABLE IF EXISTS `titulos_ingredientes_2`;
/*!50001 DROP VIEW IF EXISTS `titulos_ingredientes_2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `titulos_ingredientes_2` (
  `nombre` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `uso_ingredientes`
--

DROP TABLE IF EXISTS `uso_ingredientes`;
/*!50001 DROP VIEW IF EXISTS `uso_ingredientes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `uso_ingredientes` (
  `nombre` tinyint NOT NULL,
  `suma` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nombre` varchar(40) DEFAULT ' ',
  `apellido_p` varchar(30) DEFAULT NULL,
  `apellido_m` varchar(30) DEFAULT NULL,
  `telefono` bigint(11) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `tipo` enum('administrador','empleado','admin') DEFAULT NULL,
  `codigo` int(10) unsigned NOT NULL,
  `tarjeta` int(11) DEFAULT NULL,
  `login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `tarjeta` (`tarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('admin','√ô‚Ç¨‚Ä°‚Ç¨¬≠¬£0√Ö\0¬µ\'¬∂√¥o6','Uma delisia','','',0,'','administrador',2893,NULL,'0000-00-00 00:00:00'),('Admin100','¬™\\√®k¬ù≈†√â+E¬®∆í¬†h4‚Äú','Ivan','Lopez','Murillo',331472010,'Admin100','admin',2994,10999,'2019-05-05 20:44:59'),('Admin123','√∫√É¬ß¬¥#qk,e∆í}r¬æhX','Luis','','',3323857013,'','administrador',936,NULL,NULL),('chef1',']\r^p√ú¬è√é√Ü^√á¬≤vÀú@v','Chef','','',0,'','empleado',9425,26976,'0000-00-00 00:00:00'),('chef2','¬™√±√ø√å√æy√Ü√æE≈∏‚Äπ¬£√ë','Chef 2','','',0,'','empleado',2056,NULL,'2019-05-05 22:21:43'),('DAADSDA','√∏√ô¬ø¬∏√∂}‚Ç¨√øb‚Äö 3¬µ}','','','',0,'','administrador',1872,NULL,'0000-00-00 00:00:00'),('IVX','≈ìw¬∑{b√ù√æiW∆í¬∑¬ÆP@M',' ',NULL,NULL,NULL,NULL,'administrador',3423,NULL,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `generar-codigo` BEFORE INSERT ON `usuario` FOR EACH ROW SET NEW.codigo = (Select Cast(rand()*10000 as int) FROM usuario WHERE Cast(rand()*10000 as int) NOT IN (SELECT codigo FROM usuario) limit 1) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `usuario_ordenes`
--

DROP TABLE IF EXISTS `usuario_ordenes`;
/*!50001 DROP VIEW IF EXISTS `usuario_ordenes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `usuario_ordenes` (
  `suma` tinyint NOT NULL,
  `usuario` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ventas_dia`
--

DROP TABLE IF EXISTS `ventas_dia`;
/*!50001 DROP VIEW IF EXISTS `ventas_dia`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ventas_dia` (
  `suma` tinyint NOT NULL,
  `clientes` tinyint NOT NULL,
  `dia` tinyint NOT NULL,
  `densidad` tinyint NOT NULL,
  `media` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'substancesoft'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `borrar_login` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = '+00:00' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `borrar_login` ON SCHEDULE EVERY 10 MINUTE STARTS '2019-05-05 00:00:00' ON COMPLETION PRESERVE DISABLE DO DELETE FROM login_automatico WHERE 


(SELECT TIMESTAMPDIFF(SECOND,login_automatico.hora,NOW())) > 600 */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `update_stats` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = '+00:00' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `update_stats` ON SCHEDULE EVERY 1 WEEK STARTS '2019-04-07 23:59:59' ON COMPLETION PRESERVE ENABLE DO BEGIN


UPDATE fechas SET valor = NOW() where nombre='fecha_fin';


UPDATE fechas SET valor = DATE_SUB(NOW(), INTERVAL 7 DAY) where nombre='fecha_in';


DELETE FROM HORARIOS;


DELETE FROM HORARIOS;





INSERT INTO HORARIOS(venta, nombre) VALUES


((SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='00:00:00' AND HOUR(fecha)<'01:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),


'00:00 a 01:00');





INSERT INTO HORARIOS(venta, nombre) VALUES


((SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='01:00:00' AND HOUR(fecha)<'02:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),


'01:00 a 02:00');





INSERT INTO HORARIOS(venta, nombre) VALUES


((SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='02:00:00' AND HOUR(fecha)<'03:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),


'02:00 a 03:00');





INSERT INTO HORARIOS(venta, nombre) VALUES


((SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='03:00:00' AND HOUR(fecha)<'04:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),


'03:00 a 04:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='04:00:00' AND HOUR(fecha)<'05:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),


'04:00 a 05:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='05:00:00' AND HOUR(fecha)<'06:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),


    '05:00 a 06:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='06:00:00' AND HOUR(fecha)<'07:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')), 


'06:00 a 07:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='07:00:00' AND HOUR(fecha)<'08:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),


'07:00 a 08:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='08:00:00' AND HOUR(fecha)<'09:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


,'08:00 a 09:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='09:00:00' AND HOUR(fecha)<'10:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


,'09:00 a 10:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='10:00:00' AND HOUR(fecha)<'11:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


,'10:00 a 11:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='11:00:00' AND HOUR(fecha)<'12:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


,'11:00 a 12:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='12:00:00' AND HOUR(fecha)<'13:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


, '12:00 a 13:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='13:00:00' AND HOUR(fecha)<'14:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


,'13:00 a 14:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='14:00:00' AND HOUR(fecha)<'15:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


,'14:00 a 15:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='15:00:00' AND HOUR(fecha)<'16:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


,'15:00 a 16:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='16:00:00' AND HOUR(fecha)<'17:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


, '16:00 a 17:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='17:00:00' AND HOUR(fecha)<'18:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


,'17:00 a 18:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='18:00:00' AND HOUR(fecha)<'19:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


, '18:00 a 19:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='19:00:00' AND HOUR(fecha)<'20:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


, '19:00 a 20:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='20:00:00' AND HOUR(fecha)<'21:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


, '20:00 a 21:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='21:00:00' AND HOUR(fecha)<'22:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


, '21:00 a 22:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='22:00:00' AND HOUR(fecha)<'23:00:00' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


,'22:00 a 23:00');





INSERT INTO HORARIOS(venta, nombre) VALUES(


(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='23:00:00' AND HOUR(fecha)<'23:59:59' AND 


fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 


,'23:00 a 24:00');





END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'substancesoft'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizarTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarTotal`(IN `claveOrden` INT)
BEGIN


 


update orden set total = (select sum(platillo.precio) from platillo, (select * from orden) as ord, 


    pedidos where platillo.clave= pedidos.platillo and ord.clave = claveOrden and 


    ord.clave=pedidos.orden)


    where clave = claveOrden;


    SELECT 2+2;


    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hombrePlatillo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hombrePlatillo`()
SELECT 


hombre.nombrecocina as cocina, 


hombre.cocinakey as clave,


hombre.empleados as trabajadores,


plat.trabajo as trabajo,


(plat.trabajo / hombre.empleados) as razon


FROM 


(SELECT COUNT(usuario.username) as empleados, cocina.clave as cocinakey, cocina.nombre as nombrecocina


FROM usuario, asistencia, chefs, cocina


WHERE usuario.username = asistencia.usuario


AND usuario.username = chefs.usuario


AND cocina.clave = chefs.cocina


AND asistencia.salida IS NULL


GROUP BY cocina


) as hombre, 


(SELECT SUM(dificultad) as trabajo, cocina.clave as cocinakey FROM platillo, pedidos, cocina


WHERE platillo.clave = pedidos.platillo 


AND pedidos.estado = 'pedido'


AND cocina.clave = platillo.cocina


GROUP BY cocina) as plat


WHERE hombre.cocinakey = plat.cocinakey


ORDER BY plat.trabajo/hombre.empleados DESC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerIngredientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIngredientes`(IN `clavePlatillo` INT)
BEGIN





    SELECT 


    recetas.cantidad * (1+(


        (SELECT valor FROM preferencias WHERE nombre = 'razon_desperdicio')


        /100)) 


   	 AS necesario,


    (


        (SELECT COALESCE(SUM(recetas.cantidad),0)*


		(-1 - (SELECT valor from preferencias where nombre = 					'razon_desperdicio')/100)


	FROM recetas, pedidos 


	WHERE pedidos.estado = 'pedido'


	AND recetas.platillo = clavePlatillo


	AND pedidos.platillo = recetas.platillo


     ) + ingrediente.cantidad


    )AS existencia 


    FROM recetas, ingrediente WHERE 


    recetas.ingrediente = ingrediente.clave


    AND recetas.platillo = clavePlatillo;


    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerMensajes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerMensajes`(IN `usr` VARCHAR(35))
    NO SQL
BEGIN


IF(SELECT count(*) FROM mensajes WHERE destinatario = usr AND visto = 0)


THEN 


SELECT texto, TIME(fecha) as hora FROM mensajes WHERE destinatario = usr AND visto = 0;


END IF;


UPDATE mensajes SET visto = 1 WHERE destinatario = usr AND visto = 0;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerTicket`(IN `ord` INT)
BEGIN


SELECT 


platillo.nombre as nombre, platillo.precio as precio, count(*) as conteo,


round(count(*) * platillo.precio,2) as subtotal


from platillo, pedidos


where pedidos.orden = ord


and pedidos.platillo = platillo.clave group by platillo.clave;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verificarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verificarHorario`()
    NO SQL
BEGIN


	IF((SELECT valor FROM preferencias WHERE nombre='apagado_dinamico')=1)


    THEN 


    	IF


        (


            (((SELECT TIMEDIFF(


                TIME(NOW()),


                TIME((SELECT valor FROM fechas WHERE nombre='Encendido'))))


            >= 0) AND 


           ((SELECT TIMEDIFF(


                TIME(NOW()),


                TIME((SELECT valor FROM fechas WHERE nombre='Apagado'))))


            <= 0))


            OR 


                        (((SELECT TIMEDIFF(


                TIME(NOW()),


                TIME((SELECT valor FROM fechas WHERE nombre='Encendido'))))


            <= 0) AND 


           ((SELECT TIMEDIFF(


                TIME(NOW()),


                TIME((SELECT valor FROM fechas WHERE nombre='Apagado'))))


            >= 0))


        )


        THEN 


        	    SELECT 'yes' as status;


        ELSE  


            	SELECT 'no' as status;


        END IF;





    ELSE  


    	SELECT 'yes' as status;


    END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `horarios_venta`
--

/*!50001 DROP TABLE IF EXISTS `horarios_venta`*/;
/*!50001 DROP VIEW IF EXISTS `horarios_venta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `horarios_venta` AS select sum(`orden`.`total`) AS `SUM(total)`,hour(`orden`.`fecha`) AS `hour(fecha)` from `orden` where (`orden`.`fecha` between (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in')) and (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin'))) group by hour(`orden`.`fecha`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `platillos_populares`
--

/*!50001 DROP TABLE IF EXISTS `platillos_populares`*/;
/*!50001 DROP VIEW IF EXISTS `platillos_populares`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `platillos_populares` AS select count(`pedidos`.`clave`) AS `suma`,`platillo`.`nombre` AS `nombre`,`cocina`.`nombre` AS `cocina` from ((`pedidos` join `platillo`) join `cocina`) where ((`platillo`.`clave` = `pedidos`.`platillo`) and (`pedidos`.`hora` >= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in'))) and (`pedidos`.`hora` <= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin'))) and (`platillo`.`cocina` = `cocina`.`clave`)) group by `pedidos`.`platillo` order by count(`pedidos`.`clave`) desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `surtido_ingredientes`
--

/*!50001 DROP TABLE IF EXISTS `surtido_ingredientes`*/;
/*!50001 DROP VIEW IF EXISTS `surtido_ingredientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `surtido_ingredientes` AS select `ingrediente`.`nombre` AS `nombre`,sum(`historial_ingredientes`.`cantidad`) AS `suma` from (`historial_ingredientes` join `ingrediente`) where ((`historial_ingredientes`.`ingrediente` = `ingrediente`.`clave`) and (`historial_ingredientes`.`fecha` >= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in'))) and (`historial_ingredientes`.`fecha` <= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin'))) and (`historial_ingredientes`.`tipo` = 'surtido')) group by `historial_ingredientes`.`ingrediente` order by sum(`historial_ingredientes`.`cantidad`) limit 15 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `titulos_ingredientes`
--

/*!50001 DROP TABLE IF EXISTS `titulos_ingredientes`*/;
/*!50001 DROP VIEW IF EXISTS `titulos_ingredientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `titulos_ingredientes` AS select concat(`ingrediente`.`nombre`,'(',`ingrediente`.`especificacion`,')') AS `nombre` from ((`ingrediente` join `uso_ingredientes`) join `surtido_ingredientes`) where ((`ingrediente`.`nombre` = `uso_ingredientes`.`nombre`) or (`ingrediente`.`nombre` = `surtido_ingredientes`.`nombre`)) group by `ingrediente`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `titulos_ingredientes_2`
--

/*!50001 DROP TABLE IF EXISTS `titulos_ingredientes_2`*/;
/*!50001 DROP VIEW IF EXISTS `titulos_ingredientes_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `titulos_ingredientes_2` AS select `ingrediente`.`nombre` AS `nombre` from ((`ingrediente` join `uso_ingredientes`) join `surtido_ingredientes`) where ((`ingrediente`.`nombre` = `uso_ingredientes`.`nombre`) or (`ingrediente`.`nombre` = `surtido_ingredientes`.`nombre`)) group by `ingrediente`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `uso_ingredientes`
--

/*!50001 DROP TABLE IF EXISTS `uso_ingredientes`*/;
/*!50001 DROP VIEW IF EXISTS `uso_ingredientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `uso_ingredientes` AS select `ingrediente`.`nombre` AS `nombre`,sum(`historial_ingredientes`.`cantidad`) AS `suma` from (`historial_ingredientes` join `ingrediente`) where ((`historial_ingredientes`.`ingrediente` = `ingrediente`.`clave`) and (`historial_ingredientes`.`fecha` >= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in'))) and (`historial_ingredientes`.`fecha` <= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin'))) and (`historial_ingredientes`.`tipo` = 'uso')) group by `historial_ingredientes`.`ingrediente` order by sum(`historial_ingredientes`.`cantidad`) limit 15 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usuario_ordenes`
--

/*!50001 DROP TABLE IF EXISTS `usuario_ordenes`*/;
/*!50001 DROP VIEW IF EXISTS `usuario_ordenes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usuario_ordenes` AS select count(`orden`.`clave`) AS `suma`,`orden`.`usuario` AS `usuario` from `orden` where ((`orden`.`fecha` >= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in'))) and (`orden`.`fecha` <= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin')))) group by `orden`.`usuario` order by `orden`.`usuario` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventas_dia`
--

/*!50001 DROP TABLE IF EXISTS `ventas_dia`*/;
/*!50001 DROP VIEW IF EXISTS `ventas_dia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_dia` AS select round(sum(`platillo`.`precio`),2) AS `suma`,sum(`orden`.`clientes`) AS `clientes`,cast(`pedidos`.`hora` as date) AS `dia`,(select (count(`pedidos`.`clave`) / count(`orden`.`clave`))) AS `densidad`,(round(sum(`platillo`.`precio`),2) / count(`orden`.`clave`)) AS `media` from ((`pedidos` join `platillo`) join `orden`) where ((`platillo`.`clave` = `pedidos`.`platillo`) and (`pedidos`.`orden` = `orden`.`clave`) and (`pedidos`.`hora` >= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in'))) and (`pedidos`.`hora` <= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin')))) group by dayofmonth(`pedidos`.`hora`) order by `pedidos`.`hora` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-26 21:13:03
