-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-08-2020 a las 00:34:10
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rateyouranime`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animes`
--

CREATE TABLE `animes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `descripcion` text COLLATE utf16_spanish2_ci NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf16_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `animes`
--

INSERT INTO `animes` (`id`, `nombre`, `id_categoria`, `descripcion`, `rating`, `imagen`) VALUES
(1, 'Kimi ni Todoke', 1, 'Sawako Kuronuma, apodada \'Sadako\' por sus compañeros dado su parecido a Sadako Yamamura, siempre se ha expresado mal, o mejor dicho no sabe cómo hacerlo. Su mejor intento de una amable sonrisa es fácilmente confundido con un gesto psicótico o la cara del más aterrador espíritu maligno, impidiendo esto durante toda su vida que la gente conozca su dulce e inocente carácter. Hay rumores sobre que Sawako puede ver fantasmas, maldecir a las personas y traer mala suerte a quien se le aproxime. Pero cuando el popular muchacho Shouta Kazehaya, comienza a hablar con ella todo cambia; se encuentra en un nuevo mundo, tratando de hacer amigos, hablando con gente diferente y no puede agradecer lo suficiente a Kazehaya por darle estas oportunidades. Lento pero seguro florece un dulce amor entre los dos que deberá superar muchas circunstancias y obstáculos en el camino, especialmente las inseguridades y temores de ambos.', 0, '/public/images/kiminitodoke.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Shojo'),
(2, 'Shonnen'),
(3, 'Yaoi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_anime` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comentario` text COLLATE utf16_spanish2_ci NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf16_spanish2_ci NOT NULL,
  `contraseña` varchar(50) COLLATE utf16_spanish2_ci NOT NULL,
  `correo` varchar(50) COLLATE utf16_spanish2_ci NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `contraseña`, `correo`, `ts_create`) VALUES
(1, 'admin', '20051993', 'napolitano.ariana93@gmail.com', '0000-00-00 00:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `animes`
--
ALTER TABLE `animes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre_usuario` (`id_usuario`),
  ADD KEY `id_anime` (`id_anime`),
  ADD KEY `id_anime_2` (`id_anime`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`correo`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `animes`
--
ALTER TABLE `animes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `animes`
--
ALTER TABLE `animes`
  ADD CONSTRAINT `animes_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_anime`) REFERENCES `animes` (`id`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
