-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-04-2015 a las 15:33:01
-- Versión del servidor: 5.6.17-log
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `ajustes_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes_ajusteasignatura`
--

CREATE TABLE IF NOT EXISTS `ajustes_ajusteasignatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `ajusteEstudianteId_id` int(11) NOT NULL,
  `asignaturaCohorteId_id` int(11) NOT NULL,
  `situacionId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ajustes_ajusteasignatura_ajusteEstudianteId_id_1c3f1e5d_uniq` (`ajusteEstudianteId_id`,`asignaturaCohorteId_id`),
  KEY `ajustes_ajusteasignatura_42280ecc` (`ajusteEstudianteId_id`),
  KEY `ajustes_ajusteasignatura_42f3272d` (`asignaturaCohorteId_id`),
  KEY `ajustes_ajusteasignatura_4ca6395a` (`situacionId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Volcado de datos para la tabla `ajustes_ajusteasignatura`
--

INSERT INTO `ajustes_ajusteasignatura` (`id`, `activo`, `ajusteEstudianteId_id`, `asignaturaCohorteId_id`, `situacionId_id`) VALUES
(1, 1, 1, 1, 2),
(2, 1, 1, 2, 2),
(3, 1, 1, 3, 2),
(4, 1, 1, 4, 2),
(5, 1, 1, 5, 2),
(6, 1, 1, 6, 2),
(7, 1, 1, 7, 2),
(8, 1, 1, 8, 2),
(9, 1, 1, 10, 2),
(10, 1, 1, 11, 2),
(11, 1, 1, 12, 2),
(12, 1, 1, 13, 2),
(13, 1, 1, 14, 2),
(14, 1, 1, 15, 3),
(15, 1, 1, 16, 1),
(16, 1, 1, 17, 2),
(17, 1, 1, 18, 2),
(18, 1, 1, 19, 2),
(19, 1, 1, 20, 2),
(20, 1, 1, 21, 2),
(21, 1, 1, 22, 2),
(22, 1, 1, 23, 2),
(23, 1, 1, 25, 2),
(24, 1, 1, 24, 2),
(25, 1, 1, 26, 2),
(26, 1, 1, 27, 2),
(27, 1, 1, 28, 2),
(28, 1, 1, 29, 2),
(29, 1, 1, 30, 2),
(30, 1, 1, 31, 2),
(31, 1, 1, 32, 2),
(32, 1, 1, 33, 3),
(33, 1, 1, 34, 2),
(34, 1, 1, 35, 2),
(35, 1, 1, 36, 1),
(36, 1, 1, 37, 2),
(37, 1, 1, 40, 2),
(38, 1, 1, 41, 2),
(39, 1, 1, 42, 2),
(40, 1, 1, 43, 2),
(41, 1, 1, 44, 2),
(42, 1, 1, 38, 2),
(43, 1, 1, 39, 3),
(44, 1, 1, 46, 2),
(45, 1, 1, 45, 2),
(46, 1, 1, 47, 1),
(47, 1, 1, 48, 1),
(48, 1, 1, 52, 1),
(49, 1, 1, 9, 1),
(50, 1, 1, 49, 1),
(51, 1, 1, 50, 1),
(52, 1, 1, 53, 1),
(53, 1, 1, 54, 1),
(54, 1, 1, 55, 1),
(55, 1, 1, 62, 1),
(56, 1, 1, 56, 1),
(57, 1, 1, 51, 1),
(58, 1, 1, 58, 1),
(59, 1, 1, 59, 1),
(60, 1, 1, 60, 1),
(61, 1, 1, 61, 1),
(62, 1, 1, 63, 1),
(63, 1, 1, 64, 1),
(64, 1, 1, 65, 1),
(65, 1, 1, 57, 1),
(66, 1, 1, 66, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes_ajusteasignaturaconvalidada`
--

CREATE TABLE IF NOT EXISTS `ajustes_ajusteasignaturaconvalidada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `ajusteAsignaturaId_id` int(11) NOT NULL,
  `asignaturaVencidaId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ajustes_ajusteasignaturaconv_ajusteAsignaturaId_id_7d95e2a5_uniq` (`ajusteAsignaturaId_id`,`asignaturaVencidaId_id`),
  KEY `ajustes_ajusteasignaturaconvalidada_c0ca05ca` (`ajusteAsignaturaId_id`),
  KEY `ajustes_ajusteasignaturaconvalidada_1d260ae0` (`asignaturaVencidaId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `ajustes_ajusteasignaturaconvalidada`
--

INSERT INTO `ajustes_ajusteasignaturaconvalidada` (`id`, `activo`, `ajusteAsignaturaId_id`, `asignaturaVencidaId_id`) VALUES
(1, 1, 14, 1),
(2, 1, 32, 2),
(3, 1, 43, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes_ajusteestudiante`
--

CREATE TABLE IF NOT EXISTS `ajustes_ajusteestudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `anhoSemestreAjustadoId_id` int(11) DEFAULT NULL,
  `carreraEstudianteId_id` int(11) NOT NULL,
  `cohortePropuestoId_id` int(11) NOT NULL,
  `cursoAjusteId_id` int(11) NOT NULL,
  `documentacionAnalizadaId_id` int(11) NOT NULL,
  `motivoAjusteId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ajustes_ajusteestudiante_carreraEstudianteId_id_35502b49_uniq` (`carreraEstudianteId_id`,`cursoAjusteId_id`,`cohortePropuestoId_id`),
  KEY `ajustes_ajusteestudiante_770e6e84` (`anhoSemestreAjustadoId_id`),
  KEY `ajustes_ajusteestudiante_c3de748f` (`carreraEstudianteId_id`),
  KEY `ajustes_ajusteestudiante_d2670dc2` (`cohortePropuestoId_id`),
  KEY `ajustes_ajusteestudiante_2ade3edd` (`cursoAjusteId_id`),
  KEY `ajustes_ajusteestudiante_0a663a84` (`documentacionAnalizadaId_id`),
  KEY `ajustes_ajusteestudiante_a3f5b7c0` (`motivoAjusteId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ajustes_ajusteestudiante`
--

INSERT INTO `ajustes_ajusteestudiante` (`id`, `activo`, `anhoSemestreAjustadoId_id`, `carreraEstudianteId_id`, `cohortePropuestoId_id`, `cursoAjusteId_id`, `documentacionAnalizadaId_id`, `motivoAjusteId_id`) VALUES
(1, 1, 7, 1, 1, 4, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes_aprobaciondeajuste`
--

CREATE TABLE IF NOT EXISTS `ajustes_aprobaciondeajuste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `comentarios` varchar(300) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `ajusteEstudianteId_id` int(11) DEFAULT NULL,
  `carreraEstId_id` int(11) NOT NULL,
  `estadoId_id` int(11) NOT NULL,
  `trabajadorId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ajustes_aprobaciondeajuste_trabajadorId_id_25121602_uniq` (`trabajadorId_id`,`carreraEstId_id`,`estadoId_id`,`fecha`),
  UNIQUE KEY `ajustes_aprobaciondeajuste_trabajadorId_id_2536cdda_uniq` (`trabajadorId_id`,`carreraEstId_id`,`ajusteEstudianteId_id`,`estadoId_id`),
  KEY `ajustes_aprobaciondeajuste_42280ecc` (`ajusteEstudianteId_id`),
  KEY `ajustes_aprobaciondeajuste_3cab6cf0` (`carreraEstId_id`),
  KEY `ajustes_aprobaciondeajuste_0bc7ae99` (`estadoId_id`),
  KEY `ajustes_aprobaciondeajuste_75c98923` (`trabajadorId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ajustes_aprobaciondeajuste`
--

INSERT INTO `ajustes_aprobaciondeajuste` (`id`, `fecha`, `comentarios`, `activo`, `ajusteEstudianteId_id`, `carreraEstId_id`, `estadoId_id`, `trabajadorId_id`) VALUES
(1, '2015-03-23 03:34:06', '', 1, 1, 1, 11, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes_documentacionanalizada`
--

CREATE TABLE IF NOT EXISTS `ajustes_documentacionanalizada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `ajustes_documentacionanalizada_nombre_60498a39_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `ajustes_documentacionanalizada`
--

INSERT INTO `ajustes_documentacionanalizada` (`id`, `nombre`, `activo`) VALUES
(1, 'Expediente académico', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes_estadoajuste`
--

CREATE TABLE IF NOT EXISTS `ajustes_estadoajuste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `ajustes_estadoajuste_nombre_28756de9_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `ajustes_estadoajuste`
--

INSERT INTO `ajustes_estadoajuste` (`id`, `nombre`, `activo`) VALUES
(3, 'Aprobado por el coordinador el expediente', 1),
(8, 'Aprobado por el decano la propuesta de ajuste del coordinador', 1),
(5, 'Conformada la propuesta de ajuste', 1),
(1, 'Conformado el expediente estudiantil', 1),
(4, 'Devuelto por el coordinador el expediente', 1),
(9, 'Devuelto por el decano la propuesta de ajuste del coordinador', 1),
(11, 'Entregado a estudiante su ajuste a plan', 1),
(10, 'Enviada al coordinador devolución de ajuste por parte del decano', 1),
(7, 'Enviada al decano la propuesta de ajuste', 1),
(2, 'Enviado a coordinador de carrera el expediente', 1),
(6, 'Enviado a la secretaria la propuesta de ajuste', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes_motivoajuste`
--

CREATE TABLE IF NOT EXISTS `ajustes_motivoajuste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `ajustes_motivoajuste_nombre_6d2beb37_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `ajustes_motivoajuste`
--

INSERT INTO `ajustes_motivoajuste` (`id`, `nombre`, `activo`) VALUES
(2, 'Baja', 1),
(3, 'Licencia de maternidad', 1),
(1, 'Traslado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes_situacion`
--

CREATE TABLE IF NOT EXISTS `ajustes_situacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `ajustes_situacion_nombre_3d8fd506_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `ajustes_situacion`
--

INSERT INTO `ajustes_situacion` (`id`, `nombre`, `activo`) VALUES
(2, 'Abonada', 1),
(3, 'Convalidada', 1),
(1, 'Pendiente', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Administrador del sistema'),
(2, 'Coordinador de Carrera'),
(3, 'Decano'),
(4, 'Secretaria docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1570 ;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1021, 1, 1),
(1022, 1, 2),
(1023, 1, 3),
(1024, 1, 4),
(1025, 1, 5),
(1026, 1, 6),
(1027, 1, 7),
(1028, 1, 8),
(1029, 1, 9),
(1030, 1, 10),
(1031, 1, 11),
(1032, 1, 12),
(1033, 1, 13),
(1034, 1, 14),
(1035, 1, 15),
(1036, 1, 16),
(1037, 1, 17),
(1038, 1, 18),
(1039, 1, 19),
(1040, 1, 20),
(1041, 1, 21),
(1042, 1, 22),
(1043, 1, 23),
(1044, 1, 24),
(1045, 1, 25),
(1046, 1, 26),
(1047, 1, 27),
(1048, 1, 28),
(1049, 1, 29),
(1050, 1, 30),
(1051, 1, 31),
(1052, 1, 32),
(1053, 1, 33),
(1054, 1, 34),
(1055, 1, 35),
(1056, 1, 36),
(1057, 1, 37),
(1058, 1, 38),
(1059, 1, 39),
(1060, 1, 40),
(1061, 1, 41),
(1062, 1, 42),
(1063, 1, 43),
(1064, 1, 44),
(1065, 1, 45),
(1066, 1, 46),
(1067, 1, 47),
(1068, 1, 48),
(1069, 1, 49),
(1070, 1, 50),
(1071, 1, 51),
(1072, 1, 52),
(1073, 1, 53),
(1074, 1, 54),
(1075, 1, 55),
(1076, 1, 56),
(1077, 1, 57),
(1078, 1, 58),
(1079, 1, 59),
(1080, 1, 60),
(1081, 1, 61),
(1082, 1, 62),
(1083, 1, 63),
(1084, 1, 64),
(1085, 1, 65),
(1086, 1, 66),
(1087, 1, 67),
(1088, 1, 68),
(1089, 1, 69),
(1090, 1, 70),
(1091, 1, 71),
(1092, 1, 72),
(1093, 1, 73),
(1094, 1, 74),
(1095, 1, 75),
(1096, 1, 76),
(1097, 1, 77),
(1098, 1, 78),
(1099, 1, 79),
(1100, 1, 80),
(1101, 1, 81),
(1102, 1, 82),
(1103, 1, 83),
(1104, 1, 84),
(1105, 1, 85),
(1106, 1, 86),
(1107, 1, 87),
(1108, 1, 88),
(1109, 1, 89),
(1110, 1, 90),
(1111, 1, 91),
(1112, 1, 92),
(1113, 1, 93),
(1114, 1, 94),
(1115, 1, 95),
(1116, 1, 96),
(1117, 1, 97),
(1118, 1, 98),
(1119, 1, 99),
(1120, 1, 100),
(1121, 1, 101),
(1122, 1, 102),
(1123, 1, 103),
(1124, 1, 104),
(1125, 1, 105),
(1126, 1, 106),
(1127, 1, 107),
(1128, 1, 108),
(1129, 1, 109),
(1130, 1, 110),
(1131, 1, 111),
(1132, 1, 112),
(1133, 1, 113),
(1134, 1, 114),
(1135, 1, 115),
(1136, 1, 116),
(1137, 1, 117),
(1138, 1, 118),
(1139, 1, 119),
(1140, 1, 120),
(1141, 1, 121),
(1142, 1, 122),
(1143, 1, 123),
(1144, 1, 124),
(1145, 1, 125),
(1146, 1, 126),
(1147, 1, 127),
(1148, 1, 128),
(1149, 1, 129),
(1150, 1, 130),
(1151, 1, 131),
(1152, 1, 132),
(1153, 1, 133),
(1154, 1, 134),
(1155, 1, 135),
(1156, 1, 136),
(1157, 1, 137),
(1158, 1, 138),
(1159, 1, 139),
(1160, 1, 140),
(1161, 1, 141),
(1162, 1, 142),
(1163, 1, 143),
(1164, 1, 144),
(1165, 1, 145),
(1166, 1, 146),
(1167, 1, 147),
(1168, 1, 148),
(1169, 1, 149),
(1170, 1, 150),
(1171, 1, 151),
(1172, 1, 152),
(1173, 1, 153),
(1174, 1, 154),
(1175, 1, 155),
(1176, 1, 156),
(1177, 1, 157),
(1178, 1, 158),
(1179, 1, 159),
(1180, 1, 160),
(1181, 1, 161),
(1182, 1, 162),
(1183, 1, 163),
(1184, 1, 164),
(1185, 1, 165),
(1186, 1, 166),
(1187, 1, 167),
(1188, 1, 168),
(1189, 1, 169),
(1190, 1, 170),
(1191, 1, 171),
(1192, 1, 172),
(1193, 1, 173),
(1194, 1, 174),
(1195, 1, 175),
(1196, 1, 176),
(1197, 1, 177),
(1198, 1, 178),
(1199, 1, 179),
(1200, 1, 180),
(1201, 1, 181),
(1202, 1, 182),
(1529, 2, 1),
(1530, 2, 2),
(1531, 2, 3),
(1532, 2, 13),
(1533, 2, 14),
(1534, 2, 15),
(1535, 2, 16),
(1536, 2, 17),
(1537, 2, 18),
(1538, 2, 19),
(1539, 2, 20),
(1540, 2, 21),
(1541, 2, 22),
(1542, 2, 23),
(1543, 2, 24),
(1544, 2, 25),
(1545, 2, 26),
(1546, 2, 27),
(1547, 2, 28),
(1548, 2, 29),
(1549, 2, 30),
(1550, 2, 31),
(1551, 2, 32),
(1552, 2, 33),
(1553, 2, 37),
(1554, 2, 38),
(1555, 2, 39),
(1556, 2, 40),
(1557, 2, 41),
(1559, 2, 43),
(1560, 2, 44),
(1561, 2, 45),
(1562, 2, 46),
(1563, 2, 47),
(1564, 2, 48),
(1565, 2, 49),
(1566, 2, 50),
(1567, 2, 51),
(1568, 2, 54),
(1569, 2, 118),
(1558, 2, 170),
(824, 3, 1),
(825, 3, 2),
(826, 3, 3),
(827, 3, 13),
(828, 3, 14),
(829, 3, 15),
(830, 3, 16),
(831, 3, 17),
(832, 3, 18),
(833, 3, 19),
(834, 3, 20),
(835, 3, 21),
(836, 3, 42),
(837, 3, 51),
(838, 3, 52),
(839, 3, 53),
(840, 3, 54),
(1385, 4, 1),
(1386, 4, 2),
(1387, 4, 3),
(1388, 4, 13),
(1389, 4, 14),
(1390, 4, 15),
(1391, 4, 16),
(1392, 4, 17),
(1393, 4, 18),
(1394, 4, 19),
(1395, 4, 20),
(1396, 4, 21),
(1397, 4, 41),
(1398, 4, 51),
(1399, 4, 52),
(1400, 4, 54),
(1401, 4, 55),
(1402, 4, 56),
(1403, 4, 57),
(1404, 4, 58),
(1405, 4, 59),
(1406, 4, 60),
(1407, 4, 61),
(1408, 4, 62),
(1409, 4, 63),
(1410, 4, 64),
(1411, 4, 65),
(1412, 4, 66),
(1413, 4, 67),
(1414, 4, 68),
(1415, 4, 69),
(1416, 4, 70),
(1417, 4, 71),
(1418, 4, 72),
(1419, 4, 73),
(1420, 4, 74),
(1421, 4, 75),
(1422, 4, 76),
(1423, 4, 77),
(1424, 4, 78),
(1425, 4, 79),
(1426, 4, 80),
(1427, 4, 81),
(1428, 4, 82),
(1429, 4, 83),
(1430, 4, 84),
(1431, 4, 85),
(1432, 4, 86),
(1433, 4, 87),
(1434, 4, 88),
(1435, 4, 89),
(1436, 4, 90),
(1437, 4, 91),
(1438, 4, 92),
(1439, 4, 93),
(1440, 4, 94),
(1441, 4, 95),
(1442, 4, 96),
(1443, 4, 97),
(1444, 4, 98),
(1445, 4, 99),
(1446, 4, 100),
(1447, 4, 101),
(1448, 4, 102),
(1449, 4, 103),
(1450, 4, 104),
(1451, 4, 105),
(1452, 4, 106),
(1453, 4, 107),
(1454, 4, 108),
(1455, 4, 109),
(1456, 4, 110),
(1457, 4, 111),
(1458, 4, 112),
(1459, 4, 113),
(1460, 4, 114),
(1461, 4, 115),
(1462, 4, 116),
(1463, 4, 117),
(1464, 4, 118),
(1465, 4, 119),
(1466, 4, 120),
(1467, 4, 121),
(1468, 4, 122),
(1469, 4, 123),
(1470, 4, 124),
(1471, 4, 125),
(1472, 4, 126),
(1473, 4, 127),
(1474, 4, 128),
(1475, 4, 129),
(1476, 4, 130),
(1477, 4, 131),
(1478, 4, 132),
(1479, 4, 133),
(1480, 4, 134),
(1481, 4, 135),
(1482, 4, 136),
(1483, 4, 137),
(1484, 4, 138),
(1485, 4, 139),
(1486, 4, 140),
(1487, 4, 141),
(1488, 4, 142),
(1489, 4, 143),
(1490, 4, 144),
(1491, 4, 145),
(1492, 4, 146),
(1493, 4, 147),
(1494, 4, 148),
(1495, 4, 149),
(1496, 4, 150),
(1497, 4, 151),
(1498, 4, 152),
(1499, 4, 153),
(1500, 4, 154),
(1501, 4, 155),
(1502, 4, 156),
(1503, 4, 157),
(1504, 4, 158),
(1505, 4, 159),
(1506, 4, 160),
(1507, 4, 161),
(1508, 4, 162),
(1509, 4, 163),
(1510, 4, 164),
(1511, 4, 165),
(1512, 4, 166),
(1513, 4, 167),
(1514, 4, 168),
(1515, 4, 169),
(1516, 4, 170),
(1517, 4, 171),
(1518, 4, 172),
(1519, 4, 173),
(1520, 4, 174),
(1521, 4, 175),
(1522, 4, 176),
(1523, 4, 177),
(1524, 4, 178),
(1525, 4, 179),
(1526, 4, 180),
(1527, 4, 181),
(1528, 4, 182);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=183 ;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add search entry', 7, 'add_searchentry'),
(20, 'Can change search entry', 7, 'change_searchentry'),
(21, 'Can delete search entry', 7, 'delete_searchentry'),
(22, 'Can add Motivo de ajuste', 8, 'add_motivoajuste'),
(23, 'Can change Motivo de ajuste', 8, 'change_motivoajuste'),
(24, 'Can delete Motivo de ajuste', 8, 'delete_motivoajuste'),
(25, 'Can view Motivo de ajuste', 8, 'view_motivoajuste'),
(26, 'Can add Documentación analizada', 9, 'add_documentacionanalizada'),
(27, 'Can change Documentación analizada', 9, 'change_documentacionanalizada'),
(28, 'Can delete Documentación analizada', 9, 'delete_documentacionanalizada'),
(29, 'Can view Documentación analizada', 9, 'view_documentacionanalizada'),
(30, 'Can add Situación de la asignatura', 10, 'add_situacion'),
(31, 'Can change Situación de la asignatura', 10, 'change_situacion'),
(32, 'Can delete Situación de la asignatura', 10, 'delete_situacion'),
(33, 'Can view Situación de la asignatura', 10, 'view_situacion'),
(34, 'Can add Estado de ajuste', 11, 'add_estadoajuste'),
(35, 'Can change Estado de ajuste', 11, 'change_estadoajuste'),
(36, 'Can delete Estado de ajuste', 11, 'delete_estadoajuste'),
(37, 'Can view Estado de ajuste', 11, 'view_estadoajuste'),
(38, 'Can add Estudiante - Motivo de ajuste', 12, 'add_ajusteestudiante'),
(39, 'Can change Estudiante - Motivo de ajuste', 12, 'change_ajusteestudiante'),
(40, 'Can delete Estudiante - Motivo de ajuste', 12, 'delete_ajusteestudiante'),
(41, 'Can view Estudiante - Motivo de ajuste', 12, 'view_ajusteestudiante'),
(42, 'Can approve Estudiante - Motivo de ajuste', 12, 'approve_ajusteestudiante'),
(43, 'Can add Ajuste de asignatura', 13, 'add_ajusteasignatura'),
(44, 'Can change Ajuste de asignatura', 13, 'change_ajusteasignatura'),
(45, 'Can delete Ajuste de asignatura', 13, 'delete_ajusteasignatura'),
(46, 'Can view Ajuste de asignatura', 13, 'view_ajusteasignatura'),
(47, 'Can add Ajuste de asignatura convalidada', 14, 'add_ajusteasignaturaconvalidada'),
(48, 'Can change Ajuste de asignatura convalidada', 14, 'change_ajusteasignaturaconvalidada'),
(49, 'Can delete Ajuste de asignatura convalidada', 14, 'delete_ajusteasignaturaconvalidada'),
(50, 'Can view Ajuste de asignatura convalidada', 14, 'view_ajusteasignaturaconvalidada'),
(51, 'Can add Aprobación de ajuste', 15, 'add_aprobaciondeajuste'),
(52, 'Can change Aprobación de ajuste', 15, 'change_aprobaciondeajuste'),
(53, 'Can delete Aprobación de ajuste', 15, 'delete_aprobaciondeajuste'),
(54, 'Can view Aprobación de ajuste', 15, 'view_aprobaciondeajuste'),
(55, 'Can add Universidad', 16, 'add_universidad'),
(56, 'Can change Universidad', 16, 'change_universidad'),
(57, 'Can delete Universidad', 16, 'delete_universidad'),
(58, 'Can view Universidad', 16, 'view_universidad'),
(59, 'Can add Facultad', 17, 'add_facultad'),
(60, 'Can change Facultad', 17, 'change_facultad'),
(61, 'Can delete Facultad', 17, 'delete_facultad'),
(62, 'Can view Facultad', 17, 'view_facultad'),
(63, 'Can add Carrera', 18, 'add_carrera'),
(64, 'Can change Carrera', 18, 'change_carrera'),
(65, 'Can delete Carrera', 18, 'delete_carrera'),
(66, 'Can view Carrera', 18, 'view_carrera'),
(67, 'Can add Tipo de curso', 19, 'add_tipodecurso'),
(68, 'Can change Tipo de curso', 19, 'change_tipodecurso'),
(69, 'Can delete Tipo de curso', 19, 'delete_tipodecurso'),
(70, 'Can view Tipo de curso', 19, 'view_tipodecurso'),
(71, 'Can add Tipo de curso en carrera', 20, 'add_carreratipodecurso'),
(72, 'Can change Tipo de curso en carrera', 20, 'change_carreratipodecurso'),
(73, 'Can delete Tipo de curso en carrera', 20, 'delete_carreratipodecurso'),
(74, 'Can view Tipo de curso en carrera', 20, 'view_carreratipodecurso'),
(75, 'Can add País', 21, 'add_pais'),
(76, 'Can change País', 21, 'change_pais'),
(77, 'Can delete País', 21, 'delete_pais'),
(78, 'Can view País', 21, 'view_pais'),
(79, 'Can add Provincia', 22, 'add_provincia'),
(80, 'Can change Provincia', 22, 'change_provincia'),
(81, 'Can delete Provincia', 22, 'delete_provincia'),
(82, 'Can view Provincia', 22, 'view_provincia'),
(83, 'Can add Municipio', 23, 'add_municipio'),
(84, 'Can change Municipio', 23, 'change_municipio'),
(85, 'Can delete Municipio', 23, 'delete_municipio'),
(86, 'Can view Municipio', 23, 'view_municipio'),
(87, 'Can add Ubicación', 24, 'add_ubicacion'),
(88, 'Can change Ubicación', 24, 'change_ubicacion'),
(89, 'Can delete Ubicación', 24, 'delete_ubicacion'),
(90, 'Can view Ubicación', 24, 'view_ubicacion'),
(91, 'Can add Nacionalidad', 25, 'add_nacionalidad'),
(92, 'Can change Nacionalidad', 25, 'change_nacionalidad'),
(93, 'Can delete Nacionalidad', 25, 'delete_nacionalidad'),
(94, 'Can view Nacionalidad', 25, 'view_nacionalidad'),
(95, 'Can add Sexo', 26, 'add_sexo'),
(96, 'Can change Sexo', 26, 'change_sexo'),
(97, 'Can delete Sexo', 26, 'delete_sexo'),
(98, 'Can view Sexo', 26, 'view_sexo'),
(99, 'Can add Etnia', 27, 'add_etnia'),
(100, 'Can change Etnia', 27, 'change_etnia'),
(101, 'Can delete Etnia', 27, 'delete_etnia'),
(102, 'Can view Etnia', 27, 'view_etnia'),
(103, 'Can add Grado científico', 28, 'add_gradocientifico'),
(104, 'Can change Grado científico', 28, 'change_gradocientifico'),
(105, 'Can delete Grado científico', 28, 'delete_gradocientifico'),
(106, 'Can view Grado científico', 28, 'view_gradocientifico'),
(107, 'Can add Departamento', 29, 'add_departamento'),
(108, 'Can change Departamento', 29, 'change_departamento'),
(109, 'Can delete Departamento', 29, 'delete_departamento'),
(110, 'Can view Departamento', 29, 'view_departamento'),
(111, 'Can add Categoría docente', 30, 'add_categoriadocente'),
(112, 'Can change Categoría docente', 30, 'change_categoriadocente'),
(113, 'Can delete Categoría docente', 30, 'delete_categoriadocente'),
(114, 'Can view Categoría docente', 30, 'view_categoriadocente'),
(115, 'Can add Estudiante', 31, 'add_estudiante'),
(116, 'Can change Estudiante', 31, 'change_estudiante'),
(117, 'Can delete Estudiante', 31, 'delete_estudiante'),
(118, 'Can view Estudiante', 31, 'view_estudiante'),
(119, 'Can add Trabajador', 32, 'add_trabajador'),
(120, 'Can change Trabajador', 32, 'change_trabajador'),
(121, 'Can delete Trabajador', 32, 'delete_trabajador'),
(122, 'Can view Trabajador', 32, 'view_trabajador'),
(123, 'Can add Curso', 33, 'add_curso'),
(124, 'Can change Curso', 33, 'change_curso'),
(125, 'Can delete Curso', 33, 'delete_curso'),
(126, 'Can view Curso', 33, 'view_curso'),
(127, 'Can add Anho', 34, 'add_anho'),
(128, 'Can change Anho', 34, 'change_anho'),
(129, 'Can delete Anho', 34, 'delete_anho'),
(130, 'Can view Anho', 34, 'view_anho'),
(131, 'Can add Semestre', 35, 'add_semestre'),
(132, 'Can change Semestre', 35, 'change_semestre'),
(133, 'Can delete Semestre', 35, 'delete_semestre'),
(134, 'Can view Semestre', 35, 'view_semestre'),
(135, 'Can add Semestre de un anho', 36, 'add_anhosemestre'),
(136, 'Can change Semestre de un anho', 36, 'change_anhosemestre'),
(137, 'Can delete Semestre de un anho', 36, 'delete_anhosemestre'),
(138, 'Can view Semestre de un anho', 36, 'view_anhosemestre'),
(139, 'Can add Plan de estudio', 37, 'add_planestudio'),
(140, 'Can change Plan de estudio', 37, 'change_planestudio'),
(141, 'Can delete Plan de estudio', 37, 'delete_planestudio'),
(142, 'Can view Plan de estudio', 37, 'view_planestudio'),
(143, 'Can add Asignatura', 38, 'add_asignatura'),
(144, 'Can change Asignatura', 38, 'change_asignatura'),
(145, 'Can delete Asignatura', 38, 'delete_asignatura'),
(146, 'Can view Asignatura', 38, 'view_asignatura'),
(147, 'Can add Tipo de asignatura', 39, 'add_tipoasignatura'),
(148, 'Can change Tipo de asignatura', 39, 'change_tipoasignatura'),
(149, 'Can delete Tipo de asignatura', 39, 'delete_tipoasignatura'),
(150, 'Can view Tipo de asignatura', 39, 'view_tipoasignatura'),
(151, 'Can add Disciplina', 40, 'add_disciplina'),
(152, 'Can change Disciplina', 40, 'change_disciplina'),
(153, 'Can delete Disciplina', 40, 'delete_disciplina'),
(154, 'Can view Disciplina', 40, 'view_disciplina'),
(155, 'Can add Currículo', 41, 'add_curriculo'),
(156, 'Can change Currículo', 41, 'change_curriculo'),
(157, 'Can delete Currículo', 41, 'delete_curriculo'),
(158, 'Can view Currículo', 41, 'view_curriculo'),
(159, 'Can add Tipo de evaluación', 42, 'add_tipoevaluacion'),
(160, 'Can change Tipo de evaluación', 42, 'change_tipoevaluacion'),
(161, 'Can delete Tipo de evaluación', 42, 'delete_tipoevaluacion'),
(162, 'Can view Tipo de evaluación', 42, 'view_tipoevaluacion'),
(163, 'Can add Cohorte', 43, 'add_cohorte'),
(164, 'Can change Cohorte', 43, 'change_cohorte'),
(165, 'Can delete Cohorte', 43, 'delete_cohorte'),
(166, 'Can view Cohorte', 43, 'view_cohorte'),
(167, 'Can add Carrera - Estudiante', 44, 'add_carreraestudiante'),
(168, 'Can change Carrera - Estudiante', 44, 'change_carreraestudiante'),
(169, 'Can delete Carrera - Estudiante', 44, 'delete_carreraestudiante'),
(170, 'Can view Carrera - Estudiante', 44, 'view_carreraestudiante'),
(171, 'Can add Asignatura de un cohorte', 45, 'add_asignaturacohorte'),
(172, 'Can change Asignatura de un cohorte', 45, 'change_asignaturacohorte'),
(173, 'Can delete Asignatura de un cohorte', 45, 'delete_asignaturacohorte'),
(174, 'Can view Asignatura de un cohorte', 45, 'view_asignaturacohorte'),
(175, 'Can add Asignatura vencida del estudiante', 46, 'add_asignaturavencida'),
(176, 'Can change Asignatura vencida del estudiante', 46, 'change_asignaturavencida'),
(177, 'Can delete Asignatura vencida del estudiante', 46, 'delete_asignaturavencida'),
(178, 'Can view Asignatura vencida del estudiante', 46, 'view_asignaturavencida'),
(179, 'Can add Asignatura optativa/electiva', 47, 'add_asignaturaoptativaelectiva'),
(180, 'Can change Asignatura optativa/electiva', 47, 'change_asignaturaoptativaelectiva'),
(181, 'Can delete Asignatura optativa/electiva', 47, 'delete_asignaturaoptativaelectiva'),
(182, 'Can view Asignatura optativa/electiva', 47, 'view_asignaturaoptativaelectiva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$eiKeNxGEyrF5$/rbz/frE+xIBPiBbGgXDQw0LLhDeIn8K/v23YzHijR8=', '2015-04-07 13:31:38', 1, 'abel.gonzalez', 'Abel', 'González Mondéjar', 'abel.gonzalez@infonet.umcc.cu', 1, 1, '2015-03-22 05:57:51'),
(2, 'pbkdf2_sha256$12000$NKWGVa4gBOra$yOfN5Ald0y9SpF8jUJkPcC48bjr3U8iMiIS7fvh8IJo=', '2015-03-22 06:07:44', 0, 'julio.telot', 'Julio A.', 'Telot González', 'julio.telot@umcc.cu', 1, 1, '2015-03-22 06:07:44'),
(3, 'pbkdf2_sha256$12000$yqWgiICu3EXb$1OioGxxaOkMNSHuc0u4E9m1IV5mLF4OVKFGjuMMBC1Q=', '2015-03-23 03:27:08', 0, 'ana.hernandez', 'Ana M.', 'Hernández Quintana', 'ana.hernandez@umcc.cu', 1, 1, '2015-03-22 06:08:43'),
(4, 'pbkdf2_sha256$12000$i1rW9luBfN2h$Puy303kKptLVO0EnibS35O3DYvpnjbwnAAX3uzCa7kU=', '2015-03-22 06:09:00', 0, 'roberto.frias', 'Roberto A.', 'Frías Jiménez', 'roberto.frias@umcc.cu', 1, 1, '2015-03-22 06:09:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 2),
(3, 3, 4),
(2, 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=409 ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2015-03-22 06:02:03', '1', 'Conformado el expediente estudiantil', 1, '', 11, 1),
(2, '2015-03-22 06:02:13', '2', 'Enviado a coordinador de carrera el expediente', 1, '', 11, 1),
(3, '2015-03-22 06:02:22', '3', 'Aprobado por el coordinador el expediente', 1, '', 11, 1),
(4, '2015-03-22 06:02:29', '4', 'Devuelto por el coordinador el expediente', 1, '', 11, 1),
(5, '2015-03-22 06:02:36', '5', 'Conformada la propuesta de ajuste', 1, '', 11, 1),
(6, '2015-03-22 06:02:45', '6', 'Enviado a la secretaria la propuesta de ajuste', 1, '', 11, 1),
(7, '2015-03-22 06:02:53', '7', 'Enviada al decano la propuesta de ajuste', 1, '', 11, 1),
(8, '2015-03-22 06:03:15', '8', 'Aprobado por el decano la propuesta de ajuste del coordinador', 1, '', 11, 1),
(9, '2015-03-22 06:03:22', '9', 'Devuelto por el decano la propuesta de ajuste del coordinador', 1, '', 11, 1),
(10, '2015-03-22 06:03:28', '10', 'Enviada al coordinador devolución de ajuste por parte del decano', 1, '', 11, 1),
(11, '2015-03-22 06:03:34', '11', 'Entregado a estudiante su ajuste a plan', 1, '', 11, 1),
(12, '2015-03-22 06:04:08', '1', 'Expediente académico', 1, '', 9, 1),
(13, '2015-03-22 06:04:23', '1', 'Traslado', 1, '', 8, 1),
(14, '2015-03-22 06:04:40', '1', 'Pendiente', 1, '', 10, 1),
(15, '2015-03-22 06:04:45', '2', 'Abonada', 1, '', 10, 1),
(16, '2015-03-22 06:04:49', '3', 'Convalidada', 1, '', 10, 1),
(17, '2015-03-22 06:05:47', '1', 'Administrador del sistema', 1, '', 3, 1),
(18, '2015-03-22 06:05:53', '2', 'Coordinador de Carrera', 1, '', 3, 1),
(19, '2015-03-22 06:06:05', '3', 'Decano', 1, '', 3, 1),
(20, '2015-03-22 06:06:10', '4', 'Secretaria docente', 1, '', 3, 1),
(21, '2015-03-22 06:07:20', '1', 'abel.gonzalez', 2, 'Modificado/a first_name y last_name.', 4, 1),
(22, '2015-03-22 06:07:41', '1', 'Facultad de Ciencias Económicas e Informática', 1, '', 17, 1),
(23, '2015-03-22 06:07:44', '2', 'julio.telot', 1, '', 4, 1),
(24, '2015-03-22 06:08:30', '2', 'julio.telot', 2, 'Modificado/a first_name, last_name, email, is_staff y groups.', 4, 1),
(25, '2015-03-22 06:08:43', '3', 'ana.hernandez', 1, '', 4, 1),
(26, '2015-03-22 06:09:00', '4', 'roberto.frias', 1, '', 4, 1),
(27, '2015-03-22 06:09:41', '4', 'roberto.frias', 2, 'Modificado/a first_name, last_name, email, is_staff y groups.', 4, 1),
(28, '2015-03-22 06:10:21', '3', 'ana.hernandez', 2, 'Modificado/a first_name, last_name, email, is_staff y groups.', 4, 1),
(29, '2015-03-22 06:11:45', '1', 'Ingeniería Informática', 1, '', 18, 1),
(30, '2015-03-22 06:12:08', '1', 'Profesor Titular', 1, '', 30, 1),
(31, '2015-03-22 06:12:40', '1', 'Departamento de Informática', 1, '', 29, 1),
(32, '2015-03-22 06:14:07', '1', 'Blanco(a)', 1, '', 27, 1),
(33, '2015-03-22 06:14:10', '2', 'Negro(a)', 1, '', 27, 1),
(34, '2015-03-22 06:14:48', '1', 'Doctor en Ciencias Técnicas (DrC.)', 1, '', 28, 1),
(35, '2015-03-22 06:15:06', '1', 'Matanzas', 1, '', 23, 1),
(36, '2015-03-22 06:15:11', '2', 'Colón', 1, '', 23, 1),
(37, '2015-03-22 06:15:24', '1', 'Cubana', 1, '', 25, 1),
(38, '2015-03-22 06:15:45', '1', 'Cuba', 1, '', 21, 1),
(39, '2015-03-22 06:15:59', '1', 'Matanzas', 1, '', 22, 1),
(40, '2015-03-22 06:16:11', '1', 'Masculino', 1, '', 26, 1),
(41, '2015-03-22 06:16:31', '1', 'Curso Regular Diurno (CRD)', 1, '', 19, 1),
(42, '2015-03-22 06:16:41', '2', 'Curso por Encuentros (CE)', 1, '', 19, 1),
(43, '2015-03-22 06:17:04', '2', 'Julio A. Telot González', 2, 'Modificado/a departamentoId.', 32, 1),
(44, '2015-03-22 06:19:05', '2', 'Julio A. Telot González', 2, 'Modificado/a gradoCientifico y categoriaDocenteId.', 32, 1),
(45, '2015-03-22 06:19:15', '4', 'Roberto A. Frías Jiménez', 2, 'Modificado/a gradoCientifico y categoriaDocenteId.', 32, 1),
(46, '2015-03-22 06:19:37', '1', 'Matanzas, Matanzas, Cuba', 1, '', 24, 1),
(47, '2015-03-22 06:19:43', '2', 'Colón, Matanzas, Cuba', 1, '', 24, 1),
(48, '2015-03-22 06:20:21', '1', 'UM', 1, '', 16, 1),
(49, '2015-03-22 06:20:33', '2', 'UNAH', 1, '', 16, 1),
(50, '2015-03-22 06:20:44', '3', 'UCI', 1, '', 16, 1),
(51, '2015-03-22 06:21:10', '1', '1er', 1, '', 34, 1),
(52, '2015-03-22 06:21:20', '2', '2do', 1, '', 34, 1),
(53, '2015-03-22 06:21:27', '3', '3er', 1, '', 34, 1),
(54, '2015-03-22 06:21:38', '4', '4to', 1, '', 34, 1),
(55, '2015-03-22 06:21:46', '5', '5to', 1, '', 34, 1),
(56, '2015-03-22 06:21:53', '6', '6to', 1, '', 34, 1),
(57, '2015-03-22 06:22:06', '7', '7mo', 1, '', 34, 1),
(58, '2015-03-22 06:22:55', '8', 'Sin especificar', 1, '', 34, 1),
(59, '2015-03-22 06:23:40', '1', 'Primer', 1, '', 35, 1),
(60, '2015-03-22 06:23:49', '2', 'Segundo', 1, '', 35, 1),
(61, '2015-03-22 06:23:56', '3', 'Tercer', 1, '', 35, 1),
(62, '2015-03-22 06:24:07', '4', 'Sin especificar', 1, '', 35, 1),
(63, '2015-03-22 06:24:22', '1', '1er año / Primer semestre', 1, '', 36, 1),
(64, '2015-03-22 06:24:25', '2', '1er año / Segundo semestre', 1, '', 36, 1),
(65, '2015-03-22 06:24:29', '3', '2do año / Primer semestre', 1, '', 36, 1),
(66, '2015-03-22 06:24:32', '4', '2do año / Segundo semestre', 1, '', 36, 1),
(67, '2015-03-22 06:24:36', '5', '3er año / Primer semestre', 1, '', 36, 1),
(68, '2015-03-22 06:24:40', '6', '3er año / Segundo semestre', 1, '', 36, 1),
(69, '2015-03-22 06:24:45', '7', '4to año / Primer semestre', 1, '', 36, 1),
(70, '2015-03-22 06:24:48', '8', '4to año / Segundo semestre', 1, '', 36, 1),
(71, '2015-03-22 06:24:52', '9', '5to año / Primer semestre', 1, '', 36, 1),
(72, '2015-03-22 06:24:56', '10', '5to año / Segundo semestre', 1, '', 36, 1),
(73, '2015-03-22 06:25:01', '11', '6to año / Primer semestre', 1, '', 36, 1),
(74, '2015-03-22 06:25:06', '12', '6to año / Segundo semestre', 1, '', 36, 1),
(75, '2015-03-22 06:25:11', '13', 'Sin especificar año / Sin especificar semestre', 1, '', 36, 1),
(76, '2015-03-22 06:25:42', '1', 'Plan D', 1, '', 37, 1),
(77, '2015-03-22 06:25:59', '2', 'Plan C', 1, '', 37, 1),
(78, '2015-03-22 06:26:19', '3', 'Plan E', 1, '', 37, 1),
(79, '2015-03-22 06:26:56', '1', 'Matemática', 1, '', 40, 1),
(80, '2015-03-22 06:26:58', '2', 'Marxismo Leninismo', 1, '', 40, 1),
(81, '2015-03-22 06:27:08', '3', 'Programación', 1, '', 40, 1),
(82, '2015-03-22 06:27:15', '4', 'Ingeniería de Software', 1, '', 40, 1),
(83, '2015-03-22 06:27:23', '5', 'Idioma Extranjero', 1, '', 40, 1),
(84, '2015-03-22 06:27:26', '6', 'Fïsica', 1, '', 40, 1),
(85, '2015-03-22 06:27:39', '7', 'Preparación Física', 1, '', 40, 1),
(86, '2015-03-22 06:27:43', '8', 'Administración', 1, '', 40, 1),
(87, '2015-03-22 06:28:04', '1', '2010-2011', 1, '', 33, 1),
(88, '2015-03-22 06:28:12', '2', '2011-2012', 1, '', 33, 1),
(89, '2015-03-22 06:28:14', '3', '2012-2013', 1, '', 33, 1),
(90, '2015-03-22 06:28:19', '4', '2013-2014', 1, '', 33, 1),
(91, '2015-03-22 06:28:24', '5', '2014-2015', 1, '', 33, 1),
(92, '2015-03-22 06:28:30', '6', '2015-2016', 1, '', 33, 1),
(93, '2015-03-22 06:28:46', '1', 'Propio', 1, '', 41, 1),
(94, '2015-03-22 06:28:55', '2', 'Base', 1, '', 41, 1),
(95, '2015-03-22 06:28:59', '3', 'Optativo', 1, '', 41, 1),
(96, '2015-03-22 06:29:24', '1', 'Ordinaria', 1, '', 39, 1),
(97, '2015-03-22 06:29:45', '1', 'Examen final', 1, '', 42, 1),
(98, '2015-03-22 06:29:56', '2', 'Proyecto de Curso', 1, '', 42, 1),
(99, '2015-03-22 06:31:37', '1', 'Matemática I', 1, '', 38, 1),
(100, '2015-03-22 06:31:46', '2', 'Algebra Lineal', 1, '', 38, 1),
(101, '2015-03-22 06:32:05', '3', 'Filosofía y Sociedad', 1, '', 38, 1),
(102, '2015-03-22 06:32:12', '4', 'Fundamentos de la Informática', 1, '', 38, 1),
(103, '2015-03-22 06:32:17', '5', 'Introducción a la Programación', 1, '', 38, 1),
(104, '2015-03-22 06:32:23', '6', 'Educación Física I', 1, '', 38, 1),
(105, '2015-03-22 06:32:28', '7', 'Idioma Inglés I', 1, '', 38, 1),
(106, '2015-03-22 06:32:35', '8', 'Historia de Cuba', 1, '', 38, 1),
(107, '2015-03-22 06:32:43', '9', 'Matemática II', 1, '', 38, 1),
(108, '2015-03-22 06:32:48', '10', 'Matemática Discreta', 1, '', 38, 1),
(109, '2015-03-22 06:32:54', '11', 'Economía Política del Capitalismo', 1, '', 38, 1),
(110, '2015-03-22 06:32:59', '12', 'Idioma Inglés II', 1, '', 38, 1),
(111, '2015-03-22 06:33:10', '13', 'Diseño y Programación Orientada a Objetos', 1, '', 38, 1),
(112, '2015-03-22 06:33:12', '14', 'Educación Física II', 1, '', 38, 1),
(113, '2015-03-22 06:33:18', '15', 'Introducción a la Ingeniería de Software', 1, '', 38, 1),
(114, '2015-03-22 06:33:24', '16', 'Matemática III', 1, '', 38, 1),
(115, '2015-03-22 06:33:31', '17', 'Economía Política de la Construcción del Socialismo', 1, '', 38, 1),
(116, '2015-03-22 06:33:40', '18', 'Estructura de Datos I', 1, '', 38, 1),
(117, '2015-03-22 06:33:50', '19', 'Introducción a la Inteligencia Artificial', 1, '', 38, 1),
(118, '2015-03-22 06:33:57', '20', 'Idioma Inglés III', 1, '', 38, 1),
(119, '2015-03-22 06:34:03', '21', 'Seguridad Nacional', 1, '', 38, 1),
(120, '2015-03-22 06:34:11', '22', 'Educación Física III', 1, '', 38, 1),
(121, '2015-03-22 06:34:14', '23', 'Electiva I', 1, '', 38, 1),
(122, '2015-03-22 06:34:30', '24', 'Matemática IV', 1, '', 38, 1),
(123, '2015-03-22 06:34:36', '25', 'Arquitectura de Computadoras', 1, '', 38, 1),
(124, '2015-03-22 06:34:43', '26', 'Base de Datos', 1, '', 38, 1),
(125, '2015-03-22 06:34:49', '27', 'Teoría Sociopolítica', 1, '', 38, 1),
(126, '2015-03-22 06:34:54', '28', 'Idioma Inglés IV', 1, '', 38, 1),
(127, '2015-03-22 06:35:00', '29', '''Defensa Nacional', 1, '', 38, 1),
(128, '2015-03-22 06:35:07', '30', 'Educación Física IV', 1, '', 38, 1),
(129, '2015-03-22 06:35:22', '29', 'Defensa Nacional', 2, 'Modificado/a nombre.', 38, 1),
(130, '2015-03-22 06:35:28', '31', 'Estructura de Datos II', 1, '', 38, 1),
(131, '2015-03-22 06:35:32', '32', 'Física', 1, '', 38, 1),
(132, '2015-03-22 06:35:38', '33', 'Práctica Profesional de segundo año', 1, '', 38, 1),
(133, '2015-03-22 06:35:44', '34', 'Ingeniería de Software I', 1, '', 38, 1),
(134, '2015-03-22 06:35:54', '35', 'Inteligencia Artificial', 1, '', 38, 1),
(135, '2015-03-22 06:36:02', '36', 'Gestión Económica y Financiera', 1, '', 38, 1),
(136, '2015-03-22 06:36:08', '37', 'Sistemas Operativos', 1, '', 38, 1),
(137, '2015-03-22 06:36:16', '38', 'Gestión Organizacional', 1, '', 38, 1),
(138, '2015-03-22 06:36:22', '39', 'Probabilidades y Estadística Matemática', 1, '', 38, 1),
(139, '2015-03-22 06:36:28', '40', 'Redes de Computadoras', 1, '', 38, 1),
(140, '2015-03-22 06:36:36', '41', 'Programación Web', 1, '', 38, 1),
(141, '2015-03-22 06:36:49', '42', 'Problemas Sociales de la Ciencia y la Tecnología', 1, '', 38, 1),
(142, '2015-03-22 06:36:55', '43', 'Componente Profesional del Trabajo de Curso de Ingeniería de Software I', 1, '', 38, 1),
(143, '2015-03-22 06:37:09', '44', 'Patrones de Diseño y Arquitectura', 1, '', 38, 1),
(144, '2015-03-22 06:37:16', '45', 'Práctica Profesional de tercer año', 1, '', 38, 1),
(145, '2015-03-22 06:37:26', '46', 'Optativa I', 1, '', 38, 1),
(146, '2015-03-22 12:13:24', '47', 'Investigación de Operaciones', 1, '', 38, 1),
(147, '2015-03-22 12:13:34', '48', 'Ingeniería de Software II', 1, '', 38, 1),
(148, '2015-03-22 12:13:36', '49', 'Simulación', 1, '', 38, 1),
(149, '2015-03-22 12:13:43', '50', 'Optativa II', 1, '', 38, 1),
(150, '2015-03-22 12:13:49', '51', '''Optativa III', 1, '', 38, 1),
(151, '2015-03-22 12:13:59', '52', 'Optativa III', 1, '', 38, 1),
(152, '2015-03-22 12:14:46', '51', 'Optativa IV', 2, 'Modificado/a nombre.', 38, 1),
(153, '2015-03-22 12:15:06', '53', 'Optativa V', 1, '', 38, 1),
(154, '2015-03-22 12:15:15', '54', 'Optativa VI', 1, '', 38, 1),
(155, '2015-03-22 12:15:21', '55', 'Optativa VII', 1, '', 38, 1),
(156, '2015-03-22 12:15:28', '56', 'Componente Profesional', 1, '', 38, 1),
(157, '2015-03-22 12:15:34', '57', 'Ingeniería de Software III', 1, '', 38, 1),
(158, '2015-03-22 12:15:41', '58', 'Componente Profesional del Trabajo de Curso de Ingeniería de Software II', 1, '', 38, 1),
(159, '2015-03-22 12:15:48', '59', 'Práctica Profesional de cuarto año', 1, '', 38, 1),
(160, '2015-03-22 12:15:55', '60', 'Seminario Profesional', 1, '', 38, 1),
(161, '2015-03-22 12:16:00', '61', 'Pedagogía y Didáctica de la Educación Superior', 1, '', 38, 1),
(162, '2015-03-22 12:16:11', '62', 'Componente Profesional del Trabajo de Curso de Seminario Profesional', 1, '', 38, 1),
(163, '2015-03-22 12:16:17', '63', 'Optativa VIII', 1, '', 38, 1),
(164, '2015-03-22 12:16:24', '64', 'Optativa IX', 1, '', 38, 1),
(165, '2015-03-22 12:16:30', '65', 'Optativa X', 1, '', 38, 1),
(166, '2015-03-22 12:16:35', '66', 'Optativa XI', 1, '', 38, 1),
(167, '2015-03-22 12:16:42', '67', 'Componente Profesional del Trabajo de Curso de Ingeniería de Software III', 1, '', 38, 1),
(168, '2015-03-22 12:16:48', '68', 'Trabajo de Diploma', 1, '', 38, 1),
(169, '2015-03-22 12:16:58', '69', 'Base de Datos Avanzadas', 1, '', 38, 1),
(170, '2015-03-22 12:17:15', '70', 'Apreciación  de la Cultura Cubana', 1, '', 38, 1),
(171, '2015-03-22 12:17:21', '71', 'Preparación específica para Concursos ACM-ICPC', 1, '', 38, 1),
(172, '2015-03-22 12:17:27', '72', 'Lenguajes de Programación', 1, '', 38, 1),
(173, '2015-03-22 12:17:42', '73', 'Gestión de Software', 1, '', 38, 1),
(174, '2015-03-22 12:17:53', '74', 'Reconocimiento de Patrones', 1, '', 38, 1),
(175, '2015-03-22 12:18:00', '75', 'Patrones de Diseño y Arquitectura Avanzadas', 1, '', 38, 1),
(176, '2015-03-22 12:18:27', '76', 'Diseño Gráfico por Computadoras', 1, '', 38, 1),
(177, '2015-03-22 12:18:42', '77', 'Gestión de Proyectos', 1, '', 38, 1),
(178, '2015-03-22 12:18:48', '78', 'Programación y Mantenimiento de Servidores', 1, '', 38, 1),
(179, '2015-03-22 12:18:56', '79', 'Diseño de Interfaces', 1, '', 38, 1),
(180, '2015-03-22 12:19:03', '80', 'Programación Competitiva', 1, '', 38, 1),
(181, '2015-03-22 12:19:10', '81', 'Comercio Electrónico', 1, '', 38, 1),
(182, '2015-03-22 12:19:17', '82', 'Instalación y Gestión de Redes', 1, '', 38, 1),
(183, '2015-03-22 12:19:25', '83', 'Desarrollo Ágil I', 1, '', 38, 1),
(184, '2015-03-22 12:19:32', '84', 'Procesamiento de Lenguaje Natural', 1, '', 38, 1),
(185, '2015-03-22 12:19:40', '85', 'Aplicaciones de la Inteligencia Artificial', 1, '', 38, 1),
(186, '2015-03-22 12:19:47', '86', 'Tecnologías Avanzadas de Programación I', 1, '', 38, 1),
(187, '2015-03-22 12:20:41', '87', 'Tecnología para el Tratamiento de la Información', 1, '', 38, 1),
(188, '2015-03-22 12:20:47', '88', 'Programación Descriptiva', 1, '', 38, 1),
(189, '2015-03-22 12:20:53', '89', 'Tecnologías para el Tratamiento de la Información', 1, '', 38, 1),
(190, '2015-03-22 12:21:39', '90', 'Tecnologías Avanzadas de Programación II', 1, '', 38, 1),
(191, '2015-03-22 12:21:54', '91', 'Desarrollo Ágil II', 1, '', 38, 1),
(192, '2015-03-22 12:22:07', '92', 'Redes Neuronales y Algoritmos Genéticos', 1, '', 38, 1),
(193, '2015-03-22 12:22:14', '93', 'Bases de Datos Avanzadas', 1, '', 38, 1),
(194, '2015-03-22 12:22:22', '94', 'Ética de la profesión', 1, '', 38, 1),
(195, '2015-03-22 12:22:40', '93', 'Formación Jurídica', 2, 'Modificado/a nombre.', 38, 1),
(196, '2015-03-22 12:25:39', '1', 'Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD) ', 1, '', 20, 1),
(197, '2015-03-22 12:25:53', '1', 'Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011]', 1, '', 43, 1),
(198, '2015-03-22 12:26:10', '2', 'Facultad de Informática', 1, '', 17, 1),
(199, '2015-03-22 12:26:15', '2', 'Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD) ', 1, '', 20, 1),
(200, '2015-03-22 12:26:28', '2', 'Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]', 1, '', 43, 1),
(201, '2015-03-22 12:27:57', '1', 'Matemática I - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(202, '2015-03-22 12:28:08', '2', 'Algebra Lineal - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(203, '2015-03-22 12:28:18', '3', 'Filosofía y Sociedad - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(204, '2015-03-22 12:28:29', '4', 'Fundamentos de la Informática - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(205, '2015-03-22 12:28:49', '5', 'Introducción a la Programación - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(206, '2015-03-22 12:29:00', '6', 'Educación Física I - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(207, '2015-03-22 12:29:10', '7', 'Idioma Inglés I - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(208, '2015-03-22 12:29:19', '8', 'Historia de Cuba - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(209, '2015-03-22 12:29:34', '9', 'Optativa II - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(210, '2015-03-22 12:29:43', '10', 'Matemática Discreta - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(211, '2015-03-22 12:29:59', '11', 'Economía Política del Capitalismo - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(212, '2015-03-22 12:30:08', '12', 'Idioma Inglés II - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(213, '2015-03-22 12:30:26', '13', 'Diseño y Programación Orientada a Objetos - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(214, '2015-03-22 12:30:41', '14', 'Educación Física II - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(215, '2015-03-22 12:30:54', '15', 'Introducción a la Ingeniería de Software - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(216, '2015-03-22 12:31:15', '16', 'Matemática III - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(217, '2015-03-22 12:31:27', '17', 'Economía Política de la Construcción del Socialismo - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011', 1, '', 45, 1),
(218, '2015-03-22 12:31:38', '18', 'Estructura de Datos I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(219, '2015-03-22 12:31:56', '19', 'Introducción a la Inteligencia Artificial - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(220, '2015-03-22 12:32:05', '20', 'Idioma Inglés III - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(221, '2015-03-22 12:32:14', '21', 'Seguridad Nacional - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(222, '2015-03-22 12:33:03', '22', 'Educación Física III - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(223, '2015-03-22 12:33:20', '23', 'Electiva I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(224, '2015-03-22 12:33:38', '24', 'Arquitectura de Computadoras - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(225, '2015-03-22 12:33:53', '25', 'Matemática IV - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(226, '2015-03-22 12:34:04', '26', 'Base de Datos - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(227, '2015-03-22 12:34:19', '27', 'Teoría Sociopolítica - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(228, '2015-03-22 12:34:29', '28', 'Idioma Inglés IV - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(229, '2015-03-22 12:34:41', '29', 'Defensa Nacional - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(230, '2015-03-22 12:34:55', '30', 'Educación Física IV - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(231, '2015-03-22 12:35:36', '31', 'Estructura de Datos II - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(232, '2015-03-22 12:35:49', '32', 'Física - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(233, '2015-03-22 12:36:13', '33', 'Práctica Profesional de segundo año - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(234, '2015-03-22 12:37:41', '1', 'Apreciación  de la Cultura Cubana => Electiva I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(235, '2015-03-22 12:37:52', '2', 'Ética de la profesión => Electiva I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(236, '2015-03-22 12:38:04', '3', 'Preparación específica para Concursos ACM-ICPC => Electiva I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [', 1, '', 47, 1),
(237, '2015-03-22 12:38:14', '4', 'Formación Jurídica => Electiva I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(238, '2015-03-22 12:38:32', '34', 'Ingeniería de Software I - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(239, '2015-03-22 12:38:46', '35', 'Inteligencia Artificial - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(240, '2015-03-22 12:39:00', '36', 'Gestión Económica y Financiera - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(241, '2015-03-22 12:39:12', '37', 'Sistemas Operativos - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(242, '2015-03-22 12:39:44', '38', 'Componente Profesional del Trabajo de Curso de Ingeniería de Software I - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD', 1, '', 45, 1),
(243, '2015-03-22 12:39:56', '39', 'Patrones de Diseño y Arquitectura - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(244, '2015-03-22 12:40:12', '40', 'Gestión Organizacional - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(245, '2015-03-22 12:40:25', '41', 'Probabilidades y Estadística Matemática - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(246, '2015-03-22 12:41:16', '42', 'Redes de Computadoras - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(247, '2015-03-22 12:41:33', '43', 'Programación Web - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(248, '2015-03-22 12:41:48', '44', 'Problemas Sociales de la Ciencia y la Tecnología - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(249, '2015-03-22 12:42:45', '45', 'Optativa I - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(250, '2015-03-22 12:43:07', '46', 'Práctica Profesional de tercer año - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(251, '2015-03-22 12:43:38', '5', 'Lenguajes de Programación => Optativa I - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(252, '2015-03-22 12:44:01', '6', 'Gestión de Software => Optativa I - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(253, '2015-03-22 12:44:11', '7', 'Reconocimiento de Patrones => Optativa I - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(254, '2015-03-22 12:44:48', '47', 'Investigación de Operaciones - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(255, '2015-03-22 12:45:01', '48', 'Ingeniería de Software II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(256, '2015-03-22 12:47:02', '9', 'Optativa II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 2, 'Modificado/a anhoSemestreId.', 45, 1),
(257, '2015-03-22 12:47:20', '8', 'Patrones de Diseño y Arquitectura Avanzadas => Optativa II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [20', 1, '', 47, 1),
(258, '2015-03-22 12:47:31', '9', 'Lenguajes de Programación => Optativa II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(259, '2015-03-22 12:47:43', '10', 'Diseño Gráfico por Computadoras => Optativa II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(260, '2015-03-22 12:48:02', '49', 'Optativa III - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(261, '2015-03-22 12:48:16', '11', 'Gestión de Proyectos => Optativa III - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(262, '2015-03-22 12:48:30', '12', 'Programación y Mantenimiento de Servidores => Optativa III - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [20', 1, '', 47, 1),
(263, '2015-03-22 12:48:39', '13', 'Diseño de Interfaces => Optativa III - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(264, '2015-03-22 12:48:56', '50', 'Optativa IV - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(265, '2015-03-22 12:49:13', '14', 'Programación Competitiva => Optativa IV - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(266, '2015-03-22 12:49:27', '15', 'Comercio Electrónico => Optativa IV - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(267, '2015-03-22 12:49:37', '16', 'Instalación y Gestión de Redes => Optativa IV - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(268, '2015-03-22 12:50:04', '51', 'Componente Profesional del Trabajo de Curso de Ingeniería de Software II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CR', 1, '', 45, 1),
(269, '2015-03-22 12:50:31', '52', 'Simulación - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(270, '2015-03-22 12:50:44', '53', 'Optativa V - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(271, '2015-03-22 12:51:05', '17', 'Desarrollo Ágil I => Optativa V - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(272, '2015-03-22 12:51:37', '18', 'Procesamiento de Lenguaje Natural => Optativa V - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(273, '2015-03-22 12:51:47', '19', 'Aplicaciones de la Inteligencia Artificial => Optativa V - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [201', 1, '', 47, 1),
(274, '2015-03-22 12:52:37', '54', 'Optativa VI - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(275, '2015-03-22 12:52:51', '20', 'Tecnologías Avanzadas de Programación I => Optativa VI - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-', 1, '', 47, 1),
(276, '2015-03-22 12:53:08', '21', 'Reconocimiento de Patrones => Optativa VI - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(277, '2015-03-22 12:53:21', '22', 'Diseño Gráfico por Computadoras => Optativa VI - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(278, '2015-03-22 12:53:42', '55', 'Optativa VII - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(279, '2015-03-22 12:53:54', '23', 'Patrones de Diseño y Arquitectura Avanzadas => Optativa VII - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [', 1, '', 47, 1),
(280, '2015-03-22 12:54:04', '24', 'Tecnología para el Tratamiento de la Información => Optativa VII - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Pla', 1, '', 47, 1),
(281, '2015-03-22 12:54:16', '25', 'Programación Descriptiva => Optativa VII - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(282, '2015-03-22 12:54:29', '56', 'Ingeniería de Software III - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(283, '2015-03-22 12:54:55', '57', 'Componente Profesional del Trabajo de Curso de Ingeniería de Software III - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (', 1, '', 45, 1),
(284, '2015-03-22 12:55:18', '58', 'Práctica Profesional de cuarto año - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(285, '2015-03-22 12:55:34', '59', 'Seminario Profesional - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(286, '2015-03-22 12:55:45', '60', 'Pedagogía y Didáctica de la Educación Superior - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(287, '2015-03-22 12:56:00', '61', 'Componente Profesional del Trabajo de Curso de Seminario Profesional - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  ', 1, '', 45, 1),
(288, '2015-03-22 12:56:26', '62', 'Optativa VIII - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(289, '2015-03-22 12:56:40', '26', 'Tecnología para el Tratamiento de la Información => Optativa VIII - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Pla', 1, '', 47, 1),
(290, '2015-03-22 12:56:49', '27', 'Gestión de Proyectos => Optativa VIII - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(291, '2015-03-22 12:57:01', '28', 'Programación y Mantenimiento de Servidores => Optativa VIII - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2', 1, '', 47, 1),
(292, '2015-03-22 12:57:28', '63', 'Optativa IX - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(293, '2015-03-22 12:57:59', '29', 'Programación Competitiva => Optativa IX - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(294, '2015-03-22 12:58:10', '30', 'Comercio Electrónico => Optativa IX - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(295, '2015-03-22 12:58:22', '31', 'Instalación y Gestión de Redes => Optativa IX - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(296, '2015-03-22 12:58:39', '64', 'Optativa X - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(297, '2015-03-22 12:59:10', '32', 'Tecnologías Avanzadas de Programación II => Optativa X - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2', 1, '', 47, 1),
(298, '2015-03-22 12:59:49', '33', 'Aplicaciones de la Inteligencia Artificial => Optativa X - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010', 1, '', 47, 1),
(299, '2015-03-22 12:59:58', '34', 'Desarrollo Ágil II => Optativa X - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(300, '2015-03-22 13:01:31', '65', 'Optativa XI - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(301, '2015-03-22 13:01:47', '35', 'Instalación y Gestión de Redes => Optativa XI - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(302, '2015-03-22 13:02:01', '36', 'Redes Neuronales y Algoritmos Genéticos => Optativa XI - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2', 1, '', 47, 1),
(303, '2015-03-22 13:02:10', '37', 'Base de Datos Avanzadas => Optativa XI - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 47, 1),
(304, '2015-03-22 13:06:21', '66', 'Trabajo de Diploma - 5to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(305, '2015-03-22 13:07:51', '1', 'Romualdo Arrechea Hernández', 1, '', 31, 1),
(306, '2015-03-22 13:08:14', '1', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 44, 1),
(307, '2015-03-22 13:09:16', '1', '(Romualdo Arrechea Hernández) Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011] -> Ingeniería Informática (Facultad de Ciencias Económicas e Informát', 1, '', 12, 1),
(308, '2015-03-22 13:11:42', '67', 'Ingeniería de Software I - Sin especificar año / Sin especificar semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(309, '2015-03-22 13:11:47', '1', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Ingeniería de Software I - Sin especificar año / Sin especificar sem', 1, '', 46, 1),
(310, '2015-03-22 13:12:14', '68', 'Práctica Profesional de segundo año - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(311, '2015-03-22 13:12:16', '2', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Práctica Profesional de segundo año - 2do año / Segundo semestre (In', 1, '', 46, 1),
(312, '2015-03-22 13:12:37', '69', 'Base de Datos Avanzadas - Sin especificar año / Sin especificar semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(313, '2015-03-22 13:12:40', '3', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Base de Datos Avanzadas - Sin especificar año / Sin especificar seme', 1, '', 46, 1),
(314, '2015-03-23 01:23:06', '1', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Matemática I - 1er año / Primer semestre (Ingeniería Inform', 1, '', 13, 1),
(315, '2015-03-23 01:24:06', '2', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Algebra Lineal - 1er año / Primer semestre (Ingeniería Info', 1, '', 13, 1),
(316, '2015-03-23 01:24:39', '3', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Filosofía y Sociedad - 1er año / Primer semestre (Ingenierí', 1, '', 13, 1),
(317, '2015-03-23 01:24:46', '4', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Fundamentos de la Informática - 1er año / Primer semestre (', 1, '', 13, 1),
(318, '2015-03-23 01:25:03', '5', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Introducción a la Programación - 1er año / Primer semestre ', 1, '', 13, 1),
(319, '2015-03-23 01:25:10', '6', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Educación Física I - 1er año / Primer semestre (Ingeniería ', 1, '', 13, 1),
(320, '2015-03-23 01:25:17', '7', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Idioma Inglés I - 1er año / Primer semestre (Ingeniería Inf', 1, '', 13, 1),
(321, '2015-03-23 01:25:33', '8', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Historia de Cuba - 1er año / Primer semestre (Ingeniería In', 1, '', 13, 1),
(322, '2015-03-23 01:25:41', '9', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Matemática Discreta - 1er año / Segundo semestre (Ingenierí', 1, '', 13, 1),
(323, '2015-03-23 01:25:56', '10', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Economía Política del Capitalismo - 1er año / Segundo semes', 1, '', 13, 1),
(324, '2015-03-23 01:26:03', '11', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Idioma Inglés II - 1er año / Segundo semestre (Ingeniería I', 1, '', 13, 1),
(325, '2015-03-23 01:26:12', '12', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Diseño y Programación Orientada a Objetos - 1er año / Segun', 1, '', 13, 1),
(326, '2015-03-23 01:26:26', '13', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Educación Física II - 1er año / Segundo semestre (Ingenierí', 1, '', 13, 1),
(327, '2015-03-23 01:26:39', '14', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Introducción a la Ingeniería de Software - 1er año / Segund', 1, '', 13, 1),
(328, '2015-03-23 01:26:55', '15', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Matemática III - 2do año / Primer semestre (Ingeniería In', 1, '', 13, 1),
(329, '2015-03-23 01:27:03', '16', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Economía Política de la Construcción del Socialismo - 2do a', 1, '', 13, 1),
(330, '2015-03-23 01:27:11', '17', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Estructura de Datos I - 2do año / Primer semestre (Ingenier', 1, '', 13, 1),
(331, '2015-03-23 01:27:19', '18', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Introducción a la Inteligencia Artificial - 2do año / Prime', 1, '', 13, 1),
(332, '2015-03-23 01:27:25', '19', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Idioma Inglés III - 2do año / Primer semestre (Ingeniería I', 1, '', 13, 1),
(333, '2015-03-23 01:27:38', '20', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Seguridad Nacional - 2do año / Primer semestre (Ingeniería ', 1, '', 13, 1),
(334, '2015-03-23 01:27:45', '21', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Educación Física III - 2do año / Primer semestre (Ingenierí', 1, '', 13, 1),
(335, '2015-03-23 01:28:01', '22', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Electiva I - 2do año / Primer semestre (Ingeniería Informát', 1, '', 13, 1),
(336, '2015-03-23 01:28:14', '23', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Matemática IV - 2do año / Segundo semestre (Ingeniería Info', 1, '', 13, 1),
(337, '2015-03-23 01:28:25', '24', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Arquitectura de Computadoras - 2do año / Segundo semestre (', 1, '', 13, 1),
(338, '2015-03-23 01:28:34', '25', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Base de Datos - 2do año / Segundo semestre (Ingeniería Info', 1, '', 13, 1),
(339, '2015-03-23 01:28:49', '26', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Teoría Sociopolítica - 2do año / Segundo semestre (Ingenier', 1, '', 13, 1),
(340, '2015-03-23 01:29:02', '27', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Idioma Inglés IV - 2do año / Segundo semestre (Ingeniería I', 1, '', 13, 1),
(341, '2015-03-23 01:29:18', '28', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Defensa Nacional - 2do año / Segundo semestre (Ingeniería I', 1, '', 13, 1),
(342, '2015-03-23 01:29:27', '29', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Educación Física IV - 2do año / Segundo semestre (Ingenierí', 1, '', 13, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(343, '2015-03-23 01:29:37', '30', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Estructura de Datos II - 2do año / Segundo semestre (Ingeni', 1, '', 13, 1),
(344, '2015-03-23 01:29:46', '31', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Física - 2do año / Segundo semestre (Ingeniería Informática', 1, '', 13, 1),
(345, '2015-03-23 01:29:56', '32', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Convalidada) Práctica Profesional de segundo año - 2do año / Segundo', 1, '', 13, 1),
(346, '2015-03-23 01:30:18', '33', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Ingeniería de Software I - 3er año / Primer semestre (Ingen', 1, '', 13, 1),
(347, '2015-03-23 01:30:32', '34', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Inteligencia Artificial - 3er año / Primer semestre (Ingeni', 1, '', 13, 1),
(348, '2015-03-23 01:30:46', '35', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Gestión Económica y Financiera - 3er año / Primer semestre ', 1, '', 13, 1),
(349, '2015-03-23 01:31:01', '36', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Sistemas Operativos - 3er año / Primer semestre (Ingeniería', 1, '', 13, 1),
(350, '2015-03-23 01:31:16', '37', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Gestión Organizacional - 3er año / Segundo semestre (Ingeni', 1, '', 13, 1),
(351, '2015-03-23 01:31:29', '38', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Probabilidades y Estadística Matemática - 3er año / Segundo', 1, '', 13, 1),
(352, '2015-03-23 01:31:37', '39', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Redes de Computadoras - 3er año / Segundo semestre (Ingenie', 1, '', 13, 1),
(353, '2015-03-23 01:31:44', '40', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Programación Web - 3er año / Segundo semestre (Ingeniería I', 1, '', 13, 1),
(354, '2015-03-23 01:31:57', '41', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Problemas Sociales de la Ciencia y la Tecnología - 3er año ', 1, '', 13, 1),
(355, '2015-03-23 01:32:12', '42', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Componente Profesional del Trabajo de Curso de Ingeniería d', 1, '', 13, 1),
(356, '2015-03-23 01:32:33', '43', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Patrones de Diseño y Arquitectura - 3er año / Primer semest', 1, '', 13, 1),
(357, '2015-03-23 01:32:44', '44', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Práctica Profesional de tercer año - 3er año / Segundo seme', 1, '', 13, 1),
(358, '2015-03-23 01:32:57', '45', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Optativa I - 3er año / Segundo semestre (Ingeniería Informá', 1, '', 13, 1),
(359, '2015-03-23 01:33:06', '46', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Investigación de Operaciones - 4to año / Primer semestre ', 1, '', 13, 1),
(360, '2015-03-23 01:33:25', '47', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Ingeniería de Software II - 4to año / Primer semestre (In', 1, '', 13, 1),
(361, '2015-03-23 01:33:42', '48', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Simulación - 4to año / Segundo semestre (Ingeniería Infor', 1, '', 13, 1),
(362, '2015-03-23 01:33:55', '49', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa II - 4to año / Primer semestre (Ingeniería Infor', 1, '', 13, 1),
(363, '2015-03-23 01:34:08', '50', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Optativa III - 4to año / Primer semestre (Ingeniería Inform', 1, '', 13, 1),
(364, '2015-03-23 01:34:18', '51', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Optativa IV - 4to año / Primer semestre (Ingeniería Informá', 1, '', 13, 1),
(365, '2015-03-23 01:34:27', '52', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Optativa V - 4to año / Segundo semestre (Ingeniería Informá', 1, '', 13, 1),
(366, '2015-03-23 01:34:36', '53', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa VI - 4to año / Segundo semestre (Ingeniería Info', 1, '', 13, 1),
(367, '2015-03-23 01:35:04', '54', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa VII - 4to año / Segundo semestre (Ingeniería Inf', 1, '', 13, 1),
(368, '2015-03-23 01:35:16', '55', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa VIII - 5to año / Primer semestre (Ingeniería Inf', 1, '', 13, 1),
(369, '2015-03-23 01:35:28', '56', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Ingeniería de Software III - 4to año / Segundo semestre (', 1, '', 13, 1),
(370, '2015-03-23 01:35:43', '57', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Componente Profesional del Trabajo de Curso de Ingeniería', 1, '', 13, 1),
(371, '2015-03-23 01:35:59', '58', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Práctica Profesional de cuarto año - 4to año / Segundo se', 1, '', 13, 1),
(372, '2015-03-23 01:36:07', '59', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Seminario Profesional - 5to año / Primer semestre (Ingeni', 1, '', 13, 1),
(373, '2015-03-23 01:36:14', '60', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Pedagogía y Didáctica de la Educación Superior - 5to año ', 1, '', 13, 1),
(374, '2015-03-23 01:36:22', '61', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Componente Profesional del Trabajo de Curso de Seminario ', 1, '', 13, 1),
(375, '2015-03-23 01:36:37', '62', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa IX - 5to año / Primer semestre (Ingeniería Infor', 1, '', 13, 1),
(376, '2015-03-23 01:36:46', '63', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa X - 5to año / Primer semestre (Ingeniería Inform', 1, '', 13, 1),
(377, '2015-03-23 01:36:52', '64', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa XI - 5to año / Primer semestre (Ingeniería Infor', 1, '', 13, 1),
(378, '2015-03-23 01:37:00', '65', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Componente Profesional del Trabajo de Curso de Ingeniería', 1, '', 13, 1),
(379, '2015-03-23 01:37:13', '66', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Trabajo de Diploma - 5to año / Segundo semestre (Ingenier', 1, '', 13, 1),
(380, '2015-03-23 01:39:32', '35', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Gestión Económica y Financiera - 3er año / Primer semestr', 2, 'Modificado/a situacionId.', 13, 1),
(381, '2015-03-23 01:40:00', '43', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Convalidada) Patrones de Diseño y Arquitectura - 3er año / Primer se', 2, 'Modificado/a situacionId.', 13, 1),
(382, '2015-03-23 01:40:56', '52', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa V - 4to año / Segundo semestre (Ingeniería Infor', 2, 'Modificado/a situacionId.', 13, 1),
(383, '2015-03-23 01:41:35', '14', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Convalidada) Introducción a la Ingeniería de Software - 1er año / Se', 2, 'Modificado/a situacionId.', 13, 1),
(384, '2015-03-23 01:43:06', '50', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa III - 4to año / Primer semestre (Ingeniería Info', 2, 'Modificado/a situacionId.', 13, 1),
(385, '2015-03-23 01:43:23', '51', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa IV - 4to año / Primer semestre (Ingeniería Infor', 2, 'Modificado/a situacionId.', 13, 1),
(386, '2015-03-23 01:44:50', '1', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Ingeniería de Software I - Sin especificar año / Sin especificar sem', 1, '', 14, 1),
(387, '2015-03-23 01:45:19', '2', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Práctica Profesional de segundo año - 2do año / Segundo semestre (In', 1, '', 14, 1),
(388, '2015-03-23 01:45:29', '3', 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Base de Datos Avanzadas - Sin especificar año / Sin especificar seme', 1, '', 14, 1),
(389, '2015-03-23 01:46:43', '69', 'Base de Datos Avanzadas - 2do año / Primer semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 2, 'Modificado/a anhoSemestreId.', 45, 1),
(390, '2015-03-23 01:47:12', '69', 'Base de Datos Avanzadas - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 2, 'Modificado/a anhoSemestreId.', 45, 1),
(391, '2015-03-23 01:47:31', '69', 'Base de Datos Avanzadas - 3er año / Primer semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 2, 'Modificado/a anhoSemestreId.', 45, 1),
(392, '2015-03-23 01:47:56', '3', '3er', 2, 'Modificado/a nombre.', 34, 1),
(393, '2015-03-23 01:48:48', '70', 'Base de Datos Avanzadas - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 45, 1),
(394, '2015-03-23 01:49:12', '70', 'Base de Datos Avanzadas - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', 3, '', 45, 1),
(395, '2015-03-23 01:53:54', '69', 'Base de Datos Avanzadas - 1er año / Primer semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 2, 'Modificado/a anhoSemestreId.', 45, 1),
(396, '2015-03-23 03:21:31', '67', 'Ingeniería de Software I - 1er año / Primer semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 2, 'Modificado/a anhoSemestreId.', 45, 1),
(397, '2015-03-23 03:23:23', '67', 'Ingeniería de Software I - 5to año / Primer semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 2, 'Modificado/a anhoSemestreId.', 45, 1),
(398, '2015-03-23 03:23:45', '67', 'Ingeniería de Software I - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 2, 'Modificado/a anhoSemestreId.', 45, 1),
(399, '2015-03-23 03:24:21', '67', 'Ingeniería de Software I - Sin especificar año / Sin especificar semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 2, 'Modificado/a anhoSemestreId.', 45, 1),
(400, '2015-03-23 03:25:26', '1', 'Roberto A. Frías Jiménez Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 1, '', 15, 1),
(401, '2015-03-23 03:29:19', '4', 'plan prueba', 1, 'Agregado/a', 37, 1),
(402, '2015-03-23 03:29:34', '4', 'plan prueba', 2, 'Modificado/a', 37, 1),
(403, '2015-03-23 03:29:42', '4', 'plan prueba11', 3, 'Deshabilitado/a', 37, 1),
(404, '2015-03-23 03:34:06', '1', 'Ana M. Hernández Quintana Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', 2, 'Modificado/a trabajadorId y estadoId.', 15, 1),
(405, '2015-04-07 03:19:57', '2', 'Femenino', 1, '', 26, 1),
(406, '2015-04-07 03:20:11', '2', 'Baja', 1, '', 8, 1),
(407, '2015-04-07 03:20:17', '3', 'Licencia de maternidad', 1, '', 8, 1),
(408, '2015-04-07 13:32:33', '1', 'abel.gonzalez', 2, 'Añadido/a "Abel González Mondéjar" Trabajador.', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_e808ab4_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'search entry', 'watson', 'searchentry'),
(8, 'Motivo de ajuste', 'ajustes', 'motivoajuste'),
(9, 'Documentación analizada', 'ajustes', 'documentacionanalizada'),
(10, 'Situación de la asignatura', 'ajustes', 'situacion'),
(11, 'Estado de ajuste', 'ajustes', 'estadoajuste'),
(12, 'Estudiante - Motivo de ajuste', 'ajustes', 'ajusteestudiante'),
(13, 'Ajuste de asignatura', 'ajustes', 'ajusteasignatura'),
(14, 'Ajuste de asignatura convalidada', 'ajustes', 'ajusteasignaturaconvalidada'),
(15, 'Aprobación de ajuste', 'ajustes', 'aprobaciondeajuste'),
(16, 'Universidad', 'persona', 'universidad'),
(17, 'Facultad', 'persona', 'facultad'),
(18, 'Carrera', 'persona', 'carrera'),
(19, 'Tipo de curso', 'persona', 'tipodecurso'),
(20, 'Tipo de curso en carrera', 'persona', 'carreratipodecurso'),
(21, 'País', 'persona', 'pais'),
(22, 'Provincia', 'persona', 'provincia'),
(23, 'Municipio', 'persona', 'municipio'),
(24, 'Ubicación', 'persona', 'ubicacion'),
(25, 'Nacionalidad', 'persona', 'nacionalidad'),
(26, 'Sexo', 'persona', 'sexo'),
(27, 'Etnia', 'persona', 'etnia'),
(28, 'Grado científico', 'persona', 'gradocientifico'),
(29, 'Departamento', 'persona', 'departamento'),
(30, 'Categoría docente', 'persona', 'categoriadocente'),
(31, 'Estudiante', 'persona', 'estudiante'),
(32, 'Trabajador', 'persona', 'trabajador'),
(33, 'Curso', 'planEstudio', 'curso'),
(34, 'Anho', 'planEstudio', 'anho'),
(35, 'Semestre', 'planEstudio', 'semestre'),
(36, 'Semestre de un anho', 'planEstudio', 'anhosemestre'),
(37, 'Plan de estudio', 'planEstudio', 'planestudio'),
(38, 'Asignatura', 'planEstudio', 'asignatura'),
(39, 'Tipo de asignatura', 'planEstudio', 'tipoasignatura'),
(40, 'Disciplina', 'planEstudio', 'disciplina'),
(41, 'Currículo', 'planEstudio', 'curriculo'),
(42, 'Tipo de evaluación', 'planEstudio', 'tipoevaluacion'),
(43, 'Cohorte', 'planEstudio', 'cohorte'),
(44, 'Carrera - Estudiante', 'planEstudio', 'carreraestudiante'),
(45, 'Asignatura de un cohorte', 'planEstudio', 'asignaturacohorte'),
(46, 'Asignatura vencida del estudiante', 'planEstudio', 'asignaturavencida'),
(47, 'Asignatura optativa/electiva', 'planEstudio', 'asignaturaoptativaelectiva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2015-03-22 05:57:20'),
(2, 'auth', '0001_initial', '2015-03-22 05:57:26'),
(3, 'admin', '0001_initial', '2015-03-22 05:57:28'),
(4, 'sessions', '0001_initial', '2015-03-22 05:57:28'),
(5, 'watson', '0001_initial', '2015-03-22 05:57:29'),
(6, 'persona', '0001_initial', '2015-03-22 05:58:23'),
(7, 'planEstudio', '0001_initial', '2015-03-22 05:58:53'),
(8, 'ajustes', '0001_initial', '2015-03-22 05:58:56'),
(9, 'ajustes', '0002_auto_20150322_0057', '2015-03-22 05:59:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4i9vnz7533902ybrmngjf14rn9w9xf85', 'MWZmNTQ5ZTBkYTgzZjQzZWVmZjQwMDgyM2VhMTg4NGJkNWI4NjUyMDp7ImV4cGVkaWVudGVzX2RldnVlbHRvcyI6MCwiZXhwZWRpZW50ZXNfYXByb2JhZG9zIjowLCJfYXV0aF91c2VyX2lkIjoxLCJleHBlZGllbnRlc19wZW5kaWVudGVzIjowLCJhanVzdGVzX2Fwcm9iYWRvcyI6MSwiYWp1c3Rlc19wZW5kaWVudGVzIjoxLCJhZG1pbmlzdHJhZG9yIjp0cnVlLCJhanVzdGVzX2RldnVlbHRvcyI6MCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OGI4ZmIzN2EyYjIyOTc0ZmNlMTk3NWYxNDBjNWFhNGIwMDRjNWYxIn0=', '2015-04-06 03:27:32'),
('jzuw5qzzrqiwpukae0vs4ik7gggrm1ai', 'ZGE4YTFjZmY1OTFjZjAwOGU5ZjBhYmQwOGNiY2FhZjU4Y2YzNWQzYjp7InNlY3JldGFyaWEiOmZhbHNlLCJleHBlZGllbnRlc19hcHJvYmFkb3NfdGlsZSI6MSwiYWp1c3Rlc19wZW5kaWVudGVzX3RpbGUiOjAsImNvb3JkaW5hZG9yIjpmYWxzZSwiZXhwZWRpZW50ZXNfcGVuZGllbnRlc190aWxlIjowLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsImFkbWluaXN0cmFkb3IiOnRydWUsIl9hdXRoX3VzZXJfaWQiOjEsImV4cGVkaWVudGVzX2RldnVlbHRvc190aWxlIjowLCJhanVzdGVzX2Fwcm9iYWRvc190aWxlIjoyLCJhanVzdGVzX2RldnVlbHRvc190aWxlIjowLCJfYXV0aF91c2VyX2hhc2giOiI0OGI4ZmIzN2EyYjIyOTc0ZmNlMTk3NWYxNDBjNWFhNGIwMDRjNWYxIiwiZGVjYW5vIjpmYWxzZX0=', '2015-04-21 13:32:40'),
('t7dhkwzkd5ybycnan0kdyf4lb3xn98iw', 'NTE0YjkyMmJlZjgzYTRhNTlmZDcwOTkyYzM0MDE2ODM2YTUwNGM2OTp7ImFqdXN0ZXNfcGVuZGllbnRlc190aWxlIjowLCJzZWNyZXRhcmlhIjpmYWxzZSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OGI4ZmIzN2EyYjIyOTc0ZmNlMTk3NWYxNDBjNWFhNGIwMDRjNWYxIiwiYWp1c3Rlc19kZXZ1ZWx0b3NfdGlsZSI6MCwiZXhwZWRpZW50ZXNfYXByb2JhZG9zX3RpbGUiOjEsImFqdXN0ZXNfYXByb2JhZG9zX3RpbGUiOjIsImFkbWluaXN0cmFkb3IiOnRydWUsImV4cGVkaWVudGVzX2RldnVlbHRvc190aWxlIjowLCJleHBlZGllbnRlc19wZW5kaWVudGVzX3RpbGUiOjAsImNvb3JkaW5hZG9yIjpmYWxzZSwiX2F1dGhfdXNlcl9pZCI6MSwiZGVjYW5vIjpmYWxzZX0=', '2015-04-21 03:19:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_carrera`
--

CREATE TABLE IF NOT EXISTS `persona_carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `siglas` varchar(10) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `persona_carrera_nombre_5b409f9c_uniq` (`nombre`,`siglas`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `persona_carrera`
--

INSERT INTO `persona_carrera` (`id`, `nombre`, `siglas`, `activo`) VALUES
(1, 'Ingeniería Informática', 'Ing. Info', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_carreratipodecurso`
--

CREATE TABLE IF NOT EXISTS `persona_carreratipodecurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidadAnhos` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `carreraId_id` int(11) NOT NULL,
  `facultadId_id` int(11) NOT NULL,
  `tipoCursoId_id` int(11) NOT NULL,
  `universidadId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_carreratipodecurso_universidadId_id_636a2b54_uniq` (`universidadId_id`,`facultadId_id`,`carreraId_id`,`tipoCursoId_id`),
  KEY `persona_carreratipodecurso_2c20c058` (`carreraId_id`),
  KEY `persona_carreratipodecurso_426de917` (`facultadId_id`),
  KEY `persona_carreratipodecurso_076ef032` (`tipoCursoId_id`),
  KEY `persona_carreratipodecurso_eefe0b43` (`universidadId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `persona_carreratipodecurso`
--

INSERT INTO `persona_carreratipodecurso` (`id`, `cantidadAnhos`, `activo`, `carreraId_id`, `facultadId_id`, `tipoCursoId_id`, `universidadId_id`) VALUES
(1, 5, 1, 1, 1, 1, 1),
(2, 5, 1, 1, 2, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_categoriadocente`
--

CREATE TABLE IF NOT EXISTS `persona_categoriadocente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `persona_categoriadocente_nombre_7fedb1fc_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `persona_categoriadocente`
--

INSERT INTO `persona_categoriadocente` (`id`, `nombre`, `activo`) VALUES
(1, 'Profesor Titular', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_departamento`
--

CREATE TABLE IF NOT EXISTS `persona_departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `persona_departamento_nombre_358459eb_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `persona_departamento`
--

INSERT INTO `persona_departamento` (`id`, `nombre`, `activo`) VALUES
(1, 'Departamento de Informática', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_estudiante`
--

CREATE TABLE IF NOT EXISTS `persona_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carneIdentidad` varchar(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `direccion` longtext NOT NULL,
  `correoElectronico` varchar(50) DEFAULT NULL,
  `fechaIngESup` date NOT NULL,
  `indiceAcademico` decimal(5,2) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `etniaId_id` int(11) DEFAULT NULL,
  `nacionalidadId_id` int(11) DEFAULT NULL,
  `sexoId_id` int(11) DEFAULT NULL,
  `ubicacionId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carneIdentidad` (`carneIdentidad`),
  UNIQUE KEY `persona_estudiante_carneIdentidad_5c94c394_uniq` (`carneIdentidad`,`nombre`,`apellidos`),
  KEY `persona_estudiante_22536050` (`etniaId_id`),
  KEY `persona_estudiante_e4a24922` (`nacionalidadId_id`),
  KEY `persona_estudiante_0ceed835` (`sexoId_id`),
  KEY `persona_estudiante_ac9dd039` (`ubicacionId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `persona_estudiante`
--

INSERT INTO `persona_estudiante` (`id`, `carneIdentidad`, `nombre`, `apellidos`, `direccion`, `correoElectronico`, `fechaIngESup`, `indiceAcademico`, `activo`, `etniaId_id`, `nacionalidadId_id`, `sexoId_id`, `ubicacionId_id`) VALUES
(1, '90012333446', 'Romualdo', 'Arrechea Hernández', '... en su casa', 'romualdo.arrechea@infonet.umcc.cu', '2015-03-22', '3.80', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_etnia`
--

CREATE TABLE IF NOT EXISTS `persona_etnia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `persona_etnia_nombre_765d747f_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `persona_etnia`
--

INSERT INTO `persona_etnia` (`id`, `nombre`, `activo`) VALUES
(1, 'Blanco(a)', 1),
(2, 'Negro(a)', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_facultad`
--

CREATE TABLE IF NOT EXISTS `persona_facultad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `siglas` varchar(10) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `persona_facultad_nombre_4ed8b680_uniq` (`nombre`,`siglas`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `persona_facultad`
--

INSERT INTO `persona_facultad` (`id`, `nombre`, `siglas`, `activo`) VALUES
(1, 'Facultad de Ciencias Económicas e Informática', 'FACEI', 1),
(2, 'Facultad de Informática', 'FI', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_gradocientifico`
--

CREATE TABLE IF NOT EXISTS `persona_gradocientifico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gradoCientifico` varchar(80) NOT NULL,
  `abreviatura` varchar(5) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gradoCientifico` (`gradoCientifico`),
  UNIQUE KEY `persona_gradocientifico_gradoCientifico_7082a2d1_uniq` (`gradoCientifico`,`abreviatura`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `persona_gradocientifico`
--

INSERT INTO `persona_gradocientifico` (`id`, `gradoCientifico`, `abreviatura`, `activo`) VALUES
(1, 'Doctor en Ciencias Técnicas', 'DrC.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_municipio`
--

CREATE TABLE IF NOT EXISTS `persona_municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_municipio_nombre_7dccd061_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `persona_municipio`
--

INSERT INTO `persona_municipio` (`id`, `nombre`, `activo`) VALUES
(2, 'Colón', 1),
(1, 'Matanzas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_nacionalidad`
--

CREATE TABLE IF NOT EXISTS `persona_nacionalidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_nacionalidad_nombre_191eae6c_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `persona_nacionalidad`
--

INSERT INTO `persona_nacionalidad` (`id`, `nombre`, `activo`) VALUES
(1, 'Cubana', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_pais`
--

CREATE TABLE IF NOT EXISTS `persona_pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_pais_nombre_2d03ee40_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `persona_pais`
--

INSERT INTO `persona_pais` (`id`, `nombre`, `activo`) VALUES
(1, 'Cuba', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_provincia`
--

CREATE TABLE IF NOT EXISTS `persona_provincia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_provincia_nombre_6b31140_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `persona_provincia`
--

INSERT INTO `persona_provincia` (`id`, `nombre`, `activo`) VALUES
(1, 'Matanzas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_sexo`
--

CREATE TABLE IF NOT EXISTS `persona_sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_sexo_nombre_22e55c71_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `persona_sexo`
--

INSERT INTO `persona_sexo` (`id`, `nombre`, `activo`) VALUES
(2, 'Femenino', 1),
(1, 'Masculino', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_tipodecurso`
--

CREATE TABLE IF NOT EXISTS `persona_tipodecurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `siglas` varchar(10) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `persona_tipodecurso_nombre_7f45a90c_uniq` (`nombre`,`siglas`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `persona_tipodecurso`
--

INSERT INTO `persona_tipodecurso` (`id`, `nombre`, `siglas`, `activo`) VALUES
(1, 'Curso Regular Diurno', 'CRD', 1),
(2, 'Curso por Encuentros', 'CE', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_trabajador`
--

CREATE TABLE IF NOT EXISTS `persona_trabajador` (
  `userId_id` int(11) NOT NULL,
  `comentario` longtext NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `categoriaDocenteId_id` int(11) DEFAULT NULL,
  `departamentoId_id` int(11) DEFAULT NULL,
  `facultadId_id` int(11) NOT NULL,
  `gradoCientifico_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId_id`),
  KEY `persona_trabajador_af7c6817` (`categoriaDocenteId_id`),
  KEY `persona_trabajador_3303ea47` (`departamentoId_id`),
  KEY `persona_trabajador_426de917` (`facultadId_id`),
  KEY `persona_trabajador_8e76155a` (`gradoCientifico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona_trabajador`
--

INSERT INTO `persona_trabajador` (`userId_id`, `comentario`, `activo`, `categoriaDocenteId_id`, `departamentoId_id`, `facultadId_id`, `gradoCientifico_id`) VALUES
(1, '', 1, NULL, 1, 1, NULL),
(2, '', 1, 1, 1, 1, 1),
(3, '', 1, NULL, NULL, 1, NULL),
(4, '', 1, 1, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_ubicacion`
--

CREATE TABLE IF NOT EXISTS `persona_ubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `municipioId_id` int(11) NOT NULL,
  `paisId_id` int(11) NOT NULL,
  `provinciaId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_ubicacion_paisId_id_3396b360_uniq` (`paisId_id`,`provinciaId_id`,`municipioId_id`),
  KEY `persona_ubicacion_3ce0f7c8` (`municipioId_id`),
  KEY `persona_ubicacion_48b13201` (`paisId_id`),
  KEY `persona_ubicacion_0bcdd96e` (`provinciaId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `persona_ubicacion`
--

INSERT INTO `persona_ubicacion` (`id`, `activo`, `municipioId_id`, `paisId_id`, `provinciaId_id`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_universidad`
--

CREATE TABLE IF NOT EXISTS `persona_universidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `siglas` varchar(10) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `persona_universidad_nombre_2fe14cc7_uniq` (`nombre`,`siglas`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `persona_universidad`
--

INSERT INTO `persona_universidad` (`id`, `nombre`, `siglas`, `activo`) VALUES
(1, 'Universidad de Matanzas', 'UM', 1),
(2, 'Universidad Agraria de La Habana', 'UNAH', 1),
(3, 'Universidad de las Ciencias Informáticas', 'UCI', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_anho`
--

CREATE TABLE IF NOT EXISTS `planestudio_anho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `abreviatura` varchar(20) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `planEstudio_anho_nombre_433df1a9_uniq` (`nombre`,`abreviatura`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `planestudio_anho`
--

INSERT INTO `planestudio_anho` (`id`, `nombre`, `abreviatura`, `activo`) VALUES
(1, 'Primer', '1er', 1),
(2, 'Segundo', '2do', 1),
(3, 'Tercer', '3er', 1),
(4, 'Cuarto', '4to', 1),
(5, 'Quinto', '5to', 1),
(6, 'Sexto', '6to', 1),
(7, 'Séptimo', '7mo', 1),
(8, 'Sin especificar', 'Sin especificar', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_anhosemestre`
--

CREATE TABLE IF NOT EXISTS `planestudio_anhosemestre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `anhoId_id` int(11) NOT NULL,
  `semestreId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `planEstudio_anhosemestre_anhoId_id_2c2af7e6_uniq` (`anhoId_id`,`semestreId_id`),
  KEY `planEstudio_anhosemestre_54e2695d` (`anhoId_id`),
  KEY `planEstudio_anhosemestre_311eda84` (`semestreId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `planestudio_anhosemestre`
--

INSERT INTO `planestudio_anhosemestre` (`id`, `activo`, `anhoId_id`, `semestreId_id`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 1, 2, 1),
(4, 1, 2, 2),
(5, 1, 3, 1),
(6, 1, 3, 2),
(7, 1, 4, 1),
(8, 1, 4, 2),
(9, 1, 5, 1),
(10, 1, 5, 2),
(11, 1, 6, 1),
(12, 1, 6, 2),
(13, 1, 8, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_asignatura`
--

CREATE TABLE IF NOT EXISTS `planestudio_asignatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `planEstudio_asignatura_nombre_3dd3b9ac_uniq` (`nombre`,`abreviatura`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

--
-- Volcado de datos para la tabla `planestudio_asignatura`
--

INSERT INTO `planestudio_asignatura` (`id`, `nombre`, `abreviatura`, `activo`) VALUES
(1, 'Matemática I', '', 1),
(2, 'Algebra Lineal', '', 1),
(3, 'Filosofía y Sociedad', '', 1),
(4, 'Fundamentos de la Informática', '', 1),
(5, 'Introducción a la Programación', '', 1),
(6, 'Educación Física I', '', 1),
(7, 'Idioma Inglés I', '', 1),
(8, 'Historia de Cuba', '', 1),
(9, 'Matemática II', '', 1),
(10, 'Matemática Discreta', '', 1),
(11, 'Economía Política del Capitalismo', '', 1),
(12, 'Idioma Inglés II', '', 1),
(13, 'Diseño y Programación Orientada a Objetos', '', 1),
(14, 'Educación Física II', '', 1),
(15, 'Introducción a la Ingeniería de Software', '', 1),
(16, 'Matemática III', '', 1),
(17, 'Economía Política de la Construcción del Socialismo', '', 1),
(18, 'Estructura de Datos I', '', 1),
(19, 'Introducción a la Inteligencia Artificial', '', 1),
(20, 'Idioma Inglés III', '', 1),
(21, 'Seguridad Nacional', '', 1),
(22, 'Educación Física III', '', 1),
(23, 'Electiva I', '', 1),
(24, 'Matemática IV', '', 1),
(25, 'Arquitectura de Computadoras', '', 1),
(26, 'Base de Datos', '', 1),
(27, 'Teoría Sociopolítica', '', 1),
(28, 'Idioma Inglés IV', '', 1),
(29, 'Defensa Nacional', '', 1),
(30, 'Educación Física IV', '', 1),
(31, 'Estructura de Datos II', '', 1),
(32, 'Física', '', 1),
(33, 'Práctica Profesional de segundo año', '', 1),
(34, 'Ingeniería de Software I', '', 1),
(35, 'Inteligencia Artificial', '', 1),
(36, 'Gestión Económica y Financiera', '', 1),
(37, 'Sistemas Operativos', '', 1),
(38, 'Gestión Organizacional', '', 1),
(39, 'Probabilidades y Estadística Matemática', '', 1),
(40, 'Redes de Computadoras', '', 1),
(41, 'Programación Web', '', 1),
(42, 'Problemas Sociales de la Ciencia y la Tecnología', '', 1),
(43, 'Componente Profesional del Trabajo de Curso de Ingeniería de Software I', '', 1),
(44, 'Patrones de Diseño y Arquitectura', '', 1),
(45, 'Práctica Profesional de tercer año', '', 1),
(46, 'Optativa I', '', 1),
(47, 'Investigación de Operaciones', '', 1),
(48, 'Ingeniería de Software II', '', 1),
(49, 'Simulación', '', 1),
(50, 'Optativa II', '', 1),
(51, 'Optativa IV', '', 1),
(52, 'Optativa III', '', 1),
(53, 'Optativa V', '', 1),
(54, 'Optativa VI', '', 1),
(55, 'Optativa VII', '', 1),
(56, 'Componente Profesional', '', 1),
(57, 'Ingeniería de Software III', '', 1),
(58, 'Componente Profesional del Trabajo de Curso de Ingeniería de Software II', '', 1),
(59, 'Práctica Profesional de cuarto año', '', 1),
(60, 'Seminario Profesional', '', 1),
(61, 'Pedagogía y Didáctica de la Educación Superior', '', 1),
(62, 'Componente Profesional del Trabajo de Curso de Seminario Profesional', '', 1),
(63, 'Optativa VIII', '', 1),
(64, 'Optativa IX', '', 1),
(65, 'Optativa X', '', 1),
(66, 'Optativa XI', '', 1),
(67, 'Componente Profesional del Trabajo de Curso de Ingeniería de Software III', '', 1),
(68, 'Trabajo de Diploma', '', 1),
(69, 'Base de Datos Avanzadas', '', 1),
(70, 'Apreciación  de la Cultura Cubana', '', 1),
(71, 'Preparación específica para Concursos ACM-ICPC', '', 1),
(72, 'Lenguajes de Programación', '', 1),
(73, 'Gestión de Software', '', 1),
(74, 'Reconocimiento de Patrones', '', 1),
(75, 'Patrones de Diseño y Arquitectura Avanzadas', '', 1),
(76, 'Diseño Gráfico por Computadoras', '', 1),
(77, 'Gestión de Proyectos', '', 1),
(78, 'Programación y Mantenimiento de Servidores', '', 1),
(79, 'Diseño de Interfaces', '', 1),
(80, 'Programación Competitiva', '', 1),
(81, 'Comercio Electrónico', '', 1),
(82, 'Instalación y Gestión de Redes', '', 1),
(83, 'Desarrollo Ágil I', '', 1),
(84, 'Procesamiento de Lenguaje Natural', '', 1),
(85, 'Aplicaciones de la Inteligencia Artificial', '', 1),
(86, 'Tecnologías Avanzadas de Programación I', '', 1),
(87, 'Tecnología para el Tratamiento de la Información', '', 1),
(88, 'Programación Descriptiva', '', 1),
(89, 'Tecnologías para el Tratamiento de la Información', '', 1),
(90, 'Tecnologías Avanzadas de Programación II', '', 1),
(91, 'Desarrollo Ágil II', '', 1),
(92, 'Redes Neuronales y Algoritmos Genéticos', '', 1),
(93, 'Formación Jurídica', '', 1),
(94, 'Ética de la profesión', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_asignaturacohorte`
--

CREATE TABLE IF NOT EXISTS `planestudio_asignaturacohorte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidadHorasS` int(11) NOT NULL,
  `cantidadHorasT` int(11) NOT NULL,
  `comentario` longtext,
  `activo` tinyint(1) NOT NULL,
  `anhoSemestreId_id` int(11) NOT NULL,
  `asignaturaId_id` int(11) NOT NULL,
  `cohorteId_id` int(11) NOT NULL,
  `curriculoId_id` int(11) DEFAULT NULL,
  `disciplinaId_id` int(11) DEFAULT NULL,
  `tipoAsignaturaId_id` int(11) DEFAULT NULL,
  `tipoEvauacionId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `planEstudio_asignaturacohorte_asignaturaId_id_395a4599_uniq` (`asignaturaId_id`,`cohorteId_id`),
  KEY `planEstudio_asignaturacohorte_264b9364` (`anhoSemestreId_id`),
  KEY `planEstudio_asignaturacohorte_5cee80ac` (`asignaturaId_id`),
  KEY `planEstudio_asignaturacohorte_68351bc3` (`cohorteId_id`),
  KEY `planEstudio_asignaturacohorte_e886e305` (`curriculoId_id`),
  KEY `planEstudio_asignaturacohorte_0dc4c5fd` (`disciplinaId_id`),
  KEY `planEstudio_asignaturacohorte_5e7a3bfc` (`tipoAsignaturaId_id`),
  KEY `planEstudio_asignaturacohorte_4ec876d1` (`tipoEvauacionId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Volcado de datos para la tabla `planestudio_asignaturacohorte`
--

INSERT INTO `planestudio_asignaturacohorte` (`id`, `cantidadHorasS`, `cantidadHorasT`, `comentario`, `activo`, `anhoSemestreId_id`, `asignaturaId_id`, `cohorteId_id`, `curriculoId_id`, `disciplinaId_id`, `tipoAsignaturaId_id`, `tipoEvauacionId_id`) VALUES
(1, 8, 80, '', 1, 1, 1, 1, NULL, NULL, NULL, NULL),
(2, 8, 80, '', 1, 1, 2, 1, NULL, NULL, NULL, NULL),
(3, 8, 80, '', 1, 1, 3, 1, NULL, NULL, NULL, NULL),
(4, 8, 80, '', 1, 1, 4, 1, NULL, NULL, NULL, NULL),
(5, 8, 80, '', 1, 1, 5, 1, NULL, NULL, NULL, NULL),
(6, 8, 80, '', 1, 1, 6, 1, NULL, NULL, NULL, NULL),
(7, 8, 80, '', 1, 1, 7, 1, NULL, NULL, NULL, NULL),
(8, 8, 80, '', 1, 1, 8, 1, NULL, NULL, NULL, NULL),
(9, 8, 80, '', 1, 7, 50, 1, NULL, NULL, NULL, NULL),
(10, 8, 80, '', 1, 2, 10, 1, NULL, NULL, NULL, NULL),
(11, 8, 80, '', 1, 2, 11, 1, NULL, NULL, NULL, NULL),
(12, 8, 80, '', 1, 2, 12, 1, NULL, NULL, NULL, NULL),
(13, 8, 80, '', 1, 2, 13, 1, NULL, NULL, NULL, NULL),
(14, 8, 80, '', 1, 2, 14, 1, NULL, NULL, NULL, NULL),
(15, 8, 80, '', 1, 2, 15, 1, NULL, NULL, NULL, NULL),
(16, 8, 80, '', 1, 3, 16, 1, NULL, NULL, NULL, NULL),
(17, 8, 80, '', 1, 3, 17, 1, NULL, NULL, NULL, NULL),
(18, 8, 80, '', 1, 3, 18, 1, NULL, NULL, NULL, NULL),
(19, 8, 80, '', 1, 3, 19, 1, NULL, NULL, NULL, NULL),
(20, 8, 80, '', 1, 3, 20, 1, NULL, NULL, NULL, NULL),
(21, 8, 80, '', 1, 3, 21, 1, NULL, NULL, NULL, NULL),
(22, 8, 80, '', 1, 3, 22, 1, NULL, NULL, NULL, NULL),
(23, 8, 80, '', 1, 3, 23, 1, NULL, NULL, NULL, NULL),
(24, 8, 80, '', 1, 4, 25, 1, NULL, NULL, NULL, NULL),
(25, 8, 80, '', 1, 4, 24, 1, NULL, NULL, NULL, NULL),
(26, 8, 80, '', 1, 4, 26, 1, NULL, NULL, NULL, NULL),
(27, 8, 80, '', 1, 4, 27, 1, NULL, NULL, NULL, NULL),
(28, 8, 80, '', 1, 4, 28, 1, NULL, NULL, NULL, NULL),
(29, 8, 80, '', 1, 4, 29, 1, NULL, NULL, NULL, NULL),
(30, 8, 80, '', 1, 4, 30, 1, NULL, NULL, NULL, NULL),
(31, 8, 80, '', 1, 4, 31, 1, NULL, NULL, NULL, NULL),
(32, 8, 80, '', 1, 4, 32, 1, NULL, NULL, NULL, NULL),
(33, 8, 80, '', 1, 4, 33, 1, NULL, NULL, NULL, NULL),
(34, 8, 80, '', 1, 5, 34, 1, NULL, NULL, NULL, NULL),
(35, 8, 80, '', 1, 5, 35, 1, NULL, NULL, NULL, NULL),
(36, 8, 80, '', 1, 5, 36, 1, NULL, NULL, NULL, NULL),
(37, 8, 80, '', 1, 5, 37, 1, NULL, NULL, NULL, NULL),
(38, 8, 80, '', 1, 5, 43, 1, NULL, NULL, NULL, NULL),
(39, 8, 80, '', 1, 5, 44, 1, NULL, NULL, NULL, NULL),
(40, 8, 80, '', 1, 6, 38, 1, NULL, NULL, NULL, NULL),
(41, 8, 80, '', 1, 6, 39, 1, NULL, NULL, NULL, NULL),
(42, 8, 80, '', 1, 6, 40, 1, NULL, NULL, NULL, NULL),
(43, 8, 80, '', 1, 6, 41, 1, NULL, NULL, NULL, NULL),
(44, 8, 80, '', 1, 6, 42, 1, NULL, NULL, NULL, NULL),
(45, 8, 80, '', 1, 6, 46, 1, NULL, NULL, NULL, NULL),
(46, 8, 80, '', 1, 6, 45, 1, NULL, NULL, NULL, NULL),
(47, 8, 80, '', 1, 7, 47, 1, NULL, NULL, NULL, NULL),
(48, 8, 80, '', 1, 7, 48, 1, NULL, NULL, NULL, NULL),
(49, 8, 80, '', 1, 7, 52, 1, NULL, NULL, NULL, NULL),
(50, 8, 80, '', 1, 7, 51, 1, NULL, NULL, NULL, NULL),
(51, 8, 80, '', 1, 7, 58, 1, NULL, NULL, NULL, NULL),
(52, 8, 80, '', 1, 8, 49, 1, NULL, NULL, NULL, NULL),
(53, 8, 80, '', 1, 8, 53, 1, NULL, NULL, NULL, NULL),
(54, 8, 80, '', 1, 8, 54, 1, NULL, NULL, NULL, NULL),
(55, 8, 80, '', 1, 8, 55, 1, NULL, NULL, NULL, NULL),
(56, 8, 80, '', 1, 8, 57, 1, NULL, NULL, NULL, NULL),
(57, 8, 80, '', 1, 8, 67, 1, NULL, NULL, NULL, NULL),
(58, 8, 80, '', 1, 8, 59, 1, NULL, NULL, NULL, NULL),
(59, 8, 80, '', 1, 9, 60, 1, NULL, NULL, NULL, NULL),
(60, 8, 80, '', 1, 9, 61, 1, NULL, NULL, NULL, NULL),
(61, 8, 80, '', 1, 9, 62, 1, NULL, NULL, NULL, NULL),
(62, 8, 80, '', 1, 9, 63, 1, NULL, NULL, NULL, NULL),
(63, 8, 80, '', 1, 9, 64, 1, NULL, NULL, NULL, NULL),
(64, 8, 80, '', 1, 9, 65, 1, NULL, NULL, NULL, NULL),
(65, 8, 80, '', 1, 9, 66, 1, NULL, NULL, NULL, NULL),
(66, 8, 80, '', 1, 10, 68, 1, NULL, NULL, NULL, NULL),
(67, 8, 80, '', 1, 13, 34, 2, NULL, NULL, NULL, NULL),
(68, 8, 80, '', 1, 4, 33, 2, NULL, NULL, NULL, NULL),
(69, 8, 80, '', 1, 1, 69, 2, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_asignaturaoptativaelectiva`
--

CREATE TABLE IF NOT EXISTS `planestudio_asignaturaoptativaelectiva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activo` tinyint(1) NOT NULL,
  `asignaturaCohorteId_id` int(11) NOT NULL,
  `asignaturaId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `planEstudio_asignaturaoptativaelec_asignaturaId_id_4c517772_uniq` (`asignaturaId_id`,`asignaturaCohorteId_id`),
  KEY `planEstudio_asignaturaoptativaelectiva_42f3272d` (`asignaturaCohorteId_id`),
  KEY `planEstudio_asignaturaoptativaelectiva_5cee80ac` (`asignaturaId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `planestudio_asignaturaoptativaelectiva`
--

INSERT INTO `planestudio_asignaturaoptativaelectiva` (`id`, `activo`, `asignaturaCohorteId_id`, `asignaturaId_id`) VALUES
(1, 1, 23, 70),
(2, 1, 23, 94),
(3, 1, 23, 71),
(4, 1, 23, 93),
(5, 1, 45, 72),
(6, 1, 45, 73),
(7, 1, 45, 74),
(8, 1, 9, 75),
(9, 1, 9, 72),
(10, 1, 9, 76),
(11, 1, 49, 77),
(12, 1, 49, 78),
(13, 1, 49, 79),
(14, 1, 50, 80),
(15, 1, 50, 81),
(16, 1, 50, 82),
(17, 1, 53, 83),
(18, 1, 53, 84),
(19, 1, 53, 85),
(20, 1, 54, 86),
(21, 1, 54, 74),
(22, 1, 54, 76),
(23, 1, 55, 75),
(24, 1, 55, 87),
(25, 1, 55, 88),
(26, 1, 62, 87),
(27, 1, 62, 77),
(28, 1, 62, 78),
(29, 1, 63, 80),
(30, 1, 63, 81),
(31, 1, 63, 82),
(32, 1, 64, 90),
(33, 1, 64, 85),
(34, 1, 64, 91),
(35, 1, 65, 82),
(36, 1, 65, 92),
(37, 1, 65, 69);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_asignaturavencida`
--

CREATE TABLE IF NOT EXISTS `planestudio_asignaturavencida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` longtext,
  `activo` tinyint(1) NOT NULL,
  `asignaturaCohorteId_id` int(11) DEFAULT NULL,
  `carreraEstudianteId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `planEstudio_asignaturavenci_carreraEstudianteId_id_17efff74_uniq` (`carreraEstudianteId_id`,`asignaturaCohorteId_id`),
  KEY `planEstudio_asignaturavencida_42f3272d` (`asignaturaCohorteId_id`),
  KEY `planEstudio_asignaturavencida_c3de748f` (`carreraEstudianteId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `planestudio_asignaturavencida`
--

INSERT INTO `planestudio_asignaturavencida` (`id`, `comentario`, `activo`, `asignaturaCohorteId_id`, `carreraEstudianteId_id`) VALUES
(1, '', 1, 67, 1),
(2, '', 1, 68, 1),
(3, '', 1, 69, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_carreraestudiante`
--

CREATE TABLE IF NOT EXISTS `planestudio_carreraestudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fechaIngreso` date NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `cohorteId_id` int(11) NOT NULL,
  `estudianteId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `planEstudio_carreraestudiante_cohorteId_id_3293a642_uniq` (`cohorteId_id`,`estudianteId_id`),
  KEY `planEstudio_carreraestudiante_68351bc3` (`cohorteId_id`),
  KEY `planEstudio_carreraestudiante_543b2924` (`estudianteId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `planestudio_carreraestudiante`
--

INSERT INTO `planestudio_carreraestudiante` (`id`, `fechaIngreso`, `activo`, `cohorteId_id`, `estudianteId_id`) VALUES
(1, '2015-03-22', 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_cohorte`
--

CREATE TABLE IF NOT EXISTS `planestudio_cohorte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` longtext,
  `activo` tinyint(1) NOT NULL,
  `carreraTipoCursoId_id` int(11) NOT NULL,
  `cursoId_id` int(11) NOT NULL,
  `planEstudioId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `planEstudio_cohorte_carreraTipoCursoId_id_5efcbefc_uniq` (`carreraTipoCursoId_id`,`planEstudioId_id`,`cursoId_id`),
  KEY `planEstudio_cohorte_c4374ef9` (`carreraTipoCursoId_id`),
  KEY `planEstudio_cohorte_e4006dc2` (`cursoId_id`),
  KEY `planEstudio_cohorte_427afb71` (`planEstudioId_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `planestudio_cohorte`
--

INSERT INTO `planestudio_cohorte` (`id`, `comentario`, `activo`, `carreraTipoCursoId_id`, `cursoId_id`, `planEstudioId_id`) VALUES
(1, 'este es el cohorte de abel', 1, 1, 1, 1),
(2, 'este es el cohorte de romualdo', 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_curriculo`
--

CREATE TABLE IF NOT EXISTS `planestudio_curriculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `planEstudio_curriculo_nombre_3a764676_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `planestudio_curriculo`
--

INSERT INTO `planestudio_curriculo` (`id`, `nombre`, `activo`) VALUES
(2, 'Base', 1),
(3, 'Optativo', 1),
(1, 'Propio', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_curso`
--

CREATE TABLE IF NOT EXISTS `planestudio_curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `planEstudio_curso_nombre_71bdd5f_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `planestudio_curso`
--

INSERT INTO `planestudio_curso` (`id`, `nombre`, `activo`) VALUES
(1, '2010-2011', 1),
(2, '2011-2012', 1),
(3, '2012-2013', 1),
(4, '2013-2014', 1),
(5, '2014-2015', 1),
(6, '2015-2016', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_disciplina`
--

CREATE TABLE IF NOT EXISTS `planestudio_disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `planEstudio_disciplina_nombre_5d014b1_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `planestudio_disciplina`
--

INSERT INTO `planestudio_disciplina` (`id`, `nombre`, `activo`) VALUES
(8, 'Administración', 1),
(6, 'Fïsica', 1),
(5, 'Idioma Extranjero', 1),
(4, 'Ingeniería de Software', 1),
(2, 'Marxismo Leninismo', 1),
(1, 'Matemática', 1),
(7, 'Preparación Física', 1),
(3, 'Programación', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_planestudio`
--

CREATE TABLE IF NOT EXISTS `planestudio_planestudio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `cantidadPeriodos` int(11) NOT NULL,
  `comentarios` longtext NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `planEstudio_planestudio_nombre_16f1e8b0_uniq` (`nombre`,`cantidadPeriodos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `planestudio_planestudio`
--

INSERT INTO `planestudio_planestudio` (`id`, `nombre`, `cantidadPeriodos`, `comentarios`, `activo`) VALUES
(1, 'Plan D', 10, 'Este es el plan de estudios vigente', 1),
(2, 'Plan C', 10, 'Este está en desuso', 1),
(3, 'Plan E', 10, 'Este aún no se ha empezado a aplicar', 1),
(4, 'plan prueba11', 1, '123', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_semestre`
--

CREATE TABLE IF NOT EXISTS `planestudio_semestre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `abreviatura` varchar(20) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `planEstudio_semestre_nombre_5345bb3_uniq` (`nombre`,`abreviatura`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `planestudio_semestre`
--

INSERT INTO `planestudio_semestre` (`id`, `nombre`, `abreviatura`, `activo`) VALUES
(1, 'Primer', '1er - S', 1),
(2, 'Segundo', '2do - S', 1),
(3, 'Tercer', '3er - S', 1),
(4, 'Sin especificar', 'Sin especificar', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_tipoasignatura`
--

CREATE TABLE IF NOT EXISTS `planestudio_tipoasignatura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `planEstudio_tipoasignatura_nombre_606f813f_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `planestudio_tipoasignatura`
--

INSERT INTO `planestudio_tipoasignatura` (`id`, `nombre`, `activo`) VALUES
(1, 'Ordinaria', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudio_tipoevaluacion`
--

CREATE TABLE IF NOT EXISTS `planestudio_tipoevaluacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `planEstudio_tipoevaluacion_nombre_436fd871_uniq` (`nombre`,`activo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `planestudio_tipoevaluacion`
--

INSERT INTO `planestudio_tipoevaluacion` (`id`, `nombre`, `activo`) VALUES
(1, 'Examen final', 1),
(2, 'Proyecto de Curso', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `watson_searchentry`
--

CREATE TABLE IF NOT EXISTS `watson_searchentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engine_slug` varchar(200) NOT NULL,
  `object_id` longtext NOT NULL,
  `object_id_int` int(11) DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `description` longtext NOT NULL,
  `content` longtext NOT NULL,
  `url` varchar(1000) NOT NULL,
  `meta_encoded` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `watson_searchentry_14f8682a` (`engine_slug`),
  KEY `watson_searchentry_0c9ba3a3` (`object_id_int`),
  KEY `watson_searchentry_417f1b1c` (`content_type_id`),
  FULLTEXT KEY `watson_searchentry_fulltext` (`title`,`description`,`content`),
  FULLTEXT KEY `watson_searchentry_title` (`title`),
  FULLTEXT KEY `watson_searchentry_description` (`description`),
  FULLTEXT KEY `watson_searchentry_content` (`content`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=363 ;

--
-- Volcado de datos para la tabla `watson_searchentry`
--

INSERT INTO `watson_searchentry` (`id`, `engine_slug`, `object_id`, `object_id_int`, `title`, `description`, `content`, `url`, `meta_encoded`, `content_type_id`) VALUES
(1, 'default', '1', 1, 'Expediente académico', '', 'Expediente académico', '', '{}', 9),
(2, 'default', '1', 1, 'Traslado', '', 'Traslado', '', '{}', 8),
(3, 'default', '1', 1, 'Pendiente', '', 'Pendiente', '', '{}', 10),
(4, 'default', '2', 2, 'Abonada', '', 'Abonada', '', '{}', 10),
(5, 'default', '3', 3, 'Convalidada', '', 'Convalidada', '', '{}', 10),
(6, 'default', '1', 1, 'Facultad de Ciencias Económicas e Informática', '', 'Facultad de Ciencias Económicas e Informática FACEI', '', '{}', 17),
(7, 'default', '2', 2, 'Julio A. Telot González', '', '', '', '{}', 32),
(8, 'default', '3', 3, '', '', '', '', '{}', 32),
(9, 'default', '4', 4, 'Roberto A. Frías Jiménez', '', '', '', '{}', 32),
(10, 'default', '1', 1, 'Ingeniería Informática', '', 'Ingeniería Informática Ing. Info', '', '{}', 18),
(11, 'default', '1', 1, 'Profesor Titular', '', 'Profesor Titular', '', '{}', 30),
(12, 'default', '1', 1, 'Departamento de Informática', '', 'Departamento de Informática', '', '{}', 29),
(13, 'default', '1', 1, 'Blanco(a)', '', 'Blanco(a)', '', '{}', 27),
(14, 'default', '2', 2, 'Negro(a)', '', 'Negro(a)', '', '{}', 27),
(15, 'default', '1', 1, 'Doctor en Ciencias Técnicas (DrC.)', '', 'Doctor en Ciencias Técnicas DrC.', '', '{}', 28),
(16, 'default', '1', 1, 'Matanzas', '', 'Matanzas', '', '{}', 23),
(17, 'default', '2', 2, 'Colón', '', 'Colón', '', '{}', 23),
(18, 'default', '1', 1, 'Cubana', '', 'Cubana', '', '{}', 25),
(19, 'default', '1', 1, 'Cuba', '', 'Cuba', '', '{}', 21),
(20, 'default', '1', 1, 'Matanzas', '', 'Matanzas', '', '{}', 22),
(21, 'default', '1', 1, 'Masculino', '', 'Masculino', '', '{}', 26),
(22, 'default', '1', 1, 'Curso Regular Diurno (CRD)', '', 'Curso Regular Diurno CRD', '', '{}', 19),
(23, 'default', '2', 2, 'Curso por Encuentros (CE)', '', 'Curso por Encuentros CE', '', '{}', 19),
(24, 'default', '1', 1, 'Matanzas, Matanzas, Cuba', '', '', '', '{}', 24),
(25, 'default', '2', 2, 'Colón, Matanzas, Cuba', '', '', '', '{}', 24),
(26, 'default', '1', 1, 'UM', '', 'Universidad de Matanzas UM', '', '{}', 16),
(27, 'default', '2', 2, 'UNAH', '', 'Universidad Agraria de La Habana UNAH', '', '{}', 16),
(28, 'default', '3', 3, 'UCI', '', 'Universidad de las Ciencias Informáticas UCI', '', '{}', 16),
(29, 'default', '1', 1, '1er', '', 'Primer 1er', '', '{}', 34),
(30, 'default', '2', 2, '2do', '', 'Segundo 2do', '', '{}', 34),
(31, 'default', '3', 3, '3er', '', 'Tercer 3er', '', '{}', 34),
(32, 'default', '4', 4, '4to', '', 'Cuarto 4to', '', '{}', 34),
(33, 'default', '5', 5, '5to', '', 'Quinto 5to', '', '{}', 34),
(34, 'default', '6', 6, '6to', '', 'Sexto 6to', '', '{}', 34),
(35, 'default', '7', 7, '7mo', '', 'Séptimo 7mo', '', '{}', 34),
(36, 'default', '8', 8, 'Sin especificar', '', 'Sin especificar Sin especificar', '', '{}', 34),
(37, 'default', '1', 1, 'Primer', '', 'Primer 1er - S', '', '{}', 35),
(38, 'default', '2', 2, 'Segundo', '', 'Segundo 2do - S', '', '{}', 35),
(39, 'default', '3', 3, 'Tercer', '', 'Tercer 3er - S', '', '{}', 35),
(40, 'default', '4', 4, 'Sin especificar', '', 'Sin especificar Sin especificar', '', '{}', 35),
(41, 'default', '1', 1, '1er año / Primer semestre', '', '', '', '{}', 36),
(42, 'default', '2', 2, '1er año / Segundo semestre', '', '', '', '{}', 36),
(43, 'default', '3', 3, '2do año / Primer semestre', '', '', '', '{}', 36),
(44, 'default', '4', 4, '2do año / Segundo semestre', '', '', '', '{}', 36),
(45, 'default', '5', 5, '3er año / Primer semestre', '', '', '', '{}', 36),
(46, 'default', '6', 6, '3er año / Segundo semestre', '', '', '', '{}', 36),
(47, 'default', '7', 7, '4to año / Primer semestre', '', '', '', '{}', 36),
(48, 'default', '8', 8, '4to año / Segundo semestre', '', '', '', '{}', 36),
(49, 'default', '9', 9, '5to año / Primer semestre', '', '', '', '{}', 36),
(50, 'default', '10', 10, '5to año / Segundo semestre', '', '', '', '{}', 36),
(51, 'default', '11', 11, '6to año / Primer semestre', '', '', '', '{}', 36),
(52, 'default', '12', 12, '6to año / Segundo semestre', '', '', '', '{}', 36),
(53, 'default', '13', 13, 'Sin especificar año / Sin especificar semestre', '', '', '', '{}', 36),
(54, 'default', '1', 1, 'Plan D', '', 'Plan D Este es el plan de estudios vigente', '/planEstudio/detalle/1/', '{}', 37),
(55, 'default', '2', 2, 'Plan C', '', 'Plan C Este está en desuso', '/planEstudio/detalle/2/', '{}', 37),
(56, 'default', '3', 3, 'Plan E', '', 'Plan E Este aún no se ha empezado a aplicar', '/planEstudio/detalle/3/', '{}', 37),
(57, 'default', '1', 1, 'Matemática', '', 'Matemática', '', '{}', 40),
(58, 'default', '2', 2, 'Marxismo Leninismo', '', 'Marxismo Leninismo', '', '{}', 40),
(59, 'default', '3', 3, 'Programación', '', 'Programación', '', '{}', 40),
(60, 'default', '4', 4, 'Ingeniería de Software', '', 'Ingeniería de Software', '', '{}', 40),
(61, 'default', '5', 5, 'Idioma Extranjero', '', 'Idioma Extranjero', '', '{}', 40),
(62, 'default', '6', 6, 'Fïsica', '', 'Fïsica', '', '{}', 40),
(63, 'default', '7', 7, 'Preparación Física', '', 'Preparación Física', '', '{}', 40),
(64, 'default', '8', 8, 'Administración', '', 'Administración', '', '{}', 40),
(65, 'default', '1', 1, '2010-2011', '', '2010-2011', '', '{}', 33),
(66, 'default', '2', 2, '2011-2012', '', '2011-2012', '', '{}', 33),
(67, 'default', '3', 3, '2012-2013', '', '2012-2013', '', '{}', 33),
(68, 'default', '4', 4, '2013-2014', '', '2013-2014', '', '{}', 33),
(69, 'default', '5', 5, '2014-2015', '', '2014-2015', '', '{}', 33),
(70, 'default', '6', 6, '2015-2016', '', '2015-2016', '', '{}', 33),
(71, 'default', '1', 1, 'Propio', '', 'Propio', '', '{}', 41),
(72, 'default', '2', 2, 'Base', '', 'Base', '', '{}', 41),
(73, 'default', '3', 3, 'Optativo', '', 'Optativo', '', '{}', 41),
(74, 'default', '1', 1, 'Ordinaria', '', 'Ordinaria', '', '{}', 39),
(75, 'default', '1', 1, 'Examen final', '', 'Examen final', '', '{}', 42),
(76, 'default', '2', 2, 'Proyecto de Curso', '', 'Proyecto de Curso', '', '{}', 42),
(77, 'default', '1', 1, 'Matemática I', '', 'Matemática I ', '', '{}', 38),
(78, 'default', '2', 2, 'Algebra Lineal', '', 'Algebra Lineal ', '', '{}', 38),
(79, 'default', '3', 3, 'Filosofía y Sociedad', '', 'Filosofía y Sociedad ', '', '{}', 38),
(80, 'default', '4', 4, 'Fundamentos de la Informática', '', 'Fundamentos de la Informática ', '', '{}', 38),
(81, 'default', '5', 5, 'Introducción a la Programación', '', 'Introducción a la Programación ', '', '{}', 38),
(82, 'default', '6', 6, 'Educación Física I', '', 'Educación Física I ', '', '{}', 38),
(83, 'default', '7', 7, 'Idioma Inglés I', '', 'Idioma Inglés I ', '', '{}', 38),
(84, 'default', '8', 8, 'Historia de Cuba', '', 'Historia de Cuba ', '', '{}', 38),
(85, 'default', '9', 9, 'Matemática II', '', 'Matemática II ', '', '{}', 38),
(86, 'default', '10', 10, 'Matemática Discreta', '', 'Matemática Discreta ', '', '{}', 38),
(87, 'default', '11', 11, 'Economía Política del Capitalismo', '', 'Economía Política del Capitalismo ', '', '{}', 38),
(88, 'default', '12', 12, 'Idioma Inglés II', '', 'Idioma Inglés II ', '', '{}', 38),
(89, 'default', '13', 13, 'Diseño y Programación Orientada a Objetos', '', 'Diseño y Programación Orientada a Objetos ', '', '{}', 38),
(90, 'default', '14', 14, 'Educación Física II', '', 'Educación Física II ', '', '{}', 38),
(91, 'default', '15', 15, 'Introducción a la Ingeniería de Software', '', 'Introducción a la Ingeniería de Software ', '', '{}', 38),
(92, 'default', '16', 16, 'Matemática III', '', 'Matemática III ', '', '{}', 38),
(93, 'default', '17', 17, 'Economía Política de la Construcción del Socialismo', '', 'Economía Política de la Construcción del Socialismo ', '', '{}', 38),
(94, 'default', '18', 18, 'Estructura de Datos I', '', 'Estructura de Datos I ', '', '{}', 38),
(95, 'default', '19', 19, 'Introducción a la Inteligencia Artificial', '', 'Introducción a la Inteligencia Artificial ', '', '{}', 38),
(96, 'default', '20', 20, 'Idioma Inglés III', '', 'Idioma Inglés III ', '', '{}', 38),
(97, 'default', '21', 21, 'Seguridad Nacional', '', 'Seguridad Nacional ', '', '{}', 38),
(98, 'default', '22', 22, 'Educación Física III', '', 'Educación Física III ', '', '{}', 38),
(99, 'default', '23', 23, 'Electiva I', '', 'Electiva I ', '', '{}', 38),
(100, 'default', '24', 24, 'Matemática IV', '', 'Matemática IV ', '', '{}', 38),
(101, 'default', '25', 25, 'Arquitectura de Computadoras', '', 'Arquitectura de Computadoras ', '', '{}', 38),
(102, 'default', '26', 26, 'Base de Datos', '', 'Base de Datos ', '', '{}', 38),
(103, 'default', '27', 27, 'Teoría Sociopolítica', '', 'Teoría Sociopolítica ', '', '{}', 38),
(104, 'default', '28', 28, 'Idioma Inglés IV', '', 'Idioma Inglés IV ', '', '{}', 38),
(105, 'default', '29', 29, 'Defensa Nacional', '', 'Defensa Nacional ', '', '{}', 38),
(106, 'default', '30', 30, 'Educación Física IV', '', 'Educación Física IV ', '', '{}', 38),
(107, 'default', '31', 31, 'Estructura de Datos II', '', 'Estructura de Datos II ', '', '{}', 38),
(108, 'default', '32', 32, 'Física', '', 'Física ', '', '{}', 38),
(109, 'default', '33', 33, 'Práctica Profesional de segundo año', '', 'Práctica Profesional de segundo año ', '', '{}', 38),
(110, 'default', '34', 34, 'Ingeniería de Software I', '', 'Ingeniería de Software I ', '', '{}', 38),
(111, 'default', '35', 35, 'Inteligencia Artificial', '', 'Inteligencia Artificial ', '', '{}', 38),
(112, 'default', '36', 36, 'Gestión Económica y Financiera', '', 'Gestión Económica y Financiera ', '', '{}', 38),
(113, 'default', '37', 37, 'Sistemas Operativos', '', 'Sistemas Operativos ', '', '{}', 38),
(114, 'default', '38', 38, 'Gestión Organizacional', '', 'Gestión Organizacional ', '', '{}', 38),
(115, 'default', '39', 39, 'Probabilidades y Estadística Matemática', '', 'Probabilidades y Estadística Matemática ', '', '{}', 38),
(116, 'default', '40', 40, 'Redes de Computadoras', '', 'Redes de Computadoras ', '', '{}', 38),
(117, 'default', '41', 41, 'Programación Web', '', 'Programación Web ', '', '{}', 38),
(118, 'default', '42', 42, 'Problemas Sociales de la Ciencia y la Tecnología', '', 'Problemas Sociales de la Ciencia y la Tecnología ', '', '{}', 38),
(119, 'default', '43', 43, 'Componente Profesional del Trabajo de Curso de Ingeniería de Software I', '', 'Componente Profesional del Trabajo de Curso de Ingeniería de Software I ', '', '{}', 38),
(120, 'default', '44', 44, 'Patrones de Diseño y Arquitectura', '', 'Patrones de Diseño y Arquitectura ', '', '{}', 38),
(121, 'default', '45', 45, 'Práctica Profesional de tercer año', '', 'Práctica Profesional de tercer año ', '', '{}', 38),
(122, 'default', '46', 46, 'Optativa I', '', 'Optativa I ', '', '{}', 38),
(123, 'default', '47', 47, 'Investigación de Operaciones', '', 'Investigación de Operaciones ', '', '{}', 38),
(124, 'default', '48', 48, 'Ingeniería de Software II', '', 'Ingeniería de Software II ', '', '{}', 38),
(125, 'default', '49', 49, 'Simulación', '', 'Simulación ', '', '{}', 38),
(126, 'default', '50', 50, 'Optativa II', '', 'Optativa II ', '', '{}', 38),
(127, 'default', '51', 51, 'Optativa IV', '', 'Optativa IV ', '', '{}', 38),
(128, 'default', '52', 52, 'Optativa III', '', 'Optativa III ', '', '{}', 38),
(129, 'default', '53', 53, 'Optativa V', '', 'Optativa V ', '', '{}', 38),
(130, 'default', '54', 54, 'Optativa VI', '', 'Optativa VI ', '', '{}', 38),
(131, 'default', '55', 55, 'Optativa VII', '', 'Optativa VII ', '', '{}', 38),
(132, 'default', '56', 56, 'Componente Profesional', '', 'Componente Profesional ', '', '{}', 38),
(133, 'default', '57', 57, 'Ingeniería de Software III', '', 'Ingeniería de Software III ', '', '{}', 38),
(134, 'default', '58', 58, 'Componente Profesional del Trabajo de Curso de Ingeniería de Software II', '', 'Componente Profesional del Trabajo de Curso de Ingeniería de Software II ', '', '{}', 38),
(135, 'default', '59', 59, 'Práctica Profesional de cuarto año', '', 'Práctica Profesional de cuarto año ', '', '{}', 38),
(136, 'default', '60', 60, 'Seminario Profesional', '', 'Seminario Profesional ', '', '{}', 38),
(137, 'default', '61', 61, 'Pedagogía y Didáctica de la Educación Superior', '', 'Pedagogía y Didáctica de la Educación Superior ', '', '{}', 38),
(138, 'default', '62', 62, 'Componente Profesional del Trabajo de Curso de Seminario Profesional', '', 'Componente Profesional del Trabajo de Curso de Seminario Profesional ', '', '{}', 38),
(139, 'default', '63', 63, 'Optativa VIII', '', 'Optativa VIII ', '', '{}', 38),
(140, 'default', '64', 64, 'Optativa IX', '', 'Optativa IX ', '', '{}', 38),
(141, 'default', '65', 65, 'Optativa X', '', 'Optativa X ', '', '{}', 38),
(142, 'default', '66', 66, 'Optativa XI', '', 'Optativa XI ', '', '{}', 38),
(143, 'default', '67', 67, 'Componente Profesional del Trabajo de Curso de Ingeniería de Software III', '', 'Componente Profesional del Trabajo de Curso de Ingeniería de Software III ', '', '{}', 38),
(144, 'default', '68', 68, 'Trabajo de Diploma', '', 'Trabajo de Diploma ', '', '{}', 38),
(145, 'default', '69', 69, 'Base de Datos Avanzadas', '', 'Base de Datos Avanzadas ', '', '{}', 38),
(146, 'default', '70', 70, 'Apreciación  de la Cultura Cubana', '', 'Apreciación  de la Cultura Cubana ', '', '{}', 38),
(147, 'default', '71', 71, 'Preparación específica para Concursos ACM-ICPC', '', 'Preparación específica para Concursos ACM-ICPC ', '', '{}', 38),
(148, 'default', '72', 72, 'Lenguajes de Programación', '', 'Lenguajes de Programación ', '', '{}', 38),
(149, 'default', '73', 73, 'Gestión de Software', '', 'Gestión de Software ', '', '{}', 38),
(150, 'default', '74', 74, 'Reconocimiento de Patrones', '', 'Reconocimiento de Patrones ', '', '{}', 38),
(151, 'default', '75', 75, 'Patrones de Diseño y Arquitectura Avanzadas', '', 'Patrones de Diseño y Arquitectura Avanzadas ', '', '{}', 38),
(152, 'default', '76', 76, 'Diseño Gráfico por Computadoras', '', 'Diseño Gráfico por Computadoras ', '', '{}', 38),
(153, 'default', '77', 77, 'Gestión de Proyectos', '', 'Gestión de Proyectos ', '', '{}', 38),
(154, 'default', '78', 78, 'Programación y Mantenimiento de Servidores', '', 'Programación y Mantenimiento de Servidores ', '', '{}', 38),
(155, 'default', '79', 79, 'Diseño de Interfaces', '', 'Diseño de Interfaces ', '', '{}', 38),
(156, 'default', '80', 80, 'Programación Competitiva', '', 'Programación Competitiva ', '', '{}', 38),
(157, 'default', '81', 81, 'Comercio Electrónico', '', 'Comercio Electrónico ', '', '{}', 38),
(158, 'default', '82', 82, 'Instalación y Gestión de Redes', '', 'Instalación y Gestión de Redes ', '', '{}', 38),
(159, 'default', '83', 83, 'Desarrollo Ágil I', '', 'Desarrollo Ágil I ', '', '{}', 38),
(160, 'default', '84', 84, 'Procesamiento de Lenguaje Natural', '', 'Procesamiento de Lenguaje Natural ', '', '{}', 38),
(161, 'default', '85', 85, 'Aplicaciones de la Inteligencia Artificial', '', 'Aplicaciones de la Inteligencia Artificial ', '', '{}', 38),
(162, 'default', '86', 86, 'Tecnologías Avanzadas de Programación I', '', 'Tecnologías Avanzadas de Programación I ', '', '{}', 38),
(163, 'default', '87', 87, 'Tecnología para el Tratamiento de la Información', '', 'Tecnología para el Tratamiento de la Información ', '', '{}', 38),
(164, 'default', '88', 88, 'Programación Descriptiva', '', 'Programación Descriptiva ', '', '{}', 38),
(165, 'default', '89', 89, 'Tecnologías para el Tratamiento de la Información', '', 'Tecnologías para el Tratamiento de la Información ', '', '{}', 38),
(166, 'default', '90', 90, 'Tecnologías Avanzadas de Programación II', '', 'Tecnologías Avanzadas de Programación II ', '', '{}', 38),
(167, 'default', '91', 91, 'Desarrollo Ágil II', '', 'Desarrollo Ágil II ', '', '{}', 38),
(168, 'default', '92', 92, 'Redes Neuronales y Algoritmos Genéticos', '', 'Redes Neuronales y Algoritmos Genéticos ', '', '{}', 38),
(169, 'default', '93', 93, 'Formación Jurídica', '', 'Formación Jurídica ', '', '{}', 38),
(170, 'default', '94', 94, 'Ética de la profesión', '', 'Ética de la profesión ', '', '{}', 38),
(171, 'default', '1', 1, 'Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD) ', '', '', '', '{}', 20),
(172, 'default', '1', 1, 'Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011]', '', 'este es el cohorte de abel', '/planEstudio/cohorte/detalle/1/', '{}', 43),
(173, 'default', '2', 2, 'Facultad de Informática', '', 'Facultad de Informática FI', '', '{}', 17),
(174, 'default', '2', 2, 'Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD) ', '', '', '', '{}', 20),
(175, 'default', '2', 2, 'Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]', '', 'este es el cohorte de romualdo', '/planEstudio/cohorte/detalle/2/', '{}', 43),
(176, 'default', '1', 1, 'Matemática I - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(177, 'default', '2', 2, 'Algebra Lineal - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(178, 'default', '3', 3, 'Filosofía y Sociedad - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(179, 'default', '4', 4, 'Fundamentos de la Informática - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(180, 'default', '5', 5, 'Introducción a la Programación - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(181, 'default', '6', 6, 'Educación Física I - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(182, 'default', '7', 7, 'Idioma Inglés I - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(183, 'default', '8', 8, 'Historia de Cuba - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(184, 'default', '9', 9, 'Optativa II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(185, 'default', '10', 10, 'Matemática Discreta - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(186, 'default', '11', 11, 'Economía Política del Capitalismo - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(187, 'default', '12', 12, 'Idioma Inglés II - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(188, 'default', '13', 13, 'Diseño y Programación Orientada a Objetos - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(189, 'default', '14', 14, 'Educación Física II - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(190, 'default', '15', 15, 'Introducción a la Ingeniería de Software - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(191, 'default', '16', 16, 'Matemática III - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(192, 'default', '17', 17, 'Economía Política de la Construcción del Socialismo - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(193, 'default', '18', 18, 'Estructura de Datos I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(194, 'default', '19', 19, 'Introducción a la Inteligencia Artificial - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(195, 'default', '20', 20, 'Idioma Inglés III - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(196, 'default', '21', 21, 'Seguridad Nacional - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(197, 'default', '22', 22, 'Educación Física III - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(198, 'default', '23', 23, 'Electiva I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(199, 'default', '24', 24, 'Arquitectura de Computadoras - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(200, 'default', '25', 25, 'Matemática IV - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(201, 'default', '26', 26, 'Base de Datos - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(202, 'default', '27', 27, 'Teoría Sociopolítica - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(203, 'default', '28', 28, 'Idioma Inglés IV - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(204, 'default', '29', 29, 'Defensa Nacional - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(205, 'default', '30', 30, 'Educación Física IV - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(206, 'default', '31', 31, 'Estructura de Datos II - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(207, 'default', '32', 32, 'Física - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(208, 'default', '33', 33, 'Práctica Profesional de segundo año - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(209, 'default', '1', 1, 'Apreciación  de la Cultura Cubana => Electiva I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(210, 'default', '2', 2, 'Ética de la profesión => Electiva I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(211, 'default', '3', 3, 'Preparación específica para Concursos ACM-ICPC => Electiva I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(212, 'default', '4', 4, 'Formación Jurídica => Electiva I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(213, 'default', '34', 34, 'Ingeniería de Software I - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(214, 'default', '35', 35, 'Inteligencia Artificial - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(215, 'default', '36', 36, 'Gestión Económica y Financiera - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(216, 'default', '37', 37, 'Sistemas Operativos - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(217, 'default', '38', 38, 'Componente Profesional del Trabajo de Curso de Ingeniería de Software I - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(218, 'default', '39', 39, 'Patrones de Diseño y Arquitectura - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(219, 'default', '40', 40, 'Gestión Organizacional - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(220, 'default', '41', 41, 'Probabilidades y Estadística Matemática - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(221, 'default', '42', 42, 'Redes de Computadoras - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(222, 'default', '43', 43, 'Programación Web - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(223, 'default', '44', 44, 'Problemas Sociales de la Ciencia y la Tecnología - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(224, 'default', '45', 45, 'Optativa I - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(225, 'default', '46', 46, 'Práctica Profesional de tercer año - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(226, 'default', '5', 5, 'Lenguajes de Programación => Optativa I - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(227, 'default', '6', 6, 'Gestión de Software => Optativa I - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(228, 'default', '7', 7, 'Reconocimiento de Patrones => Optativa I - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(229, 'default', '47', 47, 'Investigación de Operaciones - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(230, 'default', '48', 48, 'Ingeniería de Software II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(231, 'default', '8', 8, 'Patrones de Diseño y Arquitectura Avanzadas => Optativa II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(232, 'default', '9', 9, 'Lenguajes de Programación => Optativa II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(233, 'default', '10', 10, 'Diseño Gráfico por Computadoras => Optativa II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(234, 'default', '49', 49, 'Optativa III - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(235, 'default', '11', 11, 'Gestión de Proyectos => Optativa III - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(236, 'default', '12', 12, 'Programación y Mantenimiento de Servidores => Optativa III - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(237, 'default', '13', 13, 'Diseño de Interfaces => Optativa III - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(238, 'default', '50', 50, 'Optativa IV - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(239, 'default', '14', 14, 'Programación Competitiva => Optativa IV - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(240, 'default', '15', 15, 'Comercio Electrónico => Optativa IV - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(241, 'default', '16', 16, 'Instalación y Gestión de Redes => Optativa IV - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(242, 'default', '51', 51, 'Componente Profesional del Trabajo de Curso de Ingeniería de Software II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(243, 'default', '52', 52, 'Simulación - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(244, 'default', '53', 53, 'Optativa V - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(245, 'default', '17', 17, 'Desarrollo Ágil I => Optativa V - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(246, 'default', '18', 18, 'Procesamiento de Lenguaje Natural => Optativa V - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(247, 'default', '19', 19, 'Aplicaciones de la Inteligencia Artificial => Optativa V - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(248, 'default', '54', 54, 'Optativa VI - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(249, 'default', '20', 20, 'Tecnologías Avanzadas de Programación I => Optativa VI - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(250, 'default', '21', 21, 'Reconocimiento de Patrones => Optativa VI - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(251, 'default', '22', 22, 'Diseño Gráfico por Computadoras => Optativa VI - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(252, 'default', '55', 55, 'Optativa VII - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(253, 'default', '23', 23, 'Patrones de Diseño y Arquitectura Avanzadas => Optativa VII - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(254, 'default', '24', 24, 'Tecnología para el Tratamiento de la Información => Optativa VII - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(255, 'default', '25', 25, 'Programación Descriptiva => Optativa VII - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(256, 'default', '56', 56, 'Ingeniería de Software III - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(257, 'default', '57', 57, 'Componente Profesional del Trabajo de Curso de Ingeniería de Software III - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(258, 'default', '58', 58, 'Práctica Profesional de cuarto año - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(259, 'default', '59', 59, 'Seminario Profesional - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(260, 'default', '60', 60, 'Pedagogía y Didáctica de la Educación Superior - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(261, 'default', '61', 61, 'Componente Profesional del Trabajo de Curso de Seminario Profesional - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(262, 'default', '62', 62, 'Optativa VIII - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(263, 'default', '26', 26, 'Tecnología para el Tratamiento de la Información => Optativa VIII - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(264, 'default', '27', 27, 'Gestión de Proyectos => Optativa VIII - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(265, 'default', '28', 28, 'Programación y Mantenimiento de Servidores => Optativa VIII - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(266, 'default', '63', 63, 'Optativa IX - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(267, 'default', '29', 29, 'Programación Competitiva => Optativa IX - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(268, 'default', '30', 30, 'Comercio Electrónico => Optativa IX - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(269, 'default', '31', 31, 'Instalación y Gestión de Redes => Optativa IX - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(270, 'default', '64', 64, 'Optativa X - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(271, 'default', '32', 32, 'Tecnologías Avanzadas de Programación II => Optativa X - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(272, 'default', '33', 33, 'Aplicaciones de la Inteligencia Artificial => Optativa X - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(273, 'default', '34', 34, 'Desarrollo Ágil II => Optativa X - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(274, 'default', '65', 65, 'Optativa XI - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(275, 'default', '35', 35, 'Instalación y Gestión de Redes => Optativa XI - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(276, 'default', '36', 36, 'Redes Neuronales y Algoritmos Genéticos => Optativa XI - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(277, 'default', '37', 37, 'Base de Datos Avanzadas => Optativa XI - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 47),
(278, 'default', '66', 66, 'Trabajo de Diploma - 5to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(279, 'default', '1', 1, 'Romualdo Arrechea Hernández', '', '90012333446 Romualdo Arrechea Hernández ... en su casa romualdo.arrechea@infonet.umcc.cu', '/persona/detalle/1/', '{}', 31),
(280, 'default', '1', 1, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 44),
(281, 'default', '1', 1, '(Romualdo Arrechea Hernández) Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011] -> Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011] (Traslado)', '', '', '', '{}', 12),
(282, 'default', '67', 67, 'Ingeniería de Software I - Sin especificar año / Sin especificar semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(283, 'default', '1', 1, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Ingeniería de Software I - Sin especificar año / Sin especificar semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]))', '', '', '', '{}', 46),
(284, 'default', '68', 68, 'Práctica Profesional de segundo año - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(285, 'default', '2', 2, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Práctica Profesional de segundo año - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]))', '', '', '', '{}', 46),
(286, 'default', '69', 69, 'Base de Datos Avanzadas - 1er año / Primer semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 45),
(287, 'default', '3', 3, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Base de Datos Avanzadas - Sin especificar año / Sin especificar semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]))', '', '', '', '{}', 46),
(288, 'default', '1', 1, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Matemática I - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(289, 'default', '2', 2, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Algebra Lineal - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(290, 'default', '3', 3, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Filosofía y Sociedad - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(291, 'default', '4', 4, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Fundamentos de la Informática - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(292, 'default', '5', 5, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Introducción a la Programación - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(293, 'default', '6', 6, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Educación Física I - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(294, 'default', '7', 7, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Idioma Inglés I - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(295, 'default', '8', 8, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Historia de Cuba - 1er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(296, 'default', '9', 9, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Matemática Discreta - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(297, 'default', '10', 10, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Economía Política del Capitalismo - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(298, 'default', '11', 11, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Idioma Inglés II - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(299, 'default', '12', 12, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Diseño y Programación Orientada a Objetos - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(300, 'default', '13', 13, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Educación Física II - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(301, 'default', '14', 14, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Convalidada) Introducción a la Ingeniería de Software - 1er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(302, 'default', '15', 15, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Matemática III - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13);
INSERT INTO `watson_searchentry` (`id`, `engine_slug`, `object_id`, `object_id_int`, `title`, `description`, `content`, `url`, `meta_encoded`, `content_type_id`) VALUES
(303, 'default', '16', 16, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Economía Política de la Construcción del Socialismo - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(304, 'default', '17', 17, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Estructura de Datos I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(305, 'default', '18', 18, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Introducción a la Inteligencia Artificial - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(306, 'default', '19', 19, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Idioma Inglés III - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(307, 'default', '20', 20, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Seguridad Nacional - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(308, 'default', '21', 21, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Educación Física III - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(309, 'default', '22', 22, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Electiva I - 2do año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(310, 'default', '23', 23, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Matemática IV - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(311, 'default', '24', 24, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Arquitectura de Computadoras - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(312, 'default', '25', 25, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Base de Datos - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(313, 'default', '26', 26, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Teoría Sociopolítica - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(314, 'default', '27', 27, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Idioma Inglés IV - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(315, 'default', '28', 28, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Defensa Nacional - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(316, 'default', '29', 29, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Educación Física IV - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(317, 'default', '30', 30, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Estructura de Datos II - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(318, 'default', '31', 31, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Física - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(319, 'default', '32', 32, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Convalidada) Práctica Profesional de segundo año - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(320, 'default', '33', 33, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Ingeniería de Software I - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(321, 'default', '34', 34, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Inteligencia Artificial - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(322, 'default', '35', 35, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Gestión Económica y Financiera - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(323, 'default', '36', 36, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Sistemas Operativos - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(324, 'default', '37', 37, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Gestión Organizacional - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(325, 'default', '38', 38, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Probabilidades y Estadística Matemática - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(326, 'default', '39', 39, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Redes de Computadoras - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(327, 'default', '40', 40, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Programación Web - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(328, 'default', '41', 41, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Problemas Sociales de la Ciencia y la Tecnología - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(329, 'default', '42', 42, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Componente Profesional del Trabajo de Curso de Ingeniería de Software I - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(330, 'default', '43', 43, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Convalidada) Patrones de Diseño y Arquitectura - 3er año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(331, 'default', '44', 44, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Práctica Profesional de tercer año - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(332, 'default', '45', 45, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Abonada) Optativa I - 3er año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(333, 'default', '46', 46, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Investigación de Operaciones - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(334, 'default', '47', 47, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Ingeniería de Software II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(335, 'default', '48', 48, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Simulación - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(336, 'default', '49', 49, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(337, 'default', '50', 50, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa III - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(338, 'default', '51', 51, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa IV - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(339, 'default', '52', 52, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa V - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(340, 'default', '53', 53, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa VI - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(341, 'default', '54', 54, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa VII - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(342, 'default', '55', 55, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa VIII - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(343, 'default', '56', 56, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Ingeniería de Software III - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(344, 'default', '57', 57, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Componente Profesional del Trabajo de Curso de Ingeniería de Software II - 4to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(345, 'default', '58', 58, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Práctica Profesional de cuarto año - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(346, 'default', '59', 59, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Seminario Profesional - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(347, 'default', '60', 60, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Pedagogía y Didáctica de la Educación Superior - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(348, 'default', '61', 61, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Componente Profesional del Trabajo de Curso de Seminario Profesional - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(349, 'default', '62', 62, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa IX - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(350, 'default', '63', 63, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa X - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(351, 'default', '64', 64, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Optativa XI - 5to año / Primer semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(352, 'default', '65', 65, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Componente Profesional del Trabajo de Curso de Ingeniería de Software III - 4to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(353, 'default', '66', 66, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Pendiente) Trabajo de Diploma - 5to año / Segundo semestre (Ingeniería Informática (Facultad de Ciencias Económicas e Informática) UM Curso Regular Diurno (CRD)  Plan D [2010-2011])', '', '', '', '{}', 13),
(354, 'default', '1', 1, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Ingeniería de Software I - Sin especificar año / Sin especificar semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])) ', '', '', '', '{}', 14),
(355, 'default', '2', 2, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Práctica Profesional de segundo año - 2do año / Segundo semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])) ', '', '', '', '{}', 14),
(356, 'default', '3', 3, 'Romualdo Arrechea Hernández (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011]) (Base de Datos Avanzadas - Sin especificar año / Sin especificar semestre (Ingeniería Informática (Facultad de Informática) UNAH Curso Regular Diurno (CRD)  Plan D [2010-2011])) ', '', '', '', '{}', 14),
(358, 'default', '4', 4, 'plan prueba11', '', 'plan prueba11 123', '/planEstudio/detalle/4/', '{}', 37),
(359, 'default', '2', 2, 'Femenino', '', 'Femenino', '', '{}', 26),
(360, 'default', '2', 2, 'Baja', '', 'Baja', '', '{}', 8),
(361, 'default', '3', 3, 'Licencia de maternidad', '', 'Licencia de maternidad', '', '{}', 8),
(362, 'default', '1', 1, 'Abel González Mondéjar', '', '', '', '{}', 32);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ajustes_ajusteasignatura`
--
ALTER TABLE `ajustes_ajusteasignatura`
  ADD CONSTRAINT `ajustes_ajusteas_situacionId_id_3c8fd75b_fk_ajustes_situacion_id` FOREIGN KEY (`situacionId_id`) REFERENCES `ajustes_situacion` (`id`),
  ADD CONSTRAINT `aju_ajusteEstudianteId_id_9987ffe_fk_ajustes_ajusteestudiante_id` FOREIGN KEY (`ajusteEstudianteId_id`) REFERENCES `ajustes_ajusteestudiante` (`id`),
  ADD CONSTRAINT `D5d59846ffa1873ad6f2218906dfebb5` FOREIGN KEY (`asignaturaCohorteId_id`) REFERENCES `planestudio_asignaturacohorte` (`id`);

--
-- Filtros para la tabla `ajustes_ajusteasignaturaconvalidada`
--
ALTER TABLE `ajustes_ajusteasignaturaconvalidada`
  ADD CONSTRAINT `c1248eb282c79270473111c23cb4cc7e` FOREIGN KEY (`asignaturaVencidaId_id`) REFERENCES `planestudio_asignaturavencida` (`id`),
  ADD CONSTRAINT `aj_ajusteAsignaturaId_id_70fb3c50_fk_ajustes_ajusteasignatura_id` FOREIGN KEY (`ajusteAsignaturaId_id`) REFERENCES `ajustes_ajusteasignatura` (`id`);

--
-- Filtros para la tabla `ajustes_ajusteestudiante`
--
ALTER TABLE `ajustes_ajusteestudiante`
  ADD CONSTRAINT `ajustes_aj_motivoAjusteId_id_6767284c_fk_ajustes_motivoajuste_id` FOREIGN KEY (`motivoAjusteId_id`) REFERENCES `ajustes_motivoajuste` (`id`),
  ADD CONSTRAINT `ajustes_ajuste_cursoAjusteId_id_5a3ad9be_fk_planEstudio_curso_id` FOREIGN KEY (`cursoAjusteId_id`) REFERENCES `planestudio_curso` (`id`),
  ADD CONSTRAINT `ajustes__cohortePropuestoId_id_759c836_fk_planEstudio_cohorte_id` FOREIGN KEY (`cohortePropuestoId_id`) REFERENCES `planestudio_cohorte` (`id`),
  ADD CONSTRAINT `cd00e4a1efa4a1c51fdbf4489f374367` FOREIGN KEY (`carreraEstudianteId_id`) REFERENCES `planestudio_carreraestudiante` (`id`),
  ADD CONSTRAINT `e3ae777001fa32bd6cda5033b574cea3` FOREIGN KEY (`documentacionAnalizadaId_id`) REFERENCES `ajustes_documentacionanalizada` (`id`),
  ADD CONSTRAINT `ea77d1a2b60d3d5e62badda8ee8758f1` FOREIGN KEY (`anhoSemestreAjustadoId_id`) REFERENCES `planestudio_anhosemestre` (`id`);

--
-- Filtros para la tabla `ajustes_aprobaciondeajuste`
--
ALTER TABLE `ajustes_aprobaciondeajuste`
  ADD CONSTRAINT `ajustes_trabajadorId_id_2cb679ff_fk_persona_trabajador_userId_id` FOREIGN KEY (`trabajadorId_id`) REFERENCES `persona_trabajador` (`userId_id`),
  ADD CONSTRAINT `ajustes_aprobaci_estadoId_id_7b36d9d4_fk_ajustes_estadoajuste_id` FOREIGN KEY (`estadoId_id`) REFERENCES `ajustes_estadoajuste` (`id`),
  ADD CONSTRAINT `aju_carreraEstId_id_77e2d308_fk_planEstudio_carreraestudiante_id` FOREIGN KEY (`carreraEstId_id`) REFERENCES `planestudio_carreraestudiante` (`id`),
  ADD CONSTRAINT `aj_ajusteEstudianteId_id_2182872f_fk_ajustes_ajusteestudiante_id` FOREIGN KEY (`ajusteEstudianteId_id`) REFERENCES `ajustes_ajusteestudiante` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_76640627_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_11f28e87_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_786ad0cd_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_437fdd6e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_785df306_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_2adfa555_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_121c8723_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_71479cfb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_3365bcc9_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `persona_carreratipodecurso`
--
ALTER TABLE `persona_carreratipodecurso`
  ADD CONSTRAINT `persona_carr_universidadId_id_41c55adc_fk_persona_universidad_id` FOREIGN KEY (`universidadId_id`) REFERENCES `persona_universidad` (`id`),
  ADD CONSTRAINT `persona_carreratipod_carreraId_id_2217448c_fk_persona_carrera_id` FOREIGN KEY (`carreraId_id`) REFERENCES `persona_carrera` (`id`),
  ADD CONSTRAINT `persona_carreratip_facultadId_id_7fd6edc8_fk_persona_facultad_id` FOREIGN KEY (`facultadId_id`) REFERENCES `persona_facultad` (`id`),
  ADD CONSTRAINT `persona_carrer_tipoCursoId_id_105f391d_fk_persona_tipodecurso_id` FOREIGN KEY (`tipoCursoId_id`) REFERENCES `persona_tipodecurso` (`id`);

--
-- Filtros para la tabla `persona_estudiante`
--
ALTER TABLE `persona_estudiante`
  ADD CONSTRAINT `persona_estudian_ubicacionId_id_2e4c8fda_fk_persona_ubicacion_id` FOREIGN KEY (`ubicacionId_id`) REFERENCES `persona_ubicacion` (`id`),
  ADD CONSTRAINT `persona_estudiante_etniaId_id_4318ba8d_fk_persona_etnia_id` FOREIGN KEY (`etniaId_id`) REFERENCES `persona_etnia` (`id`),
  ADD CONSTRAINT `persona_estudiante_sexoId_id_5e322db3_fk_persona_sexo_id` FOREIGN KEY (`sexoId_id`) REFERENCES `persona_sexo` (`id`),
  ADD CONSTRAINT `persona_est_nacionalidadId_id_e36f79a_fk_persona_nacionalidad_id` FOREIGN KEY (`nacionalidadId_id`) REFERENCES `persona_nacionalidad` (`id`);

--
-- Filtros para la tabla `persona_trabajador`
--
ALTER TABLE `persona_trabajador`
  ADD CONSTRAINT `person_gradoCientifico_id_3a4ce0ad_fk_persona_gradocientifico_id` FOREIGN KEY (`gradoCientifico_id`) REFERENCES `persona_gradocientifico` (`id`),
  ADD CONSTRAINT `persona_trabajador_facultadId_id_35147462_fk_persona_facultad_id` FOREIGN KEY (`facultadId_id`) REFERENCES `persona_facultad` (`id`),
  ADD CONSTRAINT `persona_trabajador_userId_id_29390527_fk_auth_user_id` FOREIGN KEY (`userId_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `persona_tr_departamentoId_id_533201c3_fk_persona_departamento_id` FOREIGN KEY (`departamentoId_id`) REFERENCES `persona_departamento` (`id`),
  ADD CONSTRAINT `per_categoriaDocenteId_id_195224c_fk_persona_categoriadocente_id` FOREIGN KEY (`categoriaDocenteId_id`) REFERENCES `persona_categoriadocente` (`id`);

--
-- Filtros para la tabla `persona_ubicacion`
--
ALTER TABLE `persona_ubicacion`
  ADD CONSTRAINT `persona_ubicacio_provinciaId_id_6c9f936f_fk_persona_provincia_id` FOREIGN KEY (`provinciaId_id`) REFERENCES `persona_provincia` (`id`),
  ADD CONSTRAINT `persona_ubicacion_paisId_id_69118bc4_fk_persona_pais_id` FOREIGN KEY (`paisId_id`) REFERENCES `persona_pais` (`id`),
  ADD CONSTRAINT `persona_ubicacio_municipioId_id_510e882f_fk_persona_municipio_id` FOREIGN KEY (`municipioId_id`) REFERENCES `persona_municipio` (`id`);

--
-- Filtros para la tabla `planestudio_anhosemestre`
--
ALTER TABLE `planestudio_anhosemestre`
  ADD CONSTRAINT `planEstudio_an_semestreId_id_6de3bf52_fk_planEstudio_semestre_id` FOREIGN KEY (`semestreId_id`) REFERENCES `planestudio_semestre` (`id`),
  ADD CONSTRAINT `planEstudio_anhosemest_anhoId_id_75d56a20_fk_planEstudio_anho_id` FOREIGN KEY (`anhoId_id`) REFERENCES `planestudio_anho` (`id`);

--
-- Filtros para la tabla `planestudio_asignaturacohorte`
--
ALTER TABLE `planestudio_asignaturacohorte`
  ADD CONSTRAINT `pla_tipoEvauacionId_id_23787b2c_fk_planEstudio_tipoevaluacion_id` FOREIGN KEY (`tipoEvauacionId_id`) REFERENCES `planestudio_tipoevaluacion` (`id`),
  ADD CONSTRAINT `planEstudio_asig_cohorteId_id_2e9c2e14_fk_planEstudio_cohorte_id` FOREIGN KEY (`cohorteId_id`) REFERENCES `planestudio_cohorte` (`id`),
  ADD CONSTRAINT `planEstudio__curriculoId_id_32ad367f_fk_planEstudio_curriculo_id` FOREIGN KEY (`curriculoId_id`) REFERENCES `planestudio_curriculo` (`id`),
  ADD CONSTRAINT `planEstudi_asignaturaId_id_4cca7130_fk_planEstudio_asignatura_id` FOREIGN KEY (`asignaturaId_id`) REFERENCES `planestudio_asignatura` (`id`),
  ADD CONSTRAINT `planEstudi_disciplinaId_id_384692b2_fk_planEstudio_disciplina_id` FOREIGN KEY (`disciplinaId_id`) REFERENCES `planestudio_disciplina` (`id`),
  ADD CONSTRAINT `planEs_anhoSemestreId_id_64dc9e76_fk_planEstudio_anhosemestre_id` FOREIGN KEY (`anhoSemestreId_id`) REFERENCES `planestudio_anhosemestre` (`id`),
  ADD CONSTRAINT `pl_tipoAsignaturaId_id_11d837ac_fk_planEstudio_tipoasignatura_id` FOREIGN KEY (`tipoAsignaturaId_id`) REFERENCES `planestudio_tipoasignatura` (`id`);

--
-- Filtros para la tabla `planestudio_asignaturaoptativaelectiva`
--
ALTER TABLE `planestudio_asignaturaoptativaelectiva`
  ADD CONSTRAINT `planEstudi_asignaturaId_id_4ad809f9_fk_planEstudio_asignatura_id` FOREIGN KEY (`asignaturaId_id`) REFERENCES `planestudio_asignatura` (`id`),
  ADD CONSTRAINT `a290bea6ff766475caba3fafeb212489` FOREIGN KEY (`asignaturaCohorteId_id`) REFERENCES `planestudio_asignaturacohorte` (`id`);

--
-- Filtros para la tabla `planestudio_asignaturavencida`
--
ALTER TABLE `planestudio_asignaturavencida`
  ADD CONSTRAINT `ac2b3804e485a1d8c44b0691f809a17e` FOREIGN KEY (`carreraEstudianteId_id`) REFERENCES `planestudio_carreraestudiante` (`id`),
  ADD CONSTRAINT `a27c55d5b7e86f7ab5b27ec21ed7f003` FOREIGN KEY (`asignaturaCohorteId_id`) REFERENCES `planestudio_asignaturacohorte` (`id`);

--
-- Filtros para la tabla `planestudio_carreraestudiante`
--
ALTER TABLE `planestudio_carreraestudiante`
  ADD CONSTRAINT `planEstudio_ca_estudianteId_id_609d568d_fk_persona_estudiante_id` FOREIGN KEY (`estudianteId_id`) REFERENCES `persona_estudiante` (`id`),
  ADD CONSTRAINT `planEstudio_carr_cohorteId_id_5686bd8f_fk_planEstudio_cohorte_id` FOREIGN KEY (`cohorteId_id`) REFERENCES `planestudio_cohorte` (`id`);

--
-- Filtros para la tabla `planestudio_cohorte`
--
ALTER TABLE `planestudio_cohorte`
  ADD CONSTRAINT `planEstud_planEstudioId_id_3ce9e3d_fk_planEstudio_planestudio_id` FOREIGN KEY (`planEstudioId_id`) REFERENCES `planestudio_planestudio` (`id`),
  ADD CONSTRAINT `planEstudio_cohorte_cursoId_id_13602d84_fk_planEstudio_curso_id` FOREIGN KEY (`cursoId_id`) REFERENCES `planestudio_curso` (`id`),
  ADD CONSTRAINT `p_carreraTipoCursoId_id_55b390b_fk_persona_carreratipodecurso_id` FOREIGN KEY (`carreraTipoCursoId_id`) REFERENCES `persona_carreratipodecurso` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
