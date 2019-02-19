-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 19, 2019 at 01:35 PM
-- Server version: 5.6.41
-- PHP Version: 7.2.7

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `anna_oop`
--
CREATE DATABASE IF NOT EXISTS `anna_oop` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `anna_oop`;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `content_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `clean_content` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_menu` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `is_first_page` tinyint(1) NOT NULL DEFAULT '0',
  `lang_id` varchar(2) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
CREATE TABLE IF NOT EXISTS `dishes` (
  `dish_id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(255) COLLATE latin7_estonian_cs NOT NULL,
  `dish_description` varchar(255) COLLATE latin7_estonian_cs NOT NULL,
  `dish_price` float(4,2) NOT NULL,
  `type_id` int(100) UNSIGNED NOT NULL,
  PRIMARY KEY (`dish_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin7 COLLATE=latin7_estonian_cs;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`dish_id`, `dish_name`, `dish_description`, `dish_price`, `type_id`) VALUES
(2, 'Sealihapada ploomide ja aprikoosiga', 'sealihapada, lisand, salat, leib', 2.65, 1),
(3, 'Praetud kanakints', 'praetud kana, lisand, salat, leib', 2.50, 1),
(4, 'Hakklihakaste', 'hakklihakaste, lisand, salat, leib', 2.45, 1),
(5, 'Kartul, kaste, salat, leib', '', 1.38, 1),
(6, 'Hakklihakaste 1/2', 'hakklihakaste, lisand, salat, leib', 1.30, 1),
(7, 'Rassolnik', 'supp, hapukoor, leib', 1.10, 2),
(8, 'Rosinakisell vahukoorega', '', 1.05, 3),
(9, 'Mahl', '', 0.60, 4),
(12, 'Morss', '', 0.25, 4),
(13, 'Piim', '', 0.30, 4),
(14, 'Keefir', '', 0.39, 4);

-- --------------------------------------------------------

--
-- Table structure for table `dish_availability`
--

DROP TABLE IF EXISTS `dish_availability`;
CREATE TABLE IF NOT EXISTS `dish_availability` (
  `dish_id` int(100) UNSIGNED NOT NULL,
  `dish_date` date NOT NULL,
  KEY `dish_id` (`dish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dish_types`
--

DROP TABLE IF EXISTS `dish_types`;
CREATE TABLE IF NOT EXISTS `dish_types` (
  `type_id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `type_icon` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dish_types`
--

INSERT INTO `dish_types` (`type_id`, `type_name`, `type_icon`) VALUES
(1, 'praed', 'fa-utensils'),
(2, 'supid', 'fa-utensil-spoon'),
(3, 'magustoidud', 'fa-cookie-bite'),
(4, 'joogid', 'fa-glass-whiskey');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `sid` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_data` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `svars` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created` datetime NOT NULL,
  `changed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_ip` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  UNIQUE KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`sid`, `user_id`, `user_data`, `svars`, `created`, `changed`, `login_ip`) VALUES
('3691386433357a1189ceb613ba340d74', 0, 'a:3:{s:7:\"user_id\";i:0;s:7:\"role_id\";i:0;s:8:\"username\";s:9:\"Anonymous\";}', '', '2019-02-19 13:30:12', '2019-02-19 11:30:12', '193.40.62.14'),
('f117ebd0e6078ce0d8f429e7b48facd8', 0, 'a:3:{s:7:\"user_id\";i:0;s:7:\"role_id\";i:0;s:8:\"username\";s:9:\"Anonymous\";}', '', '2019-02-19 13:30:39', '2019-02-19 11:30:39', '193.40.62.14'),
('1761f14f7d56310137e953cbe27515fb', 0, 'a:3:{s:7:\"user_id\";i:0;s:7:\"role_id\";i:0;s:8:\"username\";s:9:\"Anonymous\";}', '', '2019-02-19 13:31:31', '2019-02-19 11:31:31', '193.40.62.14'),
('5a4109b5d682e31d8c751ba7e17bde92', 0, 'a:3:{s:7:\"user_id\";i:0;s:7:\"role_id\";i:0;s:8:\"username\";s:9:\"Anonymous\";}', '', '2019-02-19 13:34:26', '2019-02-19 11:34:26', '193.40.62.14'),
('c7f4a393ca1cfd3fe44666d70102d2e7', 0, 'a:3:{s:7:\"user_id\";i:0;s:7:\"role_id\";i:0;s:8:\"username\";s:9:\"Anonymous\";}', '', '2019-02-19 13:29:10', '2019-02-19 11:29:10', '193.40.62.14'),
('d16a6072f65597cdc0e824f99e6a0ea4', 0, 'a:3:{s:7:\"user_id\";i:0;s:7:\"role_id\";i:0;s:8:\"username\";s:9:\"Anonymous\";}', '', '2019-02-19 13:21:25', '2019-02-19 11:21:25', '193.40.62.14'),
('35484ca42562f5230b6376c56300472d', 0, 'a:3:{s:7:\"user_id\";i:0;s:7:\"role_id\";i:0;s:8:\"username\";s:9:\"Anonymous\";}', '', '2019-02-19 13:18:37', '2019-02-19 11:18:37', '193.40.62.14'),
('e780f65c948d563ef75c52506adc0713', 0, 'a:3:{s:7:\"user_id\";i:0;s:7:\"role_id\";i:0;s:8:\"username\";s:9:\"Anonymous\";}', '', '2019-02-19 13:19:00', '2019-02-19 11:19:00', '193.40.62.14'),
('de3a56c03f78d45dbc7a87b892a339bb', 0, 'a:3:{s:7:\"user_id\";i:0;s:7:\"role_id\";i:0;s:8:\"username\";s:9:\"Anonymous\";}', '', '2019-02-19 13:19:17', '2019-02-19 11:19:17', '193.40.62.14'),
('b3d16731cae00430f1b47fa36992db6a', 0, 'a:3:{s:7:\"user_id\";i:0;s:7:\"role_id\";i:0;s:8:\"username\";s:9:\"Anonymous\";}', '', '2019-02-19 13:18:01', '2019-02-19 11:18:01', '193.40.62.14'),
('306a733729e8926088e97bd74e8759f8', 0, 'a:3:{s:7:\"user_id\";i:0;s:7:\"role_id\";i:0;s:8:\"username\";s:9:\"Anonymous\";}', '', '2019-02-19 13:15:22', '2019-02-19 11:15:22', '193.40.62.14'),
('d1f3b13afc802b1b70e1447af230239b', 0, 'a:3:{s:7:\"user_id\";i:0;s:7:\"role_id\";i:0;s:8:\"username\";s:9:\"Anonymous\";}', '', '2019-02-19 13:14:41', '2019-02-19 11:14:41', '193.40.62.14'),
('25752188104dee20a185a69c2aaea3e1', 0, 'a:3:{s:7:\"user_id\";i:0;s:7:\"role_id\";i:0;s:8:\"username\";s:9:\"Anonymous\";}', '', '2019-02-19 13:12:18', '2019-02-19 11:12:18', '193.40.62.14');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `changed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `dish_types` (`type_id`);

--
-- Constraints for table `dish_availability`
--
ALTER TABLE `dish_availability`
  ADD CONSTRAINT `dish_availability_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`dish_id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;