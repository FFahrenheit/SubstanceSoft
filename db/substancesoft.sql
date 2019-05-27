-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2019 a las 07:35:24
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
(1, 'Admin100', '2019-05-21 05:03:40', '2019-05-21 05:05:10'),
(2, 'Admin100', '2019-05-21 05:03:56', '2019-05-21 05:05:16'),
(4, 'Admin100', '2019-05-21 05:12:38', '2019-05-21 05:13:13'),
(5, 'Admin100', '2019-05-21 05:14:22', '2019-05-21 05:18:42'),
(6, 'Admin100', '2019-05-21 05:20:41', '2019-05-21 05:20:47'),
(7, 'Admin100', '2019-05-21 05:21:22', '2019-05-21 05:21:57'),
(8, 'Admin100', '2019-05-21 05:22:16', '2019-05-21 05:22:27'),
(9, 'Admin100', '2019-05-21 05:44:16', '2019-05-21 05:50:41'),
(10, 'Admin100', '2019-05-21 05:50:49', '2019-05-21 05:50:57'),
(11, 'Admin100', '2019-05-21 05:51:05', '2019-05-21 05:51:12'),
(12, 'Admin100', '2019-05-21 05:55:34', '2019-05-21 05:55:53'),
(13, 'Admin100', '2019-05-21 05:56:03', '2019-05-21 05:57:33'),
(14, 'Admin100', '2019-05-21 05:58:02', '2019-05-21 13:17:17'),
(15, 'chef1', '2019-05-21 06:25:31', '2019-05-21 13:17:31'),
(16, 'chef1', '2019-05-21 13:18:51', '2019-05-21 13:21:08'),
(17, 'Admin100', '2019-05-21 13:20:56', '2019-05-21 13:24:37'),
(18, 'chef1', '2019-05-21 13:21:36', '2019-05-21 17:32:41'),
(19, 'Admin100', '2019-05-21 17:22:58', '2019-05-21 17:26:03'),
(20, 'Admin100', '2019-05-21 17:30:34', '2019-05-21 17:47:26'),
(21, 'chef1', '2019-05-21 17:32:55', '2019-05-21 17:40:26'),
(22, 'chef1', '2019-05-21 17:46:30', '2019-05-21 17:47:13'),
(23, 'Admin100', '2019-05-21 17:47:49', '2019-05-21 17:48:39'),
(24, 'Admin100', '2019-05-21 17:49:05', '2019-05-21 18:06:22'),
(25, 'chef1', '2019-05-21 18:06:05', '2019-05-21 18:11:53'),
(26, 'Admin100', '2019-05-21 18:07:04', '2019-05-21 18:09:03'),
(27, 'Admin100', '2019-05-21 18:09:19', '2019-05-21 18:36:54'),
(28, 'chef1', '2019-05-21 18:16:32', '2019-05-21 18:19:39'),
(29, 'chef1', '2019-05-21 18:19:54', '2019-05-21 18:20:09'),
(30, 'chef1', '2019-05-21 18:23:37', '2019-05-21 18:39:47'),
(31, 'Admin100', '2019-05-21 18:37:10', '2019-05-21 18:46:53'),
(32, 'chef1', '2019-05-26 02:17:01', NULL),
(33, 'chef2', '2019-05-26 02:31:55', NULL);

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
(14, 4, 1, 'enviado');

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
CREATE TRIGGER `mensaje_ayuda` AFTER INSERT ON `ayuda` FOR EACH ROW BEGIN




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
(4, 'chef1', 1),
(5, 'chef2', 4);

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
(4, 'Bebidas'),
(1, 'Mexicana');

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
('192.168.15.174', 'Mi equipo cool', '2019-05-26 02:04:49'),
('192.168.15.195', 'Equipo conectado', '2019-05-27 03:08:13'),
('192.168.84.123', 'Equipo conectado', '2019-05-21 17:48:08'),
('192.168.84.147', '123', '2019-05-23 12:27:52');

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
(2, 'fecha_fin', '2019-06-05 23:59:59'),
(3, 'Encendido', '2019-05-23 23:55:00'),
(4, 'Apagado', '2019-05-23 02:00:59');

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
(54, 4, '1.0000', '2019-05-26 21:55:08', 'surtido');

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
('21:00 a 22:00', 2364.2),
('22:00 a 23:00', NULL),
('23:00 a 24:00', NULL);

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
(1, 'pollo', '180.0000', 'kg', 4.0000),
(2, 'queso', '40.0900', 'lt', 1.0000),
(3, 'maiz', '115.0000', 'kg', 1.0000),
(4, 'Agua', '162.0000', 'lt', 10.0000),
(6, 'Otro mas', '83.0000', 'kg', 1.0000),
(7, 'Anda', '26.0000', 'kg', 1.0000);

--
-- Disparadores `ingrediente`
--
DELIMITER $$
CREATE TRIGGER `historial_de_ingrediente` BEFORE UPDATE ON `ingrediente` FOR EACH ROW BEGIN




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
(123, 'admin', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-24 06:08:00', 0),
(124, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-24 06:08:06', 1),
(125, 'Admin100', 'La cuenta en la mesa 2 ha sido cerrada', '2019-05-24 06:08:11', 1),
(126, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-24 06:08:16', 1),
(127, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-24 06:08:22', 1),
(128, 'Admin100', 'La cuenta en la mesa 0 ha sido cerrada', '2019-05-24 06:08:28', 1),
(129, 'Admin100', 'La cuenta en la mesa 0 ha sido pagada', '2019-05-24 06:10:51', 1),
(130, 'Admin100', 'El usuario chef1 ha registrado su entrada', '2019-05-26 02:17:01', 0),
(131, 'Admin100', 'El usuario chef2 ha registrado su entrada', '2019-05-26 02:31:55', 0),
(132, 'Admin100', 'El usuario yo ha registrado su entrada', '2019-05-26 02:52:14', 0);

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
(8, 1, '2019-05-26 05:25:53', 'La cocina Bebidas le solicita ayuda', 14, 'solicitud');

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
(23, 12),
(50, 0),
(122, 0);

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
  `descripcion` varchar(30) NOT NULL,
  `total` decimal(10,4) DEFAULT '0.0000',
  `impresiones` tinyint(4) NOT NULL DEFAULT '0',
  `clientes` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`clave`, `fecha`, `usuario`, `mesa`, `estado`, `descripcion`, `total`, `impresiones`, `clientes`) VALUES
(1, '2019-03-05 04:52:39', 'Admin100', 1, 'pagada', '', '0.0000', 0, 1),
(18, '2019-03-10 10:09:58', 'Admin100', 2, 'pagada', 'Mesa cool', '8132.2002', 0, 1),
(19, '2019-03-12 05:23:44', 'Admin100', 1, 'pagada', 'Mesa mÃ¡s cool aÃºn', '240.0000', 0, 1),
(20, '2019-03-17 20:09:59', 'admin', 1, 'pagada', 'Prueba comandas', '2048.2000', 0, 1),
(21, '2019-03-18 02:18:40', 'Admin100', 0, 'pagada', 'Orden chico 1', '360.0000', 0, 1),
(22, '2019-03-19 18:18:19', 'Admin100', 2, 'pagada', 'Orden nueva', '5484.0000', 0, 1),
(23, '2019-03-19 18:33:19', 'Admin100', 2, 'pagada', 'Orden mesa 2', '1928.0000', 0, 1),
(24, '2019-03-19 20:22:23', 'Admin100', 2, 'cerrada', 'Orden nueva', '240.0000', 1, 1),
(25, '2019-03-19 20:32:44', 'Admin100', 0, 'pagada', 'Lentes', '240.0000', 0, 1),
(26, '2019-03-19 20:33:17', 'Admin100', 0, 'pagada', 'Anillo', '120.0000', 0, 1),
(27, '2019-04-02 03:00:01', 'Admin100', 0, 'pagada', 'Katia', '360.0000', 0, 1),
(28, '2019-04-02 19:13:09', 'Admin100', 0, 'pagada', 'Orden nueva', '100.0000', 0, 1),
(29, '2019-04-16 18:26:26', 'Admin100', 0, 'pagada', 'Hola', '323.2000', 1, 1),
(30, '2019-04-16 18:27:09', 'Admin100', 1, 'abierta', '', '0.0000', 0, 1),
(31, '2019-04-28 03:02:01', 'Admin100', 2, 'cerrada', 'Hola', '14.0000', 2, 1),
(32, '2019-04-28 03:17:49', 'Admin100', 2, 'cerrada', 'Q', '0.0000', 1, 1),
(33, '2019-05-05 21:29:51', 'Admin100', 2, 'cerrada', 'Prueba drive', '14.0000', 0, 1),
(34, '2019-05-05 21:42:54', 'Admin100', 0, 'cerrada', 'Juan', '0.0000', 0, 1),
(35, '2019-05-05 21:43:41', 'Admin100', 0, 'cerrada', 'juanito', '0.0000', 0, 1),
(36, '2019-05-05 21:44:18', 'Admin100', 0, 'cerrada', 'El queso', '0.0000', 0, 1),
(37, '2019-05-05 21:45:03', 'Admin100', 0, 'abierta', 'queso', '0.0000', 0, 1),
(38, '2019-05-05 21:45:17', 'Admin100', 0, 'abierta', 'queso', '0.0000', 0, 1),
(39, '2019-05-05 21:45:24', 'Admin100', 0, 'cerrada', 'yp', '1200.2000', 2, 1),
(40, '2019-05-05 21:56:19', 'Admin100', -1, 'abierta', 'jej', '0.0000', 0, 1),
(41, '2019-05-05 21:56:53', 'Admin100', -1, 'abierta', 'jj', '0.0000', 1, 1),
(42, '2019-05-20 01:35:37', 'admin', 0, 'cerrada', 'jjajaj', '0.0000', 0, 1);

--
-- Disparadores `orden`
--
DELIMITER $$
CREATE TRIGGER `notificacion_orden` BEFORE UPDATE ON `orden` FOR EACH ROW BEGIN




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
(40, 'listo', '2019-03-19 18:39:33', 6, 23),
(41, 'entregado', '2019-04-17 23:10:38', 4, 24),
(42, 'entregado', '2019-03-19 20:33:42', 4, 25),
(44, 'entregado', '2019-03-19 20:33:42', 4, 25),
(46, 'entregado', '2019-04-02 03:00:16', 4, 27),
(47, 'entregado', '2019-04-02 03:00:16', 4, 27),
(48, 'entregado', '2019-04-02 03:00:16', 4, 27),
(51, 'entregado', '2019-04-07 22:50:40', 6, 28),
(52, 'pedido', '2019-04-16 18:00:56', 4, 24),
(55, 'entregado', '2019-04-21 02:56:35', 3, 29),
(56, 'listo', '2019-04-21 04:03:08', 4, 26),
(57, 'entregado', '2019-04-21 04:32:32', 6, 29),
(58, 'listo', '2019-04-22 02:47:47', 3, 26),
(60, 'pedido', '2019-05-05 21:39:38', 9, 31),
(61, 'entregado', '2019-05-05 21:41:44', 9, 33),
(64, 'entregado', '2019-05-05 21:45:31', 1, 39),
(66, 'entregado', '2019-05-05 21:51:07', 1, 29),
(67, 'pedido', '2019-05-26 02:37:30', 1, 42),
(68, 'pedido', '2019-05-26 02:43:26', 4, 31),
(69, 'pedido', '2019-05-26 02:43:55', 1, 23);

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
  `imagen` longblob,
  `cocina` int(11) NOT NULL,
  `categoria` enum('Bebidas','Sopas','Rapida','Postres','Guisados','Otros') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `platillo`
--

INSERT INTO `platillo` (`clave`, `nombre`, `precio`, `dificultad`, `descripcion`, `imagen`, `cocina`, `categoria`) VALUES
(1, 'Hamburguesa Ranch', 100.2, '1', 'Uma delisia', 0xffd8ffe000104a46494600010100000100010000ffed002c50686f746f73686f7020332e30003842494d03ed000000000010004813330001000200474ccc00010002ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc0001108015d026c03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f7fa4a5a334009452e692800a2973466800a4a5a334009452e68cd002514b9a334009452e68cd002514b9a334009452e68cd002514b9a334009452e68cd002514b9a334009452e68cd001494b46680128a5cd19a004a297346680128a5cd19a004a297346680128a5cd19a004a297346680128a5cd19a004a297346680128a5cd19a00292968a004a297346680128a5cd19a004a297346680128a5cd19a004a297346680128a5cd19a004a297346680128a5cd19a004a2973466800a28a280128a5cd19a004a297346680128a5cd19a004a297346680128a28a005a4a5a6938eb400bd29a5c0accd5ae255b1b85b69365c18d846de8d838af9a755f136bf04ce93ea5785b2460c8739aa8c6e07d506641d48fce9be7c7fde1f9d7c723c59ab13c5e5d1909e017feb5713c5dab20cfdbee0b0ecad9c55fb315cfae8dd443aba8fa9a4fb5c3ff3d13fefa15f213f8df512c15aea724f767a90789b546e972fc7bd3f64bb85cfae3ed707fcf54ffbe851f6c80ffcb54ffbe857c8ebe21d46453999cfe349fdbf7c464492003d18d1ec42e7d7826423839fa52f98b5f23c7af6a61818ef2500ff00b645685bf8cf5fb76089a85c803fe9a1c51ec985cfaa770f5a5dc2be69b7f895e2283adecc47fb473fceb62dbe30eaf11c4cc8ff00ef28a5ec985cf7fa2bc6adfe32dc60192ca1914ff758a9adbb3f8bfa5c840b8b59a2ff0075830a974e48773d2a9715cb5878f740d40ed8efd11bd25f96b7edefadee97741324abea8c08fd2a5a680b58a314d0c08eb4b9a402e28c51450018a31451400628c5145001451450018a31451400628c51450018a31451400628c51450018a31451400628c51450018a31451400628c51450018a3145140051451400628c51450018a31451400628c51450018a31451400628c51450018a31451400628c51450018a31451400628c5145001451450018a31451400628c51450018a31451400628c5145002514b4940013c550d42e0c76f26c387da769f438abc7a1ac4d558846c500789d9f8cf57d31ee239e592ee10c4ed95b38e7a67b573faadc5a788b507b8b4050b0df246c3956ee3deb7bc4369f62d767458c7973e59491c73c915ca4d1ae97a94571186d921daf8ec2b7561dae8c692c1ede7254360f438e9562dd6d6c60179796de7c41caa4058a86e324923b74ad9b80a932473f28dcab8ed526b5a28d4b4888d88c103605cfde7500903dc800e3bf34e44a2b68d7ba6788f501a5dce910c71cc0ed68130c9ee0fb554bfd14e9f76f6bbb2e9f293478534abdd36f1759b98de08203b5770c1949ec3d463f9d6fcb0497f74d3ca3991f731fc685be9b0fa6a600b0db1e483c71934a9a76d4dc06493d2bae4b0b69571b0fb7afe156a2d2e111895d1b707d80007e6ad2e4347172e9b202095ce7be314c366f11e6bbe9ac4b21648073dab3a7b396520fd8f23a0aab88e3bca6404923d866a32b1cc089109c700815d4cfa25c381b2d59c12738c715466d26448ce226002e76914c46141692ac9b5092a4f4cd5b2258d3e72179c73cd3acee635bb891b011db6f23bd74ba9f869618cde5a2f999196c9edec3d684867311bccbf330fa15e6afdb6b57962c1e1b996361fdd622a382dcf9a2128cab27dde31b4d38da9e55b92090463bfa54f285cec34bf8adabd905172e9709ff004d073f9d771a5fc58d1eec2add6e81cf53d40af0a9ac8e33d3b8c566cc2787277123359ca08ab9f5c5878874cd4541b5bd865cf401b9fcab4848a71ef5f1d43ab5c5b806395d0af421b15d0e97f14b5fd2d82adec9228fe190ee1fad66e9761dcfa9811466bc434bf8e5bd42de59c7bfb953b69f7df1a35047fdce9d6eb09fbb2ee2e71f4a9f6720b9ed9b87ad2171eb5e156ff1235fd64916b768a71921115703dc104d32e752bfbf212eb5e721ba8591dff41c51ecdadcd21072d8f7292f6da2ff00593c49fef38154a6f1268d07fadd52cd3eb32ff8d787be988ecbb7edd77bba70147f5a9a2f0c5dcc405d3218d7b9966fe80d1ca8af64fa9ebafe38f0e21dbfdb16a4ff00b2dbbf955793e21f8663386d510fd2373fd2bcb9bc3f327cb21d2a300f772e7f2c9a45d1edd1b62dd59f9a78dab6c4fea68b21fb25dcf496f89de181f76f5dff00dd85bfc2ad695e3cd1359bb16d6335c4929ec2d9f03ea40c0fc6bcee1f0f22f2d74a8dfec4119fe95d6e9d3a5ac490c0aaaa001c2819f7349d886a2b63bc59437434f06b1ec26670335aea72b5240ea28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a4a5a4a000f4acad4a1df19fa56b557b98f7a1a00f26f16e9fe6db9982e5a2c9fa8ef5e6f7900b88f24f0383cf7ed5ee3ac5a7de18c83d6bca758d38d9ddca810f964865fa7a56907d069d8e74aff6869fe591fbf8ce33e952e9969772c52c524fe5c7918078208e87d8fa1ab31db8827b9913ef06c01ea3b5685b5bef01a53b0918207ad6a26356c25e25bcbd6b858862352e5b3f5cd135da3c5fbbc60f071da9e6d2381439958a038600d4125b2c418a90476142d044f6d2bb461486e3b8ad98b5032058a41b307e57079cfa573b1dc79630720f439ad186e6cae156391595fa641e87d680b1a306aa0cd2413e1665e793d47ad6b59cd6d3801c7cddb3c0ae5b548f372a62cb491804b763eb5258cb3c8cb245bb23aafe35484765169b0bee7ce77765a6cda4c47e409f2fe74dd38c8236dcc779e82af2cce1c2fde23ad526268f33f19785bfb3a48b5048c792b32b328e707fc0d7a035a5b5f69b1a5b60a3460fd01a6f88214bfb29622b98d8156cd54f0b5f491e99f637277424a027ba8e94f511cf6a1a14b16b28a62dc98c823b62ab49a7196769044dbb19201c0cfbd77925a25c4c26dcc0f1d0e01a8ae348f35364670c3e6209ebf5ab4d1270573a7600660369e0803afb5654fa7bca186c52067915dc1d16591d9d15cafa67bfbfb567dcc1b252046ace3ef1ce3eb9f4a2c82e79f5ce92599b6805719e7a8ac3b9b3789c82a7d01f7af48934c91d8ed4119201036f07fcfad55b8d0e59532d1a6fe9c0352e171dcf3940f9eaac3bf623f1ab50cd3444ed9182fa67bd74f71e136552e9853e99ac3b9d1ee62ced19c1ea78acf91a29323b7ba7472cc9cff7978ae9746f133e9831e4c4e7f8598722b9608d12fef323d3dea41b245ce307b30a562e33717a1ea767e269aee2563392d2744b74071f9f4ad293ed4ea4c901031ff2f7296fe640af21b4bfbbd2ae05c42ee3fda5ebff00d63ef5d6e87e33b4695ffb4ac7edb375479662bbbd891dea1a3a5558c96a75b04cd1bef6bdb6b703f8218f737f202b5614dd82adb8b0e5c8e5beb59fa3f8825d6f7b695e1cd2da551b597e62e3f027f5ae8f4fb497212e62f2a61c3a7f74fa565266751a6b42382ce490f426b6acb4c6c8c8ad6b1d39768e2b5e2b654c60549915eced7cb038abe0605017029d4005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005252d25002d35864629d450061ea76a1d18e2bcf3c49a61b884951f3c6770f7f6af56b98b7a9e3b5723ab59f24e29a7603ca60823692223ab38ce0f1c0e957da259376170c3b7a8a9752b11677b1b0502367f97fd93dc52c64bc3bc7d33ed5ba7a018d710bc72945ced3d81aaaf13abe55ce01e062b5db6ca181c0c1c027d6991c68396c0fa76a62465346eee32000a3ae29d69017981c32b13d0f4fa5683c1e5e4e73938cad3a01b72bea3a9a2e326f216789d91df6c632547241ee2b4ec9208caa3db12ee38643d3eb5856b116b972cce01c29da7f235ada3b4ab21577cb0731ed27b034b9ae16376dbcd8ee70d032af407ad58965c29627033d47e554bcd79672f092e33f28cf1c54d752078d0ab8dca3257a134d310b3b2cf111b4b0c76ef59fa75b446eda682653b98892303b83d69d2ea6db52da3016e25c85f45c77ad1d1e05c89228c1dbf2e00efdcd5730ac5f924f2e111c8186d3d48aa244d733ecdfe5ab1c6eef5b5a858bfd9b7181df2413f4cf5ae756f26174f1c916d0075008efc738e6a94912cd5441160093791907b67f0ac7b9d3e279598e79e7af0723b8ab56a5c8fb4970cbbf9c9e6ac3346243f2e140c9cf15498ac64c3a56132b272cbc0ebd3eb4db8b6253388f76782a3826b4da231e4edca1ebf8d451c6e88db463e624e0743dffc6aae23167d0eea74ca18ff00798c83d4567dc78799d02ca0b28393cf24fad75d24e369563f38c63b1a8e07dd205900254637352b8d23cfb51f0bb46a5560ce79e7d2b95d43c3cf131d80a9c7e15eeb2dac32af98aa09ee3b5636a3a225d464795b73e839a9d0363c1dfcfb3976b649a635d02770010f7f435e89acf839181316738efc735e77a969b3d948c1d081512452668693aec9a6dd89a390a4a3a38c8cff00f5abd0ac3c77abc93adcdbc8b39caf9904a4312bdf63673f81af18323af4fc6a683529edfee31fa1359e8f72ae7da1a26ad15eda472a0285973b1f8615b892061906be47f0e7c4abfd25915a4668c1ced63fcabdabc2bf14b4cd591239a511ca78f9ab370ec3b9ea19a5aa76f7b1cf186475653d083c55a0c0f7a801d4514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014668a4a005a28a2801ac322b2752b5de878ad8a8a68c3a9a00f36d634e596378dd783dfd2b95646b58cc2dc32f18f5af50d56c720902b87d674d6914ba0c4a9f77dfdaae12b01cbcd305562386eb81de9a8a9202fcfe26aadcee9030c7cca79f6f6a9e398791b72372e32077ad5b02ec2a3ef329543f8e2993c6aa78e727191d2a2b4ba21da3284c6c7904f4ad0545c9017838c1073c5200d36222f10b2e5318f5fce916455be9fc847f9a4273fa55813476b6ed20cf99d8566d9bb4c3f7659496cb9a36035a1636f2192166231809ea6a047b849c967c13c12fdbdeac237d9cee12060a30063926b29af65bcb8755c32a7f4a680bda05aaea1e2a6f358948d198e075ad2fb66a4b2c8f608b18524056e4d65f8499e4d4aee753c60ae7fcfd456f5838b50f04c36375193927daa5bd46ce02ffe2478fedf5216dbe38a30d804400823dc9adab4f8b0b1a8b6f11e9a03f7b8b61d4fa95cff002aea6ef4bb4bc56531a3865fc47bd79bf8874384207d8de848ea0fbd50ac7696baee8778a66d32fd240d92d183c83eebd7f4ae8ed041a8dab22b89090420e0d7cdf3d87972e636c37507383f9d6869be26d7746952449e4902f3f39e47e3426d0ac7baccbe5488934ebb978dac319f7a75c97b70e154041d58f43f4ae47c3bf1374cd6254b6d6916da6231e6381b49f7aefa3b3875088156db195ca9420a39ff00f5568a44b466db209e55dd1ed6c751dead259c61dc2e481df3d3f0a6ae9f776f23951b940c021b18a8c486df3e69dbcf01466aae2b1695768db86fc060534a0c86c0e7b54ab730c912e58eec73938cd248e8ae1563f976fde0790680326ef4f8e67e2407b95c75ae575bf0e5bdca483664b74cf6aed8aa17de99cf3939ce4d411da89e07dce325b001e71d3ad00785ea7e0e3098e532470c52360339c73595ab695696770d696edb9e203cc958f049af76d4f4fb64d367fb442b22a82e09e7a0c8af126696e0b4115b99ae2762f8c67193c1a5ca85739b9ad584c6341b88193b7d292daee7b5943248ca4576da6e8d6b64d3452e25bc452ee80e715837302c884c90ac609380abc8a8749ad4a523acf09fc51d4f47744794c90e795635ee7e1af88fa46b71a299961988fb8e7a9af938daba3305e42f5f6a9ed6f6e6ce40d1485581e2b371bee55cfb862b84906430231c1a98106be61f097c5ad474a78e0bc6f360e855cff2af74f0ef8d34cd7a056b79d56461fead8f359b8b433aba2a249438eb52035202d14514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005252d25002d14514005252d140152e600e878ae5354b020b102bb561918acdbdb41221e2803c775fd20166b98c608fbe07f3ae51da48d88c06f4e715ebda9589527e5e2b80d6f45f2dcc9103b18f4feed6b095f46064da6a8aafb658d81cff0010a736aa3ed7ba262bfdd1daa28a1685fe6e57e9d695208fccdd8ddc75ad2c0690792e49249438e0939a7c2970e17047b95ef54d09127ee77b0ce3a74ab50c8e263b73ea0f4e69302dadd4b1a3208f0e46093daa9c84697a64f7129f99ce17d7356cdc859183fccc319fad605edd8d535e86c4902083f7931ec00edfca8433b7f0c42963a1899d3f7b37ce01f4cf23fcfa547a84ad2c325c46b970d8005654dac34fa534c84a067d813b0038c8ab3640ddda0413056c7427ad67d4adcbb69ae2a38f3895c0da3239ad5b9b3b3bbb25dc8304751e958e96455e0798237070456acb2a3da0553b0a90464672b4ee2679a78cb418ec7508c5a8ca904e7fc6b9a92d9c1fbb815e9b7f6e97f7c81640c510e7bed39e86b0351d236336cc6dce319e86b5b1173859ad15f391cfb569f87bc5fae785251f63b9f36d41c9b794929f87a54973108df1b7b6335992c3927069580f74f0efc4fd175ff2e0bb6163747868a53f231f66ae8aeb488d079d14cccad9762483f403dabe5865649318e0f008aedbc2ff0010b55d0fcbb7372f3da838304c7207d0f55fd45170b1eb8b34258a076f35475cfad3b7c986ff00968c7daaae9babe95e25b632db34715caf2d0336187d31d475a918dcc12855407df766a9484d163ca5d85482b93c11daa1123431b20e3272dc7069e971234608dc3079c8e0d3d64121049e31c822aae232eee712a340230e8dc1c0acc8743d26cbcdb81612248fc3b21e6ba1d8a0bb70a3a64f1503c72342e158819c74a6b4158e22eb49d2bc3be1ed4353895da7b872a37fdeebd2b83b4b59b544372c8c22439c638c7735ebda8e930ea1662da500a6eddd7bd616b9a25d45a048fa4af98f9dad1a2f2abf4ab524f726c7955d5b4d379be42e10b618d41fd9a521560ec475391c62bae934eb8167696ef195b9b8392bd315d25d785e0b2d15a090af9cd1ee7723a1f4152e098267933c7e53151c915afa3eaf75a74eaf04aca54e7835425b5885cb882e403bb6866e871503a4d6f261d57eb19c8358dac59ef9e12f8aa0a476fa9f27a6fcf35eb1a6eb36ba8c024b799645f63c8fc2be32b7bb21b2adf51e95d7683e30bdd2665786e1860f4cd4382655cfac95c30c8a7579b7857e2459eab1225d388a5e9bbb135e8105ca4ca1958303d08ef5934d6e32cd1481b34b48028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00292968a0028a28a00293bd2d277a005a6ba865c1a7514018ba8590753815c76a56030e8cb953c115e8d2c6185616a56018138e6803c7351b56b09764833137dc7c7e9544a647c8722bd0354d35648de2913287b5711a8e9f2d83f53b49c2c83a1f63ef5b4677d185ae32cdca6472afdaa449ca2976e5c1c62b39ae278d86503e3d0d491de43233076d84f50deb563b174ca009666e4804e4f6ae7b4b8e61747e504dc39323939c273d7dcf3c7d2b5afa6496d4c119cb38e48ef8a7e9160f6f6423070acfbc82067f3a570094070228d4ac51fdd0056a591758fcb1c08c06151088b6e078a5605651b4e07b7ad481bd6973e72bed3df2b8e82ad4de5c90c60821875c1ac3b7bbfb21240ea30d5685e3dd42589fba7a8eb4580c1943e99ab33da96950925c1fe2fc3dea9dfdedcb4c1c595cede41222241cfd2b56588cd71bd571ebdaafc6f244a0425949e320e2af9856380be7c26e78a44cf219d0afeb8ac396540dcb839e457b12199c61a52c067e56e41aab3d8585d37fa4d95b48318e6302973058f1e6218b124671cfbd1040b29196e0fa76fc6bd6a5f0be833421574f542831ba3e38aa8be09d384a3c82fb1bf81bfa51711c6e9c2e5248cc0eedb0f0e3864ff00eb7e75e9fa36a93cf66b05f805fa2cbbb39ed907b1e292c3c336d68aab122a8cf23d7fc2b5a3b1b454f2d95704ff0010ff003f9d1719656d2e1122751e686f958138c7a126984ac528452739e7b8abd6a25b75d913ef888e15ba8ab6d670dd0f3147cdd4e393f9d0a427633c6d64206d20f041a8cc1d5411c9e296eec6f207ca2ee8faf4feb54c5e1859038393d38abe626c2c964f2b1cb631d36d43f6696d59648a4746e991e95b2a626dab2304760082c38cfd6aea69b23a8ff57227a669dc47150e9b6f06b7fda9788f39419c11f74e3a81deb8dd72eeee58b5ad6e5668d67221b68c9e833e95ec2da1adce577f94fd8377fc6b89f16782f51bc686231aa0462d93f758d5a9a135a9e33258a9d96b6ca649d86001dbd49add3e178b4dd11a4bd909391d3a93ed5d3c9a149e1ad3bcab68049abdcb6d0e4648cf1915675ad260f0cf85a08353b8f3aea7732396e4e7d053515b92e4796de593798a6050838fbdc669b0a4a8c414df8ea63e76fd6ba46d3fed21ee8809184f931e959da7e95395b96b67219419031e840ed9a52858698cb0bf92d9c3c6c40cd7a4f85fe215c69c52395f7c7dc31c8af32fecfd442f9df665746e498cf4a6c773b1b67cc8e3b30aca515d4b4cfabb44f14596ac8be5ca16423ee31ebf4f5ae81240d5f27e95e2596cd9559c85cfaf4fa7a57a3699f14350b0b5def6e351b651fc2db655faff00787bd632a6d6c55cf6ecd15e6361f19748bd81645b3bb0c782bf2e41fceaf37c53b00bb858dd63dca8feb52e2d15667a0515e6aff172c95b0ba6dc11ea5c0a5b3f8ab1df4fe543a4cf9f66dc7f202a6c1cacf49a2b32df5259a18dce559864a9eded57629838e0d0226a28cd1400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005252d25002d14514005277a5a4ef400b4514500150cd1075e454d41e9401ccea5a70604815ca5fe9e0ab23a654f50457a54b0870462b1350d3430240a00f20d53446881921e533923bd6134783f328c7b8af54bdb028c7e5ae4f54d236b19add467ab27f856919741a3965836c8ae3a7b76ad481cfc857231de9f6fe496c15dac7a8ad2b58a2cedc0fa1ab01368923dd8c31155591c1fa57430dbc423fba307d69ed676ec3050f3ef537039c58dc32b8e47bd68431e012b80a4723356dac224c90a71f5a62a206da3e5fa555c067d9908c80739e714a63643b429f6c8abb6cbb376402074e29cf3945031922a1b028fd9dc0057249ed8a956ce4739936aa9ef9e95623b832273c5395d5b8cf4a5763217b754188e60063078eb40b8f2d36316723b85fe55332ae083839aaef6c7b1e0d25260d113ebb124a365ab19071b99b141d718c654c0a8c4f0c4e714d92cf805467daab4b00c9dc8456aa489b12da5ddc1979b866e7ae7bd6f5b7895ad5d84aa9291d4e307ffaf5cec27036f9782a79e31514970048136639c939eb549a158f41b3f1241763696d8de8c3ad68c496d7232618b39e0e2bccedd6608644c8527bd747a6eab2c602338e3b502b1d54f6c9247878564ff67b1aa11584715c99a069635e8633d055886fe36446660a4fe46ac798264c67703e945c44ab77e480b2c42443d4f714f92cedb52b468c3178581f949e47d0d67f992407e53bbd055881df78d8a509e4629580c6b9f0ecb68de6a38b958f90587ce98ae27c5fa1b7886fa0ba9d8bc112e0a0e1b8ec2bd7daf9563226439071903ad50bcd36cb550442c81c0e4a8c1fc69c6a35b89c4f9ca396e752d4db4e8edcc302642a053d07f3ad4bed2cda40554aa3ba60a8eb8ee4d7a9fd924d1e4b90d670ac8c85449e58cfe06b82f107877548b469ef9e292496e2609105e491ea7dab7552fb92e271515ccd693ec832c9bb193cad66ea4f24d780dbc2a4b13bc6381f4addd6a46d366b7d24a7fa42a8de78f958f6fad56b8b74b052ce3185e093cb1aa69342b9cfdc33c18f3632aa7f88738353d8ea925bb0daf953d4034e6b6baba492e033ed1fc0c339ac9688c6c588319ce33d8d632562d334af277b6ba5bbb26daafcb276cd6e699ac47a8208dbf772f43193fcab9a825dd1ed7395e991c8aaf287b59d648891ce55b350d17193477ffd95793baa41b987500a9cd769e15d1d748dd74fe70ba7182afc6dfcbfad709e13f16ac7731c7a8e383f2b9247ff00aabd6ad9e3bf9da789c3a48770c1ce01ed5849346d29dd1ad6733bb0e4d75163b8a826b334dd3c601c56fc3088c5499130e94b494b400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005252d25002d14514005277a5a2800a28a2800a28a2800a8a4883ae2a5a28030efb4e0e09c572b7da7b213815e86e81874acbbdb05914f1401e4fa968c24769600125ee3b3566c33b03e4cd94753debd0aff004d2a4e16b9ad4b4a5b8073f2483a381d3eb57197702adb5e18db6b9dca7bd6a4644a9ba3607e86b987f3ad1bca9d7e6ec7fbc3daa782f1a170cadc7715a59319b72ef008aa2f23ab67d3daad47789731065e31d714c902ba839073f852b0816e8edc819c8a8cdc658e3ad40ff2a903f3aabe632c83d3bd1603516611afa9a995f0723a9aca8e5ce768356a39c05c15c9a4d0ee5c2ed9f7a03f192693cd45187c13ed51c83fba6a1a1a6581c8eb4e29b873838e950472103934f2ccdd3a52d862bc61d0a15c93ce6ab4960ac0edea7819ab48df3fbd4b1ed2bb89e86a94856290b3923802a0c6dec7a0aa97324a0fdf538f4adb9503c1c9e0f419aa32da1525828662302ad489b146db5693eebb36d5f7e2ba3b0d79551413807d4f4ae7ce9c41dea086eb559ed6485f78c8cf18a77b8ac7a1595e898157c15c64115a905c2a90639031c7e95e5316ab359cbb03b03d060d6e69badaa49f7db775269858ee2e6695909ce73d2974f581d8bfdd908e4fad61ff006cb4855e1c31c600eb5a96d2a3c7bdf2a7b76a484d17a7bab768da0bc5ca9e8d8cd50bad36f2de3df66fe7c046e087a8a8995e69022159307907ad6a42ae92a05050818c13818aa6adb08f1ad53c082e35c97559266dc5fcc68cd6669be0eb9d7759b9bcbe0f0d9c5d55b8f7c57b8ea7676dab1da4795709c87e307eb5cceb767a88d29f4c12a4124a08f349e31df9ad233be8c871ec7906a5ab5a2e977a6c62f2e28e43121c7dec5716976ad0b17c139cc8dfd057a178b7c36749d16ceca05f3220c64964cf07deb88b5d065d472d044d15847cc92c9c6e3552d5e80bcc659e98f7b66f7d65f2327fcb32386aa7bf25a3788e3f8a361c835d8c7aad9d8e86f1d9e1893b01c7a75c7ad63bc915c0104a36cf8dcb21ea73ea6a5c341a95cada7ada3a182704679490755aea7c35afea7e16be8cc886e74d73f3ec19c0f51e86b909e43bcc6404b88fb8fbafff00d7ab7a66af71a7ce0b0cae7946190d594a372d33eb0d1ef21b9b58a68583472286523b82322b654e4715f3fe85e3dbed33c99a045bad2c604b6fd64b71eaa7bafb1e95edfa76a315edac53c4d94954329f63584a36651a745206c8a5a40145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001494b462800a28a2800a4a5a4ef400b4514500145145001451450014d6504734ea28033aeac96453c57377fa5e3240aed0807ad559ed964078a00f2fd4b4b4b885e2954ed3d08eaa7d47bd70f71f6dd22ecc1789e64672639947df1f4ec7dabda750d2f39205727aa69315c42f04f1878dbb7a7b8f435519580e32def081e6c0f953d455b5be66521891ed5cceb5a3ea5e1eb9fb4d93992027907a37d7d1bf434ba5f89adb517f29f10dc0eb1b77fa56b74cab1d425e2852a4f39e29d210f865c7e3598c031dca7f0a7477017afff00aaa892e48f32a93955a22b90a396c9f5a12e2298805474a6496e4b7c8aa29016bcff00941cf39cd5a8a61bb2cdd7b567c68e146e5a5791d7042e69580d6dea578e3de904d8071d6b216e65270703daa74bac8dac39a8711dcd059c86f6ab3bd5d71902b2bcd1d8d482623bf5a9b146c21ca618e71d29924af11155219fde9cf313d0e68404cb3af9783f773ce6ab5d347b3a12a3d29ae7703e9e9eb51ab3608e31e9eb54993633ef6149196441f2f7e704550b894afca58ab0e8c3b8ad5b95f2e4dc8376474f4acf9a559b28ea323daaae02c5a94b0bab6f2a4a8ef806b7ad3c4cf205527715e335cab4092c6ebb98aa7214f6f5a2c15add44899dd9e0114d30b1ea1a7ea40b895c8070318ea6b4ae75b8ee576212a7a67a62bcc6df54612ec39dff005e2b5ecf540c7e72bd73ba9dc868ef6d998dab79dfbccf461d453ade1fb4ab42dfbd8482486eaa7dab021f10031ac6802a0fbc0f7adbd2af50f18079ce698ac646a7a0836725b5eaf9b6121c0755f99335c2f89bc2575b2d746d314b5a3b0f32651dabd7deee169087dacbd307fad674f1cba7dc9bbb45f36d187cf0e3257dc55466e24b573c4359f099b0d424b78a031d9d9c21b7b30f989efee6b0cc4d344b2ddc4a9b5b2a4f040ed9af5df10e831788a7b7d42d2667448ff7b1f4c91dabc7b559af6e7c44d67e56d0afe5ac4a38ada2d344bd0a30afdb2fc04b70f938f9b8e3da9b7d606da49044c182fde8d8e40fa1aec1d6d348b1ba58a10f34283cd90f1863d87bd71e1619f4d9ccb7063724bb67ae734a714082c3507b1984d6cceb2272c87823fc457b8f80bc6b6da8db456aec914a9c051c0fcabc5345d0e7d4aca5b89832aaa9f29c753ef542daf2e74ebb0f1be190f0ca706b0942fb9a267d996b38751cf35641cd7cf9a47c57d42c34c4b8f292f122c09a06386c7f794ff315eb9e13f18d8f8af4b5bdb40f1f3878e423729fc2b9dc5a2cea28a62b8614fa401451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001494b49400b4514500149de9693bd002d14514005145140051451400514514005145140104d087078ac1d474d0c090b5d2d432c41c60d0079b5fe9c0a3c7220646041561906bca3c5be009033df695b891f3347fc43e95f435fe9a1d4f15cc5ee9ec8c70bd29a760bb3e7dd23c597160e2db520ce80e3cc1d47d6bb3b7bcb7bc844913ab03dc55cf14f806cf582f716e05bdd9e5b1c2bfd7d0fbd7196569a9f852ebcad46dda4d39db6971c6d3ea0f63fa7d6b45219d62e11b20d5db7ba4523773eb55fec32496cb7366e2ead986781871f51deab2ca8495c9523a86e08ab4d30b1b6668d9704119a67961fa161c71f4f6acc59580e391eb538bcca8c1618e3e940897ca01b92dd29c30b838271dea1598e73b8f3eb5379c1ba31c8a006b48548c0383562394923350b6d61cb62838d9c1248e9ef49a02d89c138ce2a6490a807bd66ab81d6a559c6702a1a1dcd20eafd7ad26486241ed5504c3a7eb48d2b202d9cd2b0c9dc89401dc5529ac496dc0e3b9c0ab115c0241a924986403c6680327cb68dce060679c9a63a309c2c6e49ee3d6b42454c1f7acbb847f38b2646de873548430285b873b886c01c8fceab497ef038da7014f43571ae328d90a0e3d79aa6f089c6e7da4f7a632f596b2d2baac8d827f8bb015d3db7889618c4703e48ebc75af3cdbe5ac8ca4ede98a75a5cb27ce4e07d68b8ac7abe9ba93dd4f8ddb5bae09eb5bf2de158c0570af8e4d796e9faafd9d331b65dbb9ae82c7569276c33f41d28521729be6c25f29a6b494473ee3c2fdd6aa5a6586993eae6eae6d123d441c1661d7deac0bc40ca1704b7bd4f2986e502dc64e07cac3823e86ad48968e5fc6fe1532584a9a52f32b7992003a9ff22bce6cbc35717c5e5d489b6b1b63928579723ae6bd8d6f9ac9f65cca66b5ce166fe25fad54d5c69da8dbb4522aba4a782bc67eb5b4649ee43479a5bebc134fb916b6c63b707ca8643c173fe15c8ea767125ca179364ee371db5ea171a446cb6f0ccab15b5ae4a2c4b9ddff00d7ae5ae34db65964babdc02ed8453d40f4c5535cda12ae8e2e39e6b19816e87f8c7461ef5e85f0eb576d2f5c59ad5b36f30db71067a0fef2fae0f38ae3f53b592267920807d9c9fb9d4ad67d95d4b69289e098232b6700e3fc9ae7942da3348b3ec9b0bb5991486c82335a60e45780f86fe2a4969a66fba87cf308059436d62bea0f435ea9e15f1ae9fe29b4f3acc48840cb2c80647e55cee2d167574546920619a9290051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005252d25002d14514005277a5a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802378c30c565de69eb203815b14d65c8a00e12fb4b2a4e16b0aef4f5915a39625743c1561906bd327b35901e2b1ae7490c490280382834f8ad770822080f50bc0a86f748b7bd199a201fb3af06bb6fec639fbb514ba4103eed1703cbae342bdb125ad5bcf8faed3c115577acb9520c5277078af47b8d3d90fddac9bcd2e1b9e2684123a3771f8d5a9f7038d8c4aa486391d88a7aca4f19c56c4da132730484ffb2dfe3595736b35bb93244c3dfb56aa4980e59be619ab2b376e2b397731f7a5576ddda98175db701802987701903a75a83cc278c74a707040ea0fd69580b28e78ce715234df2e2aaab70781448485e47d29580719487e0f4a5fb5961ee2a98721b9a47612f23e523b5161977ed3907151f9a08dcc0f5aaa25d8307afb538cbbd7038a5618c99373f9919c11d6ab091938c75eb5658848ce7bf1555dc2e5875a06c632a6dc30f98f503bd4122a91b231919fcaa693e60188c8350cd1b29dc9c53b12476970f0dc6589da3b1ad5b6d73cb9304753c5634a490011f30aab26e0323208a5c8173beb5bf6deb21908efeb5d0c3a8ee8540e4e3a1af2ab6d4278c05dc715af65ae3248bcf03b668e568477c41f2d8b3862dc6c3d2a8340f6999a30cf113f3275dbee3daa858eb514d20dcea49ed5b26e1648b39c7a62a93b09942e0996dc88dc33639c1e95cfdde9cd7483ce018af427a8ae865b212c85e22525cfde5eff005151b40564f26f36a1c70e3a39f407d6b55222c79eea1a55c452e6066ddd367635cddedadc349bfeca8a57ef60f5af59d434f4e81c023a01fe35c9eaba24e1fcc4520fa1e334357038f86e9216062254ff00121e845751e16d627d13578752d35d8a21fdfdbe792bdf1ea3dab9abfb26818965c1079e3151d95f3c32870371078c1f98566d74291f5fe87ac43a9d943750481e2957729adf43915f32f863e214fa15a4c6dd1264fbe619091cf7231d3debd77c11e3f87c531b0f216ddd46e0a24dd9fd0563283451dfd150c730719cd4d500145145001451450014514500145145001451450014514500145145001451450014514500145145001494b498a005a28a2800a28a4ef400b45145001451450014514500145145001451450014514500145145002114d31ab76a7d14010f90b9e94d7b6423a0ab14500645c69cae0f158d75a475c2d75e40351bc0adda803cf2e34c65cfcb59d3599c1565c8f422bd1e6b0571d2b2ae74807240a00f37b9d1607259018dbd474ac8b9d2ee60c90a1d7d56bd1ee7496527e5acb96c5d0f4ab53680f3d72c8c3e5c63ad41233ab64722bb7bad3219bfd644377f78706b1ae3c3e54930499ff65b8fd6ad4d75031e397b1eb53372067f43492d8cf6e7f788cbef8aad296357702490e01383516fdbc90d51132f66fc299e700d875e681d89da40dd4734d2c63e40e6a2ca39caf514a727395cd0048f26f4c9007b7bd42e015ebf31a649d304f1e950b4840345877242d8e0f2b9eb4d7727953c540cce739fbbd735179847ad1626e4b21dc3b1355db9e29c412de8719a3771d2988800f9b148d95e86964520657ad30b9da0d004d0dcbc2dbb27eb5d05b788196255dfcd736395e9518254e32714ac07a1d86b6859433727af35b125dc135bb22953bba83c8af274b99633f2b1abb06b1710ba92c702803d0e2b19f00943343d87f12fd2a6bcd3ed2e2d410e1881d3b8ae4ed7c5aca832c4e38eb5a10eb715f4bbd9c44fd378ea7ebeb54a5626c616ada2acaecbc91dbd8570d75a579374db59a35ce0715ed967a61b984cb7406c6fb92a0ebf515cb6a7a14a2e246091489db70033ff00d7a7a316c79bc133432957c120f073d6ba3f0eea5369da8c57fa649b268db73c2c701fdaaa6a5a508141687c8627f8bbd65146b59416cfa865352e3d0699f587863c4706b5a7c775092b9e1e33d51bb835d5472065af9234bf136a36303adbdec90b3ae04b13e0e7debd5be1c7c4092775d1f58924fb637314d236449ed93584a162d6a7b2e696aac13890715645400b451450014514500145145001451450014514500145145001451450014514500145145001499a5a4a005a28a2800a4ef4b49de80168a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a004c535a307b53e8a00a72d9ab0e82b3ae34a56cfcb5bb8a42a0d0071973a391d17f4aca9f4c65cfcb5e86f02b0e954a6d3d5c741401e752d9b7465047a1159771a2db4b93e59463dd78af47b8d1c1e8b59571a411d169a7603ce2e3c3f229cc4cae076e86b2ae2c2581be78597ea2bd266d35949f96a9cb6670415047a62a9546173cd64b7e72a307d05330ea3a9fa577771a3db499cc5b49eebc565dc7870e49865047a38feb56a6ba8ee72cd21ee0115033a1c819adcb8d16e612774248f54e6b2a6b4c3104104763557114cb93c64d358a807ae6a6f2b69c1041a3ca463c9e69dc0ac5b0fb8e694326eddd7f1a99a1c0f51519841e071548562196450c49618351019e472b5318635c1258906a127e6f9783e9458448630a3d4542ea4918e3de9d1bb293b8939a903a63da9d82e46aa31f30e69181e450fb37860401ee68695030e320fa52b05c80a1539526a449248cab02411cf069eec1864545bdbcb231d3bd1603a6b0f195ec0ab0bb02bd3d0d6847786f1dbee82dc947c7e95c1acacae588e3e95652fd838727a7a50ac82c7a347e1f5bc859832ed23fd549c63f3ae4f54f0e24570d16082474f4aaf0789eee3210cbba3eca6b6ac353b6d4ff00e3ef2f81b7683871f4a7cc2b1c35f69135992f11e57ab03fcc558d275a96ce58fed3187891b7291d54faa9ea0d7a92e85a7ea36452dca5cc5d36b7c9229af3fd6fc2f259ddb9b794c6cadd24e0526ae07b97867c6fa55e6991dc3df2284405da52063d49aecf4cd6ac755b7f3ac6ea2b88c1c168db22be405b8bad226f997113f0db7e646f5af56f865e29b5b790592dcc51c320e2370010ddb0de9ec6b19d3b6a8a4cf790d9e94eacfb4ba1201cd5f041e9590c5a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a4a5a4a005a28a2800a4ef4b49400b451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001486968a00614523a54325aab76ab34500654da6ab67e5ace9f4807385ae969a501ed401c54fa3919c2d67cba5b293f2d7a035b2b76155e4b0561d2803cedec9d7b1aa771a7c730c4d023ffbcb9af4297494607e5aa1368c0f4145c0f37b8f0dd9c99d8ad131ee0e47e46b9fbfd066b3059d4bc5ff003d1074fa8af589f48233c565cf62c99e2a94da19e611f87afe74df000ea790770e6a19740d562277c783e84e335df4d64607f3200460e5901c67e941d421e93670071b864e6b452b9495f63ce24d33508f992d1c8f5033541a131b0f354a73dc115e9134f0a47be391e1539248e87fc2a4b7b75bbb725a649e36c8198c1aa6ec4d8f3810230f91d4fe348f6efb72057787c2b68d399379553fc010555bdf0744ea5ad2e1e39073b64e54ff00850aa2158e0a4b49187cc848f6a6259b2c80107f1aedecbc2570d29fb5948d07743b89fa543a8f84af61064b4984e807ddda030ff1a7ed10ac7232ac83ee8c63d05376bb0ced38ad7b4d3e7b894c5b6769338da571cd68dd785b538612d044b210338df927f0aa7342b1cc840376f07f2a8cc4b271c8fc2ad1bb786468a7b56de0e08e841fa1a9e2cce47956f2b63b08c9a3461666449015fe98a8c3dcdbe4a31dbd883deb5dbca321493e461d41e314e6b40ebf2153ee28b7602bd8f8aaead250ccc4ede8c0e08fc6bb1d33c51a7eae8b06a24961d1d4e187f8d71736948e324104fa77acd9f4b9a07df1391ed4ad241a1ea379e11b0d4577dbca8636efb7afe03fa579ede6857fa5dc348b0c8aaafc143c81daa2b1f136a9a4305906f8c1cf2726bb3b0f1fe9da944b6f7f6f1f4c0f34648fa375a39bb8587f867e27eaba5426cee184d85c46d329ca1ed9f515eafe0bf1f26bb0882fbca82f893b55721641fec9fe9d6bc8b52d0349d5a2696cae4c32f5519ae7cdfdff00852fa35593782410c41dad8f5ff1a99534f54099f5c47287ef9a945791f84fe2c69fa85a04bd478ae907217e60e3d457a7d96a10de5ba4d13878dc655877ac1a6b728bb452039a5a401451450014514500145264535e45452588000c927b5003e933ef5c9eadf10b41d2f728b93752838d96c37f3f5e95c16aff00177539830d36ce1b54e81a53bdff00c07eb4ecc2c7b41703bd53bad5f4fb2cfdaaf6de1c76925553f966be69d4bc6be20d41b171aa5d3eefe0472aa7f0155b4bd0754f10c9be30162070d24a4e0557281f43cde3ef0cc2fb4eaf03b7a4796fe428b4f1d6897d308adae25918f4c40ffe15e6da2f8374cd39775e1fb5cfebcaaafd05761697096ca12da14897d1171501a1dca5c2ba823bd4b915cfd8dcbb919adb8c9280e68026a28a2800a28a4ef400b4514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014628a28010a834c3129a928a00ab25a2b76accbbd2d594fcb5bb4d640c39a00e06fb4c284f15ccea5a589b257e493d7d7eb5ea97764b229e2b99d434c20921681a763cc67d3eea23b4160cdd08391563c322e22bab8b39a2299fde01b7183dff3f6aea26b6689f76de47a8a96195080be4aabf4ce07f9154e5756636ee8961b02e381523696c3f84d6e69712ba8e056dfd85197a0a924e0ff00b39b3d0d31f4f603a5779fd9a9fdd151c9a5a11f7450079f9b360c485193df14a2cdbd0d766da3aeefbb4efec850bf76803cfae748b6b870f3dac7230fe265e69f1da08976c51845f4518aece6d1f9e05463463e945c0f37d77c2967ad624937c3700604b1f53ec477acab3f015b40e1a6bc9e400e76a7ca2bd5a7d1c81f76a91d25b3f769f3303ceb51f08e2da47d3e67f340cac7260863e99ae2526bc690c5358b97071850739fa57bb4ba6328cedacf6b05494b88d439fe20bcfe756aa34163c927d02e1ad849358cc88c33965e4564cba3c257030476f515ee3f676c1e0d727acf81ed6f6e1ae6d5becf339cb01f749f5f6aa556fba158f328def6c01489d9a3f46ad4d3f5282f316baab9f28f0378ce3f1aec20f01c290b2cb7d2bb91c7ca303f3e6b9dd7bc2f3e95109a4512c25b1e6460fcbf51daa94a2c450baf0f1b4669f4ab912c5d546ec95fc6baff00077c4cbcd0192cb5584cb6c4f2e3875f71eb5c0c33dc5a4bfb99895eebff00d6abad796d7f181731ec6e9bd450d0cfa7748f1768fa9c51b5bdfc27cc385566dad9f4c1ef5d0a48a475af8f54cf68098e4f32df3c10dd2bd57c0df14e3b5b48f4fd6e591953e58ee4f240f46eff008d66e1d867b8e68ac4b2f13e917b6fe7c1a95ac9181cb09471f5cd65dffc48f0cd8ef1fda4b70ebd52dd4b9fcfa7eb5166075c48155eeefadeca069ae668e189792f230503f135e33af7c7545568f48b2dac78125c727fef91c579a6a3e26d6bc4775e6df5ecb39072149f913e80714d41b03db3c41f17b4db3dd169119bd9b9c4ad958c1fe67f41ef5e75a878a75bf12485afaf18419ff529f2c607d3bfe3fad7356f1a2aee949672781d7fcff4f6ab71dc85937be36e3a6718fa7bfd39ab51486687efd976200800e49e38ff003f4ac2bf908b84b6815ae2773848e2e7fcfe9534dacc9793a58d9c40c9236d541c96fc2bbaf0e78621d1d0cad89af64fbf291d3fd95f41fce93761b665e81e0df2c2dceae16498f22dd0fc8bfef1ee7dabb78613b552350a80602af000ab56b60d211c66b7ecf49e84ad45c931a0b091c8e0d6b5b692c71915bd069e8807cb5752055ec29019d6b63e5015a68b85c538281d052d002d14514005277a5a4ef400b45145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500232e6aa5c5aac83a55ca4233401cb5e695bb385acb1a5b2c9d3bd772f0ab0e9501b25ce7028032f4cb668c0c8ade4185a8e384254d8c500148452d1400dd83346d14ea280233103da93c95f4a968a00aef6caddaa2fb0a7a55da2803327d3d5874acb934705ba574d8cd34c6a7b500730da30dbd2b36e74960785aee0c4b8e9503da2376a00e00e98c3f84d569ec0852ac9907a822bd08e9e8474154ae34a56ce16803cda4d16c9ce5ec6dd8fa9897fc2b0358f03d8de44cf6605acfd463250fd476fc2bd565d1bae05519f49651f769a6d6c07845cf83b5fb247963883853d227049fc2b00dcb47315950a3a9c11b71f98afa126b175ed5c778bbc269aada3dcdbc4a2fe31b978ff5b8fe13fe356a7dc563c9eea6c26f8246527a853c1aa70ea5246fc332f63cd5e8a2b49c624578e4cf6e7ea2a2974d84b868275707b6391f9d68022db876670fb87715605e1b685630a00078c77aacf6d25a1dafc6795e78ff00eb5318a48305be6e8051604cb675a6c6ddc33d335525d4a49412cec48ecbc55094b21da5b0076c575df0fbc37fdb3ab0bbb9426d2d487208e1dbb0feb50dd8a3b4f01785ff00b3acd751bb8c0bd9d72a08ff005487b7d4f7af48b0b02e47150d85a1918715d869d621141c564ddc4163a684038ad78e054038a7a20418029f40098c52d145001494b49400b4514500149de9693bd002d14514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400534a034ea2802230a9ed50cb66addaadd14018771a5a3670b5cf6a1a77979e38aeeca8239acad42d4321e2803e66f1a6930e99e297fdc8f2eec79e98e307f880fc79fc6a969f2da85c98086232bc641aeefe2de9c574bb5d463525ed27e48feeb0c1fd715e776cf110b2a1daa465bf2ae883ba034eead2ce3b16bb9a2dce7ee28e83dcfad71da9c69912c636e7a85e95b97d716d2854c49c707078ae7669d423a163c120023b55499362a5bc135d4ab1c619998e001ce4d7d0be0dd10e93a15adaba6d9b1ba41fed1ffeb60579c7c31f0fb5ddfbeab30fdcc076c63fbcfd7f41fcebdcf4cb5dce38ae79146ce9565c024574b0c41140aab6306c41c5680e952014514500145145001494b49400b4514500145149de80168a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a002abdd26e435629922e54d0079978ff4cfb7786753b703e730332ffbcbc8fe55f37595c10006cf23bd7d6dad401958119073c57ca1a8d99d375abdb429fea666400fa0271fa55c06864b3050581c6056560cb3e00c963c0ab920dd91d31c56878374efed1f17d84046511fcd7fa2f3fe154f60b9edbe14d18697a2d9d9e3e64405cfab1e4d7a1e956785071587a55bef71915da594216315908b51a6d5c54948296800a28a2800a28a2800a28a4a005a28a2800a4ef4b49de80168a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00291ba52d140185ab4598db8af9b3e2769df61f16b5c28c2dd461fdb23e53fe7debe9fd423dd19af10f8bfa519b4982f517e7b69707fdd6ff00eb814e3b81e36ea36939ea7d6bb5f84f6225d6efaec8c88a1118cfab1ffeb57142276e3a7d7fcfb57a77c2184fd9f517200cca8063e956c0f68d1e0e848aeaa21851f4ac3d223c2035bea302b30168a28a0028a28a0028a28a00292969280168a28a00293bd2d277a005a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2800a28a2802bdca6e435c078bf4a5d4b4abcb365cf9b1b01f5edfad7a24832a6b99d6631b49ef401f25bc862621576b82548f7ff39af4df840c1edb524c636ccbc7fc06b87f1b5a4761e2cd4e187840e2403d0b00c7f526bb0f83ee7eddaac5fc3fba6fc7e6156f5407bfe963f76b5b03a0ac8d2cfeed7e95ae3a0a80168a28a0028a28a0028a28a002929692803fffd9, 4, 'Rapida'),
(3, 'caviar', 123, '2', 'Uma delisiosa', '', 1, 'Bebidas'),
(4, 'pizza', 120, '1', 'pizza', NULL, 1, 'Rapida'),
(6, 'Sopa du macaco', 100, '5', 'Uma delisia', NULL, 1, 'Sopas'),
(9, 'Sprite', 14, '1', 'Sprite 500ml', NULL, 1, 'Bebidas');

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
(1, '0.5000', 1, 3),
(4, '10.0000', 1, 6),
(5, '0.0100', 2, 6);

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
  `login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`username`, `password`, `nombre`, `apellido_p`, `apellido_m`, `telefono`, `direccion`, `tipo`, `codigo`, `tarjeta`, `login`) VALUES
('admin', 'Ù€‡€­£0Å\0µ\'¶ôo6', 'Uma delisia', '', '', 0, '', 'administrador', 2893, NULL, '0000-00-00 00:00:00'),
('Admin100', 'ª\\èkŠÉ+E¨ƒ h4“', 'Ivan', 'Lopez', 'Murillo', 331472010, 'Admin100', 'admin', 2994, 10999, '2019-05-05 20:44:59'),
('Admin123', 'úÃ§´#qk,eƒ}r¾hX', 'Luis', '', '', 3323857013, '', 'administrador', 936, NULL, NULL),
('chef1', ']\r^pÜÎÆ^Ç²v˜@v', 'Chef', '', '', 0, '', 'empleado', 9425, 26976, '0000-00-00 00:00:00'),
('chef2', 'ªñÿÌþyÆþEŸ‹£Ñ', 'Chef 2', '', '', 0, '', 'empleado', 2056, NULL, '2019-05-05 22:21:43'),
('DAADSDA', 'øÙ¿¸ö}€ÿb‚ 3µ}', '', '', '', 0, '', 'administrador', 1872, NULL, '0000-00-00 00:00:00'),
('IVX', 'œw·{bÝþiWƒ·®P@M', ' ', NULL, NULL, NULL, NULL, 'administrador', 3423, NULL, '0000-00-00 00:00:00');

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
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `ayuda`
--
ALTER TABLE `ayuda`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `chefs`
--
ALTER TABLE `chefs`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cocina`
--
ALTER TABLE `cocina`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de la tabla `mensajes_ayuda`
--
ALTER TABLE `mensajes_ayuda`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `clave` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `platillo`
--
ALTER TABLE `platillo`
  MODIFY `clave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
CREATE DEFINER=`root`@`localhost` EVENT `borrar_login` ON SCHEDULE EVERY 10 MINUTE STARTS '2019-05-05 00:00:00' ON COMPLETION PRESERVE DISABLE DO DELETE FROM login_automatico WHERE 




(SELECT TIMESTAMPDIFF(SECOND,login_automatico.hora,NOW())) > 600$$

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
