-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-08-2020 a las 03:37:28
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
  `imagen` varchar(255) COLLATE utf16_spanish2_ci DEFAULT 'images/default.png',
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `animes`
--

INSERT INTO `animes` (`id`, `nombre`, `id_categoria`, `descripcion`, `imagen`, `estado`) VALUES
(1, 'Kimi ni Todoke', 1, 'Sawako Kuronuma, llamada Sadako por sus compañeras por su parecido con el personaje de Ringu (película original del remake estadounidense The Ring), siempre se ha entendido mal y teme por su apariencia. Hay rumores de que Sawako puede ver fantasmas y es una maldición para las personas. Pero cuando su ídolo, el popular muchacho Kazehaya, comienza a hablar con ella, todo cambia. Se encuentra en un nuevo mundo, tratando de hacer amigos y hablar con gente diferente y no puede agradecer lo suficiente a Kazehaya por darle estas oportunidades. Lento pero seguro, florece un dulce amor entre los dos, ya que superará cualquier circunstancia y obstáculos en el camino.', 'images/a079d0c0-0830-44f2-ba86-f3fc38a7b5ba.jpeg', 1),
(2, 'Naruto', 2, 'Naruto, un aprendiz de ninja de la Aldea Oculta de Konoha es un chico travieso que desea llegar a ser el Hokage de la aldea para demostrar a todos lo que vale. Lo que descubre al inicio de la historia es que la gente le mira con desconfianza porque en su interior está encerrado el demonio Kyubi que una vez destruyó la aldea, y que el anterior líder de la misma tuvo que encerrar en su cuerpo siendo aún muy pequeño, a coste de su vida. Aunque sus compañeros no saben esto, tampoco le aprecian porque es mal estudiante y siempre está haciendo bromas. Sin embargo, la forma de actuar y la determinación de Naruto demuestran a los demás que puede llegar muy lejos, y el recelo de los otros chicos se va disipando. Naruto y sus compañeros Sakura y Sasuke, junto a su maestro Kakashi tendrán que enfrentarse a una serie de combates y misiones a lo largo de la historia que les permitirán mejorar y crecer. Naruto se vera enfrentado a sus principales enemigos Akatsuki, Itachi y Kisame.', 'images/631c48ce-3d4b-49c9-89f6-ff1d638600ad.jpeg', 1),
(3, 'Naruto Shippuden', 2, 'Pasados dos años y medio de entrenamiento con Jiraiya, Naruto Uzumaki regresa a la aldea oculta de la hoja, donde se reúne con sus viejos amigos y conforma de nuevo el Equipo 7. Debido a la ausencia de Sasuke, aparece un nuevo personaje llamado Sai el cual retoma su lugar. En esta secuela podremos notar como los compañeros de Naruto han madurado con respecto a su desempeño previo, mejorando la mayoría de estos en su nivel. Durante su entrenamiento con Jiraiya, Naruto aprendió a controlar un poco de la chacra del Kyubi. Lo contrario a la serie original, dónde sólo desempeñó un papel secundario, la organización Akatsuki asume el papel antagónico principal en Naruto Shippuden, buscando como objetivo principal el capturar a todos los poderosos monstruos Biju.', 'images/4d5e0994-b643-421d-9cc4-b95795430da6.jpeg', 1),
(4, 'Love Stage!', 3, 'La historia gira en torno a Izumi Sena, un chico nacido en una familia de ultra-profesionales del entretenimiento. Sin embargo, él es el único de la familia que no trabaja en la industria del entretenimiento y es un universitario muy otaku. Aspira a convertirse en mangaka, pero acaba protagonizando un anuncio de televisión. Al final se cruza en su camino el famoso actor Ryuma, quien se da cuenta de su atracción por Izumi.', 'images/71c4460b-ed12-42f7-a4b1-37720ec3c69c.jpeg', 1),
(5, 'Fullmetal Alchemist: Brotherhood', 2, 'La historia se centra en dos hermanos, Edward Elric y Alphonse Elric que rompieron el mayor tabú de la alquimia, la trasmutación humana al tratar de revivir a su fallecida madre; en consecuencia Edward pierde su pierna izquierda y Alphonse pierde todo su cuerpo, Edward para salvar a su hermano sella su alma en una gran armadura de hierro a cambio de su brazo derecho; ahora los dos con un nuevo objetivo buscan desesperadamente la piedra filosofal para poder regresar sus cuerpos a la normalidad...', 'images/3e48d783-ce5b-4c66-903a-3aa9b2bf9ca5.jpeg', 1),
(10, 'Sekaiichi Hatsukoi', 3, 'Onodera Ritsu decide transferirse de la compañía de su padre a Marukawa Shoten. donde es asignado a la división de manga shoujo, ahí se encontrara con la persona que menos espera, su ex amor de secundaria', 'images/970bbb9b-b33c-45c3-b9e5-445c3d497056.jpeg', 1),
(11, 'Ouran High School Host Club', 1, 'kjhgfjdsguifjbgdj|sj', 'images/8de489a8-3591-4b0a-bcaf-1fae0feb1030.jpeg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre_categoria` varchar(255) COLLATE utf16_spanish2_ci NOT NULL
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
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_anime` int(11) NOT NULL,
  `puntaje` int(11) NOT NULL DEFAULT '0',
  `comentario` text COLLATE utf16_spanish2_ci NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `id_usuario`, `id_anime`, `puntaje`, `comentario`, `ts_create`) VALUES
(1, 1, 1, 4, 'muy bueno', '2020-08-16 01:34:07'),
(2, 1, 1, 1, 'khjsgdfjskbhkueh', '2020-08-18 23:02:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntuacion`
--

CREATE TABLE `puntuacion` (
  `id` int(11) NOT NULL,
  `id_anime` int(11) NOT NULL,
  `puntaje` int(11) NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `puntuacion`
--

INSERT INTO `puntuacion` (`id`, `id_anime`, `puntaje`, `ts_create`) VALUES
(1, 1, 3, '2020-08-18 23:02:32'),
(2, 4, 0, '2020-08-21 16:22:30'),
(3, 2, 0, '2020-08-21 16:22:30'),
(4, 3, 0, '2020-08-21 16:22:31'),
(5, 5, 0, '2020-08-21 21:24:14'),
(6, 10, 0, '2020-08-21 22:11:32'),
(7, 11, 0, '2020-08-21 22:24:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf16_spanish2_ci NOT NULL,
  `pass` varchar(50) COLLATE utf16_spanish2_ci NOT NULL,
  `correo` varchar(50) COLLATE utf16_spanish2_ci NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `pass`, `correo`, `admin`, `ts_create`) VALUES
(1, 'admin', '20051993', 'napolitano.ariana93@gmail.com', 1, '2020-08-03 22:30:13'),
(2, 'user1', '1234', 'mail.mail@mail.com', 0, '2020-08-07 13:53:28');

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
-- Indices de la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_anime` (`id_anime`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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

--
-- Filtros para la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  ADD CONSTRAINT `puntuacion_ibfk_1` FOREIGN KEY (`id_anime`) REFERENCES `animes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
