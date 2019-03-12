-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2019 a las 04:10:12
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `substancesoft`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chefs`
--

CREATE TABLE `chefs` (
  `clave` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `cocina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocina`
--

CREATE TABLE `cocina` (
  `clave` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cocina`
--

INSERT INTO `cocina` (`clave`, `nombre`) VALUES
(1, 'Mexicana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

CREATE TABLE `funcion` (
  `clave` tinyint(4) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `funcion`
--

INSERT INTO `funcion` (`clave`, `descripcion`) VALUES
(1, 'Mesero '),
(2, 'Chef'),
(3, 'Cajero '),
(4, 'Cajero drive-through'),
(5, 'Individual: Liberar mesa'),
(6, 'Individual:Consulta inventario'),
(7, 'Individual: Consulta cuenta'),
(8, 'Individual: Pedir ticket');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `clave` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `cantidad` float DEFAULT '0',
  `especificacion` enum('kg','mg','lt','ml','pza') NOT NULL,
  `existencia_critica` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ingrediente`
--

INSERT INTO `ingrediente` (`clave`, `nombre`, `cantidad`, `especificacion`, `existencia_critica`) VALUES
(1, 'pollo', 150.2, 'kg', 4),
(2, 'queso', 500, 'lt', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `numero` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mesa`
--

INSERT INTO `mesa` (`numero`, `capacidad`) VALUES
(1, 10),
(2, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `clave` bigint(20) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(30) NOT NULL,
  `mesa` int(11) NOT NULL,
  `estado` enum('abierta','cerrada','','') NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`clave`, `fecha`, `usuario`, `mesa`, `estado`, `descripcion`, `total`) VALUES
(1, '2019-03-05 04:52:39', 'Admin100', 1, 'cerrada', '', 0),
(18, '2019-03-10 10:09:58', 'Admin100', 2, 'cerrada', 'Mesa cool', 8252.2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `clave` bigint(20) NOT NULL,
  `estado` enum('pedido','listo','entregado','') NOT NULL,
  `hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `platillo` int(11) NOT NULL,
  `orden` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`clave`, `estado`, `hora`, `platillo`, `orden`) VALUES
(2, 'entregado', '2019-03-10 12:27:07', 1, 18),
(3, 'entregado', '2019-03-10 12:29:57', 4, 18),
(4, 'entregado', '2019-03-10 12:30:04', 3, 18),
(5, 'entregado', '2019-03-10 12:30:04', 3, 18),
(6, 'entregado', '2019-03-10 12:30:04', 3, 18),
(20, 'entregado', '2019-03-12 01:53:07', 4, 18),
(21, 'entregado', '2019-03-12 02:00:05', 4, 18),
(23, 'entregado', '2019-03-12 02:02:48', 4, 18),
(24, 'entregado', '2019-03-12 02:05:09', 4, 18),
(25, 'entregado', '2019-03-12 02:05:12', 4, 18),
(26, 'entregado', '2019-03-12 02:06:11', 3, 18);

--
-- Disparadores `pedidos`
--
DELIMITER $$
CREATE TRIGGER `sumar-pedido` AFTER INSERT ON `pedidos` FOR EACH ROW BEGIN
update orden set total = 
(select sum(platillo.precio) from platillo, (select * from orden) as ord, 
pedidos where platillo.clave= pedidos.platillo and ord.clave = NEW.clave and 
ord.clave=pedidos.orden) 
where clave = NEW.clave;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `clave` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `permiso` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`clave`, `username`, `permiso`) VALUES
(3, 'Admin100', 1),
(1, 'Admin100', 3),
(2, 'Admin100', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platillo`
--

CREATE TABLE `platillo` (
  `clave` int(11) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `precio` float NOT NULL DEFAULT '0',
  `dificultad` enum('1','2','3','4','5') DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `imagen` blob,
  `cocina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `platillo`
--

INSERT INTO `platillo` (`clave`, `nombre`, `precio`, `dificultad`, `descripcion`, `imagen`, `cocina`) VALUES
(1, '0', 100.2, '1', 'Uma delisia', NULL, 1),
(3, 'Caviar', 1828, '1', 'Uma delisia', NULL, 1),
(4, 'pizza', 120, '1', 'pizza', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `clave` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `clave` bigint(20) NOT NULL,
  `cantidad` float NOT NULL,
  `ingrediente` int(11) NOT NULL,
  `platillo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`clave`, `cantidad`, `ingrediente`, `platillo`) VALUES
(1, 0.5, 1, 3),
(3, 10, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `surtidos`
--

CREATE TABLE `surtidos` (
  `clave` bigint(20) NOT NULL,
  `cantidad` float NOT NULL,
  `frecuencia` int(11) NOT NULL,
  `ingrediente` int(11) NOT NULL,
  `proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido_p` varchar(30) DEFAULT NULL,
  `apellido_m` varchar(30) DEFAULT NULL,
  `telefono` bigint(11) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `tipo` enum('administrador','empleado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`username`, `password`, `nombre`, `apellido_p`, `apellido_m`, `telefono`, `direccion`, `tipo`) VALUES
('', '102', 'Uma delisia', '', '', 0, '', 'administrador'),
('Admin100', 'Ivan', 'Ivan', 'Lopez', 'Murillo', 331472010, 'Admin100', 'administrador'),
('DAADSDA', 'da', '', '', '', 0, '', 'administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `chefs`
--
ALTER TABLE `chefs`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `usuario` (`usuario`,`cocina`),
  ADD KEY `cocina` (`cocina`);

--
-- Indices de la tabla `cocina`
--
ALTER TABLE `cocina`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`numero`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `usuario` (`usuario`,`mesa`),
  ADD KEY `mesa` (`mesa`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `platillo` (`platillo`,`orden`),
  ADD KEY `orden` (`orden`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `username` (`username`,`permiso`),
  ADD KEY `permiso` (`permiso`);

--
-- Indices de la tabla `platillo`
--
ALTER TABLE `platillo`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `cocina` (`cocina`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `ingrediente` (`ingrediente`,`platillo`),
  ADD KEY `platillo` (`platillo`);

--
-- Indices de la tabla `surtidos`
--
ALTER TABLE `surtidos`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `ingrediente` (`ingrediente`,`proveedor`),
  ADD KEY `proveedor` (`proveedor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `chefs`
--
ALTER TABLE `chefs`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cocina`
--
ALTER TABLE `cocina`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `clave` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `platillo`
--
ALTER TABLE `platillo`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `surtidos`
--
ALTER TABLE `surtidos`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chefs`
--
ALTER TABLE `chefs`
  ADD CONSTRAINT `chefs_ibfk_1` FOREIGN KEY (`cocina`) REFERENCES `cocina` (`clave`),
  ADD CONSTRAINT `chefs_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`username`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`mesa`) REFERENCES `mesa` (`numero`),
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`username`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`platillo`) REFERENCES `platillo` (`clave`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`orden`) REFERENCES `orden` (`clave`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`username`) REFERENCES `usuario` (`username`),
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`permiso`) REFERENCES `funcion` (`clave`);

--
-- Filtros para la tabla `platillo`
--
ALTER TABLE `platillo`
  ADD CONSTRAINT `platillo_ibfk_1` FOREIGN KEY (`cocina`) REFERENCES `cocina` (`clave`);

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`platillo`) REFERENCES `platillo` (`clave`),
  ADD CONSTRAINT `recetas_ibfk_2` FOREIGN KEY (`ingrediente`) REFERENCES `ingrediente` (`clave`);

--
-- Filtros para la tabla `surtidos`
--
ALTER TABLE `surtidos`
  ADD CONSTRAINT `surtidos_ibfk_1` FOREIGN KEY (`ingrediente`) REFERENCES `ingrediente` (`clave`),
  ADD CONSTRAINT `surtidos_ibfk_2` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`clave`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
