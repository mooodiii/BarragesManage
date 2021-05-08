-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2021 at 08:58 PM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion_barage`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add barrages', 7, 'add_barrages'),
(26, 'Can change barrages', 7, 'change_barrages'),
(27, 'Can delete barrages', 7, 'delete_barrages'),
(28, 'Can view barrages', 7, 'view_barrages'),
(29, 'Can add apport m complex hansali massira', 8, 'add_apportmcomplexhansalimassira'),
(30, 'Can change apport m complex hansali massira', 8, 'change_apportmcomplexhansalimassira'),
(31, 'Can delete apport m complex hansali massira', 8, 'delete_apportmcomplexhansalimassira'),
(32, 'Can view apport m complex hansali massira', 8, 'view_apportmcomplexhansalimassira'),
(33, 'Can add apport m binouidane', 9, 'add_apportmbinouidane'),
(34, 'Can change apport m binouidane', 9, 'change_apportmbinouidane'),
(35, 'Can delete apport m binouidane', 9, 'delete_apportmbinouidane'),
(36, 'Can view apport m binouidane', 9, 'view_apportmbinouidane'),
(37, 'Can add apport mmoulay youssef', 10, 'add_apportmmoulayyoussef'),
(38, 'Can change apport mmoulay youssef', 10, 'change_apportmmoulayyoussef'),
(39, 'Can delete apport mmoulay youssef', 10, 'delete_apportmmoulayyoussef'),
(40, 'Can view apport mmoulay youssef', 10, 'view_apportmmoulayyoussef'),
(41, 'Can add apport m hassan prem', 11, 'add_apportmhassanprem'),
(42, 'Can change apport m hassan prem', 11, 'change_apportmhassanprem'),
(43, 'Can delete apport m hassan prem', 11, 'delete_apportmhassanprem'),
(44, 'Can view apport m hassan prem', 11, 'view_apportmhassanprem'),
(45, 'Can add var apport', 12, 'add_varapport'),
(46, 'Can change var apport', 12, 'change_varapport'),
(47, 'Can delete var apport', 12, 'delete_varapport'),
(48, 'Can view var apport', 12, 'view_varapport'),
(49, 'Can add bin ouidane fornitures', 13, 'add_binouidanefornitures'),
(50, 'Can change bin ouidane fornitures', 13, 'change_binouidanefornitures'),
(51, 'Can delete bin ouidane fornitures', 13, 'delete_binouidanefornitures'),
(52, 'Can view bin ouidane fornitures', 13, 'view_binouidanefornitures'),
(53, 'Can add hassan prem fornitures', 14, 'add_hassanpremfornitures'),
(54, 'Can change hassan prem fornitures', 14, 'change_hassanpremfornitures'),
(55, 'Can delete hassan prem fornitures', 14, 'delete_hassanpremfornitures'),
(56, 'Can view hassan prem fornitures', 14, 'view_hassanpremfornitures'),
(57, 'Can add sidi driss fornitures', 15, 'add_sididrissfornitures'),
(58, 'Can change sidi driss fornitures', 15, 'change_sididrissfornitures'),
(59, 'Can delete sidi driss fornitures', 15, 'delete_sididrissfornitures'),
(60, 'Can view sidi driss fornitures', 15, 'view_sididrissfornitures'),
(61, 'Can add my youssef fornitures', 16, 'add_myyousseffornitures'),
(62, 'Can change my youssef fornitures', 16, 'change_myyousseffornitures'),
(63, 'Can delete my youssef fornitures', 16, 'delete_myyousseffornitures'),
(64, 'Can view my youssef fornitures', 16, 'view_myyousseffornitures'),
(65, 'Can add ael hanssali fornitures', 17, 'add_aelhanssalifornitures'),
(66, 'Can change ael hanssali fornitures', 17, 'change_aelhanssalifornitures'),
(67, 'Can delete ael hanssali fornitures', 17, 'delete_aelhanssalifornitures'),
(68, 'Can view ael hanssali fornitures', 17, 'view_aelhanssalifornitures'),
(69, 'Can add ait messaoud fornitures', 18, 'add_aitmessaoudfornitures'),
(70, 'Can change ait messaoud fornitures', 18, 'change_aitmessaoudfornitures'),
(71, 'Can delete ait messaoud fornitures', 18, 'delete_aitmessaoudfornitures'),
(72, 'Can view ait messaoud fornitures', 18, 'view_aitmessaoudfornitures'),
(73, 'Can add massira fornitures', 19, 'add_massirafornitures'),
(74, 'Can change massira fornitures', 19, 'change_massirafornitures'),
(75, 'Can delete massira fornitures', 19, 'delete_massirafornitures'),
(76, 'Can view massira fornitures', 19, 'view_massirafornitures'),
(77, 'Can add imfout fornitures', 20, 'add_imfoutfornitures'),
(78, 'Can change imfout fornitures', 20, 'change_imfoutfornitures'),
(79, 'Can delete imfout fornitures', 20, 'delete_imfoutfornitures'),
(80, 'Can view imfout fornitures', 20, 'view_imfoutfornitures'),
(81, 'Can add daourate fornitures', 21, 'add_daouratefornitures'),
(82, 'Can change daourate fornitures', 21, 'change_daouratefornitures'),
(83, 'Can delete daourate fornitures', 21, 'delete_daouratefornitures'),
(84, 'Can view daourate fornitures', 21, 'view_daouratefornitures'),
(85, 'Can add ss maachou fornitures', 22, 'add_ssmaachoufornitures'),
(86, 'Can change ss maachou fornitures', 22, 'change_ssmaachoufornitures'),
(87, 'Can delete ss maachou fornitures', 22, 'delete_ssmaachoufornitures'),
(88, 'Can view ss maachou fornitures', 22, 'view_ssmaachoufornitures'),
(89, 'Can add sidi daoui fornitures', 23, 'add_sididaouifornitures'),
(90, 'Can change sidi daoui fornitures', 23, 'change_sididaouifornitures'),
(91, 'Can delete sidi daoui fornitures', 23, 'delete_sididaouifornitures'),
(92, 'Can view sidi daoui fornitures', 23, 'view_sididaouifornitures'),
(93, 'Can add digue safi fornitures', 24, 'add_diguesafifornitures'),
(94, 'Can change digue safi fornitures', 24, 'change_diguesafifornitures'),
(95, 'Can delete digue safi fornitures', 24, 'delete_diguesafifornitures'),
(96, 'Can view digue safi fornitures', 24, 'view_diguesafifornitures'),
(97, 'Can add bin ouidane bilan hydr', 25, 'add_binouidanebilanhydr'),
(98, 'Can change bin ouidane bilan hydr', 25, 'change_binouidanebilanhydr'),
(99, 'Can delete bin ouidane bilan hydr', 25, 'delete_binouidanebilanhydr'),
(100, 'Can view bin ouidane bilan hydr', 25, 'view_binouidanebilanhydr'),
(101, 'Can add hassan prem bilan hydr', 26, 'add_hassanprembilanhydr'),
(102, 'Can change hassan prem bilan hydr', 26, 'change_hassanprembilanhydr'),
(103, 'Can delete hassan prem bilan hydr', 26, 'delete_hassanprembilanhydr'),
(104, 'Can view hassan prem bilan hydr', 26, 'view_hassanprembilanhydr'),
(105, 'Can add sidi driss bilan hydr', 27, 'add_sididrissbilanhydr'),
(106, 'Can change sidi driss bilan hydr', 27, 'change_sididrissbilanhydr'),
(107, 'Can delete sidi driss bilan hydr', 27, 'delete_sididrissbilanhydr'),
(108, 'Can view sidi driss bilan hydr', 27, 'view_sididrissbilanhydr'),
(109, 'Can add my youssef bilan hydr', 28, 'add_myyoussefbilanhydr'),
(110, 'Can change my youssef bilan hydr', 28, 'change_myyoussefbilanhydr'),
(111, 'Can delete my youssef bilan hydr', 28, 'delete_myyoussefbilanhydr'),
(112, 'Can view my youssef bilan hydr', 28, 'view_myyoussefbilanhydr'),
(113, 'Can add ael hanssali bilan hydr', 29, 'add_aelhanssalibilanhydr'),
(114, 'Can change ael hanssali bilan hydr', 29, 'change_aelhanssalibilanhydr'),
(115, 'Can delete ael hanssali bilan hydr', 29, 'delete_aelhanssalibilanhydr'),
(116, 'Can view ael hanssali bilan hydr', 29, 'view_aelhanssalibilanhydr'),
(117, 'Can add ait messaoud bilan hydr', 30, 'add_aitmessaoudbilanhydr'),
(118, 'Can change ait messaoud bilan hydr', 30, 'change_aitmessaoudbilanhydr'),
(119, 'Can delete ait messaoud bilan hydr', 30, 'delete_aitmessaoudbilanhydr'),
(120, 'Can view ait messaoud bilan hydr', 30, 'view_aitmessaoudbilanhydr'),
(121, 'Can add massira bilan hydr', 31, 'add_massirabilanhydr'),
(122, 'Can change massira bilan hydr', 31, 'change_massirabilanhydr'),
(123, 'Can delete massira bilan hydr', 31, 'delete_massirabilanhydr'),
(124, 'Can view massira bilan hydr', 31, 'view_massirabilanhydr'),
(125, 'Can add barage uploaded', 32, 'add_barageuploaded'),
(126, 'Can change barage uploaded', 32, 'change_barageuploaded'),
(127, 'Can delete barage uploaded', 32, 'delete_barageuploaded'),
(128, 'Can view barage uploaded', 32, 'view_barageuploaded');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$AF6lliPy81BMbrkin8zo6M$+z5W2g5TjBv5yeevYu7NKAgQITU+RmjI1ye0ALm4qrQ=', '2021-04-07 14:48:41.787643', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2021-04-04 19:25:49.240296');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barage_aelhanssalibilanhydr`
--

CREATE TABLE `barage_aelhanssalibilanhydr` (
  `id` int NOT NULL,
  `annee` int NOT NULL,
  `mois` int NOT NULL,
  `jour` int NOT NULL,
  `cote` double NOT NULL,
  `reserve` double NOT NULL,
  `varReserve` double NOT NULL,
  `evaporation` double NOT NULL,
  `fuite` double NOT NULL,
  `total` double NOT NULL,
  `appVolume` double NOT NULL,
  `appDebit` double NOT NULL,
  `volumeTurbine` double NOT NULL,
  `vsd` double NOT NULL,
  `vsg` double NOT NULL,
  `vDesverse` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barage_aelhanssalifornitures`
--

CREATE TABLE `barage_aelhanssalifornitures` (
  `id` int NOT NULL,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `vidPdev` double NOT NULL,
  `TransfertMassira` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_aelhanssalifornitures`
--

INSERT INTO `barage_aelhanssalifornitures` (`id`, `periode`, `turbinage`, `vidPdev`, `TransfertMassira`, `month`, `year`) VALUES
(1, '2020/2021', 0, 34.19, 12, 'Sep', 2020),
(2, '2020/2021', 0, 11.94, 4.8, 'Oct', 2020),
(3, '2020/2021', 0, 26.41, 9, 'Nov', 2020),
(4, '2020/2021', 0, 14.38, 7.1, 'Dec', 2020),
(5, '2020/2021', 2.21, 0, 0, 'Jan', 2021),
(6, '2020/2021', 7.9, 0, 2, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_aitmessaoudbilanhydr`
--

CREATE TABLE `barage_aitmessaoudbilanhydr` (
  `id` int NOT NULL,
  `annee` int NOT NULL,
  `mois` int NOT NULL,
  `jour` int NOT NULL,
  `cote` double NOT NULL,
  `reserve` double NOT NULL,
  `varReserve` double NOT NULL,
  `evaporation` double NOT NULL,
  `fuite` double NOT NULL,
  `total` double NOT NULL,
  `appVolume` double NOT NULL,
  `appDebit` double NOT NULL,
  `tauxRemplissage` double NOT NULL,
  `volumeTurbine` double NOT NULL,
  `vVidange` double NOT NULL,
  `vEvacue` double NOT NULL,
  `pluie` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barage_aitmessaoudfornitures`
--

CREATE TABLE `barage_aitmessaoudfornitures` (
  `id` int NOT NULL,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `irrigation` double NOT NULL,
  `aepi` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_aitmessaoudfornitures`
--

INSERT INTO `barage_aitmessaoudfornitures` (`id`, `periode`, `turbinage`, `irrigation`, `aepi`, `vidPdev`, `month`, `year`) VALUES
(1, '2020/2021', 14, 7, 4.9, 7.94, 'Sep', 2020),
(2, '2020/2021', 0, 0, 4.7, 7.5, 'Oct', 2020),
(3, '2020/2021', 18.7, 8, 4.1, 2.12, 'Nov', 2020),
(4, '2020/2021', 9.5, 0, 4.4, 3.04, 'Dec', 2020),
(5, '2020/2021', 0, 0, 4.4, 4.02, 'Jan', 2021),
(6, '2020/2021', 0, 0, 4.4, 3.6, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_apportmbinouidane`
--

CREATE TABLE `barage_apportmbinouidane` (
  `id` int NOT NULL,
  `freq` int NOT NULL,
  `sep` double NOT NULL,
  `oct` double NOT NULL,
  `nov` double NOT NULL,
  `dec` double NOT NULL,
  `jan` double NOT NULL,
  `feb` double NOT NULL,
  `mar` double NOT NULL,
  `apr` double NOT NULL,
  `may` double NOT NULL,
  `jun` double NOT NULL,
  `jul` double NOT NULL,
  `aug` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_apportmbinouidane`
--

INSERT INTO `barage_apportmbinouidane` (`id`, `freq`, `sep`, `oct`, `nov`, `dec`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`) VALUES
(1, 99, 17, 20, 23, 19, 24, 8, 33, 24, 18, 12, 11, 6),
(2, 98, 17, 20, 23, 19, 26, 13, 37, 29, 20, 13, 11, 8),
(3, 95, 18, 20, 22, 21, 31, 21, 47, 39, 24, 14, 12, 10),
(4, 90, 18, 19, 22, 22, 35, 30, 57, 51, 30, 16, 13, 12),
(5, 80, 19, 19, 23, 24, 43, 43, 74, 71, 40, 20, 15, 15),
(6, 70, 20, 19, 23, 27, 49, 55, 89, 90, 51, 25, 18, 18),
(7, 60, 21, 20, 24, 29, 55, 67, 105, 110, 63, 30, 20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `barage_apportmcomplexhansalimassira`
--

CREATE TABLE `barage_apportmcomplexhansalimassira` (
  `id` int NOT NULL,
  `freq` int NOT NULL,
  `sep` double NOT NULL,
  `oct` double NOT NULL,
  `nov` double NOT NULL,
  `dec` double NOT NULL,
  `jan` double NOT NULL,
  `feb` double NOT NULL,
  `mar` double NOT NULL,
  `apr` double NOT NULL,
  `may` double NOT NULL,
  `jun` double NOT NULL,
  `jul` double NOT NULL,
  `aug` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_apportmcomplexhansalimassira`
--

INSERT INTO `barage_apportmcomplexhansalimassira` (`id`, `freq`, `sep`, `oct`, `nov`, `dec`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`) VALUES
(1, 99, 39, 67, 54, 59, 111, 57, 46, 61, 28, 26, 41, 16),
(2, 98, 42, 68, 59, 63, 109, 63, 51, 62, 33, 29, 41, 22),
(3, 95, 47, 71, 67, 71, 108, 73, 61, 63, 41, 33, 43, 31),
(4, 90, 52, 73, 75, 79, 107, 84, 72, 67, 51, 39, 46, 39),
(5, 80, 58, 77, 85, 91, 110, 99, 89, 77, 64, 49, 51, 48),
(6, 70, 63, 80, 93, 100, 114, 112, 105, 88, 75, 58, 55, 55),
(7, 60, 68, 83, 100, 109, 120, 125, 120, 101, 86, 67, 60, 61),
(8, 50, 72, 86, 106, 118, 129, 139, 137, 117, 97, 77, 66, 67);

-- --------------------------------------------------------

--
-- Table structure for table `barage_apportmhassanprem`
--

CREATE TABLE `barage_apportmhassanprem` (
  `id` int NOT NULL,
  `freq` int NOT NULL,
  `sep` double NOT NULL,
  `oct` double NOT NULL,
  `nov` double NOT NULL,
  `dec` double NOT NULL,
  `jan` double NOT NULL,
  `feb` double NOT NULL,
  `mar` double NOT NULL,
  `apr` double NOT NULL,
  `may` double NOT NULL,
  `jun` double NOT NULL,
  `jul` double NOT NULL,
  `aug` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_apportmhassanprem`
--

INSERT INTO `barage_apportmhassanprem` (`id`, `freq`, `sep`, `oct`, `nov`, `dec`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`) VALUES
(1, 99, 5, 8, 6, 11, 13, 7, 7, 6, 9, 3, 4, 1),
(2, 98, 5, 9, 6, 11, 12, 8, 8, 7, 9, 3, 4, 2),
(3, 95, 6, 9, 8, 10, 12, 9, 10, 9, 10, 4, 4, 3),
(4, 90, 7, 10, 9, 10, 12, 10, 12, 12, 12, 5, 5, 4),
(5, 80, 8, 10, 10, 9, 12, 12, 15, 16, 14, 7, 6, 6),
(6, 70, 9, 11, 12, 9, 12, 14, 19, 20, 17, 9, 7, 7),
(7, 60, 10, 12, 13, 9, 13, 16, 22, 24, 19, 11, 8, 8),
(8, 50, 11, 12, 14, 10, 14, 19, 26, 29, 23, 13, 9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `barage_apportmmoulayyoussef`
--

CREATE TABLE `barage_apportmmoulayyoussef` (
  `id` int NOT NULL,
  `freq` int NOT NULL,
  `sep` double NOT NULL,
  `oct` double NOT NULL,
  `nov` double NOT NULL,
  `dec` double NOT NULL,
  `jan` double NOT NULL,
  `feb` double NOT NULL,
  `mar` double NOT NULL,
  `apr` double NOT NULL,
  `may` double NOT NULL,
  `jun` double NOT NULL,
  `jul` double NOT NULL,
  `aug` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_apportmmoulayyoussef`
--

INSERT INTO `barage_apportmmoulayyoussef` (`id`, `freq`, `sep`, `oct`, `nov`, `dec`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`) VALUES
(1, 99, 4, 6, 6, 7, 11, 5, 6, 4, 4, 3, 2, 2),
(2, 98, 4, 7, 6, 7, 11, 7, 7, 6, 5, 3, 3, 2),
(3, 95, 5, 8, 7, 8, 11, 10, 10, 10, 7, 4, 3, 2),
(4, 90, 5, 9, 8, 9, 12, 12, 14, 14, 10, 5, 4, 3),
(5, 80, 6, 11, 10, 10, 13, 16, 19, 20, 14, 7, 5, 4),
(6, 70, 7, 12, 11, 11, 14, 19, 24, 26, 17, 9, 6, 5),
(7, 60, 8, 13, 13, 12, 15, 22, 29, 32, 21, 11, 7, 6),
(8, 50, 8, 14, 14, 14, 17, 25, 34, 38, 25, 13, 8, 7);

-- --------------------------------------------------------

--
-- Table structure for table `barage_barageuploaded`
--

CREATE TABLE `barage_barageuploaded` (
  `id` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_barageuploaded`
--

INSERT INTO `barage_barageuploaded` (`id`, `name`, `month`, `year`) VALUES
(17, 'binouidane', 10, 2020);

-- --------------------------------------------------------

--
-- Table structure for table `barage_barrages`
--

CREATE TABLE `barage_barrages` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_barrages`
--

INSERT INTO `barage_barrages` (`id`, `name`) VALUES
(1, 'Complexe A.El Hansali-Massira'),
(2, 'Bin El Ouidane'),
(3, 'Moulay Youssef'),
(4, 'Hassan 1er');

-- --------------------------------------------------------

--
-- Table structure for table `barage_binouidanebilanhydr`
--

CREATE TABLE `barage_binouidanebilanhydr` (
  `id` int NOT NULL,
  `annee` int NOT NULL,
  `mois` int NOT NULL,
  `jour` int NOT NULL,
  `cote` double NOT NULL,
  `reserve` double NOT NULL,
  `varReserve` double NOT NULL,
  `evaporation` double NOT NULL,
  `fuite` double NOT NULL,
  `total` double NOT NULL,
  `appVolume` double NOT NULL,
  `appDebit` double NOT NULL,
  `volumeTurbine` double NOT NULL,
  `evc` double NOT NULL,
  `vf` double NOT NULL,
  `volumeLache` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_binouidanebilanhydr`
--

INSERT INTO `barage_binouidanebilanhydr` (`id`, `annee`, `mois`, `jour`, `cote`, `reserve`, `varReserve`, `evaporation`, `fuite`, `total`, `appVolume`, `appDebit`, `volumeTurbine`, `evc`, `vf`, `volumeLache`) VALUES
(244, 2021, 1, 1, 769.63, 239.88295375151662, 0.14095375151663347, 0.028, 0.04, 0.364, 0.575424, 6.66, 0.364, 0, 0, 0.173),
(245, 2021, 1, 2, 769.64, 240.02348914719985, 0.14053539568323004, 0.028, 0.04, 0, 0.21168000000000003, 2.45, 0, 0, 0, 0.173),
(246, 2021, 1, 3, 769.67, 240.44535068065105, 0.42186153345119237, 0.028, 0.04, 0, 0.500256, 5.79, 0, 0, 0, 0.173),
(247, 2021, 1, 4, 769.69, 240.72680409461745, 0.28145341396640333, 0.028, 0.04, 0.167, 0.5201279999999999, 6.02, 0.167, 0, 0, 0.173),
(248, 2021, 1, 5, 769.723, 241.14930200906707, 0.4224979144496217, 0.028, 0.04, 0, 0.50112, 5.8, 0, 0, 0, 0.173),
(249, 2021, 1, 6, 769.77, 241.8543100024847, 0.7050079934176381, 0.028, 0.04, 0, 0.776736, 8.99, 0, 0, 0, 0.173),
(250, 2021, 1, 7, 769.78, 241.99543796426792, 0.14112796178321219, 0.028, 0.04, 0, 0.714528, 8.27, 0, 0, 0, 0.173),
(251, 2021, 1, 8, 769.8, 242.2778199333327, 0.2823819690647724, 0.028, 0.04, 0, 0.35423999999999994, 4.1, 0, 0, 0, 0.1368),
(252, 2021, 1, 9, 769.98, 244.82677036293362, 2.5489504296009216, 0.028, 0.04, 0, 2.627424, 30.41, 0, 0, 0, 0),
(253, 2021, 1, 10, 770.23, 248.38869325366696, 3.5619228907333422, 0.028, 0.04, 0, 3.633984, 42.06, 0, 0, 0, 0),
(254, 2021, 1, 11, 770.47, 251.83123894966707, 3.44254569600011, 0.029, 0.04, 0.327, 3.841344, 44.46, 0.327, 0, 0, 0),
(255, 2021, 1, 12, 770.69, 255.00673327900083, 3.175494329333759, 0.028, 0.04, 0, 3.2477760000000004, 37.59, 0, 0, 0, 0),
(256, 2021, 1, 13, 770.76, 256.02108790933323, 1.0143546303324058, 0.028, 0.04, 0, 0.94176, 10.9, 0, 0, 0, 0),
(257, 2021, 1, 14, 770.77, 256.16615200966805, 0.14506410033482098, 0.028, 0.04, 0, 0.21686399999999997, 2.51, 0, 0, 0, 0),
(258, 2021, 1, 15, 770.8, 256.601578666666, 0.43542665699794725, 0.029, 0.04, 0.007, 0.514944, 5.96, 0.007, 0, 0, 0),
(259, 2021, 1, 16, 770.83, 257.03735677366564, 0.43577810699963493, 0.029, 0.04, 0, 0.508032, 5.88, 0, 0, 0, 0),
(260, 2021, 1, 17, 770.93, 258.4924873269993, 1.4551305533336745, 0.029, 0.04, 0, 1.527552, 17.68, 0, 0, 0, 0),
(261, 2021, 1, 18, 771.03, 259.951514042083, 1.4590267150836667, 0.029, 0.04, 0, 1.538784, 17.81, 0, 0, 0, 0),
(262, 2021, 1, 19, 771.11, 261.1215008787502, 1.169986836667249, 0.029, 0.04, 0, 1.242432, 14.38, 0, 0, 0, 0),
(263, 2021, 1, 20, 771.16, 261.8539864266662, 0.7324855479159851, 0.029, 0.04, 0, 0.81216, 9.4, 0, 0, 0, 0),
(264, 2021, 1, 21, 771.23, 262.88107703375033, 1.0270906070841193, 0.029, 0.04, 0, 1.099872, 12.73, 0, 0, 0, 0),
(265, 2021, 1, 22, 771.28, 263.615865906668, 0.7347888729176475, 0.029, 0.04, 0, 0.814752, 9.43, 0, 0, 0, 0),
(266, 2021, 1, 23, 771.43, 265.82601302541593, 2.2101471187479547, 0.029, 0.04, 0, 2.282688, 26.42, 0, 0, 0, 0),
(267, 2021, 1, 24, 771.53, 267.3042771462496, 1.4782641208336713, 0.03, 0.04, 0, 1.557792, 18.03, 0, 0, 0, 0),
(268, 2021, 1, 25, 771.65, 269.0833177812497, 1.779040635000115, 0.03, 0.04, 0, 1.851552, 21.43, 0, 0, 0, 0),
(269, 2021, 1, 26, 771.8, 271.31500999999935, 2.231692218749629, 0.03, 0.04, 0, 2.312064, 26.76, 0, 0, 0, 0),
(270, 2021, 1, 27, 771.91, 272.9571796454162, 1.6421696454168568, 0.03, 0.04, 0, 1.7150400000000003, 19.85, 0, 0, 0, 0),
(271, 2021, 1, 28, 772.05, 275.054091754166, 2.096912108749791, 0.03, 0.04, 0, 2.17728, 25.2, 0, 0, 0, 0),
(272, 2021, 1, 29, 772.16, 276.7070999098662, 1.6530081557002063, 0.03, 0.04, 0, 1.726272, 19.98, 0, 0, 0, 0),
(273, 2021, 1, 30, 772.28, 278.515856905068, 1.8087569952018043, 0.03, 0.04, 0, 1.888704, 21.86, 0, 0, 0, 0),
(274, 2021, 1, 31, 772.4, 280.33034446666636, 1.8144875615983551, 0.03, 0.04, 0, 1.8878400000000002, 21.85, 0, 0, 0, 0),
(275, 2021, 3, 1, 785.21, 511.9520987721674, -0.42890122783256857, 0.043, 0.04, 1.094, 0.7516799999999999, 8.7, 1.094, 0, 0, 0.173),
(276, 2021, 3, 2, 785.18, 511.309276482668, -0.6428222894994065, 0.043, 0.04, 1.39, 0.832896, 9.64, 1.39, 0, 0, 0.173),
(277, 2021, 3, 3, 785.16, 510.88099331466594, -0.42828316800205357, 0.043, 0.04, 1.248, 0.905472, 10.48, 1.248, 0, 0, 0.173),
(278, 2021, 3, 4, 785.13, 510.2389660401665, -0.6420272744994691, 0.043, 0.04, 1.464, 0.908064, 10.51, 1.464, 0, 0, 0.173),
(279, 2021, 3, 5, 785.1, 509.59741566666713, -0.6415503734993422, 0.043, 0.04, 1.31, 0.754272, 8.73, 1.31, 0, 0, 0.173),
(280, 2021, 3, 6, 785.04, 508.31574529866583, -1.2816703680013006, 0.043, 0.04, 1.424, 0.228096, 2.64, 1.424, 0, 0, 0.173),
(281, 2021, 3, 7, 784.98, 507.03598174506703, -1.279763553598798, 0.043, 0.04, 1.84, 0.646272, 7.48, 1.84, 0, 0, 0.173),
(282, 2021, 3, 8, 784.89, 505.1199153204663, -1.9160664246007286, 0.043, 0.04, 2.501, 0.670464, 7.76, 2.501, 0, 0, 0.173),
(283, 2021, 3, 9, 784.8, 503.2081440666657, -1.911771253800623, 0.043, 0.04, 2.7, 0.873504, 10.11, 2.7, 0, 0, 0.173),
(284, 2021, 3, 10, 784.67, 500.45427775926817, -2.753866307397516, 0.043, 0.04, 3.372, 0.703296, 8.14, 3.372, 0, 0, 0.173),
(285, 2021, 3, 11, 784.58, 498.55300212906747, -1.9012756302007006, 0.043, 0.04, 2.683, 0.8674559999999999, 10.04, 2.683, 0, 0, 0.173),
(286, 2021, 3, 12, 784.46, 496.024644493865, -2.5283576352024397, 0.043, 0.04, 3.128, 0.685152, 7.93, 3.128, 0, 0, 0.173),
(287, 2021, 3, 13, 784.34, 493.5039152874649, -2.5207292064001194, 0.042, 0.04, 3.042, 0.606528, 7.02, 3.042, 0, 0, 0.173),
(288, 2021, 3, 14, 784.22, 490.9908124362672, -2.5131028511976865, 0.042, 0.04, 2.99, 0.5616, 6.5, 2.99, 0, 0, 0.173),
(289, 2021, 3, 15, 784.1, 488.48533386666713, -2.5054785696000863, 0.042, 0.04, 3.278, 0.857088, 9.92, 3.278, 0, 0, 0.173),
(290, 2021, 3, 16, 784.01, 486.6112271268665, -1.8741067398006521, 0.042, 0.04, 2.444, 0.654912, 7.58, 2.444, 0, 0, 0.173),
(291, 2021, 3, 17, 783.88, 483.9117577818665, -2.6994693449999545, 0.042, 0.04, 3.013, 0.398304, 4.61, 3.013, 0, 0, 0.173),
(292, 2021, 3, 18, 783.75, 481.2212462083333, -2.690511573533229, 0.042, 0.04, 3.094, 0.48816000000000004, 5.65, 3.094, 0, 0, 0.173),
(293, 2021, 3, 19, 783.68, 479.7762198512013, -1.4450263571320079, 0.042, 0.04, 1.702, 0.34128, 3.95, 1.702, 0, 0, 0.173),
(294, 2021, 3, 20, 783.8, 482.254998199999, 2.478778348797732, 0.042, 0.04, 0.27, 2.833056, 32.79, 0.27, 0, 0, 0.173),
(295, 2021, 3, 21, 783.83, 482.8758854941985, 0.6208872941994628, 0.042, 0.04, 0.167, 0.87264, 10.1, 0.167, 0, 0, 0.173),
(296, 2021, 3, 22, 783.86, 483.49724984959795, 0.6213643553994643, 0.042, 0.04, 0.104, 0.8095679999999998, 9.37, 0.104, 0, 0, 0.173),
(297, 2021, 3, 23, 783.88, 483.9117577818665, 0.4145079322685774, 0.042, 0.04, 0, 0.499392, 5.78, 0, 0, 0, 0.173),
(298, 2021, 3, 24, 783.87, 483.7044773131334, -0.20728046873313133, 0.042, 0.04, 0.282, 0.158976, 1.84, 0.282, 0, 0, 0.173),
(299, 2021, 3, 25, 783.86, 483.49724984959795, -0.20722746353544608, 0.042, 0.04, 0.581, 0.4587839999999999, 5.31, 0.581, 0, 0, 0.173),
(300, 2021, 3, 26, 783.87, 483.7044773131334, 0.20722746353544608, 0.042, 0.04, 0, 0.29808, 3.45, 0, 0, 0, 0.173),
(301, 2021, 3, 27, 783.88, 483.9117577818665, 0.20728046873313133, 0.042, 0.04, 0, 0.292032, 3.38, 0, 0, 0, 0.173),
(302, 2021, 3, 28, 783.86, 483.49724984959795, -0.4145079322685774, 0.042, 0.04, 0.615, 0.28512, 3.3, 0.615, 0, 0, 0.173),
(303, 2021, 3, 29, 783.88, 483.9117577818665, 0.4145079322685774, 0.042, 0.04, 0, 0.499392, 5.78, 0, 0, 0, 0.173),
(304, 2021, 3, 30, 783.89, 484.11909125539967, 0.20733347353314002, 0.042, 0.04, 0, 0.292032, 3.38, 0, 0, 0, 0.173),
(305, 2021, 3, 31, 783.9, 484.32647773333287, 0.20738647793319842, 0.042, 0.04, 0, 0.29808, 3.45, 0, 0, 0, 0.173),
(306, 2020, 12, 1, 785.21, 511.9520987721674, -0.42890122783256857, 0.043, 0.04, 1.094, 0.7516799999999999, 8.7, 1.094, 0, 0, 0.173),
(307, 2020, 12, 2, 785.18, 511.309276482668, -0.6428222894994065, 0.043, 0.04, 1.39, 0.832896, 9.64, 1.39, 0, 0, 0.173),
(308, 2020, 12, 3, 785.16, 510.88099331466594, -0.42828316800205357, 0.043, 0.04, 1.248, 0.905472, 10.48, 1.248, 0, 0, 0.173),
(309, 2020, 12, 4, 785.13, 510.2389660401665, -0.6420272744994691, 0.043, 0.04, 1.464, 0.908064, 10.51, 1.464, 0, 0, 0.173),
(310, 2020, 12, 5, 785.1, 509.59741566666713, -0.6415503734993422, 0.043, 0.04, 1.31, 0.754272, 8.73, 1.31, 0, 0, 0.173),
(311, 2020, 12, 6, 785.04, 508.31574529866583, -1.2816703680013006, 0.043, 0.04, 1.424, 0.228096, 2.64, 1.424, 0, 0, 0.173),
(312, 2020, 12, 7, 784.98, 507.03598174506703, -1.279763553598798, 0.043, 0.04, 1.84, 0.646272, 7.48, 1.84, 0, 0, 0.173),
(313, 2020, 12, 8, 784.89, 505.1199153204663, -1.9160664246007286, 0.043, 0.04, 2.501, 0.670464, 7.76, 2.501, 0, 0, 0.173),
(314, 2020, 12, 9, 784.8, 503.2081440666657, -1.911771253800623, 0.043, 0.04, 2.7, 0.873504, 10.11, 2.7, 0, 0, 0.173),
(315, 2020, 12, 10, 784.67, 500.45427775926817, -2.753866307397516, 0.043, 0.04, 3.372, 0.703296, 8.14, 3.372, 0, 0, 0.173),
(316, 2020, 12, 11, 784.58, 498.55300212906747, -1.9012756302007006, 0.043, 0.04, 2.683, 0.8674559999999999, 10.04, 2.683, 0, 0, 0.173),
(317, 2020, 12, 12, 784.46, 496.024644493865, -2.5283576352024397, 0.043, 0.04, 3.128, 0.685152, 7.93, 3.128, 0, 0, 0.173),
(318, 2020, 12, 13, 784.34, 493.5039152874649, -2.5207292064001194, 0.042, 0.04, 3.042, 0.606528, 7.02, 3.042, 0, 0, 0.173),
(319, 2020, 12, 14, 784.22, 490.9908124362672, -2.5131028511976865, 0.042, 0.04, 2.99, 0.5616, 6.5, 2.99, 0, 0, 0.173),
(320, 2020, 12, 15, 784.1, 488.48533386666713, -2.5054785696000863, 0.042, 0.04, 3.278, 0.857088, 9.92, 3.278, 0, 0, 0.173),
(321, 2020, 12, 16, 784.01, 486.6112271268665, -1.8741067398006521, 0.042, 0.04, 2.444, 0.654912, 7.58, 2.444, 0, 0, 0.173),
(322, 2020, 12, 17, 783.88, 483.9117577818665, -2.6994693449999545, 0.042, 0.04, 3.013, 0.398304, 4.61, 3.013, 0, 0, 0.173),
(323, 2020, 12, 18, 783.75, 481.2212462083333, -2.690511573533229, 0.042, 0.04, 3.094, 0.48816000000000004, 5.65, 3.094, 0, 0, 0.173),
(324, 2020, 12, 19, 783.68, 479.7762198512013, -1.4450263571320079, 0.042, 0.04, 1.702, 0.34128, 3.95, 1.702, 0, 0, 0.173),
(325, 2020, 12, 20, 783.8, 482.254998199999, 2.478778348797732, 0.042, 0.04, 0.27, 2.833056, 32.79, 0.27, 0, 0, 0.173),
(326, 2020, 12, 21, 783.83, 482.8758854941985, 0.6208872941994628, 0.042, 0.04, 0.167, 0.87264, 10.1, 0.167, 0, 0, 0.173),
(327, 2020, 12, 22, 783.86, 483.49724984959795, 0.6213643553994643, 0.042, 0.04, 0.104, 0.8095679999999998, 9.37, 0.104, 0, 0, 0.173),
(328, 2020, 12, 23, 783.88, 483.9117577818665, 0.4145079322685774, 0.042, 0.04, 0, 0.499392, 5.78, 0, 0, 0, 0.173),
(329, 2020, 12, 24, 783.87, 483.7044773131334, -0.20728046873313133, 0.042, 0.04, 0.282, 0.158976, 1.84, 0.282, 0, 0, 0.173),
(330, 2020, 12, 25, 783.86, 483.49724984959795, -0.20722746353544608, 0.042, 0.04, 0.581, 0.4587839999999999, 5.31, 0.581, 0, 0, 0.173),
(331, 2020, 12, 26, 783.87, 483.7044773131334, 0.20722746353544608, 0.042, 0.04, 0, 0.29808, 3.45, 0, 0, 0, 0.173),
(332, 2020, 12, 27, 783.88, 483.9117577818665, 0.20728046873313133, 0.042, 0.04, 0, 0.292032, 3.38, 0, 0, 0, 0.173),
(333, 2020, 12, 28, 783.86, 483.49724984959795, -0.4145079322685774, 0.042, 0.04, 0.615, 0.28512, 3.3, 0.615, 0, 0, 0.173),
(334, 2020, 12, 29, 783.88, 483.9117577818665, 0.4145079322685774, 0.042, 0.04, 0, 0.499392, 5.78, 0, 0, 0, 0.173),
(335, 2020, 12, 30, 783.89, 484.11909125539967, 0.20733347353314002, 0.042, 0.04, 0, 0.292032, 3.38, 0, 0, 0, 0.173),
(336, 2020, 12, 31, 783.9, 484.32647773333287, 0.20738647793319842, 0.042, 0.04, 0, 0.29808, 3.45, 0, 0, 0, 0.173),
(337, 2020, 5, 1, 785.21, 511.9520987721674, -0.42890122783256857, 0.043, 0.04, 1.094, 0.7516799999999999, 8.7, 1.094, 0, 0, 0.173),
(338, 2020, 5, 2, 785.18, 511.309276482668, -0.6428222894994065, 0.043, 0.04, 1.39, 0.832896, 9.64, 1.39, 0, 0, 0.173),
(339, 2020, 5, 3, 785.16, 510.88099331466594, -0.42828316800205357, 0.043, 0.04, 1.248, 0.905472, 10.48, 1.248, 0, 0, 0.173),
(340, 2020, 5, 4, 785.13, 510.2389660401665, -0.6420272744994691, 0.043, 0.04, 1.464, 0.908064, 10.51, 1.464, 0, 0, 0.173),
(341, 2020, 5, 5, 785.1, 509.59741566666713, -0.6415503734993422, 0.043, 0.04, 1.31, 0.754272, 8.73, 1.31, 0, 0, 0.173),
(342, 2020, 5, 6, 785.04, 508.31574529866583, -1.2816703680013006, 0.043, 0.04, 1.424, 0.228096, 2.64, 1.424, 0, 0, 0.173),
(343, 2020, 5, 7, 784.98, 507.03598174506703, -1.279763553598798, 0.043, 0.04, 1.84, 0.646272, 7.48, 1.84, 0, 0, 0.173),
(344, 2020, 5, 8, 784.89, 505.1199153204663, -1.9160664246007286, 0.043, 0.04, 2.501, 0.670464, 7.76, 2.501, 0, 0, 0.173),
(345, 2020, 5, 9, 784.8, 503.2081440666657, -1.911771253800623, 0.043, 0.04, 2.7, 0.873504, 10.11, 2.7, 0, 0, 0.173),
(346, 2020, 5, 10, 784.67, 500.45427775926817, -2.753866307397516, 0.043, 0.04, 3.372, 0.703296, 8.14, 3.372, 0, 0, 0.173),
(347, 2020, 5, 11, 784.58, 498.55300212906747, -1.9012756302007006, 0.043, 0.04, 2.683, 0.8674559999999999, 10.04, 2.683, 0, 0, 0.173),
(348, 2020, 5, 12, 784.46, 496.024644493865, -2.5283576352024397, 0.043, 0.04, 3.128, 0.685152, 7.93, 3.128, 0, 0, 0.173),
(349, 2020, 5, 13, 784.34, 493.5039152874649, -2.5207292064001194, 0.042, 0.04, 3.042, 0.606528, 7.02, 3.042, 0, 0, 0.173),
(350, 2020, 5, 14, 784.22, 490.9908124362672, -2.5131028511976865, 0.042, 0.04, 2.99, 0.5616, 6.5, 2.99, 0, 0, 0.173),
(351, 2020, 5, 15, 784.1, 488.48533386666713, -2.5054785696000863, 0.042, 0.04, 3.278, 0.857088, 9.92, 3.278, 0, 0, 0.173),
(352, 2020, 5, 16, 784.01, 486.6112271268665, -1.8741067398006521, 0.042, 0.04, 2.444, 0.654912, 7.58, 2.444, 0, 0, 0.173),
(353, 2020, 5, 17, 783.88, 483.9117577818665, -2.6994693449999545, 0.042, 0.04, 3.013, 0.398304, 4.61, 3.013, 0, 0, 0.173),
(354, 2020, 5, 18, 783.75, 481.2212462083333, -2.690511573533229, 0.042, 0.04, 3.094, 0.48816000000000004, 5.65, 3.094, 0, 0, 0.173),
(355, 2020, 5, 19, 783.68, 479.7762198512013, -1.4450263571320079, 0.042, 0.04, 1.702, 0.34128, 3.95, 1.702, 0, 0, 0.173),
(356, 2020, 5, 20, 783.8, 482.254998199999, 2.478778348797732, 0.042, 0.04, 0.27, 2.833056, 32.79, 0.27, 0, 0, 0.173),
(357, 2020, 5, 21, 783.83, 482.8758854941985, 0.6208872941994628, 0.042, 0.04, 0.167, 0.87264, 10.1, 0.167, 0, 0, 0.173),
(358, 2020, 5, 22, 783.86, 483.49724984959795, 0.6213643553994643, 0.042, 0.04, 0.104, 0.8095679999999998, 9.37, 0.104, 0, 0, 0.173),
(359, 2020, 5, 23, 783.88, 483.9117577818665, 0.4145079322685774, 0.042, 0.04, 0, 0.499392, 5.78, 0, 0, 0, 0.173),
(360, 2020, 5, 24, 783.87, 483.7044773131334, -0.20728046873313133, 0.042, 0.04, 0.282, 0.158976, 1.84, 0.282, 0, 0, 0.173),
(361, 2020, 5, 25, 783.86, 483.49724984959795, -0.20722746353544608, 0.042, 0.04, 0.581, 0.4587839999999999, 5.31, 0.581, 0, 0, 0.173),
(362, 2020, 5, 26, 783.87, 483.7044773131334, 0.20722746353544608, 0.042, 0.04, 0, 0.29808, 3.45, 0, 0, 0, 0.173),
(363, 2020, 5, 27, 783.88, 483.9117577818665, 0.20728046873313133, 0.042, 0.04, 0, 0.292032, 3.38, 0, 0, 0, 0.173),
(364, 2020, 5, 28, 783.86, 483.49724984959795, -0.4145079322685774, 0.042, 0.04, 0.615, 0.28512, 3.3, 0.615, 0, 0, 0.173),
(365, 2020, 5, 29, 783.88, 483.9117577818665, 0.4145079322685774, 0.042, 0.04, 0, 0.499392, 5.78, 0, 0, 0, 0.173),
(366, 2020, 5, 30, 783.89, 484.11909125539967, 0.20733347353314002, 0.042, 0.04, 0, 0.292032, 3.38, 0, 0, 0, 0.173),
(367, 2020, 5, 31, 783.9, 484.32647773333287, 0.20738647793319842, 0.042, 0.04, 0, 0.29808, 3.45, 0, 0, 0, 0.173),
(368, 2020, 10, 1, 5, 511.9520987721674, -0.42890122783256857, 0.043, 0.04, 1.094, 0.7516799999999999, 8.7, 1.094, 0, 0, 0.173),
(369, 2020, 10, 2, 785.18, 511.309276482668, -0.6428222894994065, 0.043, 0.04, 1.39, 0.832896, 9.64, 1.39, 0, 0, 0.173),
(370, 2020, 10, 3, 785.16, 510.88099331466594, -0.42828316800205357, 0.043, 0.04, 1.248, 0.905472, 10.48, 1.248, 0, 0, 0.173),
(371, 2020, 10, 4, 785.13, 510.2389660401665, -0.6420272744994691, 0.043, 0.04, 1.464, 0.908064, 10.51, 1.464, 0, 0, 0.173),
(372, 2020, 10, 5, 785.1, 509.59741566666713, -0.6415503734993422, 0.043, 0.04, 1.31, 0.754272, 8.73, 1.31, 0, 0, 0.173),
(373, 2020, 10, 6, 785.04, 508.31574529866583, -1.2816703680013006, 0.043, 0.04, 1.424, 0.228096, 2.64, 1.424, 0, 0, 0.173),
(374, 2020, 10, 7, 784.98, 507.03598174506703, -1.279763553598798, 0.043, 0.04, 1.84, 0.646272, 7.48, 1.84, 0, 0, 0.173),
(375, 2020, 10, 8, 784.89, 505.1199153204663, -1.9160664246007286, 0.043, 0.04, 2.501, 0.670464, 7.76, 2.501, 0, 0, 0.173),
(376, 2020, 10, 9, 784.8, 503.2081440666657, -1.911771253800623, 0.043, 0.04, 2.7, 0.873504, 10.11, 2.7, 0, 0, 0.173),
(377, 2020, 10, 10, 784.67, 500.45427775926817, -2.753866307397516, 0.043, 0.04, 3.372, 0.703296, 8.14, 3.372, 0, 0, 0.173),
(378, 2020, 10, 11, 784.58, 498.55300212906747, -1.9012756302007006, 0.043, 0.04, 2.683, 0.8674559999999999, 10.04, 2.683, 0, 0, 0.173),
(379, 2020, 10, 12, 784.46, 496.024644493865, -2.5283576352024397, 0.043, 0.04, 3.128, 0.685152, 7.93, 3.128, 0, 0, 0.173),
(380, 2020, 10, 13, 784.34, 493.5039152874649, -2.5207292064001194, 0.042, 0.04, 3.042, 0.606528, 7.02, 3.042, 0, 0, 0.173),
(381, 2020, 10, 14, 784.22, 490.9908124362672, -2.5131028511976865, 0.042, 0.04, 2.99, 0.5616, 6.5, 2.99, 0, 0, 0.173),
(382, 2020, 10, 15, 784.1, 488.48533386666713, -2.5054785696000863, 0.042, 0.04, 3.278, 0.857088, 9.92, 3.278, 0, 0, 0.173),
(383, 2020, 10, 16, 784.01, 486.6112271268665, -1.8741067398006521, 0.042, 0.04, 2.444, 0.654912, 7.58, 2.444, 0, 0, 0.173),
(384, 2020, 10, 17, 783.88, 483.9117577818665, -2.6994693449999545, 0.042, 0.04, 3.013, 0.398304, 4.61, 3.013, 0, 0, 0.173),
(385, 2020, 10, 18, 783.75, 481.2212462083333, -2.690511573533229, 0.042, 0.04, 3.094, 0.48816000000000004, 5.65, 3.094, 0, 0, 0.173),
(386, 2020, 10, 19, 783.68, 479.7762198512013, -1.4450263571320079, 0.042, 0.04, 1.702, 0.34128, 3.95, 1.702, 0, 0, 0.173),
(387, 2020, 10, 20, 783.8, 482.254998199999, 2.478778348797732, 0.042, 0.04, 0.27, 2.833056, 32.79, 0.27, 0, 0, 0.173),
(388, 2020, 10, 21, 783.83, 482.8758854941985, 0.6208872941994628, 0.042, 0.04, 0.167, 0.87264, 10.1, 0.167, 0, 0, 0.173),
(389, 2020, 10, 22, 783.86, 483.49724984959795, 0.6213643553994643, 0.042, 0.04, 0.104, 0.8095679999999998, 9.37, 0.104, 0, 0, 0.173),
(390, 2020, 10, 23, 783.88, 483.9117577818665, 0.4145079322685774, 0.042, 0.04, 0, 0.499392, 5.78, 0, 0, 0, 0.173),
(391, 2020, 10, 24, 783.87, 483.7044773131334, -0.20728046873313133, 0.042, 0.04, 0.282, 0.158976, 1.84, 0.282, 0, 0, 0.173),
(392, 2020, 10, 25, 783.86, 483.49724984959795, -0.20722746353544608, 0.042, 0.04, 0.581, 0.4587839999999999, 5.31, 0.581, 0, 0, 0.173),
(393, 2020, 10, 26, 783.87, 483.7044773131334, 0.20722746353544608, 0.042, 0.04, 0, 0.29808, 3.45, 0, 0, 0, 0.173),
(394, 2020, 10, 27, 783.88, 483.9117577818665, 0.20728046873313133, 0.042, 0.04, 0, 0.292032, 3.38, 0, 0, 0, 0.173),
(395, 2020, 10, 28, 783.86, 483.49724984959795, -0.4145079322685774, 0.042, 0.04, 0.615, 0.28512, 3.3, 0.615, 0, 0, 0.173),
(396, 2020, 10, 29, 783.88, 483.9117577818665, 0.4145079322685774, 0.042, 0.04, 0, 0.499392, 5.78, 0, 0, 0, 0.173),
(397, 2020, 10, 30, 783.89, 484.11909125539967, 0.20733347353314002, 0.042, 0.04, 0, 0.292032, 3.38, 0, 0, 0, 0.173),
(398, 2020, 10, 31, 783.9, 484.32647773333287, 0.20738647793319842, 0.042, 0.04, 0, 0.29808, 3.45, 0, 0, 0, 0.173);

-- --------------------------------------------------------

--
-- Table structure for table `barage_binouidanefornitures`
--

CREATE TABLE `barage_binouidanefornitures` (
  `id` int NOT NULL,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `turbinageAfourer` double NOT NULL,
  `irrigation` double NOT NULL,
  `aepiBm` double NOT NULL,
  `vidPdev` double NOT NULL,
  `TransfertMassira` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_binouidanefornitures`
--

INSERT INTO `barage_binouidanefornitures` (`id`, `periode`, `turbinage`, `turbinageAfourer`, `irrigation`, `aepiBm`, `vidPdev`, `TransfertMassira`, `month`, `year`) VALUES
(32, '2020/2021', 26, 18.9, 18.4, 0.9, 0, 3.1, 'Sep', 2020),
(33, '2020/2021', 41.1, 31.2, 30.6, 0.8, 0, 6.4, 'Oct', 2020),
(34, '2020/2021', 17, 11.7, 11.5, 0.7, 0, 3.3, 'Nov', 2020),
(35, '2020/2021', 4.1, 0.3, 0, 0.6, 0, 2.8, 'Dec', 2020),
(36, '2020/2021', 0.87, 0, 0, 0.6, 0, 0, 'Jan', 2021),
(37, '2020/2021', 0.87, 0, 0, 0, 0, 0, 'J', 2021),
(39, '2020/2021', 45.74, 0, 0, 0, 0, 0, 'Mar', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_daouratefornitures`
--

CREATE TABLE `barage_daouratefornitures` (
  `id` int NOT NULL,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `aep` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_daouratefornitures`
--

INSERT INTO `barage_daouratefornitures` (`id`, `periode`, `turbinage`, `aep`, `vidPdev`, `month`, `year`) VALUES
(1, '2020/2021', 0, 12.1, 1.38, 'Sep', 2020),
(2, '2020/2021', 0, 12.3, 2.68, 'Oct', 2020),
(3, '2020/2021', 0, 11.4, 0.52, 'Nov', 2020),
(4, '2020/2021', 0, 11.7, 0.54, 'Dec', 2020),
(5, '2020/2021', 0, 11.8, 0.13, 'Jan', 2021),
(6, '2020/2021', 0, 10.5, 0, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_diguesafifornitures`
--

CREATE TABLE `barage_diguesafifornitures` (
  `id` int NOT NULL,
  `periode` varchar(20) NOT NULL,
  `aep` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_diguesafifornitures`
--

INSERT INTO `barage_diguesafifornitures` (`id`, `periode`, `aep`, `vidPdev`, `month`, `year`) VALUES
(1, '2020/2021', 3, 0, 'Sep', 2020),
(2, '2020/2021', 3, 0, 'Oct', 2020),
(3, '2020/2021', 3, 0, 'Nov', 2020),
(4, '2020/2021', 3, 0, 'Dec', 2020),
(5, '2020/2021', 3, 0, 'Jan', 2021),
(6, '2020/2021', 3, 0, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_hassanprembilanhydr`
--

CREATE TABLE `barage_hassanprembilanhydr` (
  `id` int NOT NULL,
  `annee` int NOT NULL,
  `mois` int NOT NULL,
  `jour` int NOT NULL,
  `cote` double NOT NULL,
  `reserve` double NOT NULL,
  `varReserve` double NOT NULL,
  `evaporation` double NOT NULL,
  `fuite` double NOT NULL,
  `total` double NOT NULL,
  `appVolume` double NOT NULL,
  `appDebit` double NOT NULL,
  `onep` double NOT NULL,
  `one` double NOT NULL,
  `vidFond` double NOT NULL,
  `eCrue` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_hassanprembilanhydr`
--

INSERT INTO `barage_hassanprembilanhydr` (`id`, `annee`, `mois`, `jour`, `cote`, `reserve`, `varReserve`, `evaporation`, `fuite`, `total`, `appVolume`, `appDebit`, `onep`, `one`, `vidFond`, `eCrue`) VALUES
(57, 2021, 2, 1, 932.21, 54.348, 0.3100000000000023, 0.009, 0.016, 0.00914, 0.3441400000000023, 3.983101851851878, 0.00914, 0, 0, 0),
(58, 2021, 2, 2, 932.3, 54.658, -0.13700000000000045, 0.009, 0.016, 0.40914, 0.29713999999999957, 3.4391203703703654, 0.00914, 0.4, 0, 0),
(59, 2021, 2, 3, 932.26, 54.521, 0.27599999999999625, 0.01, 0.016, 0.00914, 0.31113999999999625, 3.601157407407364, 0.00914, 0, 0, 0),
(60, 2021, 2, 4, 932.34, 54.797, 0.27600000000000335, 0.007, 0.016, 0.00914, 0.30814000000000336, 3.566435185185224, 0.00914, 0, 0, 0),
(61, 2021, 2, 5, 932.42, 55.073, 0.3119999999999976, 0.005, 0.016, 0.00914, 0.3421399999999976, 3.959953703703676, 0.00914, 0, 0, 0),
(62, 2021, 2, 6, 932.51, 55.385, 0.45300000000000296, 0.004, 0.016, 0.00914, 0.48214000000000296, 5.580324074074108, 0.00914, 0, 0, 0),
(63, 2021, 2, 7, 932.64, 55.838, 0.34899999999999665, 0.009, 0.016, 0.00914, 0.38313999999999665, 4.434490740740702, 0.00914, 0, 0, 0),
(64, 2021, 2, 8, 932.74, 56.187, 0.3860000000000028, 0.007, 0.016, 0.00914, 0.4181400000000028, 4.839583333333365, 0.00914, 0, 0, 0),
(65, 2021, 2, 9, 932.85, 56.573, 0.2809999999999988, 0.007, 0.016, 0.00914, 0.3131399999999988, 3.6243055555555417, 0.00914, 0, 0, 0),
(66, 2021, 2, 10, 932.93, 56.854, 0.31799999999999784, 0.007, 0.016, 0.00914, 0.35013999999999784, 4.052546296296271, 0.00914, 0, 0, 0),
(67, 2021, 2, 11, 933.02, 57.172, 0.31800000000000495, 0.008, 0.016, 0.00914, 0.35114000000000495, 4.064120370370428, 0.00914, 0, 0, 0),
(68, 2021, 2, 12, 933.11, 57.49, 0.3189999999999955, 0.008, 0.016, 0.00914, 0.3521399999999955, 4.075694444444392, 0.00914, 0, 0, 0),
(69, 2021, 2, 13, 933.2, 57.809, 0.21300000000000097, 0.008, 0.016, 0.00914, 0.246140000000001, 2.848842592592604, 0.00914, 0, 0, 0),
(70, 2021, 2, 14, 933.26, 58.022, 0.2850000000000037, 0.008, 0.016, 0.00914, 0.3181400000000037, 3.6821759259259688, 0.00914, 0, 0, 0),
(71, 2021, 2, 15, 933.34, 58.307, -0.10699999999999932, 0.008, 0.016, 0.40914, 0.3261400000000007, 3.7747685185185267, 0.00914, 0.4, 0, 0),
(72, 2021, 2, 16, 933.31, 58.2, 0.21399999999999864, 0.008, 0.016, 0.00914, 0.24713999999999867, 2.860416666666651, 0.00914, 0, 0, 0),
(73, 2021, 2, 17, 933.37, 58.414, 0.036000000000001364, 0.009, 0.016, 0.20914000000000002, 0.2701400000000014, 3.1266203703703863, 0.00914, 0.2, 0, 0),
(74, 2021, 2, 18, 933.38, 58.45, -0.3569999999999993, 0.008, 0.016, 0.60914, 0.2761400000000007, 3.196064814814823, 0.00914, 0.6, 0, 0),
(75, 2021, 2, 19, 933.28, 58.093, 0.21399999999999864, 0.009, 0.016, 0.00914, 0.24813999999999867, 2.8719907407407255, 0.00914, 0, 0, 0),
(76, 2021, 2, 20, 933.34, 58.307, 0.25, 0.01, 0.016, 0.00914, 0.28514, 3.3002314814814815, 0.00914, 0, 0, 0),
(77, 2021, 2, 21, 933.41, 58.557, 0.4649999999999963, 0.006, 0.016, 0.00914, 0.4961399999999963, 5.742361111111069, 0.00914, 0, 0, 0),
(78, 2021, 2, 22, 933.54, 59.022, 0.35999999999999943, 0.006, 0.016, 0.00914, 0.39113999999999943, 4.5270833333333265, 0.00914, 0, 0, 0),
(79, 2021, 2, 23, 933.64, 59.382, 0.3240000000000052, 0.007, 0.016, 0.00914, 0.3561400000000052, 4.121990740740801, 0.00914, 0, 0, 0),
(80, 2021, 2, 24, 933.73, 59.706, 0.2530000000000001, 0.007, 0.016, 0.00914, 0.2851400000000001, 3.3002314814814833, 0.00914, 0, 0, 0),
(81, 2021, 2, 25, 933.8, 59.959, 0.2889999999999944, 0.007, 0.016, 0.00914, 0.3211399999999944, 3.716898148148083, 0.00914, 0, 0, 0),
(82, 2021, 2, 26, 933.88, 60.248, 0.3990000000000009, 0.006, 0.016, 0.00914, 0.4301400000000009, 4.978472222222233, 0.00914, 0, 0, 0),
(83, 2021, 2, 27, 933.99, 60.647, 0.40100000000000335, 0.006, 0.016, 0.00914, 0.43214000000000335, 5.00162037037041, 0.00914, 0, 0, 0),
(84, 2021, 2, 28, 934.1, 61.048, 0.43900000000000006, 0.005, 0.016, 0.00914, 0.46914000000000006, 5.429861111111111, 0.00914, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barage_hassanpremfornitures`
--

CREATE TABLE `barage_hassanpremfornitures` (
  `id` int NOT NULL,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `aepiAzDem` double NOT NULL,
  `vidPdev` double NOT NULL,
  `TransfertMassira` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_hassanpremfornitures`
--

INSERT INTO `barage_hassanpremfornitures` (`id`, `periode`, `turbinage`, `aepiAzDem`, `vidPdev`, `TransfertMassira`, `month`, `year`) VALUES
(4, '2020/2021', 9.3, 0.28, 0, 1.2, 'Sep', 2020),
(5, '2020/2021', 6.6, 0.27, 0, 1.1, 'Oct', 2020),
(6, '2020/2021', 6, 0.258, 0, 0.8, 'Nov', 2020),
(7, '2020/2021', 2.1, 0.27, 0, 0, 'Dec', 2020),
(8, '2020/2021', 1.6, 0.28, 0, 0, 'Jan', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_imfoutfornitures`
--

CREATE TABLE `barage_imfoutfornitures` (
  `id` int NOT NULL,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `irrigation` double NOT NULL,
  `aepSidiBenourZemamra` double NOT NULL,
  `aepONEPDoukkala` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_imfoutfornitures`
--

INSERT INTO `barage_imfoutfornitures` (`id`, `periode`, `turbinage`, `irrigation`, `aepSidiBenourZemamra`, `aepONEPDoukkala`, `vidPdev`, `month`, `year`) VALUES
(1, '2020/2021', 24.2, 0, 0.3, 0.374, 0, 'Sep', 2020),
(2, '2020/2021', 18, 0, 0.3, 0.33, 0, 'Oct', 2020),
(3, '2020/2021', 17.1, 0, 0.3, 0.243, 0, 'Nov', 2020),
(4, '2020/2021', 16.4, 0, 0.3, 0.209, 0, 'Dec', 2020),
(5, '2020/2021', 13.4, 0, 0.3, 237, 0, 'Jan', 2021),
(6, '2020/2021', 14.3, 0, 0.3, 198, 0, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_massirabilanhydr`
--

CREATE TABLE `barage_massirabilanhydr` (
  `id` int NOT NULL,
  `annee` int NOT NULL,
  `mois` int NOT NULL,
  `jour` int NOT NULL,
  `cote` double NOT NULL,
  `reserve` double NOT NULL,
  `varReserve` double NOT NULL,
  `evaporation` double NOT NULL,
  `fuite` double NOT NULL,
  `total` double NOT NULL,
  `appVolume` double NOT NULL,
  `appDebit` double NOT NULL,
  `one` double NOT NULL,
  `onep1` double NOT NULL,
  `onpe2` double NOT NULL,
  `vFond` double NOT NULL,
  `evacCrue` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barage_massirafornitures`
--

CREATE TABLE `barage_massirafornitures` (
  `id` int NOT NULL,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `aepiRhamna` double NOT NULL,
  `aepiKech` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_massirafornitures`
--

INSERT INTO `barage_massirafornitures` (`id`, `periode`, `turbinage`, `aepiRhamna`, `aepiKech`, `vidPdev`, `month`, `year`) VALUES
(1, '2020/2021', 7.2, 75, 52, 39.7, 'Sep', 2020),
(2, '2020/2021', 0, 0.99, 0.53, 38.5, 'Oct', 2020),
(3, '2020/2021', 0, 0.62, 0.36, 35, 'Nov', 2020),
(4, '2020/2021', 0, 0.4, 0.67, 31.5, 'Dec', 2020),
(5, '2020/2021', 0, 0.35, 61, 19, 'Jan', 2021),
(6, '2020/2021', 0, 0.36, 0.59, 25, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_myyoussefbilanhydr`
--

CREATE TABLE `barage_myyoussefbilanhydr` (
  `id` int NOT NULL,
  `annee` int NOT NULL,
  `mois` int NOT NULL,
  `jour` int NOT NULL,
  `cote` double NOT NULL,
  `reserve` double NOT NULL,
  `varReserve` double NOT NULL,
  `evaporation` double NOT NULL,
  `fuite` double NOT NULL,
  `total` double NOT NULL,
  `appVolume` double NOT NULL,
  `appDebit` double NOT NULL,
  `evc` double NOT NULL,
  `v` double NOT NULL,
  `c` double NOT NULL,
  `one` double NOT NULL,
  `vf` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barage_myyousseffornitures`
--

CREATE TABLE `barage_myyousseffornitures` (
  `id` int NOT NULL,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `irrigation` double NOT NULL,
  `soltania` double NOT NULL,
  `vidPdev` double NOT NULL,
  `TransfertMassira` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_myyousseffornitures`
--

INSERT INTO `barage_myyousseffornitures` (`id`, `periode`, `turbinage`, `irrigation`, `soltania`, `vidPdev`, `TransfertMassira`, `month`, `year`) VALUES
(1, '2020/2021', 5, 5.8, 0.2, 0.89, 0, 'Sep', 2020),
(2, '2020/2021', 9.8, 10.4, 0.2, 0.11, 0, 'Oct', 2020),
(3, '2020/2021', 2.6, 2.6, 0.2, 0, 0, 'Nov', 2020),
(4, '2020/2021', 4.5, 6.3, 0.2, 0, 0, 'Dec', 2020),
(5, '2020/2021', 1.8, 2.8, 0.1, 0, 0, 'Jan', 2021),
(6, '2020/2021', 7.8, 0, 0.2, 8, 12.5, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_sididaouifornitures`
--

CREATE TABLE `barage_sididaouifornitures` (
  `id` int NOT NULL,
  `periode` varchar(20) NOT NULL,
  `aepAzemour` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_sididaouifornitures`
--

INSERT INTO `barage_sididaouifornitures` (`id`, `periode`, `aepAzemour`, `month`, `year`) VALUES
(1, '2020/2021', 0.193, 'Sep', 2020),
(2, '2020/2021', 0.176, 'Oct', 2020),
(3, '2020/2021', 0.177, 'Nov', 2020),
(4, '2020/2021', 0.195, 'Dec', 2020),
(5, '2020/2021', 0.194, 'Jan', 2021),
(6, '2020/2021', 0.218, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_sididrissbilanhydr`
--

CREATE TABLE `barage_sididrissbilanhydr` (
  `id` int NOT NULL,
  `annee` int NOT NULL,
  `mois` int NOT NULL,
  `jour` int NOT NULL,
  `cote` double NOT NULL,
  `reserve` double NOT NULL,
  `varReserve` double NOT NULL,
  `evaporation` double NOT NULL,
  `fuite` double NOT NULL,
  `total` double NOT NULL,
  `appVolume` double NOT NULL,
  `appDebit` double NOT NULL,
  `oued` double NOT NULL,
  `canal` double NOT NULL,
  `vidFond` double NOT NULL,
  `Desverse` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_sididrissbilanhydr`
--

INSERT INTO `barage_sididrissbilanhydr` (`id`, `annee`, `mois`, `jour`, `cote`, `reserve`, `varReserve`, `evaporation`, `fuite`, `total`, `appVolume`, `appDebit`, `oued`, `canal`, `vidFond`, `Desverse`) VALUES
(1, 2021, 1, 1, 644.78, 2.166, 0.19200000000000017, 0.004091, 0.000258, 0.1728, 0.36914900000000017, 4.272557870370372, 0, 0.1728, 0, 0),
(2, 2021, 1, 2, 644.93, 2.358, -0.039000000000000146, 0.004744, 0.000258, 0.0423, 0.008301999999999851, 0.09608796296296124, 0, 0.0423, 0, 0),
(3, 2021, 1, 3, 644.9, 2.319, 0.07799999999999985, 0.003928, 0.000258, 0.02592, 0.10810599999999984, 1.25122685185185, 0, 0.02592, 0, 0),
(4, 2021, 1, 4, 644.96, 2.397, 0, 0.003115, 0.000258, 0.02592, 0.029293, 0.33903935185185186, 0, 0.02592, 0, 0),
(5, 2021, 1, 5, 644.96, 2.397, 0.052000000000000046, 0.001771, 0.000258, 0.20154, 0.25556900000000005, 2.9579745370370376, 0, 0.06354, 0.138, 0),
(6, 2021, 1, 6, 645, 2.449, 0, 0.002299, 0.000258, 0.14118, 0.143737, 1.6636226851851852, 0, 0.02592, 0.11526, 0),
(7, 2021, 1, 7, 645, 2.449, -0.0259999999999998, 0.002921, 0.000258, 0.03564, 0.012819000000000198, 0.14836805555555785, 0, 0.03564, 0, 0),
(8, 2021, 1, 8, 644.98, 2.423, -0.0129999999999999, 0.003122, 0.000258, 0.02592, 0.0163000000000001, 0.18865740740740855, 0, 0.02592, 0, 0),
(9, 2021, 1, 9, 644.97, 2.41, 0, 0.003328, 0.000258, 0.02592, 0.029505999999999998, 0.3415046296296296, 0, 0.02592, 0, 0),
(10, 2021, 1, 10, 644.97, 2.41, -0.013000000000000345, 0.003533, 0.000258, 0.02592, 0.016710999999999653, 0.19341435185184785, 0, 0.02592, 0, 0),
(11, 2021, 1, 11, 644.96, 2.397, 0, 0.003946, 0.000258, 0.02592, 0.030123999999999998, 0.34865740740740736, 0, 0.02592, 0, 0),
(12, 2021, 1, 12, 644.96, 2.397, 0.013000000000000345, 0.004053, 0.000258, 0.02592, 0.043231000000000346, 0.5003587962963002, 0, 0.02592, 0, 0),
(13, 2021, 1, 13, 644.97, 2.41, -0.395, 0.003871, 0.000258, 0.216, -0.17487100000000003, -2.0239699074074076, 0, 0.216, 0, 0),
(14, 2021, 1, 14, 644.66, 2.015, -0.062000000000000055, 0.003581, 0.000258, 0.072, 0.013838999999999942, 0.16017361111111045, 0, 0.072, 0, 0),
(15, 2021, 1, 15, 644.61, 1.953, -0.049000000000000155, 0.003168, 0.000258, 0.0432, -0.0023740000000001538, -0.02747685185185363, 0, 0.0432, 0, 0),
(16, 2021, 1, 16, 644.57, 1.904, 0.4540000000000002, 0.002022, 0.000258, 0.2052, 0.6614800000000002, 7.656018518518521, 0, 0.2052, 0, 0),
(17, 2021, 1, 17, 644.93, 2.358, 0.06499999999999995, 0.001971, 0.000258, 0.45690000000000003, 0.524129, 6.06630787037037, 0, 0.1728, 0.2841, 0),
(18, 2021, 1, 18, 644.98, 2.423, 0, 0.001875, 0.000258, 0.05184, 0.053973, 0.6246875, 0, 0.05184, 0, 0),
(19, 2021, 1, 19, 644.98, 2.423, -0.026000000000000245, 0.0026, 0.000258, 0.05148, 0.028337999999999752, 0.32798611111110826, 0, 0.05148, 0, 0),
(20, 2021, 1, 20, 644.96, 2.397, 0.013000000000000345, 0.00291, 0.000258, 0.03456, 0.05072800000000034, 0.5871296296296336, 0, 0.03456, 0, 0),
(21, 2021, 1, 21, 644.97, 2.41, -0.013000000000000345, 0.003118, 0.000258, 0.03456, 0.024935999999999653, 0.2886111111111071, 0, 0.03456, 0, 0),
(22, 2021, 1, 22, 644.96, 2.397, 0, 0.003323, 0.000258, 0.03456, 0.038141, 0.44144675925925925, 0, 0.03456, 0, 0),
(23, 2021, 1, 23, 644.96, 2.397, 0, 0.003115, 0.000258, 0.03456, 0.037933, 0.43903935185185183, 0, 0.03456, 0, 0),
(24, 2021, 1, 24, 644.96, 2.397, -0.17999999999999972, 0.003084, 0.000258, 0.12825, -0.0484079999999997, -0.5602777777777743, 0, 0.12825, 0, 0),
(25, 2021, 1, 25, 644.82, 2.217, -0.30100000000000016, 0.002809, 0.000258, 0.1728, -0.12513300000000016, -1.448298611111113, 0, 0.1728, 0, 0),
(26, 2021, 1, 26, 644.58, 1.916, 0.037000000000000144, 0.003169, 0.000258, 0.02592, 0.06634700000000014, 0.7679050925925943, 0, 0.02592, 0, 0),
(27, 2021, 1, 27, 644.61, 1.953, 0.050000000000000044, 0.003282, 0.000258, 0.02592, 0.07946000000000004, 0.9196759259259264, 0, 0.02592, 0, 0),
(28, 2021, 1, 28, 644.65, 2.003, -0.4580000000000002, 0.003058, 0.000258, 0.216, -0.2386840000000002, -2.7625462962962986, 0, 0.216, 0, 0),
(29, 2021, 1, 29, 644.27, 1.545, 0.15200000000000014, 0.002804, 0.000258, 0.3888, 0.5438620000000001, 6.294699074074075, 0, 0.3888, 0, 0),
(30, 2021, 1, 30, 644.4, 1.697, 0.5329999999999999, 0.002567, 0.000258, 0.216, 0.7518249999999999, 8.701678240740739, 0, 0.216, 0, 0),
(31, 2021, 1, 31, 644.83, 2.23, -0.351, 0.002306, 0.000258, 0.1728, -0.17563600000000001, -2.032824074074074, 0, 0.1728, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barage_sididrissfornitures`
--

CREATE TABLE `barage_sididrissfornitures` (
  `id` int NOT NULL,
  `periode` varchar(20) NOT NULL,
  `Canal` double NOT NULL,
  `pmh` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_sididrissfornitures`
--

INSERT INTO `barage_sididrissfornitures` (`id`, `periode`, `Canal`, `pmh`, `vidPdev`, `month`, `year`) VALUES
(2, '2020/2021', 7.2, 0, 0.09, 'Sep', 2020),
(3, '2020/2021', 5.3, 0, 0.17, 'Oct', 2020),
(4, '2020/2021', 5, 0, 0.49, 'Nov', 2020),
(5, '2020/2021', 2.8, 0, 54, 'Dec', 2020),
(6, '2020/2021', 4.8, 0, 0.53, 'Jan', 2021),
(7, '2020/2021', 3.6, 0, 0, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_ssmaachoufornitures`
--

CREATE TABLE `barage_ssmaachoufornitures` (
  `id` int NOT NULL,
  `periode` varchar(20) NOT NULL,
  `aep` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_ssmaachoufornitures`
--

INSERT INTO `barage_ssmaachoufornitures` (`id`, `periode`, `aep`, `vidPdev`, `month`, `year`) VALUES
(1, '2020/2021', 5, 4.16, 'Sep', 2020),
(2, '2020/2021', 5.2, 1.09, 'Oct', 2020),
(3, '2020/2021', 4.9, 1.49, 'Nov', 2020),
(4, '2020/2021', 5.1, 2.05, 'Dec', 2020),
(5, '2020/2021', 4.9, 4.02, 'Jan', 2021),
(6, '2020/2021', 4.5, 2.8, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_varapport`
--

CREATE TABLE `barage_varapport` (
  `id` int NOT NULL,
  `periode` varchar(20) NOT NULL,
  `barage` varchar(40) NOT NULL,
  `sep` double NOT NULL,
  `oct` double NOT NULL,
  `nov` double NOT NULL,
  `dec` double NOT NULL,
  `jan` double NOT NULL,
  `feb` double NOT NULL,
  `mar` double NOT NULL,
  `apr` double NOT NULL,
  `may` double NOT NULL,
  `jun` double NOT NULL,
  `jul` double NOT NULL,
  `aug` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(29, 'barage', 'aelhanssalibilanhydr'),
(17, 'barage', 'aelhanssalifornitures'),
(30, 'barage', 'aitmessaoudbilanhydr'),
(18, 'barage', 'aitmessaoudfornitures'),
(9, 'barage', 'apportmbinouidane'),
(8, 'barage', 'apportmcomplexhansalimassira'),
(11, 'barage', 'apportmhassanprem'),
(10, 'barage', 'apportmmoulayyoussef'),
(32, 'barage', 'barageuploaded'),
(7, 'barage', 'barrages'),
(25, 'barage', 'binouidanebilanhydr'),
(13, 'barage', 'binouidanefornitures'),
(21, 'barage', 'daouratefornitures'),
(24, 'barage', 'diguesafifornitures'),
(26, 'barage', 'hassanprembilanhydr'),
(14, 'barage', 'hassanpremfornitures'),
(20, 'barage', 'imfoutfornitures'),
(31, 'barage', 'massirabilanhydr'),
(19, 'barage', 'massirafornitures'),
(28, 'barage', 'myyoussefbilanhydr'),
(16, 'barage', 'myyousseffornitures'),
(23, 'barage', 'sididaouifornitures'),
(27, 'barage', 'sididrissbilanhydr'),
(15, 'barage', 'sididrissfornitures'),
(22, 'barage', 'ssmaachoufornitures'),
(12, 'barage', 'varapport'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-04-02 16:52:41.560129'),
(2, 'auth', '0001_initial', '2021-04-02 16:52:45.609929'),
(3, 'admin', '0001_initial', '2021-04-02 16:52:57.074220'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-04-02 16:53:00.700725'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-04-02 16:53:00.812052'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-04-02 16:53:04.241405'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-04-02 16:53:06.262833'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-04-02 16:53:06.632470'),
(9, 'auth', '0004_alter_user_username_opts', '2021-04-02 16:53:06.719347'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-04-02 16:53:08.572130'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-04-02 16:53:08.739529'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-04-02 16:53:08.821401'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-04-02 16:53:10.685098'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-04-02 16:53:12.407972'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-04-02 16:53:12.695841'),
(16, 'auth', '0011_update_proxy_permissions', '2021-04-02 16:53:12.894815'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-04-02 16:53:14.469766'),
(18, 'sessions', '0001_initial', '2021-04-02 16:53:15.220406'),
(19, 'barage', '0001_initial', '2021-04-02 16:53:41.761577'),
(20, 'barage', '0002_auto_20210402_2305', '2021-04-02 23:05:56.960546'),
(21, 'barage', '0003_auto_20210403_1623', '2021-04-03 16:24:28.602900'),
(22, 'barage', '0004_auto_20210404_1515', '2021-04-04 15:16:14.012909');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9mgygjj7p7m83gzl2flehcnuk9vkbstc', 'e30:1lU7wX:CcNu-VQ0PesahpcY7ZockoGUGjsLiY4ztkMs8c-tO6o', '2021-04-21 13:10:01.003333'),
('j5i5xddsbe90yfyvvcu6rhfdnjgh4g34', 'e30:1lU7wB:bdGAKlr0R8pQiismhwbXXC65WDzxrc0QVWkBg9gQ9pE', '2021-04-21 13:09:39.552540'),
('t5f7j7kjp15je7gynu8t7ksonxx85hwm', '.eJxVjEEOgjAQRe_StWnoMNDi0j1naGbaqUVNSSisjHcXEha6_e-9_1aetjX7rcrip6iuyqjL78YUnlIOEB9U7rMOc1mXifWh6JNWPc5RXrfT_TvIVPNeIxELAtqILkVjGjIDNwQYEMlJn7oeJCBYDjy0nFqx4ABkL5LrrKjPF-2UN_s:1lU9U2:85SKBirQywCTlElkmAq5p3K7_GHpRZJgUHY1Kd7thA0', '2021-04-21 14:48:42.112023'),
('ya5v4319fxyx7wjzfzj4ykr3j9kva2nh', 'e30:1lU7wf:OgS6y8bt1yYbOy5BIXwhXpszidtsSmh17BvztYb2feI', '2021-04-21 13:10:09.066382');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `barage_aelhanssalibilanhydr`
--
ALTER TABLE `barage_aelhanssalibilanhydr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_aelhanssalifornitures`
--
ALTER TABLE `barage_aelhanssalifornitures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_aitmessaoudbilanhydr`
--
ALTER TABLE `barage_aitmessaoudbilanhydr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_aitmessaoudfornitures`
--
ALTER TABLE `barage_aitmessaoudfornitures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_apportmbinouidane`
--
ALTER TABLE `barage_apportmbinouidane`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_apportmcomplexhansalimassira`
--
ALTER TABLE `barage_apportmcomplexhansalimassira`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_apportmhassanprem`
--
ALTER TABLE `barage_apportmhassanprem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_apportmmoulayyoussef`
--
ALTER TABLE `barage_apportmmoulayyoussef`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_barageuploaded`
--
ALTER TABLE `barage_barageuploaded`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_barrages`
--
ALTER TABLE `barage_barrages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_binouidanebilanhydr`
--
ALTER TABLE `barage_binouidanebilanhydr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_binouidanefornitures`
--
ALTER TABLE `barage_binouidanefornitures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_daouratefornitures`
--
ALTER TABLE `barage_daouratefornitures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_diguesafifornitures`
--
ALTER TABLE `barage_diguesafifornitures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_hassanprembilanhydr`
--
ALTER TABLE `barage_hassanprembilanhydr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_hassanpremfornitures`
--
ALTER TABLE `barage_hassanpremfornitures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_imfoutfornitures`
--
ALTER TABLE `barage_imfoutfornitures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_massirabilanhydr`
--
ALTER TABLE `barage_massirabilanhydr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_massirafornitures`
--
ALTER TABLE `barage_massirafornitures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_myyoussefbilanhydr`
--
ALTER TABLE `barage_myyoussefbilanhydr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_myyousseffornitures`
--
ALTER TABLE `barage_myyousseffornitures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_sididaouifornitures`
--
ALTER TABLE `barage_sididaouifornitures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_sididrissbilanhydr`
--
ALTER TABLE `barage_sididrissbilanhydr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_sididrissfornitures`
--
ALTER TABLE `barage_sididrissfornitures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_ssmaachoufornitures`
--
ALTER TABLE `barage_ssmaachoufornitures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barage_varapport`
--
ALTER TABLE `barage_varapport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barage_aelhanssalibilanhydr`
--
ALTER TABLE `barage_aelhanssalibilanhydr`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barage_aelhanssalifornitures`
--
ALTER TABLE `barage_aelhanssalifornitures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barage_aitmessaoudbilanhydr`
--
ALTER TABLE `barage_aitmessaoudbilanhydr`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barage_aitmessaoudfornitures`
--
ALTER TABLE `barage_aitmessaoudfornitures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barage_apportmbinouidane`
--
ALTER TABLE `barage_apportmbinouidane`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `barage_apportmcomplexhansalimassira`
--
ALTER TABLE `barage_apportmcomplexhansalimassira`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `barage_apportmhassanprem`
--
ALTER TABLE `barage_apportmhassanprem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `barage_apportmmoulayyoussef`
--
ALTER TABLE `barage_apportmmoulayyoussef`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `barage_barageuploaded`
--
ALTER TABLE `barage_barageuploaded`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `barage_barrages`
--
ALTER TABLE `barage_barrages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `barage_binouidanebilanhydr`
--
ALTER TABLE `barage_binouidanebilanhydr`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=399;

--
-- AUTO_INCREMENT for table `barage_binouidanefornitures`
--
ALTER TABLE `barage_binouidanefornitures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `barage_daouratefornitures`
--
ALTER TABLE `barage_daouratefornitures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barage_diguesafifornitures`
--
ALTER TABLE `barage_diguesafifornitures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barage_hassanprembilanhydr`
--
ALTER TABLE `barage_hassanprembilanhydr`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `barage_hassanpremfornitures`
--
ALTER TABLE `barage_hassanpremfornitures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `barage_imfoutfornitures`
--
ALTER TABLE `barage_imfoutfornitures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barage_massirabilanhydr`
--
ALTER TABLE `barage_massirabilanhydr`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barage_massirafornitures`
--
ALTER TABLE `barage_massirafornitures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barage_myyoussefbilanhydr`
--
ALTER TABLE `barage_myyoussefbilanhydr`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barage_myyousseffornitures`
--
ALTER TABLE `barage_myyousseffornitures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barage_sididaouifornitures`
--
ALTER TABLE `barage_sididaouifornitures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barage_sididrissbilanhydr`
--
ALTER TABLE `barage_sididrissbilanhydr`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `barage_sididrissfornitures`
--
ALTER TABLE `barage_sididrissfornitures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `barage_ssmaachoufornitures`
--
ALTER TABLE `barage_ssmaachoufornitures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barage_varapport`
--
ALTER TABLE `barage_varapport`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
