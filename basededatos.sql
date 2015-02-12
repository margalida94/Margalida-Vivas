-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-02-2015 a las 19:53:11
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `basededatos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
`id_curso` int(11) NOT NULL,
  `nombre_curso` varchar(45) NOT NULL,
  `codigo_curso` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curso`, `nombre_curso`, `codigo_curso`) VALUES
(1, 'Animacion', '111'),
(2, 'Web', '112'),
(3, 'Redes', '113');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE IF NOT EXISTS `estudiantes` (
`id_estudiantes` int(11) NOT NULL,
  `nombre_estudiante` varchar(45) NOT NULL,
  `codigo_estudiante` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id_estudiantes`, `nombre_estudiante`, `codigo_estudiante`) VALUES
(1, 'Margalida Vivas', '12212039'),
(2, 'Karol Giraldo', '12212035'),
(3, 'Laura Obando', '12212042');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_curso`
--

CREATE TABLE IF NOT EXISTS `estudiante_curso` (
`id_estudiante_curso` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estudiante_curso`
--

INSERT INTO `estudiante_curso` (`id_estudiante_curso`, `id_estudiante`, `id_curso`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE IF NOT EXISTS `nota` (
`id_nota` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `porcentaje` float NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`id_nota`, `nombre`, `porcentaje`, `id_curso`) VALUES
(1, 'Parcial Uno', 0.5, 1),
(2, 'Final', 0.5, 1),
(3, 'Diseño Pagina Web', 0.5, 2),
(4, 'Entrega Pagina Codigo', 0.5, 2),
(5, 'Taller Uno', 0.5, 3),
(6, 'Parcial Final', 0.5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_estudiante`
--

CREATE TABLE IF NOT EXISTS `nota_estudiante` (
`id` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_nota` int(11) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nota_estudiante`
--

INSERT INTO `nota_estudiante` (`id`, `id_estudiante`, `id_curso`, `id_nota`, `valor`) VALUES
(1, 1, 1, 1, 3.8),
(2, 1, 1, 2, 4.5),
(3, 2, 3, 3, 2.3),
(4, 2, 3, 4, 4.2),
(5, 3, 2, 5, 3.2),
(6, 3, 2, 6, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
 ADD PRIMARY KEY (`id_curso`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
 ADD PRIMARY KEY (`id_estudiantes`);

--
-- Indices de la tabla `estudiante_curso`
--
ALTER TABLE `estudiante_curso`
 ADD PRIMARY KEY (`id_estudiante_curso`), ADD KEY `id_estudiante_idx` (`id_estudiante`), ADD KEY `id_cursos_idx` (`id_curso`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
 ADD PRIMARY KEY (`id_nota`), ADD KEY `id_curso_idx` (`id_curso`);

--
-- Indices de la tabla `nota_estudiante`
--
ALTER TABLE `nota_estudiante`
 ADD PRIMARY KEY (`id`), ADD KEY `id_nota_idx` (`id_nota`), ADD KEY `id_curso_idx` (`id_curso`), ADD KEY `id_estudiante_idx` (`id_estudiante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
MODIFY `id_estudiantes` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `estudiante_curso`
--
ALTER TABLE `estudiante_curso`
MODIFY `id_estudiante_curso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `nota_estudiante`
--
ALTER TABLE `nota_estudiante`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante_curso`
--
ALTER TABLE `estudiante_curso`
ADD CONSTRAINT `id_cursos` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `id_estudiante` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiantes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
ADD CONSTRAINT `id_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nota_estudiante`
--
ALTER TABLE `nota_estudiante`
ADD CONSTRAINT `id_cursito` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `id_estudiantesñññ` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiantes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `id_notica` FOREIGN KEY (`id_nota`) REFERENCES `nota` (`id_nota`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
