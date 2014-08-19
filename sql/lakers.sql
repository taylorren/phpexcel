-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 16, 2014 at 01:53 AM
-- Server version: 5.5.38-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sitepoint`
--

-- --------------------------------------------------------

--
-- Table structure for table `lakers`
--

CREATE TABLE IF NOT EXISTS `lakers` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `team` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `selfscore` int(11) NOT NULL,
  `oppscore` int(11) NOT NULL,
  `dateplayed` date NOT NULL,
  `winlose` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lakers`
--

INSERT INTO `lakers` (`id`, `year`, `team`, `selfscore`, `oppscore`, `dateplayed`, `winlose`, `remark`) VALUES
(-8, 2013, 'LAL vs GSW', 104, 95, '2013-10-05', 'W', ''),
(-7, 2013, 'LAL vs DEN', 88, 97, '2013-10-06', 'L', 'Gasol and Nash on court. '),
(-6, 2013, 'LAL vs DEN', 90, 88, '2013-10-08', 'W', ''),
(-5, 2013, 'LAL vs SAC', 86, 104, '2013-10-10', 'L', ''),
(-4, 2013, 'LAL vs GSW', 95, 100, '2013-10-15', 'L', 'This game is played in Beijing.'),
(-3, 2013, 'LAL vs GSW', 89, 115, '2013-10-18', 'L', 'This game is in Shanghai.'),
(-2, 2013, 'LAL vs UTA', 108, 94, '2013-10-22', 'W', ''),
(-1, 2013, 'LAL vs UTA', 111, 106, '2013-10-25', 'W', ''),
(1, 2013, 'LAL vs LAC', 116, 103, '2013-10-29', 'W', 'Season opening and a derby! Last quarter Lakers scored 41 points. A good start!'),
(2, 2013, 'LAL @ GSW', 94, 125, '2013-10-30', 'L', 'AI retires. '),
(3, 2013, 'LAL vs SAS', 85, 91, '2013-11-01', 'L', ''),
(4, 2013, 'LAL vs ATL', 105, 103, '2013-11-03', 'W', 'Gasol rocks!'),
(5, 2013, 'LAL @ DAL', 104, 123, '2013-11-05', 'L', 'We need Kobe...'),
(6, 2013, 'LAL @ HOU', 99, 98, '2013-11-07', 'W', 'Blake finishes the game with a 3-point buzzer!'),
(7, 2013, 'LAL @ NOP', 85, 96, '2013-11-08', 'L', 'NOP: New Orleans Pelicans'),
(8, 2013, 'LAL vs MIN', 90, 113, '2013-11-10', 'L', ''),
(9, 2013, 'LAL vs NOP', 116, 95, '2013-11-12', 'W', 'Revenge!'),
(10, 2013, 'LAL @ DEN', 99, 111, '2013-11-13', 'L', 'LAL has not win consequtively yet. '),
(11, 2013, 'LAL vs MEM', 86, 89, '2013-11-15', 'L', ''),
(12, 2013, 'LAL vs DET', 114, 99, '2013-11-17', 'W', 'Blake got 16 assists!'),
(13, 2013, 'LAL vs GSW', 102, 95, '2013-11-22', 'W', 'First consequtive win. '),
(14, 2013, 'LAL vs SAC', 100, 86, '2013-11-24', 'W', 'Win 3. '),
(15, 2013, 'LAL @ WAS', 111, 116, '2013-11-26', 'L', ''),
(16, 2013, 'LAL @ BKN', 99, 94, '2013-11-27', 'W', ''),
(17, 2013, 'LAL @ DET', 106, 102, '2013-11-29', 'W', ''),
(18, 2013, 'LAL vs POR', 108, 114, '2013-12-01', 'L', ''),
(19, 2013, 'LAL @ SAC', 106, 103, '2013-12-06', 'W', ''),
(20, 2013, 'LAL vs TOR', 94, 106, '2013-12-08', 'L', 'Kobe returns!'),
(21, 2013, 'LAL vs PHX', 108, 114, '2013-12-10', 'L', ''),
(22, 2013, 'LAL @ OKC', 97, 122, '2013-12-13', 'L', ''),
(23, 2013, 'LAL @ CHA', 88, 85, '2013-12-14', 'W', ''),
(24, 2013, 'LAL @ ATL', 100, 114, '2013-12-16', 'L', ''),
(25, 2013, 'LAL @ MEM', 96, 92, '2013-12-17', 'W', '2 back-to-back consequtive series and achieved 50-50. '),
(26, 2013, 'LAL vs MIN', 104, 91, '2013-12-20', 'W', ''),
(27, 2013, 'LAL @ GSW', 83, 102, '2013-12-21', 'L', ''),
(28, 2013, 'LAL @ PHX', 90, 117, '2013-12-23', 'L', ''),
(29, 2013, 'LAL vs MIA', 95, 101, '2013-12-25', 'L', ''),
(30, 2013, 'LAL @ UTA', 103, 105, '2013-12-27', 'L', '4 consequtive losses!'),
(31, 2013, 'LAL vs PHI', 104, 111, '2013-12-29', 'L', '5 losses. '),
(32, 2013, 'LAL vs MIL', 79, 94, '2013-12-31', 'L', '6 losses. '),
(33, 2013, 'LAL vs UTA', 110, 99, '2014-01-03', 'W', ''),
(34, 2013, 'LAL vs DEN', 115, 137, '2014-01-05', 'L', ''),
(35, 2013, 'LAL @ DAL', 97, 110, '2014-01-07', 'L', ''),
(36, 2013, 'LAL @ HOU', 99, 113, '2014-01-08', 'L', 'No way!'),
(37, 2013, 'LAL @ LAC', 87, 123, '2014-01-10', 'L', ''),
(38, 2013, 'LAL vs CLE', 118, 120, '2014-01-14', 'L', ''),
(39, 2013, 'LAL @ PHX', 114, 121, '2014-01-15', 'L', ''),
(40, 2013, 'LAL @ BOS', 107, 104, '2014-01-17', 'W', ''),
(41, 2013, 'LAL @ TOR', 112, 106, '2014-01-19', 'W', ''),
(42, 2013, 'LAL @ CHI', 100, 102, '2014-01-20', 'L', ''),
(43, 2013, 'LAL @ MIA', 102, 109, '2014-01-23', 'L', ''),
(44, 2013, 'LAL @ ORL', 105, 114, '2014-01-24', 'L', ''),
(45, 2013, 'LAL @ NYK', 103, 110, '2014-01-26', 'L', ''),
(46, 2013, 'LAL vs IND', 92, 104, '2014-01-28', 'L', ''),
(47, 2013, 'LAL vs CHA', 100, 110, '2014-01-31', 'L', ''),
(48, 2013, 'LAL @ MIN', 99, 109, '2014-02-04', 'L', ''),
(49, 2013, 'LAL @ CLE', 119, 108, '2014-02-05', 'W', ''),
(50, 2013, 'LAL @ PHI', 112, 98, '2014-02-07', 'W', ''),
(51, 2013, 'LAL vs CHI', 86, 92, '2014-02-09', 'L', ''),
(52, 2013, 'LAL vs UTA', 79, 96, '2014-02-11', 'L', ''),
(53, 2013, 'LAL vs OKC', 103, 107, '2014-02-13', 'L', ''),
(54, 2013, 'LAL vs HOU', 108, 134, '2014-02-19', 'L', ''),
(55, 2013, 'LAL vs BOS', 101, 92, '2014-02-21', 'W', ''),
(56, 2013, 'LAL vs BKN', 102, 108, '2014-02-23', 'L', ''),
(57, 2013, 'LAL @ IND', 98, 118, '2014-02-25', 'L', ''),
(58, 2013, 'LAL @ MEM', 103, 108, '2014-02-26', 'L', ''),
(59, 2013, 'LAL vs SAC', 126, 122, '2014-02-28', 'W', ''),
(60, 2013, 'LAL @ POR', 107, 106, '2014-03-03', 'W', ''),
(61, 2013, 'LAL vs NOP', 125, 132, '2014-03-04', 'L', ''),
(62, 2013, 'LAL vs LAC', 94, 142, '2014-03-06', 'L', ''),
(63, 2013, 'LAL @ DEN', 126, 134, '2014-03-07', 'L', ''),
(64, 2013, 'LAL vs OKC', 114, 110, '2014-03-09', 'W', ''),
(65, 2013, 'LAL @ OKC', 102, 131, '2014-03-13', 'L', ''),
(66, 2013, 'LAL @ SAS', 85, 119, '2014-03-14', 'L', ''),
(67, 2013, 'LAL vs SAS', 109, 125, '2014-03-19', 'L', ''),
(68, 2013, 'LAL vs WAS', 107, 117, '2014-03-21', 'L', ''),
(69, 2013, 'LAL vs ORL', 103, 94, '2014-03-23', 'W', ''),
(70, 2013, 'LAL vs NYK', 127, 96, '2014-03-25', 'W', ''),
(71, 2013, 'LAL @ MIL', 105, 108, '2014-03-27', 'L', ''),
(72, 2013, 'LAL @ MIN', 107, 143, '2014-03-28', 'L', ''),
(73, 2013, 'LAL vs PHX', 115, 99, '2014-03-30', 'W', ''),
(74, 2013, 'LAL vs POR', 112, 124, '2014-04-01', 'L', ''),
(75, 2013, 'LAL @ SAC', 102, 107, '2014-04-02', 'L', ''),
(76, 2013, 'LAL vs DAL', 95, 107, '2014-04-04', 'L', ''),
(77, 2013, 'LAL @ LAC', 97, 120, '2014-04-06', 'L', ''),
(78, 2013, 'LAL vs HOU', 130, 145, '2014-04-08', 'L', ''),
(79, 2013, 'LAL vs GSW', 95, 112, '2014-04-11', 'L', ''),
(80, 2013, 'LAL vs MEM', 90, 102, '2014-04-13', 'L', ''),
(81, 2013, 'LAL @ UTA', 119, 104, '2014-04-14', 'W', ''),
(82, 2013, 'LAL @ SAS', 113, 100, '2014-04-16', 'W', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
