-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2019 a las 15:20:40
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarTotal` (IN `claveOrden` INT)  BEGIN




 




update orden set total = (select sum(platillo.precio) from platillo, (select * from orden) as ord, 




    pedidos where platillo.clave= pedidos.platillo and ord.clave = claveOrden and 




    ord.clave=pedidos.orden)




    where clave = claveOrden;




    SELECT 2+2;




    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hombrePlatillo` ()  SELECT 




hombre.nombrecocina as cocina, 




hombre.cocinakey as clave,




hombre.empleados as trabajadores,




plat.trabajo as trabajo,




(plat.trabajo / hombre.empleados) as razon




FROM 




(SELECT COUNT(usuario.username) as empleados, cocina.clave as cocinakey, cocina.nombre as nombrecocina




FROM usuario, asistencia, chefs, cocina




WHERE usuario.username = asistencia.usuario




AND usuario.username = chefs.usuario




AND cocina.clave = chefs.cocina




AND asistencia.salida IS NULL




GROUP BY cocina




) as hombre, 




(SELECT SUM(dificultad) as trabajo, cocina.clave as cocinakey FROM platillo, pedidos, cocina




WHERE platillo.clave = pedidos.platillo 




AND pedidos.estado = 'pedido'




AND cocina.clave = platillo.cocina




GROUP BY cocina) as plat




WHERE hombre.cocinakey = plat.cocinakey




ORDER BY plat.trabajo/hombre.empleados DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerIngredientes` (IN `clavePlatillo` INT)  BEGIN









    SELECT 




    recetas.cantidad * (1+(




        (SELECT valor FROM preferencias WHERE nombre = 'razon_desperdicio')




        /100)) 




   	 AS necesario,




    (




        (SELECT COALESCE(SUM(recetas.cantidad),0)*




		(-1 - (SELECT valor from preferencias where nombre = 					'razon_desperdicio')/100)




	FROM recetas, pedidos 




	WHERE pedidos.estado = 'pedido'




	AND recetas.platillo = clavePlatillo




	AND pedidos.platillo = recetas.platillo




     ) + ingrediente.cantidad




    )AS existencia 




    FROM recetas, ingrediente WHERE 




    recetas.ingrediente = ingrediente.clave




    AND recetas.platillo = clavePlatillo;




    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerMensajes` (IN `usr` VARCHAR(35))  NO SQL
BEGIN




IF(SELECT count(*) FROM mensajes WHERE destinatario = usr AND visto = 0)




THEN 




SELECT texto, TIME(fecha) as hora FROM mensajes WHERE destinatario = usr AND visto = 0;




END IF;




UPDATE mensajes SET visto = 1 WHERE destinatario = usr AND visto = 0;




END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerTicket` (IN `ord` INT)  BEGIN




SELECT 




platillo.nombre as nombre, platillo.precio as precio, count(*) as conteo,




round(count(*) * platillo.precio,2) as subtotal




from platillo, pedidos




where pedidos.orden = ord




and pedidos.platillo = platillo.clave group by platillo.clave;




END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verificarHorario` ()  NO SQL
BEGIN




	IF((SELECT valor FROM preferencias WHERE nombre='apagado_dinamico')=1)




    THEN 




    	IF




        (




            (((SELECT TIMEDIFF(




                TIME(NOW()),




                TIME((SELECT valor FROM fechas WHERE nombre='Encendido'))))




            >= 0) AND 




           ((SELECT TIMEDIFF(




                TIME(NOW()),




                TIME((SELECT valor FROM fechas WHERE nombre='Apagado'))))




            <= 0))




            OR 




                        (((SELECT TIMEDIFF(




                TIME(NOW()),




                TIME((SELECT valor FROM fechas WHERE nombre='Encendido'))))




            <= 0) AND 




           ((SELECT TIMEDIFF(




                TIME(NOW()),




                TIME((SELECT valor FROM fechas WHERE nombre='Apagado'))))




            >= 0))




        )




        THEN 




        	    SELECT 'yes' as status;




        ELSE  




            	SELECT 'no' as status;




        END IF;









    ELSE  




    	SELECT 'yes' as status;




    END IF;




END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `clave` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `entrada` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `salida` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`clave`, `usuario`, `entrada`, `salida`) VALUES
(53, 'Admin100', '2019-06-02 12:00:17', '2019-06-02 23:11:25'),
(54, 'Admin100', '2019-06-03 12:09:05', '2019-06-03 23:17:00'),
(55, 'Admin100', '2019-06-04 12:12:53', '2019-06-04 23:17:59'),
(56, 'Admin100', '2019-06-05 12:00:11', '2019-06-05 21:00:00'),
(57, 'Admin100', '2019-06-06 12:45:00', '2019-06-05 23:00:23'),
(58, 'Admin100', '2019-06-01 12:20:27', '2019-06-01 23:42:00'),
(59, 'gerente01', '2019-06-02 13:20:00', '2019-06-02 19:00:00'),
(60, 'gerente01', '2019-06-05 13:14:45', '2019-06-03 19:08:21'),
(61, 'gerente01', '2019-06-04 12:49:12', '2019-06-04 18:59:20'),
(62, 'gerente01', '2019-06-05 13:23:16', '2019-06-05 19:10:29'),
(63, 'Admin100', '2019-06-06 13:57:51', '2019-06-06 14:33:45'),
(64, 'gerente01', '2019-06-06 14:38:13', '2019-06-06 14:52:42'),
(65, 'gerente01', '2019-06-06 15:22:42', '2019-06-06 16:54:37'),
(66, 'Admin100', '2019-06-06 15:23:53', '2019-06-06 15:24:08'),
(67, 'Admin100', '2019-06-06 16:11:59', '2019-06-06 16:14:30'),
(68, 'cajero01', '2019-06-06 16:25:18', NULL),
(69, 'Admin100', '2019-06-06 16:32:53', '2019-06-06 16:33:24'),
(70, 'Admin100', '2019-06-06 16:59:35', '2019-06-06 17:30:39'),
(71, 'gerente01', '2019-06-06 18:18:42', '2019-06-06 18:19:15'),
(72, 'gerente01', '2019-06-06 18:23:30', NULL),
(73, 'cajero02', '2019-06-06 18:44:15', '2019-06-06 18:44:34');

--
-- Disparadores `asistencia`
--
DELIMITER $$
CREATE TRIGGER `mensaje-entrada` AFTER INSERT ON `asistencia` FOR EACH ROW BEGIN




		INSERT INTO mensajes(destinatario, texto) VALUES 




		(




			(SELECT username FROM usuario WHERE tipo = 'admin'),




			(SELECT CONCAT('El usuario ', NEW.usuario, ' ha registrado su entrada'))




        );




END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mensaje-salida` AFTER UPDATE ON `asistencia` FOR EACH ROW BEGIN




		INSERT INTO mensajes(destinatario, texto) VALUES 




		(




			(SELECT username FROM usuario WHERE tipo = 'admin'),




			(SELECT CONCAT('El usuario ', NEW.usuario, ' ha registrado su salida'))




        );




END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuda`
--

CREATE TABLE `ayuda` (
  `clave` int(11) NOT NULL,
  `solicitante` int(11) NOT NULL,
  `solicitado` int(11) NOT NULL,
  `estado` enum('enviado','rechazado','aceptado','') NOT NULL DEFAULT 'enviado'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ayuda`
--

INSERT INTO `ayuda` (`clave`, `solicitante`, `solicitado`, `estado`) VALUES
(12, 4, 1, 'aceptado'),
(13, 4, 1, 'rechazado'),
(14, 4, 1, 'rechazado');

--
-- Disparadores `ayuda`
--
DELIMITER $$
CREATE TRIGGER `actualizar-mensajes` AFTER UPDATE ON `ayuda` FOR EACH ROW BEGIN 




IF(NEW.estado = 'aceptado')




	THEN




    	INSERT INTO mensajes_ayuda (destinatario, mensaje, tipo)




        VALUES




        (




            NEW.solicitante, (SELECT CONCAT('La cocina ', (SELECT nombre FROM cocina WHERE clave = NEW.solicitado), ' ha enviado ayuda')), 'aviso'




        );




        UPDATE mensajes_ayuda SET mensaje = (SELECT concat(mensaje, ' (aceptada)')), tipo = 'aviso' WHERE ayuda = NEW.clave AND tipo != 'aviso';




	END IF;




IF(NEW.estado = 'rechazado')




	THEN




        	INSERT INTO mensajes_ayuda (destinatario, mensaje, tipo)




        VALUES




        (




            NEW.solicitante, (SELECT CONCAT('La cocina ', (SELECT nombre FROM cocina WHERE clave = NEW.solicitado), ' ha rechazado la peticion de ayuda')),'aviso'




        );




        UPDATE mensajes_ayuda SET mensaje = concat(mensaje, ' (rechazada)'), tipo = 'aviso' WHERE ayuda = NEW.clave AND tipo = 'solicitud';




   END IF;




END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mensaje-ayuda` AFTER INSERT ON `ayuda` FOR EACH ROW BEGIN




INSERT INTO mensajes_ayuda (destinatario, mensaje, ayuda,tipo)




VALUES




(




    NEW.solicitante, (SELECT CONCAT('Se ha pedido ayuda a la cocina ',(SELECT nombre FROM cocina WHERE clave = NEW.solicitado))),




    NEW.clave, 'aviso'




);




INSERT INTO mensajes_ayuda (destinatario, mensaje, ayuda,tipo)




VALUES




(




    NEW.solicitado, (SELECT CONCAT('La cocina ',




    (SELECT nombre FROM cocina WHERE clave = NEW.solicitante), ' le solicita ayuda')),




    NEW.clave, 'solicitud'




);




END
$$
DELIMITER ;

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
(4, 'chef01', 1),
(5, 'chef02', 4);

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
(5, 'Americana'),
(4, 'Barra'),
(1, 'Europea'),
(7, 'Nacional'),
(6, 'Vegana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `ip` varchar(20) NOT NULL,
  `alias` varchar(30) NOT NULL DEFAULT 'Equipo conectado',
  `conexion` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`ip`, `alias`, `conexion`) VALUES
('192.168.0.100', 'COcinita', '2019-05-27 00:44:25'),
('192.168.15.174', 'yo', '2019-06-05 06:00:17'),
('192.168.15.195', 'Equipo conectado', '2019-05-27 03:08:13'),
('192.168.43.123', 'server', '2019-06-06 15:37:59'),
('192.168.43.181', 'DC', '2019-06-06 19:03:20'),
('192.168.84.123', 'otro', '2019-05-28 19:40:51'),
('192.168.84.147', 'Ivan', '2019-06-04 17:48:38'),
('192.168.84.247', '1233', '2019-05-28 15:02:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fechas`
--

CREATE TABLE `fechas` (
  `clave` tinyint(4) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `valor` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fechas`
--

INSERT INTO `fechas` (`clave`, `nombre`, `valor`) VALUES
(1, 'fecha_in', '2019-02-01 23:59:59'),
(2, 'fecha_fin', '2019-06-06 23:59:59'),
(3, 'Encendido', '2019-06-06 08:00:00'),
(4, 'Apagado', '2019-06-06 23:55:59');

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
-- Estructura de tabla para la tabla `historial_ingredientes`
--

CREATE TABLE `historial_ingredientes` (
  `clave` int(11) NOT NULL,
  `ingrediente` int(11) NOT NULL,
  `cantidad` decimal(10,4) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo` enum('uso','surtido') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historial_ingredientes`
--

INSERT INTO `historial_ingredientes` (`clave`, `ingrediente`, `cantidad`, `fecha`, `tipo`) VALUES
(1, 1, '-10.0000', '2019-04-23 05:18:15', 'uso'),
(2, 2, '-0.0100', '2019-04-23 05:18:15', 'uso'),
(3, 1, '-10.0000', '2019-04-23 05:24:48', 'uso'),
(4, 2, '-0.0100', '2019-04-23 05:24:48', 'uso'),
(5, 4, '1.0000', '2019-04-23 05:41:07', 'surtido'),
(6, 1, '11.0000', '2019-04-23 06:04:22', 'surtido'),
(7, 1, '-10.0000', '2019-04-28 02:30:08', 'uso'),
(8, 2, '-0.0100', '2019-04-28 02:30:08', 'uso'),
(9, 1, '-0.5000', '2019-04-28 03:27:11', 'uso'),
(11, 1, '-0.5000', '2019-04-28 03:32:06', 'uso'),
(13, 4, '100.0000', '2019-05-05 15:39:11', 'surtido'),
(15, 2, '1.0000', '2019-05-06 17:27:00', 'surtido'),
(16, 4, '5.0000', '2019-05-12 20:45:19', 'surtido'),
(18, 1, '4.0000', '2019-05-26 19:55:57', 'surtido'),
(19, 6, '5.0000', '2019-05-26 19:57:02', 'surtido'),
(21, 6, '-2.0000', '2019-05-26 20:01:24', 'uso'),
(22, 6, '5.0000', '2019-05-26 20:01:48', 'surtido'),
(23, 2, '3.0000', '2019-05-26 20:02:29', 'surtido'),
(24, 6, '10.0000', '2019-05-26 20:12:03', 'surtido'),
(25, 1, '23.0000', '2019-05-26 20:14:12', 'surtido'),
(26, 2, '10.0000', '2019-05-26 20:15:29', 'surtido'),
(27, 4, '10.0000', '2019-05-26 20:16:03', 'surtido'),
(28, 6, '10.0000', '2019-05-26 20:16:57', 'surtido'),
(29, 4, '4.0000', '2019-05-26 20:21:53', 'surtido'),
(30, 4, '15.0000', '2019-05-26 20:24:02', 'surtido'),
(32, 4, '6.0000', '2019-05-26 20:35:01', 'surtido'),
(33, 7, '8.0000', '2019-05-26 21:12:03', 'surtido'),
(34, 6, '10.0000', '2019-05-26 21:13:07', 'surtido'),
(35, 1, '7.0000', '2019-05-26 21:14:52', 'surtido'),
(36, 6, '10.0000', '2019-05-26 21:19:04', 'surtido'),
(37, 6, '10.0000', '2019-05-26 21:21:31', 'surtido'),
(38, 6, '10.0000', '2019-05-26 21:23:24', 'surtido'),
(39, 1, '10.0000', '2019-05-26 21:24:26', 'surtido'),
(40, 7, '5.0000', '2019-05-26 21:25:23', 'surtido'),
(41, 1, '1.0000', '2019-05-26 21:26:58', 'surtido'),
(42, 1, '1.0000', '2019-05-26 21:29:38', 'surtido'),
(43, 6, '1.0000', '2019-05-26 21:31:54', 'surtido'),
(44, 7, '1.0000', '2019-05-26 21:32:34', 'surtido'),
(45, 6, '1.0000', '2019-05-26 21:34:11', 'surtido'),
(47, 2, '2.0000', '2019-05-26 21:40:43', 'surtido'),
(48, 2, '1.0000', '2019-05-26 21:42:59', 'surtido'),
(49, 2, '1.0000', '2019-05-26 21:45:34', 'surtido'),
(50, 2, '1.0000', '2019-05-26 21:47:19', 'surtido'),
(51, 2, '1.0000', '2019-05-26 21:49:37', 'surtido'),
(52, 2, '20.0000', '2019-05-26 21:51:21', 'surtido'),
(53, 6, '1.0000', '2019-05-26 21:52:16', 'surtido'),
(54, 4, '1.0000', '2019-05-26 21:55:08', 'surtido'),
(55, 6, '-82.5000', '2019-05-27 06:31:55', 'uso'),
(56, 6, '-0.4000', '2019-05-27 07:08:48', 'uso'),
(57, 1, '1.0000', '2019-05-27 08:10:43', 'surtido'),
(58, 1, '-180.4000', '2019-05-28 02:47:16', 'uso'),
(59, 1, '-0.2000', '2019-05-28 02:47:52', 'uso'),
(60, 1, '-0.4000', '2019-05-28 02:48:28', 'uso'),
(61, 2, '-40.0900', '2019-05-28 02:49:17', 'uso'),
(62, 1, '1000.0000', '2019-05-28 02:51:12', 'surtido'),
(63, 2, '100.0000', '2019-05-28 02:52:01', 'surtido'),
(64, 1, '-1000.0000', '2019-05-28 02:54:37', 'uso'),
(65, 1, '0.0010', '2019-05-28 02:55:07', 'surtido'),
(66, 2, '-96.0000', '2019-05-28 02:55:19', 'uso'),
(67, 2, '-3.9910', '2019-05-28 02:55:37', 'uso'),
(68, 1, '999.9990', '2019-05-28 02:55:51', 'surtido'),
(69, 2, '99.9910', '2019-05-28 02:55:53', 'surtido'),
(70, 4, '1.0000', '2019-05-28 03:50:42', 'surtido'),
(71, 1, '-10.0000', '2019-06-04 03:39:23', 'uso'),
(72, 3, '-10.0000', '2019-06-04 03:39:23', 'uso'),
(73, 1, '-10.0000', '2019-06-04 03:49:47', 'uso'),
(74, 3, '-10.0000', '2019-06-04 03:49:47', 'uso'),
(75, 4, '20.0000', '2019-06-06 14:55:08', 'surtido'),
(76, 6, '10.0000', '2019-06-06 16:23:14', 'surtido'),
(77, 4, '10.0000', '2019-06-06 16:37:03', 'surtido'),
(78, 4, '10.0000', '2019-06-06 17:35:45', 'surtido'),
(79, 7, '-0.5000', '2019-06-06 17:42:36', 'uso'),
(80, 7, '-0.5000', '2019-06-06 17:42:36', 'uso'),
(81, 7, '-0.5000', '2019-06-06 17:42:36', 'uso'),
(82, 7, '-0.5100', '2019-06-06 17:43:41', 'uso'),
(83, 3, '5.0000', '2019-06-06 18:22:53', 'surtido'),
(84, 7, '-0.5000', '2019-06-06 18:59:52', 'uso'),
(85, 7, '-0.5000', '2019-06-06 18:59:52', 'uso'),
(86, 2, '10.0000', '2019-06-06 19:10:20', 'surtido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `clave` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `venta` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`clave`, `nombre`, `venta`) VALUES
(1, '00:00 a 01:00', 0),
(2, '01:00 a 02:00', 0),
(3, '02:00 a 03:00', 0),
(4, '03:00 a 04:00', 0),
(5, '04:00 a 05:00', 0),
(6, '05:00 a 06:00', 192),
(7, '06:00 a 07:00', 274),
(8, '07:00 a 08:00', 359),
(9, '08:00 a 09:00', 1001),
(10, '09:00 a 10:00', 173),
(11, '10:00 a 11:00', 2881),
(12, '11:00 a 12:00', 2401),
(13, '12:00 a 13:00', 3100),
(14, '13:00 a 14:00', 2777),
(15, '14:00 a 15:00', 2848),
(16, '15:00 a 16:00', 4772),
(17, '16:00 a 17:00', 377),
(18, '17:00 a 18:00', 2880),
(19, '18:00 a 19:00', 388),
(20, '19:00 a 20:00', 3100),
(21, '20:00 a 21:00', 992),
(22, '21:00 a 22:00', 182),
(23, '22:00 a 23:00', 0),
(24, '23:00 a 24:00', 0);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `horarios_venta`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `horarios_venta` (
`SUM(total)` decimal(32,4)
,`hour(fecha)` int(2)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `clave` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `cantidad` decimal(10,4) DEFAULT '0.0000',
  `especificacion` enum('kg','mg','lt','ml','pza') NOT NULL,
  `existencia_critica` float(10,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ingrediente`
--

INSERT INTO `ingrediente` (`clave`, `nombre`, `cantidad`, `especificacion`, `existencia_critica`) VALUES
(1, 'Papas', '980.0000', 'kg', 4.0000),
(2, 'Leche', '110.0000', 'lt', 1.0000),
(3, 'Pollo', '100.0000', 'kg', 1.0000),
(4, 'Aceite', '203.0000', 'lt', 10.0000),
(6, 'Res', '10.1000', 'kg', 1.0000),
(7, 'Cerdo', '22.9900', 'kg', 1.0000),
(8, 'Zanahoria', '10.0000', 'kg', 1.0000),
(9, 'Chayotw', '10.0000', 'kg', 1.0000);

--
-- Disparadores `ingrediente`
--
DELIMITER $$
CREATE TRIGGER `historial-de-ingrediente` BEFORE UPDATE ON `ingrediente` FOR EACH ROW BEGIN




	IF (NEW.cantidad < OLD.cantidad)




    THEN 




    	INSERT INTO historial_ingredientes(ingrediente,cantidad,tipo) 




        VALUES (




            NEW.clave,




            (NEW.cantidad  - OLD.cantidad),




            'uso'




        );




    END IF;




    IF (NEW.cantidad > OLD.cantidad)




    THEN 




        	INSERT INTO historial_ingredientes(ingrediente,cantidad,tipo) 




        VALUES (




            NEW.clave,




            (NEW.cantidad  - OLD.cantidad),




            'surtido'




        );




    END IF;




END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `notificacion-ingrediente` AFTER UPDATE ON `ingrediente` FOR EACH ROW BEGIN 
IF(NEW.cantidad <= NEW.existencia_critica*0.1 AND OLD.cantidad > NEW.existencia_critica*0.1)
THEN 
	INSERT INTO notificaciones(texto) VALUES (
    (SELECT CONCAT(
    'El ingrediente ', NEW.nombre, ' se ha acabado. Se han inhabilitado ',
        (SELECT COALESCE((SELECT COUNT(*) FROM recetas WHERE ingrediente = NEW.clave),0)), ' platillos.'
    )));
END IF;
IF(OLD.cantidad >= NEW.existencia_critica AND NEW.cantidad < NEW.existencia_critica)
	THEN
    	INSERT INTO notificaciones(texto) VALUES (
        (SELECT CONCAT('El ingrediente ', NEW.nombre, ' esta en existencia critica')));
    END IF;
    INSERT INTO notificaciones(texto) 
	SELECT 
	CONCAT('El platillo ',platillo.nombre,' ha quedado deshabilitado por falta de ',ingrediente.nombre)
	FROM platillo, recetas, ingrediente 
	WHERE platillo.clave = recetas.platillo
	AND ingrediente.clave = recetas.ingrediente
	AND OLD.cantidad >= recetas.cantidad
	AND NEW.cantidad < recetas.cantidad
    AND ingrediente.clave = NEW.clave;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `destinatario` varchar(30) NOT NULL,
  `texto` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visto` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id`, `destinatario`, `texto`, `fecha`, `visto`) VALUES
(24, 'Admin100', 'El platillo Caviar de la mesa 2 está listo', '2019-04-17 23:33:45', 1),
(25, 'Admin100', 'El platillo Caviar de la mesa 2 está listo', '2019-04-17 23:34:06', 1),
(26, 'Admin100', 'La cuenta en la mesa 2 ha sido pagada', '2019-04-18 00:00:46', 1),
(27, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-04-18 00:00:51', 1),
(41, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:38:07', 1),
(42, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:38:13', 1),
(43, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:38:27', 1),
(44, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:38:58', 1),
(45, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:38:59', 1),
(46, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:39:00', 1),
(47, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:39:00', 1),
(48, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:39:01', 1),
(49, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:39:01', 1),
(50, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:39:03', 1),
(51, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:39:05', 1),
(52, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:39:10', 1),
(53, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:39:12', 1),
(54, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:39:13', 1),
(55, 'Admin100', 'El platillo Caviar de la mesa 2 esta listo', '2019-04-21 03:39:16', 1),
(56, 'Admin100', 'La cuenta en la mesa 1 ha sido pagada', '2019-04-21 04:01:56', 1),
(57, 'Admin100', 'La cuenta en la mesa 0 ha sido pagada', '2019-04-21 04:03:40', 1),
(58, 'Admin100', 'El platillo Caviar de la mesa 0 esta listo', '2019-04-22 02:48:12', 1),
(59, 'Admin100', 'El platillo Sopa du macaco de la mesa 0 esta listo', '2019-04-23 05:18:15', 1),
(60, 'Admin100', 'El platillo Sopa du macaco de la mesa 0 esta listo', '2019-04-23 05:20:00', 1),
(61, 'Admin100', 'El platillo Sopa du macaco de la mesa 2 esta listo', '2019-04-23 05:24:48', 1),
(62, 'Admin100', 'El platillo Sopa du macaco de la mesa 2 esta listo', '2019-04-23 05:24:51', 1),
(63, 'Admin100', 'El platillo Sopa du macaco de la mesa 2 esta listo', '2019-04-23 05:24:52', 1),
(64, 'Admin100', 'El platillo Sopa du macaco de la mesa 2 esta listo', '2019-04-23 05:24:53', 1),
(65, 'Admin100', 'El platillo Sopa du macaco de la mesa 2 esta listo', '2019-04-23 05:24:53', 1),
(66, 'Admin100', 'El platillo Sopa du macaco de la mesa 2 esta listo', '2019-04-23 05:24:54', 1),
(67, 'Admin100', 'El platillo Sopa du macaco de la mesa 2 esta listo', '2019-04-23 05:25:04', 1),
(68, 'Admin100', 'El platillo Sopa du macaco de la mesa 2 esta listo', '2019-04-23 05:25:05', 1),
(69, 'Admin100', 'El platillo Sopa du macaco de la mesa 2 esta listo', '2019-04-23 05:51:24', 1),
(70, 'Admin100', 'Hey muy buenas a todos, guapísimos', '2019-04-28 02:02:07', 1),
(71, 'Admin100', 'haha', '2019-04-28 02:03:36', 1),
(72, 'Admin100', 'El platillo Sopa du macaco de la mesa 0 esta listo', '2019-04-28 02:30:08', 1),
(73, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-04-28 03:02:31', 1),
(74, 'Admin100', 'holaaa', '2019-05-03 01:25:11', 1),
(75, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-05-05 21:29:30', 1),
(76, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-05-05 21:39:38', 1),
(77, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-05 21:45:41', 1),
(78, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-05 21:46:17', 1),
(79, 'Admin100', 'La cuenta en la mesa 1 ha sido pagada', '2019-05-14 04:19:15', 1),
(80, 'Admin100', 'El platillo pizza de la mesa 0 esta listo', '2019-05-20 01:49:47', 1),
(81, 'Admin100', 'El usuario Admin100 se\r\n             ha registrado una su salida', '2019-05-21 05:50:41', 1),
(82, 'Admin100', 'El usuario Admin100 se\r\n             ha registrado una su salida', '2019-05-21 05:50:57', 1),
(83, 'Admin100', 'El usuario Admin100 se\r\n             ha registrado una su salida', '2019-05-21 05:51:12', 1),
(84, 'Admin100', 'El usuario Admin100 se\r\n             ha registrado una su salida', '2019-05-21 05:55:53', 1),
(85, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-21 05:57:33', 1),
(86, 'Admin100', 'El usuario Admin100 ha registrado\r\n                           su entrada', '2019-05-21 05:58:02', 1),
(87, 'Admin100', 'El usuario chef1 ha registrado\r\n                           su entrada', '2019-05-21 06:25:31', 1),
(88, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-21 13:17:17', 1),
(89, 'Admin100', 'El usuario chef1 ha registrado su salida', '2019-05-21 13:17:31', 1),
(90, 'Admin100', 'El usuario chef1 ha registrado su entrada', '2019-05-21 13:18:51', 1),
(91, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-21 13:20:56', 1),
(92, 'Admin100', 'El usuario chef1 ha registrado su salida', '2019-05-21 13:21:08', 1),
(93, 'Admin100', 'El usuario chef1 ha registrado su entrada', '2019-05-21 13:21:36', 1),
(94, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-21 13:24:37', 1),
(95, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-21 17:22:58', 1),
(96, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-21 17:26:03', 1),
(97, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-21 17:30:34', 1),
(98, 'Admin100', 'El usuario chef1 ha registrado su salida', '2019-05-21 17:32:41', 1),
(99, 'Admin100', 'El usuario chef1 ha registrado su entrada', '2019-05-21 17:32:55', 1),
(100, 'Admin100', 'El usuario chef1 ha registrado su salida', '2019-05-21 17:40:26', 1),
(101, 'Admin100', 'El usuario chef1 ha registrado su entrada', '2019-05-21 17:46:30', 1),
(102, 'Admin100', 'El usuario chef1 ha registrado su salida', '2019-05-21 17:47:13', 1),
(103, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-21 17:47:26', 1),
(104, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-21 17:47:49', 1),
(105, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-21 17:48:39', 1),
(106, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-21 17:49:05', 1),
(107, 'Admin100', 'El usuario chef1 ha registrado su entrada', '2019-05-21 18:06:05', 1),
(108, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-21 18:06:22', 1),
(109, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-21 18:07:04', 1),
(110, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-21 18:09:03', 1),
(111, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-21 18:09:19', 1),
(112, 'Admin100', 'El usuario chef1 ha registrado su salida', '2019-05-21 18:11:53', 1),
(113, 'Admin100', 'El usuario chef1 ha registrado su entrada', '2019-05-21 18:16:32', 1),
(114, 'Admin100', 'El usuario chef1 ha registrado su salida', '2019-05-21 18:19:39', 1),
(115, 'Admin100', 'El usuario chef1 ha registrado su entrada', '2019-05-21 18:19:54', 1),
(116, 'Admin100', 'El usuario chef1 ha registrado su salida', '2019-05-21 18:20:09', 1),
(117, 'Admin100', 'El usuario chef1 ha registrado su entrada', '2019-05-21 18:23:37', 1),
(118, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-21 18:36:54', 1),
(119, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-21 18:37:10', 1),
(120, 'Admin100', 'El usuario chef1 ha registrado su salida', '2019-05-21 18:39:47', 1),
(121, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-21 18:46:53', 1),
(122, 'Admin100', 'El platillo Hamburguesa Ranch de la mesa 0 esta listo', '2019-05-24 04:28:03', 1),
(123, 'gerente01', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-24 06:08:00', 1),
(124, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-24 06:08:06', 1),
(125, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-05-24 06:08:11', 1),
(126, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-24 06:08:16', 1),
(127, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-24 06:08:22', 1),
(128, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-24 06:08:28', 1),
(129, 'Admin100', 'La cuenta en la mesa 0 ha sido pagada', '2019-05-24 06:10:51', 1),
(130, 'Admin100', 'El usuario chef1 ha registrado su entrada', '2019-05-26 02:17:01', 1),
(131, 'Admin100', 'El usuario chef2 ha registrado su entrada', '2019-05-26 02:31:55', 1),
(132, 'Admin100', 'El usuario yo ha registrado su entrada', '2019-05-26 02:52:14', 1),
(133, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-27 23:46:19', 1),
(134, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-27 23:46:29', 1),
(135, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-27 23:57:02', 1),
(136, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-27 23:57:19', 1),
(137, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-28 00:03:44', 1),
(138, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-28 00:05:09', 1),
(139, 'Admin100', 'El usuario chef1 ha registrado su salida', '2019-05-28 00:33:58', 1),
(140, 'Admin100', 'El usuario chef1 ha registrado su entrada', '2019-05-28 00:35:21', 1),
(141, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-28 00:35:32', 1),
(142, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-28 00:57:09', 1),
(143, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-28 01:17:40', 1),
(144, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-28 01:23:11', 1),
(145, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-28 01:23:22', 1),
(146, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-28 01:42:45', 1),
(147, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-28 01:42:57', 1),
(148, 'Admin100', 'El usuario chef1 ha registrado su salida', '2019-05-28 01:43:36', 1),
(149, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-28 15:51:56', 1),
(150, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-28 15:52:48', 1),
(151, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-28 15:53:54', 1),
(152, 'Admin100', 'El usuario chef1 ha registrado su entrada', '2019-05-28 16:00:50', 1),
(153, 'Admin100', 'La cuenta en la mesa 1 ha sido cerrada', '2019-05-28 18:46:48', 1),
(154, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-28 18:46:53', 1),
(155, 'Admin100', 'La cuenta en la mesa -1 ha sido cerrada', '2019-05-28 18:46:59', 1),
(156, 'Admin100', 'La cuenta en la mesa -1 ha sido cerrada', '2019-05-28 18:47:03', 1),
(157, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-28 18:47:08', 1),
(158, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-28 19:43:18', 1),
(159, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-28 19:43:39', 1),
(160, 'Admin100', 'El usuario admin ha registrado su entrada', '2019-05-29 02:33:21', 1),
(161, 'Admin100', 'El usuario admin ha registrado su salida', '2019-05-29 02:39:36', 1),
(162, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-29 02:40:42', 1),
(163, 'Admin100', 'El usuario admin ha registrado su entrada', '2019-05-29 18:59:17', 1),
(164, 'Admin100', 'El usuario admin ha registrado su salida', '2019-05-29 19:02:07', 1),
(165, 'Admin100', 'El usuario admin ha registrado su entrada', '2019-05-29 19:02:32', 1),
(166, 'Admin100', 'El usuario admin ha registrado su salida', '2019-05-29 19:15:08', 1),
(167, 'Admin100', 'El usuario admin ha registrado su entrada', '2019-05-29 19:15:20', 1),
(168, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-29 19:18:12', 1),
(169, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-29 19:19:21', 1),
(170, 'Admin100', 'El usuario chef1 ha registrado su salida', '2019-05-29 19:21:05', 1),
(171, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-29 19:46:31', 1),
(172, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-05-29 19:46:47', 1),
(173, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-05-29 19:46:59', 1),
(174, 'Admin100', 'La cuenta en la mesa 2 ha sido pagada', '2019-05-31 02:19:05', 1),
(175, 'Admin100', 'La cuenta en la mesa 2 ha sido pagada', '2019-05-31 02:19:15', 1),
(176, 'Admin100', 'La cuenta en la mesa 2 ha sido pagada', '2019-05-31 02:20:17', 1),
(177, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-04 03:39:23', 1),
(178, 'Admin100', 'La cuenta en la mesa 0 ha sido pagada', '2019-06-04 03:46:42', 1),
(179, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-04 03:49:13', 1),
(180, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-04 03:49:47', 1),
(181, 'Admin100', 'La cuenta en la mesa 0 ha sido pagada', '2019-06-04 03:50:17', 1),
(182, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-06-06 01:29:42', 1),
(183, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-06-06 01:29:42', 1),
(184, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-06-06 01:30:47', 1),
(185, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-06-06 01:30:47', 1),
(186, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-06-06 01:31:47', 1),
(187, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-06-06 01:31:47', 1),
(188, 'Admin100', 'El usuario gerente01 ha registrado su entrada', '2019-06-06 01:33:24', 1),
(189, 'Admin100', 'El usuario chef02 ha registrado su entrada', '2019-06-06 01:33:24', 1),
(190, 'Admin100', 'El usuario gerente01 ha registrado su entrada', '2019-06-06 01:34:15', 1),
(191, 'Admin100', 'El usuario gerente01 ha registrado su entrada', '2019-06-06 01:34:15', 1),
(192, 'Admin100', 'El usuario gerente01 ha registrado su salida', '2019-06-06 01:34:39', 1),
(193, 'Admin100', 'La cuenta en la mesa 0 ha sido pagada', '2019-06-06 04:00:48', 1),
(194, 'Admin100', 'La cuenta en la mesa 0 ha sido pagada', '2019-06-06 04:00:48', 1),
(195, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-06-06 13:57:51', 1),
(196, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 14:28:13', 1),
(197, 'Admin100', 'La cuenta en la mesa 0 ha sido pagada', '2019-06-06 14:28:25', 1),
(198, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-06-06 14:33:45', 1),
(199, 'Admin100', 'El usuario gerente01 ha registrado su entrada', '2019-06-06 14:38:13', 1),
(200, 'Admin100', 'El usuario gerente01 ha registrado su salida', '2019-06-06 14:52:42', 1),
(201, 'Admin100', 'La cuenta en la mesa 1 ha sido cerrada', '2019-06-06 15:13:09', 1),
(202, 'Admin100', 'La cuenta en la mesa 1 ha sido pagada', '2019-06-06 15:14:00', 1),
(203, 'Admin100', 'La cuenta en la mesa 1 ha sido cerrada', '2019-06-06 15:14:31', 1),
(204, 'Admin100', 'El usuario gerente01 ha registrado su entrada', '2019-06-06 15:22:42', 1),
(205, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-06-06 15:23:53', 1),
(206, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-06-06 15:24:08', 1),
(207, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-06-06 15:31:40', 1),
(208, 'Admin100', 'La cuenta en la mesa 1 ha sido cerrada', '2019-06-06 15:32:25', 1),
(209, 'gerente01', 'La cuenta en la mesa 1 ha sido cerrada', '2019-06-06 15:32:25', 0),
(210, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:32:25', 1),
(211, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-06-06 15:32:25', 1),
(212, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-06-06 15:32:25', 1),
(213, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-06-06 15:32:25', 1),
(214, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:32:25', 1),
(215, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:32:25', 1),
(216, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:32:25', 1),
(217, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:32:25', 1),
(218, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:32:25', 1),
(219, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-06-06 15:32:25', 1),
(220, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-06-06 15:32:25', 1),
(221, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-06-06 15:32:25', 1),
(222, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:32:25', 1),
(223, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:32:25', 1),
(224, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:32:25', 1),
(225, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:32:25', 1),
(226, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:32:25', 1),
(227, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:32:25', 1),
(228, 'Admin100', 'La cuenta en la mesa -1 ha sido cerrada', '2019-06-06 15:32:25', 1),
(229, 'Admin100', 'La cuenta en la mesa -1 ha sido cerrada', '2019-06-06 15:32:25', 1),
(230, 'gerente01', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:32:25', 0),
(231, 'Admin100', 'La cuenta en la mesa 1 ha sido pagada', '2019-06-06 15:33:32', 1),
(232, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 15:34:17', 1),
(233, 'Admin100', 'La cuenta en la mesa 0 ha sido pagada', '2019-06-06 15:34:32', 1),
(234, 'Admin100', 'El platillo Cafe capuccino de la mesa 2 esta listo', '2019-06-06 15:51:02', 1),
(235, 'Admin100', 'La cuenta en la mesa 2 ha sido pagada', '2019-06-06 15:57:37', 1),
(236, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 16:03:36', 1),
(237, 'Admin100', 'La cuenta en la mesa 0 ha sido pagada', '2019-06-06 16:04:03', 1),
(238, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-06-06 16:11:59', 1),
(239, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-06-06 16:14:30', 1),
(240, 'Admin100', 'El usuario cajero01 ha registrado su entrada', '2019-06-06 16:25:18', 1),
(241, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-06-06 16:32:53', 1),
(242, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-06-06 16:33:24', 1),
(243, 'Admin100', 'El usuario gerente01 ha registrado su salida', '2019-06-06 16:54:37', 1),
(244, 'Admin100', 'El usuario Admin100 ha registrado su entrada', '2019-06-06 16:59:35', 1),
(245, 'Admin100', 'El platillo Cafe de olla de la mesa 2 esta listo', '2019-06-06 17:20:57', 1),
(246, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-06-06 17:23:00', 1),
(247, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 17:24:22', 1),
(248, 'Admin100', 'La cuenta en la mesa 0 ha sido pagada', '2019-06-06 17:24:35', 1),
(249, 'Admin100', 'El usuario Admin100 ha registrado su salida', '2019-06-06 17:30:39', 1),
(250, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 17:42:36', 1),
(251, 'Admin100', 'La cuenta en la mesa 0 ha sido pagada', '2019-06-06 17:42:48', 1),
(252, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-06-06 17:43:41', 1),
(253, 'Admin100', 'La cuenta en la mesa 0 ha sido pagada', '2019-06-06 17:43:50', 1),
(254, 'Admin100', 'La cuenta en la mesa 1 ha sido cerrada', '2019-06-06 18:16:07', 1),
(255, 'Admin100', 'El usuario gerente01 ha registrado su entrada', '2019-06-06 18:18:42', 1),
(256, 'Admin100', 'El usuario gerente01 ha registrado su salida', '2019-06-06 18:19:15', 1),
(257, 'Admin100', 'El usuario gerente01 ha registrado su entrada', '2019-06-06 18:23:30', 1),
(258, 'Admin100', 'El usuario cajero02 ha registrado su entrada', '2019-06-06 18:44:15', 1),
(259, 'Admin100', 'El usuario cajero02 ha registrado su salida', '2019-06-06 18:44:34', 1),
(260, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-06-06 18:59:52', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes_ayuda`
--

CREATE TABLE `mensajes_ayuda` (
  `clave` int(11) NOT NULL,
  `destinatario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mensaje` varchar(100) NOT NULL DEFAULT 'Mensaje vacío',
  `ayuda` int(11) DEFAULT NULL,
  `tipo` enum('solicitud','aviso') NOT NULL DEFAULT 'solicitud'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mensajes_ayuda`
--

INSERT INTO `mensajes_ayuda` (`clave`, `destinatario`, `fecha`, `mensaje`, `ayuda`, `tipo`) VALUES
(1, 4, '2019-05-26 04:34:20', 'Se ha pedido ayuda a la cocina Mexicana', 12, 'aviso'),
(2, 1, '2019-05-26 04:34:20', 'La cocina Bebidas le solicita ayuda (aceptada)', 12, 'aviso'),
(3, 4, '2019-05-26 05:15:18', 'La cocina Mexicana ha enviado ayuda', NULL, 'aviso'),
(4, 4, '2019-05-26 05:15:34', 'Se ha pedido ayuda a la cocina Mexicana', 13, 'aviso'),
(5, 1, '2019-05-26 05:15:34', 'La cocina Bebidas le solicita ayuda (rechazada)', 13, 'aviso'),
(6, 4, '2019-05-26 05:15:39', 'La cocina Mexicana ha rechazado la peticion de ayuda', NULL, 'aviso'),
(7, 4, '2019-05-26 05:25:53', 'Se ha pedido ayuda a la cocina Mexicana', 14, 'aviso'),
(8, 1, '2019-05-26 05:25:53', 'La cocina Bebidas le solicita ayuda (rechazada)', 14, 'aviso'),
(9, 4, '2019-06-04 17:42:19', 'La cocina Mexicana ha rechazado la peticion de ayuda', NULL, 'aviso');

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
(-1, -1),
(0, 0),
(1, 10),
(2, 10),
(12, 5),
(19, 9),
(23, 12),
(50, 0),
(122, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `clave` int(11) NOT NULL,
  `texto` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`clave`, `texto`, `fecha`) VALUES
(1, 'El ingrediente Otro mas esta en existencia critica', '2019-05-27 06:31:55'),
(2, 'hola', '2019-05-27 06:40:18'),
(3, 'holamundo', '2019-05-27 06:48:36'),
(4, 'El corte del dia 2019-05-27 es de $0.0000', '2019-05-28 17:56:44'),
(5, 'El corte del dia 2019-05-27 es de $0.0000', '2019-05-28 17:56:38'),
(6, 'El ingrediente Otro mas se ha acabado. Se han inhabilitado0 platillos.', '2019-05-27 07:08:48'),
(36, 'El ingrediente pollo se ha acabado. Se han inhabilitado 2 platillos.', '2019-05-28 02:54:37'),
(37, 'El ingrediente pollo esta en existencia critica', '2019-05-28 02:54:37'),
(38, 'El platillo caviar ha quedado deshabilitado por falta de pollo', '2019-05-28 02:54:37'),
(39, 'El platillo Sopa du macaco ha quedado deshabilitado por falta de pollo', '2019-05-28 02:54:37'),
(41, 'El ingrediente queso se ha acabado. Se han inhabilitado 1 platillos.', '2019-05-28 02:55:37'),
(42, 'El ingrediente queso esta en existencia critica', '2019-05-28 02:55:37'),
(43, 'El platillo Sopa du macaco ha quedado deshabilitado por falta de queso', '2019-05-28 02:55:37'),
(44, 'El corte del dia 2019-05-27 es de $0.0000', '2019-05-28 17:57:01'),
(45, 'El corte del dia 2019-05-29 es de $0.0000', '2019-05-29 12:59:52'),
(46, 'El corte del dia 2019-05-31 es de $0.0000', '2019-05-31 07:52:42'),
(47, 'El corte del dia 2019-06-03 es de $420.2000', '2019-06-04 04:59:00'),
(48, 'El corte del dia 2019-06-05 es de $0.0000', '2019-06-05 08:51:48'),
(49, 'El corte del dia 2019-06-05 es de $0.0000', '2019-06-06 04:59:00'),
(50, 'El corte del dia 2019-06-07 es de $0.0000', '2019-06-08 04:59:00'),
(51, 'El corte del dia 2019-06-15 es de $0.0000', '2019-06-16 04:59:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `clave` bigint(20) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(30) NOT NULL,
  `mesa` int(11) NOT NULL,
  `estado` enum('abierta','cerrada','pagada','finalizada') NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `total` decimal(10,4) DEFAULT '0.0000',
  `impresiones` tinyint(4) NOT NULL DEFAULT '0',
  `clientes` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`clave`, `fecha`, `usuario`, `mesa`, `estado`, `descripcion`, `total`, `impresiones`, `clientes`) VALUES
(1, '2019-03-05 04:52:39', 'Admin100', 1, 'pagada', 'Orden abierta', '75.0000', 1, 1),
(18, '2019-03-10 10:09:58', 'Admin100', 2, 'pagada', 'Orden abierta', '44.8000', 1, 1),
(19, '2019-03-12 05:23:44', 'Admin100', 1, 'cerrada', 'Orden abierta', NULL, 2, 1),
(20, '2019-03-17 20:09:59', 'gerente01', 1, 'cerrada', 'Orden abierta', NULL, 0, 1),
(21, '2019-03-18 02:18:40', 'Admin100', 0, 'cerrada', 'Orden abierta', '360.0000', 0, 1),
(22, '2019-03-19 18:18:19', 'Admin100', 2, 'cerrada', 'Orden abierta', '5484.0000', 0, 1),
(23, '2019-03-19 18:33:19', 'Admin100', 2, 'cerrada', 'Orden abierta', '1928.0000', 0, 1),
(24, '2019-03-19 20:22:23', 'Admin100', 2, 'cerrada', 'Orden abierta', '240.0000', 3, 1),
(25, '2019-03-19 20:32:44', 'Admin100', 0, 'cerrada', 'Orden abierta', '240.0000', 0, 1),
(26, '2019-03-19 20:33:17', 'Admin100', 0, 'cerrada', 'Orden abierta', '120.0000', 0, 1),
(27, '2019-04-02 03:00:01', 'Admin100', 0, 'cerrada', 'Orden abierta', '360.0000', 0, 1),
(28, '2019-04-02 19:13:09', 'Admin100', 0, 'cerrada', 'Orden abierta', '100.0000', 0, 1),
(29, '2019-04-16 18:26:26', 'Admin100', 0, 'cerrada', 'Orden abierta', '323.2000', 1, 1),
(30, '2019-04-16 18:27:09', 'Admin100', 1, 'cerrada', 'Orden abierta', '0.0000', 0, 1),
(31, '2019-04-28 03:02:01', 'Admin100', 2, 'cerrada', 'Orden abierta', '14.0000', 3, 1),
(32, '2019-04-28 03:17:49', 'Admin100', 2, 'cerrada', 'Orden abierta', '0.0000', 1, 1),
(33, '2019-05-05 21:29:51', 'Admin100', 2, 'cerrada', 'Orden abierta', '14.0000', 0, 1),
(34, '2019-05-05 21:42:54', 'Admin100', 0, 'cerrada', 'Orden abierta', '0.0000', 11, 1),
(35, '2019-05-05 21:43:41', 'Admin100', 0, 'cerrada', 'Orden abierta', '0.0000', 0, 1),
(36, '2019-05-05 21:44:18', 'Admin100', 0, 'cerrada', 'Orden abierta', '0.0000', 0, 1),
(37, '2019-05-05 21:45:03', 'Admin100', 0, 'cerrada', 'Orden abierta', '0.0000', 0, 1),
(38, '2019-05-05 21:45:17', 'Admin100', 0, 'cerrada', 'Orden abierta', '0.0000', 0, 1),
(39, '2019-05-05 21:45:24', 'Admin100', 0, 'cerrada', 'Orden abierta', '1200.2000', 6, 1),
(40, '2019-05-05 21:56:19', 'Admin100', -1, 'cerrada', 'Orden abierta', '0.0000', 0, 1),
(41, '2019-05-05 21:56:53', 'Admin100', -1, 'cerrada', 'Orden abierta', '0.0000', 1, 1),
(42, '2019-05-20 01:35:37', 'gerente01', 0, 'cerrada', 'Orden abierta', '0.0000', 0, 1),
(43, '2019-06-04 03:39:12', 'Admin100', 0, 'cerrada', 'Orden abierta', '200.2000', 1, 1),
(44, '2019-06-04 03:49:05', 'Admin100', 0, 'cerrada', 'Orden abierta', '120.0000', 20, 1),
(45, '2019-06-04 03:49:38', 'Admin100', 0, 'cerrada', 'Orden abierta', '100.0000', 1, 1),
(46, '2019-06-06 14:27:37', 'Admin100', 0, 'cerrada', 'el cacas', '56.0000', 2, 1),
(47, '2019-06-06 15:34:11', 'Admin100', 0, 'pagada', 'Prueba', '30.0000', 1, 1),
(48, '2019-06-06 15:45:18', 'Admin100', 2, 'cerrada', 'Prueba', '90.0000', 2, 12),
(49, '2019-06-06 16:03:23', 'Admin100', 0, 'pagada', 'Practica', '90.0000', 1, 1),
(50, '2019-06-06 17:23:56', 'Admin100', 2, 'cerrada', 'Prueba', '120.0000', 0, 1),
(51, '2019-06-06 17:24:16', 'Admin100', 0, 'pagada', '', '30.0000', 1, 1),
(52, '2019-06-06 17:42:04', 'Admin100', 0, 'pagada', '', '180.0000', 1, 1),
(53, '2019-06-06 17:43:34', 'Admin100', 0, 'pagada', '', '60.0000', 1, 1),
(54, '2019-06-06 18:15:10', 'Admin100', 1, 'cerrada', '', '90.0000', 0, 0);

--
-- Disparadores `orden`
--
DELIMITER $$
CREATE TRIGGER `notificacion-orden` BEFORE UPDATE ON `orden` FOR EACH ROW BEGIN




	IF (OLD.estado = 'abierta' AND NEW.estado = 'cerrada')




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
(74, 'entregado', '2019-06-06 01:10:44', 31, 18),
(75, 'entregado', '2019-06-06 01:24:20', 35, 18),
(76, 'entregado', '2019-06-06 14:27:53', 33, 46),
(78, 'entregado', '2019-06-06 14:28:04', 34, 46),
(79, 'entregado', '2019-06-06 14:28:04', 34, 46),
(80, 'entregado', '2019-06-06 15:12:23', 31, 1),
(81, 'entregado', '2019-06-06 15:12:23', 31, 1),
(82, 'entregado', '2019-06-06 15:12:29', 17, 1),
(83, 'entregado', '2019-06-06 15:34:14', 15, 47),
(84, 'entregado', '2019-06-06 15:45:35', 16, 48),
(85, 'entregado', '2019-06-06 15:45:35', 16, 48),
(86, 'entregado', '2019-06-06 16:03:27', 15, 49),
(87, 'entregado', '2019-06-06 16:03:33', 33, 49),
(88, 'entregado', '2019-06-06 16:03:33', 33, 49),
(89, 'entregado', '2019-06-06 17:19:57', 15, 48),
(90, 'entregado', '2019-06-06 17:24:20', 31, 51),
(91, 'entregado', '2019-06-06 17:42:08', 22, 52),
(92, 'entregado', '2019-06-06 17:42:32', 22, 52),
(93, 'entregado', '2019-06-06 17:42:32', 22, 52),
(94, 'entregado', '2019-06-06 17:43:38', 22, 53),
(95, 'entregado', '2019-06-06 18:15:22', 30, 54),
(96, 'entregado', '2019-06-06 18:59:06', 22, 50),
(97, 'entregado', '2019-06-06 18:59:06', 22, 50);

--
-- Disparadores `pedidos`
--
DELIMITER $$
CREATE TRIGGER `notifiacion-platillo` BEFORE UPDATE ON `pedidos` FOR EACH ROW BEGIN




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
CREATE TRIGGER `restar-ingrediente` AFTER UPDATE ON `pedidos` FOR EACH ROW BEGIN




	IF (OLD.estado = 'pedido' AND 




        (NEW.estado = 'listo' OR NEW.estado = 'entregado'))




		THEN




        	UPDATE ingrediente 




			SET cantidad = cantidad - 




        	(




           		(SELECT recetas.cantidad FROM 




         		recetas, 




                (SELECT * from ingrediente) as ing 




         		WHERE platillo = NEW.platillo




         		AND ing.clave = recetas.ingrediente 




         		AND ingrediente.clave = ing.clave)




    		)*(1 + 




                  ((SELECT valor from preferencias 




                    WHERE nombre ='razon_desperdicio')/100))




			WHERE ingrediente.clave IN 




			(SELECT ingrediente from recetas WHERE platillo = NEW.platillo);




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
(15, 'cajero01', 3),
(16, 'cajero02', 3),
(9, 'chef01', 2),
(12, 'chef01', 5),
(14, 'chef01', 6),
(11, 'chef01', 7),
(13, 'chef01', 8),
(10, 'chef02', 2),
(20, 'drive01', 4),
(18, 'mesero01', 1),
(17, 'mesero01', 3),
(19, 'mesero02', 1);

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
  `imagen` longblob,
  `cocina` int(11) NOT NULL,
  `categoria` enum('Bebidas','Sopas','Rapida','Postres','Guisados','Otros') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `platillo`
--

INSERT INTO `platillo` (`clave`, `nombre`, `precio`, `dificultad`, `descripcion`, `imagen`, `cocina`, `categoria`) VALUES
(10, 'Sprite', 18, '1', 'Sprite 500ml', NULL, 4, 'Bebidas'),
(11, 'Coca Cola', 18, '1', 'Coca Cola 500ml', NULL, 4, 'Bebidas'),
(12, 'Fanta', 18, '1', 'Fanta 500ml', NULL, 4, 'Bebidas'),
(13, 'Jugo naranja', 24, '2', 'Jugo de naranja natural', NULL, 4, 'Bebidas'),
(14, 'Jugo verde', 24, '2', 'Jugo verde natural', NULL, 4, 'Bebidas'),
(15, 'Cafe de olla', 30, '3', 'Café de olla cargado', NULL, 4, 'Bebidas'),
(16, 'Cafe capuccino', 30, '3', 'Cafe capuccino francés', NULL, 4, 'Bebidas'),
(17, 'Cafe americano', 15, '2', 'Cafe americano clásico', NULL, 4, 'Bebidas'),
(18, 'Pollo en salsa verde', 45, '3', 'Pollo en salsa verde', NULL, 7, 'Guisados'),
(19, 'Pollo con verduras', 44, '3', 'Pollo con ensalada', NULL, 7, 'Guisados'),
(20, 'Pollo a la naranja', 60, '4', 'Pollo a la naranja, especialidad.', NULL, 7, 'Guisados'),
(21, 'Fajitas', 50, '3', 'Fajitas a la mexicana', NULL, 7, 'Guisados'),
(22, 'Alambre al pastor', 60, '3', 'Orden de alambre', NULL, 7, 'Guisados'),
(23, 'Pierna de cerdo', 70, '5', 'Pierna de cerdo en salsa roja', NULL, 7, 'Guisados'),
(24, 'Sopa de coliflor', 55, '3', 'Sopa de coliflor vegana', NULL, 6, 'Sopas'),
(25, 'Sopa juliana', 60, '3', 'Sopa con verduras y arroz', NULL, 6, 'Sopas'),
(26, 'Sopa verde', 30, '2', 'Sopa con verduras y crema verde', NULL, 6, 'Sopas'),
(27, 'Pasta pluma', 44, '3', 'Plasta pluma', NULL, 1, 'Sopas'),
(28, 'Spaghetti', 35, '3', 'Spaghetti a la bolognesa', NULL, 1, 'Sopas'),
(29, 'Hot dog', 22, '3', 'Hot dog clásico', NULL, 5, 'Rapida'),
(30, 'Hamburguesa', 90, '3', 'Hamburguesa de 250gr de carne', NULL, 5, 'Rapida'),
(31, 'Fish & chips', 30, '3', 'Fritura inglesa basada en pescado y papas', NULL, 1, 'Rapida'),
(32, 'Pizza', 45, '5', 'Pizza individual', NULL, 1, 'Rapida'),
(33, 'Cheesecake', 30, '4', 'Pay de queso', NULL, 5, 'Postres'),
(34, 'Pastel de chocolate', 20, '3', 'Rebanada de pastel de chocolate', NULL, 5, 'Postres'),
(35, 'Pastel tres leches', 26, '3', 'Pastel de tres leches mexicano', NULL, 7, 'Postres'),
(36, 'Jericalla', 14, '3', 'Jericalla dulce', NULL, 7, 'Postres'),
(37, 'Gelatina', 10, '1', 'Gelatina de cereza', NULL, 7, 'Postres'),
(38, 'Papas gajo', 20, '3', 'Papas gajo', NULL, 6, 'Otros'),
(39, 'Papas a la francesa', 20, '1', 'Papas a la francesa', NULL, 1, 'Otros');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `platillos_populares`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `platillos_populares` (
`suma` bigint(21)
,`nombre` varchar(35)
,`cocina` varchar(50)
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
('acceso_codigo', 1),
('apagado_dinamico', 0),
('aplicacion_movil', 1),
('ayuda_chefs', 1),
('desperdicio_diario', 0),
('forma_impresa', 1),
('forma_visual', 0),
('notificacion_chef', 0),
('razon_desperdicio', 0);

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
(2, 'Navarro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `clave` bigint(20) NOT NULL,
  `cantidad` decimal(10,4) NOT NULL,
  `ingrediente` int(11) NOT NULL,
  `platillo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`clave`, `cantidad`, `ingrediente`, `platillo`) VALUES
(1, '0.5000', 7, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `surtidos`
--

CREATE TABLE `surtidos` (
  `clave` bigint(20) NOT NULL,
  `cantidad` decimal(10,4) NOT NULL,
  `frecuencia` int(11) NOT NULL,
  `ingrediente` int(11) NOT NULL,
  `proveedor` int(11) NOT NULL,
  `nombre_trigger` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `surtido_ingredientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `surtido_ingredientes` (
`nombre` varchar(30)
,`suma` decimal(32,4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `titulos_ingredientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `titulos_ingredientes` (
`nombre` varchar(35)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `titulos_ingredientes_2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `titulos_ingredientes_2` (
`nombre` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `uso_ingredientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `uso_ingredientes` (
`nombre` varchar(30)
,`suma` decimal(32,4)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nombre` varchar(40) DEFAULT ' ',
  `apellido_p` varchar(30) DEFAULT NULL,
  `apellido_m` varchar(30) DEFAULT NULL,
  `telefono` bigint(11) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `tipo` enum('administrador','empleado','admin') DEFAULT NULL,
  `codigo` int(10) UNSIGNED NOT NULL,
  `tarjeta` int(11) DEFAULT NULL,
  `login` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`username`, `password`, `nombre`, `apellido_p`, `apellido_m`, `telefono`, `direccion`, `tipo`, `codigo`, `tarjeta`, `login`) VALUES
('Admin100', ':ÃG¼eBpr„˜1Xq6', 'Ivan', 'Lopez', 'Murillo', 3314702610, 'Calandrias 100', 'admin', 2905, 16039, '2019-05-05 20:44:59'),
('cajero01', ':ÃG¼eBpr„˜1Xq6', 'Emmanuel', 'Garza', 'Flores', 3310380202, 'Calandrias 100', 'empleado', 3423, NULL, '2019-06-06 16:02:28'),
('cajero02', ':ÃG¼eBpr„˜1Xq6', 'Esteban', 'Sanchez', 'Vidrio', 3310102020, 'Calandrias 100', 'empleado', 3167, 20392, '2019-06-06 16:00:40'),
('chef01', ':ÃG¼eBpr„˜1Xq6', 'Agustin', 'Martinez', 'Gonzalez', 3345456010, 'Calandrias 100', 'empleado', 9425, NULL, '0000-00-00 00:00:00'),
('chef02', ':ÃG¼eBpr„˜1Xq6', 'Isai', 'Galval', 'Alanis', 3310667210, 'Calandrias 100', 'empleado', 2056, NULL, '2019-05-05 22:21:43'),
('drive01', ':ÃG¼eBpr„˜1Xq6', 'Luis', 'Hernandez', 'Hernandez', 3323857013, 'Calandrias 100', 'empleado', 936, NULL, NULL),
('gerente01', ':ÃG¼eBpr„˜1Xq6', 'Luis', 'Hernandez', 'Hernandez', 3313211592, 'Calandrias 100', 'administrador', 2893, 26976, '2019-06-06 03:59:29'),
('mesero01', ':ÃG¼eBpr„˜1Xq6', 'Jessica', 'Amaral', 'Franco', 3319396262, 'Calandrias 100', 'empleado', 1872, NULL, '0000-00-00 00:00:00'),
('mesero02', ':ÃG¼eBpr„˜1Xq6', 'Dario', 'Menendez', 'Gomez', 3314702601, 'Calandrias 100', 'empleado', 5157, NULL, '0000-00-00 00:00:00');

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
`suma` double(19,2)
,`clientes` decimal(25,0)
,`dia` date
,`densidad` decimal(24,4)
,`media` double(23,6)
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `platillos_populares`  AS  select count(`pedidos`.`clave`) AS `suma`,`platillo`.`nombre` AS `nombre`,`cocina`.`nombre` AS `cocina` from ((`pedidos` join `platillo`) join `cocina`) where ((`platillo`.`clave` = `pedidos`.`platillo`) and (`pedidos`.`hora` >= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in'))) and (`pedidos`.`hora` <= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin'))) and (`platillo`.`cocina` = `cocina`.`clave`)) group by `pedidos`.`platillo` order by count(`pedidos`.`clave`) desc limit 10 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `surtido_ingredientes`
--
DROP TABLE IF EXISTS `surtido_ingredientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `surtido_ingredientes`  AS  select `ingrediente`.`nombre` AS `nombre`,sum(`historial_ingredientes`.`cantidad`) AS `suma` from (`historial_ingredientes` join `ingrediente`) where ((`historial_ingredientes`.`ingrediente` = `ingrediente`.`clave`) and (`historial_ingredientes`.`fecha` >= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in'))) and (`historial_ingredientes`.`fecha` <= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin'))) and (`historial_ingredientes`.`tipo` = 'surtido')) group by `historial_ingredientes`.`ingrediente` order by sum(`historial_ingredientes`.`cantidad`) limit 15 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `titulos_ingredientes`
--
DROP TABLE IF EXISTS `titulos_ingredientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `titulos_ingredientes`  AS  select concat(`ingrediente`.`nombre`,'(',`ingrediente`.`especificacion`,')') AS `nombre` from ((`ingrediente` join `uso_ingredientes`) join `surtido_ingredientes`) where ((`ingrediente`.`nombre` = `uso_ingredientes`.`nombre`) or (`ingrediente`.`nombre` = `surtido_ingredientes`.`nombre`)) group by `ingrediente`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `titulos_ingredientes_2`
--
DROP TABLE IF EXISTS `titulos_ingredientes_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `titulos_ingredientes_2`  AS  select `ingrediente`.`nombre` AS `nombre` from ((`ingrediente` join `uso_ingredientes`) join `surtido_ingredientes`) where ((`ingrediente`.`nombre` = `uso_ingredientes`.`nombre`) or (`ingrediente`.`nombre` = `surtido_ingredientes`.`nombre`)) group by `ingrediente`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `uso_ingredientes`
--
DROP TABLE IF EXISTS `uso_ingredientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `uso_ingredientes`  AS  select `ingrediente`.`nombre` AS `nombre`,sum(`historial_ingredientes`.`cantidad`) AS `suma` from (`historial_ingredientes` join `ingrediente`) where ((`historial_ingredientes`.`ingrediente` = `ingrediente`.`clave`) and (`historial_ingredientes`.`fecha` >= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in'))) and (`historial_ingredientes`.`fecha` <= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin'))) and (`historial_ingredientes`.`tipo` = 'uso')) group by `historial_ingredientes`.`ingrediente` order by sum(`historial_ingredientes`.`cantidad`) limit 15 ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ventas_dia`  AS  select round(sum(`platillo`.`precio`),2) AS `suma`,sum(`orden`.`clientes`) AS `clientes`,cast(`pedidos`.`hora` as date) AS `dia`,(select (count(`pedidos`.`clave`) / count(`orden`.`clave`))) AS `densidad`,(round(sum(`platillo`.`precio`),2) / count(`orden`.`clave`)) AS `media` from ((`pedidos` join `platillo`) join `orden`) where ((`platillo`.`clave` = `pedidos`.`platillo`) and (`pedidos`.`orden` = `orden`.`clave`) and (`pedidos`.`hora` >= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_in'))) and (`pedidos`.`hora` <= (select `fechas`.`valor` from `fechas` where (`fechas`.`nombre` = 'fecha_fin')))) group by dayofmonth(`pedidos`.`hora`) order by `pedidos`.`hora` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `ayuda`
--
ALTER TABLE `ayuda`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `solicitante` (`solicitante`),
  ADD KEY `solicitado` (`solicitado`);

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
  ADD PRIMARY KEY (`clave`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`ip`);

--
-- Indices de la tabla `fechas`
--
ALTER TABLE `fechas`
  ADD PRIMARY KEY (`clave`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `historial_ingredientes`
--
ALTER TABLE `historial_ingredientes`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `ingrediente` (`ingrediente`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`clave`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destinatario` (`destinatario`);

--
-- Indices de la tabla `mensajes_ayuda`
--
ALTER TABLE `mensajes_ayuda`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `destinatario` (`destinatario`),
  ADD KEY `ayuda` (`ayuda`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`numero`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`clave`);

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
  ADD UNIQUE KEY `nombre` (`nombre`),
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
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `tarjeta` (`tarjeta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `ayuda`
--
ALTER TABLE `ayuda`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `chefs`
--
ALTER TABLE `chefs`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cocina`
--
ALTER TABLE `cocina`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `fechas`
--
ALTER TABLE `fechas`
  MODIFY `clave` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `clave` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `historial_ingredientes`
--
ALTER TABLE `historial_ingredientes`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT de la tabla `mensajes_ayuda`
--
ALTER TABLE `mensajes_ayuda`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `platillo`
--
ALTER TABLE `platillo`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `surtidos`
--
ALTER TABLE `surtidos`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ayuda`
--
ALTER TABLE `ayuda`
  ADD CONSTRAINT `ayuda_ibfk_1` FOREIGN KEY (`solicitante`) REFERENCES `cocina` (`clave`),
  ADD CONSTRAINT `ayuda_ibfk_2` FOREIGN KEY (`solicitado`) REFERENCES `cocina` (`clave`);

--
-- Filtros para la tabla `chefs`
--
ALTER TABLE `chefs`
  ADD CONSTRAINT `chefs_ibfk_1` FOREIGN KEY (`cocina`) REFERENCES `cocina` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chefs_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial_ingredientes`
--
ALTER TABLE `historial_ingredientes`
  ADD CONSTRAINT `historial_ingredientes_ibfk_1` FOREIGN KEY (`ingrediente`) REFERENCES `ingrediente` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`destinatario`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensajes_ayuda`
--
ALTER TABLE `mensajes_ayuda`
  ADD CONSTRAINT `mensajes_ayuda_ibfk_1` FOREIGN KEY (`ayuda`) REFERENCES `ayuda` (`clave`),
  ADD CONSTRAINT `mensajes_ayuda_ibfk_2` FOREIGN KEY (`destinatario`) REFERENCES `cocina` (`clave`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`mesa`) REFERENCES `mesa` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`platillo`) REFERENCES `platillo` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`orden`) REFERENCES `orden` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`username`) REFERENCES `usuario` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`permiso`) REFERENCES `funcion` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `platillo`
--
ALTER TABLE `platillo`
  ADD CONSTRAINT `platillo_ibfk_1` FOREIGN KEY (`cocina`) REFERENCES `cocina` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`platillo`) REFERENCES `platillo` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recetas_ibfk_2` FOREIGN KEY (`ingrediente`) REFERENCES `ingrediente` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `surtidos`
--
ALTER TABLE `surtidos`
  ADD CONSTRAINT `surtidos_ibfk_1` FOREIGN KEY (`ingrediente`) REFERENCES `ingrediente` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `surtidos_ibfk_2` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Eventos
--
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

CREATE DEFINER=`root`@`localhost` EVENT `corte` ON SCHEDULE EVERY 1 DAY STARTS '2019-05-26 23:59:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN 
	IF((SELECT valor FROM preferencias WHERE nombre='apagado_dinamico') != 3)
    THEN 
     INSERT INTO notificaciones(texto) VALUES (
     (SELECT CONCAT
         (
          'El corte del dia ', 
          (SELECT DATE(NOW()) as fecha),
          ' es de $',
            (SELECT COALESCE((select sum(total) from orden where date(fecha) = date(now())),0))
         )));
    END IF;
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
