-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2022 a las 12:22:57
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jr-sneakers`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `usuario` varchar(20) CHARACTER SET latin1 NOT NULL,
  `nombre_zapatillas` varchar(100) CHARACTER SET latin1 NOT NULL,
  `talla` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  `precio` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `comentario` text NOT NULL,
  `zapatillas` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `usuario`, `comentario`, `zapatillas`) VALUES
(55, 'jorge', 'Estas zapatillas son perfectas para hacer deporte tipo runnin son cÃ³modas y ligeras ', 'Nike Pegasus');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_general`
--

CREATE TABLE `compras_general` (
  `id` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `nombre_zapatillas` varchar(100) NOT NULL,
  `talla` int(50) NOT NULL,
  `color` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  `precio` int(100) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras_general`
--

INSERT INTO `compras_general` (`id`, `usuario`, `nombre_zapatillas`, `talla`, `color`, `img`, `precio`, `fecha`) VALUES
(26, 'JORGE', 'Adidas Superstar', 38, 'blanco', 'adidas superstar', 76, '2022-12-15'),
(27, 'JORGE', 'Nike Air Force', 38, 'blanco', 'nike air force', 165, '2022-12-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` varchar(20) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasena` varchar(12) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `ciudad` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `correo`, `contrasena`, `calle`, `ciudad`) VALUES
('jorge', 'jorge@gmail.com', '1234', 'calle', 'Guadalajara');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zapatillas`
--

CREATE TABLE `zapatillas` (
  `nombre_zapatilla` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `precio` int(10) NOT NULL,
  `carpeta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `zapatillas`
--

INSERT INTO `zapatillas` (`nombre_zapatilla`, `descripcion`, `marca`, `precio`, `carpeta`) VALUES
('Adidas originals swi', 'Swift es un estilo informal de carreras creado para el uso diario.', 'adidas', 145, 'adidas originals swift'),
('Adidas Superstar', 'Si valoras la comodidad y el estilo sencillo, esta propuesta de la marca adidas es para ti.', 'adidas', 76, 'adidas superstar'),
('Asics resolution', 'Las zapatillas favorecen un ritmo ágil con una sensación de adhesión al campo.', 'asics', 135, 'asics resolution'),
('Asics tiger', 'La construcción robusta y el estilo clásico te garantizan un aspecto dinámico y cómodo.', 'asics', 70, 'asics tiger'),
('Converse all start', 'Versátil, a la moda, y se mantienen mejor cada vez que los llevas.', 'converse', 65, 'converse all start'),
('Converse Taylor ', 'Versátil, a la moda, y se mantienen mejor cada vez que los llevas.', 'converse', 92, 'converse taylor'),
('Nike Air Force', 'Una versión de zapatilla que combina el estilo clásico y los detalles modernos.', 'nike', 165, 'nike air force'),
('Nike Pegasus', 'Se caracteriza  por combinar amortiguación con reactividad y retorno de energía.', 'nike', 118, 'nike1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_carrito_usuario` (`usuario`),
  ADD KEY `FK1_carrito_zapatilla` (`nombre_zapatillas`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_usuario_comentario` (`usuario`),
  ADD KEY `FK2_zapatilla_comentario` (`zapatillas`);

--
-- Indices de la tabla `compras_general`
--
ALTER TABLE `compras_general`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_usuario` (`usuario`),
  ADD KEY `FK2_zapatillas` (`nombre_zapatillas`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario`);

--
-- Indices de la tabla `zapatillas`
--
ALTER TABLE `zapatillas`
  ADD PRIMARY KEY (`nombre_zapatilla`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `compras_general`
--
ALTER TABLE `compras_general`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `FK1_carrito_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK1_carrito_zapatilla` FOREIGN KEY (`nombre_zapatillas`) REFERENCES `zapatillas` (`nombre_zapatilla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `FK1_usuario_comentario` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK2_zapatilla_comentario` FOREIGN KEY (`zapatillas`) REFERENCES `zapatillas` (`nombre_zapatilla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compras_general`
--
ALTER TABLE `compras_general`
  ADD CONSTRAINT `FK1_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK2_zapatillas` FOREIGN KEY (`nombre_zapatillas`) REFERENCES `zapatillas` (`nombre_zapatilla`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
