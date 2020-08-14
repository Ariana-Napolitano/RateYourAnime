-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 09-08-2020 a las 22:26:26
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `id` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish2_ci NOT NULL,
  `id_categoria` int NOT NULL,
  `descripcion` text CHARACTER SET utf16 COLLATE utf16_spanish2_ci NOT NULL,
  `imagen` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish2_ci DEFAULT 'images/default.png',
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `animes`
--

INSERT INTO `animes` (`id`, `nombre`, `id_categoria`, `descripcion`, `imagen`, `estado`) VALUES
(1, 'Kimi ni Todoke', 1, 'Sawako Kuronuma, apodada \'Sadako\' por sus compañeros dado su parecido a Sadako Yamamura, siempre se ha expresado mal, o mejor dicho no sabe cómo hacerlo. Su mejor intento de una amable sonrisa es fácilmente confundido con un gesto psicótico o la cara del más aterrador espíritu maligno, impidiendo esto durante toda su vida que la gente conozca su dulce e inocente carácter. Hay rumores sobre que Sawako puede ver fantasmas, maldecir a las personas y traer mala suerte a quien se le aproxime. Pero cuando el popular muchacho Shouta Kazehaya, comienza a hablar con ella todo cambia; se encuentra en un nuevo mundo, tratando de hacer amigos, hablando con gente diferente y no puede agradecer lo suficiente a Kazehaya por darle estas oportunidades. Lento pero seguro florece un dulce amor entre los dos que deberá superar muchas circunstancias y obstáculos en el camino, especialmente las inseguridades y temores de ambos.', 'images/kiminitodoke.jpg', 1),
(2, 'Naruto', 2, 'dghjdthdfhjf', 'images/naruto.jpeg', 0),
(3, 'Love Stage', 3, 'hvfshjbvjhsb', 'images/Love-Stage-610x610.jpg', 1),
(4, 'gfhdfhdh', 1, 'hfdhdhtdh', 'images/c809e1d4-9b2a-4c1d-99aa-c4a06cf164b9.png', 0),
(5, 'thrthtrhrth', 2, 'hrthrthtrh', 'images/b9d10839-e1c3-46e6-a2b6-4faa710c7568.png', 0),
(6, 'Naruto shippuden', 2, 'dhthjtfjftj', 'images/b4db701c-d7f1-4896-b7d6-16ffeee5fae4.jpeg', 1),
(7, 'llllllllll', 3, 'lllllll', 'images/629a71f0-c483-4b2d-b46f-01bfa2aac96f.png', 0),
(8, 'gdjkbdjbdjkbj', 2, 'khdgdjgbdhbdjb', 'images/undefined', 1),
(9, 'mmmmmmmmmmmmmmmm', 1, 'mmmmmmmmmmmmmmmmm', 'images/undefined', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int NOT NULL,
  `nombre_categoria` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre_categoria`) VALUES
(1, 'Shojo'),
(2, 'Shonnen'),
(3, 'Yaoi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_anime` int NOT NULL,
  `puntaje` int NOT NULL,
  `comentario` text CHARACTER SET utf16 COLLATE utf16_spanish2_ci NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntuacion`
--

CREATE TABLE `puntuacion` (
  `id` int NOT NULL,
  `id_anime` int NOT NULL,
  `puntaje` int NOT NULL DEFAULT '0',
  `ts_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `puntuacion`
--

INSERT INTO `puntuacion` (`id`, `id_anime`, `puntaje`) VALUES
(1, 1, 4),
(2, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf16 COLLATE utf16_spanish2_ci NOT NULL,
  `pass` varchar(50) CHARACTER SET utf16 COLLATE utf16_spanish2_ci NOT NULL,
  `correo` varchar(50) CHARACTER SET utf16 COLLATE utf16_spanish2_ci NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `pass`, `correo`, `admin`) VALUES
(1, 'admin', '20051993', 'napolitano.ariana93@gmail.com', 1),
(2, 'user1', '1234', 'mail.mail@mail.com', 0);

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
  ADD KEY `id_anime_2` (`id_anime`),
  ADD KEY `rating` (`puntaje`);

--
-- Indices de la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_anime` (`id_anime`),
  ADD KEY `puntaje` (`puntaje`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `comentarios_ibfk_3` FOREIGN KEY (`puntaje`) REFERENCES `puntuacion` (`puntaje`);

--
-- Filtros para la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  ADD CONSTRAINT `puntuacion_ibfk_1` FOREIGN KEY (`id_anime`) REFERENCES `animes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
