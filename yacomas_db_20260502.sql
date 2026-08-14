-- MySQL dump 10.13  Distrib 5.5.62, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: yacomas_db
-- ------------------------------------------------------
-- Server version	5.5.62-0ubuntu0.14.04.1

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(15) NOT NULL DEFAULT '',
  `passwd` varchar(32) NOT NULL DEFAULT '',
  `nombrep` varchar(50) NOT NULL DEFAULT '',
  `apellidos` varchar(50) NOT NULL DEFAULT '',
  `mail` varchar(100) NOT NULL DEFAULT '',
  `id_tadmin` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`login`,`id_tadmin`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','Administrador','Principal','admin-fsl@glo.org.mx',10),(2,'claude','49ef4f481acdc1fd5f2affc173437902','Claude','Bot','claude@devnull.com',13);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistente`
--

DROP TABLE IF EXISTS `asistente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(15) NOT NULL DEFAULT '',
  `passwd` varchar(32) NOT NULL DEFAULT '',
  `nombrep` varchar(50) NOT NULL DEFAULT '',
  `apellidos` varchar(50) NOT NULL DEFAULT '',
  `sexo` char(1) NOT NULL DEFAULT '',
  `mail` varchar(100) NOT NULL DEFAULT '',
  `ciudad` varchar(100) DEFAULT NULL,
  `org` varchar(100) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `asistencia` tinyint(4) DEFAULT '0',
  `reg_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `act_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_estudios` int(10) unsigned NOT NULL DEFAULT '0',
  `id_tasistente` int(10) unsigned NOT NULL DEFAULT '0',
  `id_estado` int(10) unsigned NOT NULL DEFAULT '0',
  `id_pago` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`login`,`id_estudios`,`id_tasistente`,`id_estado`,`id_pago`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistente`
--

LOCK TABLES `asistente` WRITE;
/*!40000 ALTER TABLE `asistente` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'Registro ponentes',1),(2,'Registro asistentes',1),(3,'Registro ponencias',1),(4,'Inscripcion talleres',1);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuesta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
INSERT INTO `encuesta` VALUES (1,'Que taller o tutorial te gustaria que se repitiera ?');
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta_opc`
--

DROP TABLE IF EXISTS `encuesta_opc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuesta_opc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_encuesta` int(10) NOT NULL DEFAULT '0',
  `opcion` varchar(80) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta_opc`
--

LOCK TABLES `encuesta_opc` WRITE;
/*!40000 ALTER TABLE `encuesta_opc` DISABLE KEYS */;
INSERT INTO `encuesta_opc` VALUES (1,1,'Gentoo Linux: La Metadistribución'),(2,1,'Libera la voz del pingüino: VoIP con Linux'),(3,1,'Implementacion de firewall linux mediante iptables'),(4,1,'Elementos de Programación en Ruby'),(5,1,'Revisando el Correo por la web'),(6,1,'Programación con hilos en Java'),(7,1,'Desarrollo de sitios web dinamicos utilizando PHP y MySQL'),(8,1,'Primeros pasos con Perl.'),(9,1,'Desarrollo de aplicaciones de escritorio usando GTK+Glade+MySQL'),(10,1,'Técnicas para generar y manipular sitios dinámicos en Perl');
/*!40000 ALTER TABLE `encuesta_opc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta_voto`
--

DROP TABLE IF EXISTS `encuesta_voto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuesta_voto` (
  `id_encuesta` int(10) NOT NULL DEFAULT '0',
  `id_opcion` int(10) NOT NULL DEFAULT '0',
  `id_asistente` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_encuesta`,`id_opcion`,`id_asistente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta_voto`
--

LOCK TABLES `encuesta_voto` WRITE;
/*!40000 ALTER TABLE `encuesta_voto` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta_voto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Aguascalientes'),(2,'Baja California'),(3,'Baja California Sur'),(4,'Campeche'),(5,'Chiapas'),(6,'Chihuahua'),(7,'Coahuila'),(8,'Colima'),(9,'Distrito Federal'),(10,'Durango'),(11,'Guanajuato'),(12,'Guerrero'),(13,'Hidalgo'),(14,'Jalisco'),(15,'M&eacute;xico'),(16,'Michoac&aacute;n'),(17,'Morelos'),(18,'Nayarit'),(19,'Nuevo Le&oacute;n'),(20,'Oaxaca'),(21,'Puebla'),(22,'Quer&eacute;taro'),(23,'Quintana Roo'),(24,'San Luis Potos&iacute;'),(25,'Sinaloa'),(26,'Sonora'),(27,'Tabasco'),(28,'Tamaulipas'),(29,'Tlaxcala'),(30,'Veracruz'),(31,'Yucat&aacute;n'),(32,'Zacatecas'),(33,'Fuera de M&eacute;xico');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudios`
--

DROP TABLE IF EXISTS `estudios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudios`
--

LOCK TABLES `estudios` WRITE;
/*!40000 ALTER TABLE `estudios` DISABLE KEYS */;
INSERT INTO `estudios` VALUES (1,'Ninguno'),(2,'T&eacute;cnico'),(3,'Licenciatura'),(4,'Maestr&iacute;a'),(5,'Doctorado'),(6,'Otro');
/*!40000 ALTER TABLE `estudios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_propuesta` int(10) unsigned NOT NULL DEFAULT '0',
  `id_administrador` int(10) unsigned NOT NULL DEFAULT '0',
  `reg_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `act_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`id_propuesta`,`id_administrador`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_ocupa`
--

DROP TABLE IF EXISTS `evento_ocupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento_ocupa` (
  `id_evento` int(4) NOT NULL DEFAULT '0',
  `hora` tinyint(4) NOT NULL DEFAULT '0',
  `id_fecha` int(11) NOT NULL DEFAULT '0',
  `id_lugar` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hora`,`id_fecha`,`id_lugar`,`id_evento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_ocupa`
--

LOCK TABLES `evento_ocupa` WRITE;
/*!40000 ALTER TABLE `evento_ocupa` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento_ocupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rfc` varchar(13) NOT NULL DEFAULT '',
  `razonsocial` varchar(255) NOT NULL DEFAULT '',
  `direccion` varchar(255) NOT NULL DEFAULT '',
  `colonia` varchar(255) NOT NULL DEFAULT '',
  `telefono` varchar(12) NOT NULL DEFAULT '',
  `cp` varchar(10) NOT NULL DEFAULT '',
  `ciudad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fecha_evento`
--

DROP TABLE IF EXISTS `fecha_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fecha_evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `descr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fecha_evento`
--

LOCK TABLES `fecha_evento` WRITE;
/*!40000 ALTER TABLE `fecha_evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `fecha_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospedajep`
--

DROP TABLE IF EXISTS `hospedajep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospedajep` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pago` int(10) unsigned NOT NULL DEFAULT '0',
  `id_thospedaje` int(10) unsigned NOT NULL DEFAULT '0',
  `no_personas` int(10) unsigned NOT NULL DEFAULT '0',
  `no_noches` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospedajep`
--

LOCK TABLES `hospedajep` WRITE;
/*!40000 ALTER TABLE `hospedajep` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospedajep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscribe`
--

DROP TABLE IF EXISTS `inscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscribe` (
  `id_asistente` int(10) unsigned NOT NULL DEFAULT '0',
  `id_evento` int(10) unsigned NOT NULL DEFAULT '0',
  `reg_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `act_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_asistente`,`id_evento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscribe`
--

LOCK TABLES `inscribe` WRITE;
/*!40000 ALTER TABLE `inscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcionp`
--

DROP TABLE IF EXISTS `inscripcionp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripcionp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pago` int(10) unsigned NOT NULL DEFAULT '0',
  `id_tcuota` int(10) unsigned NOT NULL DEFAULT '0',
  `no_personas` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcionp`
--

LOCK TABLES `inscripcionp` WRITE;
/*!40000 ALTER TABLE `inscripcionp` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripcionp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugar`
--

DROP TABLE IF EXISTS `lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lugar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cupo` int(11) NOT NULL DEFAULT '99999',
  `nombre_lug` varchar(100) NOT NULL DEFAULT '',
  `ubicacion` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugar`
--

LOCK TABLES `lugar` WRITE;
/*!40000 ALTER TABLE `lugar` DISABLE KEYS */;
INSERT INTO `lugar` VALUES (1,99999,'SALA1','Edificio1'),(2,99999,'SALA2','Edifico1'),(3,20,'TALLER1','Edificio1'),(4,20,'TALLER2','Edifico1');
/*!40000 ALTER TABLE `lugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orientacion`
--

DROP TABLE IF EXISTS `orientacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orientacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orientacion`
--

LOCK TABLES `orientacion` WRITE;
/*!40000 ALTER TABLE `orientacion` DISABLE KEYS */;
INSERT INTO `orientacion` VALUES (1,'Empresas y Negocios'),(2,'Principiantes'),(3,'Comunidad y Filosofia'),(4,'Desarrollo de Software'),(5,'Administracion y Seguridad'),(6,'Aplicaciones y Usuarios'),(7,'Sociedad y Gobierno'),(8,'Investigacion con Software Libre'),(9,'Creacion de Contenido'),(10,'Otro');
/*!40000 ALTER TABLE `orientacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_responsable` int(10) unsigned NOT NULL DEFAULT '0',
  `id_factura` int(10) unsigned NOT NULL DEFAULT '0',
  `tpago` varchar(10) NOT NULL DEFAULT 'Efectivo',
  `no_voucher` varchar(15) NOT NULL DEFAULT '',
  `monto_cuotas` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `monto_hospedaje` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `monto_neto` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `porc_descuento` tinyint(4) DEFAULT '0',
  `fecha_pago` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pagado` tinyint(4) DEFAULT '0',
  `comentarios` text,
  `act_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ponente`
--

DROP TABLE IF EXISTS `ponente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ponente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(15) NOT NULL DEFAULT '',
  `passwd` varchar(32) NOT NULL DEFAULT '',
  `nombrep` varchar(50) NOT NULL DEFAULT '',
  `apellidos` varchar(50) NOT NULL DEFAULT '',
  `sexo` char(1) NOT NULL DEFAULT '',
  `mail` varchar(100) NOT NULL DEFAULT '',
  `ciudad` varchar(100) DEFAULT NULL,
  `org` varchar(100) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `resume` text,
  `domicilio` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) NOT NULL DEFAULT '',
  `fecha_nac` date DEFAULT NULL,
  `reg_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `act_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_estudios` int(10) unsigned NOT NULL DEFAULT '0',
  `id_estado` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`login`,`id_estudios`,`id_estado`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ponente`
--

LOCK TABLES `ponente` WRITE;
/*!40000 ALTER TABLE `ponente` DISABLE KEYS */;
INSERT INTO `ponente` VALUES (1,'ponente1','5f4dcc3b5aa765d61d8327deb882cf99','Ponente','Numero 1','M','ponente@test.com','','','','soy ponente1','','','2009-01-01','2025-12-09 18:41:55','2025-12-09 18:41:55',1,1),(2,'magistral1','e4fc15799ce506aef322de2bbd1d1450','Ponente','Magistral','F','m@null.com','','','','','','','0000-00-00','2026-04-15 01:37:34','2026-04-15 01:37:34',5,33);
/*!40000 ALTER TABLE `ponente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prop_nivel`
--

DROP TABLE IF EXISTS `prop_nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prop_nivel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prop_nivel`
--

LOCK TABLES `prop_nivel` WRITE;
/*!40000 ALTER TABLE `prop_nivel` DISABLE KEYS */;
INSERT INTO `prop_nivel` VALUES (1,'Basico'),(2,'Intermedio'),(3,'Avanzado');
/*!40000 ALTER TABLE `prop_nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prop_status`
--

DROP TABLE IF EXISTS `prop_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prop_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prop_status`
--

LOCK TABLES `prop_status` WRITE;
/*!40000 ALTER TABLE `prop_status` DISABLE KEYS */;
INSERT INTO `prop_status` VALUES (1,'Nueva'),(2,'Detalles requeridos'),(3,'Rechazada'),(4,'Por Aceptar'),(5,'Aceptada'),(6,'Cancelada'),(7,'Eliminada'),(8,'Programada');
/*!40000 ALTER TABLE `prop_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prop_tipo`
--

DROP TABLE IF EXISTS `prop_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prop_tipo` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `descr` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prop_tipo`
--

LOCK TABLES `prop_tipo` WRITE;
/*!40000 ALTER TABLE `prop_tipo` DISABLE KEYS */;
INSERT INTO `prop_tipo` VALUES (1,'Conferencia'),(50,'Taller'),(51,'Tutorial'),(100,'Conferencia Magistral'),(2,'Platica Informal'),(101,'Evento organizacion');
/*!40000 ALTER TABLE `prop_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propuesta`
--

DROP TABLE IF EXISTS `propuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propuesta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL DEFAULT '',
  `id_nivel` int(10) NOT NULL DEFAULT '0',
  `duracion` int(10) unsigned NOT NULL DEFAULT '0',
  `resumen` text NOT NULL,
  `reqtecnicos` text,
  `reqasistente` text,
  `id_ponente` int(10) unsigned NOT NULL DEFAULT '0',
  `id_prop_tipo` int(10) unsigned NOT NULL DEFAULT '0',
  `id_administrador` int(10) unsigned NOT NULL DEFAULT '0',
  `id_orientacion` int(10) unsigned NOT NULL DEFAULT '0',
  `id_status` int(10) unsigned NOT NULL DEFAULT '1',
  `reg_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `act_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nombreFile` varchar(100) DEFAULT NULL,
  `tipoFile` varchar(25) DEFAULT NULL,
  `dirFile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_ponente`,`id_administrador`,`id_orientacion`,`id_status`,`id_prop_tipo`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propuesta`
--

LOCK TABLES `propuesta` WRITE;
/*!40000 ALTER TABLE `propuesta` DISABLE KEYS */;
INSERT INTO `propuesta` VALUES (1,'Ponente1 Ponencia1',1,1,'bla bla bla ponente1 ponencia1','','',1,1,0,1,1,'2025-12-09 18:42:48','2025-12-09 18:42:48','Omarchy Hotkeys Cheat Sheet.pdf','application/pdf','/var/www/html/yacomas/documentos/ponente1-Omarchy Hotkeys Cheat Sheet.pdf'),(2,'Ponente1 Taller1',1,4,'Ponente1 Taller1 bla bla bla','','',1,50,0,2,1,'2025-12-09 19:16:32','2025-12-09 19:16:32','qwen3-coder-30a3-main.jpg','image/jpeg','/var/www/html/yacomas/documentos/ponente1-qwen3-coder-30a3-main.jpg'),(3,'Ponente1 Tutorial1',2,2,'Ponente1 Tutorial1 \r\nTest test test','','',1,51,0,4,1,'2025-12-09 19:17:44','2025-12-09 19:17:44',NULL,NULL,NULL),(4,'Ponente1 PlaticaInformal1',3,1,'Ponente1 PlaticaInformal1\r\nbla bla bla bla','','',1,2,0,7,1,'2025-12-09 19:18:30','2025-12-09 19:18:30',NULL,NULL,NULL);
/*!40000 ALTER TABLE `propuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tadmin`
--

DROP TABLE IF EXISTS `tadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tadmin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` varchar(100) DEFAULT NULL,
  `tareas` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tadmin`
--

LOCK TABLES `tadmin` WRITE;
/*!40000 ALTER TABLE `tadmin` DISABLE KEYS */;
INSERT INTO `tadmin` VALUES (10,'Total',NULL),(20,'Parcial',NULL),(30,'Evaluador',NULL),(40,'Registro',NULL),(50,'Caja',NULL),(13,'Ponencias y Ponentes',NULL);
/*!40000 ALTER TABLE `tadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasistente`
--

DROP TABLE IF EXISTS `tasistente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasistente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasistente`
--

LOCK TABLES `tasistente` WRITE;
/*!40000 ALTER TABLE `tasistente` DISABLE KEYS */;
INSERT INTO `tasistente` VALUES (1,'Estudiante/Docente/Academico UdG'),(2,'Estudiante/Docente/Academico Otra Universidad'),(3,'Publico General');
/*!40000 ALTER TABLE `tasistente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcuota`
--

DROP TABLE IF EXISTS `tcuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcuota` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` varchar(100) DEFAULT NULL,
  `costo` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcuota`
--

LOCK TABLES `tcuota` WRITE;
/*!40000 ALTER TABLE `tcuota` DISABLE KEYS */;
INSERT INTO `tcuota` VALUES (1,'Estudiantes/Docentes/Personal UdG A-15 Oct',100.00),(2,'Estudiantes/Docentes/Personal UdG D-15 Oct',150.00),(3,'Estudiantes/Docentes Otra Universidad A-15 Oct',150.00),(4,'Estudiantes/Docentes Otra Universidad D-15 Oct',200.00),(5,'Publico General A-15 Oct',250.00),(6,'Publico General D-15 Oct',300.00),(7,'Inscripcion de Cortesia',0.00);
/*!40000 ALTER TABLE `tcuota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thospedaje`
--

DROP TABLE IF EXISTS `thospedaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thospedaje` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descr` varchar(100) DEFAULT NULL,
  `costo` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thospedaje`
--

LOCK TABLES `thospedaje` WRITE;
/*!40000 ALTER TABLE `thospedaje` DISABLE KEYS */;
INSERT INTO `thospedaje` VALUES (1,'Sencilla Plan Americano',1166.66),(2,'Sencilla Todo Incluido',1266.66),(3,'Doble Plan Americano',600.00),(4,'Doble Todo Incluido',883.33),(5,'Triple Plan Americano',533.33),(6,'Triple Todo Incluido',800.00),(7,'Cuadruple Plan Americano',500.00),(8,'Cuadruple Todo Incluido',750.00),(9,'Menor c/cargo (edad 6-12) Todo Incluido',400.00),(10,'Menor c/cargo (edad 6-12) Plan Americano',240.00);
/*!40000 ALTER TABLE `thospedaje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-02 19:08:25
