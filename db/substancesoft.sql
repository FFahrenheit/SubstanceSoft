-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-04-2019 a las 04:34:37
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

--
-- Volcado de datos para la tabla `chefs`
--

INSERT INTO `chefs` (`clave`, `usuario`, `cocina`) VALUES
(4, 'chef1', 1),
(2, 'chef1', 2),
(3, 'chef1', 3);

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
(1, 'Mexicana'),
(2, 'Alemana'),
(3, 'Bebidas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fechas`
--

CREATE TABLE `fechas` (
  `nombre` varchar(15) NOT NULL,
  `valor` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fechas`
--

INSERT INTO `fechas` (`nombre`, `valor`) VALUES
('fecha_in', '2019-04-07 23:59:59'),
('fecha_fin', '2019-04-14 23:59:59');

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
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `nombre` varchar(30) NOT NULL,
  `venta` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`nombre`, `venta`) VALUES
('00:00 a 01:00', NULL),
('01:00 a 02:00', NULL),
('02:00 a 03:00', NULL),
('03:00 a 04:00', NULL),
('04:00 a 05:00', NULL),
('05:00 a 06:00', NULL),
('06:00 a 07:00', NULL),
('07:00 a 08:00', NULL),
('08:00 a 09:00', NULL),
('09:00 a 10:00', NULL),
('10:00 a 11:00', NULL),
('11:00 a 12:00', NULL),
('12:00 a 13:00', NULL),
('13:00 a 14:00', NULL),
('14:00 a 15:00', NULL),
('15:00 a 16:00', NULL),
('16:00 a 17:00', NULL),
('17:00 a 18:00', NULL),
('18:00 a 19:00', NULL),
('19:00 a 20:00', NULL),
('20:00 a 21:00', NULL),
('21:00 a 22:00', NULL),
('22:00 a 23:00', NULL),
('23:00 a 24:00', NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `horarios_venta`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `horarios_venta` (
`SUM(total)` double
,`hour(fecha)` int(2)
);

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
(1, 'pollo', 156, 'kg', 4),
(2, 'queso', 518, 'lt', 1),
(3, 'maiz', 115, 'kg', 1),
(4, 'Agua', 310, 'lt', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `destinatario` varchar(30) NOT NULL,
  `texto` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id`, `destinatario`, `texto`, `fecha`) VALUES
(24, 'Admin100', 'El platillo Caviar de la mesa 2 está listo', '2019-04-17 23:33:45'),
(25, 'Admin100', 'El platillo Caviar de la mesa 2 está listo', '2019-04-17 23:34:06'),
(26, 'Admin100', 'La cuenta en la mesa 2 ha sido pagada', '2019-04-18 00:00:46'),
(27, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-04-18 00:00:51');

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
(0, 0),
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
  `estado` enum('abierta','cerrada','pagada') NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`clave`, `fecha`, `usuario`, `mesa`, `estado`, `descripcion`, `total`) VALUES
(1, '2019-03-05 04:52:39', 'Admin100', 1, 'pagada', '', NULL),
(18, '2019-03-10 10:09:58', 'Admin100', 2, 'pagada', 'Mesa cool', 8132.2),
(19, '2019-03-12 05:23:44', 'Admin100', 1, 'pagada', 'Mesa mÃ¡s cool aÃºn', 240),
(20, '2019-03-17 20:09:59', 'admin', 1, 'pagada', 'Prueba comandas', 2048.2),
(21, '2019-03-18 02:18:40', 'Admin100', 0, 'pagada', 'Orden chico 1', 360),
(22, '2019-03-19 18:18:19', 'Admin100', 2, 'pagada', 'Orden nueva', 5484),
(23, '2019-03-19 18:33:19', 'Admin100', 2, 'pagada', 'Orden mesa 2', 1928),
(24, '2019-03-19 20:22:23', 'Admin100', 2, 'cerrada', 'Orden nueva', 240),
(25, '2019-03-19 20:32:44', 'Admin100', 0, 'pagada', 'Lentes', 240),
(26, '2019-03-19 20:33:17', 'Admin100', 0, 'pagada', 'Anillo', NULL),
(27, '2019-04-02 03:00:01', 'Admin100', 0, 'pagada', 'Katia', 360),
(28, '2019-04-02 19:13:09', 'Admin100', 0, 'pagada', 'Orden nueva', 100),
(29, '2019-04-16 18:26:26', 'Admin100', 0, 'abierta', 'Hola', 3656),
(30, '2019-04-16 18:27:09', 'Admin100', 1, 'abierta', '', NULL);

--
-- Disparadores `orden`
--
DELIMITER $$
CREATE TRIGGER `notificacion_orden` BEFORE UPDATE ON `orden` FOR EACH ROW BEGIN
	IF (NEW.estado = 'cerrada')
	THEN
		INSERT INTO mensajes(destinatario, texto) VALUES 
		(
			OLD.usuario,
				(SELECT CONCAT('La cuenta en la mesa ',
                  (OLD.mesa), ' ha sido cerrada'))
        );
    END IF;
            
    IF (NEW.estado = 'pagada')
     THEN
    	INSERT INTO mensajes(destinatario, texto) VALUES 
		(
			OLD.usuario,
				(SELECT CONCAT('La cuenta en la mesa ',
                  (OLD.mesa), ' ha sido pagada'))
        );
     END IF;
END
$$
DELIMITER ;

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
(26, 'entregado', '2019-03-12 02:06:11', 3, 18),
(27, 'entregado', '2019-03-12 05:23:53', 4, 19),
(28, 'entregado', '2019-03-12 05:23:53', 4, 19),
(29, 'entregado', '2019-03-17 20:10:31', 3, 20),
(30, 'entregado', '2019-03-17 20:11:09', 4, 20),
(31, 'entregado', '2019-03-17 20:22:52', 1, 20),
(33, 'entregado', '2019-03-18 02:28:36', 4, 21),
(34, 'entregado', '2019-03-18 02:28:36', 4, 21),
(35, 'entregado', '2019-03-18 02:28:36', 4, 21),
(36, 'entregado', '2019-03-19 18:18:26', 3, 22),
(37, 'entregado', '2019-03-19 18:18:26', 3, 22),
(38, 'entregado', '2019-03-19 18:18:27', 3, 22),
(39, 'listo', '2019-03-19 18:33:39', 3, 23),
(40, 'entregado', '2019-03-19 18:39:33', 6, 23),
(41, 'entregado', '2019-04-17 23:10:38', 4, 24),
(42, 'entregado', '2019-03-19 20:33:42', 4, 25),
(44, 'entregado', '2019-03-19 20:33:42', 4, 25),
(46, 'entregado', '2019-04-02 03:00:16', 4, 27),
(47, 'entregado', '2019-04-02 03:00:16', 4, 27),
(48, 'entregado', '2019-04-02 03:00:16', 4, 27),
(51, 'entregado', '2019-04-07 22:50:40', 6, 28),
(52, 'pedido', '2019-04-16 18:00:56', 4, 24),
(53, 'pedido', '2019-04-18 20:55:40', 3, 29),
(54, 'pedido', '2019-04-18 20:55:45', 3, 29);

--
-- Disparadores `pedidos`
--
DELIMITER $$
CREATE TRIGGER `notifiacion_platillo` BEFORE UPDATE ON `pedidos` FOR EACH ROW BEGIN
	IF NEW.estado = 'listo'
	THEN
		INSERT INTO mensajes(destinatario, texto) VALUES 
		(
			(SELECT usuario FROM orden WHERE clave = OLD.orden),
				(SELECT CONCAT('El platillo ', 
				(SELECT nombre FROM platillo  WHERE clave = OLD.platillo),
				' de la mesa ',
				(SELECT mesa FROM orden WHERE clave = OLD.orden),
				' esta listo' ))
        );
       END IF;
END
$$
DELIMITER ;
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
(9, 'chef1', 2),
(12, 'chef1', 5),
(14, 'chef1', 6),
(11, 'chef1', 7),
(13, 'chef1', 8),
(10, 'chef2', 2);

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
(4, 'pizza', 120, '1', 'pizza', NULL, 1),
(6, 'Sopa du macaco', 100, '5', 'Uma delisia', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `platillos_populares`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `platillos_populares` (
`suma` bigint(21)
,`nombre` varchar(35)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferencias`
--

CREATE TABLE `preferencias` (
  `nombre` varchar(30) NOT NULL,
  `valor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `preferencias`
--

INSERT INTO `preferencias` (`nombre`, `valor`) VALUES
('acceso_codigo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `clave` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`clave`, `nombre`) VALUES
(1, 'Fedex'),
(2, 'Navarro');

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
(3, 10, 2, 3),
(4, 0.01, 1, 6),
(5, 0.01, 2, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `surtidos`
--

CREATE TABLE `surtidos` (
  `clave` bigint(20) NOT NULL,
  `cantidad` float NOT NULL,
  `frecuencia` int(11) NOT NULL,
  `ingrediente` int(11) NOT NULL,
  `proveedor` int(11) NOT NULL,
  `nombre_trigger` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `surtidos`
--

INSERT INTO `surtidos` (`clave`, `cantidad`, `frecuencia`, `ingrediente`, `proveedor`, `nombre_trigger`) VALUES
(1, 100, 1, 4, 1, 'triggerIng4Prov1');

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
  `tipo` enum('administrador','empleado') DEFAULT NULL,
  `codigo` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`username`, `password`, `nombre`, `apellido_p`, `apellido_m`, `telefono`, `direccion`, `tipo`, `codigo`) VALUES
('admin', '102', 'Uma delisia', '', '', 0, '', 'administrador', 2893),
('Admin100', 'Ivan', 'Ivan', 'Lopez', 'Murillo', 331472010, 'Admin100', 'administrador', 2994),
('chef1', 'chef', 'Chef', '', '', 0, '', 'empleado', 9425),
('chef2', 'chef', 'Chef 2', '', '', 0, '', 'empleado', 2056),
('DAADSDA', 'da', '', '', '', 0, '', 'administrador', 1872),
('IVX', 'NNNN', NULL, NULL, NULL, NULL, NULL, 'administrador', 3423);

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `generar-codigo` BEFORE INSERT ON `usuario` FOR EACH ROW SET NEW.codigo = (Select Cast(rand()*10000 as int) FROM usuario WHERE Cast(rand()*10000 as int) NOT IN (SELECT codigo FROM usuario) limit 1)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `usuario_ordenes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `usuario_ordenes` (
`suma` bigint(21)
,`usuario` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ventas_dia`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ventas_dia` (
`suma` double
,`dia` date
);

-- --------------------------------------------------------

--
-- Estructura para la vista `horarios_venta`
--
DROP TABLE IF EXISTS `horarios_venta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `horarios_venta`  AS  select sum(`orden`.`total`) AS `SUM(total)`,hour(`orden`.`fecha`) AS `hour(fecha)` from `orden` where (`orden`.`fecha` between (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in')) and (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin'))) group by hour(`orden`.`fecha`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `platillos_populares`
--
DROP TABLE IF EXISTS `platillos_populares`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `platillos_populares`  AS  select count(`pedidos`.`clave`) AS `suma`,`platillo`.`nombre` AS `nombre` from (`pedidos` join `platillo`) where ((`platillo`.`clave` = `pedidos`.`platillo`) and (`pedidos`.`hora` >= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in'))) and (`pedidos`.`hora` <= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin')))) group by `pedidos`.`platillo` order by count(`pedidos`.`clave`) desc limit 10 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `usuario_ordenes`
--
DROP TABLE IF EXISTS `usuario_ordenes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuario_ordenes`  AS  select count(`orden`.`clave`) AS `suma`,`orden`.`usuario` AS `usuario` from `orden` where ((`orden`.`fecha` >= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in'))) and (`orden`.`fecha` <= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin')))) group by `orden`.`usuario` order by `orden`.`usuario` desc ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ventas_dia`
--
DROP TABLE IF EXISTS `ventas_dia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ventas_dia`  AS  select sum(`platillo`.`precio`) AS `suma`,cast(`pedidos`.`hora` as date) AS `dia` from (`pedidos` join `platillo`) where ((`platillo`.`clave` = `pedidos`.`platillo`) and (`pedidos`.`hora` >= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in'))) and (`pedidos`.`hora` <= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin')))) group by dayofmonth(`pedidos`.`hora`) order by `pedidos`.`hora` ;

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
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destinatario` (`destinatario`);

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
-- Indices de la tabla `preferencias`
--
ALTER TABLE `preferencias`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`clave`),
  ADD UNIQUE KEY `nombre` (`nombre`);

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
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cocina`
--
ALTER TABLE `cocina`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `clave` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `platillo`
--
ALTER TABLE `platillo`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `surtidos`
--
ALTER TABLE `surtidos`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`destinatario`) REFERENCES `usuario` (`username`);

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

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `triggerIng4Prov1` ON SCHEDULE EVERY 1 DAY STARTS '2019-04-07 15:39:11' ON COMPLETION PRESERVE ENABLE DO UPDATE ingrediente SET cantidad = cantidad + 100 WHERE 
    clave = 4$$

CREATE DEFINER=`root`@`localhost` EVENT `update_stats` ON SCHEDULE EVERY 1 WEEK STARTS '2019-04-07 23:59:59' ON COMPLETION PRESERVE ENABLE DO BEGIN
UPDATE fechas SET valor = NOW() where nombre='fecha_fin';
UPDATE fechas SET valor = DATE_SUB(NOW(), INTERVAL 7 DAY) where nombre='fecha_in';
DELETE FROM HORARIOS;
DELETE FROM HORARIOS;

INSERT INTO HORARIOS(venta, nombre) VALUES
((SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='00:00:00' AND HOUR(fecha)<'01:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),
'00:00 a 01:00');

INSERT INTO HORARIOS(venta, nombre) VALUES
((SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='01:00:00' AND HOUR(fecha)<'02:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),
'01:00 a 02:00');

INSERT INTO HORARIOS(venta, nombre) VALUES
((SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='02:00:00' AND HOUR(fecha)<'03:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),
'02:00 a 03:00');

INSERT INTO HORARIOS(venta, nombre) VALUES
((SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='03:00:00' AND HOUR(fecha)<'04:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),
'03:00 a 04:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='04:00:00' AND HOUR(fecha)<'05:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),
'04:00 a 05:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='05:00:00' AND HOUR(fecha)<'06:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),
    '05:00 a 06:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='06:00:00' AND HOUR(fecha)<'07:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')), 
'06:00 a 07:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='07:00:00' AND HOUR(fecha)<'08:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')),
'07:00 a 08:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='08:00:00' AND HOUR(fecha)<'09:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
,'08:00 a 09:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='09:00:00' AND HOUR(fecha)<'10:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
,'09:00 a 10:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='10:00:00' AND HOUR(fecha)<'11:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
,'10:00 a 11:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='11:00:00' AND HOUR(fecha)<'12:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
,'11:00 a 12:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='12:00:00' AND HOUR(fecha)<'13:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
, '12:00 a 13:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='13:00:00' AND HOUR(fecha)<'14:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
,'13:00 a 14:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='14:00:00' AND HOUR(fecha)<'15:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
,'14:00 a 15:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='15:00:00' AND HOUR(fecha)<'16:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
,'15:00 a 16:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='16:00:00' AND HOUR(fecha)<'17:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
, '16:00 a 17:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='17:00:00' AND HOUR(fecha)<'18:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
,'17:00 a 18:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='18:00:00' AND HOUR(fecha)<'19:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
, '18:00 a 19:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='19:00:00' AND HOUR(fecha)<'20:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
, '19:00 a 20:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='20:00:00' AND HOUR(fecha)<'21:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
, '20:00 a 21:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='21:00:00' AND HOUR(fecha)<'22:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
, '21:00 a 22:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='22:00:00' AND HOUR(fecha)<'23:00:00' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
,'22:00 a 23:00');

INSERT INTO HORARIOS(venta, nombre) VALUES(
(SELECT SUM(total) FROM orden WHERE HOUR(fecha)>='23:00:00' AND HOUR(fecha)<'23:59:59' AND 
fecha >= (SELECT valor from fechas where nombre='fecha_in') AND fecha<= (SELECT valor from fechas where nombre='fecha_fin')) 
,'23:00 a 24:00');

END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
