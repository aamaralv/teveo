
-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 23, 2016 at 05:33 AM
-- Server version: 5.1.57
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `a3042567_bd`
--

CREATE DATABASE IF NOT EXISTS teveo;
USE teveo;

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre del cliente',
  `apellido` varchar(100) NOT NULL COMMENT 'Apellido del Cliente',
  `telefono` varchar(50) NOT NULL COMMENT 'Telefono del Cliente',
  `direccion` varchar(250) NOT NULL COMMENT 'Direccion del Cliente',
  `habilitado` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Indica si el cliente tiene habilitado el servicio',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cliente`
--


-- --------------------------------------------------------

--
-- Table structure for table `cuotaexcepcional`
--

CREATE TABLE `cuotaexcepcional` (
  `equipo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_cambio` date NOT NULL,
  `usuario_cambio` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fecha_aplicacion` date NOT NULL,
  `cuota` tinyint(4) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `cuotaexcepcional`
--

INSERT INTO `cuotaexcepcional` VALUES('Ea03320010', '2016-11-18', 'administrador', '2016-11-21', 8);
INSERT INTO `cuotaexcepcional` VALUES('Ea03320010', '2016-11-18', 'administrador', '2016-11-22', 0);

-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

CREATE TABLE `departamento` (
  `id` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `NombreDepto` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `departamento`
--

INSERT INTO `departamento` VALUES('01', 'Montevideo');
INSERT INTO `departamento` VALUES('02', 'Artigas');
INSERT INTO `departamento` VALUES('03', 'Canelones');
INSERT INTO `departamento` VALUES('04', 'Cerro Largo');
INSERT INTO `departamento` VALUES('05', 'Colonia');
INSERT INTO `departamento` VALUES('06', 'Durazno');
INSERT INTO `departamento` VALUES('07', 'Flores');
INSERT INTO `departamento` VALUES('08', 'Florida');
INSERT INTO `departamento` VALUES('09', 'Lavalleja');
INSERT INTO `departamento` VALUES('10', 'Maldonado');
INSERT INTO `departamento` VALUES('11', 'Paysandú');
INSERT INTO `departamento` VALUES('12', 'Río Negro');
INSERT INTO `departamento` VALUES('13', 'Rivera');
INSERT INTO `departamento` VALUES('14', 'Rocha');
INSERT INTO `departamento` VALUES('15', 'Salto');
INSERT INTO `departamento` VALUES('16', 'San José');
INSERT INTO `departamento` VALUES('17', 'Soriano');
INSERT INTO `departamento` VALUES('18', 'Tacuarembó');
INSERT INTO `departamento` VALUES('19', 'Treinta y Tres');

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

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
  PRIMARY KEY (`ci`,`identificador`) USING BTREE,
  KEY `FK_empleado_rol` (`rolid`),
  KEY `FK_empleado_equipo` (`identificadorequipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` VALUES(444444, 'exxxx1', 'admin', '1111', 'xxx1', 1, 'admin', 'admin', 1);
INSERT INTO `empleado` VALUES(77777, 'dddxxx', 'toto', '1234', 'xxx1', 1, 'admin2', 'admin2', 1);
INSERT INTO `empleado` VALUES(99887744, 'zzzxx1', 'aaa', '22333', 'xxx1', 2, 'ddd', 'ddd', 1);
INSERT INTO `empleado` VALUES(55555, 'sdddd', 'fffff', '3333', 'xxx1', 2, 'xxxxx', 'xxxx', 1);

-- --------------------------------------------------------

--
-- Table structure for table `equipo`
--

CREATE TABLE `equipo` (
  `codigodeequipo` varchar(10) NOT NULL,
  `supervisor` varchar(10) NOT NULL,
  `cuotadiaslaborales` int(10) unsigned NOT NULL,
  `cuotasabado` int(10) unsigned DEFAULT NULL,
  `cuotadomingo` int(10) unsigned DEFAULT NULL,
  `cuotaferiado` int(10) unsigned DEFAULT NULL,
  `habilidades` int(11) NOT NULL,
  `codigozona` varchar(6) NOT NULL,
  PRIMARY KEY (`codigodeequipo`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipo`
--

INSERT INTO `equipo` VALUES('Ea03221001', 'Sa03221001', 10, 5, 0, 3, 2, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221002', 'Sa03221001', 10, 5, 0, 3, 3, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221003', 'Sa03221001', 10, 5, 0, 0, 5, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221004', 'Sa03221001', 5, 5, 0, 0, 7, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221005', 'Sa03221001', 10, 5, 1, 3, 11, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221006', 'Sa03221001', 10, 8, 0, 3, 13, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221007', 'Sa03221001', 2, 5, 0, 0, 17, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221008', 'Sa03221001', 15, 5, 0, 3, 19, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221009', 'Sa03221001', 10, 5, 1, 0, 26, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221010', 'Sa03221001', 10, 5, 0, 3, 38, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221011', 'Sa03221001', 8, 5, 0, 3, 2, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221012', 'Sa03221001', 10, 5, 2, 0, 3, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221013', 'Sa03221001', 12, 5, 0, 3, 5, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221014', 'Sa03221001', 10, 7, 0, 3, 7, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221015', 'Sa03221002', 10, 5, 0, 3, 11, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221016', 'Sa03221002', 10, 5, 0, 0, 13, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221017', 'Sa03221001', 9, 8, 0, 0, 2, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221018', 'Sa03221001', 10, 5, 0, 3, 3, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221019', 'Sa03221001', 10, 5, 0, 0, 5, 'a03221');
INSERT INTO `equipo` VALUES('Ea03221020', 'Sa03221003', 10, 5, 3, 3, 7, 'a03221');
INSERT INTO `equipo` VALUES('Ea03321001', 'Sa03321001', 5, 5, 0, 0, 2, 'a03321');
INSERT INTO `equipo` VALUES('Ea03321002', 'Sa03321001', 10, 5, 0, 3, 3, 'a03321');
INSERT INTO `equipo` VALUES('Ea03321003', 'Sa03321001', 10, 9, 0, 3, 5, 'a03321');
INSERT INTO `equipo` VALUES('Ea03321004', 'Sa03321001', 3, 5, 0, 3, 7, 'a03321');
INSERT INTO `equipo` VALUES('Ea03321005', 'Sa03321001', 10, 5, 0, 3, 11, 'a03321');
INSERT INTO `equipo` VALUES('Ea03321006', 'Sa03321001', 10, 5, 0, 0, 13, 'a03321');
INSERT INTO `equipo` VALUES('Ea03321007', 'Sa03321001', 4, 5, 0, 3, 17, 'a03321');
INSERT INTO `equipo` VALUES('Ea03321008', 'Sa03321001', 10, 5, 0, 0, 19, 'a03321');
INSERT INTO `equipo` VALUES('Ea03321009', 'Sa03321001', 10, 5, 3, 0, 26, 'a03321');
INSERT INTO `equipo` VALUES('Ea03321010', 'Sa03321001', 4, 3, 0, 0, 38, 'a03321');
INSERT INTO `equipo` VALUES('Ea03320001', 'Sa03320001', 10, 1, 0, 3, 2, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320002', 'Sa03320001', 10, 5, 0, 0, 3, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320003', 'Sa03320001', 8, 5, 0, 3, 5, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320004', 'Sa03320001', 10, 5, 0, 0, 7, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320005', 'Sa03320001', 6, 2, 0, 3, 11, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320006', 'Sa03320001', 10, 5, 0, 0, 13, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320007', 'Sa03320001', 10, 5, 1, 0, 17, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320008', 'Sa03320001', 10, 6, 0, 0, 19, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320009', 'Sa03320001', 10, 5, 0, 0, 26, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320010', 'Sa03320001', 10, 5, 0, 0, 38, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320011', 'Sa03320001', 10, 5, 0, 0, 2, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320012', 'Sa03320001', 9, 5, 0, 3, 3, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320013', 'Sa03320001', 10, 5, 0, 0, 5, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320014', 'Sa03320001', 10, 5, 0, 3, 7, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320015', 'Sa03320001', 10, 5, 0, 0, 11, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320016', 'Sa03320001', 10, 5, 0, 3, 13, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320017', 'Sa03320001', 3, 5, 2, 3, 2, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320018', 'Sa03320001', 10, 5, 0, 0, 3, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320019', 'Sa03320001', 10, 5, 0, 3, 5, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320020', 'Sa03320001', 10, 5, 0, 0, 7, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320021', 'Sa03320001', 7, 5, 0, 3, 2, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320022', 'Sa03320001', 10, 4, 0, 3, 3, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320023', 'Sa03320001', 10, 5, 0, 3, 5, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320024', 'Sa03320001', 10, 5, 0, 0, 7, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320025', 'Sa03320001', 10, 5, 2, 3, 11, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320026', 'Sa03320002', 10, 2, 0, 3, 13, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320027', 'Sa03320002', 10, 5, 0, 3, 17, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320028', 'Sa03320002', 8, 1, 0, 3, 19, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320029', 'Sa03320002', 10, 5, 0, 0, 26, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320030', 'Sa03320002', 10, 5, 0, 3, 38, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320031', 'Sa03320002', 10, 5, 1, 0, 2, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320032', 'Sa03320002', 10, 5, 0, 3, 3, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320033', 'Sa03320002', 5, 5, 0, 3, 5, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320034', 'Sa03320002', 10, 5, 0, 3, 7, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320035', 'Sa03320002', 10, 5, 0, 3, 11, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320036', 'Sa03320003', 10, 5, 1, 0, 13, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320037', 'Sa03320003', 10, 5, 0, 3, 2, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320038', 'Sa03320003', 10, 5, 0, 0, 3, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320039', 'Sa03320004', 4, 5, 0, 3, 5, 'a03320');
INSERT INTO `equipo` VALUES('Ea03320040', 'Sa03320004', 10, 5, 0, 0, 7, 'a03320');

-- --------------------------------------------------------

--
-- Table structure for table `equipohabilidad`
--

CREATE TABLE `equipohabilidad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `habilidadid` int(10) unsigned NOT NULL,
  `equipoid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `equipohabilidad`
--


-- --------------------------------------------------------

--
-- Table structure for table `equiposbloqueados`
--

CREATE TABLE `equiposbloqueados` (
  `equipo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  UNIQUE KEY `equipo` (`equipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `equiposbloqueados`
--


-- --------------------------------------------------------

--
-- Table structure for table `feriados`
--

CREATE TABLE `feriados` (
  `fecha` date NOT NULL,
  `descripcion` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `feriados`
--

INSERT INTO `feriados` VALUES('2016-12-25', 'Navidad 2016');
INSERT INTO `feriados` VALUES('2016-11-25', 'Mi feriado');

-- --------------------------------------------------------

--
-- Table structure for table `grupos`
--

CREATE TABLE `grupos` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de registro',
  `grupo` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del grupo',
  `descripcionGrupo` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Descripción del grupo',
  PRIMARY KEY (`idGrupo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Tabla que registra los distintos grupos de usuarios que exis' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `grupos`
--

INSERT INTO `grupos` VALUES(1, 'administradores', 'Grupo de administradores del sistema, tienen control total sobre todo el sistema');
INSERT INTO `grupos` VALUES(2, 'supervisores', 'Supervisores encargados de organizar los equipos y el trabajo');
INSERT INTO `grupos` VALUES(3, 'vendedores', NULL);
INSERT INTO `grupos` VALUES(4, 'tecnicos', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `habilidad`
--

CREATE TABLE `habilidad` (
  `id` int(11) NOT NULL,
  `codigo` varchar(3) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `peso` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `habilidad`
--

INSERT INTO `habilidad` VALUES(1, 'IN0', 'instalación', 2);
INSERT INTO `habilidad` VALUES(2, 'RP0', 'reparación', 3);
INSERT INTO `habilidad` VALUES(3, 'RC0', 'recambio', 5);
INSERT INTO `habilidad` VALUES(4, 'MT0', 'mantenimiento', 7);
INSERT INTO `habilidad` VALUES(5, 'TE0', 'trabajo especial', 11);
INSERT INTO `habilidad` VALUES(6, 'IN1', 'instalación especial', 13);
INSERT INTO `habilidad` VALUES(7, 'RP1', 'reparación especial', 17);
INSERT INTO `habilidad` VALUES(8, 'TE1', 'reparación delicada', 19);

-- --------------------------------------------------------

--
-- Table structure for table `localidad`
--

CREATE TABLE `localidad` (
  `id` varchar(6) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `idDepartamento` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `NombreLocalidad` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `localidad`
--

INSERT INTO `localidad` VALUES('a01020', '01', 'Montevideo');
INSERT INTO `localidad` VALUES('a01900', '01', 'Rural');
INSERT INTO `localidad` VALUES('a02220', '02', 'Artigas');
INSERT INTO `localidad` VALUES('a02521', '02', 'Bella Uni');
INSERT INTO `localidad` VALUES('a02522', '02', 'Tom');
INSERT INTO `localidad` VALUES('a02621', '02', 'Baltasar Brum');
INSERT INTO `localidad` VALUES('a02721', '02', 'Bernab');
INSERT INTO `localidad` VALUES('a02724', '02', 'Franquia');
INSERT INTO `localidad` VALUES('a02725', '02', 'Sequeira');
INSERT INTO `localidad` VALUES('a02822', '02', 'Coronado');
INSERT INTO `localidad` VALUES('a02823', '02', 'Cuareim');
INSERT INTO `localidad` VALUES('a02824', '02', 'Cuar');
INSERT INTO `localidad` VALUES('a02826', '02', 'Javier de Viana');
INSERT INTO `localidad` VALUES('a02827', '02', 'La Bolsa');
INSERT INTO `localidad` VALUES('a02828', '02', 'Las Piedras');
INSERT INTO `localidad` VALUES('a02830', '02', 'Pintadito');
INSERT INTO `localidad` VALUES('a02831', '02', 'Port. de Hierro y Campod');
INSERT INTO `localidad` VALUES('a02833', '02', 'Mones Quintela');
INSERT INTO `localidad` VALUES('a02900', '02', 'Rural');
INSERT INTO `localidad` VALUES('a02925', '02', 'Cainsa');
INSERT INTO `localidad` VALUES('a02927', '02', 'Paso Campamento');
INSERT INTO `localidad` VALUES('a02934', '02', 'Diego Lamas');
INSERT INTO `localidad` VALUES('a02945', '02', 'Paso Far');
INSERT INTO `localidad` VALUES('a02952', '02', 'Rinc');
INSERT INTO `localidad` VALUES('a02957', '02', 'Topador');
INSERT INTO `localidad` VALUES('a02958', '02', 'Cerro Ejido');
INSERT INTO `localidad` VALUES('a02959', '02', 'Colonia Palma');
INSERT INTO `localidad` VALUES('a02961', '02', 'Cerro Signorelli');
INSERT INTO `localidad` VALUES('a02962', '02', 'Cerro San Eugenio');
INSERT INTO `localidad` VALUES('a02963', '02', 'Caln');
INSERT INTO `localidad` VALUES('a03000', '03', 'Localidad URSEA');
INSERT INTO `localidad` VALUES('a03221', '03', 'Las Piedras');
INSERT INTO `localidad` VALUES('a03320', '03', 'Canelones');
INSERT INTO `localidad` VALUES('a03321', '03', 'La Paz');
INSERT INTO `localidad` VALUES('a03322', '03', 'Pando');
INSERT INTO `localidad` VALUES('a03323', '03', 'Santa Luc');
INSERT INTO `localidad` VALUES('a03324', '03', 'Piedras de Afilar');
INSERT INTO `localidad` VALUES('a03325', '03', 'Cumbres de Carrasco');
INSERT INTO `localidad` VALUES('a03326', '03', 'Haras del Lago');
INSERT INTO `localidad` VALUES('a03327', '03', 'Quinta Los Horneros');
INSERT INTO `localidad` VALUES('a03328', '03', 'Las Higueritas');
INSERT INTO `localidad` VALUES('a03329', '03', 'Sof');
INSERT INTO `localidad` VALUES('a03421', '03', 'Progreso');
INSERT INTO `localidad` VALUES('a03422', '03', 'San Ram');
INSERT INTO `localidad` VALUES('a03521', '03', 'Barros Blancos');
INSERT INTO `localidad` VALUES('a03523', '03', 'Colonia Nicolich');
INSERT INTO `localidad` VALUES('a03524', '03', 'Joaqu');
INSERT INTO `localidad` VALUES('a03525', '03', 'Paso Carrasco');
INSERT INTO `localidad` VALUES('a03526', '03', 'Santa Rosa');
INSERT INTO `localidad` VALUES('a03527', '03', 'Sauce');
INSERT INTO `localidad` VALUES('a03528', '03', 'Tala');
INSERT INTO `localidad` VALUES('a03529', '03', 'Villa Crespo y San Andr');
INSERT INTO `localidad` VALUES('a03530', '03', 'Fracc. Cno.del Andaluz y R.84');
INSERT INTO `localidad` VALUES('a03621', '03', 'Atl');
INSERT INTO `localidad` VALUES('a03622', '03', 'Estaci');
INSERT INTO `localidad` VALUES('a03624', '03', 'Cerrillos');
INSERT INTO `localidad` VALUES('a03625', '03', 'Empalme Olmos');
INSERT INTO `localidad` VALUES('a03626', '03', 'Migues');
INSERT INTO `localidad` VALUES('a03627', '03', 'Parque del Plata');
INSERT INTO `localidad` VALUES('a03628', '03', 'San Bautista');
INSERT INTO `localidad` VALUES('a03629', '03', 'San Jacinto');
INSERT INTO `localidad` VALUES('a03630', '03', 'Dr. Francisco Soca');
INSERT INTO `localidad` VALUES('a03631', '03', 'Toledo');
INSERT INTO `localidad` VALUES('a03632', '03', 'Montes');
INSERT INTO `localidad` VALUES('a03633', '03', 'San Jos');
INSERT INTO `localidad` VALUES('a03634', '03', 'Fracc. sobre R.74');
INSERT INTO `localidad` VALUES('a03721', '03', 'Aguas Corrientes');
INSERT INTO `localidad` VALUES('a03722', '03', 'Barra de Carrasco');
INSERT INTO `localidad` VALUES('a03723', '03', 'Juanic');
INSERT INTO `localidad` VALUES('a03724', '03', 'La Floresta');
INSERT INTO `localidad` VALUES('a03725', '03', 'Estaci');
INSERT INTO `localidad` VALUES('a03726', '03', 'Las Toscas');
INSERT INTO `localidad` VALUES('a03727', '03', 'Parque Carrasco');
INSERT INTO `localidad` VALUES('a03729', '03', 'Salinas');
INSERT INTO `localidad` VALUES('a03730', '03', 'San Antonio');
INSERT INTO `localidad` VALUES('a03731', '03', 'Aerop. Internacional de Carrasco');
INSERT INTO `localidad` VALUES('a03732', '03', 'Solymar');
INSERT INTO `localidad` VALUES('a03733', '03', 'Villa Aeroparque');
INSERT INTO `localidad` VALUES('a03823', '03', 'Castellanos');
INSERT INTO `localidad` VALUES('a03825', '03', 'Barrio C');
INSERT INTO `localidad` VALUES('a03826', '03', 'Costa Azul');
INSERT INTO `localidad` VALUES('a03827', '03', 'Costa y Guillam');
INSERT INTO `localidad` VALUES('a03828', '03', 'El Pinar');
INSERT INTO `localidad` VALUES('a03829', '03', 'Estaci');
INSERT INTO `localidad` VALUES('a03830', '03', 'Pinamar - Pinepark');
INSERT INTO `localidad` VALUES('a03831', '03', 'Lagomar');
INSERT INTO `localidad` VALUES('a03832', '03', 'Olmos');
INSERT INTO `localidad` VALUES('a03833', '03', 'Parada Cabrera');
INSERT INTO `localidad` VALUES('a03834', '03', 'San Luis');
INSERT INTO `localidad` VALUES('a03835', '03', 'Shangril');
INSERT INTO `localidad` VALUES('a03836', '03', 'Totoral del Sauce');
INSERT INTO `localidad` VALUES('a03837', '03', 'Villa Felicidad');
INSERT INTO `localidad` VALUES('a03838', '03', 'Villa Paz S.A.');
INSERT INTO `localidad` VALUES('a03839', '03', 'Villa San Jos');
INSERT INTO `localidad` VALUES('a03840', '03', 'Estaci');
INSERT INTO `localidad` VALUES('a03880', '03', 'Villa San Felipe');
INSERT INTO `localidad` VALUES('a03881', '03', 'Villa Hadita');
INSERT INTO `localidad` VALUES('a03882', '03', 'Paso de Pache');
INSERT INTO `localidad` VALUES('a03900', '03', 'Rural');
INSERT INTO `localidad` VALUES('a03910', '03', 'City Golf');
INSERT INTO `localidad` VALUES('a03911', '03', 'Viejo Molino San Bernardo');
INSERT INTO `localidad` VALUES('a03912', '03', 'Estanque de Pando');
INSERT INTO `localidad` VALUES('a03913', '03', 'Jardines de Pando');
INSERT INTO `localidad` VALUES('a03914', '03', 'Paso Espinosa');
INSERT INTO `localidad` VALUES('a03921', '03', 'Araminda');
INSERT INTO `localidad` VALUES('a03922', '03', 'Argentino');
INSERT INTO `localidad` VALUES('a03925', '03', 'Bello Horizonte');
INSERT INTO `localidad` VALUES('a03926', '03', 'Biarritz');
INSERT INTO `localidad` VALUES('a03927', '03', 'Bol');
INSERT INTO `localidad` VALUES('a03928', '03', 'Campo Militar');
INSERT INTO `localidad` VALUES('a03929', '03', 'Capilla de Cella');
INSERT INTO `localidad` VALUES('a03934', '03', 'Cruz de los Caminos');
INSERT INTO `localidad` VALUES('a03935', '03', 'Cuchilla Alta');
INSERT INTO `localidad` VALUES('a03939', '03', 'El Bosque');
INSERT INTO `localidad` VALUES('a03942', '03', 'Estaci');
INSERT INTO `localidad` VALUES('a03943', '03', 'Fort');
INSERT INTO `localidad` VALUES('a03944', '03', 'Fracc. Progreso');
INSERT INTO `localidad` VALUES('a03945', '03', 'Instituto Adventista');
INSERT INTO `localidad` VALUES('a03946', '03', 'Jaureguiberry');
INSERT INTO `localidad` VALUES('a03948', '03', 'La Lucha');
INSERT INTO `localidad` VALUES('a03949', '03', 'La Monta');
INSERT INTO `localidad` VALUES('a03953', '03', 'Lomas de Solymar');
INSERT INTO `localidad` VALUES('a03956', '03', 'Los Titanes');
INSERT INTO `localidad` VALUES('a03957', '03', 'Marindia');
INSERT INTO `localidad` VALUES('a03959', '03', 'Neptunia');
INSERT INTO `localidad` VALUES('a03962', '03', 'Paso de la Cadena');
INSERT INTO `localidad` VALUES('a03966', '03', 'Paso Palomeque');
INSERT INTO `localidad` VALUES('a03968', '03', 'Piedra del Toro');
INSERT INTO `localidad` VALUES('a03969', '03', 'Estaci');
INSERT INTO `localidad` VALUES('a03970', '03', 'El Gale');
INSERT INTO `localidad` VALUES('a03974', '03', 'Santa Ana');
INSERT INTO `localidad` VALUES('a03975', '03', 'Santa Luc');
INSERT INTO `localidad` VALUES('a03978', '03', 'Seis Hermanos');
INSERT INTO `localidad` VALUES('a03979', '03', 'Villa Arejo');
INSERT INTO `localidad` VALUES('a03980', '03', 'Villa Argentina');
INSERT INTO `localidad` VALUES('a03984', '03', 'Villa Porvenir');
INSERT INTO `localidad` VALUES('a03985', '03', 'La Tuna');
INSERT INTO `localidad` VALUES('a03986', '03', 'Guaz');
INSERT INTO `localidad` VALUES('a03987', '03', 'Colinas de Solymar');
INSERT INTO `localidad` VALUES('a03988', '03', 'Barrio Remanso');
INSERT INTO `localidad` VALUES('a03989', '03', 'Villa El Tato');
INSERT INTO `localidad` VALUES('a03990', '03', 'Villa San Cono');
INSERT INTO `localidad` VALUES('a03991', '03', 'Villa Juana');
INSERT INTO `localidad` VALUES('a03992', '03', 'Colinas de Carrasco');
INSERT INTO `localidad` VALUES('a03993', '03', 'Lomas de Carrasco');
INSERT INTO `localidad` VALUES('a03994', '03', 'Carmel');
INSERT INTO `localidad` VALUES('a03995', '03', 'La Asunci');
INSERT INTO `localidad` VALUES('a03996', '03', 'Quintas del Bosque');
INSERT INTO `localidad` VALUES('a03997', '03', 'Altos de la Tahona');
INSERT INTO `localidad` VALUES('a04220', '04', 'Melo');
INSERT INTO `localidad` VALUES('a04521', '04', 'Fraile Muerto');
INSERT INTO `localidad` VALUES('a04522', '04', 'R');
INSERT INTO `localidad` VALUES('a04621', '04', 'Tupamba');
INSERT INTO `localidad` VALUES('a04721', '04', 'Isidoro Nobl');
INSERT INTO `localidad` VALUES('a04821', '04', 'Acegu');
INSERT INTO `localidad` VALUES('a04822', '04', 'Ba');
INSERT INTO `localidad` VALUES('a04823', '04', 'Centuri');
INSERT INTO `localidad` VALUES('a04824', '04', 'Cerro de las Cuentas');
INSERT INTO `localidad` VALUES('a04825', '04', 'Hip');
INSERT INTO `localidad` VALUES('a04827', '04', 'Pl');
INSERT INTO `localidad` VALUES('a04828', '04', 'Toledo');
INSERT INTO `localidad` VALUES('a04829', '04', 'Tres Islas');
INSERT INTO `localidad` VALUES('a04830', '04', 'Poblado Uruguay');
INSERT INTO `localidad` VALUES('a04900', '04', 'Rural');
INSERT INTO `localidad` VALUES('a04923', '04', 'Arbolito');
INSERT INTO `localidad` VALUES('a04924', '04', 'Ar');
INSERT INTO `localidad` VALUES('a04930', '04', 'Caser');
INSERT INTO `localidad` VALUES('a04940', '04', 'Esperanza');
INSERT INTO `localidad` VALUES('a04943', '04', 'Getulio Vargas');
INSERT INTO `localidad` VALUES('a04948', '04', 'La Pedrera');
INSERT INTO `localidad` VALUES('a04949', '04', 'Lago Mer');
INSERT INTO `localidad` VALUES('a04952', '04', 'Mangrullo');
INSERT INTO `localidad` VALUES('a04956', '04', 'Nando');
INSERT INTO `localidad` VALUES('a04966', '04', 'Quebracho');
INSERT INTO `localidad` VALUES('a04968', '04', 'Ram');
INSERT INTO `localidad` VALUES('a04981', '04', 'Soto Goro');
INSERT INTO `localidad` VALUES('a04983', '04', 'Barrio L');
INSERT INTO `localidad` VALUES('a04987', '04', 'Barrio La Vinchuca');
INSERT INTO `localidad` VALUES('a04988', '04', 'Arachania');
INSERT INTO `localidad` VALUES('a04989', '04', '');
INSERT INTO `localidad` VALUES('a05726', '05', 'Riachuelo');
INSERT INTO `localidad` VALUES('a05727', '05', 'Juan Carlos Caseros');
INSERT INTO `localidad` VALUES('a05798', '05', 'Agraciada');
INSERT INTO `localidad` VALUES('a05821', '05', 'Boca del Rosario');
INSERT INTO `localidad` VALUES('a05824', '05', 'Cufr');
INSERT INTO `localidad` VALUES('a05826', '05', 'El Semillero');
INSERT INTO `localidad` VALUES('a05827', '05', 'Estaci');
INSERT INTO `localidad` VALUES('a05829', '05', 'Cerros de San Juan');
INSERT INTO `localidad` VALUES('a05831', '05', 'Miguelete');
INSERT INTO `localidad` VALUES('a05900', '05', 'Rural');
INSERT INTO `localidad` VALUES('a05923', '05', 'Campana');
INSERT INTO `localidad` VALUES('a05924', '05', 'Artilleros');
INSERT INTO `localidad` VALUES('a05925', '05', 'Barker');
INSERT INTO `localidad` VALUES('a05927', '05', 'El Ensue');
INSERT INTO `localidad` VALUES('a05931', '05', 'Blanca Arena');
INSERT INTO `localidad` VALUES('a05932', '05', 'Brisas del Plata');
INSERT INTO `localidad` VALUES('a05938', '05', 'Colonia Cosmopolita');
INSERT INTO `localidad` VALUES('a05940', '05', 'Paraje Minuano');
INSERT INTO `localidad` VALUES('a05951', '05', 'Los Pinos');
INSERT INTO `localidad` VALUES('a05955', '05', 'Chico Torino');
INSERT INTO `localidad` VALUES('a05956', '05', 'La Horqueta');
INSERT INTO `localidad` VALUES('a05959', '05', 'Playa Azul');
INSERT INTO `localidad` VALUES('a05960', '05', 'Playa Brit');
INSERT INTO `localidad` VALUES('a05961', '05', 'Playa Parant');
INSERT INTO `localidad` VALUES('a05962', '05', 'Playa Fomento');
INSERT INTO `localidad` VALUES('a05964', '05', 'Puerto Ingl');
INSERT INTO `localidad` VALUES('a05969', '05', 'Radial Hern');
INSERT INTO `localidad` VALUES('a05977', '05', 'San Pedro');
INSERT INTO `localidad` VALUES('a05979', '05', 'Santa Ana');
INSERT INTO `localidad` VALUES('a05980', '05', 'Santa Regina');
INSERT INTO `localidad` VALUES('a05987', '05', 'Zagarzaz');
INSERT INTO `localidad` VALUES('a05989', '05', 'Arrivillaga');
INSERT INTO `localidad` VALUES('a05993', '05', 'El Faro');
INSERT INTO `localidad` VALUES('a05994', '05', 'Laguna de los Patos');
INSERT INTO `localidad` VALUES('a05996', '05', 'Juan Jackson');
INSERT INTO `localidad` VALUES('a05997', '05', 'Pueblo Gil');
INSERT INTO `localidad` VALUES('a05998', '05', 'Cerro Carmelo');
INSERT INTO `localidad` VALUES('a05999', '05', 'El Quint');
INSERT INTO `localidad` VALUES('a05320', '05', 'Colonia del Sacramento');
INSERT INTO `localidad` VALUES('a05321', '05', 'Carmelo');
INSERT INTO `localidad` VALUES('a05323', '05', 'Juan Lacaze');
INSERT INTO `localidad` VALUES('a05421', '05', 'Nueva Helvecia');
INSERT INTO `localidad` VALUES('a05422', '05', 'Rosario');
INSERT INTO `localidad` VALUES('a05423', '05', 'Nueva Palmira');
INSERT INTO `localidad` VALUES('a05452', '05', 'Paso Antol');
INSERT INTO `localidad` VALUES('a05521', '05', 'Omb');
INSERT INTO `localidad` VALUES('a05522', '05', 'Tarariras');
INSERT INTO `localidad` VALUES('a05621', '05', 'Colonia Valdense');
INSERT INTO `localidad` VALUES('a05622', '05', 'Florencio S');
INSERT INTO `localidad` VALUES('a05721', '05', 'Conchillas');
INSERT INTO `localidad` VALUES('a05722', '05', 'Caser');
INSERT INTO `localidad` VALUES('a05724', '05', 'La Paz');
INSERT INTO `localidad` VALUES('a06220', '06', 'Durazno');
INSERT INTO `localidad` VALUES('a06421', '06', 'Sarand');
INSERT INTO `localidad` VALUES('a06521', '06', 'Carmen');
INSERT INTO `localidad` VALUES('a06621', '06', 'Blanquillo');
INSERT INTO `localidad` VALUES('a06622', '06', 'La Paloma');
INSERT INTO `localidad` VALUES('a06721', '06', 'Carlos Reyles');
INSERT INTO `localidad` VALUES('a06722', '06', 'Centenario');
INSERT INTO `localidad` VALUES('a06724', '06', 'Santa Bernardina');
INSERT INTO `localidad` VALUES('a06790', '06', 'Cerro Chato');
INSERT INTO `localidad` VALUES('a06821', '06', 'Baygorria');
INSERT INTO `localidad` VALUES('a06900', '06', 'Rural');
INSERT INTO `localidad` VALUES('a06922', '06', 'Aguas Buenas');
INSERT INTO `localidad` VALUES('a06924', '06', 'Pueblo de ');
INSERT INTO `localidad` VALUES('a06940', '06', 'Feliciano');
INSERT INTO `localidad` VALUES('a06951', '06', 'Omb');
INSERT INTO `localidad` VALUES('a06960', '06', 'Rossell y Rius');
INSERT INTO `localidad` VALUES('a06964', '06', 'San Jorge');
INSERT INTO `localidad` VALUES('a06972', '06', 'Las Palmas');
INSERT INTO `localidad` VALUES('a07320', '07', 'Trinidad');
INSERT INTO `localidad` VALUES('a07721', '07', 'Ismael Cortinas');
INSERT INTO `localidad` VALUES('a07900', '07', 'Rural');
INSERT INTO `localidad` VALUES('a07921', '07', 'Andresito');
INSERT INTO `localidad` VALUES('a07925', '07', 'Juan Jos');
INSERT INTO `localidad` VALUES('a07937', '07', 'La Casilla');
INSERT INTO `localidad` VALUES('a07938', '07', 'Cerro Colorado');
INSERT INTO `localidad` VALUES('a08220', '08', 'Florida');
INSERT INTO `localidad` VALUES('a08421', '08', 'Sarand');
INSERT INTO `localidad` VALUES('a08521', '08', 'Casup');
INSERT INTO `localidad` VALUES('a08621', '08', 'Cardal');
INSERT INTO `localidad` VALUES('a08622', '08', 'Fray Marcos');
INSERT INTO `localidad` VALUES('a08623', '08', 'Veinticinco de Agosto');
INSERT INTO `localidad` VALUES('a08624', '08', 'Veinticinco de Mayo');
INSERT INTO `localidad` VALUES('a08993', '08', 'La Macana');
INSERT INTO `localidad` VALUES('a08994', '08', 'Estaci');
INSERT INTO `localidad` VALUES('a08995', '08', 'San Gabriel');
INSERT INTO `localidad` VALUES('a08721', '08', 'Alejandro Gallinal');
INSERT INTO `localidad` VALUES('a08722', '08', 'Capilla del Sauce');
INSERT INTO `localidad` VALUES('a08723', '08', 'La Cruz');
INSERT INTO `localidad` VALUES('a08724', '08', 'Nico P');
INSERT INTO `localidad` VALUES('a08790', '08', 'Cerro Chato');
INSERT INTO `localidad` VALUES('a08821', '08', 'Chamizo');
INSERT INTO `localidad` VALUES('a08822', '08', 'Go');
INSERT INTO `localidad` VALUES('a08823', '08', 'Mendoza');
INSERT INTO `localidad` VALUES('a08824', '08', 'Mendoza Chico');
INSERT INTO `localidad` VALUES('a08825', '08', 'Reboledo');
INSERT INTO `localidad` VALUES('a08896', '08', 'Valentines');
INSERT INTO `localidad` VALUES('a08900', '08', 'Rural');
INSERT INTO `localidad` VALUES('a08923', '08', 'Berrondo');
INSERT INTO `localidad` VALUES('a08930', '08', 'Pueblo Ferrer');
INSERT INTO `localidad` VALUES('a08933', '08', 'Independencia');
INSERT INTO `localidad` VALUES('a08938', '08', 'Montecoral');
INSERT INTO `localidad` VALUES('a08940', '08', 'Pintado');
INSERT INTO `localidad` VALUES('a08941', '08', 'Polanco del Y');
INSERT INTO `localidad` VALUES('a08944', '08', 'Puntas de Maciel');
INSERT INTO `localidad` VALUES('a08991', '08', 'Illescas');
INSERT INTO `localidad` VALUES('a08992', '08', 'Caser');
INSERT INTO `localidad` VALUES('a09220', '09', 'Minas');
INSERT INTO `localidad` VALUES('a09521', '09', 'Jos');
INSERT INTO `localidad` VALUES('a09522', '09', 'Jos');
INSERT INTO `localidad` VALUES('a09621', '09', 'Mariscala');
INSERT INTO `localidad` VALUES('a09622', '09', 'Sol');
INSERT INTO `localidad` VALUES('a09721', '09', 'Piraraj');
INSERT INTO `localidad` VALUES('a09722', '09', 'Zapic');
INSERT INTO `localidad` VALUES('a09821', '09', 'Col');
INSERT INTO `localidad` VALUES('a09823', '09', 'Poblado Aramend');
INSERT INTO `localidad` VALUES('a09900', '09', 'Rural');
INSERT INTO `localidad` VALUES('a09924', '09', 'Blanes Viale');
INSERT INTO `localidad` VALUES('a09928', '09', '19 de Junio');
INSERT INTO `localidad` VALUES('a09931', '09', 'Estaci');
INSERT INTO `localidad` VALUES('a09932', '09', 'Gaet');
INSERT INTO `localidad` VALUES('a09942', '09', 'Polanco Norte');
INSERT INTO `localidad` VALUES('a09955', '09', 'Villa del Rosario');
INSERT INTO `localidad` VALUES('a09956', '09', 'Villa Serrana');
INSERT INTO `localidad` VALUES('a09957', '09', 'Barrio La Coronilla - Ancap');
INSERT INTO `localidad` VALUES('a09958', '09', 'San Francisco de las Sierras');
INSERT INTO `localidad` VALUES('a09991', '09', 'Illescas');
INSERT INTO `localidad` VALUES('a10320', '10', 'Maldonado');
INSERT INTO `localidad` VALUES('a10321', '10', 'San Carlos');
INSERT INTO `localidad` VALUES('a10521', '10', 'Aigu');
INSERT INTO `localidad` VALUES('a10522', '10', 'Pan de Az');
INSERT INTO `localidad` VALUES('a10523', '10', 'Piri');
INSERT INTO `localidad` VALUES('a10524', '10', 'Punta del Este');
INSERT INTO `localidad` VALUES('a10821', '10', 'Cerro Pelado');
INSERT INTO `localidad` VALUES('a10822', '10', 'Garz');
INSERT INTO `localidad` VALUES('a10823', '10', 'Gerona');
INSERT INTO `localidad` VALUES('a10825', '10', 'Las Flores - Estaci');
INSERT INTO `localidad` VALUES('a10826', '10', 'Los Talas');
INSERT INTO `localidad` VALUES('a10827', '10', 'Nueva Carrara');
INSERT INTO `localidad` VALUES('a10828', '10', 'Sol');
INSERT INTO `localidad` VALUES('a10829', '10', 'Pueblo Sol');
INSERT INTO `localidad` VALUES('a10830', '10', 'Pinares - Las Delicias');
INSERT INTO `localidad` VALUES('a10831', '10', 'Chihuahua');
INSERT INTO `localidad` VALUES('a10832', '10', 'Villa Delia');
INSERT INTO `localidad` VALUES('a10833', '10', 'San Rafael - El Placer');
INSERT INTO `localidad` VALUES('a10900', '10', 'Rural');
INSERT INTO `localidad` VALUES('a10924', '10', 'Barrio Hip');
INSERT INTO `localidad` VALUES('a10925', '10', 'Barrio Los Aromos');
INSERT INTO `localidad` VALUES('a10926', '10', 'Bella Vista');
INSERT INTO `localidad` VALUES('a10929', '10', 'Canteras de Marelli');
INSERT INTO `localidad` VALUES('a10931', '10', 'Cerros Azules');
INSERT INTO `localidad` VALUES('a10934', '10', 'El Chorro');
INSERT INTO `localidad` VALUES('a10935', '10', 'El Ed');
INSERT INTO `localidad` VALUES('a10936', '10', 'El Tesoro');
INSERT INTO `localidad` VALUES('a10939', '10', 'Faro Jos');
INSERT INTO `localidad` VALUES('a10940', '10', 'Gregorio Azn');
INSERT INTO `localidad` VALUES('a10942', '10', 'La Barra');
INSERT INTO `localidad` VALUES('a10944', '10', 'La Capuera');
INSERT INTO `localidad` VALUES('a10945', '10', 'Las Flores');
INSERT INTO `localidad` VALUES('a10947', '10', 'Manantiales');
INSERT INTO `localidad` VALUES('a10948', '10', 'Ocean Park');
INSERT INTO `localidad` VALUES('a10953', '10', 'Playa Grande');
INSERT INTO `localidad` VALUES('a10954', '10', 'Playa Hermosa');
INSERT INTO `localidad` VALUES('a10955', '10', 'Playa Verde');
INSERT INTO `localidad` VALUES('a10956', '10', 'Punta Ballena');
INSERT INTO `localidad` VALUES('a10958', '10', 'Punta Colorada');
INSERT INTO `localidad` VALUES('a10959', '10', 'Punta Negra');
INSERT INTO `localidad` VALUES('a10962', '10', 'Ruta 37 y 9');
INSERT INTO `localidad` VALUES('a10969', '10', 'Sauce de Portezuelo');
INSERT INTO `localidad` VALUES('a10972', '10', 'San Vicente');
INSERT INTO `localidad` VALUES('a10973', '10', 'Balneario Buenos Aires');
INSERT INTO `localidad` VALUES('a10980', '10', 'Las Cumbres');
INSERT INTO `localidad` VALUES('a10981', '10', 'Los Corchos');
INSERT INTO `localidad` VALUES('a10982', '10', 'Santa M');
INSERT INTO `localidad` VALUES('a10983', '10', 'Ed');
INSERT INTO `localidad` VALUES('a10984', '10', 'Parque Medina');
INSERT INTO `localidad` VALUES('a10985', '10', 'Arenas de Jos');
INSERT INTO `localidad` VALUES('a10986', '10', 'La Sonrisa');
INSERT INTO `localidad` VALUES('a10987', '10', 'El Quijote');
INSERT INTO `localidad` VALUES('a10988', '10', 'Laguna Blanca');
INSERT INTO `localidad` VALUES('a11120', '11', 'Paysand');
INSERT INTO `localidad` VALUES('a11521', '11', 'Guich');
INSERT INTO `localidad` VALUES('a11522', '11', 'Nuevo Paysand');
INSERT INTO `localidad` VALUES('a11621', '11', 'Quebracho');
INSERT INTO `localidad` VALUES('a11695', '11', 'Tambores');
INSERT INTO `localidad` VALUES('a11721', '11', 'Lorenzo Geyres');
INSERT INTO `localidad` VALUES('a11722', '11', 'Merinos');
INSERT INTO `localidad` VALUES('a11723', '11', 'Porvenir');
INSERT INTO `localidad` VALUES('a11821', '11', 'Arbolito');
INSERT INTO `localidad` VALUES('a11822', '11', 'Beisso');
INSERT INTO `localidad` VALUES('a11823', '11', 'Casablanca');
INSERT INTO `localidad` VALUES('a11824', '11', 'Cerro Chato');
INSERT INTO `localidad` VALUES('a11825', '11', 'Constancia');
INSERT INTO `localidad` VALUES('a11826', '11', 'Morat');
INSERT INTO `localidad` VALUES('a11827', '11', 'Piedras Coloradas');
INSERT INTO `localidad` VALUES('a11828', '11', 'Pi');
INSERT INTO `localidad` VALUES('a11830', '11', 'San F');
INSERT INTO `localidad` VALUES('a11831', '11', 'Villa Mar');
INSERT INTO `localidad` VALUES('a11894', '11', 'Piedra Sola');
INSERT INTO `localidad` VALUES('a11900', '11', 'Rural');
INSERT INTO `localidad` VALUES('a11922', '11', 'Ara');
INSERT INTO `localidad` VALUES('a11924', '11', 'Bella Vista');
INSERT INTO `localidad` VALUES('a11925', '11', 'Ca');
INSERT INTO `localidad` VALUES('a11926', '11', 'Chapicuy');
INSERT INTO `localidad` VALUES('a11929', '11', 'El Eucaliptus');
INSERT INTO `localidad` VALUES('a11931', '11', 'Esperanza');
INSERT INTO `localidad` VALUES('a11932', '11', 'Pueblo Federaci');
INSERT INTO `localidad` VALUES('a11935', '11', 'La Tentaci');
INSERT INTO `localidad` VALUES('a11937', '11', 'Orgoroso');
INSERT INTO `localidad` VALUES('a11945', '11', 'Cuchilla de Buricayup');
INSERT INTO `localidad` VALUES('a11947', '11', 'Soto');
INSERT INTO `localidad` VALUES('a11950', '11', 'Zeballos');
INSERT INTO `localidad` VALUES('a11951', '11', 'Chacras de Paysand');
INSERT INTO `localidad` VALUES('a11953', '11', 'Gallinal');
INSERT INTO `localidad` VALUES('a11954', '11', 'Puntas de Arroyo Negro');
INSERT INTO `localidad` VALUES('a11955', '11', 'Estaci');
INSERT INTO `localidad` VALUES('a11956', '11', 'Cuchilla de Fuego');
INSERT INTO `localidad` VALUES('a11957', '11', 'Pueblo Alonzo');
INSERT INTO `localidad` VALUES('a11958', '11', 'Queguayar');
INSERT INTO `localidad` VALUES('a11959', '11', 'Termas de Guaviy');
INSERT INTO `localidad` VALUES('a11960', '11', 'Termas de Almir');
INSERT INTO `localidad` VALUES('a12320', '12', 'Fray Bentos');
INSERT INTO `localidad` VALUES('a12421', '12', 'Young');
INSERT INTO `localidad` VALUES('a12621', '12', 'Nuevo Berl');
INSERT INTO `localidad` VALUES('a12622', '12', 'San Javier');
INSERT INTO `localidad` VALUES('a12722', '12', 'Barrio Anglo');
INSERT INTO `localidad` VALUES('a12723', '12', 'Grecco');
INSERT INTO `localidad` VALUES('a12792', '12', 'Merinos');
INSERT INTO `localidad` VALUES('a12797', '12', 'Algorta');
INSERT INTO `localidad` VALUES('a12821', '12', 'El Omb');
INSERT INTO `localidad` VALUES('a12823', '12', 'Paso de los Mellizos');
INSERT INTO `localidad` VALUES('a12824', '12', 'Sarand');
INSERT INTO `localidad` VALUES('a12826', '12', 'Villa General Borges');
INSERT INTO `localidad` VALUES('a12827', '12', 'Villa Mar');
INSERT INTO `localidad` VALUES('a12828', '12', 'Las Ca');
INSERT INTO `localidad` VALUES('a12900', '12', 'Rural');
INSERT INTO `localidad` VALUES('a12923', '12', 'Bellaco');
INSERT INTO `localidad` VALUES('a12930', '12', 'Los Arrayanes');
INSERT INTO `localidad` VALUES('a12932', '12', 'Menafra');
INSERT INTO `localidad` VALUES('a12945', '12', 'Tres Quintas');
INSERT INTO `localidad` VALUES('a13220', '13', 'Rivera');
INSERT INTO `localidad` VALUES('a13521', '13', 'Minas de Corrales');
INSERT INTO `localidad` VALUES('a13522', '13', 'Tranqueras');
INSERT INTO `localidad` VALUES('a13621', '13', 'Vichadero');
INSERT INTO `localidad` VALUES('a13721', '13', 'Santa Teresa');
INSERT INTO `localidad` VALUES('a13822', '13', 'Arroyo Blanco');
INSERT INTO `localidad` VALUES('a13823', '13', 'Paso Ataques');
INSERT INTO `localidad` VALUES('a13824', '13', 'Cerro Pelado');
INSERT INTO `localidad` VALUES('a13830', '13', 'Paso Hospital');
INSERT INTO `localidad` VALUES('a13831', '13', 'Lapuente');
INSERT INTO `localidad` VALUES('a13832', '13', 'Las Flores');
INSERT INTO `localidad` VALUES('a13833', '13', 'Moirones');
INSERT INTO `localidad` VALUES('a13836', '13', 'La Pedrera');
INSERT INTO `localidad` VALUES('a13837', '13', 'Mandub');
INSERT INTO `localidad` VALUES('a13838', '13', 'Lagun');
INSERT INTO `localidad` VALUES('a13900', '13', 'Rural');
INSERT INTO `localidad` VALUES('a13922', '13', 'Amarillo');
INSERT INTO `localidad` VALUES('a13929', '13', 'Cerrillada');
INSERT INTO `localidad` VALUES('a13931', '13', 'Cerros de la Calera');
INSERT INTO `localidad` VALUES('a13940', '13', 'Lagos del Norte');
INSERT INTO `localidad` VALUES('a13943', '13', 'Masoller');
INSERT INTO `localidad` VALUES('a14320', '14', 'Rocha');
INSERT INTO `localidad` VALUES('a14421', '14', 'Castillos');
INSERT INTO `localidad` VALUES('a14422', '14', 'Lascano');
INSERT INTO `localidad` VALUES('a14521', '14', 'Chuy');
INSERT INTO `localidad` VALUES('a14621', '14', 'Cebollat');
INSERT INTO `localidad` VALUES('a14622', '14', 'Vel');
INSERT INTO `localidad` VALUES('a14721', '14', '18 de Julio');
INSERT INTO `localidad` VALUES('a14722', '14', 'La Paloma');
INSERT INTO `localidad` VALUES('a14723', '14', 'San Luis al Medio');
INSERT INTO `localidad` VALUES('a14821', '14', 'La Aguada y Costa Azul');
INSERT INTO `localidad` VALUES('a14822', '14', 'Diecinueve de Abril');
INSERT INTO `localidad` VALUES('a14823', '14', 'La Coronilla');
INSERT INTO `localidad` VALUES('a14826', '14', 'Barrio Pereira');
INSERT INTO `localidad` VALUES('a14900', '14', 'Rural');
INSERT INTO `localidad` VALUES('a14921', '14', 'Aguas Dulces');
INSERT INTO `localidad` VALUES('a14923', '14', 'Barra del Chuy');
INSERT INTO `localidad` VALUES('a14926', '14', 'Barrio Torres');
INSERT INTO `localidad` VALUES('a14928', '14', 'Cabo Polonio');
INSERT INTO `localidad` VALUES('a14929', '14', 'Capacho');
INSERT INTO `localidad` VALUES('a14940', '14', 'Barra de Valizas');
INSERT INTO `localidad` VALUES('a14941', '14', 'La Esmeralda');
INSERT INTO `localidad` VALUES('a14942', '14', 'La Pedrera');
INSERT INTO `localidad` VALUES('a14948', '14', 'Parall');
INSERT INTO `localidad` VALUES('a14953', '14', 'Puerto de los Botes');
INSERT INTO `localidad` VALUES('a14957', '14', 'Puimayen');
INSERT INTO `localidad` VALUES('a14959', '14', 'Arachania');
INSERT INTO `localidad` VALUES('a14960', '14', 'Pta. Rubia y Sta. Isabel de la Pedrera');
INSERT INTO `localidad` VALUES('a14962', '14', 'Punta del Diablo');
INSERT INTO `localidad` VALUES('a14963', '14', 'Palmares de la Coronilla');
INSERT INTO `localidad` VALUES('a14964', '14', 'La Ribiera');
INSERT INTO `localidad` VALUES('a14965', '14', 'Puente Valizas');
INSERT INTO `localidad` VALUES('a14966', '14', 'Ocean');
INSERT INTO `localidad` VALUES('a14967', '14', 'Pueblo Nuevo');
INSERT INTO `localidad` VALUES('a14968', '14', 'Tajamares de la Pedrera');
INSERT INTO `localidad` VALUES('a14969', '14', 'San Antonio');
INSERT INTO `localidad` VALUES('a15120', '15', 'Salto');
INSERT INTO `localidad` VALUES('a15522', '15', 'Bel');
INSERT INTO `localidad` VALUES('a15523', '15', 'Constituci');
INSERT INTO `localidad` VALUES('a15721', '15', 'Fern');
INSERT INTO `localidad` VALUES('a15722', '15', 'San Antonio');
INSERT INTO `localidad` VALUES('a15723', '15', 'Chacras de Bel');
INSERT INTO `localidad` VALUES('a15821', '15', 'Albisu');
INSERT INTO `localidad` VALUES('a15822', '15', 'Biassini');
INSERT INTO `localidad` VALUES('a15823', '15', 'Campo de Todos');
INSERT INTO `localidad` VALUES('a15824', '15', 'Cayetano');
INSERT INTO `localidad` VALUES('a15825', '15', 'Cuchilla de Guaviy');
INSERT INTO `localidad` VALUES('a15827', '15', 'Termas del Daym');
INSERT INTO `localidad` VALUES('a15828', '15', 'Palomas');
INSERT INTO `localidad` VALUES('a15829', '15', 'Paso del Parque del Daym');
INSERT INTO `localidad` VALUES('a15830', '15', 'Quintana');
INSERT INTO `localidad` VALUES('a15831', '15', 'Sarand');
INSERT INTO `localidad` VALUES('a15832', '15', 'Saucedo');
INSERT INTO `localidad` VALUES('a15900', '15', 'Rural');
INSERT INTO `localidad` VALUES('a15924', '15', 'Arenitas Blancas');
INSERT INTO `localidad` VALUES('a15931', '15', 'Celeste');
INSERT INTO `localidad` VALUES('a15935', '15', 'Cerros de Vera');
INSERT INTO `localidad` VALUES('a15939', '15', 'Garibaldi');
INSERT INTO `localidad` VALUES('a15943', '15', 'Termas del Arapey');
INSERT INTO `localidad` VALUES('a15944', '15', 'Las Flores');
INSERT INTO `localidad` VALUES('a15945', '15', 'Laureles');
INSERT INTO `localidad` VALUES('a15946', '15', 'Lluveras');
INSERT INTO `localidad` VALUES('a15949', '15', 'Migliaro');
INSERT INTO `localidad` VALUES('a15950', '15', 'Olivera');
INSERT INTO `localidad` VALUES('a15957', '15', 'Paso de las Piedras de Arerungu');
INSERT INTO `localidad` VALUES('a15959', '15', 'Puntas de Valent');
INSERT INTO `localidad` VALUES('a15965', '15', 'Rinc');
INSERT INTO `localidad` VALUES('a15966', '15', 'Colonia 18 de Julio');
INSERT INTO `localidad` VALUES('a15969', '15', 'Parque Jos');
INSERT INTO `localidad` VALUES('a15970', '15', 'Colonia Itapeb');
INSERT INTO `localidad` VALUES('a15971', '15', 'Guaviy');
INSERT INTO `localidad` VALUES('a15972', '15', 'Russo');
INSERT INTO `localidad` VALUES('a15973', '15', 'Paso Cementerio');
INSERT INTO `localidad` VALUES('a15974', '15', 'Osimani y Llerena');
INSERT INTO `localidad` VALUES('a16220', '16', 'San Jos');
INSERT INTO `localidad` VALUES('a16421', '16', 'Libertad');
INSERT INTO `localidad` VALUES('a16521', '16', 'Delta del Tigre y Villas');
INSERT INTO `localidad` VALUES('a16621', '16', 'Rodr');
INSERT INTO `localidad` VALUES('a16721', '16', 'Ituzaing');
INSERT INTO `localidad` VALUES('a16722', '16', 'Santa M');
INSERT INTO `localidad` VALUES('a16821', '16', 'Puntas de Valdez');
INSERT INTO `localidad` VALUES('a16822', '16', 'Gonz');
INSERT INTO `localidad` VALUES('a16823', '16', 'Mal Abrigo');
INSERT INTO `localidad` VALUES('a16824', '16', 'Playa Pascual');
INSERT INTO `localidad` VALUES('a16825', '16', '18 de Julio (Pueblo Nuevo)');
INSERT INTO `localidad` VALUES('a16826', '16', 'Rafael Peraza');
INSERT INTO `localidad` VALUES('a16827', '16', 'Raig');
INSERT INTO `localidad` VALUES('a16829', '16', 'Safici (Parque Postel)');
INSERT INTO `localidad` VALUES('a16900', '16', 'Rural');
INSERT INTO `localidad` VALUES('a16923', '16', 'Juan Soler');
INSERT INTO `localidad` VALUES('a16924', '16', 'Bocas del Cufr');
INSERT INTO `localidad` VALUES('a16925', '16', 'Capurro');
INSERT INTO `localidad` VALUES('a16926', '16', 'Villa Mar');
INSERT INTO `localidad` VALUES('a16929', '16', 'Ecilda Paullier');
INSERT INTO `localidad` VALUES('a16932', '16', 'Kiy');
INSERT INTO `localidad` VALUES('a16933', '16', 'La Boyada');
INSERT INTO `localidad` VALUES('a16939', '16', 'Ca');
INSERT INTO `localidad` VALUES('a16945', '16', 'Rinc');
INSERT INTO `localidad` VALUES('a16946', '16', 'San Gregorio');
INSERT INTO `localidad` VALUES('a16947', '16', 'Scavino');
INSERT INTO `localidad` VALUES('a16950', '16', 'Monte Grande');
INSERT INTO `localidad` VALUES('a16960', '16', 'Cer');
INSERT INTO `localidad` VALUES('a16961', '16', 'Radial');
INSERT INTO `localidad` VALUES('a16962', '16', 'Colol');
INSERT INTO `localidad` VALUES('a16963', '16', 'Mangrullo');
INSERT INTO `localidad` VALUES('a16964', '16', 'Carreta Quemada');
INSERT INTO `localidad` VALUES('a16965', '16', 'Costas de Pereira');
INSERT INTO `localidad` VALUES('a16966', '16', 'Colonia Delta');
INSERT INTO `localidad` VALUES('a17220', '17', 'Mercedes');
INSERT INTO `localidad` VALUES('a17321', '17', 'Dolores');
INSERT INTO `localidad` VALUES('a17521', '17', 'Cardona');
INSERT INTO `localidad` VALUES('a17621', '17', 'Jos');
INSERT INTO `localidad` VALUES('a17622', '17', 'Palmitas');
INSERT INTO `localidad` VALUES('a17623', '17', 'Villa Soriano');
INSERT INTO `localidad` VALUES('a17624', '17', 'Palmar');
INSERT INTO `localidad` VALUES('a17721', '17', 'Ega');
INSERT INTO `localidad` VALUES('a17722', '17', 'Santa Catalina');
INSERT INTO `localidad` VALUES('a17824', '17', 'Sacachispas');
INSERT INTO `localidad` VALUES('a17825', '17', 'Ca');
INSERT INTO `localidad` VALUES('a17900', '17', 'Rural');
INSERT INTO `localidad` VALUES('a17927', '17', 'Cuchilla del Perdido');
INSERT INTO `localidad` VALUES('a17928', '17', 'El Tala');
INSERT INTO `localidad` VALUES('a17930', '17', 'La Concordia');
INSERT INTO `localidad` VALUES('a17931', '17', 'La Loma');
INSERT INTO `localidad` VALUES('a17939', '17', 'Palo Solo');
INSERT INTO `localidad` VALUES('a17950', '17', 'Chacras de Dolores');
INSERT INTO `localidad` VALUES('a17951', '17', 'Colonia Concordia');
INSERT INTO `localidad` VALUES('a17952', '17', 'Perseverano');
INSERT INTO `localidad` VALUES('a17993', '17', 'Lares');
INSERT INTO `localidad` VALUES('a17798', '17', 'Agraciada');
INSERT INTO `localidad` VALUES('a17822', '17', 'Castillos');
INSERT INTO `localidad` VALUES('a17823', '17', 'Risso');
INSERT INTO `localidad` VALUES('a18220', '18', 'Tacuaremb');
INSERT INTO `localidad` VALUES('a18321', '18', 'Paso de los Toros');
INSERT INTO `localidad` VALUES('a18521', '18', 'San Gregorio de Polanco');
INSERT INTO `localidad` VALUES('a18695', '18', 'Tambores');
INSERT INTO `localidad` VALUES('a18721', '18', 'Achar');
INSERT INTO `localidad` VALUES('a18722', '18', 'Ansina');
INSERT INTO `localidad` VALUES('a18723', '18', 'Curtina');
INSERT INTO `localidad` VALUES('a18724', '18', 'Paso del Cerro');
INSERT INTO `localidad` VALUES('a18822', '18', 'Clara');
INSERT INTO `localidad` VALUES('a18825', '18', 'Cuchilla del Omb');
INSERT INTO `localidad` VALUES('a18827', '18', 'La Hilera');
INSERT INTO `localidad` VALUES('a18828', '18', 'Las Toscas');
INSERT INTO `localidad` VALUES('a18829', '18', 'Paso Bonilla');
INSERT INTO `localidad` VALUES('a18830', '18', 'Pueblo de Arriba');
INSERT INTO `localidad` VALUES('a18831', '18', 'Pueblo del Barro');
INSERT INTO `localidad` VALUES('a18833', '18', 'Rinc');
INSERT INTO `localidad` VALUES('a18834', '18', 'Balneario Ipor');
INSERT INTO `localidad` VALUES('a18894', '18', 'Piedra Sola');
INSERT INTO `localidad` VALUES('a18900', '18', 'Rural');
INSERT INTO `localidad` VALUES('a18925', '18', 'Cardozo');
INSERT INTO `localidad` VALUES('a18928', '18', 'Chamberlain');
INSERT INTO `localidad` VALUES('a18931', '18', 'Cuchilla de Peralta');
INSERT INTO `localidad` VALUES('a18937', '18', 'La Pedrera');
INSERT INTO `localidad` VALUES('a18952', '18', 'Laureles');
INSERT INTO `localidad` VALUES('a18963', '18', 'Montevideo Chico');
INSERT INTO `localidad` VALUES('a18971', '18', 'Cerro de Pastoreo');
INSERT INTO `localidad` VALUES('a18980', '18', 'Sauce de Batov');
INSERT INTO `localidad` VALUES('a18990', '18', 'Puntas de Cinco Sauces');
INSERT INTO `localidad` VALUES('a18991', '18', 'Rinc');
INSERT INTO `localidad` VALUES('a18992', '18', 'Punta de Carretera');
INSERT INTO `localidad` VALUES('a18993', '18', 'Cruz de los Caminos');
INSERT INTO `localidad` VALUES('a19220', '19', 'Treinta y Tres');
INSERT INTO `localidad` VALUES('a19521', '19', 'Santa Clara de Olimar');
INSERT INTO `localidad` VALUES('a19522', '19', 'Vergara');
INSERT INTO `localidad` VALUES('a19721', '19', 'Arrozal Treinta y Tres');
INSERT INTO `localidad` VALUES('a19722', '19', 'Gral. Enrique Mart');
INSERT INTO `localidad` VALUES('a19723', '19', 'Villa Sara');
INSERT INTO `localidad` VALUES('a19790', '19', 'Cerro Chato');
INSERT INTO `localidad` VALUES('a19821', '19', 'Estaci');
INSERT INTO `localidad` VALUES('a19822', '19', 'Isla Patrulla (Mar');
INSERT INTO `localidad` VALUES('a19896', '19', 'Valentines');
INSERT INTO `localidad` VALUES('a19900', '19', 'Rural');
INSERT INTO `localidad` VALUES('a19922', '19', 'Poblado Alonzo');
INSERT INTO `localidad` VALUES('a19924', '19', 'Arrocera Rinc');
INSERT INTO `localidad` VALUES('a19940', '19', 'Arrocera Los Ceibos');
INSERT INTO `localidad` VALUES('a19941', '19', 'Mar');
INSERT INTO `localidad` VALUES('a19942', '19', 'Mendiz');
INSERT INTO `localidad` VALUES('a19947', '19', 'Puntas del Parao');
INSERT INTO `localidad` VALUES('a19955', '19', 'Villa Passano');
INSERT INTO `localidad` VALUES('a19956', '19', 'Ejido de Treinta y Tres');
INSERT INTO `localidad` VALUES('a19960', '19', 'El Bellaco');
INSERT INTO `localidad` VALUES('a19961', '19', 'Arrocera Los Teros');
INSERT INTO `localidad` VALUES('a19962', '19', 'Arrocera Bonomo');
INSERT INTO `localidad` VALUES('a19963', '19', 'Arrocera El Tigre');
INSERT INTO `localidad` VALUES('a19964', '19', 'Arrocera La Catumbera');
INSERT INTO `localidad` VALUES('a19965', '19', 'Arrocera La Querencia');
INSERT INTO `localidad` VALUES('a19966', '19', 'Arrocera Las Palmas');
INSERT INTO `localidad` VALUES('a19967', '19', 'Arrocera Mini');
INSERT INTO `localidad` VALUES('a19968', '19', 'Arrocera Procipa');
INSERT INTO `localidad` VALUES('a19969', '19', 'Arrocera San Fernando');
INSERT INTO `localidad` VALUES('a19970', '19', 'Arrocera Santa Fe');
INSERT INTO `localidad` VALUES('a19971', '19', 'Arrocera Zapata');

-- --------------------------------------------------------

--
-- Table structure for table `ordentrabajo`
--

CREATE TABLE `ordentrabajo` (
  `Numero` int(11) NOT NULL AUTO_INCREMENT,
  `TipoOrden` varchar(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `TipoTarea` varchar(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `SistemaEmisor` varchar(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `TipoProducto` varchar(3) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `FechaHoraCreacion` datetime NOT NULL,
  `UsuarioCreador` varchar(16) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `FechaHoraDistribucion` datetime NOT NULL,
  `FechaPrevista` date NOT NULL,
  `Supervisor` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Equipo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `FechaCancelacion` date NOT NULL,
  `NombreCliente` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ApellidoCliente` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Cedula` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Localidad` varchar(6) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Departamento` varchar(3) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `FechaHoraDespacho` datetime NOT NULL,
  `ComentarioSupervisor` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `EquipoDespacho` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `FechaHoraCierre` datetime NOT NULL,
  `ComentariosCierre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Estado` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `CodigoZona` varchar(6) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Prioridad` tinyint(4) NOT NULL,
  `Horario` tinyint(4) NOT NULL,
  `Comentario` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `FuncionesRequeridas` tinyint(4) NOT NULL,
  PRIMARY KEY (`Numero`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=613 ;

--
-- Dumping data for table `ordentrabajo`
--

INSERT INTO `ordentrabajo` VALUES(400, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-16', '', 'Ea03221010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(401, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-08', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '400 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(402, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '101 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(403, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-19', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '401 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(404, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-20', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '102 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(405, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-25', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '404 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(406, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-26', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '105 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(407, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-27', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '405 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(408, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-28', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '106 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(409, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-29', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '406 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(410, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-16', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '107 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(411, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-08', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '407 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(412, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(413, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-19', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '408 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(414, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-20', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '109 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(415, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-21', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '409 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(416, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-26', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '110 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(417, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-07', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '410 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(418, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-08', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '111 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(419, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-09', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '411 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(420, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-10', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '112 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(421, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-11', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '412 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(422, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-12', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '113 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(423, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-17', '', 'Ea03221010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '413 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(424, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-18', '', 'Ea03221010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '114 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(425, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-07', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '414 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(426, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '115 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(427, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-19', '', 'Ea03221010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '415 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(428, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-20', '', 'Ea03221010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '116 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(429, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-21', '', 'Ea03221010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '416 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(430, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-22', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '117 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(431, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-18', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '417 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(432, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-07', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '118 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(433, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-06', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '418 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(434, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-07', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '121 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(435, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-06', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '421 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(436, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-27', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '122 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(437, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-16', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '422 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(438, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-07', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '123 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(439, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-18', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '423 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(440, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-21', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '124 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(441, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-22', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '424 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(442, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '125 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(443, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-24', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '425 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(444, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-05', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '126 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(445, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-06', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '426 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(446, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-07', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '127 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(447, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-08', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '427 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(448, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-09', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '128 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(449, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-10', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '428 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(450, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-11', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '129 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(451, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-12', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '429 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(452, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-13', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '130 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(453, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-14', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '430 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(454, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-16', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '131 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(455, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-17', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '431 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(456, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-16', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '132 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(457, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-17', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '432 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(458, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-22', '', 'Ea03221010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '135 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(459, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-23', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '435 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(460, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-24', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '136 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(461, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-25', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '436 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(462, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-26', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '137 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(463, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-27', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '437 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(464, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-28', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '138 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(465, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-29', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '438 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(466, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-30', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '139 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(467, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-01', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '439 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(468, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-02', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '140 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(469, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-03', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '440 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(470, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-04', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '141 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(471, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-05', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '441 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(472, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-06', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '142 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(473, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-07', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '442 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(474, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-08', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '143 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(475, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-08', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '445 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(476, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-09', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '146 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(477, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-16', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '446 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(478, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-17', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '147 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(479, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-23', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '448 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(480, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-24', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '149 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(481, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-06', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '149 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(482, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-16', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(483, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-17', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '400 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(484, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-06', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '101 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(485, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-19', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '401 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(486, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-20', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '102 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(487, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-21', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '402 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(488, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-22', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '103 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(489, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-23', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(490, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-24', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '104 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(491, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-25', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '404 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(492, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-26', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '105 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(493, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-27', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '405 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(494, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-28', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '106 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(495, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-29', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '406 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(496, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-16', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '107 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(497, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-17', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '407 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(498, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-06', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(499, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-19', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '408 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(500, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-20', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '109 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(501, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-07', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '410 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(502, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-08', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '111 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(503, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-09', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '411 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(504, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-10', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '112 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(505, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-11', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '412 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(506, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-12', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '113 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(507, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-17', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '413 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(508, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-06', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '114 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(509, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-17', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '414 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(510, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-18', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '115 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(511, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-19', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '415 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(512, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-20', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '116 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(513, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-21', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '416 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(514, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-18', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '417 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(515, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-17', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '118 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(516, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-18', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '418 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(517, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-21', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '119 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(518, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '120 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(519, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-24', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '420 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(520, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-17', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '121 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(521, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-18', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '421 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(522, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-27', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '122 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(523, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-16', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '422 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(524, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-17', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '123 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(525, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-18', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '423 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(526, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-21', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '124 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(527, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-22', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '424 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(528, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '125 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(529, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-24', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '425 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(530, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-05', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '126 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(531, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-06', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '426 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(532, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-07', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '127 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(533, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-08', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '427 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(534, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-09', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '128 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(535, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-10', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '428 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(536, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-11', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '129 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(537, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-12', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '429 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(538, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-13', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '130 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(539, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-14', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '430 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(540, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-16', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '131 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(541, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-17', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '431 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(542, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-16', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '132 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(543, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-17', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '432 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(544, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-21', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '133 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(545, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-22', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '433 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(546, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '134 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(547, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-24', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '434 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(548, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-22', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '135 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(549, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-23', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '435 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(550, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-24', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '136 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(551, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-25', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '436 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(552, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-26', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '137 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(553, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-27', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '437 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(554, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-28', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '138 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(555, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-29', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '438 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(556, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-30', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '139 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(557, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-01', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '439 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(558, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-02', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '140 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(559, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-03', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '440 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(560, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-04', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '141 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(561, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-05', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '441 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(562, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-06', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '142 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(563, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-07', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '442 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(564, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-08', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '143 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(565, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-21', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '443 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(566, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-22', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '144 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(567, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-23', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '444 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(568, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-24', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '145 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(569, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-08', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '445 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(570, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-09', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '146 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(571, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-16', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '446 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(572, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-17', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '147 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(573, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-21', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '447 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(574, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-22', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '148 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(575, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-23', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '448 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(576, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-24', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '149 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(577, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-06', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '149 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(578, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-22', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(579, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-22', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '3', 0);
INSERT INTO `ordentrabajo` VALUES(580, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-22', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '5', 0);
INSERT INTO `ordentrabajo` VALUES(581, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-22', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '7', 0);
INSERT INTO `ordentrabajo` VALUES(582, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-22', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '11', 0);
INSERT INTO `ordentrabajo` VALUES(583, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-22', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '13', 0);
INSERT INTO `ordentrabajo` VALUES(584, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-11-22', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '103 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '17', 0);
INSERT INTO `ordentrabajo` VALUES(585, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-19', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(586, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-19', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(587, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-19', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(588, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-19', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(589, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-19', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(590, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-19', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(591, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-19', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(592, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-19', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(593, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-20', '', 'Ea03320010', '0000-00-00', 'Maria', 'Garcia', '2.000.000-', '407 50 60', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '19', 0);
INSERT INTO `ordentrabajo` VALUES(594, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(595, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(596, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(597, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(598, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(599, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(600, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', '0000-00-00 00:00:00', '2016-12-23', '', 'Ea03320010', '0000-00-00', 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'a03320', '03', '2016-11-15 23:59:59', '', '', '0000-00-00 00:00:00', '', 'despachada', '', 3, 0, '2', 0);
INSERT INTO `ordentrabajo` VALUES(606, 'I', 'I', 'C', 'SVV', '2016-11-19 00:06:05', 'vendedor', '0000-00-00 00:00:00', '0000-00-00', '', 'Ea03320010', '0000-00-00', '', 'Garcia', '1.000.000-', '1002030', 'calle', 'a03320', '03', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '', 'programada', '', 0, 1, '', 2);
INSERT INTO `ordentrabajo` VALUES(605, 'I', 'I', 'C', 'SVV', '2016-11-19 00:04:11', 'vendedor', '0000-00-00 00:00:00', '0000-00-00', '', 'Ea03320010', '0000-00-00', '', 'Garcia', '1.000.000-', '1002030', 'calle', 'a03320', '03', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '', 'programada', '', 0, 1, '', 2);
INSERT INTO `ordentrabajo` VALUES(607, 'I', 'I', 'C', 'SVV', '2016-11-19 00:11:15', 'vendedor', '0000-00-00 00:00:00', '1969-12-31', '', 'Ea03320010', '0000-00-00', '', 'Garcia', '1.000.000-', '1002030', 'calle', 'a03320', '03', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '', 'programada', '', 0, 1, '', 2);
INSERT INTO `ordentrabajo` VALUES(608, 'I', 'I', 'C', 'SVV', '2016-11-19 00:12:28', 'vendedor', '0000-00-00 00:00:00', '1969-12-31', '', 'Ea03320010', '0000-00-00', '', 'Garcia', '1.000.000-', '1002030', 'calle', 'a03320', '03', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '', 'programada', '', 0, 1, '', 2);
INSERT INTO `ordentrabajo` VALUES(609, 'I', 'I', 'C', 'SVV', '2016-11-19 00:13:22', 'vendedor', '0000-00-00 00:00:00', '1969-12-31', '', 'Ea03320010', '0000-00-00', '', 'Garcia', '1.000.000-', '1002030', 'calle', 'a03320', '03', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '', 'programada', '', 0, 1, '', 2);
INSERT INTO `ordentrabajo` VALUES(610, 'I', 'I', 'C', 'SVV', '2016-11-19 00:20:52', 'vendedor', '0000-00-00 00:00:00', '2016-11-19', '', 'Ea03320010', '0000-00-00', '', 'Garcia', '1.000.000-', '1002030', 'calle', 'a03320', '03', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '', 'programada', '', 0, 1, '', 2);
INSERT INTO `ordentrabajo` VALUES(611, 'I', 'I', 'C', 'SVV', '2016-11-20 18:16:49', 'vendedor', '0000-00-00 00:00:00', '2016-11-26', '', 'Ea03320010', '0000-00-00', '', 'fhgfh', '6654', '465464', 'cds333', 'a03320', '03', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '', 'programada', '', 0, 3, '', 2);
INSERT INTO `ordentrabajo` VALUES(612, 'I', 'I', 'C', 'SVV', '2016-11-21 18:24:05', 'vendedor', '0000-00-00 00:00:00', '2016-12-14', '', 'Ea03320010', '0000-00-00', '', 'garcia', '10000008', '1002030', 'calle', 'a03320', '03', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00', '', 'programada', '', 0, 3, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `habilitado` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` VALUES(1, 'Admin', 1);
INSERT INTO `rol` VALUES(2, 'Comercial', 1);
INSERT INTO `rol` VALUES(3, 'Supervisor', 1);
INSERT INTO `rol` VALUES(4, 'Equipo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sistemaemisor`
--

CREATE TABLE `sistemaemisor` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigoo` (`codigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sistemaemisor`
--

INSERT INTO `sistemaemisor` VALUES(1, 'C', 'comercial');
INSERT INTO `sistemaemisor` VALUES(2, 'S', 'soporte');
INSERT INTO `sistemaemisor` VALUES(3, 'W', 'web service');

-- --------------------------------------------------------

--
-- Table structure for table `tipoorden`
--

CREATE TABLE `tipoorden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tipoorden`
--

INSERT INTO `tipoorden` VALUES(1, 'I', 'Instalación');
INSERT INTO `tipoorden` VALUES(2, 'R', 'Reclamo');

-- --------------------------------------------------------

--
-- Table structure for table `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `accion` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `habilidad` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `tipoproducto`
--

INSERT INTO `tipoproducto` VALUES(1, 'SVV', 'Sistema video vigilancia', 'instalar', 2);
INSERT INTO `tipoproducto` VALUES(2, 'SVV', 'Sistema video vigilancia', 'reparar', 3);
INSERT INTO `tipoproducto` VALUES(3, 'SVN', 'Sistema video nocturna', 'instalar', 26);
INSERT INTO `tipoproducto` VALUES(4, 'SVN', 'Sistema video nocturna', 'reparar', 3);
INSERT INTO `tipoproducto` VALUES(5, 'CSM', 'Cámaras sensor movimiento', 'instalar', 38);
INSERT INTO `tipoproducto` VALUES(6, 'CSM', 'Cámaras sensor movimiento', 'reparar', 3);
INSERT INTO `tipoproducto` VALUES(7, 'CIP', 'Cámaras IP remotas', 'instalar', 13);
INSERT INTO `tipoproducto` VALUES(8, 'CIP', 'Cámaras IP remotas', 'reparar', 17);
INSERT INTO `tipoproducto` VALUES(9, 'SFP', 'Sistema filmacion plus', 'instalar', 13);
INSERT INTO `tipoproducto` VALUES(10, 'SFP', 'Sistema filmacion plus', 'reparar', 17);
INSERT INTO `tipoproducto` VALUES(11, 'SCN', 'Sistema control niños', 'instalar', 11);
INSERT INTO `tipoproducto` VALUES(12, 'SCN', 'Sistema control niños', 'reparar', 3);
INSERT INTO `tipoproducto` VALUES(13, 'SCA', 'Sistema control ancianos', 'instalar', 11);
INSERT INTO `tipoproducto` VALUES(14, 'SCA', 'Sistema control ancianos', 'reparar', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tipoproductohabilidad`
--

CREATE TABLE `tipoproductohabilidad` (
  `habilidadid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipoproductoid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`habilidadid`,`tipoproductoid`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tipoproductohabilidad`
--

INSERT INTO `tipoproductohabilidad` VALUES(1, 1);
INSERT INTO `tipoproductohabilidad` VALUES(1, 2);
INSERT INTO `tipoproductohabilidad` VALUES(1, 3);
INSERT INTO `tipoproductohabilidad` VALUES(2, 1);
INSERT INTO `tipoproductohabilidad` VALUES(2, 2);
INSERT INTO `tipoproductohabilidad` VALUES(2, 3);
INSERT INTO `tipoproductohabilidad` VALUES(2, 5);
INSERT INTO `tipoproductohabilidad` VALUES(2, 6);
INSERT INTO `tipoproductohabilidad` VALUES(2, 7);
INSERT INTO `tipoproductohabilidad` VALUES(5, 3);
INSERT INTO `tipoproductohabilidad` VALUES(5, 6);
INSERT INTO `tipoproductohabilidad` VALUES(5, 7);
INSERT INTO `tipoproductohabilidad` VALUES(6, 2);
INSERT INTO `tipoproductohabilidad` VALUES(6, 4);
INSERT INTO `tipoproductohabilidad` VALUES(6, 5);
INSERT INTO `tipoproductohabilidad` VALUES(7, 4);
INSERT INTO `tipoproductohabilidad` VALUES(7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tipotarea`
--

CREATE TABLE `tipotarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `aplicahabilidadesdelproducto` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tipotarea`
--

INSERT INTO `tipotarea` VALUES(1, 'I', 'instalar', 1);
INSERT INTO `tipotarea` VALUES(2, 'R', 'reparar', 1);
INSERT INTO `tipotarea` VALUES(3, 'C', 'cambio', 0);
INSERT INTO `tipotarea` VALUES(4, 'M', 'mantenimiento', 0);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `ci` int(10) unsigned NOT NULL,
  `usuario` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contrasena` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `grupo` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `codigoDeSupervisor` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `codigoDeEquipo` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Habilitado` varchar(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ci`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla que contiene los usuarios del sistema';

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` VALUES(8, 'administrador', '', '', 'administrador', 'administrador@correo.com', '', '', 'administradores', '', '', '');
INSERT INTO `usuarios` VALUES(13, 'juan', '', '', 'juan', 'juan@correo.com', '', '', 'supervisores', '', '', '');
INSERT INTO `usuarios` VALUES(10000008, 'vendedor', 'Agente', 'Comercial', 'vendedor', 'vendedor@correo.com', '2003040', '099100200', 'vendedores', '', '', 'T');