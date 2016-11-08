-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.71-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema teveo
--

CREATE DATABASE IF NOT EXISTS teveo;
USE teveo;

--
-- Definition of table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre del cliente',
  `apellido` varchar(100) NOT NULL COMMENT 'Apellido del Cliente',
  `telefono` varchar(50) NOT NULL COMMENT 'Telefono del Cliente',
  `direccion` varchar(250) NOT NULL COMMENT 'Direccion del Cliente',
  `habilitado` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Indica si el cliente tiene habilitado el servicio',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--

/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


--
-- Definition of table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `ci` int(10) unsigned NOT NULL,
  `identificador` varchar(45) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `identificadorequipo` varchar(45) NOT NULL,
  `rolid` int(10) unsigned NOT NULL,
  `password` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `habilitado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`identificador`) USING BTREE,
  UNIQUE KEY `UC_empleado` (`ci`,`identificador`) USING BTREE,
  KEY `FK_empleado_rol` (`rolid`),
  KEY `FK_empleado_equipo` (`identificadorequipo`),
  CONSTRAINT `FK_empleado_equipo` FOREIGN KEY (`identificadorequipo`) REFERENCES `equipo` (`identificador`),
  CONSTRAINT `FK_empleado_rol` FOREIGN KEY (`rolid`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `empleado`
--

/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;


--
-- Definition of table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
CREATE TABLE `equipo` (
  `identificador` varchar(45) NOT NULL,
  `supervisorid` varchar(45) NOT NULL,
  `cuotadiaslaborales` int(10) unsigned NOT NULL,
  `cuotasabado` int(10) unsigned DEFAULT NULL,
  `cuotadomingo` int(10) unsigned DEFAULT NULL,
  `cuotaferiado` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`identificador`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipo`
--

/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;


--
-- Definition of table `equipohabilidad`
--

DROP TABLE IF EXISTS `equipohabilidad`;
CREATE TABLE `equipohabilidad` (
  `habilidadid` int(10) unsigned NOT NULL,
  `identificadorequipo` varchar(45) NOT NULL,
  PRIMARY KEY (`habilidadid`,`identificadorequipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipohabilidad`
--

/*!40000 ALTER TABLE `equipohabilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipohabilidad` ENABLE KEYS */;


--
-- Definition of table `habilidad`
--

DROP TABLE IF EXISTS `habilidad`;
CREATE TABLE `habilidad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `habilitado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `habilidad`
--

/*!40000 ALTER TABLE `habilidad` DISABLE KEYS */;
INSERT INTO `habilidad` (`id`,`nombre`,`habilitado`) VALUES 
 (1,'IN0 : instalación',1),
 (2,'RP0: reparación',1),
 (3,'RC0: recambio',1),
 (4,'MT0: mantenimiento',1),
 (5,'TE0: trabajo especial',1),
 (6,'IN1: instalación especial',1),
 (7,'RP1: reparación especial',1);
/*!40000 ALTER TABLE `habilidad` ENABLE KEYS */;


--
-- Definition of table `ordendetrabajo`
--

DROP TABLE IF EXISTS `ordendetrabajo`;
CREATE TABLE `ordendetrabajo` (
  `numero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipoorden` char(1) NOT NULL,
  `tipotareaid` int(10) unsigned NOT NULL,
  `fecha` datetime NOT NULL,
  `prioridad` int(10) unsigned NOT NULL,
  `sistemaomisor` varchar(45) NOT NULL,
  `tipoproductoid` int(10) unsigned NOT NULL,
  `fechacreacion` datetime NOT NULL,
  `identificadorempleado` varchar(45) NOT NULL,
  `fechadistribucion` datetime NOT NULL,
  `fechaprevista` datetime NOT NULL,
  `identificadorequipo` varchar(45) NOT NULL,
  `fechacancelacion` datetime NOT NULL,
  `clienteid` int(10) unsigned NOT NULL,
  `fechadespacho` datetime NOT NULL,
  `comentariosupervisor` varchar(250) NOT NULL,
  `equipodespacho` varchar(45) NOT NULL,
  `fechacierre` datetime NOT NULL,
  `cometariocierre` varchar(250) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `FK_ordendetrabajo_tipotarea` (`tipotareaid`),
  KEY `FK_ordendetrabajo_tipoproducto` (`tipoproductoid`),
  KEY `FK_ordendetrabajo_empleado` (`identificadorempleado`),
  KEY `FK_ordendetrabajo_equipo` (`identificadorequipo`),
  KEY `FK_ordendetrabajo_cliente` (`clienteid`),
  CONSTRAINT `FK_ordendetrabajo_cliente` FOREIGN KEY (`clienteid`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FK_ordendetrabajo_empleado` FOREIGN KEY (`identificadorempleado`) REFERENCES `empleado` (`identificador`),
  CONSTRAINT `FK_ordendetrabajo_equipo` FOREIGN KEY (`identificadorequipo`) REFERENCES `equipo` (`identificador`),
  CONSTRAINT `FK_ordendetrabajo_tipoproducto` FOREIGN KEY (`tipoproductoid`) REFERENCES `tipoproducto` (`id`),
  CONSTRAINT `FK_ordendetrabajo_tipotarea` FOREIGN KEY (`tipotareaid`) REFERENCES `tipotarea` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordendetrabajo`
--

/*!40000 ALTER TABLE `ordendetrabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordendetrabajo` ENABLE KEYS */;


--
-- Definition of table `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `habilitado` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rol`
--

/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`id`,`nombre`,`habilitado`) VALUES 
 (1,'Admin',1),
 (2,'Comercial',1),
 (3,'Supervisor',1),
 (4,'Equipo',1);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;


--
-- Definition of table `tipoproducto`
--

DROP TABLE IF EXISTS `tipoproducto`;
CREATE TABLE `tipoproducto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `habilitado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipoproducto`
--

/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
INSERT INTO `tipoproducto` (`id`,`nombre`,`habilitado`) VALUES 
 (1,'Sistema video vigilancia SVV',1),
 (2,'Sistema video nocturna SVN',1),
 (3,'Cámaras sensor movimiento CSM',1),
 (4,'Cámaras IP remotas CIP',1),
 (5,'Sistema filmación plus SFP',1),
 (6,'Sistema control niños SCN',1),
 (7,'Sistema control ancianos SCA',1);
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;


--
-- Definition of table `tipoproductohabilidad`
--

DROP TABLE IF EXISTS `tipoproductohabilidad`;
CREATE TABLE `tipoproductohabilidad` (
  `habilidadid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipoproductoid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`habilidadid`,`tipoproductoid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipoproductohabilidad`
--

/*!40000 ALTER TABLE `tipoproductohabilidad` DISABLE KEYS */;
INSERT INTO `tipoproductohabilidad` (`habilidadid`,`tipoproductoid`) VALUES 
 (1,1),
 (1,2),
 (1,3),
 (2,1),
 (2,2),
 (2,3),
 (2,5),
 (2,6),
 (2,7),
 (5,3),
 (5,6),
 (5,7),
 (6,2),
 (6,4),
 (6,5),
 (7,4),
 (7,5);
/*!40000 ALTER TABLE `tipoproductohabilidad` ENABLE KEYS */;


--
-- Definition of table `tipotarea`
--

DROP TABLE IF EXISTS `tipotarea`;
CREATE TABLE `tipotarea` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre de la tarea',
  `habilitado` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Indica si la tarea esta habilitada',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipotarea`
--

/*!40000 ALTER TABLE `tipotarea` DISABLE KEYS */;
INSERT INTO `tipotarea` (`id`,`nombre`,`habilitado`) VALUES 
 (1,'Instalar',1),
 (2,'Reparación',1),
 (3,'Recambio-RC0',1),
 (4,'Mantenimiento-MT0',1);
/*!40000 ALTER TABLE `tipotarea` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
