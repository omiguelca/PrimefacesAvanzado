-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.0.89-community-nt - MySQL Community Edition (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para agenda
DROP DATABASE IF EXISTS `agenda`;
CREATE DATABASE IF NOT EXISTS `agenda` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `agenda`;


-- Volcando estructura para tabla agenda.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codigo` int(11) NOT NULL auto_increment,
  `nombre` varchar(50) collate latin1_spanish_ci NOT NULL,
  `estado` tinyint(1) default '1',
  PRIMARY KEY  (`codigo`),
  CONSTRAINT `FK_categoria_persona` FOREIGN KEY (`codigo`) REFERENCES `persona` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla agenda.categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


-- Volcando estructura para tabla agenda.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `codigo` tinyint(4) NOT NULL auto_increment,
  `nombre` varchar(50) collate latin1_spanish_ci default NULL,
  `tipo` enum('S','I') collate latin1_spanish_ci default NULL,
  `tipoUsuario` enum('A','O') collate latin1_spanish_ci default NULL,
  `codigo_submenu` tinyint(4) default NULL,
  `estado` bit(1) default b'1',
  `url` varchar(50) collate latin1_spanish_ci default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla agenda.menu: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`codigo`, `nombre`, `tipo`, `tipoUsuario`, `codigo_submenu`, `estado`, `url`) VALUES
	(1, 'NOTAS', 'S', 'O', NULL, b'1', NULL),
	(2, 'NUEVO', 'I', 'O', 1, b'1', NULL),
	(3, 'BUSCAR', 'I', 'O', 1, b'1', NULL),
	(4, 'COMENTAR', 'I', 'O', NULL, b'1', NULL),
	(5, 'VALORAR', 'I', 'O', NULL, b'1', NULL),
	(6, 'OTRO', 'I', 'O', 1, b'1', NULL),
	(7, 'NUEVO_S', 'S', 'O', 1, b'1', NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- Volcando estructura para tabla agenda.nota
DROP TABLE IF EXISTS `nota`;
CREATE TABLE IF NOT EXISTS `nota` (
  `codigo` int(11) NOT NULL auto_increment,
  `codigo_persona` int(11) NOT NULL,
  `codigo_categoria` int(11) NOT NULL,
  `encabezado` varchar(50) collate latin1_spanish_ci NOT NULL,
  `cuerpo` varchar(250) collate latin1_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `comentarioAdmin` varchar(50) collate latin1_spanish_ci default NULL,
  `valorizacion` enum('1','2','3','4','5') collate latin1_spanish_ci default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla agenda.nota: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;


-- Volcando estructura para tabla agenda.persona
DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `codigo` int(11) NOT NULL auto_increment,
  `nombres` varchar(100) collate latin1_spanish_ci default NULL,
  `apellidos` varchar(100) collate latin1_spanish_ci default NULL,
  `sexo` enum('M','F') collate latin1_spanish_ci default NULL,
  `fechaNacimiento` date default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando estructura para tabla agenda.telefono
DROP TABLE IF EXISTS `telefono`;
CREATE TABLE IF NOT EXISTS `telefono` (
  `codigo` int(11) NOT NULL auto_increment,
  `codigo_persona` int(11) default NULL,
  `numero` varchar(9) collate latin1_spanish_ci default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla agenda.telefono: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;


-- Volcando estructura para tabla agenda.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `codigo` int(11) NOT NULL,
  `usuario` varchar(20) collate latin1_spanish_ci default NULL,
  `clave` varchar(40) collate latin1_spanish_ci default NULL,
  `tipo` enum('A','O') collate latin1_spanish_ci default NULL,
  `estado` tinyint(1) default NULL,
  PRIMARY KEY  (`codigo`),
  CONSTRAINT `FK_usuario_persona` FOREIGN KEY (`codigo`) REFERENCES `persona` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;