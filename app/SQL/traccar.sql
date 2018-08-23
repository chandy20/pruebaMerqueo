-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 05-08-2018 a las 17:57:10
-- Versión del servidor: 5.7.18-1
-- Versión de PHP: 7.1.6-2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `traccar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `type` varchar(128) NOT NULL,
  `attribute` varchar(128) NOT NULL,
  `expression` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendars`
--

CREATE TABLE `calendars` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `data` blob NOT NULL,
  `attributes` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `commands`
--

CREATE TABLE `commands` (
  `id` int(11) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `type` varchar(128) NOT NULL,
  `textchannel` tinyint(1) NOT NULL DEFAULT '0',
  `attributes` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DATABASECHANGELOG`
--

CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `DATABASECHANGELOG`
--

INSERT INTO `DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`) VALUES
('changelog-3.3', 'author', 'changelog-3.3', '2018-08-04 14:40:07', 1, 'EXECUTED', '8:ea6f202534dc7845fd1a49e1d8384d9c', 'createTable tableName=users; addUniqueConstraint constraintName=uk_user_email, tableName=users; createTable tableName=devices; addUniqueConstraint constraintName=uk_device_uniqueid, tableName=devices; createTable tableName=user_device; addForeignK...', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.5', 'author', 'changelog-3.5', '2018-08-04 14:40:17', 2, 'EXECUTED', '8:194e3ae7ec6d201917136e04a26e237b', 'createTable tableName=groups; createTable tableName=user_group; addForeignKeyConstraint baseTableName=user_group, constraintName=fk_user_group_userid, referencedTableName=users; addForeignKeyConstraint baseTableName=user_group, constraintName=fk_u...', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.6', 'author', 'changelog-3.6', '2018-08-04 14:40:28', 3, 'EXECUTED', '8:1ec7941b03749f24e365bc6126b07e1a', 'createTable tableName=events; addForeignKeyConstraint baseTableName=events, constraintName=fk_event_deviceid, referencedTableName=devices; addColumn tableName=devices; createTable tableName=geofences; createTable tableName=user_geofence; addForeig...', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.7', 'author', 'changelog-3.7', '2018-08-04 14:40:32', 4, 'EXECUTED', '8:2e444e379f31d0b8e09273ec7ffe87a0', 'update tableName=devices; addForeignKeyConstraint baseTableName=devices, constraintName=fk_device_group_groupid, referencedTableName=groups; update tableName=groups; addColumn tableName=devices; dropColumn columnName=motion, tableName=devices; dro...', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.7-notmssql', 'author', 'changelog-3.7', '2018-08-04 14:40:33', 5, 'EXECUTED', '8:974c33d2fb399ef6477c3897450fb078', 'addForeignKeyConstraint baseTableName=groups, constraintName=fk_group_group_groupid, referencedTableName=groups', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.8', 'author', 'changelog-3.8', '2018-08-04 14:40:57', 6, 'EXECUTED', '8:74d68027951f8d2ae6bb2e24df8365bc', 'createTable tableName=attribute_aliases; addForeignKeyConstraint baseTableName=attribute_aliases, constraintName=fk_attribute_aliases_deviceid, referencedTableName=devices; addUniqueConstraint constraintName=uk_deviceid_attribute, tableName=attrib...', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.9', 'author', 'changelog-3.9', '2018-08-04 14:40:58', 7, 'EXECUTED', '8:34822842d65deb843a7d16f857d52ecc', 'addColumn tableName=notifications; update tableName=notifications; update tableName=notifications; update tableName=notifications; update tableName=notifications', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.10', 'author', 'changelog-3.10', '2018-08-04 14:41:06', 8, 'EXECUTED', '8:e1ddbe83e1ecf856a912755fc118f82e', 'createTable tableName=calendars; createTable tableName=user_calendar; addForeignKeyConstraint baseTableName=user_calendar, constraintName=fk_user_calendar_userid, referencedTableName=users; addForeignKeyConstraint baseTableName=user_calendar, cons...', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.10-notmssql', 'author', 'changelog-3.10', '2018-08-04 14:41:07', 9, 'EXECUTED', '8:191c21d8f0f921845cf93bbc9d0639b9', 'addForeignKeyConstraint baseTableName=user_user, constraintName=fk_user_user_manageduserid, referencedTableName=users', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.10-mssql', 'author', 'changelog-3.10', '2018-08-04 14:41:07', 10, 'MARK_RAN', '8:ad1f63566e8d08812fbf0b93a118ef6e', 'sql', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.7-mssql', 'author', 'changelog-3.10', '2018-08-04 14:41:07', 11, 'MARK_RAN', '8:127b36b9d32a9d236df51d19b18c3766', 'sql', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.11', 'author', 'changelog-3.11', '2018-08-04 14:41:11', 12, 'EXECUTED', '8:7800f890b9706a480bd5a79b591b6ca7', 'addColumn tableName=users; addColumn tableName=notifications; addColumn tableName=server; addColumn tableName=server; addColumn tableName=users', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.12', 'author', 'changelog-3.12', '2018-08-04 14:41:25', 13, 'EXECUTED', '8:5ce520811d626ad325a014b9fcbb1a13', 'addColumn tableName=statistics; createTable tableName=attributes; createTable tableName=user_attribute; addForeignKeyConstraint baseTableName=user_attribute, constraintName=fk_user_attribute_userid, referencedTableName=users; addForeignKeyConstrai...', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.12-notmssql', 'author', 'changelog-3.12', '2018-08-04 14:41:26', 14, 'EXECUTED', '8:a3bf7fabcde29e106fe2f89829a76a84', 'dropForeignKeyConstraint baseTableName=groups, constraintName=fk_group_group_groupid; addForeignKeyConstraint baseTableName=groups, constraintName=fk_groups_groupid, referencedTableName=groups', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.12-pgsql', 'author', 'changelog-3.12', '2018-08-04 14:41:26', 15, 'MARK_RAN', '8:cfc881bd2dadb561aa9c1a467bc8cc1c', 'dropColumn columnName=data, tableName=calendars; addColumn tableName=calendars', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.14', 'author', 'changelog-3.14', '2018-08-04 14:41:35', 16, 'EXECUTED', '8:1be7e6c0520f8be53ef1b099d96afba5', 'createTable tableName=drivers; addUniqueConstraint constraintName=uk_driver_uniqueid, tableName=drivers; createTable tableName=user_driver; addForeignKeyConstraint baseTableName=user_driver, constraintName=fk_user_driver_userid, referencedTableNam...', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.15', 'author', 'changelog-3.15', '2018-08-04 14:42:02', 17, 'EXECUTED', '8:ac8ccec176027e98bbf45dc6c15d9b05', 'dropForeignKeyConstraint baseTableName=attribute_aliases, constraintName=fk_attribute_aliases_deviceid; dropUniqueConstraint constraintName=uk_deviceid_attribute, tableName=attribute_aliases; dropTable tableName=attribute_aliases; dropColumn colum...', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.16', 'author', 'changelog-3.16', '2018-08-04 14:42:07', 18, 'EXECUTED', '8:b59407d70bfe9bf57bc9968adfbbdf1c', 'addColumn tableName=devices; addColumn tableName=users; addColumn tableName=servers; addColumn tableName=notifications; addForeignKeyConstraint baseTableName=notifications, constraintName=fk_notification_calendar_calendarid, referencedTableName=ca...', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.3-admin', 'author', 'changelog-3.17', '2018-08-04 14:42:07', 19, 'MARK_RAN', '8:3f14c3b08068eb7628d0d3e2941eb2d3', 'renameColumn newColumnName=administrator, oldColumnName=admin, tableName=users', '', NULL, '3.6.1', NULL, NULL, '3411600845'),
('changelog-3.17', 'author', 'changelog-3.17', '2018-08-04 14:42:15', 20, 'EXECUTED', '8:8aa3e56afe6ba86cd004fa801507bc28', 'addColumn tableName=events; createTable tableName=maintenances; createTable tableName=user_maintenance; addForeignKeyConstraint baseTableName=user_maintenance, constraintName=fk_user_maintenance_userid, referencedTableName=users; addForeignKeyCons...', '', NULL, '3.6.1', NULL, NULL, '3411600845');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DATABASECHANGELOGLOCK`
--

CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `DATABASECHANGELOGLOCK`
--

INSERT INTO `DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`) VALUES
(1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `uniqueid` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `lastupdate` datetime NOT NULL,
  `attributes` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `positionid` int(11) NOT NULL,
  `groupid` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `device_attribute`
--

CREATE TABLE `device_attribute` (
  `deviceid` int(11) NOT NULL,
  `attributeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `device_command`
--

CREATE TABLE `device_command` (
  `deviceid` int(11) NOT NULL,
  `commandid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `device_driver`
--

CREATE TABLE `device_driver` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `device_geofence`
--

CREATE TABLE `device_geofence` (
  `deviceid` int(11) NOT NULL,
  `geofenceid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `device_maintenance`
--

CREATE TABLE `device_maintenance` (
  `deviceid` int(11) NOT NULL,
  `maintenanceid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `device_notification`
--

CREATE TABLE `device_notification` (
  `deviceid` int(11) NOT NULL,
  `notificationid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `uniqueid` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `attributes` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `lugarExpedicion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudadNacimiento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `direccionResidencia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudadDepartamento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefonoFijo` int(11) NOT NULL,
  `celular` int(11) NOT NULL,
  `categoriaLicencia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vencimiento` date NOT NULL,
  `estadoCivil` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombreConyugue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefonoFijoCelular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ocupacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `documentoConyugue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lugarExpedicionDocumentoConyugue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consignarAnticipoA` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `documentoAnticipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banco` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numeroCuenta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipoCuenta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombreReferenciaUno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parentescoReferenciaUno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ocupacionReferenciaUno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccionReferenciaUno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudadDepartamentoReferenciaUno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `celularReferenciaUno` int(11) NOT NULL,
  `nombreReferenciaDos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parentescoReferenciaDos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ocupacionReferenciaDos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccionReferenciaDos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudadDepartamentoReferenciaDos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `celularReferenciaDos` int(11) NOT NULL,
  `empresaReferenciaUno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `viajesReferenciaUno` int(11) NOT NULL,
  `contactoReferenciaUno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cargoReferenciaUno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccionLaboralReferenciaUno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudadLaboralReferenciaUno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fijoReferenciaUno` int(11) NOT NULL,
  `celularLaboralReferenciaUno` int(11) NOT NULL,
  `empresaReferenciaDos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `viajesReferenciaDos` int(11) NOT NULL,
  `contactoReferenciaDos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cargoReferenciaDos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccionLaboralReferenciaDos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudadLaboralReferenciaDos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fijoReferenciaDos` int(11) NOT NULL,
  `celularLaboralReferenciaDos` int(11) NOT NULL,
  `placa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `matriculado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `marca` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `linea` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `modelo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clase` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numeroMotor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `carroceria` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numeroSerie` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numeroEjes` int(11) NOT NULL,
  `combustible` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisionMecanica` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vencimientoRevisionMecanica` date NOT NULL,
  `poliza` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `aseguradora` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vencimientoPoliza` date NOT NULL,
  `placaTrailer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `colorTrailer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numeroEjesTrailer` int(11) NOT NULL,
  `tenedorTrailer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `documentoTenedorTrailer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `empresaGPS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `usuarioGPS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `claveGPS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombrePropietario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `documentoPropietario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccionPropietario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudadDepartamentoPropietario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fijoPropietario` int(11) NOT NULL,
  `celularPropietario` int(11) NOT NULL,
  `nombreTenedor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `documentoTenedor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccionTenedor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudadDepartamentoTenedor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fijoTenedor` int(11) NOT NULL,
  `celularTenedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `servertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deviceid` int(11) DEFAULT NULL,
  `positionid` int(11) DEFAULT NULL,
  `geofenceid` int(11) DEFAULT NULL,
  `attributes` varchar(4000) DEFAULT NULL,
  `maintenanceid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `nombres` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `nombres`, `apellidos`, `telefono`) VALUES
(1, 'admin', 'admin', 'email@email.com', 'email@email.com', 1, NULL, '$2y$13$ZR51qOl0Cc/XoxyttGLM1OzlcYiEt8zRG/.WDfLdDVEVU81vjG7QK', '2018-08-05 16:17:25', NULL, NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `geofences`
--

CREATE TABLE `geofences` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `area` varchar(4096) NOT NULL,
  `attributes` varchar(4000) DEFAULT NULL,
  `calendarid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `groupid` int(11) DEFAULT NULL,
  `attributes` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_attribute`
--

CREATE TABLE `group_attribute` (
  `groupid` int(11) NOT NULL,
  `attributeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_command`
--

CREATE TABLE `group_command` (
  `groupid` int(11) NOT NULL,
  `commandid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_driver`
--

CREATE TABLE `group_driver` (
  `groupid` int(11) NOT NULL,
  `driverid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_geofence`
--

CREATE TABLE `group_geofence` (
  `groupid` int(11) NOT NULL,
  `geofenceid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_maintenance`
--

CREATE TABLE `group_maintenance` (
  `groupid` int(11) NOT NULL,
  `maintenanceid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_notification`
--

CREATE TABLE `group_notification` (
  `groupid` int(11) NOT NULL,
  `notificationid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maintenances`
--

CREATE TABLE `maintenances` (
  `id` int(11) NOT NULL,
  `name` varchar(4000) NOT NULL,
  `type` varchar(128) NOT NULL,
  `start` double NOT NULL DEFAULT '0',
  `period` double NOT NULL DEFAULT '0',
  `attributes` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `attributes` varchar(4000) DEFAULT NULL,
  `web` tinyint(1) DEFAULT '0',
  `mail` tinyint(1) DEFAULT '0',
  `sms` tinyint(1) DEFAULT '0',
  `always` tinyint(1) NOT NULL DEFAULT '0',
  `calendarid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `deviceid` int(11) NOT NULL,
  `protocol` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `servertime` datetime NOT NULL,
  `devicedtime` datetime NOT NULL,
  `fixtime` datetime NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `altitude` double NOT NULL,
  `speed` double NOT NULL,
  `course` double DEFAULT NULL,
  `address` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `attributes` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accuracy` double DEFAULT NULL,
  `network` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servers`
--

CREATE TABLE `servers` (
  `id` int(11) NOT NULL,
  `registration` tinyint(1) NOT NULL DEFAULT '1',
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `zoom` int(11) NOT NULL DEFAULT '0',
  `map` varchar(128) DEFAULT NULL,
  `bingkey` varchar(128) DEFAULT NULL,
  `mapurl` varchar(512) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  `twelvehourformat` tinyint(1) NOT NULL DEFAULT '0',
  `attributes` varchar(4000) DEFAULT NULL,
  `forcesettings` tinyint(1) NOT NULL DEFAULT '0',
  `coordinateformat` varchar(128) DEFAULT NULL,
  `devicereadonly` tinyint(1) DEFAULT '0',
  `limitcommands` tinyint(1) DEFAULT '0',
  `poilayer` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servers`
--

INSERT INTO `servers` (`id`, `registration`, `latitude`, `longitude`, `zoom`, `map`, `bingkey`, `mapurl`, `readonly`, `twelvehourformat`, `attributes`, `forcesettings`, `coordinateformat`, `devicereadonly`, `limitcommands`, `poilayer`) VALUES
(1, 1, 0, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `statistics`
--

CREATE TABLE `statistics` (
  `id` int(11) NOT NULL,
  `capturetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activeusers` int(11) NOT NULL DEFAULT '0',
  `activedevices` int(11) NOT NULL DEFAULT '0',
  `requests` int(11) NOT NULL DEFAULT '0',
  `messagesreceived` int(11) NOT NULL DEFAULT '0',
  `messagesstored` int(11) NOT NULL DEFAULT '0',
  `attributes` varchar(4000) NOT NULL,
  `mailsent` int(11) NOT NULL DEFAULT '0',
  `smssent` int(11) NOT NULL DEFAULT '0',
  `geocoderrequests` int(11) NOT NULL DEFAULT '0',
  `geolocationrequests` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `hashedpassword` varchar(128) DEFAULT NULL,
  `salt` varchar(128) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  `administrator` tinyint(1) NOT NULL DEFAULT '0',
  `map` varchar(128) DEFAULT NULL,
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `zoom` int(11) NOT NULL DEFAULT '0',
  `twelvehourformat` tinyint(1) NOT NULL DEFAULT '0',
  `attributes` varchar(4000) DEFAULT NULL,
  `coordinateformat` varchar(128) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT '0',
  `expirationtime` timestamp NULL DEFAULT NULL,
  `devicelimit` int(11) DEFAULT '-1',
  `token` varchar(128) DEFAULT NULL,
  `userlimit` int(11) DEFAULT '0',
  `devicereadonly` tinyint(1) DEFAULT '0',
  `phone` varchar(128) DEFAULT NULL,
  `limitcommands` tinyint(1) DEFAULT '0',
  `login` varchar(128) DEFAULT NULL,
  `poilayer` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `hashedpassword`, `salt`, `readonly`, `administrator`, `map`, `latitude`, `longitude`, `zoom`, `twelvehourformat`, `attributes`, `coordinateformat`, `disabled`, `expirationtime`, `devicelimit`, `token`, `userlimit`, `devicereadonly`, `phone`, `limitcommands`, `login`, `poilayer`) VALUES
(1, 'admin', 'admin', 'D33DCA55ABD4CC5BC76F2BC0B4E603FE2C6F61F4C1EF2D47', '000000000000000000000000000000000000000000000000', 0, 1, NULL, 0, 0, 0, 0, NULL, NULL, 0, NULL, -1, NULL, 0, 0, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_attribute`
--

CREATE TABLE `user_attribute` (
  `userid` int(11) NOT NULL,
  `attributeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_calendar`
--

CREATE TABLE `user_calendar` (
  `userid` int(11) NOT NULL,
  `calendarid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_command`
--

CREATE TABLE `user_command` (
  `userid` int(11) NOT NULL,
  `commandid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_device`
--

CREATE TABLE `user_device` (
  `userid` int(11) NOT NULL,
  `deviceid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_driver`
--

CREATE TABLE `user_driver` (
  `userid` int(11) NOT NULL,
  `driverid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_geofence`
--

CREATE TABLE `user_geofence` (
  `userid` int(11) NOT NULL,
  `geofenceid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_group`
--

CREATE TABLE `user_group` (
  `userid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_maintenance`
--

CREATE TABLE `user_maintenance` (
  `userid` int(11) NOT NULL,
  `maintenanceid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_notification`
--

CREATE TABLE `user_notification` (
  `userid` int(11) NOT NULL,
  `notificationid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_user`
--

CREATE TABLE `user_user` (
  `userid` int(11) NOT NULL,
  `manageduserid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calendars`
--
ALTER TABLE `calendars`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `DATABASECHANGELOGLOCK`
--
ALTER TABLE `DATABASECHANGELOGLOCK`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `device_attribute`
--
ALTER TABLE `device_attribute`
  ADD KEY `fk_device_attribute_deviceid` (`deviceid`),
  ADD KEY `fk_device_attribute_attributeid` (`attributeid`);

--
-- Indices de la tabla `device_command`
--
ALTER TABLE `device_command`
  ADD KEY `fk_device_command_deviceid` (`deviceid`),
  ADD KEY `fk_device_command_commandid` (`commandid`);

--
-- Indices de la tabla `device_driver`
--
ALTER TABLE `device_driver`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `device_geofence`
--
ALTER TABLE `device_geofence`
  ADD KEY `fk_device_geofence_deviceid` (`deviceid`),
  ADD KEY `fk_device_geofence_geofenceid` (`geofenceid`);

--
-- Indices de la tabla `device_maintenance`
--
ALTER TABLE `device_maintenance`
  ADD KEY `fk_device_maintenance_deviceid` (`deviceid`),
  ADD KEY `fk_device_maintenance_maintenanceid` (`maintenanceid`);

--
-- Indices de la tabla `device_notification`
--
ALTER TABLE `device_notification`
  ADD KEY `fk_device_notification_deviceid` (`deviceid`),
  ADD KEY `fk_device_notification_notificationid` (`notificationid`);

--
-- Indices de la tabla `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E410C3075D4FCC02` (`uniqueid`);

--
-- Indices de la tabla `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_event_deviceid` (`deviceid`);

--
-- Indices de la tabla `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`);

--
-- Indices de la tabla `geofences`
--
ALTER TABLE `geofences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_geofence_calendar_calendarid` (`calendarid`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_groups_groupid` (`groupid`);

--
-- Indices de la tabla `group_attribute`
--
ALTER TABLE `group_attribute`
  ADD KEY `fk_group_attribute_groupid` (`groupid`),
  ADD KEY `fk_group_attribute_attributeid` (`attributeid`);

--
-- Indices de la tabla `group_command`
--
ALTER TABLE `group_command`
  ADD KEY `fk_group_command_groupid` (`groupid`),
  ADD KEY `fk_group_command_commandid` (`commandid`);

--
-- Indices de la tabla `group_driver`
--
ALTER TABLE `group_driver`
  ADD KEY `fk_group_driver_groupid` (`groupid`),
  ADD KEY `fk_group_driver_driverid` (`driverid`);

--
-- Indices de la tabla `group_geofence`
--
ALTER TABLE `group_geofence`
  ADD KEY `fk_group_geofence_groupid` (`groupid`),
  ADD KEY `fk_group_geofence_geofenceid` (`geofenceid`);

--
-- Indices de la tabla `group_maintenance`
--
ALTER TABLE `group_maintenance`
  ADD KEY `fk_group_maintenance_groupid` (`groupid`),
  ADD KEY `fk_group_maintenance_maintenanceid` (`maintenanceid`);

--
-- Indices de la tabla `group_notification`
--
ALTER TABLE `group_notification`
  ADD KEY `fk_group_notification_groupid` (`groupid`),
  ADD KEY `fk_group_notification_notificationid` (`notificationid`);

--
-- Indices de la tabla `maintenances`
--
ALTER TABLE `maintenances`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notification_calendar_calendarid` (`calendarid`);

--
-- Indices de la tabla `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D69FE57CDD831464` (`fixtime`),
  ADD KEY `IDX_D69FE57C383BCD03` (`deviceid`);

--
-- Indices de la tabla `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_user_email` (`email`);

--
-- Indices de la tabla `user_attribute`
--
ALTER TABLE `user_attribute`
  ADD KEY `fk_user_attribute_userid` (`userid`),
  ADD KEY `fk_user_attribute_attributeid` (`attributeid`);

--
-- Indices de la tabla `user_calendar`
--
ALTER TABLE `user_calendar`
  ADD KEY `fk_user_calendar_userid` (`userid`),
  ADD KEY `fk_user_calendar_calendarid` (`calendarid`);

--
-- Indices de la tabla `user_command`
--
ALTER TABLE `user_command`
  ADD KEY `fk_user_command_userid` (`userid`),
  ADD KEY `fk_user_command_commandid` (`commandid`);

--
-- Indices de la tabla `user_device`
--
ALTER TABLE `user_device`
  ADD KEY `fk_user_device_deviceid` (`deviceid`),
  ADD KEY `user_device_user_id` (`userid`);

--
-- Indices de la tabla `user_driver`
--
ALTER TABLE `user_driver`
  ADD KEY `fk_user_driver_userid` (`userid`),
  ADD KEY `fk_user_driver_driverid` (`driverid`);

--
-- Indices de la tabla `user_geofence`
--
ALTER TABLE `user_geofence`
  ADD KEY `fk_user_geofence_userid` (`userid`),
  ADD KEY `fk_user_geofence_geofenceid` (`geofenceid`);

--
-- Indices de la tabla `user_group`
--
ALTER TABLE `user_group`
  ADD KEY `fk_user_group_userid` (`userid`),
  ADD KEY `fk_user_group_groupid` (`groupid`);

--
-- Indices de la tabla `user_maintenance`
--
ALTER TABLE `user_maintenance`
  ADD KEY `fk_user_maintenance_userid` (`userid`),
  ADD KEY `fk_user_maintenance_maintenanceid` (`maintenanceid`);

--
-- Indices de la tabla `user_notification`
--
ALTER TABLE `user_notification`
  ADD KEY `fk_user_notification_userid` (`userid`),
  ADD KEY `fk_user_notification_notificationid` (`notificationid`);

--
-- Indices de la tabla `user_user`
--
ALTER TABLE `user_user`
  ADD KEY `fk_user_user_userid` (`userid`),
  ADD KEY `fk_user_user_manageduserid` (`manageduserid`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `calendars`
--
ALTER TABLE `calendars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `commands`
--
ALTER TABLE `commands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `device_driver`
--
ALTER TABLE `device_driver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `geofences`
--
ALTER TABLE `geofences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `maintenances`
--
ALTER TABLE `maintenances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `device_attribute`
--
ALTER TABLE `device_attribute`
  ADD CONSTRAINT `fk_device_attribute_attributeid` FOREIGN KEY (`attributeid`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_device_attribute_deviceid` FOREIGN KEY (`deviceid`) REFERENCES `devices` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `device_command`
--
ALTER TABLE `device_command`
  ADD CONSTRAINT `fk_device_command_commandid` FOREIGN KEY (`commandid`) REFERENCES `commands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_device_command_deviceid` FOREIGN KEY (`deviceid`) REFERENCES `devices` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `device_geofence`
--
ALTER TABLE `device_geofence`
  ADD CONSTRAINT `fk_device_geofence_deviceid` FOREIGN KEY (`deviceid`) REFERENCES `devices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_device_geofence_geofenceid` FOREIGN KEY (`geofenceid`) REFERENCES `geofences` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `device_maintenance`
--
ALTER TABLE `device_maintenance`
  ADD CONSTRAINT `fk_device_maintenance_deviceid` FOREIGN KEY (`deviceid`) REFERENCES `devices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_device_maintenance_maintenanceid` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `device_notification`
--
ALTER TABLE `device_notification`
  ADD CONSTRAINT `fk_device_notification_deviceid` FOREIGN KEY (`deviceid`) REFERENCES `devices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_device_notification_notificationid` FOREIGN KEY (`notificationid`) REFERENCES `notifications` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_event_deviceid` FOREIGN KEY (`deviceid`) REFERENCES `devices` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `geofences`
--
ALTER TABLE `geofences`
  ADD CONSTRAINT `fk_geofence_calendar_calendarid` FOREIGN KEY (`calendarid`) REFERENCES `calendars` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `fk_groups_groupid` FOREIGN KEY (`groupid`) REFERENCES `groups` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `group_attribute`
--
ALTER TABLE `group_attribute`
  ADD CONSTRAINT `fk_group_attribute_attributeid` FOREIGN KEY (`attributeid`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_group_attribute_groupid` FOREIGN KEY (`groupid`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `group_command`
--
ALTER TABLE `group_command`
  ADD CONSTRAINT `fk_group_command_commandid` FOREIGN KEY (`commandid`) REFERENCES `commands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_group_command_groupid` FOREIGN KEY (`groupid`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `group_driver`
--
ALTER TABLE `group_driver`
  ADD CONSTRAINT `fk_group_driver_driverid` FOREIGN KEY (`driverid`) REFERENCES `drivers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_group_driver_groupid` FOREIGN KEY (`groupid`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `group_geofence`
--
ALTER TABLE `group_geofence`
  ADD CONSTRAINT `fk_group_geofence_geofenceid` FOREIGN KEY (`geofenceid`) REFERENCES `geofences` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_group_geofence_groupid` FOREIGN KEY (`groupid`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `group_maintenance`
--
ALTER TABLE `group_maintenance`
  ADD CONSTRAINT `fk_group_maintenance_groupid` FOREIGN KEY (`groupid`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_group_maintenance_maintenanceid` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `group_notification`
--
ALTER TABLE `group_notification`
  ADD CONSTRAINT `fk_group_notification_groupid` FOREIGN KEY (`groupid`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_group_notification_notificationid` FOREIGN KEY (`notificationid`) REFERENCES `notifications` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notification_calendar_calendarid` FOREIGN KEY (`calendarid`) REFERENCES `calendars` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `FK_D69FE57C383BCD03` FOREIGN KEY (`deviceid`) REFERENCES `devices` (`id`);

--
-- Filtros para la tabla `user_attribute`
--
ALTER TABLE `user_attribute`
  ADD CONSTRAINT `fk_user_attribute_attributeid` FOREIGN KEY (`attributeid`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_attribute_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_calendar`
--
ALTER TABLE `user_calendar`
  ADD CONSTRAINT `fk_user_calendar_calendarid` FOREIGN KEY (`calendarid`) REFERENCES `calendars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_calendar_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_command`
--
ALTER TABLE `user_command`
  ADD CONSTRAINT `fk_user_command_commandid` FOREIGN KEY (`commandid`) REFERENCES `commands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_command_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_device`
--
ALTER TABLE `user_device`
  ADD CONSTRAINT `fk_user_device_deviceid` FOREIGN KEY (`deviceid`) REFERENCES `devices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_device_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_driver`
--
ALTER TABLE `user_driver`
  ADD CONSTRAINT `fk_user_driver_driverid` FOREIGN KEY (`driverid`) REFERENCES `drivers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_driver_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_geofence`
--
ALTER TABLE `user_geofence`
  ADD CONSTRAINT `fk_user_geofence_geofenceid` FOREIGN KEY (`geofenceid`) REFERENCES `geofences` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_geofence_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `fk_user_group_groupid` FOREIGN KEY (`groupid`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_group_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_maintenance`
--
ALTER TABLE `user_maintenance`
  ADD CONSTRAINT `fk_user_maintenance_maintenanceid` FOREIGN KEY (`maintenanceid`) REFERENCES `maintenances` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_maintenance_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_notification`
--
ALTER TABLE `user_notification`
  ADD CONSTRAINT `fk_user_notification_notificationid` FOREIGN KEY (`notificationid`) REFERENCES `notifications` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_notification_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_user`
--
ALTER TABLE `user_user`
  ADD CONSTRAINT `fk_user_user_manageduserid` FOREIGN KEY (`manageduserid`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_user_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
