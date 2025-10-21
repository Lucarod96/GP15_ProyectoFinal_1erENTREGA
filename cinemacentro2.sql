-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2025 a las 00:45:54
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cinemacentro`
--
CREATE DATABASE IF NOT EXISTS `cinemacentro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cinemacentro`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asiento`
--

CREATE TABLE `asiento` (
  `CodLugar` int(11) NOT NULL,
  `Fila` int(11) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Estado` tinyint(4) DEFAULT NULL,
  `Funcion` int(11) DEFAULT NULL,
  `NroSala` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprador`
--

CREATE TABLE `comprador` (
  `Dni` varchar(15) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `FechaNac` date DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `MediodePago` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleticket`
--

CREATE TABLE `detalleticket` (
  `CodD` int(11) NOT NULL,
  `Funcion` int(11) DEFAULT NULL,
  `cant` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleticket_lugar`
--

CREATE TABLE `detalleticket_lugar` (
  `CodD` int(11) NOT NULL,
  `CodLugar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

CREATE TABLE `funcion` (
  `Pelicula` varchar(30) DEFAULT NULL,
  `Idioma` varchar(30) DEFAULT NULL,
  `Es3D` tinyint(4) DEFAULT NULL,
  `Subtitulada` tinyint(4) DEFAULT NULL,
  `HoraInicio` datetime DEFAULT NULL,
  `HoraFin` datetime DEFAULT NULL,
  `LugaresDisponibles` int(11) DEFAULT NULL,
  `SalaDeProyeccion` int(11) DEFAULT NULL,
  `PreciodelLugar` double DEFAULT NULL,
  `IdFuncion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `Titulo` varchar(30) NOT NULL,
  `Director` varchar(30) NOT NULL,
  `Actores` varchar(60) NOT NULL,
  `Origen` varchar(30) NOT NULL,
  `Genero` varchar(30) NOT NULL,
  `Estreno` date NOT NULL,
  `enCartelera` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `NroSala` int(11) NOT NULL,
  `apta3D` tinyint(4) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticketcompra`
--

CREATE TABLE `ticketcompra` (
  `FechaCompra` date DEFAULT NULL,
  `FechaFuncion` date DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `Comprador` varchar(15) DEFAULT NULL,
  `CodTicket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asiento`
--
ALTER TABLE `asiento`
  ADD PRIMARY KEY (`CodLugar`),
  ADD KEY `fk_asiento_funcion2` (`Funcion`),
  ADD KEY `fk_asiento_sala` (`NroSala`);

--
-- Indices de la tabla `comprador`
--
ALTER TABLE `comprador`
  ADD PRIMARY KEY (`Dni`);

--
-- Indices de la tabla `detalleticket`
--
ALTER TABLE `detalleticket`
  ADD PRIMARY KEY (`CodD`),
  ADD KEY `fk_detalleticket_funcion2` (`Funcion`);

--
-- Indices de la tabla `detalleticket_lugar`
--
ALTER TABLE `detalleticket_lugar`
  ADD PRIMARY KEY (`CodD`,`CodLugar`),
  ADD KEY `fk_detalleticketlugar_asiento` (`CodLugar`);

--
-- Indices de la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD PRIMARY KEY (`IdFuncion`),
  ADD KEY `fk_funcion_pelicula2` (`Pelicula`),
  ADD KEY `fk_funcion_sala2` (`SalaDeProyeccion`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`Titulo`),
  ADD UNIQUE KEY `unq_pelicula_titulo` (`Titulo`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`NroSala`);

--
-- Indices de la tabla `ticketcompra`
--
ALTER TABLE `ticketcompra`
  ADD PRIMARY KEY (`CodTicket`),
  ADD KEY `fk_ticketcompra_comprador2` (`Comprador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `IdFuncion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ticketcompra`
--
ALTER TABLE `ticketcompra`
  MODIFY `CodTicket` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asiento`
--
ALTER TABLE `asiento`
  ADD CONSTRAINT `fk_asiento_funcion2` FOREIGN KEY (`Funcion`) REFERENCES `funcion` (`IdFuncion`),
  ADD CONSTRAINT `fk_asiento_sala` FOREIGN KEY (`NroSala`) REFERENCES `sala` (`NroSala`);

--
-- Filtros para la tabla `detalleticket`
--
ALTER TABLE `detalleticket`
  ADD CONSTRAINT `fk_detalleticket_funcion2` FOREIGN KEY (`Funcion`) REFERENCES `funcion` (`IdFuncion`);

--
-- Filtros para la tabla `detalleticket_lugar`
--
ALTER TABLE `detalleticket_lugar`
  ADD CONSTRAINT `detalleticket_lugar_ibfk_1` FOREIGN KEY (`CodD`) REFERENCES `detalleticket` (`CodD`),
  ADD CONSTRAINT `detalleticket_lugar_ibfk_2` FOREIGN KEY (`CodLugar`) REFERENCES `asiento` (`CodLugar`),
  ADD CONSTRAINT `fk_detalleticketlugar_asiento` FOREIGN KEY (`CodLugar`) REFERENCES `asiento` (`CodLugar`),
  ADD CONSTRAINT `fk_detalleticketlugar_detalleticket` FOREIGN KEY (`CodD`) REFERENCES `detalleticket` (`CodD`);

--
-- Filtros para la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD CONSTRAINT `fk_funcion_pelicula2` FOREIGN KEY (`Pelicula`) REFERENCES `pelicula` (`Titulo`),
  ADD CONSTRAINT `fk_funcion_sala2` FOREIGN KEY (`SalaDeProyeccion`) REFERENCES `sala` (`NroSala`),
  ADD CONSTRAINT `fk_funciones_pelicula` FOREIGN KEY (`Pelicula`) REFERENCES `pelicula` (`Titulo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ticketcompra`
--
ALTER TABLE `ticketcompra`
  ADD CONSTRAINT `fk_ticketcompra_comprador` FOREIGN KEY (`Comprador`) REFERENCES `comprador` (`Dni`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
