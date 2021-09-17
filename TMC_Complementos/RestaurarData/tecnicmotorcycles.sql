-- --------------------------------------------------------
-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
-- --------------------------------------------------------
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-08-2021 a las 04:51:54
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6
-- --------------------------------------------------------
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
-- --------------------------------------------------------
--
-- Base de datos: TECNICMOTORCYCLES
--
-- --------------------------------------------------------
Create Database tecnicmotorcycles;
Use tecnicmotorcycles;
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla CARGO
--
-- --------------------------------------------------------
CREATE TABLE CARGO (
   IDCARGO int(11) NOT NULL,
   NOMBRECARGO varchar(20) DEFAULT NULL,
   ESTADO bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Volcado de datos para la tabla CARGO
--
-- --------------------------------------------------------
INSERT INTO CARGO (IDCARGO, NOMBRECARGO, ESTADO) VALUES
('1', 'ADMINISTRADOR', 1),
('2', 'VENDEDOR', 2),
('3', 'CLIENTE', 3);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla CATEGORIA
--
-- --------------------------------------------------------
CREATE TABLE CATEGORIA (
   idCategoria int(11) NOT NULL,
   nombreCategoria varchar(30) NOT NULL,
   estado bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Volcado de datos para la tabla CATEGORIA
--
-- --------------------------------------------------------
INSERT INTO CATEGORIA (idCategoria, nombreCategoria, estado) VALUES
('1', 'BAJO_CC', 1),
('2', 'MEDIO_CC', 1),
('3', 'ALTO_CC', 1);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla USUARIO
--
-- --------------------------------------------------------
CREATE TABLE  USUARIO (
   IDUSUARIO int(11) NOT NULL,
   NOMBREUSUARIO varchar(100) DEFAULT NULL,
   CLAVE varchar(100) DEFAULT NULL,
   ESTADO bit(50) DEFAULT NULL,
   IDCARGO int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Volcado de datos para la tabla USUARIO
--
-- --------------------------------------------------------
INSERT INTO USUARIO (IDUSUARIO, NOMBREUSUARIO, CLAVE, ESTADO, IDCARGO) VALUES
('1', 'aPelayo', 'aPelayo10239012341', 1, 1),
('2', 'eRamirez', 'jDuque10239012342', 1, 2),
('3', 'dBarco', 'dBarco10239012343', 1, 2),
('4', 'cRojas', 'cRojas10239012344', 1, 2),
('5', 'TMC', '123456789', 1, 3);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla EMPLEADO
--
-- --------------------------------------------------------
CREATE TABLE EMPLEADO (
  IDEMPLEADO int(11) NOT NULL,
  NOMBRE varchar(100) DEFAULT NULL,
  APELLIDOS varchar(100) DEFAULT NULL,
  SEXO char(20) DEFAULT NULL,
  TELEFONO varchar(100) DEFAULT NULL,
  FECHANACIMIENTO date DEFAULT NULL,
  TIPODOCUMENTO varchar(100) DEFAULT NULL,
  NUMERODOCUMENTO varchar(100) DEFAULT NULL,
  IDUSUARIO int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Volcado de datos para la tabla EMPLEADO
--
-- --------------------------------------------------------
INSERT INTO EMPLEADO (IDEMPLEADO, NOMBRE, APELLIDOS, SEXO, TELEFONO, FECHANACIMIENTO, TIPODOCUMENTO, NUMERODOCUMENTO, IDUSUARIO) VALUES
('1', 'Giovanny Alberto', 'Bonilla Pelayo', 'M', '3105447720', '1999-01-19', 'Cedula Ciudadania', '10239012341', 1),
('2', 'Jose Eduardo', 'Duque Ramirez', 'M', '3105447720', '1999-01-19', 'Cedula Ciudadania', '10239012342', 2),
('3', 'Diego Camilo', 'Barco Barco', 'M', '3105447722', '1999-03-19', 'Cedula Ciudadania', '10239012343', 3),
('4', 'Carlos Andres', 'Alvarez Rojas', 'M', '3105447766', '1992-12-19', 'Cedula Ciudadania', '10239012344', 4);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla MARCA
--
-- --------------------------------------------------------
CREATE TABLE MARCA (
  idMarca int(11) NOT NULL,
  nombreMarca varchar(30) NOT NULL,
  estado bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Volcado de datos para la tabla MARCA
--
-- --------------------------------------------------------
INSERT INTO MARCA (idMarca, nombreMarca, estado) VALUES
('1', 'Yamaha', 1),
('2', 'Tvs', 1),
('3', 'Suzuki', 1),
('4', 'Ktm', 1),
('5', 'Kawasaki', 1),
('6', 'Honda', 1),
('7', 'Bajaj', 1),
('8', 'AKT', 1);
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla PRODUCTOS
--
-- --------------------------------------------------------
CREATE TABLE PRODUCTOS (
  idProducto int(11) NOT NULL,
  nombreProducto varchar(255) NOT NULL,
  descripcion varchar(255) NOT NULL,
  precio int(10) UNSIGNED NOT NULL,
  cantidad varchar(255) DEFAULT NULL,
  idCategoria int(11) DEFAULT NULL,
  idMarca int(11) DEFAULT NULL,
  idProveedor int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Volcado de datos para la tabla PRODUCTOS
--
-- --------------------------------------------------------
INSERT INTO  Productos (idProducto, nombreProducto, descripcion, precio, cantidad, idCategoria, idMarca, idProveedor) VALUES
('1', 'Manilar Izquierdo', 'Yamaha Libero 125', '8700', '400', '1', '1', '1'),
('2', 'Manilar Izquierdo', 'Dt 125 175 200', '9100', '400', '1', '1', '1'),
('3', 'Manilar Derecho', 'Dt 125 175 200', '9100', '400', '1', '1', '1'),
('4', 'Manilar Izquierdo', 'Libero 125', '8700', '400', '1', '1', '1'),
('5', 'Manilar Izquierdo', 'Ybr125E', '11500', '400', '1', '1', '1'),
('6', 'Filtro Aire', 'Bws125 Antesdel2013', '11700', '400', '1', '1', '1'),
('7', 'Manilar Izquierdo', 'Xtz250 Original', '12700', '400', '1', '1', '1'),
('8', 'Sprocket 37T T110E', 'Crypton 110E', '12800', '400', '1', '1', '1'),
('9', 'Leva Clutch', ' Rx115', '13100', '400', '1', '1', '1'),
('10', 'Banda Freno Tras', 'Crypton 110 - Te110', '13900', '400', '1', '1', '1'),
('11', 'Pastilla Freno Delant', 'Bws Metali', '14800', '400', '1', '1', '1'),
('12', 'Pastilla Freno Delantera', 'Crypton 115', '14800', '400', '1', '1', '1'),
('13', 'Filtro Aire Clutch', 'Bws125', '15300', '400', '1', '1', '1'),
('14', ' Pastilla Freno Delantera', 'Ybr250', '15400', '400', '1', '1', '1'),
('15', 'Pastilla Freno Delantera', 'R15', '15400', '400', '1', '1', '1'),
('16', 'Pastilla Freno Tras', 'Xtz 250', '15400', '400', '1', '1', '1'),
('17', 'Pastilla Freno Delant', 'Xt660R', '16100', '400', '3', '1', '1'),
('18', 'Pastilla Freno Delantera', 'Dt125 1999', '16100', '400', '2', '1', '1'),
('19', 'Filtro Aire Clutch', 'Yamaha N-Max ', '15400', '400', '1', '1', '1'),
('20', 'Pastilla Freno Tras', 'Xtz 250', '16200', '400', '1', '1', '1'),
('21', 'Espejo Derecho', 'Dt125', '17100', '400', '1', '1', '1'),
('22', 'Espejo Izquierdo', 'Rx100A', '17600', '400', '1', '1', '1'),
('23', 'Pastilla Freno Tras', 'Xtz 250', '16200', '400', '1', '1', '1'),
('24', 'Espejo Derecho', 'Sz-R 2014', '17600', '400', '1', '1', '1'),
('25', 'Espejo Derecho', 'Libero125', '17600', '400', '1', '1', '1'),
('26', 'Espejo Izquierdo', 'Rosca8Mm  Bws100', '17600', '400', '1', '1', '1'),
('27', 'Pastilla Freno Tras', 'Xtz 250', '16200', '400', '1', '1', '1'),
('28', 'Espejo Derecho Rosca Izquierdo', '8Mm  Bws125', '17600', '400', '1', '1', '1'),
('29', 'Pastilla Freno Tras', 'Xtz 250', '16200', '400', '1', '1', '1'),
('30', 'Espejo Izquierdo Rosca', 'Sz-R 2014', '17800', '400', '1', '1', '1'),
('31', 'Espejo Izquierdo', 'Libero125  2014', '16200', '400', '1', '1', '1'),
('32', 'Espejo Derecho Rosca Izquierda', '8Mm Yamaha Bws100', '17600', '400', '1', '1', '1'),
('33', 'Manilares Set', 'Dt175 Negro Original', '18500', '400', '2', '1', '1'),
('34', 'Manilares Set', 'Dt125 Negro Original', '18500', '400', '1', '1', '1'),
('35', 'Manilares Set', 'Dt200 Negro Original', '25500', '400', '3', '1', '1'),
('36', 'Pastilla Freno Delantera', 'Bws 125X', '18500', '400', '1', '1', '1'),
('37', 'Espejo Izquierdo', 'Ybr125Dx', '180800', '400', '1', '1', '1'),
('38', 'Tapa Trasera Manubrio', 'Crypton Fi T115Fi', '22200', '400', '1', '1', '1'),
('39', 'Pastilla Freno Delant', 'Yw125/Bws125', '22500', '400', '1', '1', '1'),
('40', 'Filtro Aire', 'Crypton Original', '22600', '400', '1', '1', '1'),
('41', 'Pastilla Freno Tras', 'Bws 100g', '23700', '400', '1', '1', '1'),
('42', 'Pastilla Freno Delant', 'Sz16R', '25000', '400', '1', '1', '1'),
('43', 'Manubrio', 'Sz2.0', '28000', '400', '1', '1', '1'),
('44', 'Pastilla Freno Delant', 'Fz16', '28100', '400', '1', '1', '1'),
('45', 'Pastilla Freno Delant', 'Ybr125Dx', '28100', '400', '1', '1', '1'),
('46', 'Kit Sprocket', 'Chappy Lb80 14/30', '29300', '400', '1', '1', '1'),
('47', 'Espejo Derecho', 'Rx100A', '29700', '400', '1', '1', '1'),
('48', 'Espejo Izquierdo Rosca', '8Mm  Bws100', '33300', '400', '1', '1', '1'),
('49', 'Balinera', '6205', '35700', '400', '3', '1', '1'),
('50', 'Manubrio', 'Fz16', '39100', '400', '1', '1', '1'),
('51', 'Manubrio', 'Ac150B', '34100', '400', '1', '1', '1'),
('52', 'Correa Transmision', 'At115 Next', '39700', '400', '1', '1', '1'),
('53', 'Sprocket 41T', 'Fz2.0', '40500', '400', '1', '1', '1'),
('54', 'Sprocket 41T', 'Fz150', '40500', '400', '1', '1', '1'),
('55', 'Defensa', 'Ybr125', '41200', '400', '1', '1', '1'),
('56', 'Defensa', 'Ybr125E', '41200', '400', '1', '1', '1'),
('57', 'Manubrio', 'Sz16R', '41200', '400', '1', '1', '1'),
('58', 'Kit Sprocket 14/45 Yamaha', 'Libero 125 Yd125', '44300', '400', '1', '1', '1'),
('59', 'Manubrio', 'Yd125Rv', '45000', '400', '1', '1', '1'),
('60', 'Manubrio', 'Ybr125Esd', '45000', '400', '1', '1', '1'),
('61', 'Espejo Izquierdo', 'N-Max', '45900', '400', '3', '1', '1'),
('62', 'Manubrio', 'Ybr125E', '46900', '400', '1', '1', '1'),
('63', 'Manubrio', 'Libero125', '46900', '400', '1', '1', '1'),
('64', 'Pastilla Freno Delantera', 'Sz16Rr2_0', '48900', '400', '1', '1', '1'),
('65', 'Kit Sprocket', 'Dt125K', '49200', '400', '1', '1', '1'),
('66', 'Tapa Juego', 'Fz16', '49900', '400', '1', '1', '1'),
('67', 'Tapas Juego Lateral', 'Yw125Fi', '50000', '400', '1', '1', '1'),
('68', 'Espejo Derecho', 'Fz16', '50400', '400', '1', '1', '1'),
('69', 'Pastilla Freno Delant', 'Crypton T115 Fi', '50600', '400', '1', '1', '1'),
('70', 'Espejo Izquierdo', 'Fz16 Fazer', '51800', '400', '1', '1', '1'),
('71', 'Tapa Izquierdo', 'Bws Neutra', '54000', '400', '1', '1', '1'),
('72', 'Espejo Derecho', 'Libero125s2014', '54700', '400', '1', '1', '1'),
('73', 'Sprocket 40T', 'Fz16 Ac150B', '555000', '400', '1', '1', '1'),
('74', 'Espejo Izquierdo', 'Libero125s2014', '56700', '400', '1', '1', '1'),
('75', 'Manubrio', 'Xtz250', '57800', '400', '1', '1', '1'),
('76', 'Kit Piston 0_75', 'Crypton115', '59500', '400', '1', '1', '1'),
('77', 'Kit Arrastre 15_37', 'Crypton 110', '60000', '400', '1', '1', '1'),
('78', 'Pastilla Freno Delant', 'N-Max', '60300', '400', '3', '1', '1'),
('79', 'Pastilla Freno Delant', 'Crypton 115 Fi T115Fi', '60300', '400', '1', '1', '1'),
('80', 'Balinera 30X47X09 6906', 'R15', '61800', '400', '1', '1', '1'),
('81', 'Kit Arrastre 14_45', 'Ybr125Ss Azul', '62000', '400', '1', '1', '1'),
('82', 'Sprocket 41T', 'Crypton 115 T115Lse  420', '62400', '400', '1', '1', '1'),
('83', 'Kit Arrastre 15_37 ', 'Crypton 110', '63000', '400', '1', '1', '1'),
('84', 'Sprocket 42T', 'Yfzr15', '64300', '400', '1', '1', '1'),
('85', 'Sprocket 42T', 'Szr', '64300', '400', '1', '1', '1'),
('86', 'Sprocket 44T', 'Libero 110 - Yd110', '64400', '400', '1', '1', '1'),
('87', 'Kit Piston 1_25', 'T110E', '64500', '400', '1', '1', '1'),
('88', 'Piston Standard', 'Fz15 2_0', '64800', '400', '1', '1', '1'),
('89', 'Kit Piston 0_25 ', 'T110E', '65100', '400', '1', '1', '1'),
('90', 'Kit Piston 0_25', 'Yd110', '65100', '400', '1', '1', '1'),
('91', 'Kit Arrastre 14_40', 'Fz16', '65400', '400', '1', '1', '1'),
('92', 'Kit Piston 0_50', 'T110E', '65500', '400', '1', '1', '1'),
('93', 'Kit Piston 0_50', 'Yd110', '65500', '400', '1', '1', '1'),
('94', 'Kit Arrastre 14_41', 'Crypton 115', '67700', '400', '1', '1', '1'),
('95', 'Carburador', 'Dt175E', '68800', '400', '1', '1', '1'),
('96', 'Kit Arrastre 14_44', 'Libero 110', '69100', '400', '1', '1', '1'),
('97', 'Kit Arrastre 14_41', 'Crypton 115 Cadena 428', '69500', '400', '1', '1', '1'),
('98', 'Piston Standard', 'Fz16', '68900', '400', '1', '1', '1'),
('99', 'Kit Piston 0_50', 'V80', '70700', '400', '2', '1', '1'),
('100', 'Kit Piston 0_50', 'Fs80', '70700', '400', '1', '1', '1'),
('101', 'Balinera 6304', '20X52X15', '71100', '400', '1', '1', '1'),
('102', 'Kit Piston 0_75', 'Xtz 125', '71600', '400', '1', '1', '1'),
('103', 'Kit Piston 0_75', 'Ybr 125D', '71600', '400', '1', '1', '1'),
('104', 'Kit Piston 0_50', 'Xtz 125', '75600', '400', '1', '1', '1'),
('105', 'Kit Piston 0_50 ', 'Ybr 125D', '71600', '400', '1', '1', '1'),
('106', 'Sprocket 45T', 'Ybr125 Esd', '73900', '400', '1', '1', '1'),
('107', 'Sprocket 45T', 'Libero 125  Yd125', '73900', '400', '1', '1', '1'),
('108', 'Kit Piston 1_00', 'Yd 110', '74400', '400', '1', '1', '1'),
('109', 'Kit Piston 1_00', 'T 110E', '74400', '400', '1', '1', '1'),
('110', 'Kit Piston 0_25', 'Fz16', '74600', '400', '1', '1', '1'),
('111', 'Kit Piston 1_50', 'Dt 125K', '74600', '400', '1', '1', '1'),
('112', 'Kit Piston Standard', 'Fz16', '75400', '400', '1', '1', '1'),
('113', 'Kit Piston Standard', 'Sz16R', '75400', '400', '1', '1', '1'),
('114', 'Kit Piston 1_75', 'Dt 125K', '75800', '400', '1', '1', '1'),
('115', 'Kit Piston 0_25', 'Ybr 125D', '76100', '400', '1', '1', '1'),
('116', 'Kit Arrastre 14_45', 'Libero 125 Yd125', '76100', '400', '1', '1', '1'),
('117', 'Kit Piston 1_25', 'Xtz 125', '77500', '400', '1', '1', '1'),
('118', 'Kit Piston 1_25', 'Ybr125D', '77500', '400', '1', '1', '1'),
('119', 'Kit Piston 1_50', 'Rx115', '77700', '400', '1', '1', '1'),
('120', 'Banda Freno Tras', 'Lb80 Chappy', '78000', '400', '1', '1', '1'),
('121', 'Banda Freno Tras', 'Dt 100', '78000', '400', '1', '1', '1'),
('122', 'Banda Freno Tras', 'V80', '78000', '400', '1', '1', '1'),
('123', 'Kit Piston 0_25', 'Dt 175K', '79600', '400', '1', '1', '1'),
('124', 'Kit Piston 1_25', 'Dt 125K', '80600', '400', '1', '1', '1'),
('126', 'Kit Piston 0_50 ', 'Dt 125K', '80600', '400', '1', '1', '1'),
('127', 'Pastilla Freno Tras', 'Fazer Blue', '81200', '400', '1', '1', '1'),
('128', 'Pastilla Freno Tras', 'Fz6', '81200', '400', '1', '1', '1'),
('129', 'Pastilla Freno Tras ', 'Yzf - R1', '81200', '400', '3', '1', '1'),
('130', 'Guardabarro Trasero Interno', 'Bws125', '82600', '400', '1', '1', '1'),
('131', 'Pastilla Freno Delant', 'Crypton 115 - Te115', '86900', '400', '1', '1', '1'),
('132', 'Pastilla Freno Delant', 'R15', '86900', '400', '1', '1', '1'),
('133', 'Pastilla Freno Delant', 'Fino Original', '86900', '400', '1', '1', '1'),
('134', 'Kit Piston 1_00', 'Dt 175K', '87000', '400', '1', '1', '1'),
('135', 'Kit Arrastre 14_50', 'Xtz 125', '89200', '400', '1', '1', '1'),
('136', 'Manubrio', 'Xtz125 2013', '89700', '400', '1', '1', '1'),
('137', 'Piston Standard', 'Yw125 Despues Del2012', '89700', '400', '1', '1', '1'),
('138', 'Espejo Izquierdo', 'Xtz125 Despues Del2013', '90500', '400', '1', '1', '1'),
('139', 'Kit Arrastre 14_49', 'Libero 125 - Yd125', '90700', '400', '1', '1', '1'),
('140', 'Leva Clutch', 'Dt125', '92100', '400', '1', '1', '1'),
('141', 'Leva Clutch', 'Dt 100', '92100', '400', '1', '1', '1'),
('142', 'Leva Clutch', 'Dt 175K', '92100', '400', '1', '1', '1'),
('143', 'Carburador', 'Crypton 110', '93800', '400', '1', '1', '1'),
('144', 'Kit Arrastre 14_42', 'Sz-R', '95700', '400', '1', '1', '1'),
('145', 'Filtro Aire', 'Xt 600', '97500', '400', '3', '1', '1'),
('146', 'Piston 0_50', 'Fz15 2_0', '100800', '400', '3', '1', '1'),
('147', 'Pastilla Freno Trasera', 'Yzf-R3', '101200', '400', '3', '1', '1'),
('148', 'Polea Primaria', 'Yw125_Bws125', '102400', '400', '1', '1', '1'),
('149', 'Pastilla Freno Delant', 'Bws Yw 125X', '102800', '400', '1', '1', '1'),
('150', 'Kit Piston Standard', 'Dt 125K', '105100', '400', '1', '1', '1'),
('151', 'Polea Fija Segundaria', 'Ya90', '107900', '400', '3', '1', '1'),
('152', 'Kit Arrastre 15_47', 'R15 Despues Del 2013', '111800', '400', '1', '1', '1'),
('153', 'Cilindro Completo', 'Crypton 110', '138500', '400', '3', '1', '1'),
('154', 'Pastilla Freno Delant', 'Xtz250Z Tenere', '143800', '400', '1', '1', '1'),
('155', 'Balinera Sac 3048-1 Inferior', 'R15', '144400', '400', '1', '1', '1'),
('156', 'Piston Standard', 'Ybr 250', '145700', '400', '1', '1', '1'),
('157', 'Piston Standard', 'Xtz 250', '145700', '400', '1', '1', '1'),
('158', 'Cilindro Completo', 'Libero 110', '150100', '400', '1', '1', '1'),
('159', 'Kit Sprocket', 'Xt660 15_45', '151800', '400', '3', '1', '1'),
('160', 'Kit Piston Standard', 'Xtz 125', '155000', '400', '1', '1', '1'),
('161', 'Kit Piston Standard', 'Ybr 125D', '155000', '400', '1', '1', '1'),
('162', 'Kit Arrastre 15_45', 'Xt 600', '161500', '400', '3', '1', '1'),
('163', 'Kit Piston 0_50', 'Rx 115', '229100', '400', '1', '1', '1'),
('164', 'Pastilla Freno Delant Lleva 2 Juego', 'Fz1S', '240400', '400', '1', '1', '1'),
('165', 'Pastilla Freno Delt', 'Xtz 250', '16200', '400', '2', '1', '1'),
('166', 'Kit Piston 0_25', 'Tvs Tvs100', '70000', '400', '1', '2', '1'),
('167', 'Pastilla Freno Delant', 'Suzuki Ts125Cr', '14400', '400', '1', '3', '1'),
('168', 'Pastilla Freno Ts', 'Ts125Cr', '14800', '400', '1', '3', '1'),
('169', 'Pastilla Freno Traseraero', 'Drz 400', '15400', '400', '2', '3', '1'),
('170', 'Pastilla Freno Trasera', 'V_Strom', '15400', '400', '3', '3', '1'),
('171', 'Pastilla Freno Delant', 'Viva_R', '15400', '200', '1', '3', '1'),
('172', 'Pastilla Freno Tras', 'Dr650', '15400', '400', '3', '3', '1'),
('173', 'Filtro Aire', 'Gs125', '15700', '400', '1', '3', '1'),
('174', 'Filtro Aire', 'Gsx150', '15700', '400', '1', '3', '1'),
('175', 'Pastilla Freno Delant', 'Gz 150', '16100', '400', '1', '3', '1'),
('176', 'Banda Freno Delantera', 'Lets 110', '22100', '400', '1', '3', '1'),
('177', 'Banda Freno Tras', 'Ax4', '25500', '400', '1', '3', '1'),
('178', 'Banda Freno Delant', 'Viva Cl', '26600', '400', '1', '3', '1'),
('179', 'Manilar Izquierdo', 'Dr650', '27000', '400', '3', '3', '1'),
('180', 'Filtro Aire', 'Viva_R', '27400', '400', '1', '3', '1'),
('181', 'Piston Standard', 'Gn125H', '31200', '400', '1', '3', '1'),
('182', 'Pastilla Freno Delantera', 'Gs125', '31700', '400', '1', '3', '1'),
('183', 'Pastilla Freno Delantera', 'Gsx150', '31700', '400', '1', '3', '1'),
('184', 'Banda Freno Tras', 'Gixxer Es Banda', '32900', '400', '1', '3', '1'),
('185', 'Filtro Aire', 'Gz150A', '35000', '400', '1', '3', '1'),
('186', 'Pastilla Freno Delant', 'Gs150R', '35300', '400', '1', '3', '1'),
('187', 'Pastilla Freno Delant', 'Gn125H', '35500', '400', '1', '3', '1'),
('188', 'Filtro Aire', 'Gs150R', '40200', '400', '1', '3', '1'),
('189', 'Piston Standard', 'Gs150R', '40300', '400', '1', '3', '1'),
('190', 'Pastilla Freno Tras', 'Best', '41500', '400', '3', '3', '1'),
('191', 'Pastilla Freno Tras', 'Viva', '41500', '400', '1', '3', '1'),
('192', 'Sprocket 34T', 'Vivax', '43600', '400', '1', '3', '1'),
('193', 'Sprocket 34T', 'Best', '43600', '400', '3', '3', '1'),
('194', 'Sprocket 34T', 'Ax4', '43600', '400', '1', '3', '1'),
('195', 'Filtro Aire', 'Inazuma', '44600', '400', '1', '3', '1'),
('196', 'Sprocket 35T', 'Hayate Gr110D', '46500', '400', '1', '3', '1'),
('197', 'Pastilla Freno Delant', 'Step 125', '47500', '400', '1', '3', '1'),
('198', 'Pastilla Freno Delant', 'Viva_R', '53300', '400', '1', '3', '1'),
('199', 'Sprocket 45T', 'Gixxer Cadena 428X132', '63600', '400', '1', '3', '1'),
('200', 'Kit Piston 0_75', 'Gn125H', '66800', '400', '1', '3', '1'),
('201', 'Kit Sprocket', 'Gs500 16_39', '67400', '400', '3', '3', '1'),
('202', 'Kit Piston 0_50', 'Vivax_R', '67700', '200', '1', '3', '1'),
('203', 'Kit Piston 0_50', 'Viva150', '67700', '400', '1', '3', '1'),
('204', 'Kit Piston 0_50', 'Ts185', '69300', '400', '1', '3', '1'),
('205', 'Kit Piston 0_25', 'Ax_4', '69700', '400', '1', '3', '1'),
('206', 'Kit Piston Standard', 'Ax115', '77000', '400', '1', '3', '1'),
('207', 'Kit Piston 0_25', 'Ax115', '77000', '400', '1', '3', '1'),
('208', 'Kit Piston Standard', 'Ts125', '78300', '400', '1', '3', '1'),
('209', 'Pastilla Freno Tras', 'VStrom', '81200', '400', '3', '3', '1'),
('210', 'Kit Arrastre 15_41', 'Gsr150', '89300', '400', '1', '3', '1'),
('211', 'Kit Sprocket 15_43', 'Dr650', '90000', '400', '3', '3', '1'),
('212', 'Kit Sprocket', 'Xf650 15_43', '90000', '400', '3', '3', '1'),
('213', 'Kit Sprocket', 'Dr200 15_45', '95000', '400', '2', '3', '1'),
('214', 'Kit Piston 0_50', 'Dr200 ', '95800', '400', '1', '3', '1'),
('215', 'Filtro Aire', 'Dl650Abs', '97500', '400', '3', '3', '1'),
('216', 'Pastilla Freno Delant', 'Dr650', '148700', '400', '1', '3', '1'),
('217', 'Sprocket 47T', 'Dl650 K4-K5', '177600', '400', '1', '3', '1'),
('218', 'Piston Standard', 'Xf650', '179000', '400', '3', '3', '1'),
('219', 'Piston Standard', 'Dr650', '179000', '400', '3', '3', '1'),
('220', 'Pastilla Freno Tras', 'Dr650', '187200', '400', '3', '3', '1'),
('221', 'Pastilla Freno Trasera', 'Dr350', '187200', '400', '3', '3', '1'),
('222', 'Mofle Suzuki', 'Gs125 Modelo 2007 Al 2011', '269700', '400', '1', '3', '1'),
('223', 'Pastilla Freno Delantera', 'Duke 200', '15400', '400', '2', '4', '1'),
('224', 'Pastilla Freno Delantera', 'Ktm 390', '15400', '400', '3', '4', '1'),
('225', 'Pastilla Trasera', 'Ktm 200', '24800', '400', '2', '4', '1'),
('226', 'Freno Delant 2', 'Kawasaki Z1000', '344300', '400', '3', '5', '1'),
('227', 'Pastilla Freno Delant', 'Victor S Y M', '14800', '400', '3', '5', '1'),
('228', 'Pastilla Freno Tras', 'Kdx125', '14800', '400', '2', '5', '1'),
('229', 'Pastilla Freno Trasera', 'Kmx 125', '15200', '400', '3', '5', '1'),
('230', 'Pastilla Freno Delant', 'Zx 130', '15400', '400', '3', '5', '1'),
('231', 'Kit Arrastre 14_47', 'Klx', '81800', '400', '3', '5', '1'),
('232', 'Kit Arrastre 14_50', 'Kmx125', '98300', '400', '3', '5', '1'),
('233', 'Pastilla Freno Trasera', 'Klx250', '14800', '400', '3', '5', '1'),
('234', 'Manilar Izquierdo', 'Honda Cbf150', '11900', '400', '1', '6', '1'),
('235', 'Filtro Aire', 'Cbf125', '13900', '400', '1', '6', '1'),
('236', 'Banda Freno Delant', 'Titan', '14300', '400', '1', '6', '1'),
('237', 'Banda Freno Tras', 'Xl 125', '14400', '400', '1', '6', '1'),
('238', 'Pastilla Freno Delant', 'Cg125', '14800', '400', '1', '6', '1'),
('239', 'Pastilla Freno Delant', 'Xr600', '14800', '400', '1', '6', '1'),
('240', 'Pastilla Freno Delant', 'Xr250', '14800', '400', '2', '6', '1'),
('241', 'Banda Freno Delantera', 'Splendor', '15000', '400', '1', '6', '1'),
('242', 'Pastilla Freno Traseraero', 'Xr650', '15400', '400', '3', '6', '1'),
('243', 'Pastilla Freno Delant', 'Cbf125', '15400', '400', '1', '6', '1'),
('244', 'Pastilla Freno', 'Ybr 125Dx', '15600', '400', '1', '6', '1'),
('245', 'Filtro Aire', 'Rtr160', '15900', '400', '1', '6', '1'),
('246', 'Manilar Izquierdo', 'Cbf150', '16000', '400', '1', '6', '1'),
('247', 'Pastilla Freno Delant', 'Splendor', '16100', '400', '1', '6', '1'),
('248', 'Pastilla Freno Delant', 'Cbf150', '16100', '400', '1', '6', '1'),
('249', 'Filtro Aire', 'Rtr180', '16700', '400', '1', '6', '1'),
('250', 'Posapie Frontal Derecho', 'Nxr125', '18900', '400', '1', '6', '1'),
('251', 'Posapie Frontal Derecho', 'Xlr125', '18900', '400', '1', '6', '1'),
('252', 'Posapie Frontal Derecho', 'Xr200', '18900', '400', '1', '6', '1'),
('253', 'Filtro Aire', 'Deluxe Mn Nxg Original', '20900', '400', '1', '6', '1'),
('254', 'Filtro Aire', 'Deluxe Mn Euroii', '20900', '400', '1', '6', '1'),
('255', 'Manilar Izquierdo', 'Xl125', '21000', '400', '1', '6', '1'),
('256', 'Manilar Izquierdo', 'Xl185', '21000', '400', '2', '6', '1'),
('257', 'Manilar Izquierdo', 'Xlr', '21000', '400', '1', '6', '1'),
('258', 'Manilar Izquierdo', 'Nxr', '21000', '400', '1', '6', '1'),
('259', 'Filtro Aire', 'E_Storm', '22900', '400', '1', '6', '1'),
('260', 'Filtro Aire', 'Cb125E', '22900', '400', '1', '6', '1'),
('261', 'Filtro Aire', 'Cb190R', '23000', '400', '2', '6', '1'),
('262', 'Filtro Aire', 'Cb160', '23000', '400', '1', '6', '1'),
('263', 'Carenaje Farola', 'Invicta K21', '23900', '400', '1', '6', '1'),
('264', 'Espejo Izquierdo', 'Cbf150 Diamante', '23900', '400', '1', '6', '1'),
('265', 'Espejo Izquierdo', 'Cb110 Diamante', '23900', '400', '1', '6', '1'),
('266', 'Filtro Aire', 'Dream Neo', '24900', '400', '1', '6', '1'),
('267', 'Leva Clutch', 'Cb110', '26000', '400', '1', '6', '1'),
('268', 'Manubrio', 'Dream', '26900', '400', '1', '6', '1'),
('269', 'Manubrio', 'Cb 110', '26900', '400', '1', '6', '1'),
('270', 'Filtro Aire', 'Cbf150', '27900', '400', '1', '6', '1'),
('271', 'Sprocket 56T', 'Xl125', '30200', '400', '1', '6', '1'),
('272', 'Balinera 22X56X15', 'Elite', '33900', '400', '1', '6', '1'),
('273', 'Filtro Aire', 'Xr125L', '35800', '400', '1', '6', '1'),
('274', 'Filtro Aire', 'Nxr125', '35800', '400', '1', '6', '1'),
('275', 'Kit Arrastre 14_39', 'C90', '41100', '400', '1', '6', '1'),
('276', 'Guardabarro Trasero Frontal', 'Cbf125', '42800', '400', '1', '6', '1'),
('277', 'Balinera 13X37X12', 'Xr250 Tornado', '44000', '400', '1', '6', '1'),
('278', 'Tapa Izquierdo Tanque Gas', 'Cbf125', '44800', '400', '1', '6', '1'),
('279', 'Kit Piston 1_25', 'Biz', '50500', '400', '1', '6', '1'),
('280', 'Kit Piston 1_25', 'Sleek', '50500', '400', '1', '6', '1'),
('281', 'Kit Piston 1_25', 'Eco', '50500', '400', '1', '6', '1'),
('282', 'Kit Piston 0_50', 'Biz', '53900', '400', '1', '6', '1'),
('283', 'Balinera 17X42X12', 'Cbf150', '54800', '400', '1', '6', '1'),
('284', 'Defensa Motor', 'Cbf150', '56100', '400', '1', '6', '1'),
('285', 'Kit Piston 0_25', 'Sleek', '56900', '400', '1', '6', '1'),
('286', 'Pastilla Freno Trasera', 'Invicta150', '77900', '400', '1', '6', '1'),
('287', 'Pastilla Freno Trasera', 'Cb190R', '77900', '400', '1', '6', '1'),
('288', 'Kit Arrastre 14_42', 'Cb110  428H-118L', '78200', '400', '1', '6', '1'),
('289', 'Kit Piston 0_75', 'Rtx', '79000', '400', '1', '6', '1'),
('290', 'Kit Piston 0_75', 'Invicta', '79000', '400', '1', '6', '1'),
('291', 'Kit Piston 0_50', 'Cbf150', '79000', '400', '1', '6', '1'),
('292', 'Kit Piston 1_25', 'Cbf150', '79900', '400', '1', '6', '1'),
('293', 'Kit Piston 0_75', 'Xl200', '81100', '400', '1', '6', '1'),
('294', 'Kit Piston 0_25', 'Invicta', '81600', '400', '1', '6', '1'),
('295', 'Kit Piston 0_25', 'Rtx', '81600', '400', '1', '6', '1'),
('296', 'Kit Piston 0_25', 'Cbf150', '81600', '400', '1', '6', '1'),
('297', 'Kit Piston 1_00', 'Xl200', '83900', '400', '2', '6', '1'),
('298', 'Kit Piston 1_00', 'Xr200R', '83900', '400', '2', '6', '1'),
('299', 'Kit Arrastre 14_43', 'Cbf125 428', '90500', '400', '1', '6', '1'),
('300', 'Kit Piston 0_50', 'Xl200', '92100', '400', '2', '6', '1'),
('301', 'Kit Piston 0_50', 'Xr200R', '92100', '400', '1', '6', '1'),
('302', 'Kit Arrastre 14_41T', 'Drean Neo', '95000', '400', '1', '6', '1'),
('303', 'Kit Piston Standard', 'Cb125E', '96900', '400', '1', '6', '1'),
('304', 'Kit Piston Standard', 'E_Storm', '96900', '400', '1', '6', '1'),
('305', 'Kit Piston Standard', 'Brio', '96900', '400', '1', '6', '1'),
('306', 'Balinera Derecho 30X58X17', 'Cbf150', '96900', '400', '1', '6', '1'),
('307', 'Banda Freno Delantera', 'Nxr125', '98300', '400', '1', '6', '1'),
('308', 'Kit Piston Standard', 'Cb190R', '99900', '400', '1', '6', '1'),
('309', 'Kit Piston 0_25', 'Cb190R', '122800', '400', '1', '6', '1'),
('310', 'Kit Piston 0_25', 'Cbf150', '124600', '400', '1', '6', '1'),
('311', 'Kit Piston 0_25', 'Invicta', '124600', '400', '1', '6', '1'),
('312', 'Kit Piston 0_25', 'CBR200', '124600', '400', '2', '6', '1'),
('313', 'Kit Arrastre 14_42', 'Cb110 428Hx118L', '125000', '400', '1', '6', '1'),
('314', 'Pastilla Freno Delantera', 'Cbr250 Std', '128900', '400', '2', '6', '1'),
('315', 'Kit Arrastre 14_43', 'Cbf125 Cadena 420', '129900', '400', '1', '6', '1'),
('316', 'Visor Farola', 'Xr150L', '130000', '400', '1', '6', '1'),
('317', 'Kit Arrastre 13_39', 'Xr250 Tornado', '132400', '400', '1', '6', '1'),
('318', 'Kit Piston 0_25', 'Cb110', '139900', '400', '1', '6', '1'),
('319', 'Cilindro Completo', 'Cbf150', '154300', '400', '1', '6', '1'),
('320', 'Carenaje', 'Cbf125', '155000', '400', '1', '6', '1'),
('321', 'Kit Piston Standard', 'Nxr125', '262900', '400', '1', '6', '1'),
('322', 'Leva Clutch', 'Bajaj Discover100', '4500', '400', '1', '7', '1'),
('323', 'Leva Clutch', 'Discover125', '4500', '400', '1', '7', '1'),
('324', 'Leva Clutch', 'Pulsar 180', '5900', '400', '1', '7', '1'),
('325', 'Filtro Aire', 'Boxer K-Tec', '7400', '400', '1', '7', '1'),
('326', 'Manilar Derecho', 'Pulsar 180', '11300', '400', '1', '7', '1'),
('327', 'Filtro Aire', 'Discover135', '12500', '400', '1', '7', '1'),
('328', 'Filtro Aire', 'Discover100', '12500', '400', '1', '7', '1'),
('329', 'Banda Freno Tras', 'Caliber', '15200', '400', '1', '7', '1'),
('330', 'Leva Clutch', 'Boxer Tec', '15300', '400', '1', '7', '1'),
('331', 'Pastilla Freno Delantera', '200Ns', '15400', '400', '1', '7', '1'),
('332', 'Pastilla Freno', 'Pulsar 180', '15600', '400', '1', '7', '1'),
('333', 'Filtro Aire', 'Discover 100', '17000', '400', '1', '7', '1'),
('334', 'Manilar Derecho', '200Ns', '17900', '400', '2', '7', '1'),
('335', 'Manilar Izquierdo Bajaj', '200Ns', '18100', '400', '2', '7', '1'),
('336', 'Posapie Trasero Derecho', '200Ns', '20400', '400', '2', '7', '1'),
('337', 'Filtro Aire Bajaj', 'Discover100M', '21200', '400', '1', '7', '1'),
('338', 'Cubierta Velocimetro', 'Pulsar135Ls', '22500', '400', '1', '7', '1'),
('339', 'Guardabarro Trasero', 'Discover125St', '22600', '400', '1', '7', '1'),
('340', 'Sprocket 42T', 'Boxer Bm150', '23000', '400', '1', '7', '1'),
('341', 'Pastilla Freno Delantera', '200 Ns', '23800', '400', '2', '7', '1'),
('342', 'Guardabarro Trasero Frontal', 'Boxer 100', '24600', '400', '1', '7', '1'),
('343', 'Pastilla Tras', 'Pulsar 220S', '24800', '400', '2', '7', '1'),
('344', 'Pastilla Tras', 'Pulsar 200Ns', '24800', '400', '2', '7', '1'),
('345', 'Pastilla Freno Delant', 'Pulsar 200Rs', '24800', '400', '1', '7', '1'),
('346', 'Guardabarro Trasero', 'Pulsar 180', '26100', '400', '1', '7', '1'),
('347', 'Pastilla Freno Trasera', 'Pulsar 220Fi', '26300', '400', '1', '7', '1'),
('348', 'Guardabarro Trasero FormaU', 'Pulsar 180', '26500', '400', '1', '7', '1'),
('349', 'Espejo Derecho', 'Discover 125 St', '26500', '400', '1', '7', '1'),
('350', 'Espejo Izquierdo', 'Discover 125 St', '26500', '400', '1', '7', '1'),
('351', 'Guardapolvo Carenaje', 'Discovery', '28900', '400', '1', '7', '1'),
('352', 'Defensa Bajaj', 'Discover 100M', '29100', '400', '1', '7', '1'),
('353', 'Guardabarro Trasero', 'Pulsar 150Ns', '29300', '400', '1', '7', '1'),
('354', 'Tapa Tanque Gas Izquierdo', 'Pulsar 180 Ug', '29800', '400', '1', '7', '1'),
('355', 'Guardapolvo Carenaje', 'Boxer Tec', '30100', '400', '1', '7', '1'),
('356', 'Posapie Frontal Derecho', 'Pulsar 200Ns', '34500', '400', '1', '7', '1'),
('357', 'Kit Piston 0_25', 'Boxerbm', '34700', '400', '1', '7', '1'),
('358', 'Tapa Tanque Gas Derecho', 'Pulsar 180 Ug', '36200', '400', '1', '7', '1'),
('359', 'Cubierta Mofle', 'Platino', '36500', '400', '1', '7', '1'),
('360', 'Tapa Derecho', 'Discover 125St', '38200', '400', '1', '7', '1'),
('361', 'Tapa Tanque Gas Derecho', 'Pulsar200', '38400', '400', '2', '7', '1'),
('362', 'Espejo Derecho', 'Pulsar 220F', '38600', '400', '2', '7', '1'),
('363', 'Kit Piston 0_50', 'Boxer bm 100', '40000', '400', '1', '7', '1'),
('364', 'Defensa', 'Fr Discover 125 St', '40500', '400', '1', '7', '1'),
('365', 'Defensa', 'Pulsar Black', '46500', '400', '1', '7', '1'),
('366', 'Manubrio', 'Pulsarii', '46800', '400', '1', '7', '1'),
('367', 'Kit Arrastre 14_42', 'Platino', '47500', '400', '1', '7', '1'),
('368', 'Visor Carenaje', 'Pulsar Rs200', '47900', '400', '1', '7', '1'),
('369', 'Kit Arrastre 15_43', 'P135 Cadena 428X130', '48100', '400', '1', '7', '1'),
('370', 'Kit Piston 1_00', 'Xcd125', '48600', '400', '1', '7', '1'),
('371', 'Tapa Velocimetro', 'Pulsar Ii', '49800', '400', '1', '7', '1'),
('372', 'Soporte Posapie Trasero Izquierdo', 'Bajaj Discover', '49900', '400', '1', '7', '1'),
('373', 'Guardabarro Trasero Frontal', 'Pulsar 135', '50500', '400', '1', '7', '1'),
('374', 'Tapa Derecho', 'Discover', '50800', '400', '1', '7', '1'),
('375', 'Manubrio Izquierdo', 'Pulsar 200Ns', '54900', '400', '1', '7', '1'),
('376', 'Guardabarro Trasero Frontal', 'Discover125_135', '55500', '400', '1', '7', '1'),
('377', 'Kit Arrastre 15_44', 'Pulsar Ii', '58500', '400', '1', '7', '1'),
('378', 'Tapa Izquierdo', 'Pulsar135Ls', '59100', '400', '1', '7', '1'),
('379', 'Kit Piston 0_75', 'Boxer Ct-S1D', '62400', '400', '1', '7', '1'),
('380', 'Kit Piston 0_50', 'Boxer Ct-S1D', '62400', '400', '1', '7', '1'),
('381', 'Guardabarro Trasero Frontal', 'Pulsar 180 Ug', '63300', '400', '1', '7', '1'),
('382', 'Guardabarro Trasero Frontal', 'Pulsar 200 Oil', '63300', '400', '2', '7', '1'),
('383', 'Guardabarro Trasera Frontal', 'Pulsar200Ug', '63300', '400', '2', '7', '1'),
('384', 'Kit Sprocket 14_39', 'Pulsar Ug', '64700', '400', '1', '7', '1'),
('385', 'Kit Piston 0_75', 'Pulsar135', '64900', '400', '1', '7', '1'),
('386', 'Manubrio', 'Pulsar 180 Dts-I', '64900', '400', '1', '7', '1'),
('387', 'Guardabarro Trasero', 'Pulsar135', '65100', '400', '1', '7', '1'),
('388', 'Kit Piston 0_25', 'Discover100M', '65200', '400', '1', '7', '1'),
('389', 'Kit Piston 0_25', 'Pulsar135', '65300', '400', '1', '7', '1'),
('390', 'Defensa', 'Discover 125', '67600', '400', '1', '7', '1'),
('391', 'Tapa Derecho', 'Boxer Ct-S1D', '68600', '400', '1', '7', '1'),
('392', 'Kit Arrastre 14_42', 'Bajaj Boxer Bm150', '70100', '400', '1', '7', '1'),
('393', 'Tapa Izquierdo', 'Pulsarii', '72100', '400', '1', '7', '1'),
('394', 'Tapa Izquierdo', 'Pulsar200', '72100', '400', '2', '7', '1'),
('395', 'Kit Arrastre 14_42', 'Disover 100 Paso 420', '78300', '400', '1', '7', '1'),
('396', 'Kit Arrastre 14_42', 'Boxer Bm150', '78700', '400', '1', '7', '1'),
('397', 'Kit Sprocket 39_14', '200Ns', '82400', '400', '2', '7', '1'),
('398', 'Kit Arrastre 14_43', 'Discover 150St', '83900', '400', '1', '7', '1'),
('399', 'Guardabarro Trasero', 'Ns200 Fi', '89400', '400', '1', '7', '1'),
('400', 'Kit Piston 0_25', 'Pulsar 200', '89400', '400', '2', '7', '1'),
('401', 'Carenaje', 'Pulsar135 Con Visor', '93700', '400', '1', '7', '1'),
('402', 'Kit Piston 0_25', 'Pulsar200Ns', '94700', '400', '1', '7', '1'),
('403', 'Kit Piston 0_25', 'Pulsar 180', '103400', '400', '1', '7', '1'),
('404', 'Cola Sillin', 'Discover100', '105000', '400', '1', '7', '1'),
('405', 'Tapa Clutch', 'Boxer Tec', '110700', '400', '1', '7', '1'),
('406', 'Soporte Carenaje', 'Pulsar220F', '145400', '400', '2', '7', '1'),
('407', 'Cilindro Completo', 'Mrx150', '154300', '400', '1', '7', '1'),
('408', 'Kit Arrastre 14_42', 'Boxer Bm150', '159500', '400', '1', '7', '1'),
('409', 'Kit Arrastre 14_39', 'Pulsar Ug', '159800', '400', '1', '7', '1'),
('410', 'Kit Arrastre 14_43', 'Discover 150St', '168000', '400', '1', '7', '1'),
('411', 'Cubierta Tanque Gasolina', 'Pulsar135', '169500', '400', '1', '7', '1'),
('412', 'Cilindro Completo', 'Boxer Bm100', '186300', '400', '1', '7', '1'),
('413', 'Cilindro Completo', 'Boxer Bm100', '186300', '400', '1', '7', '1'),
('414', 'Ciguenal', 'Boxer Ct-S1D', '216200', '400', '1', '7', '1'),
('415', 'Ciguenal', 'Platino 100', '216200', '400', '1', '7', '1'),
('416', 'Cilindro Completo', 'Pulsar 180Ug', '219700', '400', '1', '7', '1'),
('417', 'Cilindro Completo', 'Platino 110', '224000', '400', '1', '7', '1'),
('418', 'Cilindro Completo', 'Pulsar 220S', '278600', '400', '2', '7', '1'),
('419', 'Cilindro Completo', 'Pulsar 220F', '278600', '400', '2', '7', '1'),
('420', 'Ciguenal', 'Discover 100M 4', '291400', '400', '1', '7', '1'),
('421', 'Ciguenal', 'Bm 100', '291400', '400', '1', '7', '1'),
('422', 'Ciguenal', 'Pulsar 135Sl', '311400', '400', '1', '7', '1'),
('423', 'Mofle', 'Platino 100 Sport', '328500', '400', '1', '7', '1'),
('424', 'Manilar Izquierdo', 'Akt Flex125', '9900', '400', '1', '8', '1'),
('425', 'Posapie Trasero Izquierdo', 'NKD 125', '10900', '400', '1', '8', '1'),
('426', 'Tapa Izquierdo', '100S', '11000', '400', '1', '8', '1'),
('427', 'Pastilla Freno Tras', 'Jet5-R', '11500', '400', '1', '8', '1'),
('428', 'Pastilla Freno Delant', 'Ak110', '12800', '400', '1', '8', '1'),
('429', 'Bandas Freno Tras', 'Ak110', '14000', '400', '1', '8', '1'),
('430', 'Pastilla Freno Tras', 'Rtx', '15200', '400', '1', '8', '1'),
('431', 'Pastilla Freno Delantero', '125 sl', '15400', '400', '1', '8', '1'),
('432', 'Pastilla Freno Delant', 'Ak 100S', '17100', '400', '1', '8', '1'),
('433', 'Espejo Derecho', 'Cr5', '17400', '400', '1', '8', '1'),
('434', 'Espejo Derecho', 'Evo125 10Mm', '17400', '400', '1', '8', '1'),
('435', 'Espejo Izquierdo_Rd', 'Evo125 10Mm', '17400', '400', '1', '8', '1'),
('436', 'Pastilla Freno Delant', 'Rr180Xm', '17600', '400', '1', '8', '1'),
('437', 'Espejo Derecho', 'Evo150R3', '17900', '400', '1', '8', '1'),
('438', 'Espejo Derecho', 'Evo125', '17900', '400', '1', '8', '1'),
('439', 'Bandas Freno Tras', 'Nkd', '18000', '400', '1', '8', '1'),
('440', 'Espejo Derecho', 'Nkd 10Mm', '18000', '400', '1', '8', '1'),
('441', 'Espejo Izquierdo_Rd', 'Evo150 10Mm', '18000', '400', '1', '8', '1'),
('442', 'Espejo Izquierdo_Rd', 'Nkd 10Mm', '18000', '400', '1', '8', '1'),
('443', 'Espejo Derecho', 'Evo150 10Mm', '18000', '400', '1', '8', '1'),
('444', 'Pastilla Freno Tras', 'Rtx150S', '18200', '400', '1', '8', '1'),
('445', 'Pastilla Freno Delant', 'Rtx150', '18700', '400', '1', '8', '1'),
('446', 'Pastilla Freno Tras', 'Tt250', '19800', '400', '1', '8', '1'),
('447', 'Filtro Aire', 'Ttr125', '20200', '400', '1', '8', '1'),
('448', 'Filtro Aire', 'Ttr150', '20200', '400', '1', '8', '1'),
('449', 'Pastilla Freno Delant', 'Ttr 150', '20700', '400', '1', '8', '1'),
('450', 'Pastilla Freno Delant', 'Evo', '20700', '400', '1', '8', '1'),
('451', 'Pastilla Freno Tras', 'Ttx180', '20700', '400', '1', '8', '1'),
('452', 'Pastilla Freno Tras', 'Rtr180', '20700', '400', '1', '8', '1'),
('453', 'Pastilla Freno Delant', 'Jet4', '21300', '400', '1', '8', '1'),
('454', 'Pastilla Freno Delant', 'Dynamic', '21300', '400', '1', '8', '1'),
('455', 'Pinon 14T', 'Ak110', '27600', '400', '1', '8', '1'),
('456', 'Guardabarro Trasero', '125Sl', '29400', '400', '1', '8', '1'),
('457', 'Espejo Derecho', 'Jet4 Diamante', '32000', '400', '1', '8', '1'),
('458', 'Espejo Derecho', 'Dynamicic', '32000', '400', '1', '8', '1'),
('459', 'Cola Guardabarro Trasero', 'Dynamic', '33300', '400', '1', '8', '1'),
('460', 'Balinera 32005Jr', 'Xm200', '35700', '400', '2', '8', '1'),
('461', 'Kit Arrastre 14_38', 'Nkd', '36200', '400', '1', '8', '1'),
('462', 'Aleta Tanque Derecho', 'Ttr150', '38100', '400', '1', '8', '1'),
('463', 'Tapa Derecho', 'Evo125', '41600', '400', '1', '8', '1'),
('464', 'Tapa Derecho', 'Evo150Ne', '41600', '400', '1', '8', '1'),
('465', 'Guardabarro Trasero', 'Dynamic Pro', '43400', '400', '1', '8', '1'),
('466', 'Guardabarro Frontal', 'Ttr150', '55200', '400', '1', '8', '1'),
('467', 'Guardabarro Frontal', 'Ttr125 Color Gris', '55200', '400', '1', '8', '1'),
('468', 'Cubierta Velocimetro', 'Flex Cyclon', '55500', '400', '1', '8', '1'),
('469', 'Kit Piston0_25', 'Jetix', '56200', '400', '1', '8', '1'),
('470', 'Kit Arrastre 15_41', 'Evo Ne125', '63500', '400', '1', '8', '1'),
('471', 'Kit Arrastre 14_34', 'Flex125', '64000', '400', '1', '8', '1'),
('472', 'Piston Standard', 'Ak200Sm', '65600', '400', '1', '8', '1'),
('473', 'Kit Piston Standard', 'Ne150', '67300', '400', '1', '8', '1'),
('474', 'Kit Piston Standard', 'Ttr150', '67300', '400', '1', '8', '1'),
('475', 'Defensa Slider', 'Ttr150', '73400', '400', '1', '8', '1'),
('476', 'Defensa Slider', 'Ttr125', '73400', '400', '1', '8', '1'),
('477', 'Kit Arrastre 15_41', 'Evo Ne125', '79200', '400', '1', '8', '1'),
('478', 'Kit Arrastre 15_41', 'Evo Ne150', '79200', '400', '1', '8', '1'),
('479', 'Kit Arrastre 15_42', 'Rtx150', '87500', '400', '1', '8', '1'),
('480', 'Manubrio', 'Dynamic_R', '94700', '400', '1', '8', '1'),
('481', 'Manubrio', 'Flex125 Cyclon', '109700', '400', '1', '8', '1'),
('482', 'Cilindro Completo', 'Rtx', '154300', '400', '1', '8', '1'),
('483', 'Mofle', 'Nkd', '198600', '400', '1', '8', '1'),
('484', 'Mofle', 'Nkdr', '198600', '400', '1', '8', '1'),
('485', 'Mofle', 'Ak125', '198600', '400', '1', '8', '1'),
('486', 'Ciguenal', 'Akt Evo 125 2012', '244700', '400', '1', '8', '1'),
('487', 'Ciguenal', 'Ak125Slr 2012', '244700', '400', '1', '8', '1');
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla PROVEEDORES
--
-- --------------------------------------------------------
CREATE TABLE PROVEEDORES (
   idProveedor int(11) NOT NULL,
   nombre varchar(100) NOT NULL,
   direccion varchar(200) NOT NULL,
   telefono varchar(200) NOT NULL,
   nit char(11) NOT NULL,
   estado bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Volcado de datos para la tabla PROVEEDORES
--
-- --------------------------------------------------------
INSERT INTO PROVEEDORES (idProveedor, nombre, direccion, telefono, nit, estado) VALUES
('1', 'Mundimotos SAS', 'Cl. 17 #15-9, Bogota, Colombia', '(1) 280 98 33', '900503045-5', 1);
-- --------------------------------------------------------
--
-- Indices de la tabla CARGO
--
-- --------------------------------------------------------
ALTER TABLE  CARGO
  ADD PRIMARY KEY (IDCARGO);
-- --------------------------------------------------------
--
-- Indices de la tabla CATEGORIA
--
ALTER TABLE CATEGORIA
  ADD PRIMARY KEY (idCategoria);
-- --------------------------------------------------------
--
-- Indices de la tabla EMPLEADO
--
-- --------------------------------------------------------
ALTER TABLE EMPLEADO
  ADD PRIMARY KEY (IDEMPLEADO),
  ADD KEY FK_EMPLEADO_USU (IDUSUARIO);
-- --------------------------------------------------------
--
-- Indices de la tabla MARCA
--
-- --------------------------------------------------------
ALTER TABLE MARCA
  ADD PRIMARY KEY (idMarca);
-- --------------------------------------------------------
--
-- Indices de la tabla PRODUCTOS
--
-- --------------------------------------------------------
ALTER TABLE PRODUCTOS
  ADD PRIMARY KEY (idProducto),
  ADD KEY FK_PRODUCTO_CATEGORIA (idCategoria),
  ADD KEY FK_PRODUCTO_MARCA (idMarca),
  ADD KEY FK_PRODUCTO_PROVEEDORES (idProveedor);
-- --------------------------------------------------------
--
-- Indices de la tabla PROVEEDORES
--
-- --------------------------------------------------------
ALTER TABLE PROVEEDORES
  ADD PRIMARY KEY (idProveedor);
-- --------------------------------------------------------
--
-- Indices de la tabla USUARIO
--
-- --------------------------------------------------------
ALTER TABLE USUARIO
  ADD PRIMARY KEY (IDUSUARIO),
  ADD KEY FK_USUARIO_CARGO (IDCARGO);
-- --------------------------------------------------------
--
-- AUTO_INCREMENT de las tablas volcadas
--
-- --------------------------------------------------------
--
-- AUTO_INCREMENT de la tabla CARGO
--
-- --------------------------------------------------------
ALTER TABLE CARGO
  MODIFY IDCARGO int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
-- --------------------------------------------------------
--
-- AUTO_INCREMENT de la tabla CATEGORIA
--
-- --------------------------------------------------------
ALTER TABLE CATEGORIA
  MODIFY idCategoria int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
-- --------------------------------------------------------
--
-- AUTO_INCREMENT de la tabla EMPLEADO
--
-- --------------------------------------------------------
ALTER TABLE EMPLEADO
  MODIFY IDEMPLEADO int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
-- --------------------------------------------------------
--
-- AUTO_INCREMENT de la tabla MARCA
--
-- --------------------------------------------------------
ALTER TABLE MARCA
  MODIFY idMarca int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
-- --------------------------------------------------------
--
-- AUTO_INCREMENT de la tabla PRODUCTOS
--
-- --------------------------------------------------------
ALTER TABLE PRODUCTOS
  MODIFY idProducto int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=488;
-- --------------------------------------------------------
--
-- AUTO_INCREMENT de la tabla PROVEEDORES
--
-- --------------------------------------------------------
ALTER TABLE PROVEEDORES
  MODIFY idProveedor int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
-- --------------------------------------------------------
--
-- AUTO_INCREMENT de la tabla USUARIO
--
-- --------------------------------------------------------
ALTER TABLE USUARIO
  MODIFY IDUSUARIO int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
-- --------------------------------------------------------
--
-- Restricciones para tablas volcadas
--
-- --------------------------------------------------------
--
-- Filtros para la tabla EMPLEADO
--
-- --------------------------------------------------------
ALTER TABLE EMPLEADO
  ADD CONSTRAINT FK_EMPLEADO_USU FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO (IDUSUARIO);
-- --------------------------------------------------------
-- Filtros para la tabla PRODUCTOS
--
-- --------------------------------------------------------
ALTER TABLE PRODUCTOS
  ADD CONSTRAINT FK_PRODUCTO_CATEGORIA FOREIGN KEY (idCategoria) REFERENCES categoria (idCategoria),
  ADD CONSTRAINT FK_PRODUCTO_MARCA FOREIGN KEY (idMarca) REFERENCES marca (idMarca),
  ADD CONSTRAINT FK_PRODUCTO_PROVEEDORES FOREIGN KEY (idProveedor) REFERENCES proveedores (idProveedor);
-- --------------------------------------------------------
--
-- Filtros para la tabla usuario
--
-- --------------------------------------------------------
ALTER TABLE USUARIO
  ADD CONSTRAINT FK_USUARIO_CARGO FOREIGN KEY (IDCARGO) REFERENCES CARGO (IDCARGO);
COMMIT;
-- --------------------------------------------------------