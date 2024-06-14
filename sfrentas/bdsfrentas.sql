
drop database if exists bdsfrentas;
create database bdsfrentas;
show databases;
use bdsfrentas;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `cliente`
CREATE TABLE `usuario` (
  `idUsuario` int(11) UNSIGNED NOT NULL,
  `Boleta` varchar(10) DEFAULT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `compras`
CREATE TABLE `compras` (
  `idCompras` int(11) UNSIGNED NOT NULL,
  `idUsuario` int(11) UNSIGNED NOT NULL,
  `idPago` int(11) UNSIGNED NOT NULL,
  `FechaCompras` varchar(11) DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `detalle_compras`
CREATE TABLE `detalle_compras` (
  `idDetalle` int(10) UNSIGNED NOT NULL,
  `idReporte` int(11) UNSIGNED NOT NULL,
  `idCompras` int(11) UNSIGNED NOT NULL,
  `Cantidad` int(11) UNSIGNED DEFAULT NULL,
  `PrecioCompra` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `pago`
CREATE TABLE `pago` (
  `idPago` int(11) UNSIGNED NOT NULL,
  `Monto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `producto`
CREATE TABLE `reporte` (
  `idReporte` int(11) UNSIGNED NOT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Cantreporte` int(11) UNSIGNED DEFAULT NULL,
  `Imagen` VARCHAR(255) NOT NULL,
  `Turno` varchar(255) DEFAULT NULL,
  `Lugar` varchar(255) DEFAULT NULL,  
  `Fechasuceso` VARCHAR(255) NOT NULL,
  `Correou` varchar(255) DEFAULT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Indices de la tabla `cliente`
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

-- Indices de la tabla `compras`
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompras`),
  ADD KEY `Compras_FKIndex1` (`idPago`),
  ADD KEY `Compras_FKIndex2` (`idUsuario`);

-- Indices de la tabla `detalle_compras`
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`idDetalle`,`idReporte`,`idCompras`),
  ADD KEY `Reporte_has_Compras_FKIndex1` (`idReporte`),
  ADD KEY `Reporte_has_Compras_FKIndex2` (`idCompras`);

-- Indices de la tabla `pago`
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`);

-- Indices de la tabla `producto`
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`idReporte`);

-- AUTO_INCREMENT de la tabla `cliente`
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

-- AUTO_INCREMENT de la tabla `compras`
ALTER TABLE `compras`
  MODIFY `idCompras` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

-- AUTO_INCREMENT de la tabla `detalle_compras`
ALTER TABLE `detalle_compras`
  MODIFY `idDetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

-- AUTO_INCREMENT de la tabla `pago`
ALTER TABLE `pago`
  MODIFY `idPago` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
  ALTER TABLE `reporte`
  MODIFY `idReporte` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

-- Filtros para la tabla `compras`
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Filtros para la tabla `detalle_compras`
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`idReporte`) REFERENCES `reporte` (`idReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION;

