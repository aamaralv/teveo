-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2016 a las 10:54:59
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Create schema teveo
--

CREATE DATABASE IF NOT EXISTS teveo;
USE teveo;
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
  `identificadorequipo` varchar(10) NOT NULL,
  `fecha_cambio` datetime NOT NULL,
  `usuario_cambio` datetime NOT NULL,
  `fecha_aplicacion` datetime NOT NULL,
  `cuotaLV` int(10) UNSIGNED DEFAULT NULL,
  `cuotaS` int(10) UNSIGNED DEFAULT NULL,
  `cuotaD` int(10) UNSIGNED DEFAULT NULL,
  `cuotaF` int(10) UNSIGNED DEFAULT NULL
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
  `codigozona` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `id` char(3) NOT NULL,
  `id_depart` char(3) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `id_depart`, `nombre`) VALUES
('LAP', 'CAN', 'La Paz'),
('LPI', 'CAN', 'Las Piedras'),
('MON', 'MON', 'Montevideo'),
('PAN', 'CAN', 'Pando');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_de_trabajo`
--

CREATE TABLE `orden_de_trabajo` (
  `numero` int(10) UNSIGNED NOT NULL,
  `tipoorden` char(1) NOT NULL,
  `tipotareaid` int(10) UNSIGNED NOT NULL,
  `sistemaemisor` varchar(45) NOT NULL,
  `tipoproductoid` int(10) UNSIGNED NOT NULL,
  `fechahoracreacion` datetime NOT NULL,
  `usuariocreador` varchar(10) NOT NULL,
  `fechahoradistribucion` datetime NOT NULL,
  `fechaprevista` datetime NOT NULL,
  `identificadorsupervisor` varchar(10) NOT NULL,
  `identificadorempleado` varchar(10) NOT NULL,
  `fechacancelacion` datetime NOT NULL,
  `nombrecliente` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `fechahoradespacho` datetime NOT NULL,
  `comentariosupervisor` varchar(250) NOT NULL,
  `equipodespacho` varchar(10) NOT NULL,
  `fechahoracierre` datetime NOT NULL,
  `comentarioscierre` varchar(250) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `codigozona` char(3) NOT NULL,
  `prioridad` int(10) UNSIGNED NOT NULL,
  `funcionesrequeridas` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'SVV', 'Sistema video vigilancia', 'instalacion', 2),
(2, 'SVV', 'Sistema video vigilancia', 'reparacion', 3),
(3, 'SVN', 'Sistema video nocturna', 'instalacion', 26),
(4, 'SVN', 'Sistema video nocturna', 'reparacion', 3),
(5, 'CSM', 'Cámaras sensor movimiento', 'instalacion', 38),
(6, 'CSM', 'Cámaras sensor movimiento', 'reparacion', 3),
(7, 'CIP', 'Cámaras IP remotas', 'instalacion', 13),
(8, 'CIP', 'Cámaras IP remotas', 'reparacion', 17),
(9, 'SFP', 'Sistema filmacion plus', 'instalacion', 13),
(10, 'SFP', 'Sistema filmacion plus', 'reparacion', 17),
(11, 'SCN', 'Sistema control niños', 'instalacion', 11),
(12, 'SCN', 'Sistema control niños', 'reparacion', 3),
(13, 'SCA', 'Sistema contro ancianos', 'instalacion', 11),
(14, 'SCA', 'Sistema contro ancianos', 'reparacion', 3);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ci` int(10) UNSIGNED NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `rolid` int(10) UNSIGNED NOT NULL,
  `identificadorsupervisor` varchar(10) NOT NULL,
  `identificadorequipo` varchar(10) NOT NULL,
  `habilitado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ci`, `usuario`, `password`, `nombre`, `apellido`, `telefono`, `rolid`, `identificadorsupervisor`, `identificadorequipo`, `habilitado`) VALUES
(42348747, 'aamaral', 'admin', 'Alexander', 'Amaral', '099111222', 1, '-', '-', 1),
(43337778, 'grodrigez', 'admin', 'Gaston', 'Rodrigez', '099888555', 1, '-', '-', 1),
(47772221, 'vcecot', 'admin', 'Victorio ', 'Cecot', '099165852', 1, '-', '-', 1);

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
  ADD PRIMARY KEY (`identificadorequipo`) USING BTREE;

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`identificador`) USING BTREE,
  ADD KEY `FK_equipo_departamento` (`codigozona`,`identificadorsupervisor`);

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
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario`) USING BTREE,
  ADD UNIQUE KEY `UC_empleado` (`ci`,`usuario`) USING BTREE,
  ADD KEY `FK_usuario_rol` (`rolid`,`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `habilidad`
--
ALTER TABLE `habilidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `orden_de_trabajo`
--
ALTER TABLE `orden_de_trabajo`
  MODIFY `numero` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipos_de_producto`
--
ALTER TABLE `tipos_de_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `tipos_de_tarea`
--
ALTER TABLE `tipos_de_tarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `FK_equipo_deparmento` FOREIGN KEY (`codigozona`) REFERENCES `departamento` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`rolid`) REFERENCES `tipo_de_rol` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
