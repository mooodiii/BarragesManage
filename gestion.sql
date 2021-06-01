-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2021 at 07:32 PM
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

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(128, 'Can view barage uploaded', 32, 'view_barageuploaded'),
(129, 'Can add suivi bilan', 33, 'add_suivibilan'),
(130, 'Can change suivi bilan', 33, 'change_suivibilan'),
(131, 'Can delete suivi bilan', 33, 'delete_suivibilan'),
(132, 'Can view suivi bilan', 33, 'view_suivibilan'),
(133, 'Can add transfert massira', 34, 'add_transfertmassira'),
(134, 'Can change transfert massira', 34, 'change_transfertmassira'),
(135, 'Can delete transfert massira', 34, 'delete_transfertmassira'),
(136, 'Can view transfert massira', 34, 'view_transfertmassira'),
(137, 'Can add timinoutine bilan hydr', 35, 'add_timinoutinebilanhydr'),
(138, 'Can change timinoutine bilan hydr', 35, 'change_timinoutinebilanhydr'),
(139, 'Can delete timinoutine bilan hydr', 35, 'delete_timinoutinebilanhydr'),
(140, 'Can view timinoutine bilan hydr', 35, 'view_timinoutinebilanhydr');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$AF6lliPy81BMbrkin8zo6M$+z5W2g5TjBv5yeevYu7NKAgQITU+RmjI1ye0ALm4qrQ=', '2021-05-26 13:37:39.784006', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2021-04-04 19:25:49.240296'),
(2, 'pbkdf2_sha256$260000$Q07yIPcWp6FhOA6JQydGsp$FPcFpGMtl35Vu20OhMTBMy1DQ/pAnhNFNKZir5GNXPk=', '2021-05-26 09:40:19.734552', 0, 'moodii', 'Ahmed', 'Mouaden', 'midokanta.23@outlook.com', 1, 1, '2021-04-12 14:51:10.000000'),
(3, 'pbkdf2_sha256$260000$TMRV3TV6QLX6qIpgdyQVrY$pheQjibk0d7iC3l/IuBA2Rvw6tQdGpuKrTbslfXlU2c=', NULL, 0, 'fati', '', '', '', 0, 1, '2021-05-26 14:01:18.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barage_aelhanssalibilanhydr`
--

CREATE TABLE IF NOT EXISTS `barage_aelhanssalibilanhydr` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `vDesverse` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_aelhanssalibilanhydr`
--

INSERT INTO `barage_aelhanssalibilanhydr` (`id`, `annee`, `mois`, `jour`, `cote`, `reserve`, `varReserve`, `evaporation`, `fuite`, `total`, `appVolume`, `appDebit`, `volumeTurbine`, `vsd`, `vsg`, `vDesverse`) VALUES
(262, 2021, 3, 1, 651.66, 207.878, 1.954000000000008, 0.0643412, 0, 0, 2.018341200000008, 23.36043055555565, 0, 0, 0, 0),
(263, 2021, 3, 2, 651.83, 209.832, 1.269000000000005, 0.03140104000000001, 0, 0, 1.300401040000005, 15.05093796296303, 0, 0, 0, 0),
(264, 2021, 3, 3, 651.94, 211.101, 1.275000000000006, 0.04356524000000001, 0, 0, 1.318565240000006, 15.26117175925932, 0, 0, 0, 0),
(265, 2021, 3, 4, 652.05, 212.376, 1.395999999999987, 0.13116948, 0, 0, 1.527169479999987, 17.67557268518503, 0, 0, 0, 0),
(266, 2021, 3, 5, 652.17, 213.772, 3.746000000000009, 0.2622704000000001, 0, 0, 4.00827040000001, 46.39201851851863, 0, 0, 0, 0),
(267, 2021, 3, 6, 652.49, 217.518, 4.617999999999995, 0.11555352, 0, 0, 4.733553519999995, 54.78649907407402, 0, 0, 0, 0),
(268, 2021, 3, 7, 652.88, 222.136, 5.640000000000015, 0.08736728, 0, 0, 5.727367280000014, 66.28897314814832, 0, 0, 0, 0),
(269, 2021, 3, 8, 653.35, 227.776, 6.093999999999994, 0.09459051999999998, 0, 0, 6.188590519999994, 71.62720509259252, 0, 0, 0, 0),
(270, 2021, 3, 9, 653.85, 233.87, 3.085999999999984, 0.0266598, 0, 0, 3.112659799999984, 36.02615509259241, 0, 0, 0, 0),
(271, 2021, 3, 10, 654.1, 236.956, 2.113, 0.049738, 0, 0, 2.162738, 25.03168981481481, 0, 0, 0, 0),
(272, 2021, 3, 11, 654.27, 239.069, 1.751000000000005, 0.05101632000000001, 0, 0, 1.802016320000005, 20.85667037037042, 0, 0, 0, 0),
(273, 2021, 3, 12, 654.41, 240.82, 1.63300000000001, 0.05226624000000001, 0, 0, 1.68526624000001, 19.50539629629641, 0, 0, 0, 0),
(274, 2021, 3, 13, 654.54, 242.453, 1.388000000000005, 0.04340248000000001, 0, 0, 1.431402480000005, 16.56715833333339, 0, 0, 0, 0),
(275, 2021, 3, 14, 654.65, 243.841, 1.393000000000001, 0.0526864, 0, 0, 1.445686400000001, 16.73248148148149, 0, 0, 0, 0),
(276, 2021, 3, 15, 654.76, 245.234, 1.399000000000001, 0.05288608000000001, 0, 0, 1.451886080000001, 16.80423703703705, 0, 0, 0, 0),
(277, 2021, 3, 16, 654.87, 246.633, 1.402999999999992, 0.05819016, 0, 0, 1.461190159999992, 16.91192314814805, 0, 0, 0, 0),
(278, 2021, 3, 17, 654.98, 248.036, 0.6399999999999864, 0.06448176000000001, 0, 0.51, 1.214481759999986, 14.0565018518517, 0.51, 0, 0, 0),
(279, 2021, 3, 18, 655.03, 248.676, 1.282000000000011, 0.04307184000000001, 0, 0, 1.325071840000011, 15.33647962962976, 0, 0, 0, 0),
(280, 2021, 3, 19, 655.13, 249.958, 1.027999999999992, 0.03803156000000001, 0, 0, 1.066031559999992, 12.33832824074064, 0, 0, 0, 0),
(281, 2021, 3, 20, 655.21, 250.986, 2.320999999999998, 0.1702272, 0, 0, 2.491227199999998, 28.83364814814813, 0, 0, 0, 0),
(282, 2021, 3, 21, 655.39, 253.307, 1.814000000000021, 0.06116412000000001, 0, 0.66, 2.535164120000021, 29.34217731481506, 0.66, 0, 0, 0),
(283, 2021, 3, 22, 655.53, 255.121, 1.431000000000012, 0.052046, 0, 0, 1.483046000000012, 17.1648842592594, 0, 0, 0, 0),
(284, 2021, 3, 23, 655.64, 256.552, 1.305999999999983, 0.06268560000000001, 0, 0, 1.368685599999983, 15.84126851851832, 0, 0, 0, 0),
(285, 2021, 3, 24, 655.74, 257.858, 1.048999999999978, 0.062892, 0, 0, 1.111891999999978, 12.86912037037012, 0, 0, 0, 0),
(286, 2021, 3, 25, 655.82, 258.907, 0.3930000000000291, 0.06407196000000001, 0, 0.33, 0.7870719600000291, 9.109629166667004, 0.33, 0, 0, 0),
(287, 2021, 3, 26, 655.85, 259.3, 0.2629999999999768, 0.06518432000000002, 0, 1.11, 1.438184319999977, 16.64565185185158, 1.11, 0, 0, 0),
(288, 2021, 3, 27, 655.87, 259.563, 1.317999999999984, 0.07693324, 0, 0, 1.394933239999984, 16.14506064814796, 0, 0, 0, 0),
(289, 2021, 3, 28, 655.97, 260.881, 1.190000000000055, 0.08043536, 0, 0, 1.270435360000055, 14.7041129629636, 0, 0, 0, 0),
(290, 2021, 3, 29, 656.06, 262.071, 0.7969999999999686, 0.07861760000000002, 0, 0, 0.8756175999999687, 10.1344629629626, 0, 0, 0, 0),
(291, 2021, 3, 30, 656.12, 262.868, 0.5330000000000155, 0.09906360000000002, 0, 4.8, 5.432063600000015, 62.87110648148166, 4.8, 0, 0, 0),
(292, 2021, 3, 31, 656.16, 263.401, -0.6659999999999968, 0.15397632, 0, 2, 1.487976320000003, 17.22194814814818, 2, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barage_aelhanssalifornitures`
--

CREATE TABLE IF NOT EXISTS `barage_aelhanssalifornitures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `vidPdev` double NOT NULL,
  `TransfertMassira` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL,
  `aport` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_aelhanssalifornitures`
--

INSERT INTO `barage_aelhanssalifornitures` (`id`, `periode`, `turbinage`, `vidPdev`, `TransfertMassira`, `month`, `year`, `aport`) VALUES
(1, '2020-2021', 0, 34.19, 12, 'Sep', 2020, 0),
(2, '2020-2021', 0, 11.94, 4.9, 'Oct', 2020, 0),
(3, '2020-2021', 0, 26.41, 9, 'Nov', 2020, 0),
(4, '2020-2021', 0, 14.38, 7.1, 'Dec', 2020, 0),
(5, '2020-2021', 2.21, 0, 0, 'Jan', 2021, 0),
(11, '2020-2021', 9.4, 0, 7.5, 'Mar', 2021, 66.65698664000003);

-- --------------------------------------------------------

--
-- Table structure for table `barage_aitmessaoudbilanhydr`
--

CREATE TABLE IF NOT EXISTS `barage_aitmessaoudbilanhydr` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `pluie` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_aitmessaoudbilanhydr`
--

INSERT INTO `barage_aitmessaoudbilanhydr` (`id`, `annee`, `mois`, `jour`, `cote`, `reserve`, `varReserve`, `evaporation`, `fuite`, `total`, `appVolume`, `appDebit`, `tauxRemplissage`, `volumeTurbine`, `vVidange`, `vEvacue`, `pluie`) VALUES
(181, 2021, 2, 1, 494.96, 10.652, -0.2829999999999995, 0.001585, 0.0000251136, 0.1296, -0.1517898863999995, -1.756827388888883, 74.82964524060414, 0, 0.1296, 0, 0),
(182, 2021, 2, 2, 494.78, 10.369, -0.3070000000000004, 0.002591, 0.0000247104, 0.1296, -0.1747842896000004, -2.022966314814819, 72.84158763610819, 0, 0.1296, 0, 0),
(183, 2021, 2, 3, 494.58, 10.062, 0.8770000000000007, 0.001754, 0.0000245088, 0.1296, 1.008378508800001, 11.67104755555556, 70.68493150684931, 0, 0.1296, 0, 0),
(184, 2021, 2, 4, 495.14, 10.939, 0.9629999999999992, 0.001727, 0.0000258192, 0.1296, 1.094352819199999, 12.66612059259258, 76.84580259922727, 0, 0.1296, 0, 0),
(185, 2021, 2, 5, 495.72, 11.902, -0.06799999999999962, 0.001637, 0.0000268848, 0.1296, 0.06326388480000038, 0.7322208888888933, 83.61081840533895, 0, 0.1296, 0, 6.8),
(186, 2021, 2, 6, 495.68, 11.834, -0.1859999999999999, 0.001084, 0.0000268231, 0.1296, -0.05528917689999996, -0.6399210289351848, 83.13312258517738, 0, 0.1296, 0, 16.8),
(187, 2021, 2, 7, 495.57, 11.648, -0.1679999999999993, 0.001743, 0.0000267124, 0.1296, -0.03663028759999928, -0.4239616620370287, 81.82648401826484, 0, 0.1296, 0, 0.3),
(188, 2021, 2, 8, 495.47, 11.48, -0.1989999999999998, 0.00126, 0.0000266112, 0.1296, -0.06811338879999984, -0.7883494074074056, 80.64629434492448, 0, 0.1296, 0, 0),
(189, 2021, 2, 9, 495.35, 11.281, -0.1470000000000002, 0.001312, 0.0000256464, 0.1296, -0.01606235360000025, -0.1859068703703732, 79.24833157709871, 0, 0.1296, 0, 0),
(190, 2021, 2, 10, 495.26, 11.134, -0.2750000000000004, 0.001294, 0.00002555888, 0.1296, -0.1440804411200003, -1.667597698148152, 78.2156656129259, 0, 0.1296, 0, 0),
(191, 2021, 2, 11, 495.09, 10.859, -0.2710000000000008, 0.001526, 0.000025056, 0.1296, -0.1398489440000008, -1.618622037037046, 76.28380751668423, 0, 0.1296, 0, 0),
(192, 2021, 2, 12, 494.92, 10.588, -0.234, 0.001751, 0.00002484, 0.1296, -0.10262416, -1.187779629629629, 74.38004917456972, 0, 0.1296, 0, 0),
(193, 2021, 2, 13, 494.77, 10.354, -0.2459999999999987, 0.001476, 0.00002448, 0.1296, -0.1148995199999987, -1.32985555555554, 72.73621355813135, 0, 0.1296, 0, 0),
(194, 2021, 2, 14, 494.61, 10.108, -0.2720000000000002, 0.001933, 0.0000240768, 0.1296, -0.1404429232000002, -1.625496796296299, 71.00807867931157, 0, 0.1296, 0, 0),
(195, 2021, 2, 15, 494.43, 9.836, -0.266, 0.001895, 0.0000236448, 0.1296, -0.1344813552, -1.556497166666667, 69.09729539866527, 0, 0.1296, 0, 0),
(196, 2021, 2, 16, 494.25, 9.57, -0.2620000000000005, 0.00151, 0.0000233424, 0.1296, -0.1308666576000004, -1.514660388888894, 67.22866174920969, 0, 0.1296, 0, 0),
(197, 2021, 2, 17, 494.07, 9.308, -0.2699999999999996, 0.001593, 0.00002304, 0.1296, -0.1387839599999996, -1.606295833333329, 65.38812785388127, 0, 0.1296, 0, 0),
(198, 2021, 2, 18, 493.88, 9.038, 0.4589999999999996, 0.00149, 0.0000231552, 0.1296, 0.5901131551999996, 6.830013370370366, 63.49139445029856, 0, 0.1296, 0, 0),
(199, 2021, 2, 19, 494.2, 9.497, 1.949999999999999, 0.001748, 0.0000246816, 0.1296, 2.0813726816, 24.08996159259259, 66.71584123638918, 0, 0.1296, 0, 0),
(200, 2021, 2, 20, 495.45, 11.447, 0.6440000000000001, 0.002307, 0.0000255123, 0.1296, 0.7759325123, 8.980700373842593, 80.41447137337548, 0, 0.1296, 0, 0),
(201, 2021, 2, 21, 495.83, 12.091, -0.1719999999999988, 0.002063, 0.000025623, 0.1296, -0.04031137699999882, -0.4665668634259122, 84.93853178784686, 0, 0.1296, 0, 21.3),
(202, 2021, 2, 22, 495.73, 11.919, -0.01700000000000124, 0.001642, 0.0000261504, 0.1296, 0.1142681503999988, 1.322548037037023, 83.73024236037935, 0, 0.1296, 0, 0),
(203, 2021, 2, 23, 495.72, 11.902, -0.2199999999999989, 0.002309, 0.0000261216, 0.1296, -0.08806487839999885, -1.019269425925913, 83.61081840533895, 0, 0.1296, 0, 0),
(204, 2021, 2, 24, 495.59, 11.682, 1.331999999999999, 0.003086, 0.0000278784, 0.1296, 1.464713878399999, 16.95270692592591, 82.06533192834563, 0, 0.1296, 0, 0),
(205, 2021, 2, 25, 496.35, 13.014, -0.2349999999999994, 0.002315, 0.0000283104, 0.1296, -0.1030566895999994, -1.192785759259253, 91.42255005268703, 0, 0.1296, 0, 0),
(206, 2021, 2, 26, 496.22, 12.779, -0.2680000000000007, 0.001855, 0.0000281952, 0.1296, -0.1365168048000007, -1.580055611111119, 89.7716894977169, 0, 0.1296, 0, 0.9),
(207, 2021, 2, 27, 496.07, 12.511, -0.2459999999999987, 0.001687, 0.0000281232, 0.1296, -0.1146848767999987, -1.327371259259244, 87.88900597119775, 0, 0.1296, 0, 0.2),
(208, 2021, 2, 28, 495.93, 12.265, -0.2599999999999998, 0.001386, 0.000027936, 0.1296, -0.1289860639999998, -1.492894259259257, 86.16087109237795, 0, 0.1296, 0, 2),
(209, 2021, 3, 1, 495.78, 12.005, -0.2390000000000008, 0.001503, 0.0000260496, 0.1296, -0.1078709504000008, -1.248506370370379, 84.33438707411311, 0, 0.1296, 0, 3.1),
(210, 2021, 3, 2, 495.64, 11.766, -0.1850000000000005, 0.003103, 0.0000258336, 0.1296, -0.05227116640000051, -0.6049903518518578, 82.6554267650158, 0, 0.1296, 0, 0),
(211, 2021, 3, 3, 495.53, 11.581, -0.234, 0.002665, 0.000025704, 0.1296, -0.101709296, -1.177190925925926, 81.35581313663505, 0, 0.1296, 0, 0),
(212, 2021, 3, 4, 495.39, 11.347, -0.2619999999999987, 0.001181, 0.0000255168, 0.1296, -0.1311934831999987, -1.518443092592577, 79.71197752019671, 0, 0.1296, 0, 4.9),
(213, 2021, 3, 5, 495.23, 11.085, -0.2420000000000009, 0.001163, 0.0000249552, 0.1296, -0.1112120448000009, -1.287176444444455, 77.87144362486829, 0, 0.1296, 0, 25.2),
(214, 2021, 3, 6, 495.08, 10.843, 1.008000000000001, 0.000529, 0.000025056, 0.1296, 1.138154056000001, 13.17307935185186, 76.17140850017563, 0, 0.1296, 0, 5.8),
(215, 2021, 3, 7, 495.69, 11.851, 0.4139999999999997, 0.001931, 0.0000258912, 0.1296, 0.5455568911999997, 6.314315870370367, 83.25254654021779, 0, 0.1296, 0, 5.5),
(216, 2021, 3, 8, 495.93, 12.265, 0.6579999999999995, 0.001422, 0.0000270576, 0.1296, 0.7890490575999995, 9.132512240740736, 86.16087109237795, 0, 0.1296, 0, 5.2),
(217, 2021, 3, 9, 496.3, 12.923, 0.0909999999999993, 0.002023, 0.0000273168, 0.1296, 0.2226503167999993, 2.576971259259251, 90.78328064629434, 0, 0.1296, 0, 0.1),
(218, 2021, 3, 10, 496.35, 13.014, -0.03699999999999903, 0.002909, 0.0000281232, 0.1296, 0.09553712320000096, 1.105753740740752, 91.42255005268703, 0, 0.1296, 0, 0),
(219, 2021, 3, 11, 496.33, 12.977, -0.1259999999999994, 0.002606, 0.000028512, 0.1296, 0.006234512000000539, 0.07215870370370994, 91.1626273270109, 0, 0.1296, 0, 0),
(220, 2021, 3, 12, 496.26, 12.851, -0.1620000000000008, 0.003448, 0.0000281088, 0.1296, -0.0289238912000008, -0.3347672592592685, 90.27748507200563, 0, 0.1296, 0, 0),
(221, 2021, 3, 13, 496.17, 12.689, -0.1780000000000008, 0.003273, 0.0000276123, 0.1296, -0.04509938770000083, -0.5219836539351947, 89.13944502985599, 0, 0.1296, 0, 0),
(222, 2021, 3, 14, 496.07, 12.511, -0.1939999999999991, 0.003098, 0.0000273234, 0.1296, -0.06127467659999908, -0.7091976458333227, 87.88900597119775, 0, 0.1296, 0, 0),
(223, 2021, 3, 15, 495.96, 12.317, -0.1910000000000007, 0.002786, 0.0000268848, 0.1296, -0.05858711520000073, -0.6780916111111196, 86.52616789603091, 0, 0.1296, 0, 0),
(224, 2021, 3, 16, 495.85, 12.126, -0.2409999999999997, 0.003576, 0.00002628, 0.1296, -0.1077977199999997, -1.247658796296293, 85.18440463645943, 0, 0.1296, 0, 0),
(225, 2021, 3, 17, 495.71, 11.885, -0.2029999999999994, 0.004073, 0.0000258768, 0.1296, -0.06930112319999943, -0.8020963333333266, 83.49139445029856, 0, 0.1296, 0, 0),
(226, 2021, 3, 18, 495.59, 11.682, 0.1859999999999999, 0.002172, 0.0000257472, 0.1296, 0.3177977472, 3.678214666666666, 82.06533192834563, 0, 0.1296, 0, 0),
(227, 2021, 3, 19, 495.7, 11.868, -0.2030000000000012, 0.002713, 0.0000255024, 0.1296, -0.0706614976000012, -0.8178414074074214, 83.37197049525817, 0, 0.1296, 0, 0),
(228, 2021, 3, 20, 495.58, 11.665, -0.05099999999999838, 0.001211, 0.0000254143, 0.1296, 0.0798364143000016, 0.9240325729166853, 81.94590797330524, 0, 0.1296, 0, 10.2),
(229, 2021, 3, 21, 195.55, 11.614, -0.0840000000000014, 0.002279, 0.0000251213, 0.1296, 0.04790412129999859, 0.5544458483796133, 81.58763610818406, 0, 0.1296, 0, 0),
(230, 2021, 3, 22, 495.5, 11.53, -0.2159999999999993, 0.003455, 0.0000248256, 0.1296, -0.0829201743999993, -0.9597242407407325, 80.99754127151388, 0, 0.1296, 0, 0),
(231, 2021, 3, 23, 495.37, 11.314, 0.3170000000000002, 0.003199, 0.0000248832, 0.1296, 0.4498238832000002, 5.206294944444446, 79.4801545486477, 0, 0.1296, 0, 0),
(232, 2021, 3, 24, 495.56, 11.631, -0.234, 0.003439, 0.0000247968, 0.1296, -0.1009362032, -1.168243092592592, 81.70706006322445, 0, 0.1296, 0, 0),
(233, 2021, 3, 25, 495.42, 11.397, 0.03299999999999947, 0.003944, 0.0000244944, 0.1296, 0.1665684943999995, 1.927876092592586, 80.0632244467861, 0, 0.1296, 0, 0),
(234, 2021, 3, 26, 495.44, 11.43, 0.9580000000000002, 0.004378, 0.0000256464, 0.1296, 1.0920036464, 12.63893109259259, 80.29504741833509, 0, 0.1296, 0, 0),
(235, 2021, 3, 27, 496, 12.388, 0.463000000000001, 0.003277, 0.0000266832, 0.1296, 0.5959036832000009, 6.897033370370381, 87.02493853178785, 0, 0.1296, 0, 0),
(236, 2021, 3, 28, 496.26, 12.851, -0.2510000000000012, 0.004013, 0.000026784, 0.1296, -0.1173602160000012, -1.358335833333348, 90.27748507200563, 0, 0.1296, 0, 0),
(237, 2021, 3, 29, 496.12, 12.6, -0.2479999999999993, 0.00424, 0.0000265104, 0.1296, -0.1141334895999993, -1.320989462962955, 88.51422550052688, 0, 0.1296, 0, 0),
(238, 2021, 3, 30, 495.98, 12.352, -0.3979999999999997, 0.004994, 0.0000260352, 0.5286, 0.1356200352000003, 1.569676333333337, 86.77204074464349, 0.288, 0.2406, 0, 0),
(239, 2021, 3, 31, 495.75, 11.954, -0.4900000000000002, 0.005136, 0.0000249696, 2.136, 1.6511609696, 19.11065937037037, 83.97611520899193, 1.728, 0.408, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barage_aitmessaoudfornitures`
--

CREATE TABLE IF NOT EXISTS `barage_aitmessaoudfornitures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `irrigation` double NOT NULL,
  `aepi` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_aitmessaoudfornitures`
--

INSERT INTO `barage_aitmessaoudfornitures` (`id`, `periode`, `turbinage`, `irrigation`, `aepi`, `vidPdev`, `month`, `year`) VALUES
(1, '2020-2021', 14, 7, 4.9, 7.94, 'Sep', 2020),
(2, '2020-2021', 0, 0, 4.7, 7.05, 'Oct', 2020),
(3, '2020-2021', 18.7, 8, 4.1, 2.12, 'Nov', 2020),
(4, '2020-2021', 9.5, 0, 4.4, 3.04, 'Dec', 2020),
(5, '2020-2021', 0, 0, 4.4, 4.02, 'Jan', 2021),
(9, '2020-2021', 0, 0, 0, 3.6, 'Feb', 2021),
(10, '2020-2021', 0, 0, 0, 4.4, 'Mar', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_apportmbinouidane`
--

CREATE TABLE IF NOT EXISTS `barage_apportmbinouidane` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `aug` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

CREATE TABLE IF NOT EXISTS `barage_apportmcomplexhansalimassira` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `aug` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

CREATE TABLE IF NOT EXISTS `barage_apportmhassanprem` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `aug` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

CREATE TABLE IF NOT EXISTS `barage_apportmmoulayyoussef` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `aug` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

CREATE TABLE IF NOT EXISTS `barage_barageuploaded` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_barageuploaded`
--

INSERT INTO `barage_barageuploaded` (`id`, `name`, `month`, `year`) VALUES
(83, 'hansali', 3, 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_barrages`
--

CREATE TABLE IF NOT EXISTS `barage_barrages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

CREATE TABLE IF NOT EXISTS `barage_binouidanebilanhydr` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `volumeLache` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=876 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_binouidanebilanhydr`
--

INSERT INTO `barage_binouidanebilanhydr` (`id`, `annee`, `mois`, `jour`, `cote`, `reserve`, `varReserve`, `evaporation`, `fuite`, `total`, `appVolume`, `appDebit`, `volumeTurbine`, `evc`, `vf`, `volumeLache`) VALUES
(699, 2021, 1, 1, 769.63, 239.88295375151662, 0.14095375151663347, 0.028, 0.04, 0.364, 0.575424, 6.66, 0.364, 0, 0, 0.173),
(700, 2021, 1, 2, 769.64, 240.02348914719985, 0.14053539568323004, 0.028, 0.04, 0, 0.21168000000000003, 2.45, 0, 0, 0, 0.173),
(701, 2021, 1, 3, 769.67, 240.44535068065105, 0.42186153345119237, 0.028, 0.04, 0, 0.500256, 5.79, 0, 0, 0, 0.173),
(702, 2021, 1, 4, 769.69, 240.72680409461745, 0.28145341396640333, 0.028, 0.04, 0.167, 0.5201279999999999, 6.02, 0.167, 0, 0, 0.173),
(703, 2021, 1, 5, 769.723, 241.14930200906707, 0.4224979144496217, 0.028, 0.04, 0, 0.50112, 5.8, 0, 0, 0, 0.173),
(704, 2021, 1, 6, 769.77, 241.8543100024847, 0.7050079934176381, 0.028, 0.04, 0, 0.776736, 8.99, 0, 0, 0, 0.173),
(705, 2021, 1, 7, 769.78, 241.99543796426792, 0.14112796178321219, 0.028, 0.04, 0, 0.714528, 8.27, 0, 0, 0, 0.173),
(706, 2021, 1, 8, 769.8, 242.2778199333327, 0.2823819690647724, 0.028, 0.04, 0, 0.35423999999999994, 4.1, 0, 0, 0, 0.1368),
(707, 2021, 1, 9, 769.98, 244.82677036293362, 2.5489504296009216, 0.028, 0.04, 0, 2.627424, 30.41, 0, 0, 0, 0),
(708, 2021, 1, 10, 770.23, 248.38869325366696, 3.5619228907333422, 0.028, 0.04, 0, 3.633984, 42.06, 0, 0, 0, 0),
(709, 2021, 1, 11, 770.47, 251.83123894966707, 3.44254569600011, 0.029, 0.04, 0.327, 3.841344, 44.46, 0.327, 0, 0, 0),
(710, 2021, 1, 12, 770.69, 255.00673327900083, 3.175494329333759, 0.028, 0.04, 0, 3.2477760000000004, 37.59, 0, 0, 0, 0),
(711, 2021, 1, 13, 770.76, 256.02108790933323, 1.0143546303324058, 0.028, 0.04, 0, 0.94176, 10.9, 0, 0, 0, 0),
(712, 2021, 1, 14, 770.77, 256.16615200966805, 0.14506410033482098, 0.028, 0.04, 0, 0.21686399999999997, 2.51, 0, 0, 0, 0),
(713, 2021, 1, 15, 770.8, 256.601578666666, 0.43542665699794725, 0.029, 0.04, 0.007, 0.514944, 5.96, 0.007, 0, 0, 0),
(714, 2021, 1, 16, 770.83, 257.03735677366564, 0.43577810699963493, 0.029, 0.04, 0, 0.508032, 5.88, 0, 0, 0, 0),
(715, 2021, 1, 17, 770.93, 258.4924873269993, 1.4551305533336745, 0.029, 0.04, 0, 1.527552, 17.68, 0, 0, 0, 0),
(716, 2021, 1, 18, 771.03, 259.951514042083, 1.4590267150836667, 0.029, 0.04, 0, 1.538784, 17.81, 0, 0, 0, 0),
(717, 2021, 1, 19, 771.11, 261.1215008787502, 1.169986836667249, 0.029, 0.04, 0, 1.242432, 14.38, 0, 0, 0, 0),
(718, 2021, 1, 20, 771.16, 261.8539864266662, 0.7324855479159851, 0.029, 0.04, 0, 0.81216, 9.4, 0, 0, 0, 0),
(719, 2021, 1, 21, 771.23, 262.88107703375033, 1.0270906070841193, 0.029, 0.04, 0, 1.099872, 12.73, 0, 0, 0, 0),
(720, 2021, 1, 22, 771.28, 263.615865906668, 0.7347888729176475, 0.029, 0.04, 0, 0.814752, 9.43, 0, 0, 0, 0),
(721, 2021, 1, 23, 771.43, 265.82601302541593, 2.2101471187479547, 0.029, 0.04, 0, 2.282688, 26.42, 0, 0, 0, 0),
(722, 2021, 1, 24, 771.53, 267.3042771462496, 1.4782641208336713, 0.03, 0.04, 0, 1.557792, 18.03, 0, 0, 0, 0),
(723, 2021, 1, 25, 771.65, 269.0833177812497, 1.779040635000115, 0.03, 0.04, 0, 1.851552, 21.43, 0, 0, 0, 0),
(724, 2021, 1, 26, 771.8, 271.31500999999935, 2.231692218749629, 0.03, 0.04, 0, 2.312064, 26.76, 0, 0, 0, 0),
(725, 2021, 1, 27, 771.91, 272.9571796454162, 1.6421696454168568, 0.03, 0.04, 0, 1.7150400000000003, 19.85, 0, 0, 0, 0),
(726, 2021, 1, 28, 772.05, 275.054091754166, 2.096912108749791, 0.03, 0.04, 0, 2.17728, 25.2, 0, 0, 0, 0),
(727, 2021, 1, 29, 772.16, 276.7070999098662, 1.6530081557002063, 0.03, 0.04, 0, 1.726272, 19.98, 0, 0, 0, 0),
(728, 2021, 1, 30, 772.28, 278.515856905068, 1.8087569952018043, 0.03, 0.04, 0, 1.888704, 21.86, 0, 0, 0, 0),
(729, 2021, 1, 31, 772.4, 280.33034446666636, 1.8144875615983551, 0.03, 0.04, 0, 1.8878400000000002, 21.85, 0, 0, 0, 0),
(817, 2021, 2, 1, 772.55, 282.60653937916595, 2.276194912499591, 0.04, 0.04, 0, 2.37168, 27.45, 0, 0, 0, 0),
(818, 2021, 2, 2, 772.64, 283.97658179146646, 1.3700424123005064, 0.04, 0.04, 0, 1.459296, 16.89, 0, 0, 0, 0),
(819, 2021, 2, 3, 772.72, 285.19712810826707, 1.2205463168006077, 0.04, 0.04, 0, 1.692576, 19.59, 0, 0, 0, 0),
(820, 2021, 2, 4, 772.82, 286.72643361226574, 1.5293055039986712, 0.04, 0.04, 0, 1.618272, 18.73, 0, 0, 0, 0),
(821, 2021, 2, 5, 772.9, 287.95278246666635, 1.2263488544006123, 0.05, 0.04, 0, 1.374624, 15.91, 0, 0, 0, 0),
(822, 2021, 2, 6, 772.99, 289.33551792996684, 1.3827354633004916, 0.05, 0.04, 0, 1.472256, 17.04, 0, 0, 0, 0),
(823, 2021, 2, 7, 773.11, 291.18431880725024, 1.848800877283395, 0.05, 0.04, 0, 1.937952, 22.43, 0, 0, 0, 0),
(824, 2021, 2, 8, 773.19, 292.4201566185842, 1.2358378113339654, 0.05, 0.04, 0, 1.332288, 15.42, 0, 0, 0, 0),
(825, 2021, 2, 9, 773.27, 293.65863388591816, 1.2384772673339626, 0.05, 0.04, 0.027, 1.354752, 15.68, 0.027, 0, 0, 0),
(826, 2021, 2, 10, 773.37, 295.21043713508345, 1.551803249165289, 0.05, 0.04, 0.007, 1.6485119999999998, 19.08, 0.007, 0, 0, 0),
(827, 2021, 2, 11, 773.45, 296.45484101041563, 1.244403875332182, 0.05, 0.04, 0, 1.334016, 15.44, 0, 0, 0, 0),
(828, 2021, 2, 12, 773.54, 297.8579372506661, 1.403096240250477, 0.05, 0.04, 0.007, 1.499904, 17.36, 0.007, 0, 0, 0),
(829, 2021, 2, 13, 773.62, 299.10792300800006, 1.2499857573339455, 0.05, 0.04, 0, 1.340064, 15.51, 0, 0, 0, 0),
(830, 2021, 2, 14, 773.72, 300.67409139466713, 1.5661683866670728, 0.05, 0.04, 0, 1.6632, 19.25, 0, 0, 0, 0),
(831, 2021, 2, 15, 773.8, 301.92997099999934, 1.2558796053322112, 0.05, 0.04, 0, 1.346112, 15.58, 0, 0, 0, 0),
(832, 2021, 2, 16, 773.9, 303.5034961666663, 1.5735251666669683, 0.05, 0.04, 0, 1.670976, 19.34, 0, 0, 0, 0),
(833, 2021, 2, 17, 774.01, 305.2390834960499, 1.735587329383577, 0.05, 0.04, 0.08, 1.592352, 18.43, 0.08, 0, 0, 0),
(834, 2021, 2, 18, 774.08, 306.34610184426725, 1.107018348217366, 0.05, 0.04, 0.235, 1.4325119999999998, 16.58, 0.235, 0, 0, 0),
(835, 2021, 2, 19, 774.13, 307.1380392718499, 0.7919374275826385, 0.05, 0.04, 0.315, 1.197504, 13.86, 0.315, 0, 0, 0),
(836, 2021, 2, 20, 774.18, 307.93098524693437, 0.7929459750844785, 0.05, 0.04, 0, 0.890784, 10.31, 0, 0, 0, 0),
(837, 2021, 2, 21, 774.24, 308.8838519285335, 0.9528666815991187, 0.05, 0.04, 0, 0.823, 12.08, 0, 0, 0, 0),
(838, 2021, 2, 22, 774.37, 310.95338077065, 2.06952884211654, 0.05, 0.04, 0, 2.167776, 25.09, 0, 0, 0, 0),
(839, 2021, 2, 23, 774.44, 312.0705683898657, 1.117187619215656, 0.05, 0.04, 0, 1.207872, 13.98, 0, 0, 0, 0),
(840, 2021, 2, 24, 774.52, 313.3497771983997, 1.2792088085340083, 0.05, 0.04, 0, 1.370304, 15.86, 0, 0, 0, 0),
(841, 2021, 2, 25, 774.6, 314.6315711333337, 1.2817939349340008, 0.05, 0.04, 0, 1.372896, 15.89, 0, 0, 0, 0),
(842, 2021, 2, 26, 774.68, 315.9159508602677, 1.2843797269339916, 0.05, 0.04, 0, 1.375488, 15.92, 0, 0, 0, 0),
(843, 2021, 2, 27, 774.76, 317.20291704479985, 1.2869661845321616, 0.05, 0.04, 0, 1.37808, 15.95, 0, 0, 0, 0),
(844, 2021, 2, 28, 774.86, 318.815262995465, 1.6123459506651443, 0.05, 0.04, 0, 1.703808, 19.72, 0, 0, 0, 0),
(845, 2021, 3, 1, 774.98, 320.75541590826697, 1.9401529128019774, 0.05, 0.04, 0, 2.032128, 23.52, 0, 0, 0, 0),
(846, 2021, 3, 2, 775.09, 322.53901172490043, 1.783595816633465, 0.05, 0.04, 0, 1.882656, 21.79, 0, 0, 0, 0),
(847, 2021, 3, 3, 775.23, 324.8161432160336, 2.2771314911331615, 0.05, 0.04, 0, 2.369088, 27.42, 0, 0, 0, 0),
(848, 2021, 3, 4, 775.38, 327.2647481765332, 2.4486049604996083, 0.05, 0.04, 0, 2.547936, 29.49, 0, 0, 0, 0),
(849, 2021, 3, 5, 775.54, 329.88664647839937, 2.6218983018661675, 0.05, 0.04, 0, 2.714688, 31.42, 0, 0, 0, 0),
(850, 2021, 3, 6, 775.74, 333.17860386773344, 3.2919573893340726, 0.05, 0.04, 0, 3.390336, 39.24, 0, 0, 0, 0),
(851, 2021, 3, 7, 776.08, 338.81207361973395, 5.633469752000508, 0.05, 0.04, 0, 5.726592, 66.28, 0, 0, 0, 0),
(852, 2021, 3, 8, 776.4, 344.1565477999996, 5.3444741802656495, 0.05, 0.04, 0, 5.438016, 62.94, 0, 0, 0, 0),
(853, 2021, 3, 9, 776.72, 349.5422615322671, 5.385713732267504, 0.05, 0.04, 0, 5.485536, 63.49, 0, 0, 0, 0),
(854, 2021, 3, 10, 777.04, 354.9695040751994, 5.427242542932277, 0.05, 0.04, 0, 5.52096, 63.9, 0, 0, 0, 0),
(855, 2021, 3, 11, 777.42, 361.4639870383993, 0, 0.05, 0.04, 0.146, 6.73488, 77.95, 0.146, 0, 0, 0),
(856, 2021, 3, 12, 777.74, 366.97756436320014, 5.513577324800849, 0.05, 0.04, 0, 5.614272, 64.98, 0, 0, 0, 0),
(857, 2021, 3, 13, 778.03, 372.0143622766995, 5.036797913499356, 0.05, 0.04, 0.252, 5.384448, 62.32, 0.252, 0, 0, 0),
(858, 2021, 3, 14, 778.36, 377.8011679375982, 5.786805660898722, 0.05, 0.04, 0, 5.882976, 68.09, 0, 0, 0, 0),
(859, 2021, 3, 15, 778.48, 379.92106836320033, 2.1199004256021112, 0.05, 0.04, 0.246, 2.4624, 28.5, 0.246, 0, 0, 0),
(860, 2021, 3, 16, 778.62, 382.4048870021334, 2.483818638933087, 0.05, 0.04, 0, 1.871424, 21.66, 0, 0, 0, 0),
(861, 2021, 3, 17, 778.81, 385.79415133609905, 3.3892643339656274, 0.05, 0.04, 0, 3.48624, 40.35, 0, 0, 0, 0),
(862, 2021, 3, 18, 779, 389.20470766666665, 3.4105563305676014, 0.05, 0.04, 0, 3.946752, 45.68, 0, 0, 0, 0),
(863, 2021, 3, 19, 779.17, 392.27481536545133, 3.070107698784682, 0.05, 0.04, 0.97, 4.137696, 47.89, 0.97, 0, 0, 0),
(864, 2021, 3, 20, 779.31, 394.81655025648234, 2.5417348910310125, 0.05, 0.04, 1.335, 3.9744, 46, 1.335, 0, 0, 0),
(865, 2021, 3, 21, 779.52, 398.65162828053303, 3.835078024050688, 0.05, 0.04, 0.866, 4.252608, 49.22, 0.866, 0, 0, 0),
(866, 2021, 3, 22, 779.64, 400.8550957029331, 2.203467422400081, 0.05, 0.04, 1.238, 3.539808, 40.97, 1.238, 0, 0, 0),
(867, 2021, 3, 23, 779.83, 404.3615696945486, 3.5064739916155077, 0.05, 0.04, 1.122, 4.726944, 54.71, 1.122, 0, 0, 0),
(868, 2021, 3, 24, 779.97, 406.9590035827838, 2.597433888235173, 0.05, 0.04, 1.091, 3.786912, 43.83, 1.091, 0, 0, 0),
(869, 2021, 3, 25, 780.1, 409.38117163333374, 2.422168050549942, 0.05, 0.04, 1.238, 3.761856, 43.54, 1.238, 0, 0, 0),
(870, 2021, 3, 26, 780.3, 413.1265104333325, 3.7453387999987626, 0.05, 0.04, 1.378, 5.22288, 60.45, 1.378, 0, 0, 0),
(871, 2021, 3, 27, 780.5, 416.89468683333337, 3.7681764000008684, 0.05, 0.04, 1.01, 4.878144, 56.46, 1.01, 0, 0, 0),
(872, 2021, 3, 28, 780.62, 419.1665107917334, 2.2718239584000344, 0.05, 0.04, 1.178, 3.5501760000000004, 41.09, 1.178, 0, 0, 0),
(873, 2021, 3, 29, 780.79, 422.3988921925348, 3.232381400801387, 0.05, 0.04, 0.842, 2.846016, 32.94, 0.842, 0, 0, 0),
(874, 2021, 3, 30, 780.86, 423.7346180301314, 1.3357258375966126, 0.05, 0.04, 1.371, 2.807136, 32.49, 1.371, 0, 0, 0),
(875, 2021, 3, 31, 780.99, 426.2225744205335, 2.4879563904020756, 0.05, 0.04, 1.034, 3.622752, 41.93, 1.034, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barage_binouidanefornitures`
--

CREATE TABLE IF NOT EXISTS `barage_binouidanefornitures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `turbinageAfourer` double NOT NULL,
  `irrigation` double NOT NULL,
  `aepiBm` double NOT NULL,
  `vidPdev` double NOT NULL,
  `TransfertMassira` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL,
  `aport` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_binouidanefornitures`
--

INSERT INTO `barage_binouidanefornitures` (`id`, `periode`, `turbinage`, `turbinageAfourer`, `irrigation`, `aepiBm`, `vidPdev`, `TransfertMassira`, `month`, `year`, `aport`) VALUES
(32, '2020-2021', 26, 18.9, 18.4, 0.9, 0, 3.1, 'Sep', 2020, 1),
(33, '2020-2021', 41.1, 31.2, 30.6, 0.8, 0, 6.4, 'Oct', 2020, 1),
(34, '2020-2021', 17, 11.7, 11.5, 0.7, 0, 3.3, 'Nov', 2020, 1),
(35, '2020-2021', 4.1, 0.3, 0, 0.6, 0, 2.8, 'Dec', 2020, 1),
(50, '2020-2021', 0.9, 0, 0, 0, 0, 0, 'Jan', 2021, 44.121024),
(54, '2020-2021', 0.7, 0, 0, 0, 0, 0.2, 'Feb', 2021, 41.62885599999999),
(55, '2020-2021', 15.3, 0, 0, 0, 0, 12.3, 'Mar', 2021, 123.59865600000002);

-- --------------------------------------------------------

--
-- Table structure for table `barage_daouratefornitures`
--

CREATE TABLE IF NOT EXISTS `barage_daouratefornitures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `aep` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_daouratefornitures`
--

INSERT INTO `barage_daouratefornitures` (`id`, `periode`, `turbinage`, `aep`, `vidPdev`, `month`, `year`) VALUES
(1, '2020-2021', 0, 12.1, 1.38, 'Sep', 2020),
(2, '2020-2021', 0, 12.3, 2.68, 'Oct', 2020),
(3, '2020-2021', 0, 11.4, 0.52, 'Nov', 2020),
(4, '2020-2021', 0, 11.7, 0.54, 'Dec', 2020),
(5, '2020-2021', 0, 11.8, 0.13, 'Jan', 2021),
(6, '2020-2021', 0, 10.5, 0, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_diguesafifornitures`
--

CREATE TABLE IF NOT EXISTS `barage_diguesafifornitures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `aep` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_diguesafifornitures`
--

INSERT INTO `barage_diguesafifornitures` (`id`, `periode`, `aep`, `vidPdev`, `month`, `year`) VALUES
(1, '2020-2021', 3, 0, 'Sep', 2020),
(2, '2020-2021', 3, 0, 'Oct', 2020),
(3, '2020-2021', 3, 0, 'Nov', 2020),
(4, '2020-2021', 3, 0, 'Dec', 2020),
(5, '2020-2021', 3, 0, 'Jan', 2021),
(6, '2020-2021', 3, 0, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_hassanprembilanhydr`
--

CREATE TABLE IF NOT EXISTS `barage_hassanprembilanhydr` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `eCrue` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barage_hassanpremfornitures`
--

CREATE TABLE IF NOT EXISTS `barage_hassanpremfornitures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `aepiAzDem` double NOT NULL,
  `vidPdev` double NOT NULL,
  `TransfertMassira` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL,
  `aport` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_hassanpremfornitures`
--

INSERT INTO `barage_hassanpremfornitures` (`id`, `periode`, `turbinage`, `aepiAzDem`, `vidPdev`, `TransfertMassira`, `month`, `year`, `aport`) VALUES
(4, '2020-2021', 9.3, 0.28, 0, 1.2, 'Sep', 2020, 0),
(5, '2020-2021', 6.6, 0.27, 0, 1, 'Oct', 2020, 0),
(6, '2020-2021', 6, 0.258, 0, 0.8, 'Nov', 2020, 0),
(7, '2020-2021', 2.1, 0.27, 0, 0, 'Dec', 2020, 0),
(8, '2020-2021', 1.6, 0.28, 0, 0, 'Jan', 2021, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barage_imfoutfornitures`
--

CREATE TABLE IF NOT EXISTS `barage_imfoutfornitures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `irrigation` double NOT NULL,
  `aepSidiBenourZemamra` double NOT NULL,
  `aepONEPDoukkala` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_imfoutfornitures`
--

INSERT INTO `barage_imfoutfornitures` (`id`, `periode`, `turbinage`, `irrigation`, `aepSidiBenourZemamra`, `aepONEPDoukkala`, `vidPdev`, `month`, `year`) VALUES
(1, '2020-2021', 24.2, 0, 0.3, 0.374, 0, 'Sep', 2020),
(2, '2020-2021', 18, 0, 0.3, 0.333, 0, 'Oct', 2020),
(3, '2020-2021', 17.1, 0, 0.3, 0.243, 0, 'Nov', 2020),
(4, '2020-2021', 16.4, 0, 0.3, 0.209, 0, 'Dec', 2020),
(5, '2020-2021', 13.4, 0, 0.3, 0.237, 0, 'Jan', 2021),
(6, '2020-2021', 14.3, 0, 0.3, 0.198, 0, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_massirabilanhydr`
--

CREATE TABLE IF NOT EXISTS `barage_massirabilanhydr` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `evacCrue` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_massirabilanhydr`
--

INSERT INTO `barage_massirabilanhydr` (`id`, `annee`, `mois`, `jour`, `cote`, `reserve`, `varReserve`, `evaporation`, `fuite`, `total`, `appVolume`, `appDebit`, `one`, `onep1`, `onpe2`, `vFond`, `evacCrue`) VALUES
(119, 2021, 2, 1, 256.38, 331.601, -1.059000000000026, 0.07, 0.005, 2.034148, 1.050147999999974, 12.15449074074044, 0, 0.00973, 0.024418, 2, 0),
(120, 2021, 2, 2, 256.35, 330.542, -0.7049999999999841, 0.084, 0.005, 1.029767, 0.413767000000016, 4.788969907407592, 0, 0.01068, 0.019087, 1, 0),
(121, 2021, 2, 3, 256.33, 329.837, -0.7040000000000077, 0.056, 0.005, 1.033492, 0.3904919999999924, 4.519583333333245, 0, 0.01144, 0.022052, 1, 0),
(122, 2021, 2, 4, 256.31, 329.133, -0.3499999999999659, 0.098, 0.005, 1.035418, 0.788418000000034, 9.125208333333727, 0, 0.01013, 0.025288, 1, 0),
(123, 2021, 2, 5, 256.3, 328.783, -0.7019999999999982, 0.092, 0.005, 2.031224, 1.426224000000002, 16.50722222222224, 0, 0.00974, 0.021484, 2, 0),
(124, 2021, 2, 6, 256.28, 328.081, 0.7019999999999982, 0.056, 0.005, 0.031256, 0.7942559999999982, 9.192777777777756, 0, 0.00935, 0.021906, 0, 0),
(125, 2021, 2, 7, 256.3, 328.783, 0.3499999999999659, 0.056, 0.005, 0.029493, 0.4404929999999659, 5.098298611110716, 0, 0.00925, 0.020243, 0, 0),
(126, 2021, 2, 8, 256.31, 329.133, -0.700999999999965, 0.07, 0.005, 2.031295, 1.405295000000035, 16.26498842592633, 0, 0.01055, 0.020745, 2, 0),
(127, 2021, 2, 9, 256.29, 328.432, -0.7019999999999982, 0.098, 0.005, 1.031546, 0.4325460000000019, 5.006319444444466, 0, 0.00944, 0.022106, 1, 0),
(128, 2021, 2, 10, 256.27, 327.73, 1.052999999999997, 0.084, 0.005, 1.014982, 2.156981999999998, 24.96506944444442, 0, 0.01008, 0.004902, 1, 0),
(129, 2021, 2, 11, 256.3, 328.783, -0.7019999999999982, 0.098, 0.005, 1.044756, 0.4457560000000018, 5.159212962962984, 0, 0.00976, 0.034996, 1, 0),
(130, 2021, 2, 12, 256.28, 328.081, -0.3509999999999991, 0.07, 0.005, 2.054893, 1.778893000000001, 20.58903935185186, 0, 0.01047, 0.044423, 2, 0),
(131, 2021, 2, 13, 256.27, 327.73, 0, 0.112, 0.005, 0.016494, 0.133494, 1.545069444444444, 0, 0.00985, 0.006644, 0, 0),
(132, 2021, 2, 14, 256.27, 327.73, 0.7019999999999982, 0.14, 0.005, 0.025746, 0.8727459999999982, 10.10122685185183, 0, 0.00967, 0.016076, 0, 0),
(133, 2021, 2, 15, 256.29, 328.432, -0.3509999999999991, 0.126, 0.005, 1.03573, 0.815730000000001, 9.441319444444455, 0, 0.00895, 0.02678, 1, 0),
(134, 2021, 2, 16, 256.28, 328.081, 0, 0.084, 0.005, 1.033378, 1.122378, 12.99048611111111, 0, 0.01003, 0.023348, 1, 0),
(135, 2021, 2, 17, 256.28, 328.081, -0.7000000000000455, 0.112, 0.005, 1.034812, 0.4518119999999546, 5.22930555555503, 0, 0.00977, 0.025042, 1, 0),
(136, 2021, 2, 18, 256.26, 327.381, 0, 0.078, 0.005, 1.033021, 1.116021, 12.91690972222222, 0, 0.00986, 0.023161, 1, 0),
(137, 2021, 2, 19, 256.26, 327.381, -1.398999999999944, 0.084, 0.005, 2.027157, 0.7171570000000558, 8.300428240741386, 0, 0.01081, 0.016347, 2, 0),
(138, 2021, 2, 20, 256.22, 325.982, 0.3499999999999659, 0.05, 0.005, 0.037999, 0.4429989999999659, 5.127303240740346, 0, 0.01762, 0.020379, 0, 0),
(139, 2021, 2, 21, 256.23, 326.332, 0.6979999999999791, 0.078, 0.005, 0.031224, 0.8122239999999791, 9.400740740740499, 0, 0.00974, 0.021484, 0, 0),
(140, 2021, 2, 22, 256.25, 327.03, -1.047999999999945, 0.055, 0.005, 2.028585, 1.040585000000055, 12.04380787037101, 0, 0.00901, 0.019575, 2, 0),
(141, 2021, 2, 23, 256.22, 325.982, 0, 0.097, 0.005, 1.032361, 1.134361, 13.12917824074074, 0, 0.00944, 0.022921, 1, 0),
(142, 2021, 2, 24, 256.22, 325.982, -0.6970000000000027, 0.111, 0.005, 1.025887, 0.4448869999999973, 5.149155092592561, 0, 0.00964, 0.016247, 1, 0),
(143, 2021, 2, 25, 256.2, 325.285, -0.6970000000000027, 0.055, 0.005, 1.029823, 0.3928229999999973, 4.546562499999968, 0, 0.00903, 0.020793, 1, 0),
(144, 2021, 2, 26, 256.18, 324.588, 2.44199999999995, 0.041, 0.005, 0.109167, 2.59716699999995, 30.05980324074016, 0, 0.0898, 0.019367, 0, 0),
(145, 2021, 2, 27, 256.25, 327.03, 0.7000000000000455, 0.055, 0.005, 0.027039, 0.7870390000000456, 9.109247685185712, 0, 0.00888, 0.018159, 0, 0),
(146, 2021, 2, 28, 256.27, 327.73, 1.052999999999997, 0.084, 0.005, 0.027029, 1.169028999999997, 13.53042824074071, 0, 0.00934, 0.017689, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barage_massirafornitures`
--

CREATE TABLE IF NOT EXISTS `barage_massirafornitures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `aepiRhamna` double NOT NULL,
  `aepiKech` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL,
  `aport` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_massirafornitures`
--

INSERT INTO `barage_massirafornitures` (`id`, `periode`, `turbinage`, `aepiRhamna`, `aepiKech`, `vidPdev`, `month`, `year`, `aport`) VALUES
(1, '2020-2021', 7.2, 0.75, 0.52, 39.7, 'Sep', 2020, 1),
(2, '2020-2021', 0, 0.99, 0.53, 38.5, 'Oct', 2020, 1),
(3, '2020-2021', 0, 0.62, 0.36, 35, 'Nov', 2020, 1),
(4, '2020-2021', 0, 0.4, 0.67, 31.5, 'Dec', 2020, 1),
(5, '2020-2021', 0, 0.35, 0.61, 19, 'Jan', 2021, 1),
(9, '2020-2021', 0, 0.4, 0.6, 25, 'Feb', 2021, 25.573722000000014);

-- --------------------------------------------------------

--
-- Table structure for table `barage_myyoussefbilanhydr`
--

CREATE TABLE IF NOT EXISTS `barage_myyoussefbilanhydr` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `vf` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_myyoussefbilanhydr`
--

INSERT INTO `barage_myyoussefbilanhydr` (`id`, `annee`, `mois`, `jour`, `cote`, `reserve`, `varReserve`, `evaporation`, `fuite`, `total`, `appVolume`, `appDebit`, `evc`, `v`, `c`, `one`, `vf`) VALUES
(430, 2021, 2, 1, 855.68, 49.575, -0.09200000000000585, 0.007585080000000001, 0.0432, 0.30024, 0.2158250799999941, 2.497975462962895, 0, 0, 0, 0.25704, 0),
(431, 2021, 2, 2, 855.65, 49.483, 0.09200000000000585, 0.006851039999999999, 0.0432, 0.31608, 0.4149310400000059, 4.802442592592661, 0, 0, 0, 0.27288, 0),
(432, 2021, 2, 3, 855.68, 49.575, 0.06099999999999994, 0.00514164, 0.0432, 0.30816, 0.3743016399999999, 4.332194907407407, 0, 0, 0, 0.26496, 0),
(433, 2021, 2, 4, 855.7, 49.636, -0.1530000000000058, 0.008809920000000002, 0.0432, 0.30996, 0.1657699199999942, 1.918633333333266, 0, 0, 0, 0.26676, 0),
(434, 2021, 2, 5, 855.65, 49.483, 0.6440000000000055, 0.002207159999999997, 0.0432, 0.0432, 0.6894071600000055, 7.9792495370371, 0, 0, 0, 0, 0),
(435, 2021, 2, 6, 855.86, 50.127, 0.6469999999999985, 0.001972160000000002, 0.0432, 0.0432, 0.6921721599999985, 8.011251851851835, 0, 0, 0, 0, 0),
(436, 2021, 2, 7, 856.07, 50.774, 0.5570000000000022, 0.0029712, 0.0432, 0.0432, 0.6031712000000021, 6.981148148148173, 0, 0, 0, 0, 0),
(437, 2021, 2, 8, 856.25, 51.331, 0.3729999999999976, 0.0034776, 0.0432, 0.0432, 0.4196775999999976, 4.857379629629602, 0, 0, 0, 0, 0),
(438, 2021, 2, 9, 856.37, 51.704, 0.3109999999999999, 0.003237, 0.0432, 0.0432, 0.3574369999999999, 4.137002314814814, 0, 0, 0, 0, 0),
(439, 2021, 2, 10, 856.47, 52.015, 0.3119999999999976, 0.003743400000000001, 0.0432, 0.0432, 0.3589433999999976, 4.154437499999973, 0, 0, 0, 0, 0),
(440, 2021, 2, 11, 856.57, 52.327, 0.2809999999999988, 0.005501760000000001, 0.0432, 0.0432, 0.3297017599999988, 3.815992592592579, 0, 0, 0, 0, 0),
(441, 2021, 2, 12, 856.66, 52.608, 0.2820000000000036, 0.0047614, 0.0432, 0.0432, 0.3299614000000036, 3.818997685185227, 0, 0, 0, 0, 0),
(442, 2021, 2, 13, 856.75, 52.89, 0.2830000000000013, 0.00577576, 0.0432, 0.0432, 0.3319757600000013, 3.842312037037052, 0, 0, 0, 0, 0),
(443, 2021, 2, 14, 856.84, 53.173, 0.2830000000000013, 0.0083028, 0.0432, 0.0432, 0.3345028000000013, 3.8715601851852, 0, 0, 0, 0, 0),
(444, 2021, 2, 15, 856.93, 53.456, 0.2199999999999989, 0.008317320000000001, 0.0432, 0.0432, 0.2715173199999988, 3.142561574074061, 0, 0, 0, 0, 0),
(445, 2021, 2, 16, 857, 53.676, 0.1580000000000013, 0.006310000000000001, 0.0432, 0.0432, 0.2075100000000012, 2.401736111111126, 0, 0, 0, 0, 0),
(446, 2021, 2, 17, 857.05, 53.834, 0.1890000000000001, 0.007581600000000001, 0.0432, 0.0432, 0.2397816, 2.77525, 0, 0, 0, 0, 0),
(447, 2021, 2, 18, 857.11, 54.023, 0.1899999999999977, 0.006327, 0.0432, 0.0432, 0.2395269999999977, 2.772303240740714, 0, 0, 0, 0, 0),
(448, 2021, 2, 19, 857.17, 54.213, 0.1589999999999989, 0.0068418, 0.0432, 0.0432, 0.2090417999999989, 2.419465277777765, 0, 0, 0, 0, 0),
(449, 2021, 2, 20, 857.22, 54.372, -0.5379999999999967, 0.007591200000000001, 0.0432, 0.8042400000000001, 0.2738312000000034, 3.169342592592632, 0, 0, 0, 0.76104, 0),
(450, 2021, 2, 21, 857.05, 53.834, -0.3780000000000001, 0.001261, 0.0432, 0.87624, 0.4995009999999999, 5.781261574074073, 0, 0, 0, 0.83304, 0),
(451, 2021, 2, 22, 856.93, 53.456, -0.5660000000000025, 0.002764960000000001, 0.0432, 0.96048, 0.3972449599999975, 4.597742592592564, 0, 0, 0, 0.91728, 0),
(452, 2021, 2, 23, 856.75, 52.89, -0.5630000000000024, 0.005507920000000001, 0.0432, 0.87696, 0.3194679199999976, 3.697545370370343, 0, 0, 0, 0.83376, 0),
(453, 2021, 2, 24, 856.57, 52.327, -0.6229999999999976, 0.007478400000000001, 0.0432, 0.9, 0.2844784000000025, 3.292574074074103, 0, 0, 0, 0.8568, 0),
(454, 2021, 2, 25, 856.37, 51.704, -0.4660000000000011, 0.00446976, 0.0432, 0.87408, 0.4125497599999989, 4.774881481481469, 0, 0, 0, 0.83088, 0),
(455, 2021, 2, 26, 856.21, 51.238, 0.09300000000000352, 0.0009919999999999966, 0.0432, 0.79272, 0.8867120000000035, 10.26287037037041, 0, 0, 0, 0.74952, 0),
(456, 2021, 2, 27, 856.25, 51.331, 0.154999999999994, 0.001737399999999999, 0.0432, 0.5997600000000001, 0.7564973999999941, 8.755756944444377, 0, 0, 0, 0.55656, 0),
(457, 2021, 2, 28, 856.31, 51.486, 0.8719999999999999, 0.00199296, 0.0432, 0.46008, 1.33407296, 15.44065925925926, 0, 0, 0, 0.41688, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barage_myyousseffornitures`
--

CREATE TABLE IF NOT EXISTS `barage_myyousseffornitures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `turbinage` double NOT NULL,
  `irrigation` double NOT NULL,
  `soltania` double NOT NULL,
  `vidPdev` double NOT NULL,
  `TransfertMassira` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL,
  `aport` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_myyousseffornitures`
--

INSERT INTO `barage_myyousseffornitures` (`id`, `periode`, `turbinage`, `irrigation`, `soltania`, `vidPdev`, `TransfertMassira`, `month`, `year`, `aport`) VALUES
(1, '2020-2021', 5, 5.8, 0.2, 0.89, 0, 'Sep', 2020, 1),
(2, '2020-2021', 9.8, 10.4, 0.2, 0.11, 0, 'Oct', 2020, 1),
(3, '2020-2021', 2.6, 2.6, 0.2, 0, 0, 'Nov', 2020, 1),
(4, '2020-2021', 4.5, 6.3, 0.2, 0, 0, 'Dec', 2020, 1),
(5, '2020-2021', 1.8, 2.8, 0.1, 0, 0, 'Jan', 2021, 1),
(12, '2020-2021', 7.817399999999999, 8.207999999999998, 0.1915200000000001, 0.2376, 0, 'Feb', 2021, 11.949511239999994);

-- --------------------------------------------------------

--
-- Table structure for table `barage_sididaouifornitures`
--

CREATE TABLE IF NOT EXISTS `barage_sididaouifornitures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `aepAzemour` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_sididaouifornitures`
--

INSERT INTO `barage_sididaouifornitures` (`id`, `periode`, `aepAzemour`, `month`, `year`) VALUES
(1, '2020-2021', 0.193, 'Sep', 2020),
(2, '2020-2021', 0.176, 'Oct', 2020),
(3, '2020-2021', 0.177, 'Nov', 2020),
(4, '2020-2021', 0.195, 'Dec', 2020),
(5, '2020-2021', 0.194, 'Jan', 2021),
(6, '2020-2021', 0.218, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_sididrissbilanhydr`
--

CREATE TABLE IF NOT EXISTS `barage_sididrissbilanhydr` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `Desverse` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(31, 2021, 1, 31, 644.83, 2.23, -0.351, 0.002306, 0.000258, 0.1728, -0.17563600000000001, -2.032824074074074, 0, 0.1728, 0, 0),
(32, 2021, 3, 1, 645, 2.449, -0.09099999999999975, 0.00239, 0.000258, 0.29592, 0.2075680000000003, 2.402407407407411, 0, 0.1728, 0.12312, 0),
(33, 2021, 3, 2, 644.93, 2.358, 0.09099999999999975, 0.002702, 0.000258, 0.47664, 0.5705999999999998, 6.604166666666664, 0, 0.1728, 0.30384, 0),
(34, 2021, 3, 3, 645, 2.449, -0.06499999999999995, 0.002914, 0.000258, 0.23184, 0.1700120000000001, 1.967731481481482, 0, 0.23184, 0, 0),
(35, 2021, 3, 4, 644.95, 2.384, 0.02600000000000025, 0.002804, 0.000258, 0.1296, 0.1586620000000002, 1.836365740740743, 0, 0.1296, 0, 0),
(36, 2021, 3, 5, 644.97, 2.41, -0.1240000000000001, 0.002785, 0.000258, 0.6939, 0.5729429999999999, 6.631284722222221, 0, 0.1296, 0.5643, 0),
(37, 2021, 3, 6, 644.86, 2.286, 0.02000000000000002, 0.002563, 0.000258, 1.18656, 1.209381, 13.99746527777778, 0, 0.11232, 1.07424, 0),
(38, 2021, 3, 7, 644.89, 2.306, 0.1429999999999998, 0.002176, 0.000258, 0.6567, 0.8021339999999998, 9.28395833333333, 0, 0.1512, 0.5055, 0),
(39, 2021, 3, 8, 645, 2.449, -0.07799999999999985, 0.002184, 0.000258, 0.8754599999999999, 0.7999020000000001, 9.258125000000001, 0, 0.1728, 0.70266, 0),
(40, 2021, 3, 9, 644.94, 2.371, 0.07799999999999985, 0.002392, 0.000258, 0.5253, 0.6059499999999999, 7.013310185185184, 0, 0.1728, 0.3525, 0),
(41, 2021, 3, 10, 645, 2.449, -0.0259999999999998, 0.002608, 0.000258, 0.216, 0.1928660000000002, 2.232245370370373, 0, 0.216, 0, 0),
(42, 2021, 3, 11, 644.98, 2.423, -0.0129999999999999, 0.002914, 0.000258, 0.1728, 0.1629720000000001, 1.886250000000001, 0, 0.1728, 0, 0),
(43, 2021, 3, 12, 644.97, 2.41, -0.01300000000000034, 0.003118, 0.000258, 0.1728, 0.1631759999999997, 1.888611111111107, 0, 0.1728, 0, 0),
(44, 2021, 3, 13, 644.96, 2.397, -0.0259999999999998, 0.003214, 0.000258, 0.1728, 0.1502720000000002, 1.739259259259262, 0, 0.1728, 0, 0),
(45, 2021, 3, 14, 644.94, 2.371, -0.06499999999999995, 0.003712, 0.000258, 0.1728, 0.1117700000000001, 1.29363425925926, 0, 0.1728, 0, 0),
(46, 2021, 3, 15, 644.89, 2.306, -0.08899999999999997, 0.003885, 0.000258, 0.1728, 0.08794300000000004, 1.017858796296297, 0, 0.1728, 0, 0),
(47, 2021, 3, 16, 644.82, 2.217, 0.0129999999999999, 0.003768, 0.000258, 0.1224, 0.1394259999999999, 1.613726851851851, 0, 0.1224, 0, 0),
(48, 2021, 3, 17, 644.83, 2.23, 0.01200000000000001, 0.004078, 0.000258, 0.11232, 0.128656, 1.489074074074074, 0, 0.11232, 0, 0),
(49, 2021, 3, 18, 644.84, 2.242, 0.04400000000000004, 0.002758, 0.000258, 0.11232, 0.159336, 1.844166666666667, 0, 0.11232, 0, 0),
(50, 2021, 3, 19, 644.86, 2.286, 0.07200000000000006, 0.00288, 0.000258, 0.11232, 0.1874580000000001, 2.169652777777778, 0, 0.11232, 0, 0),
(51, 2021, 3, 20, 644.93, 2.358, -0.07699999999999996, 0.001955, 0.000258, 0.38352, 0.308733, 3.573298611111112, 0, 0.11232, 0.2712, 0),
(52, 2021, 3, 21, 644.87, 2.281, 0.1029999999999998, 0.002474, 0.000258, 0.62868, 0.7344119999999997, 8.500138888888886, 0, 0.1728, 0.45588, 0),
(53, 2021, 3, 22, 644.95, 2.384, 0.06499999999999995, 0.003122, 0.000258, 0.1809, 0.2492799999999999, 2.885185185185184, 0, 0.1296, 0.0513, 0),
(54, 2021, 3, 23, 645, 2.449, -0.0259999999999998, 0.003547, 0.000258, 0.18204, 0.1598450000000002, 1.850057870370372, 0, 0.1296, 0.05244, 0),
(55, 2021, 3, 24, 644.98, 2.423, 0, 0.003958, 0.000258, 0.1296, 0.133816, 1.548796296296296, 0, 0.1296, 0, 0),
(56, 2021, 3, 25, 644.98, 2.423, -0.02600000000000025, 0.004264, 0.000258, 0.1296, 0.1081219999999997, 1.251412037037034, 0, 0.1296, 0, 0),
(57, 2021, 3, 26, 644.96, 2.397, -0.0389999999999997, 0.004766, 0.000258, 0.1296, 0.09562400000000029, 1.106759259259263, 0, 0.1296, 0, 0),
(58, 2021, 3, 27, 644.93, 2.358, -0.3180000000000001, 0.005086, 0.000258, 0.252, -0.0606560000000001, -0.7020370370370382, 0, 0.252, 0, 0),
(59, 2021, 3, 28, 644.68, 2.04, -0.21, 0.005057, 0.000258, 0.19008, -0.01460499999999995, -0.1690393518518513, 0, 0.19008, 0, 0),
(60, 2021, 3, 29, 644.51, 1.83, 0.5409999999999999, 0.005246, 0.000258, 0.216, 0.7625039999999998, 8.825277777777776, 0, 0.216, 0, 0),
(61, 2021, 3, 30, 644.94, 2.371, -0.331, 0.005497, 0.000258, 0.216, -0.109245, -1.264409722222222, 0, 0.216, 0, 0),
(62, 2021, 3, 31, 644.68, 2.04, 0.3439999999999999, 0.006113, 0.000258, 0.2592, 0.6095709999999999, 7.055219907407406, 0, 0.2592, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barage_sididrissfornitures`
--

CREATE TABLE IF NOT EXISTS `barage_sididrissfornitures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `Canal` double NOT NULL,
  `pmh` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_sididrissfornitures`
--

INSERT INTO `barage_sididrissfornitures` (`id`, `periode`, `Canal`, `pmh`, `vidPdev`, `month`, `year`) VALUES
(2, '2020-2021', 7.2, 0, 0.09, 'Sep', 2020),
(3, '2020-2021', 5.3, 0, 0.17, 'Oct', 2020),
(4, '2020-2021', 5, 0, 0.49, 'Nov', 2020),
(5, '2020-2021', 2.8, 0, 0.54, 'Dec', 2020),
(6, '2020-2021', 4.8, 0, 0.53, 'Jan', 2021),
(7, '2020-2021', 3.6, 0, 0, 'Fev', 2021),
(8, '2020-2021', 5.1, 0, 4.5, 'Mar', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_ssmaachoufornitures`
--

CREATE TABLE IF NOT EXISTS `barage_ssmaachoufornitures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `aep` double NOT NULL,
  `vidPdev` double NOT NULL,
  `month` varchar(4) NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_ssmaachoufornitures`
--

INSERT INTO `barage_ssmaachoufornitures` (`id`, `periode`, `aep`, `vidPdev`, `month`, `year`) VALUES
(1, '2020-2021', 5, 4.16, 'Sep', 2020),
(2, '2020-2021', 5.2, 1.09, 'Oct', 2020),
(3, '2020-2021', 4.9, 1.49, 'Nov', 2020),
(4, '2020-2021', 5.1, 2.05, 'Dec', 2020),
(5, '2020-2021', 4.9, 4.02, 'Jan', 2021),
(6, '2020-2021', 4.5, 2.8, 'Fev', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `barage_suivibilan`
--

CREATE TABLE IF NOT EXISTS `barage_suivibilan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `barage` varchar(40) NOT NULL,
  `suivi` varchar(40) NOT NULL,
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
  `total` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1793 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_suivibilan`
--

INSERT INTO `barage_suivibilan` (`id`, `periode`, `barage`, `suivi`, `sep`, `oct`, `nov`, `dec`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`, `total`) VALUES
(1411, '2020-2021', 'Bin Ouidane', 'Turbinages', 56, 41.1, 17, 4.1, 0.8650000000000001, 0.671, 15.317000000000002, 0, 0, 0, 0, 0, 135.053),
(1412, '2020-2021', 'Bin Ouidane', 'Turbinages Afourer', 2200, 31.2, 11.7, 0.3, 0, 0, 0, 0, 0, 0, 0, 0, 2243.2),
(1413, '2020-2021', 'Bin Ouidane', 'irrigation', 18.4, 30.6, 11.5, 0, 25, 0, 0, 0, 0, 0, 0, 0, 85.5),
(1414, '2020-2021', 'Bin Ouidane', 'AEPI Béni Méllal', 0.9, 0.8, 0.7, 0.6, 0.6, 0.4, 0, 0, 0, 0, 0, 0, 4.000000000000001),
(1415, '2020-2021', 'Bin Ouidane', 'Vidanges +Déversés', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1416, '2020-2021', 'Bin Ouidane', 'Transfert Massira', 3.1, 6.4, 3.3, 2.8, 0, 0.2, 12.3, 0, 0, 0, 0, 0, 28.1),
(1417, '2020-2021', 'Hassan 1er', 'Turbinages', 9.3, 6.6, 6, 2.1, 1.6, 0, 0, 0, 0, 0, 0, 0, 25.6),
(1418, '2020-2021', 'Hassan 1er', 'AEPI Azilal + Demnate', 0.28, 0.27, 0.258, 0.27, 0.28, 0, 0, 0, 0, 0, 0, 0, 1.358),
(1419, '2020-2021', 'Hassan 1er', 'Vidanges +Déversés', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1420, '2020-2021', 'Hassan 1er', 'Transfert Massira', 1.2, 1, 0.8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3),
(1421, '2020-2021', 'Sidi Driss', 'Canal Rocade', 7.2, 5.3, 5, 2.8, 4.8, 0, 0, 0, 0, 0, 0, 0, 25.1),
(1422, '2020-2021', 'Sidi Driss', 'PMH', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1423, '2020-2021', 'Sidi Driss', 'Vidanges +Déversés', 0.09, 0.17, 0.49, 0.54, 0.53, 0, 0, 0, 0, 0, 0, 0, 1.82),
(1424, '2020-2021', 'My Youssef', 'Turbinages', 5, 9.8, 2.6, 4.5, 1.8, 7.817399999999999, 0, 0, 0, 0, 0, 0, 23.700000000000003),
(1425, '2020-2021', 'My Youssef', 'irrigation', 5.8, 10.4, 2.6, 6.3, 2.8, 0.1915200000000001, 0, 0, 0, 0, 0, 0, 28.033920000000002),
(1426, '2020-2021', 'My Youssef', 'soltania', 0.2, 0.2, 0.2, 0.2, 0.1, 8.207999999999998, 0, 0, 0, 0, 0, 0, 0.9),
(1427, '2020-2021', 'My Youssef', 'Vid +Dév My Youssef', 0.89, 0.11, 0, 0, 0, 0.2376, 0, 0, 0, 0, 0, 0, 1.2376),
(1428, '2020-2021', 'My Youssef', 'Transfert Massira', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1429, '2020-2021', 'A.E.Hansali', 'Turbinages', 0, 0, 0, 0, 2.21, 7.93, 9.41, 0, 0, 0, 0, 0, 2.21),
(1430, '2020-2021', 'A.E.Hansali', 'Vidanges +Déversés', 34.19, 11.94, 26.41, 14.38, 0, 0, 0, 0, 0, 0, 0, 0, 86.91999999999999),
(1431, '2020-2021', 'A.E.Hansali', 'Transfert Massira', 12, 4.9, 9, 7.1, 0, 6.3, 7.5, 0, 0, 0, 0, 0, 46.8),
(1432, '2020-2021', 'Aït Messaoud', 'Turbinages', 14, 0, 18.7, 9.5, 0, 0, 0, 0, 0, 0, 0, 0, 42.2),
(1433, '2020-2021', 'Aït Messaoud', 'irrigation', 7, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15),
(1434, '2020-2021', 'Aït Messaoud', 'AEPI', 4.9, 4.7, 4.1, 4.4, 4.4, 0, 0, 0, 0, 0, 0, 0, 26.9),
(1435, '2020-2021', 'Aït Messaoud', 'Vidanges +Déversés', 7.94, 7.05, 2.12, 3.04, 4.02, 3.6287999999999987, 4.406999999999999, 0, 0, 0, 0, 0, 24.169999999999998),
(1436, '2020-2021', 'Al Massira', 'Turbinages', 7.2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7.2),
(1437, '2020-2021', 'Al Massira', 'AEPI Rhamna', 0.75, 0.99, 0.62, 0.4, 0.35, 0.36206, 0, 0, 0, 0, 0, 0, 3.11),
(1438, '2020-2021', 'Al Massira', 'AEPI Marrakech', 0.52, 0.53, 0.36, 0.67, 0.61, 0.5956619999999999, 0, 0, 0, 0, 0, 0, 2.69),
(1439, '2020-2021', 'Al Massira', 'Vidanges +Déversés', 39.7, 38.5, 35, 31.5, 19, 25, 0, 0, 0, 0, 0, 0, 163.7),
(1440, '2020-2021', 'Imfout', 'Turbinages', 24.2, 18, 17.1, 16.4, 13.4, 14.3, 0, 0, 0, 0, 0, 0, 103.4),
(1441, '2020-2021', 'Imfout', 'irrigation', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1442, '2020-2021', 'Imfout', 'AEP S.Bennour+K.Zemamra', 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0, 0, 0, 0, 0, 0, 1.8),
(1443, '2020-2021', 'Imfout', 'AEP ONEP Doukkala', 0.374, 0.333, 0.243, 0.209, 0.237, 0.198, 0, 0, 0, 0, 0, 0, 1.5939999999999999),
(1444, '2020-2021', 'Imfout', 'Vidanges +Déversés', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1445, '2020-2021', 'Daourate', 'turbinages', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1446, '2020-2021', 'Daourate', 'AEP', 12.1, 12.3, 11.4, 11.7, 11.8, 10.5, 0, 0, 0, 0, 0, 0, 69.8),
(1447, '2020-2021', 'Daourate', 'Vidanges +Déversés', 1.38, 2.68, 0.52, 0.54, 0.13, 0, 0, 0, 0, 0, 0, 0, 5.25),
(1448, '2020-2021', 'S.S.Mâachou', 'AEP', 5, 5.2, 4.9, 5.1, 4.9, 4.5, 0, 0, 0, 0, 0, 0, 29.6),
(1449, '2020-2021', 'S.S.Mâachou', 'Vid +Dév=Turb Excl Sys', 4.16, 1.09, 1.49, 2.05, 4.02, 2.8, 0, 0, 0, 0, 0, 0, 15.61),
(1450, '2020-2021', 'Sidi Daoui', 'AEP Azemmour', 0.193, 0.176, 0.177, 0.195, 0.194, 0.218, 0, 0, 0, 0, 0, 0, 1.153),
(1451, '2020-2021', 'Digue Safi', 'AEPI', 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 18),
(1452, '2020-2021', 'Digue Safi', 'Vidanges +Déversés', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1480, '2019-2020', 'B.E.Ouidane', 'Turbinages', 45, 61.3, 25.8, 12.8, 45.7, 47.2, 21.8, 45.3, 66.9, 78.8, 69.2, 56.2, 576),
(1481, '2019-2020', 'B.E.Ouidane', 'Turbinages Afourer', 35.4, 49.8, 18, 7.4, 36.2, 36.4, 15.3, 34.7, 49.1, 61.7, 55.2, 47.2, 446.4),
(1482, '2019-2020', 'B.E.Ouidane', 'irrigation', 34.2, 50.1, 14.8, 6.7, 35.2, 36.7, 15.7, 34.6, 46.1, 54.9, 56.5, 51, 436.4),
(1483, '2019-2020', 'B.E.Ouidane', 'AEPI Béni Méllal', 0.7, 0.7, 0.6, 0.6, 0.6, 0.6, 0.7, 0.6, 0.7, 0.7, 0.9, 0.8, 8.2),
(1484, '2019-2020', 'B.E.Ouidane', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1485, '2019-2020', 'B.E.Ouidane', 'Transfert Massira', 4.4, 6.3, 7.7, 4, 6.5, 6.3, 3.7, 4.3, 10.4, 11.9, 3.8, 0, 69.3),
(1486, '2019-2020', 'Hassan 1er', 'Turbinages ', 21.3, 18.4, 6.3, 3.5, 5.7, 8, 6.1, 5.9, 6.9, 15.1, 10.9, 9.7, 117.8),
(1487, '2019-2020', 'Hassan 1er', 'AEPI Azilal + Demnate', 0.26, 0.25, 0.21, 0.22, 0.21, 0.25, 0.25, 0.25, 0.29, 0.27, 0.3, 0.32, 3.08),
(1488, '2019-2020', 'Hassan 1er', 'Vidanges +Déversés ', 0, 0, 0.4, 0, 0, 0, 0, 0, 0, 2.4, 0, 0, 2.8),
(1489, '2019-2020', 'Hassan 1er', 'Transfert Massira', 1.9, 2.7, 0.2, 0, 0, 0.3, 0, 0, 0, 2.1, 1.6, 1.5, 10.4),
(1490, '2019-2020', 'Sidi Driss', 'Canal Rocade', 13.9, 13.5, 6.4, 5.7, 7, 7.6, 7.6, 7, 7.2, 13.7, 8.1, 7.2, 104.7),
(1491, '2019-2020', 'Sidi Driss', 'PMH', 3.8, 1.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.4),
(1492, '2019-2020', 'Sidi Driss', 'Vidanges +Déversés ', 3.27, 0, 0.21, 0, 0, 0, 1.7, 0.65, 0.84, 0.29, 0.31, 0, 7.27),
(1493, '2019-2020', 'My Youssef', 'Turbinages', 10.7, 11.4, 0, 0, 17.1, 0, 0, 0, 9.4, 8, 6.1, 15.3, 78),
(1494, '2019-2020', 'My Youssef', 'irrigation', 10.8, 11.6, 0.1, 0.3, 17.4, 0, 0, 0, 9.7, 8.3, 7.1, 15.3, 80.7),
(1495, '2019-2020', 'My Youssef', 'soltania', 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.2, 0.2, 0.2, 1.7),
(1496, '2019-2020', 'My Youssef', 'Vid +Dév My Youssef', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.55, 0, 0.55),
(1497, '2019-2020', 'My Youssef', 'Transfert Massira', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1498, '2019-2020', 'A.E.Hansali', 'Turbinages ', 57.9, 26.7, 32.3, 8.5, 17.1, 27.4, 113.6, 39.7, 45.3, 43.8, 11.7, 0, 423.9),
(1499, '2019-2020', 'A.E.Hansali', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25.4, 56.8, 82.26),
(1500, '2019-2020', 'A.E.Hansali', 'Transfert Massira', 27.9, 5.3, 10.3, 2.3, 6.2, 6, 76.5, 13.5, 17.1, 26.6, 13.6, 27.1, 232.5),
(1501, '2019-2020', 'Aït Messaoud', 'Turbinages', 59.6, 23.6, 26.4, 2.6, 9.2, 23.4, 79.2, 36.6, 44.3, 46.5, 26.9, 49.9, 428.1),
(1502, '2019-2020', 'Aït Messaoud', 'irrigation', 8, 11.7, 11.4, 0, 3.5, 12.5, 10, 10, 10, 0, 7.5, 7.5, 92.1),
(1503, '2019-2020', 'Aït Messaoud', 'AEPI', 4.6, 4.3, 4.1, 4.5, 4, 3.4, 4.4, 4.3, 4.5, 4.1, 4.9, 5.2, 52.4),
(1504, '2019-2020', 'Aït Messaoud', 'Vidanges +Déversés ', 1.03, 2.64, 1.77, 3.76, 3.45, 0.44, 40.08, 0, 0, 0.17, 2.81, 1.37, 57.51),
(1505, '2019-2020', 'Al Massira', 'Turbinages ', 34.2, 46.3, 58, 32.8, 68.5, 29.7, 83.5, 38.1, 58.1, 57.3, 46.1, 38.6, 591.2),
(1506, '2019-2020', 'Al Massira', 'AEPI Rhamna', 0.66, 0.68, 0.62, 0.64, 0.64, 0.58, 0.68, 0.7, 0.75, 0.76, 0.78, 0.77, 8.25),
(1507, '2019-2020', 'Al Massira', 'AEPI Marrakech', 0, 0, 0.25, 0.23, 0.11, 0.25, 0.32, 0.14, 0.23, 0.22, 0.19, 0.26, 2.21),
(1508, '2019-2020', 'Al Massira', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1509, '2019-2020', 'Imfout', 'Turbinages', 16.2, 18.1, 17.4, 16.1, 15.3, 15, 16.2, 15.3, 17.9, 18.2, 19, 19.8, 204.4),
(1510, '2019-2020', 'Imfout', 'irrigation', 0, 5.6, 15.8, 3, 32, 0, 18, 0, 10, 10, 0, 0, 94.5),
(1511, '2019-2020', 'Imfout', 'AEP S.Bennour+K.Zemamra', 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 3.6),
(1512, '2019-2020', 'Imfout', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1513, '2019-2020', 'Daourate', 'Turbinages', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1514, '2019-2020', 'Daourate', 'AEP', 11.4, 11.5, 10.7, 11.1, 10.5, 9.7, 11.1, 10.7, 11.5, 11.7, 12.5, 12.4, 134.7),
(1515, '2019-2020', 'Daourate', 'Vidanges+Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1516, '2019-2020', 'S.S.Mâachou', 'AEP', 5, 5.1, 5, 5.1, 5.1, 4.8, 5.1, 5, 5.1, 5, 5.1, 5.2, 60.6),
(1517, '2019-2020', 'S.S.Mâachou', 'Vid +Dév=Turb Excl Sys', 0.57, 2.14, 3.11, 2.25, 0.92, 0.34, 0.14, 0.19, 1.03, 0.11, 0.17, 0.06, 11.02),
(1518, '2019-2020', 'Sidi Daoui', 'AEP Azemmour', 0.175, 0.13, 0.097, 0.131, 0.13, 0.178, 0.196, 0.212, 0.197, 0.188, 0.189, 0.196, 2.02),
(1519, '2019-2020', 'Digue Safi', 'AEPI', 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 36),
(1520, '2019-2020', 'Digue Safi', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1521, '2018-2019', 'B.E.Ouidane', 'Turbinages', 81.5, 63.5, 0, 50, 48.5, 48, 81, 34.1, 85.9, 89.2, 86.4, 92.5, 760.5),
(1522, '2018-2019', 'B.E.Ouidane', 'Turbinages Afourer', 69.5, 52.1, 0, 43, 41.4, 39.4, 66.9, 27.8, 72.8, 73, 68.9, 74.6, 629.3),
(1523, '2018-2019', 'B.E.Ouidane', 'irrigation', 67.2, 52.1, 0, 40.3, 37.6, 37.4, 58.3, 23.2, 70.8, 72.5, 69.3, 76.9, 605.5),
(1524, '2018-2019', 'B.E.Ouidane', 'AEPI Béni Méllal', 0.6, 0.7, 0.6, 0.6, 0.5, 0.5, 0.5, 0.5, 0.6, 0.6, 0.7, 0.8, 7.3),
(1525, '2018-2019', 'B.E.Ouidane', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1526, '2018-2019', 'B.E.Ouidane', 'Transfert Massira', 4.3, 6.3, 0, 5.5, 6.7, 6.5, 15.3, 5.5, 4.5, 5.6, 6, 4.3, 70.6),
(1527, '2018-2019', 'Hassan 1er', 'Turbinages ', 25, 24.7, 0.8, 9.7, 21.6, 20.3, 27.1, 11, 21.5, 25.4, 20.8, 25.3, 233.2),
(1528, '2018-2019', 'Hassan 1er', 'AEPI Azilal + Demnate', 0.22, 0.22, 0.203, 0.22, 0.22, 0.2, 0.22, 0.21, 0.22, 0.21, 0.25, 0.27, 2.65),
(1529, '2018-2019', 'Hassan 1er', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.45, 0, 1.45),
(1530, '2018-2019', 'Hassan 1er', 'Transfert Massira', 1.5, 3.7, 0, 0, 1.7, 1.3, 2.8, 0, 0.6, 2.6, 3.5, 2.4, 20),
(1531, '2018-2019', 'Sidi Driss', 'Canal Rocade', 16, 15.2, 6.1, 9.6, 15.6, 15, 18.1, 12.6, 14.6, 15.8, 14.4, 14.9, 167.9),
(1532, '2018-2019', 'Sidi Driss', 'PMH', 5.7, 4.9, 0.3, 1.3, 3.8, 3.8, 5.6, 0.7, 5, 4.8, 2.1, 5.9, 43.8),
(1533, '2018-2019', 'Sidi Driss', 'Vidanges +Déversés ', 9.57, 20.35, 0.92, 0, 0, 0, 0, 3.89, 0, 0, 1.19, 0.83, 36.75),
(1534, '2018-2019', 'My Youssef', 'Turbinages', 20.4, 15.4, 17.2, 27.8, 20.5, 15.6, 19.6, 9.3, 18.6, 14, 13.3, 14.6, 206.2),
(1535, '2018-2019', 'My Youssef', 'irrigation', 19, 14, 0, 12.5, 20.4, 15.8, 19.5, 9.8, 18.8, 14.2, 13.4, 15.3, 172.5),
(1536, '2018-2019', 'My Youssef', 'soltania', 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 1.5),
(1537, '2018-2019', 'My Youssef', 'Vid +Dév My Youssef', 0, 0.81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.81),
(1538, '2018-2019', 'My Youssef', 'Transfert Massira', 0.9, 1.7, 13.7, 12.2, 0, 0, 0, 0, 0, 0, 0, 0, 28.4),
(1539, '2018-2019', 'A.E.Hansali', 'Turbinages ', 91.7, 72, 13.7, 53.4, 34.5, 25.1, 49, 41.8, 77.7, 79.1, 100.9, 60.6, 699.4),
(1540, '2018-2019', 'A.E.Hansali', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1541, '2018-2019', 'A.E.Hansali', 'Transfert Massira', 47.1, 34.8, 7.4, 23.6, 14.9, 8.2, 9.6, 10.9, 33, 37.9, 50.9, 21.4, 299.7),
(1542, '2018-2019', 'Aït Messaoud', 'Turbinages', 75.2, 76, 8.4, 43.6, 24.8, 17.1, 41, 25.9, 61, 70.1, 86.1, 53.6, 582.8),
(1543, '2018-2019', 'Aït Messaoud', 'irrigation', 13.5, 19.1, 0, 15.5, 9, 9, 25.6, 15, 17.5, 13.5, 15.4, 16.6, 169.7),
(1544, '2018-2019', 'Aït Messaoud', 'AEPI', 3.6, 3.6, 3.6, 3.7, 3.8, 2.9, 3.9, 3.4, 3.8, 4, 4.3, 4.4, 45),
(1545, '2018-2019', 'Aït Messaoud', 'Vidanges +Déversés ', 4.07, 0.13, 3.7, 1.6, 3.73, 2.37, 1.43, 3.21, 0.2, 0, 0, 0, 20.43),
(1546, '2018-2019', 'Al Massira', 'Turbinages ', 34.6, 78.6, 25.1, 68, 81.1, 82.4, 108, 78.1, 107, 78.1, 46, 44.5, 831.4),
(1547, '2018-2019', 'Al Massira', 'AEPI Rhamna', 0.5, 0.52, 0.5, 0.49, 0.61, 0.44, 0.45, 0.48, 0.59, 0.57, 0.67, 0.77, 6.57),
(1548, '2018-2019', 'Al Massira', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1549, '2018-2019', 'Imfout', 'Turbinages', 18.7, 17.5, 15, 16.3, 16, 14.4, 16.1, 15.2, 17.6, 15.4, 19.4, 17.7, 199.1),
(1550, '2018-2019', 'Imfout', 'irrigation', 1, 36, 1.2, 30.6, 40, 40, 60, 45, 60, 40, 1.5, 1, 356.3),
(1551, '2018-2019', 'Imfout', 'AEP S.Bennour+K.Zemamra', 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 3.6),
(1552, '2018-2019', 'Imfout', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1553, '2018-2019', 'Daourate', 'Turbinages', 1.6, 0, 0.6, 0, 0, 0.3, 0.4, 0, 0, 0, 0, 0, 2.9),
(1554, '2018-2019', 'Daourate', 'AEP', 11.2, 11.4, 10.6, 11.1, 11, 9.9, 10.5, 10, 11.1, 11.1, 11.9, 11.8, 131.8),
(1555, '2018-2019', 'Daourate', 'Vidanges+Déversés ', 0, 0.11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.11),
(1556, '2018-2019', 'S.S.Mâachou', 'AEP', 5, 5.1, 4.9, 5.2, 5.1, 4.7, 5.2, 5, 5.2, 5, 5.2, 5.2, 60.7),
(1557, '2018-2019', 'S.S.Mâachou', 'Vid +Dév=Turb Excl Sys', 6.16, 6.95, 7.34, 2.12, 0.99, 1.69, 1.58, 0.58, 0.43, 0.31, 0.11, 0.23, 28.49),
(1558, '2018-2019', 'Sidi Daoui', 'AEP Azemmour', 0.112, 0, 0.1, 0.142, 0.202, 0.203, 0.202, 0.213, 0.16, 0.183, 0.138, 0.199, 1.853),
(1559, '2018-2019', 'Digue Safi', 'AEPI', 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 36),
(1560, '2018-2019', 'Digue Safi', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1561, '2017-2018', 'B.E.Ouidane', 'Turbinages', 61.7, 46.2, 19.5, 0.8, 0, 0.4, 8.4, 54.3, 34.9, 75.5, 93.3, 85.6, 480.7),
(1562, '2017-2018', 'B.E.Ouidane', 'Turbinages Afourer', 61.6, 50.6, 19.6, 0, 0, 0, 6.2, 39.2, 28.3, 63.7, 75.8, 71.5, 416.7),
(1563, '2017-2018', 'B.E.Ouidane', 'irrigation', 60.3, 47.7, 18.5, 0, 0, 0, 6.2, 46.9, 29.6, 65.9, 75.2, 67.6, 417.9),
(1564, '2017-2018', 'B.E.Ouidane', 'AEPI Béni Méllal', 0.8, 0.8, 0.7, 0.6, 0.6, 0.5, 0.5, 0.6, 0.5, 0.5, 0.6, 0.5, 7.2),
(1565, '2017-2018', 'B.E.Ouidane', 'Vidanges +Déversés ', 0, 0.01, 0, 0, 0, 0, 13.73, 0, 0, 0, 0, 0, 13.74),
(1566, '2017-2018', 'B.E.Ouidane', 'Transfert Massira', 0, 0, 0, 0.1, 0, 0, 12, 1.1, 1, 1.2, 6.4, 7, 28.8),
(1567, '2017-2018', 'Hassan 1er', 'Turbinages ', 15.1, 6.7, 5.2, 1.6, 0.4, 0.1, 5.4, 7.8, 1.9, 18.7, 23.7, 28, 114.6),
(1568, '2017-2018', 'Hassan 1er', 'AEPI Azilal + Demnate', 0.2, 0.21, 0.201, 0.21, 0.2, 0.2, 0.22, 0.21, 0.21, 0.21, 0.21, 0.23, 2.5),
(1569, '2017-2018', 'Hassan 1er', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.9, 0, 0.9),
(1570, '2017-2018', 'Hassan 1er', 'Transfert Massira', 1.8, 0.4, 1.1, 0, 0, 0, 0, 0, 0, 0, 1.7, 2.1, 7.2),
(1571, '2017-2018', 'Sidi Driss', 'Canal Rocade', 8.9, 3.7, 3.9, 3.1, 3.2, 3.8, 9.4, 10.5, 8.8, 12.9, 15.6, 18, 101.8),
(1572, '2017-2018', 'Sidi Driss', 'PMH', 3, 2.4, 0, 0, 0, 0, 1.9, 4.9, 0, 4.8, 5.4, 5.7, 28.2),
(1573, '2017-2018', 'Sidi Driss', 'Vidanges +Déversés ', 0.42, 0.39, 4.43, 0, 2.16, 6.55, 13.74, 14.23, 4.56, 0, 0.17, 2.85, 49.51),
(1574, '2017-2018', 'My Youssef', 'Turbinages', 13.3, 14.4, 0.7, 0, 0, 0, 6.1, 15.3, 34, 18.2, 19.7, 22.8, 144.5),
(1575, '2017-2018', 'My Youssef', 'irrigation', 13.2, 13.5, 0.8, 0, 0, 0, 6.3, 14.3, 1, 17.1, 19.1, 21.2, 106.5),
(1576, '2017-2018', 'My Youssef', 'soltania', 0.1, 0.1, 0, 0, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 1.3),
(1577, '2017-2018', 'My Youssef', 'Vid +Dév My Youssef', 0, 0, 0, 0, 0, 0, 0.4, 0, 3.61, 0, 0, 0, 4.02),
(1578, '2017-2018', 'My Youssef', 'Transfert Massira', 0, 0.7, 0, 0, 0, 0, 0, 0.6, 25.6, 0.6, 0.3, 1, 28.9),
(1579, '2017-2018', 'A.E.Hansali', 'Turbinages ', 72.5, 78, 27.8, 13.1, 3.5, 4, 41.3, 87.8, 112.8, 135.3, 141.4, 108.8, 826.1),
(1580, '2017-2018', 'A.E.Hansali', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0.16, 0, 0, 0, 0, 0, 0, 0.16),
(1581, '2017-2018', 'A.E.Hansali', 'Transfert Massira', 24.9, 39.5, 11.9, 8, 0.1, 0.7, 27.2, 34.6, 60.1, 64.5, 68.8, 49.6, 389.8),
(1582, '2017-2018', 'Aït Messaoud', 'Turbinages', 61.2, 63.3, 19.8, 5.5, 0, 0, 57.9, 74.9, 93.1, 95.6, 73.9, 84.1, 629.3),
(1583, '2017-2018', 'Aït Messaoud', 'irrigation', 22.9, 19.8, 7.7, 0, 0, 0, 3.4, 24.3, 16.2, 27.4, 26.7, 22.4, 170.7),
(1584, '2017-2018', 'Aït Messaoud', 'AEPI', 2.9, 3.1, 2.6, 2.4, 2.7, 2.6, 2.5, 2.6, 2.7, 2.8, 3.5, 4.2, 34.7),
(1585, '2017-2018', 'Aït Messaoud', 'Vidanges +Déversés ', 0.07, 8.08, 2.79, 4.29, 2.95, 2.54, 1.93, 17.77, 31.79, 43.28, 61.74, 8.67, 185.9),
(1586, '2017-2018', 'Al Massira', 'Turbinages ', 77.1, 120.5, 107.5, 30, 24.9, 18.2, 30.5, 108.4, 113, 98, 73.4, 67.7, 869.1),
(1587, '2017-2018', 'Al Massira', 'AEPI Rhamna', 0.41, 0.43, 0.38, 0.35, 0.34, 0.31, 0.36, 0.39, 0.44, 0.46, 0.47, 0.51, 4.85),
(1588, '2017-2018', 'Al Massira', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1589, '2017-2018', 'Imfout', 'Turbinages', 16.9, 16.8, 15.4, 18.3, 13.4, 9.8, 13.5, 13.2, 18.6, 16.8, 16.8, 17.6, 187),
(1590, '2017-2018', 'Imfout', 'irrigation', 43.5, 72.7, 73.1, 4.9, 0, 0, 0, 79, 73, 60, 22, 16, 444.2),
(1591, '2017-2018', 'Imfout', 'AEP S.Bennour+K.Zemamra', 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 3.6),
(1592, '2017-2018', 'Imfout', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1593, '2017-2018', 'Daourate', 'Turbinages', 0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0, 0.2),
(1594, '2017-2018', 'Daourate', 'AEP', 10.9, 11.5, 10.1, 9.7, 9.8, 9.1, 10.4, 10.3, 11.3, 11.2, 11.7, 11.7, 127.6),
(1595, '2017-2018', 'Daourate', 'Vidanges+Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1596, '2017-2018', 'S.S.Mâachou', 'AEP', 5, 5, 4.9, 4.7, 5, 4.6, 5.1, 4.9, 5.1, 5, 5.2, 5.2, 59.6),
(1597, '2017-2018', 'S.S.Mâachou', 'Vid +Dév=Turb Excl Sys', 2.61, 3.73, 2.25, 3, 4.5, 1.93, 1.22, 0.61, 1.05, 2.11, 1.23, 1.18, 25.42),
(1598, '2017-2018', 'Sidi Daoui', 'AEP Azemmour', 0.213, 0.126, 0.156, 0.209, 0.208, 0.175, 0.205, 0.193, 0.173, 0.161, 0.197, 0.179, 2.197),
(1599, '2017-2018', 'Digue Safi', 'AEPI', 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 36),
(1600, '2017-2018', 'Digue Safi', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1601, '2016-2017', 'B.E.Ouidane', 'Turbinages', 68.5, 64.2, 40.7, 0, 24.5, 10, 56.7, 77.3, 71.2, 64.7, 76.7, 71.5, 626.1),
(1602, '2016-2017', 'B.E.Ouidane', 'Turbinages Afourer', 60.9, 61.5, 43.2, 0.3, 27.1, 10.9, 56.5, 76.1, 67.4, 64.4, 77.9, 78.4, 624.5),
(1603, '2016-2017', 'B.E.Ouidane', 'irrigation', 63.7, 61.1, 43.5, 0, 27.2, 10.7, 57.8, 81.2, 68.5, 64.9, 71.2, 72.2, 622),
(1604, '2016-2017', 'B.E.Ouidane', 'AEPI Béni Méllal', 0.7, 0.7, 0.6, 0.6, 0.5, 0.4, 0.5, 0.6, 0.6, 0.7, 0.8, 0.8, 7.4),
(1605, '2016-2017', 'B.E.Ouidane', 'Vidanges +Déversés ', 0.02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.02),
(1606, '2016-2017', 'B.E.Ouidane', 'Transfert Massira', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1607, '2016-2017', 'Hassan 1er', 'Turbinages ', 21.2, 18.7, 14.3, 1.6, 17.6, 13.7, 22.4, 25.8, 12.3, 13.6, 16.7, 18.4, 196.2),
(1608, '2016-2017', 'Hassan 1er', 'AEPI Azilal + Demnate', 0.18, 0.19, 0.182, 0.18, 0.18, 0.19, 0.13, 0.16, 0.16, 0.18, 0.21, 0.22, 2.15),
(1609, '2016-2017', 'Hassan 1er', 'Vidanges +Déversés ', 0, 0, 0, 0.16, 0, 0, 0, 0, 0, 0, 0, 0, 0.16),
(1610, '2016-2017', 'Hassan 1er', 'Transfert Massira', 0.7, 1, 1.7, 0, 0.8, 0, 1.1, 1.1, 0, 0.9, 2, 2.4, 11.7),
(1611, '2016-2017', 'Sidi Driss', 'Canal Rocade', 13.3, 12.8, 9.4, 4.8, 13.8, 11.9, 15.5, 18.5, 8.7, 8.8, 8.1, 8.5, 134.1),
(1612, '2016-2017', 'Sidi Driss', 'PMH', 5.8, 4.6, 2.7, 0, 2.7, 2.6, 5.6, 4.5, 2.9, 3, 5.1, 5.9, 45.4),
(1613, '2016-2017', 'Sidi Driss', 'Vidanges +Déversés ', 0.43, 3.02, 9.62, 4.03, 0, 0.95, 0, 4.54, 0, 0.41, 0.16, 0.57, 23.74),
(1614, '2016-2017', 'My Youssef', 'Turbinages', 16.7, 13.8, 1, 0.4, 14.3, 12.5, 22.9, 19.9, 13.2, 13.2, 14.1, 15.9, 157.9),
(1615, '2016-2017', 'My Youssef', 'irrigation', 14.6, 13.2, 0.4, 0.9, 15, 12.7, 22.6, 20, 13.6, 12.8, 13.7, 15.2, 154.7),
(1616, '2016-2017', 'My Youssef', 'soltania', 0.1, 0.1, 0, 0, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 1),
(1617, '2016-2017', 'My Youssef', 'Vid +Dév My Youssef', 0.4, 0, 0.26, 0, 0, 0, 0, 0, 0, 0.36, 0, 0, 1.02),
(1618, '2016-2017', 'My Youssef', 'Transfert Massira', 1.6, 0.4, 0.7, 0, 0, 0, 0.1, 0, 0, 0.4, 0.3, 0.5, 3.9),
(1619, '2016-2017', 'A.E.Hansali', 'Turbinages ', 45.8, 14.2, 20.9, 15.1, 23.5, 10.6, 36, 77.9, 83.9, 70, 102.9, 80.7, 581.5),
(1620, '2016-2017', 'A.E.Hansali', 'Vidanges +Déversés ', 0, 29.43, 12.96, 0, 0, 16.29, 0, 0, 0, 0, 0, 1.48, 60.15),
(1621, '2016-2017', 'A.E.Hansali', 'Transfert Massira', 8, 7.3, 11.4, 9.6, 11, 10.9, 0.9, 16.7, 22.7, 23.9, 37.3, 24.1, 184),
(1622, '2016-2017', 'Aït Messaoud', 'Turbinages', 41.4, 42.3, 32.4, 8.4, 22.4, 28.3, 36.4, 80.6, 83.7, 65.2, 93.7, 65.2, 600),
(1623, '2016-2017', 'Aït Messaoud', 'irrigation', 21, 24.5, 13, 0, 5, 8.3, 25, 35, 33, 22, 31.6, 30.1, 248.5),
(1624, '2016-2017', 'Aït Messaoud', 'AEPI', 3.1, 3.1, 2.6, 2.5, 2.8, 2.3, 2.9, 2.8, 3, 3.1, 3.1, 3.4, 34.6),
(1625, '2016-2017', 'Aït Messaoud', 'Vidanges +Déversés ', 1.71, 0.03, 3.97, 2.46, 0.6, 4.34, 1.76, 1.73, 3.35, 0.15, 0.18, 0.2, 20.47),
(1626, '2016-2017', 'Al Massira', 'Turbinages ', 101, 110.9, 84.3, 36.5, 57.1, 32.4, 123.5, 139, 117.5, 112.8, 108.8, 109.1, 1132.9),
(1627, '2016-2017', 'Al Massira', 'AEPI Rhamna', 0.42, 0.42, 0.39, 0.38, 0.72, 0.34, 0.41, 0.4, 0.45, 0.45, 1.39, 0.38, 6.16),
(1628, '2016-2017', 'Al Massira', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1629, '2016-2017', 'Imfout', 'Turbinages', 14.7, 15.2, 12.8, 18.3, 17, 15.7, 15.8, 18, 19, 18.1, 19.3, 16, 199.8),
(1630, '2016-2017', 'Imfout', 'irrigation', 65, 68, 52, 0, 19.7, 4.9, 87.4, 98, 70, 63, 67, 50, 645),
(1631, '2016-2017', 'Imfout', 'AEP S.Bennour+K.Zemamra', 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 3.6),
(1632, '2016-2017', 'Imfout', 'Vidanges +Déversés ', 0, 0, 0, 9.36, 0, 0, 0, 0, 0, 0, 0, 0, 9.36),
(1633, '2016-2017', 'Daourate', 'Turbinages', 0, 0, 1.8, 5.8, 0, 2.1, 0, 0, 0, 0, 0, 0, 9.8),
(1634, '2016-2017', 'Daourate', 'AEP', 12.2, 11.6, 10.2, 9.8, 9.3, 8.7, 9.9, 10.2, 10.9, 10.4, 11.6, 11.1, 125.8),
(1635, '2016-2017', 'Daourate', 'Vidanges+Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1636, '2016-2017', 'S.S.Mâachou', 'AEP', 4.9, 5.1, 4.9, 5, 5, 4.5, 5, 4.9, 5, 4.9, 5.1, 5.1, 59.2),
(1637, '2016-2017', 'S.S.Mâachou', 'Vid +Dév=Turb Excl Sys', 2.17, 3.68, 10.23, 13.45, 6.52, 7.23, 4.81, 7.91, 6.93, 3.21, 2.16, 1.77, 70.07),
(1638, '2016-2017', 'Sidi Daoui', 'AEP Azemmour', 0.238, 0.217, 0.198, 0.209, 0.225, 0.202, 0.229, 0.211, 0.215, 0.193, 0.207, 0.229, 2.573),
(1639, '2016-2017', 'Digue Safi', 'AEPI', 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 36),
(1640, '2016-2017', 'Digue Safi', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1641, '2015-2016', 'B.E.Ouidane', 'Turbinages', 74.3, 63.6, 56.5, 67.8, 39, 47.3, 42.1, 73.6, 67.9, 84.3, 84.4, 83.8, 784.6),
(1642, '2015-2016', 'B.E.Ouidane', 'irrigation', 64.2, 60.8, 54, 59.1, 36.8, 42, 38.8, 70.6, 64.8, 77.3, 80.4, 77.9, 726.7),
(1643, '2015-2016', 'B.E.Ouidane', 'AEPI Béni Méllal', 0.6, 0.5, 0.5, 0.5, 0.5, 0.5, 0.4, 0.4, 0.5, 0.6, 0.7, 0.7, 6.5),
(1644, '2015-2016', 'B.E.Ouidane', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1645, '2015-2016', 'B.E.Ouidane', 'Transfert Massira', 1.6, 0, 0, 4, 0, 2.1, 0.7, 0, 0, 0, 0, 0, 8.4),
(1646, '2015-2016', 'Hassan 1er', 'Turbinages ', 26.1, 22.5, 16.7, 23.5, 20.3, 14.3, 12.1, 18.2, 14.7, 18.8, 17.8, 23.6, 228.4),
(1647, '2015-2016', 'Hassan 1er', 'AEPI Azilal + Demnate', 0.18, 0.11, 0.079, 0.13, 0.09, 0.13, 0.17, 0.17, 0.18, 0.12, 0.57, 0.15, 2.08),
(1648, '2015-2016', 'Hassan 1er', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.2, 0, 0, 1.2),
(1649, '2015-2016', 'Hassan 1er', 'Transfert Massira', 1.6, 1.7, 0.7, 13.3, 0.9, 0, 0, 0, 0, 2.2, 1.9, 1.6, 23.9),
(1650, '2015-2016', 'Sidi Driss', 'Canal Rocade', 17.8, 15.7, 12.6, 6.9, 15.3, 13.2, 14.3, 15.1, 11.2, 11.9, 11.1, 13.6, 158.6),
(1651, '2015-2016', 'Sidi Driss', 'PMH', 4.8, 4.7, 3.2, 0, 3.9, 3.2, 1.8, 3.2, 3, 4, 3.3, 6.6, 41.7),
(1652, '2015-2016', 'Sidi Driss', 'Vidanges +Déversés ', 1.09, 0.37, 0.09, 0, 0, 1.57, 8.57, 0, 0.2, 0.22, 2.04, 8.58, 22.73),
(1653, '2015-2016', 'My Youssef', 'Turbinages', 19.4, 18.7, 16.3, 15.6, 14.5, 6.3, 14.5, 14.5, 9.7, 15.6, 11.5, 16.1, 172.7),
(1654, '2015-2016', 'My Youssef', 'irrigation', 19.4, 18.6, 16.4, 15.2, 14.4, 7, 14.3, 14.4, 9.3, 14.5, 10.6, 15.6, 169.6),
(1655, '2015-2016', 'My Youssef', 'soltania', 0.1, 0.1, 0.1, 0.1, 0.1, 0, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 1),
(1656, '2015-2016', 'My Youssef', 'Vid +Dév My Youssef', 0, 0.15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.15),
(1657, '2015-2016', 'My Youssef', 'Transfert Massira', 0, 0.2, 0, 0.3, 0, 0, 0.1, 0, 0.3, 0.7, 0.5, 0.3, 2.4),
(1658, '2015-2016', 'A.E.Hansali', 'Turbinages ', 43.8, 53.9, 41.5, 41.3, 24.1, 29.8, 30.9, 46.3, 42.4, 47.6, 60.9, 59.6, 522.1),
(1659, '2015-2016', 'A.E.Hansali', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1660, '2015-2016', 'A.E.Hansali', 'Transfert Massira', 4.6, 13.2, 9.2, 5.9, 2.2, 3.3, 0.4, 0, 0, 2.4, 8.6, 15.6, 65.4),
(1661, '2015-2016', 'Aït Messaoud', 'Turbinages', 43.3, 58.4, 41.5, 41.8, 23.8, 25.4, 30.3, 48.5, 42.9, 43.8, 61.2, 56, 516.8),
(1662, '2015-2016', 'Aït Messaoud', 'irrigation', 23, 27, 21, 23.6, 14, 17.5, 21, 33.7, 28, 28, 31, 23.1, 290.9),
(1663, '2015-2016', 'Aït Messaoud', 'AEPI', 3.1, 3, 3, 3.6, 3.1, 3, 3.3, 3.1, 3, 2.9, 3, 3, 37.2),
(1664, '2015-2016', 'Aït Messaoud', 'Vidanges +Déversés ', 0.05, 0, 0.04, 0.13, 1.07, 2.99, 2.29, 0.71, 0.6, 1.01, 0, 0.27, 9.16),
(1665, '2015-2016', 'Al Massira', 'Turbinages ', 97, 87.6, 103.3, 120.8, 98.4, 85.4, 83.5, 109.1, 87.2, 112.5, 94, 85.5, 1164.3),
(1666, '2015-2016', 'Al Massira', 'AEPI Rhamna', 0.37, 0.32, 0.44, 0.35, 0.34, 0.3, 0.34, 0.32, 0.35, 0.37, 0.51, 2.51, 6.51),
(1667, '2015-2016', 'Al Massira', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1668, '2015-2016', 'Imfout', 'Turbinages', 16.7, 16.3, 14.5, 16.9, 14.9, 17.2, 10.3, 14.1, 10.9, 12.8, 16.1, 15, 175.7),
(1669, '2015-2016', 'Imfout', 'irrigation', 80, 70, 85, 95, 75, 40, 50, 80, 52, 67, 53, 35, 782),
(1670, '2015-2016', 'Imfout', 'AEP S.Bennour+K.Zemamra', 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 3.6),
(1671, '2015-2016', 'Imfout', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 2.43, 0, 0, 0, 0, 0, 0, 2.43),
(1672, '2015-2016', 'Daourate', 'Turbinages', 0, 0.3, 0, 0.1, 0, 3.2, 0, 0, 0, 0.3, 0, 0, 4),
(1673, '2015-2016', 'Daourate', 'AEP', 11.9, 12.1, 11.5, 11.7, 11.7, 10.8, 11.6, 11.4, 12, 11.9, 12.5, 12.1, 141.3),
(1674, '2015-2016', 'Daourate', 'Vidanges+Déversés ', 0, 0, 0, 0, 0, 0, 0, 0.38, 0, 0, 0, 0, 0.38),
(1675, '2015-2016', 'S.S.Mâachou', 'AEP', 4.9, 5, 4.5, 4.8, 4.9, 4.6, 4.9, 4.8, 5, 4.9, 5.1, 5.1, 58.6),
(1676, '2015-2016', 'S.S.Mâachou', 'Vid +Dév=Turb Excl Sys', 0.2, 0.57, 0.88, 1.8, 2.01, 4.6, 2.51, 2.01, 3.48, 1.21, 4.61, 3.36, 27.24),
(1677, '2015-2016', 'Sidi Daoui', 'AEP Azemmour', 0.222, 0.219, 0.211, 0.202, 0.199, 0.194, 0.205, 0.293, 0.216, 0.194, 0.201, 0.216, 2.572),
(1678, '2015-2016', 'Digue Safi', 'AEPI', 3.02, 3, 2.73, 3, 3, 3, 3, 3, 3, 3, 3, 3, 35.7),
(1679, '2015-2016', 'Digue Safi', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1680, '2014-2015', 'B.E.Ouidane', 'Turbinages', 70.9, 62.9, 27, 7.9, 31.1, 31.2, 64.3, 176.4, 94.7, 73.7, 84.2, 91.9, 816.3),
(1681, '2014-2015', 'B.E.Ouidane', 'irrigation', 59.6, 56, 18.1, 0, 26.7, 28.5, 50.1, 66.9, 71.2, 61.1, 80.4, 68, 586.5),
(1682, '2014-2015', 'B.E.Ouidane', 'AEPI Béni Méllal', 0.6, 0.5, 0.4, 0.4, 0.3, 0.3, 0.3, 0.4, 0.5, 0.5, 0.6, 0.6, 5.4),
(1683, '2014-2015', 'B.E.Ouidane', 'Vidanges +Déversés ', 0.01, 0, 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.02),
(1684, '2014-2015', 'B.E.Ouidane', 'Transfert Massira', 8.6, 5.1, 6.8, 6, 3.3, 2, 11.1, 87.3, 18.5, 9.6, 2.6, 18.6, 179.5),
(1685, '2014-2015', 'Hassan 1er', 'Turbinages ', 15.8, 8.2, 2.1, 0, 6.1, 2.8, 13.7, 52.3, 44.4, 24.9, 25.3, 27.4, 222.9),
(1686, '2014-2015', 'Hassan 1er', 'AEPI Azilal + Demnate', 0.14, 0.11, 0.205, 0.06, 0.18, 0.07, 0.11, 0.02, 0.07, 0.09, 0.16, 0.1, 1.31),
(1687, '2014-2015', 'Hassan 1er', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0.25, 0, 0, 0, 0, 0.25),
(1688, '2014-2015', 'Hassan 1er', 'Transfert Massira', 1, 1.4, 0, 0, 0, 0, 0, 29, 22.4, 6, 2.4, 3.5, 65.8),
(1689, '2014-2015', 'Sidi Driss', 'Canal Rocade', 10.1, 6.4, 6.6, 6.9, 10.7, 10.9, 16.3, 16.3, 16.4, 15.4, 16.9, 17.8, 150.6),
(1690, '2014-2015', 'Sidi Driss', 'PMH', 4.4, 0, 0, 0, 0.6, 2.1, 5, 0, 0, 2, 5.4, 5.2, 24.7),
(1691, '2014-2015', 'Sidi Driss', 'Vidanges +Déversés ', 0.74, 36.36, 40.13, 11.32, 5.12, 0.21, 31.23, 51.69, 33.16, 8.41, 0, 2.77, 221.15),
(1692, '2014-2015', 'My Youssef', 'Turbinages', 13.8, 13.4, 0.5, 45.6, 30.5, 27.9, 57.2, 68.5, 37.4, 23.3, 21.9, 22.8, 362.8),
(1693, '2014-2015', 'My Youssef', 'irrigation', 13.9, 13.3, 0, 0, 16, 22.6, 21.8, 26.3, 22.7, 19.3, 20.8, 22, 198.7),
(1694, '2014-2015', 'My Youssef', 'soltania', 0.1, 0.1, 0, 0, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 1.1),
(1695, '2014-2015', 'My Youssef', 'Vid +Dév My Youssef', 0, 0, 26.85, 10.87, 0.78, 0, 30.8, 5.78, 0, 0.03, 0, 0, 75.11),
(1696, '2014-2015', 'My Youssef', 'Transfert Massira', 0, 0, 21.8, 45.2, 12.1, 4.2, 52.9, 38.3, 11.7, 3.2, 0.7, 0.5, 190.6),
(1697, '2014-2015', 'A.E.Hansali', 'Turbinages ', 108.7, 51.6, 9.2, 9.1, 0, 11.1, 54.1, 43.3, 55.9, 72.4, 85.3, 68.4, 568.9),
(1698, '2014-2015', 'A.E.Hansali', 'Vidanges +Déversés ', 0, 0, 0, 0, 7.85, 5.48, 0, 0, 0, 0, 0, 0, 13.33),
(1699, '2014-2015', 'A.E.Hansali', 'Transfert Massira', 65, 18.4, 1.9, 5.4, 3, 4.9, 20.5, 7.2, 14.8, 37.3, 50.6, 29.4, 258.3),
(1700, '2014-2015', 'Aït Messaoud', 'Turbinages', 102.5, 54.6, 16, 21, 6.4, 14.6, 57.5, 43.6, 56.5, 71.1, 85.5, 69.7, 599.1),
(1701, '2014-2015', 'Aït Messaoud', 'irrigation', 24.8, 26.3, 4.3, 0, 2, 8.1, 25.8, 32.1, 34.5, 22.8, 19.4, 28.5, 228.5),
(1702, '2014-2015', 'Aït Messaoud', 'AEPI', 2.6, 2.2, 2.5, 2.3, 2.2, 2.3, 2.7, 2.2, 3, 2.9, 2.7, 3.2, 30.9),
(1703, '2014-2015', 'Aït Messaoud', 'Vidanges +Déversés ', 13.43, 3.32, 7.36, 2.45, 0.94, 1.96, 2.43, 0, 1.64, 1.01, 5, 0.12, 39.65),
(1704, '2014-2015', 'Al Massira', 'Turbinages ', 98.4, 118.1, 49, 24.1, 37.9, 62.9, 109, 106.2, 110.8, 102.8, 108.8, 97.4, 1025.5),
(1705, '2014-2015', 'Al Massira', 'AEPI Rhamna', 0.23, 0.24, 0.28, 0.27, 0.27, 0.22, 0.2, 0.4, 0.32, 0.34, 0.37, 0.33, 3.47),
(1706, '2014-2015', 'Al Massira', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1707, '2014-2015', 'Imfout', 'Turbinages', 23.4, 19.2, 16, 12.1, 11.6, 13.2, 17.8, 15.4, 16.5, 26.4, 22.7, 19, 213.1),
(1708, '2014-2015', 'Imfout', 'irrigation', 73, 96, 16, 0, 7.9, 32.2, 79.2, 85.1, 93.6, 82.5, 66, 48, 679.5),
(1709, '2014-2015', 'Imfout', 'AEP S.Bennour+K.Zemamra', 0.2, 0.2, 0.2, 0.2, 0.214, 0.222, 0.25, 0.295, 0.333, 0.3, 0.3, 0.3, 3.014),
(1710, '2014-2015', 'Imfout', 'Vidanges +Déversés ', 0, 0, 8.52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8.52),
(1711, '2014-2015', 'Daourate', 'Turbinages', 0.4, 0.2, 11.7, 0.3, 0, 0, 0, 0, 0.6, 5.4, 3.4, 1.8, 23.9),
(1712, '2014-2015', 'Daourate', 'AEP', 11.6, 11.7, 10.6, 10.9, 11.2, 10, 11.3, 11.2, 11.9, 11.8, 12.3, 12.2, 136.7),
(1713, '2014-2015', 'Daourate', 'Vidanges+Déversés ', 0, 0, 11.16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11.16),
(1714, '2014-2015', 'S.S.Mâachou', 'AEP', 4.9, 5.1, 4.8, 5, 5, 4.5, 5, 4.9, 5, 4.9, 5.1, 5.1, 59.2),
(1715, '2014-2015', 'S.S.Mâachou', 'Vid +Dév=Turb Excl Sys', 0, 3.33, 46.44, 21.45, 5.22, 3.14, 2.74, 1.07, 1.2, 7.4, 6.03, 2.73, 100.75),
(1716, '2014-2015', 'Sidi Daoui', 'AEP Azemmour', 0.231, 0.218, 0.236, 0.175, 0.241, 0.237, 0.231, 0.248, 0.251, 0.254, 0.224, 0.258, 2.805),
(1717, '2014-2015', 'Digue Safi', 'AEPI', 2.93, 2.95, 2.63, 2.87, 2.84, 2.53, 2.68, 2.84, 2.72, 2.85, 3.19, 3.27, 34.3),
(1718, '2014-2015', 'Digue Safi', 'Vidanges +Déversés ', 0, 0, 0.13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.13),
(1719, '2013-2014', 'B.E.Ouidane', 'Turbinages', 72.9, 75.2, 68, 45.8, 31.6, 15.3, 74.2, 64.2, 76, 76.7, 83, 84, 766.9),
(1720, '2013-2014', 'B.E.Ouidane', 'irrigation', 31.6, 49.4, 63.5, 47.1, 32.1, 15.4, 75, 64.5, 78, 76.4, 79, 76.1, 688.1),
(1721, '2013-2014', 'B.E.Ouidane', 'AEPI Béni Méllal', 0.4, 0.4, 0.4, 0.4, 0.2, 0.1, 0.3, 0.3, 0.4, 0.5, 0.5, 0.6, 4.5),
(1722, '2013-2014', 'B.E.Ouidane', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1723, '2013-2014', 'B.E.Ouidane', 'Transfert Massira', 32.7, 20.3, 3.3, 0, 0, 0, 0, 0, 0, 0, 2.8, 5.8, 65),
(1724, '2013-2014', 'Hassan 1er', 'Turbinages ', 15.5, 23.2, 17.3, 13.2, 12.7, 5.4, 20.5, 18.8, 18.6, 19.5, 17.9, 17.4, 200),
(1725, '2013-2014', 'Hassan 1er', 'AEPI Azilal + Demnate', 0.05, 0.04, 0.004, 0.5, 0.5, 0.21, 0.23, 0.16, 0.13, 0.12, 0.19, 0.16, 2.27),
(1726, '2013-2014', 'Hassan 1er', 'Vidanges +Déversés ', 0, 0, 0, 2.3, 0, 0, 0, 0, 0, 0, 0, 0, 2.3),
(1727, '2013-2014', 'Hassan 1er', 'Transfert Massira', 1.7, 3.5, 1.3, 0.7, 0, 0, 0, 0.3, 2.9, 4.6, 3.6, 3.2, 21.8),
(1728, '2013-2014', 'Sidi Driss', 'Canal Rocade', 11.1, 15.3, 13.2, 12.6, 12.6, 9, 18.2, 15.9, 12.4, 11.1, 10.4, 10.7, 152.5),
(1729, '2013-2014', 'Sidi Driss', 'PMH', 2.3, 3.5, 2.5, 2, 2, 0.6, 3, 2.5, 2.6, 2.6, 3, 2.7, 29.3),
(1730, '2013-2014', 'Sidi Driss', 'Vidanges +Déversés ', 6.5, 0.2, 0, 0.4, 2.7, 6.3, 0.9, 0.3, 0, 0, 0, 0.9, 18.2),
(1731, '2013-2014', 'My Youssef', 'Turbinages', 11.1, 16.8, 16.9, 13.1, 7.5, 2.4, 26, 15.9, 12.8, 15.6, 14.9, 14.7, 167.7),
(1732, '2013-2014', 'My Youssef', 'irrigation', 10.1, 16.8, 17.1, 13.3, 7.9, 3.3, 25.7, 16.1, 12.7, 15.1, 14.4, 14.9, 167.4),
(1733, '2013-2014', 'My Youssef', 'Vid +Dév My Youssef', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1734, '2013-2014', 'My Youssef', 'Transfert Massira', 0.8, 0, 0, 0, 0, 0, 0.2, 0, 0.1, 0.4, 0.4, 0, 1.9),
(1735, '2013-2014', 'A.E.Hansali', 'Turbinages ', 87.6, 66.7, 43.3, 54.3, 38.7, 75.9, 70.7, 47.3, 71.9, 78.3, 109.4, 86.3, 830.4),
(1736, '2013-2014', 'A.E.Hansali', 'Vidanges +Déversés ', 0, 0, 0, 0, 0.07, 0, 0, 0, 0, 0, 0, 0, 0.07),
(1737, '2013-2014', 'A.E.Hansali', 'Transfert Massira', 61.1, 19, 18.4, 32.9, 28.9, 60.7, 30.2, 11.6, 32.6, 48.7, 72, 46.2, 462.4),
(1738, '2013-2014', 'Aït Messaoud', 'Turbinages', 102.4, 78.2, 50.5, 64.3, 44.5, 92.4, 76.3, 53.1, 76.2, 86.9, 92.1, 83.6, 900.5),
(1739, '2013-2014', 'Aït Messaoud', 'irrigation', 11.2, 42.9, 20.3, 13.2, 2.7, 0, 32.9, 32.8, 31.2, 17.4, 19.4, 28.5, 252.5),
(1740, '2013-2014', 'Aït Messaoud', 'Vidanges +Déversés ', 0.07, 3.2, 0.05, 0.39, 0.07, 0.2, 0.04, 0, 0, 3, 33.56, 6.2, 46.78),
(1741, '2013-2014', 'Al Massira', 'Turbinages ', 87.7, 111.6, 94.9, 98.7, 52.6, 41.4, 146, 87, 114.7, 102.8, 97.1, 97.1, 1131.6),
(1742, '2013-2014', 'Al Massira', 'AEPI Rhamna', 0.34, 0.27, 0.27, 0.29, 0.29, 0.28, 0.36, 0.33, 0.33, 0.39, 0.34, 0.29, 3.76),
(1743, '2013-2014', 'Al Massira', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1744, '2013-2014', 'Imfout', 'Turbinages', 23.2, 35.5, 20.5, 20, 20.3, 20.3, 21.7, 23.5, 20.6, 16.3, 21.4, 24.1, 267.4),
(1745, '2013-2014', 'Imfout', 'irrigation', 55.2, 82.6, 77.5, 81.3, 29.9, 10.6, 95, 52.7, 90.6, 66.2, 67, 28.3, 736.9),
(1746, '2013-2014', 'Imfout', 'AEP S.Bennour+K.Zemamra', 0.226, 0.219, 0.207, 0.203, 0.182, 0.18, 0.188, 0.203, 0.209, 0.214, 0.21, 0.21, 2.452),
(1747, '2013-2014', 'Imfout', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1748, '2013-2014', 'Daourate', 'Turbinages', 2.9, 12.1, 0, 1.7, 0, 2.6, 0, 1.8, 0, 0.8, 2, 0, 23.9),
(1749, '2013-2014', 'Daourate', 'AEP', 12.1, 12.3, 11.2, 11.3, 11, 9.1, 11, 11, 11.6, 11.7, 12.1, 12.1, 136.7),
(1750, '2013-2014', 'Daourate', 'Vidanges+Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1751, '2013-2014', 'S.S.Mâachou', 'AEP', 4.9, 5, 4.8, 4.9, 4.8, 4.3, 4.8, 4.8, 5, 4.9, 5.1, 5.1, 58.2),
(1752, '2013-2014', 'S.S.Mâachou', 'Vid +Dév=Turb Excl Sys', 0.5, 4.4, 0.4, 0, 0, 0, 0, 2.8, 0, 1.8, 1.9, 0, 11.8),
(1753, '2013-2014', 'Sidi Daoui', 'AEP Azemmour', 0.281, 0.252, 0.242, 0.257, 0.207, 0.221, 0.269, 0.265, 0.22, 0.231, 0.218, 0.251, 2.914),
(1754, '2013-2014', 'Digue Safi', 'AEPI', 2.93, 2.93, 2.36, 2.71, 2.35, 2.21, 2.6, 2.41, 2.73, 2.83, 3.08, 3.06, 32.2),
(1755, '2013-2014', 'Digue Safi', 'Vidanges +Déversés ', 0, 0, 0.03, 0, 0, 0.04, 0, 0, 0, 0, 0, 0, 0.07),
(1756, '2012-2013', 'B.E.Ouidane', 'Turbinages', 64.2, 45.8, 50, 169.7, 77.3, 49.3, 213, 220.7, 93.4, 76.1, 83.2, 88.4, 1231.1),
(1757, '2012-2013', 'B.E.Ouidane', 'irrigation', 64.8, 34.5, 5.8, 3, 5.7, 47.1, 30.3, 45.5, 66.3, 68.5, 79.1, 73, 523.6),
(1758, '2012-2013', 'B.E.Ouidane', 'AEPI Béni Méllal', 0.4, 0.3, 0.2, 0.1, 0.1, 0.1, 0.2, 0.2, 0.6, 0.3, 0.5, 0.5, 3.6),
(1759, '2012-2013', 'B.E.Ouidane', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1760, '2012-2013', 'B.E.Ouidane', 'Transfert Massira', 0, 8.7, 35.2, 133.3, 57.1, 1.6, 146, 140, 21.2, 5.8, 2.9, 11.9, 563.8),
(1761, '2012-2013', 'Hassan 1er', 'Turbinages ', 20, 11.3, 1.6, 9, 17.5, 18.4, 11.7, 16.5, 22.1, 23.2, 25.9, 25.6, 202.7),
(1762, '2012-2013', 'Hassan 1er', 'AEPI Azilal + Demnate', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1763, '2012-2013', 'Hassan 1er', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1764, '2012-2013', 'Hassan 1er', 'Transfert Massira', 3.3, 1.2, 0, 0, 1.3, 2.5, 0, 0, 1.2, 1.9, 3.8, 3.4, 18.8),
(1765, '2012-2013', 'Sidi Driss', 'Canal Rocade', 12.7, 8.4, 6.2, 11.7, 13.5, 13.4, 16.9, 20.5, 17, 17.4, 17.5, 17.5, 172.6),
(1766, '2012-2013', 'Sidi Driss', 'PMH', 3.2, 1.4, 0, 1.3, 2.4, 1.8, 2.9, 3.1, 3.6, 3.4, 3.6, 3.8, 30.5),
(1767, '2012-2013', 'Sidi Driss', 'Vidanges +Déversés ', 0.8, 6.1, 22, 6.4, 0.8, 1.9, 1.6, 4.3, 0, 0.1, 0, 0.1, 44),
(1768, '2012-2013', 'My Youssef', 'Turbinages', 19.2, 7.3, 0, 5.1, 19.8, 19.3, 20.7, 22.3, 15.4, 15.7, 16.9, 16.6, 178.2),
(1769, '2012-2013', 'My Youssef', 'irrigation', 17.2, 7.1, 0, 5.7, 19.6, 19.3, 21, 23.8, 15.7, 15.5, 16.4, 16.9, 178.2),
(1770, '2012-2013', 'My Youssef', 'Vid +Dév My Youssef', 0, 0, 0.8, 0, 0, 0, 0.2, 0, 0, 0, 0, 0, 1.1),
(1771, '2012-2013', 'My Youssef', 'Transfert Massira', 1.6, 0.3, 0.7, 0, 0.1, 0, 0, 0, 0, 0.2, 0.4, 0, 3.2),
(1772, '2012-2013', 'A.E.Hansali', 'Turbinages ', 31.8, 37.6, 92.3, 139.8, 78.1, 90, 195.8, 151.5, 74.1, 80.1, 79.4, 83.7, 1134.2),
(1773, '2012-2013', 'A.E.Hansali', 'Vidanges +Déversés ', 1.1, 1.1, 0, 0, 0.1, 0, 0, 0, 0, 0, 0, 0, 2.2),
(1774, '2012-2013', 'A.E.Hansali', 'Transfert Massira', 6.5, 14.4, 73.8, 108.1, 55.6, 53.8, 145.5, 100.7, 34.3, 43, 42.7, 44.5, 722.9),
(1775, '2012-2013', 'Aït Messaoud', 'Turbinages', 45.8, 41.1, 86.6, 107.1, 77.7, 89.9, 107.1, 103.6, 81.7, 86.8, 74.7, 97.1, 999.3),
(1776, '2012-2013', 'Aït Messaoud', 'irrigation', 24.8, 20.6, 0, 4.7, 8.7, 22.8, 13.9, 25.6, 31.2, 26.4, 26, 28.1, 232.8),
(1777, '2012-2013', 'Aït Messaoud', 'Vidanges +Déversés ', 0, 0, 39, 65, 8, 19, 114, 87.4, 5, 8, 18, 6, 369.6),
(1778, '2012-2013', 'Al Massira', 'Turbinages ', 69.3, 72.8, 27.1, 141.8, 107.9, 100.9, 355.7, 334.7, 93.5, 100.9, 115, 95, 1614.6),
(1779, '2012-2013', 'Al Massira', 'AEPI Rhamna', 0.2, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.2, 0.2, 0.3, 0.3, 2.5),
(1780, '2012-2013', 'Al Massira', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1781, '2012-2013', 'Imfout', 'Turbinages', 16.6, 16.9, 16.6, 98.8, 28.9, 29.4, 164.9, 133.3, 14.2, 17.2, 26.4, 25.4, 588.6),
(1782, '2012-2013', 'Imfout', 'irrigation', 50, 49.6, 4, 32, 78.3, 72.9, 7.1, 66.3, 80.3, 84.5, 88.3, 63, 676.3),
(1783, '2012-2013', 'Imfout', 'AEP S.Bennour+K.Zemamra', 0.21, 0.22, 0.21, 0.2, 0.18, 0.17, 0.18, 0.21, 0.22, 0.22, 0.23, 0.24, 2.5),
(1784, '2012-2013', 'Imfout', 'Vidanges +Déversés ', 0, 0, 1.9, 0, 0, 0, 149.5, 164.1, 0, 0, 0, 0, 315.5),
(1785, '2012-2013', 'Daourate', 'Turbinages', 0.2, 0.2, 11.7, 69.9, 11.4, 18.3, 182.8, 151.9, 0, 0, 4.6, 3.5, 454.5),
(1786, '2012-2013', 'Daourate', 'AEP', 11.7, 11.8, 10.6, 10.7, 10.7, 8.8, 11.1, 11.1, 12.3, 11.8, 12.6, 12.5, 135.7),
(1787, '2012-2013', 'Daourate', 'Vidanges+Déversés ', 0, 0, 0, 23.7, 0, 0, 114.7, 156, 0, 0, 0, 0, 294.4),
(1788, '2012-2013', 'S.S.Mâachou', 'AEP', 5, 5, 4.4, 5, 5, 4.6, 5, 4.8, 5, 4.8, 5, 5.1, 58.7),
(1789, '2012-2013', 'S.S.Mâachou', 'Vid +Dév=Turb Excl Sys', 0, 0, 12.5, 101.4, 15.8, 20.6, 275.6, 326.9, 0, 0, 0, 0.8, 753.6),
(1790, '2012-2013', 'Sidi Daoui', 'AEP Azemmour', 0.253, 0.284, 0.182, 0.154, 0.256, 0.283, 0.169, 0.156, 0.176, 0.272, 0.283, 0.285, 2.8),
(1791, '2012-2013', 'Digue Safi', 'AEPI', 2.8, 2.8, 2.7, 2.8, 2.7, 2.2, 2.3, 2.7, 2.8, 2.7, 2.9, 3.2, 32.6),
(1792, '2012-2013', 'Digue Safi', 'Vidanges +Déversés ', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `barage_timinoutinebilanhydr`
--

CREATE TABLE IF NOT EXISTS `barage_timinoutinebilanhydr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jour` int NOT NULL,
  `cote` double NOT NULL,
  `reserve` double NOT NULL,
  `varReserve` double NOT NULL,
  `evaporation` double NOT NULL,
  `vidange` double NOT NULL,
  `deverse` double NOT NULL,
  `v1` double NOT NULL,
  `v2` double NOT NULL,
  `soltania` double NOT NULL,
  `total` double NOT NULL,
  `volumeApp` double NOT NULL,
  `debitApp` double NOT NULL,
  `annee` int NOT NULL,
  `mois` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_timinoutinebilanhydr`
--

INSERT INTO `barage_timinoutinebilanhydr` (`id`, `jour`, `cote`, `reserve`, `varReserve`, `evaporation`, `vidange`, `deverse`, `v1`, `v2`, `soltania`, `total`, `volumeApp`, `debitApp`, `annee`, `mois`) VALUES
(175, 1, 792.65, 0.902, -0.04900000000000004, 0.00151528, 0, 0, 0, 0.25236, 0.00684, 0.2592, 0.21171528, 2.450408333333333, 2021, 2),
(176, 2, 792.5, 0.853, 0.02300000000000002, 0.00135856, 0, 0, 0, 0.25236, 0.00684, 0.2592, 0.28355856, 3.281927777777778, 2021, 2),
(177, 3, 792.55, 0.876, 0, 0.00102312, 0, 0, 0, 0.25236, 0.00684, 0.2592, 0.26022312, 3.011841666666666, 2021, 2),
(178, 4, 792.55, 0.876, 0.03700000000000003, 0.00183888, 0, 0, 0, 0.21996, 0.00684, 0.2268, 0.26563888, 3.074524074074074, 2021, 2),
(179, 5, 793.1, 0.913, 0.001000000000000001, 0.0004791599999999993, 0, 0, 0, 0, 0.00684, 0.00684, 0.008319159999999999, 0.09628657407407407, 2021, 2),
(180, 6, 793.16, 0.914, 0.002000000000000002, 0.0004262400000000004, 0, 0, 0, 0, 0.00684, 0.00684, 0.009266240000000002, 0.1072481481481482, 2021, 2),
(181, 7, 793.24, 0.916, 0.002000000000000002, 0.00064464, 0, 0, 0, 0, 0.00684, 0.00684, 0.009484640000000003, 0.109775925925926, 2021, 2),
(182, 8, 793.3, 0.918, 0.001000000000000001, 0.000756, 0, 0, 0, 0, 0.00684, 0.00684, 0.008596000000000001, 0.09949074074074077, 2021, 2),
(183, 9, 793.34, 0.919, -0.006000000000000005, 0.0006936800000000001, 0.1368, 0, 0, 0, 0.00684, 0.14364, 0.13833368, 1.60108425925926, 2021, 2),
(184, 10, 793.1, 0.913, 0.001000000000000001, 0.0007920000000000002, 0, 0, 0, 0, 0.00684, 0.00684, 0.008632, 0.0999074074074074, 2021, 2),
(185, 11, 793.15, 0.914, 0.001000000000000001, 0.00116688, 0, 0, 0, 0, 0.00684, 0.00684, 0.009006880000000002, 0.1042462962962963, 2021, 2),
(186, 12, 793.18, 0.915, 0, 0.0010108, 0, 0, 0, 0, 0.00684, 0.00684, 0.0078508, 0.09086574074074075, 2021, 2),
(187, 13, 793.2, 0.915, 0.001000000000000001, 0.0012282, 0, 0, 0, 0, 0.00684, 0.00684, 0.0090682, 0.1049560185185185, 2021, 2),
(188, 14, 793.24, 0.916, 0.001000000000000001, 0.00177012, 0, 0, 0, 0, 0.00684, 0.00684, 0.009610120000000002, 0.1112282407407408, 2021, 2),
(189, 15, 793.28, 0.917, -0.002000000000000002, 0.00176616, 0.0936, 0, 0, 0, 0.00684, 0.10044, 0.10020616, 1.159793518518519, 2021, 2),
(190, 16, 793.2, 0.915, 0, 0.00133, 0.0072, 0, 0, 0, 0.00684, 0.01404, 0.01537, 0.1778935185185185, 2021, 2),
(191, 17, 793.18, 0.915, 0, 0.001596, 0, 0, 0, 0, 0.00684, 0.00684, 0.008436, 0.09763888888888889, 2021, 2),
(192, 18, 793.2, 0.915, 0, 0.001332, 0, 0, 0.02556, 0, 0.00684, 0.0324, 0.033732, 0.3904166666666667, 2021, 2),
(193, 19, 793.2, 0.915, -0.06200000000000006, 0.0013716, 0, 0, 0.17694, 0.17694, 0.00684, 0.36072, 0.3000915999999999, 3.473282407407407, 2021, 2),
(194, 20, 792.5, 0.853, -0.129, 0.0014256, 0, 0, 0.47448, 0.47448, 0.00684, 0.9558, 0.8282256, 9.585944444444443, 2021, 2),
(195, 21, 792.3, 0.724, -0.367, 0.0002182, 0, 0, 0.47718, 0.47718, 0.00684, 0.9611999999999999, 0.5944182, 6.879840277777777, 2021, 2),
(196, 22, 791.5, 0.357, 0.09800000000000003, 0.0004576000000000001, 0, 0, 0.44802, 0.44802, 0.00684, 0.9028799999999999, 1.0013376, 11.58955555555555, 2021, 2),
(197, 23, 791.8, 0.455, 0, 0.0009380800000000001, 0, 0, 0.4329, 0.4329, 0.00684, 0.87264, 0.8735780799999999, 10.11085740740741, 2021, 2),
(198, 24, 791.8, 0.455, 0, 0.0012792, 0, 0, 0.41886, 0.41886, 0.00684, 0.84456, 0.8458392, 9.789805555555557, 2021, 2),
(199, 25, 791.8, 0.455, 0.197, 0.0007963199999999999, 0, 0, 0.40428, 0.40428, 0.00684, 0.8153999999999999, 1.01319632, 11.72680925925926, 2021, 2),
(200, 26, 792.2, 0.652, 0.141, 0.0001867199999999993, 0, 0, 0.3357, 0.3357, 0.00684, 0.67824, 0.8194267199999999, 9.484105555555555, 2021, 2),
(201, 27, 792.4, 0.793, 0.05999999999999994, 0.0003354399999999999, 0, 0, 0.24876, 0.24876, 0.00684, 0.50436, 0.5646954399999999, 6.535826851851851, 2021, 2),
(202, 28, 792.5, 0.853, 0.05400000000000005, 0.00039552, 0, 0, 0.18558, 0.18558, 0.00684, 0.378, 0.43239552, 5.004577777777778, 2021, 2);

-- --------------------------------------------------------

--
-- Table structure for table `barage_transfertmassira`
--

CREATE TABLE IF NOT EXISTS `barage_transfertmassira` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(20) NOT NULL,
  `suivi` varchar(40) NOT NULL,
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
  `total` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_transfertmassira`
--

INSERT INTO `barage_transfertmassira` (`id`, `periode`, `suivi`, `sep`, `oct`, `nov`, `dec`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`, `total`) VALUES
(366, '2020-2021', 'Total AEPI Al Massira', 21.9, 22.5, 20.8, 21.4, 21.154, 19.475722, 0, 0, 0, 0, 0, 0, 127.3),
(367, '2020-2021', 'Total Transfert vers Massira', 16.3, 12.3, 13.1, 9.9, 0, 6.5, 19.8, 0, 0, 0, 0, 0, 66.1),
(368, '2019-2020', 'Total AEPI Al Massira', 20.5, 20.7, 19.9, 20.5, 19.8, 18.9, 20.7, 20, 21.1, 21.2, 22.1, 22.1, 247.4),
(369, '2019-2020', 'Total Transfert vers Massira', 34.3, 14.3, 18.2, 6.3, 12.7, 12.6, 80.2, 17.8, 27.6, 40.7, 19, 28.5, 312.2),
(370, '2018-2019', 'Total AEPI Al Massira', 20, 20.4, 19.4, 20.3, 20.3, 18.5, 19.7, 19, 20.3, 20.2, 21.2, 21.3, 240.5),
(371, '2018-2019', 'Total Transfert vers Massira', 53.8, 46.6, 21.1, 41.2, 23.3, 15.9, 27.7, 16.4, 38.2, 46, 60.4, 28.1, 418.7),
(372, '2017-2018', 'Total AEPI Al Massira', 19.8, 20.3, 18.8, 18.2, 18.7, 17.4, 19.4, 19.1, 20.3, 20.1, 20.8, 20.9, 233.8),
(373, '2017-2018', 'Total Transfert vers Massira', 26.7, 40.6, 12.9, 8.1, 0.1, 0.7, 39.2, 36.3, 86.7, 66.3, 77.2, 59.7, 454.6),
(374, '2016-2017', 'Total AEPI Al Massira', 21.1, 20.5, 19, 18.7, 18.5, 17, 18.8, 18.9, 19.9, 19.2, 21.6, 20.1, 233.4),
(375, '2016-2017', 'Total Transfert vers Massira', 10.3, 8.7, 13.9, 9.6, 11.8, 10.9, 2.1, 17.8, 22.8, 25.2, 39.6, 26.9, 199.6),
(376, '2015-2016', 'Total AEPI Al Massira', 20.7, 21, 19.7, 20.3, 20.5, 19.2, 20.3, 20.1, 20.9, 20.7, 21.6, 23.2, 248.3),
(377, '2015-2016', 'Total Transfert vers Massira', 7.8, 15, 9.9, 23.5, 3, 5.4, 1.2, 0, 0.3, 5.4, 11.1, 17.5, 100.1),
(378, '2014-2015', 'Total AEPI Al Massira', 20.1, 20.3, 18.8, 19.3, 19.7, 17.7, 19.7, 19.9, 20.6, 20.4, 21.5, 21.5, 239.5),
(379, '2014-2015', 'Total Transfert vers Massira', 74.7, 25.1, 30.5, 56.6, 18.3, 11, 84.5, 161.8, 67.4, 56.1, 56.3, 52, 694.2),
(380, '2013-2014', 'Total AEPI Al Massira', 20.8, 21, 19.1, 19.6, 18.9, 16.3, 19.2, 18.9, 20.1, 20.2, 21, 21, 236.2),
(381, '2013-2014', 'Total Transfert vers Massira', 96.3, 42.9, 23, 33.6, 28.9, 60.7, 30.5, 11.9, 35.5, 53.8, 78.8, 55.3, 551.1),
(382, '2012-2013', 'Total AEPI Al Massira', 20.1, 20.3, 18.3, 19.1, 19, 16.1, 19, 19.1, 20.7, 20, 21.3, 21.6, 234.7),
(383, '2012-2013', 'Total Transfert vers Massira', 11.3, 24.6, 109.7, 241.4, 114.2, 58, 291.5, 240.7, 56.7, 50.9, 49.8, 59.8, 1308.7);

-- --------------------------------------------------------

--
-- Table structure for table `barage_varapport`
--

CREATE TABLE IF NOT EXISTS `barage_varapport` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `total` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barage_varapport`
--

INSERT INTO `barage_varapport` (`id`, `periode`, `barage`, `sep`, `oct`, `nov`, `dec`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`, `total`) VALUES
(1, '2020-2021', 'Bin-El ouidane', 15.4, 10.53, 13.48, 17.79, 44.121024, 41.62885599999999, 123.59865600000002, 0, 0, 0, 0, 0, 266.5),
(2, '2020-2021', 'Hassan 1er', 5.97, 5.42, 6.45, 8.06, 14.05, 0, 0, 0, 0, 0, 0, 0, 58.3),
(3, '2020-2021', 'My-youssef', 6.57, 5.17, 9.32, 10.6, 14.72, 11.949511239999994, 0, 0, 0, 0, 0, 0, 58.3),
(4, '2020-2021', 'Ahmed El Hansali', 26.94, 21.37, 24.66, 26.75, 79.59, 39.30465375999999, 66.65698664000003, 0, 0, 0, 0, 0, 285.3),
(5, '2020-2021', 'Al Massira Enregitrés', 19.22, 21.38, 23.68, 34.12, 35.56, 25.573722000000014, 0, 0, 0, 0, 0, 0, 159.5),
(6, '2020-2021', 'Al Massira Ap. Inter.', 2.89, 9.06, 10.61, 24.21, 35.56, 19.073722000000014, -19.8, 0, 0, 0, 0, 0, 81.6),
(7, '2012-2013', 'Bin-El ouidane', 6.63, 42.54, 316.8, 193.41, 94.65, 73.53, 266.3, 283.1, 80.3, 43.2, 30.4, 16.9, 1447.8),
(8, '2012-2013', 'Hassan 1er', 19.96, 17.06, 47.52, 31.43, 19.99, 18.08, 31.3, 41.2, 19.9, 14.2, 11.2, 8.9, 280.7),
(9, '2012-2013', 'My-youssef', 3.34, 14.68, 42.99, 26.54, 16.55, 10.02, 31.7, 33, 10.6, 6.2, 6.6, 3.6, 205.8),
(10, '2012-2013', 'Ahmed El Hansali', 22.3, 87.68, 237.4, 119.78, 111.89, 79.89, 234.5, 154.5, 67.5, 45.1, 34.8, 22.9, 1218.2),
(11, '2012-2013', 'Al Massira Enregitrés', 44.26, 61.58, 277.06, 371.66, 153.85, 116.11, 419.2, 356.2, 86.5, 65.7, 73.1, 82.5, 2107.7),
(12, '2012-2013', 'Al Massira Ap. Inter.', 32.91, 37.03, 167.36, 130.3, 39.63, 58.16, 127.68, 115.47, 29.78, 14.82, 23.26, 26.66, 803.1),
(13, '2013-2014', 'Bin-El ouidane', 36.9, 12.5, 19.98, 12.8, 25.9, 79.6, 86.79, 89.5, 27.7, 16.7, 12.7, 13.8, 434.9),
(14, '2013-2014', 'Hassan 1er', 18.82, 9.35, 9.66, 9.54, 12.26, 17.11, 17.5, 20.1, 10.4, 7.9, 7.29, 6.5, 146.4),
(15, '2013-2014', 'My-youssef', 8.93, 2.45, 4.13, 7.06, 15.3, 22.73, 20.95, 14.3, 7.1, 4.07, 2.3, 1.5, 110.8),
(16, '2013-2014', 'Ahmed El Hansali', 52.09, 37.81, 56.3, 47.37, 85.8, 97.94, 64.09, 70.81, 27.39, 28.3, 13, 18.2, 599.1),
(17, '2013-2014', 'Al Massira Enregitrés', 186.8, 87.6, 54.2, 83.5, 82.6, 136.8, 64.8, 50.3, 45.5, 72.6, 108.4, 56.4, 1029.5),
(18, '2013-2014', 'Al Massira Ap. Inter.', 90.49, 44.73, 31.22, 49.9, 53.74, 76.08, 34.32, 38.38, 9.98, 18.84, 29.59, 1.11, 478.4),
(19, '2014-2015', 'Bin-El ouidane', 20.94, 10.57, 159.12, 160.46, 95.8, 107.69, 271.31, 252.35, 122.31, 55.5, 31.87, 48.76, 1336.7),
(20, '2014-2015', 'Hassan 1er', 9.59, 6.53, 54.35, 40.94, 28.53, 25.67, 63.15, 61.48, 47.05, 23.78, 18.88, 16.65, 396.6),
(21, '2014-2015', 'My-youssef', 11.42, 6.39, 144.1, 59.99, 32.37, 28.86, 88.77, 73.44, 37.71, 18.51, 13.02, 8.56, 523.1),
(22, '2014-2015', 'Ahmed El Hansali', 35.03, 29.71, 95.19, 154.72, 118.44, 100.06, 114.44, 68.91, 51.92, 45.49, 35.81, 37.4, 887.1),
(23, '2014-2015', 'Al Massira Enregitrés', 103.9, 53.16, 185.52, 179.66, 80.98, 61.7, 165.87, 193.73, 94.38, 61.33, 63.49, 73.05, 1316.8),
(24, '2014-2015', 'Al Massira Ap. Inter.', 29.24, 28.1, 155.04, 123.03, 62.63, 50.66, 81.37, 31.97, 26.99, 5.27, 7.23, 21.05, 622.6),
(25, '2015-2016', 'Bin-El ouidane', 29.38, 21.87, 13.96, 12.66, 12.15, 22.04, 89.56, 85.45, 31.51, 13.46, 9.61, 31.22, 372.9),
(26, '2015-2016', 'Hassan 1er', 14.07, 14.58, 10.79, 10.29, 9.7, 10.96, 27.1, 16.35, 12.93, 6.46, 8.26, 14.11, 155.6),
(27, '2015-2016', 'My-youssef', 6.76, 10.23, 7.97, 5.63, 5.63, 12.2, 25.72, 25.72, 15.43, 4.26, 5.15, 8.32, 133),
(28, '2015-2016', 'Ahmed El Hansali', 32.8, 33.65, 31.37, 27.44, 37.09, 39.08, 72.22, 37.56, 35.04, 22.24, 18.93, 26.07, 413.5),
(29, '2015-2016', 'Al Massira Enregitrés', 34.47, 49.19, 42.25, 31.95, 35.68, 34.32, 45.59, 29.47, 37, 18.48, 28.96, 53.83, 441.2),
(30, '2015-2016', 'Al Massira Ap. Inter.', 26.63, 34.18, 32.31, 8.47, 32.64, 28.91, 44.44, 29.47, 36.75, 13.1, 17.88, 36.32, 341.1),
(31, '2016-2017', 'Bin-El ouidane', 12.47, 25.21, 40.41, 72.57, 30.44, 59.1, 72.34, 45.18, 27.54, 22.09, 7.39, 8.6, 423.3),
(32, '2016-2017', 'Hassan 1er', 7.19, 15.07, 20.67, 15.86, 11.54, 10.77, 11.53, 18.07, 9.62, 9.11, 5.1, 6.34, 140.9),
(33, '2016-2017', 'My-youssef', 6.79, 16.35, 19.38, 19.81, 9.49, 20.34, 17.86, 18.04, 10.48, 6.78, 2.19, 3.19, 150.7),
(34, '2016-2017', 'Ahmed El Hansali', 22.83, 39.65, 71.58, 108.21, 73.9, 103.72, 53.27, 47.66, 19.1, 29.31, 13.98, 25.75, 609),
(35, '2016-2017', 'Al Massira Enregitrés', 35.32, 40.45, 56.24, 64.11, 42.9, 66.38, 33.63, 56.39, 62.29, 45.74, 59.78, 45.45, 608.7),
(36, '2016-2017', 'Al Massira Ap. Inter.', 25.02, 31.7, 42.39, 54.54, 31.06, 55.43, 31.56, 38.54, 39.51, 20.57, 20.19, 18.58, 409.1),
(37, '2017-2018', 'Bin-El ouidane', 6.13, 7.33, 4.94, 13.62, 25.66, 66.22, 358.16, 197.02, 187.83, 72.8, 34.51, 44.65, 1018.9),
(38, '2017-2018', 'Hassan 1er', 4.18, 5.76, 7.73, 6.93, 10.2, 18.22, 52.09, 38.55, 51.53, 17.68, 10.69, 17.39, 240.9),
(39, '2017-2018', 'My-youssef', 3.25, 3.71, 7.22, 6.5, 12.32, 22.91, 47.77, 48.9, 37.38, 11.04, 5.79, 11.51, 218.3),
(40, '2017-2018', 'Ahmed El Hansali', 27.68, 32.14, 28.81, 33.22, 59.21, 89.85, 301.44, 137.79, 60.32, 35.39, 26.28, 25.39, 857.5),
(41, '2017-2018', 'Al Massira Enregitrés', 44.33, 57.07, 28.54, 35.32, 37.82, 40.99, 142.99, 126.55, 149.88, 106.49, 117.52, 88.04, 975.5),
(42, '2017-2018', 'Al Massira Ap. Inter.', 17.68, 16.44, 15.62, 27.21, 37.7, 40.3, 103.75, 90.24, 63.15, 40.16, 40.32, 28.31, 520.9),
(43, '2018-2019', 'Bin-El ouidane', 59.66, 71, 129.69, 60.1, 33.42, 25.62, 27.35, 77.47, 69.18, 28.14, 18.91, 17.87, 618.4),
(44, '2018-2019', 'Hassan 1er', 24.81, 32.52, 26.12, 14.36, 11.86, 8.7, 7.79, 18.13, 16.47, 7.16, 6.46, 8.73, 183.1),
(45, '2018-2019', 'My-youssef', 20.34, 34.77, 32.44, 15.39, 8.49, 6.84, 6.11, 19.98, 8.02, 4.16, 1.94, 1.68, 160.1),
(46, '2018-2019', 'Ahmed El Hansali', 44.55, 73.42, 96.26, 54.92, 53.88, 47.06, 49.41, 66.44, 52.3, 36.07, 38.4, 26.62, 639.3),
(47, '2018-2019', 'Al Massira Enregitrés', 82.7, 105.27, 83.72, 67.3, 47.5, 36.41, 36.32, 36.62, 39.59, 56.04, 89.68, 48.08, 729.2),
(48, '2018-2019', 'Al Massira Ap. Inter.', 28.89, 58.71, 62.67, 26.05, 24.17, 20.48, 8.62, 20.22, 1.38, 10.04, 29.3, 19.96, 310.5),
(49, '2019-2020', 'Bin-El ouidane', 35.32, 14.24, 14.03, 23.75, 20.33, 18.07, 38.4, 50.34, 58.32, 28.33, 12.12, 13.23, 326.5),
(50, '2019-2020', 'Hassan 1er', 11.54, 6.47, 6.42, 9.2, 7.86, 5.83, 9.49, 7.87, 10.69, 5.27, 4.15, 5.35, 90.1),
(51, '2019-2020', 'My-youssef', 8.28, 1.88, 4.82, 9.67, 4.54, 4.33, 15.19, 7.87, 5.24, 2.13, 1.31, 1.74, 67),
(52, '2019-2020', 'Ahmed El Hansali', 24.21, 24.02, 33.16, 59.64, 38.24, 29.38, 29.77, 41.04, 32.4, 17.59, 19.6, 25.83, 374.9),
(53, '2019-2020', 'Al Massira Enregitrés', 78.74, 35.77, 32.3, 33.03, 27.32, 23.9, 116.07, 54.24, 67.01, 48.39, 27.8, 44.5, 589.1),
(54, '2019-2020', 'Al Massira Ap. Inter.', 44.45, 21.47, 14.07, 26.71, 14.615, 11.273, 35.878, 36.48, 39.45, 7.71, 8.79, 15.96, 276.9);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-04-12 14:51:10.821035', '2', 'moodii', 1, '[{\"added\": {}}]', 4, 1),
(2, '2021-04-12 14:51:48.498541', '2', 'moodii', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Superuser status\"]}}]', 4, 1),
(3, '2021-05-26 09:38:50.423599', '2', 'moodii', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]', 4, 1),
(4, '2021-05-26 09:40:01.191898', '2', 'moodii', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 1),
(5, '2021-05-26 14:01:18.219008', '3', 'fati', 1, '[{\"added\": {}}]', 4, 1),
(6, '2021-05-26 14:02:45.639296', '3', 'fati', 2, '[]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(33, 'barage', 'suivibilan'),
(35, 'barage', 'timinoutinebilanhydr'),
(34, 'barage', 'transfertmassira'),
(12, 'barage', 'varapport'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(22, 'barage', '0004_auto_20210404_1515', '2021-04-04 15:16:14.012909'),
(23, 'barage', '0005_suivibilan', '2021-04-11 20:00:08.157973'),
(24, 'barage', '0006_transfertmassira', '2021-04-30 11:35:02.612947'),
(25, 'barage', '0007_auto_20210501_1811', '2021-05-01 18:12:03.497176'),
(26, 'barage', '0008_timinoutinebilanhydr', '2021-05-09 12:20:41.409192'),
(27, 'barage', '0009_auto_20210509_1238', '2021-05-09 12:39:13.189237');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0sle5qpt90l9c42ay1utxy8c2xpovts2', '.eJxVjEEOgjAQRe_StWnoMNDi0j1naGbaqUVNSSisjHcXEha6_e-9_1aetjX7rcrip6iuyqjL78YUnlIOEB9U7rMOc1mXifWh6JNWPc5RXrfT_TvIVPNeIxELAtqILkVjGjIDNwQYEMlJn7oeJCBYDjy0nFqx4ABkL5LrrKjPF-2UN_s:1lVyDz:XA0kPjb-oakaYEEoui5ULSCX768TGJQ-A5hOEPRP1-M', '2021-04-26 15:11:39.034653'),
('2llw5x2yj78e1ct315j6nyavg5g8sro4', '.eJxVjEEOgjAQRe_StWnoMNDi0j1naGbaqUVNSSisjHcXEha6_e-9_1aetjX7rcrip6iuyqjL78YUnlIOEB9U7rMOc1mXifWh6JNWPc5RXrfT_TvIVPNeIxELAtqILkVjGjIDNwQYEMlJn7oeJCBYDjy0nFqx4ABkL5LrrKjPF-2UN_s:1lltj9:8BNMy6K7I74gFoeRP9CcbTIwfX83M0EpX7BHwRzrvy8', '2021-06-09 13:37:39.842370'),
('9mgygjj7p7m83gzl2flehcnuk9vkbstc', 'e30:1lU7wX:CcNu-VQ0PesahpcY7ZockoGUGjsLiY4ztkMs8c-tO6o', '2021-04-21 13:10:01.003333'),
('j5i5xddsbe90yfyvvcu6rhfdnjgh4g34', 'e30:1lU7wB:bdGAKlr0R8pQiismhwbXXC65WDzxrc0QVWkBg9gQ9pE', '2021-04-21 13:09:39.552540'),
('ojf8xhvq72z1qi33u6ukt24ktclfrspn', '.eJxVjEEOgjAQRe_StWnoMNDi0j1naGbaqUVNSSisjHcXEha6_e-9_1aetjX7rcrip6iuyqjL78YUnlIOEB9U7rMOc1mXifWh6JNWPc5RXrfT_TvIVPNeIxELAtqILkVjGjIDNwQYEMlJn7oeJCBYDjy0nFqx4ABkL5LrrKjPF-2UN_s:1lWI9m:7MfIz4Jh50f7KzQvm6wf4fy3BUyZCIVFmz2OgTfePaM', '2021-04-27 12:28:38.369690'),
('tuyhxvp0nnetd1kdvwpuuwylx8bfcxjm', '.eJxVjEEOgjAQRe_StWnoMNDi0j1naGbaqUVNSSisjHcXEha6_e-9_1aetjX7rcrip6iuyqjL78YUnlIOEB9U7rMOc1mXifWh6JNWPc5RXrfT_TvIVPNeIxELAtqILkVjGjIDNwQYEMlJn7oeJCBYDjy0nFqx4ABkL5LrrKjPF-2UN_s:1lgoll:-3RopcrJR8OKp_C07s1ZXftJziY21lN_CCRsKuFbtNY', '2021-05-26 13:19:21.970277'),
('wysqhz5u8txl5nfkf0fo84y3dkkkufgv', '.eJxVjMsOwiAQAP-FsyE8VgSP3vsNZJcFqRqalPZk_HdD0oNeZybzFhH3rca95zXOLK7CiNMvI0zP3IbgB7b7ItPStnUmORJ52C6nhfPrdrR_g4q9ji1Y64BNKZnQgoLArFB70i4ln5QOaJCLBxuMKRCoaBcuWiuvAlM6i88X3kY3lQ:1ldYhW:GSm4Ee3q8HLGMmMcxfuU8EM9MLYuce07iENuS3-zolc', '2021-05-17 13:33:30.210205'),
('ya5v4319fxyx7wjzfzj4ykr3j9kva2nh', 'e30:1lU7wf:OgS6y8bt1yYbOy5BIXwhXpszidtsSmh17BvztYb2feI', '2021-04-21 13:10:09.066382');

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
