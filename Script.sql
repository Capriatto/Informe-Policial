-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-02-2015 a las 20:09:22
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `policial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atraco_persona`
--

CREATE TABLE IF NOT EXISTS `atraco_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atraco_sucursal_id` int(11) NOT NULL,
  `persona_detenida_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1` (`persona_detenida_id`),
  KEY `fk2` (`atraco_sucursal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atraco_sucursal`
--

CREATE TABLE IF NOT EXISTS `atraco_sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sucursal_id` int(11) NOT NULL,
  `fecha_atraco` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk3` (`sucursal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banda`
--

CREATE TABLE IF NOT EXISTS `banda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(4) NOT NULL,
  `nombre_banda` varchar(140) NOT NULL,
  `cantidad_miembros` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `banda`
--

INSERT INTO `banda` (`id`, `codigo`, `nombre_banda`, `cantidad_miembros`) VALUES
(1, 111, 'Banda1', 2),
(2, 245, 'Banda2', 4),
(3, 235, 'Banda3', 5),
(4, 176, 'Banda4', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_juzgado`
--

CREATE TABLE IF NOT EXISTS `caso_juzgado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_atraco_id` int(11) NOT NULL,
  `condenado` tinyint(1) NOT NULL,
  `juez_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk4` (`codigo_atraco_id`),
  KEY `fk5` (`juez_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_sucursal`
--

CREATE TABLE IF NOT EXISTS `empleado_sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sucursal_id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `identificacion` varchar(12) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk6` (`sucursal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad_bancaria`
--

CREATE TABLE IF NOT EXISTS `entidad_bancaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domicilio` int(4) NOT NULL,
  `domicilio_central` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juez`
--

CREATE TABLE IF NOT EXISTS `juez` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_interno_juzgado` int(4) NOT NULL,
  `nombre_completo` varchar(40) NOT NULL,
  `anios_servicio` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_detenida`
--

CREATE TABLE IF NOT EXISTS `persona_detenida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(40) NOT NULL,
  `nombre_completo` varchar(40) NOT NULL,
  `identidad` int(15) NOT NULL,
  `banda_id` int(11) NOT NULL,
  `nom_foto` varchar(100) NOT NULL,
  `imagen` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk7` (`banda_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE IF NOT EXISTS `sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entidad_bancaria_id` int(11) NOT NULL,
  `codigo` int(4) NOT NULL,
  `domicilio_sucursal` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk8` (`entidad_bancaria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vigilante`
--

CREATE TABLE IF NOT EXISTS `vigilante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(4) NOT NULL,
  `edad` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vigilante_entidad`
--

CREATE TABLE IF NOT EXISTS `vigilante_entidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vigilante_id` int(11) NOT NULL,
  `entidad_bancaria_id` int(11) NOT NULL,
  `fecha_contrato` date NOT NULL,
  `tiene_arma` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk9` (`vigilante_id`),
  KEY `fk10` (`entidad_bancaria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vigilante_sucursal`
--

CREATE TABLE IF NOT EXISTS `vigilante_sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vigilante_id` int(11) NOT NULL,
  `sucursal_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tiene_arma` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk11` (`vigilante_id`),
  KEY `fk12` (`sucursal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `atraco_persona`
--
ALTER TABLE `atraco_persona`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`persona_detenida_id`) REFERENCES `persona_detenida` (`id`),
  ADD CONSTRAINT `fk2` FOREIGN KEY (`atraco_sucursal_id`) REFERENCES `atraco_sucursal` (`id`);

--
-- Filtros para la tabla `atraco_sucursal`
--
ALTER TABLE `atraco_sucursal`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`);

--
-- Filtros para la tabla `caso_juzgado`
--
ALTER TABLE `caso_juzgado`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`codigo_atraco_id`) REFERENCES `atraco_persona` (`id`),
  ADD CONSTRAINT `fk5` FOREIGN KEY (`juez_id`) REFERENCES `juez` (`id`);

--
-- Filtros para la tabla `empleado_sucursal`
--
ALTER TABLE `empleado_sucursal`
  ADD CONSTRAINT `fk6` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`);

--
-- Filtros para la tabla `persona_detenida`
--
ALTER TABLE `persona_detenida`
  ADD CONSTRAINT `fk7` FOREIGN KEY (`banda_id`) REFERENCES `banda` (`id`);

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `fk8` FOREIGN KEY (`entidad_bancaria_id`) REFERENCES `entidad_bancaria` (`id`);

--
-- Filtros para la tabla `vigilante_entidad`
--
ALTER TABLE `vigilante_entidad`
  ADD CONSTRAINT `fk10` FOREIGN KEY (`entidad_bancaria_id`) REFERENCES `entidad_bancaria` (`id`),
  ADD CONSTRAINT `fk9` FOREIGN KEY (`vigilante_id`) REFERENCES `vigilante` (`id`);

--
-- Filtros para la tabla `vigilante_sucursal`
--
ALTER TABLE `vigilante_sucursal`
  ADD CONSTRAINT `fk11` FOREIGN KEY (`vigilante_id`) REFERENCES `vigilante` (`id`),
  ADD CONSTRAINT `fk12` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursal` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
