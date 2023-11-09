-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2023 a las 02:35:34
-- Versión del servidor: 8.0.33
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_votacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `region_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`id`, `nombre`, `region_id`) VALUES
(1, 'Juan Pérez', 1),
(2, 'María González', 1),
(3, 'Pedro Alonso', 1),
(4, 'Ana López', 1),
(5, 'Luis Romero', 1),
(6, 'Sofía Martínez', 1),
(7, 'Carlos García', 1),
(8, 'Isabel Jiménez', 1),
(9, 'David Rodríguez', 1),
(10, 'Laura Sánchez', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `como_se_entero`
--

CREATE TABLE `como_se_entero` (
  `id` int NOT NULL,
  `rut` varchar(12) NOT NULL,
  `opcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunas`
--

CREATE TABLE `comunas` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `region_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `comunas`
--

INSERT INTO `comunas` (`id`, `nombre`, `region_id`) VALUES
(1, 'Colina', 1),
(2, 'Lampa', 1),
(3, 'Til Til', 1),
(4, 'Pirque', 1),
(5, 'Puente Alto', 1),
(6, 'San José de Maipo', 1),
(7, 'Buin', 1),
(8, 'Calera de Tango', 1),
(9, 'Paine', 1),
(10, 'San Bernardo', 1),
(11, 'Alhué', 1),
(12, 'Curacaví', 1),
(13, 'María Pinto', 1),
(14, 'Melipilla', 1),
(15, 'San Pedro', 1),
(16, 'Cerrillos', 1),
(17, 'Cerro Navia', 1),
(18, 'Conchalí', 1),
(19, 'El Bosque', 1),
(20, 'Estación Central', 1),
(21, 'Huechuraba', 1),
(22, 'Independencia', 1),
(23, 'La Cisterna', 1),
(24, 'La Florida', 1),
(25, 'La Granja', 1),
(26, 'La Pintana', 1),
(27, 'La Reina', 1),
(28, 'Las Condes', 1),
(29, 'Lo Barnechea', 1),
(30, 'Lo Espejo', 1),
(31, 'Lo Prado', 1),
(32, 'Macul', 1),
(33, 'Maipú', 1),
(34, 'Ñuñoa', 1),
(35, 'Pedro Aguirre Cerda', 1),
(36, 'Peñalolén', 1),
(37, 'Providencia', 1),
(38, 'Pudahuel', 1),
(39, 'Quilicura', 1),
(40, 'Quinta Normal', 1),
(41, 'Recoleta', 1),
(42, 'Renca', 1),
(43, 'San Joaquín', 1),
(44, 'San Miguel', 1),
(45, 'San Ramón', 1),
(46, 'Santiago', 1),
(47, 'Vitacura', 1),
(48, 'El Monte', 1),
(49, 'Isla de Maipo', 1),
(50, 'Padre Hurtado', 1),
(51, 'Peñaflor', 1),
(52, 'Talagante', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`id`, `nombre`) VALUES
(1, 'Región Metropolitana <- test con comunas'),
(2, 'Región de Arica y Parinacota'),
(3, 'Región de Tarapacá'),
(4, 'Región de Antofagasta'),
(5, 'Región de Atacama'),
(6, 'Región de Coquimbo'),
(7, 'Región de Valparaíso'),
(8, 'Región de O\'Higgins'),
(9, 'Región del Maule'),
(10, 'Región de Ñuble'),
(11, 'Región del Biobío'),
(12, 'Región de La Araucanía'),
(13, 'Región de Los Ríos'),
(14, 'Región de Los Lagos'),
(15, 'Región de Aysén del General Carlos Ibáñez del Campo'),
(16, 'Región de Magallanes y de la Antártica Chilena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votos`
--

CREATE TABLE `votos` (
  `id` int NOT NULL,
  `nombre_apellido` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `region_id` int NOT NULL,
  `comuna_id` int NOT NULL,
  `candidato_id` int NOT NULL,
  `fecha_voto` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `como_se_entero`
--
ALTER TABLE `como_se_entero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `comuna_id` (`comuna_id`),
  ADD KEY `candidato_id` (`candidato_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `como_se_entero`
--
ALTER TABLE `como_se_entero`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comunas`
--
ALTER TABLE `comunas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `votos`
--
ALTER TABLE `votos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD CONSTRAINT `comunas_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`);

--
-- Filtros para la tabla `votos`
--
ALTER TABLE `votos`
  ADD CONSTRAINT `votos_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`),
  ADD CONSTRAINT `votos_ibfk_2` FOREIGN KEY (`comuna_id`) REFERENCES `comunas` (`id`),
  ADD CONSTRAINT `votos_ibfk_3` FOREIGN KEY (`candidato_id`) REFERENCES `candidatos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
