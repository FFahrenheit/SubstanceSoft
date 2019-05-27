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
INSERT INTO `mensajes` VALUES (24,'Admin100','El platillo Caviar de la mesa 2 está listo','2019-04-17 23:33:45',1),(25,'Admin100','El platillo Caviar de la mesa 2 está listo','2019-04-17 23:34:06',1),(26,'Admin100','La cuenta en la mesa 2 ha sido pagada','2019-04-18 00:00:46',1),(27,'Admin100','La cuenta en la mesa 2 ha sido cerrada','2019-04-18 00:00:51',1),(41,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:38:07',1),(42,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:38:13',1),(43,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:38:27',1),(44,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:38:58',1),(45,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:38:59',1),(46,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:00',1),(47,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:00',1),(48,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:01',1),(49,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:01',1),(50,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:03',1),(51,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:05',1),(52,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:10',1),(53,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:12',1),(54,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:13',1),(55,'Admin100','El platillo Caviar de la mesa 2 esta listo','2019-04-21 03:39:16',1),(56,'Admin100','La cuenta en la mesa 1 ha sido pagada','2019-04-21 04:01:56',1),(57,'Admin100','La cuenta en la mesa 0 ha sido pagada','2019-04-21 04:03:40',1),(58,'Admin100','El platillo Caviar de la mesa 0 esta listo','2019-04-22 02:48:12',1),(59,'Admin100','El platillo Sopa du macaco de la mesa 0 esta listo','2019-04-23 05:18:15',1),(60,'Admin100','El platillo Sopa du macaco de la mesa 0 esta listo','2019-04-23 05:20:00',1),(61,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:24:48',1),(62,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:24:51',1),(63,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:24:52',1),(64,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:24:53',1),(65,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:24:53',1),(66,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:24:54',1),(67,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:25:04',1),(68,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:25:05',1),(69,'Admin100','El platillo Sopa du macaco de la mesa 2 esta listo','2019-04-23 05:51:24',1),(70,'Admin100','Hey muy buenas a todos, guapísimos','2019-04-28 02:02:07',1),(71,'Admin100','haha','2019-04-28 02:03:36',1),(72,'Admin100','El platillo Sopa du macaco de la mesa 0 esta listo','2019-04-28 02:30:08',1),(73,'Admin100','La cuenta en la mesa 2 ha sido cerrada','2019-04-28 03:02:31',1),(74,'Admin100','holaaa','2019-05-03 01:25:11',1),(75,'Admin100','La cuenta en la mesa 2 ha sido cerrada','2019-05-05 21:29:30',1),(76,'Admin100','La cuenta en la mesa 2 ha sido cerrada','2019-05-05 21:39:38',1),(77,'Admin100','La cuenta en la mesa 0 ha sido cerrada','2019-05-05 21:45:41',1),(78,'Admin100','La cuenta en la mesa 0 ha sido cerrada','2019-05-05 21:46:17',1),(79,'Admin100','La cuenta en la mesa 1 ha sido pagada','2019-05-14 04:19:15',1),(80,'Admin100','El platillo pizza de la mesa 0 esta listo','2019-05-20 01:49:47',1),(81,'Admin100','El usuario Admin100 se\r\n             ha registrado una su salida','2019-05-21 05:50:41',1),(82,'Admin100','El usuario Admin100 se\r\n             ha registrado una su salida','2019-05-21 05:50:57',1),(83,'Admin100','El usuario Admin100 se\r\n             ha registrado una su salida','2019-05-21 05:51:12',1),(84,'Admin100','El usuario Admin100 se\r\n             ha registrado una su salida','2019-05-21 05:55:53',1),(85,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 05:57:33',1),(86,'Admin100','El usuario Admin100 ha registrado\r\n                           su entrada','2019-05-21 05:58:02',1),(87,'Admin100','El usuario chef1 ha registrado\r\n                           su entrada','2019-05-21 06:25:31',1),(88,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 13:17:17',1),(89,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 13:17:31',1),(90,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 13:18:51',1),(91,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 13:20:56',1),(92,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 13:21:08',1),(93,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 13:21:36',1),(94,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 13:24:37',1),(95,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 17:22:58',1),(96,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 17:26:03',1),(97,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 17:30:34',1),(98,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 17:32:41',1),(99,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 17:32:55',1),(100,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 17:40:26',1),(101,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 17:46:30',1),(102,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 17:47:13',1),(103,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 17:47:26',1),(104,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 17:47:49',1),(105,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 17:48:39',1),(106,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 17:49:05',1),(107,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 18:06:05',1),(108,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 18:06:22',1),(109,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 18:07:04',1),(110,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 18:09:03',1),(111,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 18:09:19',1),(112,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 18:11:53',1),(113,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 18:16:32',1),(114,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 18:19:39',1),(115,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 18:19:54',1),(116,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 18:20:09',1),(117,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-21 18:23:37',1),(118,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 18:36:54',1),(119,'Admin100','El usuario Admin100 ha registrado su entrada','2019-05-21 18:37:10',1),(120,'Admin100','El usuario chef1 ha registrado su salida','2019-05-21 18:39:47',1),(121,'Admin100','El usuario Admin100 ha registrado su salida','2019-05-21 18:46:53',1),(122,'Admin100','El platillo Hamburguesa Ranch de la mesa 0 esta listo','2019-05-24 04:28:03',1),(123,'admin','La cuenta en la mesa 0 ha sido cerrada','2019-05-24 06:08:00',0),(124,'Admin100','La cuenta en la mesa 0 ha sido cerrada','2019-05-24 06:08:06',1),(125,'Admin100','La cuenta en la mesa 2 ha sido cerrada','2019-05-24 06:08:11',1),(126,'Admin100','La cuenta en la mesa 0 ha sido cerrada','2019-05-24 06:08:16',1),(127,'Admin100','La cuenta en la mesa 0 ha sido cerrada','2019-05-24 06:08:22',1),(128,'Admin100','La cuenta en la mesa 0 ha sido cerrada','2019-05-24 06:08:28',1),(129,'Admin100','La cuenta en la mesa 0 ha sido pagada','2019-05-24 06:10:51',1),(130,'Admin100','El usuario chef1 ha registrado su entrada','2019-05-26 02:17:01',0),(131,'Admin100','El usuario chef2 ha registrado su entrada','2019-05-26 02:31:55',0),(132,'Admin100','El usuario yo ha registrado su entrada','2019-05-26 02:52:14',0);
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
  `mensaje` varchar(100) NOT NULL DEFAULT 'Mensaje vacío',
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
INSERT INTO `orden` VALUES (1,'2019-03-05 04:52:39','Admin100',1,'pagada','',0.0000,0,1),(18,'2019-03-10 10:09:58','Admin100',2,'pagada','Mesa cool',8132.2002,0,1),(19,'2019-03-12 05:23:44','Admin100',1,'pagada','Mesa mÃ¡s cool aÃºn',240.0000,0,1),(20,'2019-03-17 20:09:59','admin',1,'pagada','Prueba comandas',2048.2000,0,1),(21,'2019-03-18 02:18:40','Admin100',0,'pagada','Orden chico 1',360.0000,0,1),(22,'2019-03-19 18:18:19','Admin100',2,'pagada','Orden nueva',5484.0000,0,1),(23,'2019-03-19 18:33:19','Admin100',2,'pagada','Orden mesa 2',1928.0000,0,1),(24,'2019-03-19 20:22:23','Admin100',2,'cerrada','Orden nueva',240.0000,1,1),(25,'2019-03-19 20:32:44','Admin100',0,'pagada','Lentes',240.0000,0,1),(26,'2019-03-19 20:33:17','Admin100',0,'pagada','Anillo',120.0000,0,1),(27,'2019-04-02 03:00:01','Admin100',0,'pagada','Katia',360.0000,0,1),(28,'2019-04-02 19:13:09','Admin100',0,'pagada','Orden nueva',100.0000,0,1),(29,'2019-04-16 18:26:26','Admin100',0,'pagada','Hola',323.2000,1,1),(30,'2019-04-16 18:27:09','Admin100',1,'abierta','',0.0000,0,1),(31,'2019-04-28 03:02:01','Admin100',2,'cerrada','Hola',14.0000,2,1),(32,'2019-04-28 03:17:49','Admin100',2,'cerrada','Q',0.0000,1,1),(33,'2019-05-05 21:29:51','Admin100',2,'cerrada','Prueba drive',14.0000,0,1),(34,'2019-05-05 21:42:54','Admin100',0,'cerrada','Juan',0.0000,0,1),(35,'2019-05-05 21:43:41','Admin100',0,'cerrada','juanito',0.0000,0,1),(36,'2019-05-05 21:44:18','Admin100',0,'cerrada','El queso',0.0000,0,1),(37,'2019-05-05 21:45:03','Admin100',0,'abierta','queso',0.0000,0,1),(38,'2019-05-05 21:45:17','Admin100',0,'abierta','queso',0.0000,0,1),(39,'2019-05-05 21:45:24','Admin100',0,'cerrada','yp',1200.2000,2,1),(40,'2019-05-05 21:56:19','Admin100',-1,'abierta','jej',0.0000,0,1),(41,'2019-05-05 21:56:53','Admin100',-1,'abierta','jj',0.0000,1,1),(42,'2019-05-20 01:35:37','admin',0,'cerrada','jjajaj',0.0000,0,1);
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
INSERT INTO `platillo` VALUES (1,'Hamburguesa Ranch',100.2,'1','Uma delisia','����\0JFIF\0\0\0\0\0\0��\0,Photoshop 3.0\08BIM�\0\0\0\0\0\0H3\0\0\0GL�\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0]l\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0��JZ3@	E.i(\0��4f�\nJZ3@	E.h�\0%��4\0�R��QK�3@	E.h�\0%��4\0�R��QK�3@	E.h�\0��f��\\њ\0J)sFh(�����4f��\\њ\0J)sFh(�����4f��\\њ\0))h���4f��\\њ\0J)sFh(�����4f��\\њ\0J)sFh(�����4f�\n(���\\њ\0J)sFh(�����4f��(�������\0�)����Z�U��[i6\\�Fލ����U�6�Γ�W��F�9��n�dH��|��|r<Y���ѐ��W�ڲ���쭜U�1\\���D:�����\\?��?�_!?���Z�rOvz�x�Tn�/ǽ?d��Ϯ>���O��Q����O��W���FE9���I��|FD�\0=��B�ׂd#���/���<z���%\0�\0�Eh[��_�`��\\�?��ɅϪwZ]¾i����(:��G�G?ζ-�0��L��\0�(��\\��+ƭ�2�`,��O�X���?��\\��Y��\0u�\n�NHw=*��Xx�@�����_�����t$���*ZhX��������QE\0�Q@(�PEP�1E\0b�QE\0�Q@(�P�1E\0b�QE\0�Q@(�P�1E\0QE\0b�QE\0�Q@(�P�1E\0b�QE\0�Q@(�P�1E\0b�QE\0QE\0�Q@(�P�1E\0b�QE\0%��\0�P�.v�l8}�i�8�ǡ�MU�F�\0x����}1�#�Y.�N�[8�{W?��Zx�P{�@P��$l9V�=�{�6�b�gE�ys唑�<�\\�Ѯ��Eqm���·V��i,�rT6C��b�ml`���|Aʤ���$�;t����2G?(ܫ��&���KH�،6��u\0�=�\0�4�J+h׺g��������h���UK���ok�.�)4xSJ��oY�����wI�=F?�o���M<��sƅ����\0��H<q�J�v��I=+�KiW���V����]p}�\0~j��4qr�	\\�1L6o��K!d�sڳ���R��:\n��㼦@I#�f�+���p�Ϣ\\8-Y�\'8�Fm&D��&\0.v�LF���P����[\"X��!y�<Ӭ�c[����o#�t��������l���ք�s���0���kW�,�ca��\"�������\'��M8ڞU� �F;�T���K����.�	�\0M?�w\Z_ō�*�n��S�\n𩬎3Ӹ�f�\'�\'q#5�����Ň�t�EA���\\����HH����:�Ÿ9]\n�!�]��K_��*��\"����f�vϩ�f�CK��B�Yǿ�S��}�PG�Νn���.��J�g �훇�!q�^o�#_�I�h�!W�M2�R��!.��!�����Q����r��)/m��\0Y<I��T��&���R�>�/�ׇ���˷��{�pZ�/]�@]2׹�o�\r��d����8������\0�ۿ�W���c8mQ�7?Ҽ��?2|�*0w.,�E��Ѷ-՟�xڶ����!�%�������o]�\0݅�­i^<�5��mc5Ē����>�Ƽ�\"��J�����]n�:ZĐ���\0(�4��j+c�YCt4�k�fp3Z�r�$��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0����\0���J�kU{����&�n��ۙ�����������O��~��:ŧ��=k�u�8��ʁ�He�zV�}��t��������3�R閗r�,RO�Ǒ�x ����\Z���{�����h[[��;	 z֢cV�^%��k��b5.[?\\�5�<_�����89���\0�[,A��GaB�D�һF�㸭�� X�0~W��W;ǖ0rC�ц���V9��d�ր����A>e��zֵ��Ӏ|ݳ��[T�7*b�I�c�RX�<��E�#��5HGe��|�we�ͤ�~@�/�Mӌ�6��y�*������:�&&�3񗅿���PHǒ�+2�p�נ5����\Z[`�F�\Zo�!K�)b+��l�O_I��7\'t$�\'�����j\Z�k(�-Ɍ�;b�I�giM� ��y%�\\L&�����\Z��H�Sdg>b	���MpW:v\0fi��:�VT�{�lRy�Y���g���g���Rj�>��>����.y�ΒY�hq�z�ù�x����z�4����o���[�YS-\Zo��5.�9@��;�#�P�4D푂�g�t�eR�>��;��,���x��\Z)2;{�G,������to>�1����Y�\"�`���#�ޤ$\\��\nV.3qz�g�i��V3��tKt�Jғ�N����)o�@�!���Ү�.�����\0�>���~3�i_�J��uG�b����\Z:UX�ju�LѾ�����!�s +V݂�����徵����]o{i^��UY~b��\'���O��!.b�:t�VRfu\ZkB8,��&�����ȭk9v�+^+eL`T���|�8��`P�@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@%-%\0-5�F)�P�j��Ěa���<gp���V��z�;W#�Y�N)�`<�#i\"#�8��}�Y7ap÷��u+g{6����R�Kü}3�[����r�\\�=�����\\�+]��}i�ƃ���v�$e4n�2\0\n:�iy��+���V�����98�Ӡr�����&�x���lc%G$��ʣ��8d=>��kk�,���5����!W|�s�{K��cv�͎�\r*��X�\\)bp3�~UK�yg/	.3���Mu xЫ��2W�4����Kv�Y�u�F�e;��#�=i��m�-�n%�_E�z���\\�\"��.\0���s\n��$���m=H�$Ms>��Z������X�ٷ�A?L��uo&O�m\0u\0��s�j��,�D`	7��{g�{�>\'���z�r;��j\\�������3F$?.��T��dåa2�r�����M��%3��g���kM�1�����En��F>bNC��j�#}�t��\0y���V}Ǉ��,�����$��]$�iV?8�;\Z�� Y\0%F75+�#ϵ�jU`�y�ҹ]C������^�-�2���	�;V6��%�dy[s�9��6<��9v�I�5�\'pC^���9s��s^w�i��H�ЁQ$Rf���ɦ݉��������\0��Ь<w��:��ȳ����1+�cg?��2:��jh5)����5��r�}��j�^�G*��;����G��ī�%�ZFh���?ʽ�¿��Y9��x��7ù���v���due=<U�����QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0f�J\0Z(��\Z�\"�u+]�x���hé�6�4�7�׃�ҹVF����2�Z�\rV� �+��t֑K�ĩ�}���+��0Ub8n�騩 /��j���|�y����yr7.2zհ.£�2�C��<j��rq�Ң��!�2��ǐOJ�T\\���s� \r6\"/��1�_ΑdU���G��\'?�XGkn����fٻL?vYIl��`5�co!�b1����G�I�g�<����7��� `�\0c�k)�e��u\\2������Z����X���Z��f������$nMe�I�MJ�u<`���V���P�L67Q��}�[�l�/�$x��R��0�@#ܚڴ����������O�\\�\0*�n��K�e1��_�{כ��C� }��H��P�v���x�m2�$\r�у�>������A�ڲ+�	 �����yr�6�u8?�hi�&�tiRD�I��G�Bm\nǺ̾T��N����1�zu�{p�TX�?J�|;�7L�%Kmi�b1�8I���;8u�V�\\�B\n9�\0�V�D�f� �U���Qޭ%�a�.H��𦮟wo#���Ć�>i��Fj�+�v��o�`SJ���J�0���s���H�c�v��y�2n���~$�\\u�W[���H6d�L��تޙ�99�MA����%��:���~0��2GR69�5��iV�w\rin۞ <�X�I�v���d�g�D+\"�.	�ȯf��[��\'b��q���ʅs��Մ�4�;})-�絔2H�Ev�n�kd�E.%�E.�qX70,�L��`���Ȩt�ԥ#���OGtG��yV5�~\Z���kq������z��8ں3�/_j�����@�HU��q��\\��+��d0#\Z�k�	|Z�t����`�U��t��4�zky�da���5��C:�*$�8�RR�E\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0RR�P�E\0RR�@.`���5K+�a��ͽ�!�<w_�f��`���Q�H،���ڕ�R~^+���_-̑��O�ְ��`d�j���X��\0�6�>׺&+��ڢ���nW�֕ ��ݍ�u�,�y.I$�8���|)p�pG�^�M	~�{�J��&;s�Ni0-�Ա� �F	=���izd�����5l܅����1��`^ݍS^�Đ �����ʄ3���)c���?{7���#��Tz��,2\\F�p�\0VT��O�4�J}�;\08ȫ6@��lt\'�gԭ˶�⣏8���29�[�;;�%܃u���E^�#ppEj�*=�U;\n�FFr��&y����uŨʐNƹ�-���^�n���@��Ӟ��5#c6�m�1����8Y��ϵi�{���%c��mAɷ�����Is��3Y�ÒpiXt����_��actxh�?#f���H�����v$��ھXed�������\0�]˷7/=�80Lr��_�Qp��4%�o5G\\�ӷɆ�\0��}�����^%�2�4q\\�-6}1�u���(U@}�f�HM<��T��<ڡ41�2r�pi�q#F�0y����A!�1�\"��2���@#�����t=&�͸$�òk�ؠ�p��O�#B�X��t���\"�IҼ;��CS�]��r���Ҹ;KY�D7,�\"C�c�w5�ڎ��f-�\0���{���]E�H�J����\Z/*�J�$�&Ǖ][M7��.��٥!V�u9b��4�gin񕹸9+��]x^-������w#��.	�g�<~S�Z�>�u�N���Nx5B[X�ˈ.@;��n����a�~���X�Ş��/���v��\'���^���6��Ky�E�<�¾2��!�����h>0��fW��L�8&UϬ���uy��~$Y�\"]8�^��^��L���Ў��Mn2���KH�(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(����\0(��\0);��w����\\\Zu��YS�\\v�`0�˕<^�,a�ajV�8�<sQ�k	vH3}���TJd|�\"�T�VH�)({W����?S��,���>��g}Z�,ܦG*��D���n\\b���x�e��ԑ�C#0v�OP޵c�t�\0�f�NOj紸�G��9299�s����ҵ��ImL���H�~�`��B0p��� g�p	@p\"�J��\0V��u���aQ�n�VeN��H֗>r���+���M��`�u��;{��@�0�h^=�%�����E���>��3ږ�	%��/�ީ��ܴ�ŕ��A\"\"A�ҵe��q�W���o$J%��2*��c��|&�D�!�\n���9e@ܸ9�W�!��\ZR�g�nA���X]7�M����0)s�b�$g��)n�oƽj_�3Bt�B��㊨�	ӄ��/���������$����8d�\0�~u��6�<�k��,��������6֊�*��=µ���T��W�\0�\0?�em.\"uho��8ǡ&�J�(E\'9縫֢[u�����p�1G����Ф\'c<md m �A��T������.�����L^Y��ӊ�bl,�O+�1�mC�imYd�GF��[*bm�#v\0�Ì�j�i�:��r\'�i�G�o���x�9A��N:�޸�r��X��nVh�r!����>��-���W���w�k��g��Ɔ#\Z�F-��Xթ�5��2X��kl�I�`�Ԛ�>�M�\ZK�	9:��]<��\ZӼ�h���mFH�gZ�`�υ��S��s#����SQ[��ym�y�`P����i����ߎ�>v�k�m?�!�	O�����S��kg!��٥(Xi��������פ�_�ƜR9_|}���/��D/��etnI����s��|��\n�Q]KL��D�E�����B>��OZ�@��~��Yl�U��ϯO��z6��CP�����Q�Q�-�U��\0x{�2���\\���^ca�H��d[;�ǂ�.A���|S��X�cܨ��.-fz��r�[���\\\n[?���O�C�ϟf� *l���+2�RY���U�d���Wb�8��\"j(�\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0RR�P�E\0Rw���@EPP�u�T����Zp`H�_��#�T�W�KpF+P�C@� �4F�!�3�;�G��(Ǹ�T��(��OT�6���Fz��it\Z9e�l�㧷jԁ��W#���Il�Ǩ�+X�����6�#݌1U���WC\r�B?�0}i�gn�>�7�X�2��{ք1��\nG#5m�\"L��Zb��>_�U�gِ��s�qJcd;B�l��l�7dN)�9E\"��(���rI튕l�s�6����V#�2\'<S�ո�JWc!{uA��\0c���-61g#�_�S2�89��l{\r%&\r>�J6Z��q��q�eL\n�ONqM�πTgګK\0�܄V�H��]�y�f�{����Z��J�)N0����p6�x*y��\0Hf9�9�T��A��$cim��íhĖ�#&��+���`�D�R{�G���3�;P+T��$xxVO�{\Z��q\\��ic^�3�U�o�dFf\nO�jǘ&Lgp>�\\D�w䀲�$C���,�+F�1xX��G���$�;�X��xإ	�b��ƹ�춍棋���X|��|_���o��������+���V2&C�q�:��6�UB�J�Ɯj5��O����R��N���d*=�K�,�@UJ��`���ש��MK��p���D�X��k���uH�i�)$��`���}�uR���qQ\\�i>�2ɻ<�f�O$׀�¤�;�8J�֤m6k}$��B��x�X���k�t�R�1����\Z��B���3��62��s�S��[���S�Nkk����3���9����ň1��=�c%b�4�\'{k���m���v�ni��z���r�1�����]��s��Ȫ򇵝d���U�P�q�G��y;�A��P\n��i�]t��O��*�m���p��j�sz�8?+�G�\0��j�㿝��ä�p���XI4m)�\Z�s;���Qc��&�4�<`V�0��I�0�KIK@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@%-%\0-Q@\'zZ(\0��(\0��(\0���:⥢�0����W+}���^��t����O����$v�\0^�Vl3�>L�GS޽\n�\0M*N��KJ[�s�H:8>�q�p*�^�k��{֤dJ��`~����ʝ~n���ڧ��p��w���.��/#�g�ڭGx�1^1�����s�R��n�܁����e�:���c,�ӽQf�����r:�ʎ\\�h5j9�\\ɤ��\\.���?&��E|�Q�?�j\Z\Ze���N)�s���r94���:R�b�aС\\��j��\n���x�H�?�Kһ��j��b���8���Ǡ��2J�S�Jە�����2�%��b0*ԉ�F�V��6���;\ryU�}OJ�ΜAޠ��U��H_x���{�ǡY^��W�\\dZ�\\*�c�1��^S�5���=\rni�ڤ�}�u&�X�.f����=)t��ؿݐ�O�a�\0l��^1�\0�Z�ңǽ�jHM���h��ʞ����6��=�o��F�����^i!Y0y�jB���PP��������\Z�<.5�uY&m��ƌ�f���wY���\r�]U���{��gm��yW	�~0~���vz�ҟL�J�I���#;��q�y��Z.�zlb��C}�W�jб|����W�x��gI�l�_2 �Id�޸�]]G-M�|�,�n5R���e����o}e�2�28j��%�x�?�6�]�z�������;ǧ\\z�;��J6ύ�!�s�j\\4\Z���z�:\'g��uZ�|5��~��Ȇ�Ms������	�;�d������\0׫zf�q���yF\rYJ7-3�\r��X���G\"�R;�2+eNG������3ɚ[�,`Ko�Kqꧺ����v��S��IT2�cXJ6e\ZtRȥ�EPEPEPEPEPEPEPEPEPEPEPEPEPIKF(\0��(\0����@EPEPEPMesN��3���E<W7��$\n��U��d�\0��KKK�^)T�=��{�q��\"��x�dg&9�}���}��u\r/9 W\'�i1\\B�Ox۷���5Q���-�l�=E[[�e!����Z>��럴�9�y�}}�4�_��������ktʱ�%�*O9�!�\\~5��1ܧ�Gp��\0����2�9U�+������.\"��Tt�InK|�����\0��ը���׵gƎnZW��.iX\rm�W�=��k!ne\'ڧK���9�q�����;������Ԃb;���F���)�J�U!�ޜ����:�x?w<�]4{:�Қ�p>���\Z�`�1��T�63�aIdA���U�J�����ø�[���܃vGOJϚU�(�2=��ũK�o*J����<L�Rw�5ʴ	,n���r����Z�D����M0��\Z~��\\�p1����u��Wb��zb���Ta.Ý�\0^+^�T~r�s���h�m���y߼�FE:���B߽��Hn�}�\Zƀ*�z�үP�y�i��F���g%����U��5����W[-tm1KZ;2e�����������t�˧ܛ�E�m|��%}�Tf�KW<CY��$����!�������M4K-�J�[*Oٯ]������-&gD������ǵY�n|D�~VЯ�J8���D�\n0��/�Kp�8���ڛ}`m��D�����������H��X�4(<�c�{���̷7$�g�sJq@��P{����\"r�x#�E{���km��Ej�J�ʼSE��Ԭ���2���u>�B���N����pk	B��&}�k8u�VA�|��|W�,4ĸ��\"��8lyO��񍏊����8x�#r�¹�Z,�(�+��@QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0���\0�QE\0��i;��E\0QE\0QE\0QE\0QEЇ���t������2�`��_����\"Fa�k�<[�	=�����4�>��5��O�^��p�)�`�>}�<Yq`��R�<��}k������I��U���X/qn���¿����ei��R���m�M9�iq���c�}kE!�b� ��{�R7s�U��$��sf��نxq��ʄ��R:�����fh�pA�ya�q���ŕ���S�̨�a�>����-Ҝ0�8\'���;�>�7���\0kHT��V#��3P���(8��$����؜��I\n�{�j�jU�g�����׭&HbA�Uç�HҲ��+�Ȕ�U)�Im����\\A�$�d�h\'�h��`g��c�	����ִ$T�����8�dm�sT�0([�;�l��괗���OCW\Z�(�\n=y�o�n}���2���Һ�������x�a�G䎼u�<�嬌���u��\'�N֋�ǫ麓�O��[�	�[���p��Myn����3e۹���V�v�?A҅!r���_)���G>���֪Ze��>�n�m=Da�ެ��pK{��nP-�N�Â>��H��_��2XJ�R�+y�\0:��+�l�5q|^]H�kc��yr:潍o���\\�f��o�_�T�Ɲ�۴R*�Jx+�~��d��4y���O���;p|�d<?�\\��g\\�y6N�q�^�q�F�oʱ[Z�Ĺ��\0׮Z�M�Yd���.�E=@��S\\���.9汘��ta�^���Wm/\\Y�[6�\r�g��������;Y\"g�����J�}�Զ����#+g\0����-�4�>ɰ�Y�Hl�3Z`�W��o⤖�f��|��6�+�C^��_\Z��)��Ĉ@�,�d~U���gWEF��)\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0RR�P�E\0Rw���\n(��\n(��\n(��\n(��\n(��\n(��#x�V]枲�[�\\�\0�/����k\n�OY��%t<a�k�\'�YⱮt�Đ(��O��p� ����ot�{љ��:�k���9���A��p<��B��%�[Ϗ���Wz˕ �\'px�G���ݬ��.�&�:7q�թ���J��9�����V��\'0HO�-�5�sk5��$L=�V�I����+7n+9w1��Wmݩ�u�p�w�:u�<�x�Jpp@�֕���x�qR4�.*���D���})XH~J_��⩇!��v�>R;Qa�~ӐqQ����Z�%�0z�S����Vɓs���֫	8�^�e�H�{�U]��Z�2��0��P;�*��1��ʦ����5Ѳ���;Gip��e��;\Zն�<�0GS�cJI\0�\n�&�22��;�[�޲��]:��TN:\Z�mBx�]��e�2H��;f�V�w�-�8b�l=*�@���0�?2u��=�����\rΤ�ղnH��zb�;	�.	�܈�3c������t����\'���[!,��%%��^�\0QQ�d�o6��:9�ֵR\"Ǟ�\ZU�R�m�6v5����4��ʊW�`��Y�4��:�5��$���R��45p8�n�\"T�\0�WQ�mb}W�R�]�!���y+��ڹ��&��e��1Q�_<2�q��Vmt)_�z�:��7PH)Wr��C�_2�c�����d��	�#=��|��|S!m�F�M��c(4Q��P�0q���\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0������(\0��N�\0�QE\0QE\0QE\0QE\0QE\0QE\0QE\0!�\Z�j}���M{d#��PEƜ��u�u��^@5��ڀ<��Le��Y�Y�e��\"�kqҲ�t�r@�7��`rY��GJȹ��`�\n}V��Ie\'嬹l]J�6���,�>\\c�A#:�G\"�{�2��D7xpk\Z���I0I��[�֭Mu9{�3rCI-������)cWp$���Qo��\rQ/f�)�p\r�^h��@�G4��>@��9���\'9\\��&��\0{{�.^�1�I���P��E�rB����Mw\'�<T�s���5�G�&�ñ5]��A-�q�7qҘ�\0��H�^��E ez�����ܼ-�\'�]��bU��sc��Q�T�\'���khYC7\'�5�%�[�)S��<��t��3򱫰k����=+�	C4=��/Ҧ���.-A�Ӹ�N�Ŭ�2�㎵������O�x�~��JV&���������p�ZW�t�Y�\\�q^�g��L�@lo�*�Q\\���J.$`�H��\03�\0ק�Ǜ�3C)W� �sֺ?�SiڌW�d�&��<,pڪjZP�Ah|�\'���QF��Ϩe5.=����<G���u	+�3��5�G e��4�j60:���:�K��޽[���	\'u���$�cs�6D��5��b֧�斪�8�qVE@EPEPEPEPEPEPEPEPEPI�ZJ\0Z(��\nN����h��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0LSZ0{S�\nr٫���4�l����B��s���JʟLe��^��+�Jm=\\t�RٷFPG��q��K��c�x�G���赕q��i�`<����)�L�n���,%��xY~��&m5�����fpAPG�*�F<�K~r��S0�:��ww\Z=���[I�V]ǇI�PG���V����,��P3���ˍ�wBH�Nk*kL1GcUq˓�M5��z��A��F<�i�\nŰ��iC&��\Z�����HV!�EIa�Q�G+Sc\\X�j~o���E�Hc\n=EB�I�ޝ������:cڝ��j�0摁�P�7��hiP0� �R�\\��S�&�I$��A�i���EE���1ӽ����\n���=\rhGxo��-�G��\\\Z�����VR���\'��\n�,z4~[�Y�.�?�I�?:��O$W\r$t���x��2˺>�kj�S���\0��/��h8q���+5��5�/�z�?�U�\'Z��X��x��)T���\rz��Z~�dRܥ�]6��\"���o��Yݹ�����$�Rj�{��|o�^i��=�(D�R=I��L֬u[:��+���h�\"�@[��\"o�q��~doZ�o�^)���Y-�Q� �7\0ݰޞƱ�;j�L����N��K� ��A�YZ(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\nJZJ\0Z(��\nN���\0�QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0���\0aE#�C%��j�E\0eM��g���s����P��O���-g˥���נ5��aU�V(���ױ�w\Z|sM?�˚�)t�`~Z�6�AE��{�\r�ɝ��1�G�k���f��K��\0=t�����3�e�bɞ*����z�t�\0��wjt\rV\"wǃ�N3]��F� `�g�A�!�6p�NkE+���<�M3P��-�P3T\Z5Js�^�4�{��S�H�¤��[�rZd�6��\Z��M�8#���4�n�rw�¶�9�yU?�U[�D�Z���s�NT�\0�\n��\nKI|�H��%�,�\Z��%pҟ���t;��T:���aKI�������r2���c�Sv��8�{M>{�L[gi3��q�h�x[S��D�3��\'�sB�̄v�*�Ĳq��*ѻxdh��m���������yV�;ɣFfD����������=�]��!I>FA���!S�(�`+�����P�������ƻ3�\Z~���Ia�����6��2A�w�����}�9ԭ$\Z�y�\rEw�ʆ6﷯�?�y����4����<�ڢ��6��0Y���\'&�;�ڔKooL4d��u���X�~\'�T&���\\F�)�������k��/��/�;UrA����kȵ-Iբil�L2�Q�����\0�/�U�x$���_�4�@���r�W��O�Ɵ�Z�G��!~`��W��j�[��8x�eXw�\Zkr��R�Z@QE\0QE\0RdS^EE%�\0�{P�3�\\���A��(�7R����?^��j�\0u9�\r6�T�\ZS��\0�~���Ǵ�S����,����v�US�f�iԼk�\rA�q�]>��G*��[K�uOɾ0 p�JNW(C�����N���yo�(��։}0���Y�����/�t�9w^���ʪ�v�	l�-�H���ܥº�;Թ��ܻ��ی���&��(\0��N�\0�QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0b�(\n�L1)�(�\n�Z+v�˽-YO�[��@Ú\0�o��\\Υ���W����^�wd�)⹝CL ���c�g��;A`�Ѓ�V<2.\"����\"���q������kf��m�z��P��J����NWVcn��R6���Mniq+��V��Q���$��\0��=\r1���w�٩��Qɥ�tP��6HQ���ͽ\rvm���N��P�v�<��H��p���#�e���v�E�Q������TcF>�\\7�|)g�bI7�p��>�w��?[@ᦼ�@v��+է��v�%��i�0<�Q��-�}>g�@��&c��RkƐ�5��Ps��{��c(���kIK��9� ��uj�Ac�\'�.\Z�I5�Ȍ3�^Edˣ�Wv��?gl\rrzρ�on\Z�վ�3��t�_j�V��X�(����٣�j���(/1k���x�?\Z� �),�һ���0?>k�׼/>��E�[d`��QکJ,E�Fi���,]Tn�_ƺ�\0|L��,�XL����_q�\\3�ZK���^��\0֫�ym1�n��P�ϧt�h��Q���\'�8Uf�����]\nH�u��T�h	�O2�<�+�|\r�N;[H��nYS���@�n�\0�f��g��Ĳ�>�{o���Z���q��e��H�͎�����R�K�ϧ�Qf\\H^������h�y/#�5�:��TUh�-�x\\r��y���mk�w^m�쳐r��>�qMA�=����=�i�ٹĭ���A�^u�x�[�$���A��)��ӿ���5o\Z*rx����q܅�{�n:g�{�9�QHf���v \0�8�\0?J¿�����Z�w8H�����4�̗����@�#mT��+���!���ؚ�O�)?�_A��7a�e�\r�����d��-������}����R5\n�`*�\0�V�\r!f������E�1�����ֵ�������WR^ֶ>P����8(-\0-Q@\'zZN�\0�QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0#.j�Ū�:U�B3@�敻8Z�\Z[,�;�r���\\��2��f���A���%M�PHE-\0݃4m�(3=�<���h�\n�l�ڢ�\nzU�(2}=Xt��4p[�t��4Ƨ�\0s\r�\r�+6�I`xZ�K���#v�\0�?��i�R���\"���GAT�4�l�hͤ�l���m�����+X�=��L�`Z��c%�v�+�eѺ�U��Q�i���xEσ��$yc�8S�\'�°\r�G1YP���q���k^��x��i��=ͼJ/�������5j}�c���o�FRz�<\Z��$o�2�<�袴�bEx��n~���M��h\'W�9�h-�vg�w`^hV0�\0x�z���Z��y^x�\0�S���n�Q`L�u����=3U%Ԥ��Ď��P����lW]����:���Bm-Hr�۰��\rأ����\0���Q����*�\0T�����H��.G\r�����i�!VM�Ac���׎@8���@	�R�E\0���\0�QE\0��i;��E\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0SJN��\"0��P�f�ڭ�@w\ZZ6p��j\Zw��8��#���-C!�>f�������Ǟ�����y�j��-�\\�b2�d\Z��-��t�]F5%�\'����q^wl���ڤe�*胺N���;��-�~⎃����ƙ�6�^��}qm(TĜppx�vi�#�c� ;UI�b��]J����\0��о\r���Zںm�����y��������v�?��A�����]�8�yl�V\\Et��@��0lA�h� QE\0QE\0���\0�QE\0QIހ�(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(���&�5b�\"�M\0y���ϷxgS��03/����U�u��\0�#�}m�@X�s�|��ٝ7Z��)��f@�\'�\\�K0PX`VV���<\n� ݑ�V��t���@FQ����O`��ц������DϫMz�g���[�q�]��!c��Q���IH)h\0��(\0��(\0��J\0Z(��\nN����h��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0)�-��E�ۊ���v���-�a��>S�}���B=њ���Q�I��綗���\0�N;��n�i9�}k��Ob%���Ȋϫ��qB\'n:}ϵzw�O�� ʀc�V������Q��=\"< 5���h��\0(��\0(��\0))i(h��\0);��w���(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(��nC\\���Դ��6\\���^߭z$�*k��cI�@%��&!Wk�T���߄�RLcl����ZGa��Nx@�@=\0��&���~ݪ��?�o��oT��c�k[���,��~��:\n��(��(��(�����?��',4,'Rapida'),(3,'caviar',123,'2','Uma delisiosa','',1,'Bebidas'),(4,'pizza',120,'1','pizza',NULL,1,'Rapida'),(6,'Sopa du macaco',100,'5','Uma delisia',NULL,1,'Sopas'),(9,'Sprite',14,'1','Sprite 500ml',NULL,1,'Bebidas');
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
INSERT INTO `usuario` VALUES ('admin','Ù€‡€­£0Å\0µ\'¶ôo6','Uma delisia','','',0,'','administrador',2893,NULL,'0000-00-00 00:00:00'),('Admin100','ª\\èkŠÉ+E¨ƒ h4“','Ivan','Lopez','Murillo',331472010,'Admin100','admin',2994,10999,'2019-05-05 20:44:59'),('Admin123','úÃ§´#qk,eƒ}r¾hX','Luis','','',3323857013,'','administrador',936,NULL,NULL),('chef1',']\r^pÜÎÆ^Ç²v˜@v','Chef','','',0,'','empleado',9425,26976,'0000-00-00 00:00:00'),('chef2','ªñÿÌþyÆþEŸ‹£Ñ','Chef 2','','',0,'','empleado',2056,NULL,'2019-05-05 22:21:43'),('DAADSDA','øÙ¿¸ö}€ÿb‚ 3µ}','','','',0,'','administrador',1872,NULL,'0000-00-00 00:00:00'),('IVX','œw·{bÝþiWƒ·®P@M',' ',NULL,NULL,NULL,NULL,'administrador',3423,NULL,'0000-00-00 00:00:00');
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
