-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-06-2024 a las 21:55:55
-- Versión del servidor: 10.5.20-MariaDB
-- Versión de PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id21599063_fruver_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `autor` varchar(250) NOT NULL,
  `fecha_lanzamiento` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`id`, `titulo`, `autor`, `fecha_lanzamiento`) VALUES
(1, 'La Biblia', 'Los Hebreos', '001'),
(2, 'Harry Potter y la cámara secreta', 'J.K. Rowling', '1998-07-02'),
(3, 'Harry Potter y el prisionero de Azkaban', 'J.K. Rowling', '1999-07-08'),
(4, 'Harry Potter y el cáliz de fuego', 'J.K. Rowling', '2000-07-08'),
(5, 'Harry Potter y la Orden del Fénix', 'J.K. Rowling', '2003-06-21'),
(6, 'Harry Potter y el misterio del príncipe', 'J.K. Rowling', '2005-07-16'),
(7, 'Harry Potter y las reliquias de la muerte', 'J.K. Rowling', '2007-07-21'),
(8, 'El código Da Vinci', 'Dan Brown', '2003-03-18'),
(9, 'Ángeles y demonios', 'Dan Brown', '2000-05-01'),
(10, 'La sombra del viento', 'Carlos Ruiz Zafón', '2001-03-01'),
(11, 'Crepúsculo', 'Stephenie Meyer', '2005-10-05'),
(12, 'Luna nueva', 'Stephenie Meyer', '2006-08-21'),
(13, 'Eclipse', 'Stephenie Meyer', '2007-08-07'),
(14, 'Amanecer', 'Stephenie Meyer', '2008-08-02'),
(15, 'Millennium 1: Los hombres que no amaban a las mujeres', 'Stieg Larsson', '2005-08-16'),
(16, 'Millennium 2: La chica que soñaba con una cerilla y un bidón de gasolina', 'Stieg Larsson', '2006-01-08'),
(17, 'Millennium 3: La reina en el palacio de las corrientes de aire', 'Stieg Larsson', '2007-08-23'),
(18, 'Cometas en el cielo', 'Khaled Hosseini', '2003-05-29'),
(19, 'Memorias de una geisha', 'Arthur Golden', '1997-09-23'),
(20, 'El niño con el pijama de rayas', 'John Boyne', '2006-01-05'),
(21, 'El niño con el pijama de rayas', 'John Boyne', '2006-01-05'),
(22, 'El nombre del viento', 'Patrick Rothfuss', '2007-03-27'),
(23, 'La ladrona de libros', 'Markus Zusak', '2005-03-14'),
(24, 'Las ventajas de ser invisible', 'Stephen Chbosky', '1999-02-01'),
(25, 'La catedral del mar', 'Ildefonso Falcones', '2006-11-28'),
(26, 'Los juegos del hambre', 'Suzanne Collins', '2008-09-14'),
(27, 'En llamas', 'Suzanne Collins', '2009-09-01'),
(28, 'Sinsajo', 'Suzanne Collins', '2010-08-24'),
(29, 'El alquimista', 'Paulo Coelho', '1988-01-01'),
(30, 'Veronika decide morir', 'Paulo Coelho', '1998-01-01'),
(31, 'La sombra del viento', 'Carlos Ruiz Zafón', '2001-03-01'),
(32, 'El juego del ángel', 'Carlos Ruiz Zafón', '2008-04-17'),
(33, 'El tiempo entre costuras', 'María Dueñas', '2009-09-03'),
(34, 'La casa de los espíritus', 'Isabel Allende', '1982-01-01'),
(35, 'Paula', 'Isabel Allende', '1994-01-01'),
(36, 'Cien años de soledad', 'Gabriel García Márquez', '1967-01-01'),
(37, 'Memoria de mis putas tristes', 'Gabriel García Márquez', '2004-01-01'),
(38, 'La elegancia del erizo', 'Muriel Barbery', '2006-08-30'),
(39, 'El curioso incidente del perro a medianoche', 'Mark Haddon', '2003-05-17'),
(40, 'El club de la lucha', 'Chuck Palahniuk', '1996-05-01'),
(41, 'Diario de una pasión', 'Nicholas Sparks', '1996-10-01'),
(42, 'Querido John', 'Nicholas Sparks', '2006-10-01'),
(43, 'El viaje del elefante', 'José Saramago', '2008-01-01'),
(44, 'Las enseñanzas de Don Juan', 'Carlos Castaneda', '1968-01-01'),
(45, 'El perfume', 'Patrick Süskind', '1985-01-01'),
(47, 'La hoguera de las vanidades', 'Tom Wolfe', '1987-01-01'),
(48, 'El lector', 'Bernhard Schlink', '1995-01-01'),
(49, 'La sombra del viento', 'Carlos Ruiz Zafón', '2001-01-01'),
(50, 'Tokio blues', 'Haruki Murakami', '1987-01-01'),
(52, 'Harry Potter y la Piedra Filosofal', 'J.K Rowling', '1997-06-26');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
