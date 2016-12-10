-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2016 a las 10:08:56
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `teveo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_cuota`
--

CREATE TABLE `auditoria_cuota` (
  `identificadorequipo` varchar(10) NOT NULL,
  `fecha_cambio` datetime NOT NULL,
  `usuario_cambio` datetime NOT NULL,
  `cuotaLV` int(10) UNSIGNED DEFAULT NULL,
  `cuotaS` int(10) UNSIGNED DEFAULT NULL,
  `cuotaD` int(10) UNSIGNED DEFAULT NULL,
  `cuotaF` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuota_excepcional`
--

CREATE TABLE `cuota_excepcional` (
  `id` int(11) NOT NULL,
  `identificadorequipo` varchar(10) NOT NULL,
  `fecha_cambio` datetime NOT NULL,
  `usuario_cambio` datetime NOT NULL,
  `fecha_aplicacion` datetime NOT NULL,
  `cuota` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` char(3) NOT NULL,
  `nombre_depto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre_depto`) VALUES
('ART', 'Artigas'),
('CAN', 'Canelones'),
('CER', 'Cerro Largo'),
('COL', 'Colonia'),
('DUR', 'Durazno'),
('FLO', 'Flores'),
('FLR', 'Florida'),
('LAV', 'Lavalleja'),
('MAL', 'Maldonado'),
('MON', 'Montevideo'),
('PAY', 'Paysandú'),
('RIV', 'Rivera'),
('RNE', 'Río Negro'),
('ROC', 'Rocha'),
('SAL', 'Salto'),
('SAN', 'San José'),
('SOR', 'Soriano'),
('TAC', 'Tacuarembó'),
('TRE', 'Treinta y Tres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(10) NOT NULL,
  `ci` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `login` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `password` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `rolid` int(11) NOT NULL,
  `identificadorsupervisor` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `identificadorequipo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `habilitado` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `ci`, `login`, `password`, `nombre`, `apellido`, `telefono`, `rolid`, `identificadorsupervisor`, `identificadorequipo`, `habilitado`) VALUES
(1, '1.000.000-8', 'vendedor', 'vendedor', 'Pedro', 'Martinez', '123456', 2, '', '', 1),
(2, '2.000.000-6', 'supervisor1', 'supervisor1', 'Carlos', 'Perez', '654321', 3, 'SCANPAN001', '', 1),
(3, '3.000.000-4', 'supervisor2', 'supervisor2', 'Maria', 'Rodriguez', '456123', 3, 'SCANPAN002', '', 1),
(4, '4.000.000-2', 'supervisor3', 'supervisor3', 'Laura', 'Sanchez', '321654', 3, 'SCANPAN003', '', 1),
(5, '5.000.000-0', 'empleado1', 'empleado1', 'Carlos', 'Sosa', '741852', 4, '', 'ECANPAN001', 1),
(6, '6.000.000-8', 'empleado2', 'empleado2', 'Antonio', 'Noya', '852147', 4, '', 'ECANPAN009', 1),
(7, '7.000.000-6', 'empleado3', 'empleado3', 'Amalia', 'Suarez', '963258', 4, '', 'ECANPAN010', 1),
(8, '8.000.000-4', 'empleado4', 'empleado4', 'Fabiana', 'Sosa', '987456', 4, '', 'ECANPAN029', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `identificador` varchar(10) NOT NULL,
  `identificadorsupervisor` varchar(10) NOT NULL,
  `cuotadiaslaborales` int(10) UNSIGNED NOT NULL,
  `cuotasabado` int(10) UNSIGNED DEFAULT NULL,
  `cuotadomingo` int(10) UNSIGNED DEFAULT NULL,
  `cuotaferiado` int(10) UNSIGNED DEFAULT NULL,
  `habilidades` int(10) UNSIGNED DEFAULT NULL,
  `codigozona` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`identificador`, `identificadorsupervisor`, `cuotadiaslaborales`, `cuotasabado`, `cuotadomingo`, `cuotaferiado`, `habilidades`, `codigozona`) VALUES
('ECANLAP001', 'SCANLAP001', 10, 5, 0, 3, 2, 'CANLAP'),
('ECANLAP002', 'SCANLAP001', 10, 5, 0, 3, 3, 'CANLAP'),
('ECANLAP003', 'SCANLAP001', 10, 5, 0, 0, 5, 'CANLAP'),
('ECANLAP004', 'SCANLAP001', 5, 5, 0, 0, 7, 'CANLAP'),
('ECANLAP005', 'SCANLAP001', 10, 5, 1, 3, 11, 'CANLAP'),
('ECANLAP006', 'SCANLAP001', 10, 8, 0, 3, 13, 'CANLAP'),
('ECANLAP007', 'SCANLAP001', 2, 5, 0, 0, 17, 'CANLAP'),
('ECANLAP008', 'SCANLAP001', 15, 5, 0, 3, 19, 'CANLAP'),
('ECANLAP009', 'SCANLAP001', 10, 5, 1, 0, 26, 'CANLAP'),
('ECANLAP010', 'SCANLAP001', 10, 5, 0, 3, 38, 'CANLAP'),
('ECANLAP011', 'SCANLAP001', 8, 5, 0, 3, 2, 'CANLAP'),
('ECANLAP012', 'SCANLAP001', 10, 5, 2, 0, 3, 'CANLAP'),
('ECANLAP013', 'SCANLAP001', 12, 5, 0, 3, 5, 'CANLAP'),
('ECANLAP014', 'SCANLAP001', 10, 7, 0, 3, 7, 'CANLAP'),
('ECANLAP015', 'SCANLAP002', 10, 5, 0, 3, 11, 'CANLAP'),
('ECANLAP016', 'SCANLAP002', 10, 5, 0, 0, 13, 'CANLAP'),
('ECANLAP017', 'SCANLAP001', 9, 8, 0, 0, 2, 'CANLAP'),
('ECANLAP018', 'SCANLAP001', 10, 5, 0, 3, 3, 'CANLAP'),
('ECANLAP019', 'SCANLAP001', 10, 5, 0, 0, 5, 'CANLAP'),
('ECANLAP020', 'SCANLAP003', 10, 5, 3, 3, 7, 'CANLAP'),
('ECANLPI001', 'SCANLPI001', 5, 5, 0, 0, 2, 'CANLPI'),
('ECANLPI002', 'SCANLPI001', 10, 5, 0, 3, 3, 'CANLPI'),
('ECANLPI003', 'SCANLPI001', 10, 9, 0, 3, 5, 'CANLPI'),
('ECANLPI004', 'SCANLPI001', 3, 5, 0, 3, 7, 'CANLPI'),
('ECANLPI005', 'SCANLPI001', 10, 5, 0, 3, 11, 'CANLPI'),
('ECANLPI006', 'SCANLPI001', 10, 5, 0, 0, 13, 'CANLPI'),
('ECANLPI007', 'SCANLPI001', 4, 5, 0, 3, 17, 'CANLPI'),
('ECANLPI008', 'SCANLPI001', 10, 5, 0, 0, 19, 'CANLPI'),
('ECANLPI009', 'SCANLPI001', 10, 5, 3, 0, 26, 'CANLPI'),
('ECANLPI010', 'SCANLPI001', 4, 3, 0, 0, 38, 'CANLPI'),
('ECANPAN001', 'SCANPAN001', 10, 1, 0, 3, 2, 'CANPAN'),
('ECANPAN002', 'SCANPAN001', 10, 5, 0, 0, 3, 'CANPAN'),
('ECANPAN003', 'SCANPAN001', 8, 5, 0, 3, 5, 'CANPAN'),
('ECANPAN004', 'SCANPAN001', 10, 5, 0, 0, 7, 'CANPAN'),
('ECANPAN005', 'SCANPAN001', 6, 2, 0, 3, 11, 'CANPAN'),
('ECANPAN006', 'SCANPAN001', 10, 5, 0, 0, 13, 'CANPAN'),
('ECANPAN007', 'SCANPAN001', 10, 5, 1, 0, 17, 'CANPAN'),
('ECANPAN008', 'SCANPAN001', 10, 6, 0, 0, 19, 'CANPAN'),
('ECANPAN009', 'SCANPAN001', 10, 5, 0, 0, 26, 'CANPAN'),
('ECANPAN010', 'SCANPAN001', 10, 5, 0, 0, 38, 'CANPAN'),
('ECANPAN011', 'SCANPAN001', 10, 5, 0, 0, 2, 'CANPAN'),
('ECANPAN013', 'SCANPAN001', 10, 5, 0, 0, 5, 'CANPAN'),
('ECANPAN014', 'SCANPAN001', 10, 5, 0, 3, 7, 'CANPAN'),
('ECANPAN015', 'SCANPAN001', 10, 5, 0, 0, 11, 'CANPAN'),
('ECANPAN016', 'SCANPAN001', 10, 5, 0, 3, 13, 'CANPAN'),
('ECANPAN017', 'SCANPAN001', 3, 5, 2, 3, 2, 'CANPAN'),
('ECANPAN018', 'SCANPAN001', 10, 5, 0, 0, 3, 'CANPAN'),
('ECANPAN019', 'SCANPAN001', 10, 5, 0, 3, 5, 'CANPAN'),
('ECANPAN020', 'SCANPAN001', 10, 5, 0, 0, 7, 'CANPAN'),
('ECANPAN021', 'SCANPAN001', 7, 5, 0, 3, 2, 'CANPAN'),
('ECANPAN022', 'SCANPAN001', 10, 4, 0, 3, 3, 'CANPAN'),
('ECANPAN023', 'SCANPAN001', 10, 5, 0, 3, 5, 'CANPAN'),
('ECANPAN024', 'SCANPAN001', 10, 5, 0, 0, 7, 'CANPAN'),
('ECANPAN025', 'SCANPAN001', 10, 5, 2, 3, 11, 'CANPAN'),
('ECANPAN026', 'SCANPAN002', 10, 2, 0, 3, 13, 'CANPAN'),
('ECANPAN027', 'SCANPAN002', 10, 5, 0, 3, 17, 'CANPAN'),
('ECANPAN028', 'SCANPAN002', 8, 1, 0, 3, 19, 'CANPAN'),
('ECANPAN029', 'SCANPAN002', 10, 5, 0, 0, 26, 'CANPAN'),
('ECANPAN030', 'SCANPAN002', 10, 5, 0, 3, 38, 'CANPAN'),
('ECANPAN031', 'SCANPAN002', 10, 5, 1, 0, 2, 'CANPAN'),
('ECANPAN032', 'SCANPAN002', 10, 5, 0, 3, 3, 'CANPAN'),
('ECANPAN033', 'SCANPAN002', 5, 5, 0, 3, 5, 'CANPAN'),
('ECANPAN034', 'SCANPAN002', 10, 5, 0, 3, 7, 'CANPAN'),
('ECANPAN035', 'SCANPAN002', 10, 5, 0, 3, 11, 'CANPAN'),
('ECANPAN036', 'SCANPAN003', 10, 5, 1, 0, 13, 'CANPAN'),
('ECANPAN037', 'SCANPAN003', 10, 5, 0, 3, 2, 'CANPAN'),
('ECANPAN038', 'SCANPAN003', 10, 5, 0, 0, 3, 'CANPAN'),
('ECANPAN039', 'SCANPAN004', 4, 5, 0, 3, 5, 'CANPAN'),
('ECANPAN040', 'SCANPAN004', 10, 5, 0, 0, 7, 'CANPAN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos_bloqueados`
--

CREATE TABLE `equipos_bloqueados` (
  `equipo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `usuario` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `feriados`
--

CREATE TABLE `feriados` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `feriados`
--

INSERT INTO `feriados` (`id`, `fecha`, `descripcion`) VALUES
(1, '2016-12-25', 'Navidad 2016'),
(2, '2016-11-25', 'Mi feriado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidad`
--

CREATE TABLE `habilidad` (
  `id` int(11) NOT NULL,
  `codigo` char(3) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `peso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `habilidad`
--

INSERT INTO `habilidad` (`id`, `codigo`, `descripcion`, `peso`) VALUES
(1, 'IN0', 'instalación', 2),
(2, 'RP0', 'reparación', 3),
(3, 'RC0', 'recambio', 5),
(4, 'MT0', 'mantenimiento', 7),
(5, 'TE0', 'trabajo especial', 11),
(6, 'IN1', 'instalación especial', 13),
(7, 'RP1', 'reparación especial', 17),
(8, 'TE1', 'reparación delicada', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id` char(6) NOT NULL,
  `id_depart` char(3) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `id_depart`, `nombre`) VALUES
('CANLAP', 'CAN', 'La Paz'),
('CANLPI', 'CAN', 'Las Piedras'),
('CANPAN', 'CAN', 'Pando'),
('MONMON', 'MON', 'Montevideo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_de_trabajo`
--

CREATE TABLE `orden_de_trabajo` (
  `numero` int(11) NOT NULL,
  `tipoorden` varchar(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipotarea` varchar(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sistemaemisor` varchar(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipoproducto` varchar(3) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechahoracreacion` datetime NOT NULL,
  `usuariocreador` varchar(16) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechahoradistribucion` datetime DEFAULT NULL,
  `fechaprevista` date DEFAULT NULL,
  `identificadorsupervisor` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `equipo` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechacancelacion` date DEFAULT NULL,
  `nombrecliente` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellidocliente` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `cedula` varchar(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `localidad` varchar(6) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `departamento` varchar(3) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechahoradespacho` datetime DEFAULT NULL,
  `comentariosupervisor` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `equipodespacho` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechahoracierre` datetime DEFAULT NULL,
  `comentarioscierre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigozona` varchar(6) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `prioridad` tinyint(4) DEFAULT NULL,
  `horario` tinyint(4) DEFAULT NULL,
  `comentario` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `funcionesrequeridas` tinyint(4) NOT NULL,
  `comentarioequipo` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `orden_de_trabajo`
--

INSERT INTO `orden_de_trabajo` (`numero`, `tipoorden`, `tipotarea`, `sistemaemisor`, `tipoproducto`, `fechahoracreacion`, `usuariocreador`, `fechahoradistribucion`, `fechaprevista`, `identificadorsupervisor`, `equipo`, `fechacancelacion`, `nombrecliente`, `apellidocliente`, `cedula`, `telefono`, `direccion`, `localidad`, `departamento`, `fechahoradespacho`, `comentariosupervisor`, `equipodespacho`, `fechahoracierre`, `comentarioscierre`, `estado`, `codigozona`, `prioridad`, `horario`, `comentario`, `funcionesrequeridas`, `comentarioequipo`) VALUES
(400, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-16', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(401, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-08', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '400 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(402, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '101 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(403, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '401 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(404, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-20', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '102 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(405, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-25', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '404 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(406, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-26', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '105 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(407, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-27', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '405 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(408, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-28', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '106 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(409, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-29', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '406 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(410, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-16', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '107 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(411, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-08', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '407 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(412, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(413, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '408 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(414, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-20', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '109 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(415, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-21', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '409 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(416, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-26', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '110 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(417, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-07', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '410 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(418, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-08', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '111 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(419, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-09', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '411 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(420, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-10', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '112 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(421, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-11', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '412 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(422, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-12', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '113 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(423, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-17', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '413 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(424, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-18', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '114 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(425, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-07', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '414 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(426, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '115 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(427, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '415 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(428, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-20', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '116 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(429, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-21', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '416 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(430, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-22', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '117 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(431, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-18', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '417 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(432, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-07', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '118 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(433, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-06', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '418 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(434, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-07', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '121 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(435, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-06', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '421 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(436, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-27', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '122 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(437, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-16', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '422 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(438, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-07', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '123 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(439, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-18', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '423 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(440, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-21', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '124 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(441, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-22', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '424 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(442, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '125 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(443, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-24', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '425 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(444, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-05', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '126 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(445, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-06', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '426 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(446, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-07', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '127 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(447, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-08', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '427 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(448, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-09', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '128 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(449, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-10', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '428 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(450, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-11', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '129 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(451, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-12', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '429 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(452, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-13', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '130 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(453, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-14', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '430 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(454, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-16', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '131 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(455, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-17', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '431 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(456, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-16', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '132 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(457, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-17', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '432 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(458, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-22', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '135 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(459, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-23', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '435 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(460, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-24', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '136 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(461, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-25', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '436 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(462, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-26', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '137 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(463, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-27', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '437 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(464, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-28', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '138 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(465, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-29', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '438 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(466, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-30', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '139 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(467, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-01', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '439 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(468, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-02', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '140 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(469, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-03', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '440 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(470, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-04', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '141 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(471, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-05', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '441 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(472, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-06', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '142 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(473, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-07', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '442 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(474, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-08', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '143 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(475, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-08', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '445 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(476, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-09', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '146 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(477, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-16', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '446 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(478, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-17', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '147 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(479, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-23', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '448 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(480, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-24', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '149 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(481, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-06', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '149 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(482, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-16', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(483, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-17', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '400 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(484, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-06', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '101 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(485, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '401 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(486, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-20', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '102 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(487, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-21', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '402 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(488, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-22', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '103 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(489, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-23', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(490, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-24', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '104 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(491, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-25', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '404 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(492, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-26', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '105 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(493, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-27', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '405 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(494, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-28', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '106 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(495, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-29', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '406 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(496, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-16', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '107 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(497, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-17', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '407 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(498, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-06', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(499, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '408 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(500, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-20', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '109 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(501, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-07', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '410 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(502, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-08', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '111 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(503, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-09', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '411 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(504, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-10', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '112 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(505, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-11', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '412 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(506, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-12', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '113 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(507, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-17', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '413 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(508, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-06', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '114 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(509, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-17', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '414 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(510, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-18', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '115 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(511, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '415 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(512, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-20', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '116 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(513, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-21', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '416 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(514, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-18', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '417 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(515, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-17', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '118 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(516, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-18', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '418 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(517, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-21', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '119 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(518, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '120 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(519, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-24', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '420 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(520, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-17', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '121 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(521, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-18', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '421 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(522, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-27', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '122 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(523, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-16', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '422 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(524, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-17', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '123 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(525, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-18', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '423 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(526, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-21', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '124 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(527, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-22', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '424 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(528, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '125 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(529, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-24', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '425 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(530, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-05', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '126 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(531, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-06', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '426 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(532, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-07', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '127 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(533, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-08', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '427 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(534, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-09', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '128 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(535, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-10', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '428 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(536, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-11', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '129 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(537, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-12', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '429 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(538, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-13', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '130 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(539, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-14', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '430 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(540, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-16', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '131 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(541, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-17', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '431 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(542, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-16', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '132 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(543, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-17', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '432 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(544, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-21', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '133 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(545, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-22', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '433 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(546, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '134 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(547, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-24', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '434 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(548, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-22', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '135 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(549, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-23', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '435 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(550, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-24', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '136 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(551, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-25', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '436 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(552, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-26', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '137 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(553, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-27', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '437 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(554, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-28', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '138 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(555, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-29', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '438 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(556, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-30', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '139 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(557, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-01', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '439 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(558, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-02', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '140 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(559, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-03', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '440 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(560, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-04', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '141 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(561, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-05', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '441 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(562, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-06', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '142 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(563, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-07', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '442 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(564, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-08', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '143 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(565, 'I', 'I', 'C', 'CSM', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-21', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '443 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(566, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-22', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '144 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(567, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-23', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '444 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(568, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-24', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '145 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(569, 'I', 'I', 'C', 'SFP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-08', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '445 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(570, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-09', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '146 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(571, 'I', 'I', 'C', 'SCN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-16', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '446 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(572, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-17', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '147 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(573, 'I', 'I', 'C', 'SCA', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-21', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '447 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(574, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-22', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '148 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(575, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-23', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '448 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(576, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-24', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '149 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(577, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-06', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '149 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(578, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-22', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(579, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-22', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '3', 0, ''),
(580, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-22', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '5', 0, ''),
(581, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-22', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '7', 0, ''),
(582, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-22', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '11', 0, ''),
(583, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-22', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '100 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '13', 0, ''),
(584, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-11-22', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '103 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '17', 0, ''),
(585, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(586, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(587, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(588, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(589, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(590, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(591, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, '');
INSERT INTO `orden_de_trabajo` (`numero`, `tipoorden`, `tipotarea`, `sistemaemisor`, `tipoproducto`, `fechahoracreacion`, `usuariocreador`, `fechahoradistribucion`, `fechaprevista`, `identificadorsupervisor`, `equipo`, `fechacancelacion`, `nombrecliente`, `apellidocliente`, `cedula`, `telefono`, `direccion`, `localidad`, `departamento`, `fechahoradespacho`, `comentariosupervisor`, `equipodespacho`, `fechahoracierre`, `comentarioscierre`, `estado`, `codigozona`, `prioridad`, `horario`, `comentario`, `funcionesrequeridas`, `comentarioequipo`) VALUES
(592, 'I', 'I', 'C', 'CIP', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-19', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '403 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(593, 'I', 'I', 'C', 'SVV', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-20', '', 'ECANLAP010', NULL, 'Maria', 'Garcia', '2.000.000-', '407 50 60', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '19', 0, ''),
(594, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(595, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(596, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(597, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(598, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(599, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(600, 'I', 'I', 'C', 'SVN', '2016-11-15 23:59:59', 'vendedor', NULL, '2016-12-23', '', 'ECANLAP010', NULL, 'Jose', 'Perez', '1.000.000-', '108 20 30', 'Calle 1', 'CANPAN', 'CAN', '2016-11-15 23:59:59', '', '', NULL, '', 'despachada', '', 3, 0, '2', 0, ''),
(613, 'I', 'I', 'C', 'SVN', '2016-11-28 00:04:21', 'vendedor', NULL, '2016-12-01', 'SCANPAN001', 'ECANPAN009', '2016-12-09', 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle', 'CANPAN', 'CAN', NULL, '', NULL, NULL, NULL, 'cancelada', '', 0, 1, 'Comentario', 26, ''),
(614, 'I', 'I', 'C', 'SVN', '2016-11-28 00:05:48', 'vendedor', NULL, '2016-12-01', 'SCANPAN001', 'ECANPAN009', '2016-12-09', 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle', 'CANPAN', 'CAN', NULL, 'Comentario de prueba de cancelacion de orden de trabajo', NULL, NULL, NULL, 'cancelada', '', 0, 1, 'Comentario', 26, ''),
(615, 'I', 'I', 'C', 'SVN', '2016-11-28 00:41:30', 'vendedor', NULL, '2016-12-01', 'SCANPAN001', 'ECANPAN009', '2016-12-09', 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle1', 'CANPAN', 'CAN', NULL, 'Aparece un cartel rojo que dice que debo ingresar por lo menos 5 caracteres.', NULL, NULL, NULL, 'cancelada', '', 0, 2, '', 26, NULL),
(616, 'I', 'I', 'C', 'SVN', '2016-11-28 00:46:31', 'vendedor', NULL, '2016-12-01', 'SCANPAN001', 'ECANPAN009', '2016-12-09', 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle1', 'CANPAN', 'CAN', NULL, '12345', NULL, NULL, NULL, 'cancelada', '', 0, 2, '', 26, NULL),
(617, 'I', 'I', 'C', 'SVN', '2016-11-28 00:50:38', 'vendedor', NULL, '2016-12-01', 'SCANPAN001', 'ECANPAN009', '2016-12-09', 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle1', 'CANPAN', 'CAN', NULL, '123456', NULL, NULL, NULL, 'cancelada', '', 0, 2, '', 26, NULL),
(618, 'I', 'I', 'C', 'SVN', '2016-11-28 00:52:07', 'vendedor', NULL, '2016-12-01', 'SCANPAN001', 'ECANPAN009', '2016-12-09', 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle1', 'CANPAN', 'CAN', NULL, '123456', NULL, NULL, NULL, 'cancelada', '', 0, 2, '', 26, NULL),
(619, 'I', 'I', 'C', 'SVN', '2016-11-28 00:53:03', 'vendedor', NULL, '2016-12-01', 'SCANPAN001', 'ECANPAN009', '2016-12-09', 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle1', 'CANPAN', 'CAN', NULL, '123456', NULL, NULL, NULL, 'cancelada', '', 0, 2, '', 26, NULL),
(620, 'I', 'I', 'C', 'SVN', '2016-11-28 00:54:09', 'vendedor', NULL, '2016-12-01', 'SCANPAN001', 'ECANPAN009', NULL, 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle1', 'CANPAN', 'CAN', '2016-12-09 05:00:06', NULL, 'ECANPAN009', NULL, NULL, 'despachada', '', 0, 2, '', 26, NULL),
(621, 'I', 'I', 'C', 'SVN', '2016-11-28 00:54:37', 'vendedor', NULL, '2016-12-01', 'SCANPAN001', 'ECANPAN009', NULL, 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle1', 'CANPAN', 'CAN', '2016-12-09 05:06:15', NULL, 'ECANPAN009', NULL, NULL, 'despachada', '', 0, 2, '', 26, NULL),
(622, 'I', 'I', 'C', 'SVN', '2016-11-28 00:54:53', 'vendedor', NULL, '2016-12-01', 'SCANPAN001', 'ECANPAN009', NULL, 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle1', 'CANPAN', 'CAN', '2016-12-09 05:06:16', NULL, 'ECANPAN009', NULL, NULL, 'despachada', '', 0, 2, '', 26, NULL),
(623, 'I', 'I', 'C', 'SVN', '2016-11-28 00:55:16', 'vendedor', NULL, '2016-12-01', 'SCANPAN001', 'ECANPAN009', NULL, 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle1', 'CANPAN', 'CAN', '2016-12-09 05:06:17', NULL, 'ECANPAN009', NULL, NULL, 'despachada', '', 0, 2, '', 26, NULL),
(624, 'I', 'I', 'C', 'SVN', '2016-11-28 00:56:22', 'vendedor', NULL, '2016-12-01', 'SCANPAN001', 'ECANPAN009', NULL, 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle1', 'CANPAN', 'CAN', '2016-12-09 05:06:18', NULL, 'ECANPAN009', NULL, NULL, 'despachada', '', 0, 2, '', 26, NULL),
(625, 'I', 'I', 'C', 'SVN', '2016-11-28 01:56:28', 'vendedor', NULL, '2016-12-01', 'SCANPAN001', 'ECANPAN029', NULL, 'Victorio', 'Cecot', 'Montevideo', '99679509', 'Calle 15', 'CANPAN', 'CAN', '2016-12-09 05:06:18', NULL, 'ECANPAN029', NULL, NULL, 'despachada', '', 0, 1, 'Solo de maÃ±ana.-', 26, NULL),
(626, 'I', 'I', 'C', 'SVN', '2016-11-28 02:19:19', 'vendedor', '2016-12-09 10:08:19', '2016-12-09', 'SCANPAN001', 'ECANPAN009', NULL, 'Victorio', 'Cecot', 'Montevideo', '99679509', 'Calle 100', 'CANPAN', 'CAN', '2016-12-09 10:08:19', 'Solo de tarde', 'ECANPAN009', NULL, NULL, 'despachada', '', 0, 2, 'Solo de tarde', 26, NULL),
(627, 'I', 'I', 'C', 'SVN', '2016-11-28 02:24:18', 'vendedor', NULL, '2016-11-30', NULL, 'ECANPAN009', NULL, 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle 100.-', 'CANPAN', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 1, 'Solo de maÃ±ana.-', 26, NULL),
(628, 'I', 'I', 'C', 'SVV', '2016-11-28 02:31:26', 'vendedor', NULL, '2016-11-30', NULL, 'ECANPAN001', NULL, 'Victorio', 'Cecot', 'Montevideo', '99679509', 'calle', 'CANPAN', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 2, 'Hola', 2, NULL),
(629, 'I', 'I', 'C', 'SVN', '2016-11-28 02:52:59', 'vendedor', NULL, '2016-12-01', NULL, 'ECANPAN029', NULL, 'Victorio', 'Cecot', 'Montevideo', '99679509', 'La calle', 'CANPAN', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 1, 'Este es un comentario para que vayan de maÃ±ana', 26, NULL),
(630, 'I', 'I', 'C', 'SVV', '2016-11-30 23:26:20', 'vendedor', NULL, '2016-12-02', NULL, 'ECANLPI001', NULL, 'Victor', 'Paz', '56743567', '32131', 'Palo alto 1129 esquina steve jobs', 'CANLPI', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 3, 'ESTA AL PEDO TODO EL DIA', 2, NULL),
(631, 'I', 'I', 'C', 'CSM', '2016-12-08 21:59:18', 'vendedor', NULL, '2016-12-08', NULL, 'ECANPAN010', NULL, 'Juan', 'Pueblo', '2.000.000.6', '41002030', 'Calle sin nombre', 'CANPAN', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 3, '', 38, NULL),
(632, 'I', 'I', 'C', 'SVN', '2016-12-08 22:14:41', 'vendedor', NULL, '2016-12-08', NULL, 'ECANPAN009', NULL, 'Juan', 'Pueblo', '2.000.000.6', '41002030', 'Calle sin nombre\r\n', 'CANPAN', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 1, '', 26, NULL),
(633, 'I', 'I', 'C', 'SVN', '2016-12-08 22:16:05', 'vendedor', NULL, '2016-12-08', NULL, 'ECANPAN009', NULL, 'j', 'Pueblo', '2.000.000.6', '4', 'c', 'CANPAN', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 1, '', 26, NULL),
(634, 'I', 'I', 'C', 'SVN', '2016-12-08 22:25:11', 'vendedor', NULL, '2016-12-08', NULL, 'ECANPAN009', NULL, 'Juan', 'Pueblo', '2.000.000.6', '41002030', 'calle x', 'CANPAN', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 1, '', 26, NULL),
(635, 'I', 'I', 'C', 'SVN', '2016-12-08 22:26:21', 'vendedor', NULL, '2016-12-08', NULL, 'ECANLAP001', NULL, 'Juan', 'Pueblo', '2.000.000.6', '41002030', 'calle y', 'CANLAP', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 1, '', 26, NULL),
(636, 'I', 'I', 'C', 'SVN', '2016-12-08 22:28:25', 'vendedor', NULL, '2016-12-08', NULL, 'ECANLAP001', NULL, 'Juan', 'Pueblo', '2.000.000.6', '41002030', 'calle l', 'CANLAP', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 3, '', 26, NULL),
(637, 'I', 'I', 'C', 'SVN', '2016-12-08 22:31:12', 'vendedor', NULL, '2016-12-08', NULL, 'ECANLAP001', NULL, 'Juan', 'Pueblo', '2.000.000.6', '41002030', 'cd', 'CANLAP', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 3, '', 26, NULL),
(638, 'I', 'I', 'C', 'SVN', '2016-12-08 22:33:18', 'vendedor', NULL, '2016-12-08', NULL, 'ECANLAP001', NULL, 'j', 'Pueblo', '2.000.000.6', '41002030', 'r', 'CANLAP', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 3, '', 26, NULL),
(639, 'I', 'I', 'C', 'SVN', '2016-12-08 22:37:36', 'vendedor', NULL, '2016-12-08', NULL, 'ECANLAP001', NULL, 'Juan', 'Pueblo', '2.000.000.6', '41002030', 'calle 2', 'CANLAP', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 3, '', 26, NULL),
(640, 'I', 'I', 'C', 'SVN', '2016-12-08 22:39:15', 'vendedor', NULL, '2016-12-08', NULL, 'ECANLAP001', NULL, 'j', 'Pueblo', '2.000.000.6', '41002030', 'f', 'CANLAP', 'CAN', NULL, NULL, NULL, NULL, NULL, 'programada', '', 0, 3, '', 26, NULL),
(641, 'I', 'I', 'C', 'SVN', '2016-12-08 22:45:53', 'vendedor', '2016-12-09 10:07:44', '2017-01-05', 'SCANPAN001', 'ECANPAN009', NULL, 'Juan', 'Pueblo', '2.000.000.6', '41002030', 'f', 'CANPAN', 'CAN', '2016-12-09 10:07:44', '', 'ECANPAN009', NULL, NULL, 'despachada', '', 0, 3, '', 26, NULL),
(642, 'I', 'I', 'C', 'SVN', '2016-12-08 22:49:35', 'vendedor', NULL, '2017-01-03', 'SCANPAN001', 'ECANPAN009', NULL, 'Juan', 'Pueblo', '2.000.000.6', '41002030', 'calle 100', 'CANPAN', 'CAN', '2016-12-09 09:48:54', '', 'ECANPAN009', NULL, NULL, 'programada', '', 0, 3, '', 26, NULL),
(643, 'I', 'I', 'C', 'SVN', '2016-12-08 22:51:37', 'vendedor', NULL, '2016-12-08', 'SCANPAN001', 'ECANPAN029', NULL, 'Juan', 'Pueblo', '2.000.000.6', '41002030', 'e', 'CANPAN', 'CAN', '2016-12-09 05:48:20', NULL, NULL, '2016-12-09 05:48:20', 'Estos son mis cmentarios, supervisor 1.', 'cerrada', '', 0, 3, '', 26, NULL),
(644, 'I', 'I', 'C', 'SVN', '2016-12-08 22:57:29', 'vendedor', NULL, '2016-12-08', 'SCANPAN001', 'ECANPAN029', NULL, 'Juan', 'Pueblo', '2.000.000.6', '41002030', 'OK', 'CANPAN', 'CAN', '2016-12-09 05:44:59', NULL, NULL, '2016-12-09 05:44:59', 'EL SUPERVISOR NO INGRESO COMENTARIOS DE CIERRE.', 'cerrada', '', 0, 1, 'si', 26, NULL),
(645, 'I', 'I', 'C', 'SVN', '2016-12-08 23:06:05', 'vendedor', NULL, '2016-12-08', 'SCANPAN001', 'ECANPAN029', NULL, 'Juan', 'Pueblo', '2.000.000.6', '41002030', 'q', 'CANPAN', 'CAN', NULL, NULL, NULL, '2016-12-09 05:39:43', 'EL SUPERVISOR NO INGRESO COMENTARIOS DE CIERRE.', 'cerrada', '', 0, 3, '', 26, 'Estos son los comentarios de equipo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_emisor`
--

CREATE TABLE `sistema_emisor` (
  `id` int(11) NOT NULL,
  `codigo` varchar(1) NOT NULL,
  `descripcion` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sistema_emisor`
--

INSERT INTO `sistema_emisor` (`id`, `codigo`, `descripcion`) VALUES
(1, 'C', 'comercial'),
(2, 'S', 'soporte'),
(3, 'W', 'web service');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_de_producto`
--

CREATE TABLE `tipos_de_producto` (
  `id` int(11) NOT NULL,
  `codigo` char(3) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `accion` varchar(100) NOT NULL,
  `habilidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipos_de_producto`
--

INSERT INTO `tipos_de_producto` (`id`, `codigo`, `descripcion`, `accion`, `habilidad`) VALUES
(1, 'SVV', 'Sistema video vigilancia', 'instalar', 2),
(2, 'SVV', 'Sistema video vigilancia', 'reparar', 3),
(3, 'SVN', 'Sistema video nocturna', 'instalar', 26),
(4, 'SVN', 'Sistema video nocturna', 'reparar', 3),
(5, 'CSM', 'Cámaras sensor movimiento', 'instalar', 38),
(6, 'CSM', 'Cámaras sensor movimiento', 'reparar', 3),
(7, 'CIP', 'Cámaras IP remotas', 'instalar', 13),
(8, 'CIP', 'Cámaras IP remotas', 'reparar', 17),
(9, 'SFP', 'Sistema filmacion plus', 'instalar', 13),
(10, 'SFP', 'Sistema filmacion plus', 'reparar', 17),
(11, 'SCN', 'Sistema control niños', 'instalar', 11),
(12, 'SCN', 'Sistema control niños', 'reparar', 3),
(13, 'SCA', 'Sistema contro ancianos', 'instalar', 11),
(14, 'SCA', 'Sistema contro ancianos', 'reparar', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_de_tarea`
--

CREATE TABLE `tipos_de_tarea` (
  `id` int(11) NOT NULL,
  `codigo` char(1) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `aplica_habilidades_del_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipos_de_tarea`
--

INSERT INTO `tipos_de_tarea` (`id`, `codigo`, `descripcion`, `aplica_habilidades_del_producto`) VALUES
(1, 'I', 'instalar', 1),
(2, 'R', 'reparar', 1),
(3, 'C', 'recambio', 0),
(4, 'M', 'mantenimiento', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_ordenes`
--

CREATE TABLE `tipo_de_ordenes` (
  `id` int(11) NOT NULL,
  `codigo` char(1) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_de_ordenes`
--

INSERT INTO `tipo_de_ordenes` (`id`, `codigo`, `descripcion`) VALUES
(1, 'I', 'Instalación'),
(2, 'R', 'Reclamo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_rol`
--

CREATE TABLE `tipo_de_rol` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_de_rol`
--

INSERT INTO `tipo_de_rol` (`id`, `nombre`) VALUES
(1, 'Admin'),
(2, 'Comercial'),
(3, 'Supervisor'),
(4, 'Equipo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria_cuota`
--
ALTER TABLE `auditoria_cuota`
  ADD PRIMARY KEY (`identificadorequipo`) USING BTREE;

--
-- Indices de la tabla `cuota_excepcional`
--
ALTER TABLE `cuota_excepcional`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`identificador`);

--
-- Indices de la tabla `feriados`
--
ALTER TABLE `feriados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `habilidad`
--
ALTER TABLE `habilidad`
  ADD PRIMARY KEY (`id`,`codigo`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id`,`id_depart`);

--
-- Indices de la tabla `orden_de_trabajo`
--
ALTER TABLE `orden_de_trabajo`
  ADD PRIMARY KEY (`numero`);

--
-- Indices de la tabla `sistema_emisor`
--
ALTER TABLE `sistema_emisor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_de_producto`
--
ALTER TABLE `tipos_de_producto`
  ADD PRIMARY KEY (`id`,`codigo`);

--
-- Indices de la tabla `tipos_de_tarea`
--
ALTER TABLE `tipos_de_tarea`
  ADD PRIMARY KEY (`id`,`codigo`);

--
-- Indices de la tabla `tipo_de_ordenes`
--
ALTER TABLE `tipo_de_ordenes`
  ADD PRIMARY KEY (`id`,`codigo`);

--
-- Indices de la tabla `tipo_de_rol`
--
ALTER TABLE `tipo_de_rol`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuota_excepcional`
--
ALTER TABLE `cuota_excepcional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `feriados`
--
ALTER TABLE `feriados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `habilidad`
--
ALTER TABLE `habilidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `orden_de_trabajo`
--
ALTER TABLE `orden_de_trabajo`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=646;
--
-- AUTO_INCREMENT de la tabla `sistema_emisor`
--
ALTER TABLE `sistema_emisor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tipos_de_producto`
--
ALTER TABLE `tipos_de_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `tipos_de_tarea`
--
ALTER TABLE `tipos_de_tarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipo_de_ordenes`
--
ALTER TABLE `tipo_de_ordenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_de_rol`
--
ALTER TABLE `tipo_de_rol`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
