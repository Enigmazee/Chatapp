-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 11, 2019 at 12:24 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prod`
--
CREATE DATABASE IF NOT EXISTS `prod` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `prod`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `GenerateDailyRegister`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateDailyRegister` (IN `bdate` DATE, IN `buser` INT)  BEGIN
DECLARE header INT;

INSERT INTO backup_header (backup_by, backup_date, del_flg) VALUES (buser,bdate,'N');

SELECT max(id) INTO header from backup_header where backup_by = buser and backup_date= bdate and del_flg = 'N';

INSERT INTO backup_details (header_id, location_id, backup_time, successful, text) select header, id, sysdate(), 'Y', CONCAT('Backup of ',name,' on ',ip) from backup_location where del_flg = 'N';

END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `GetUser`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `GetUser` (`buser` INT) RETURNS VARCHAR(50) CHARSET latin1 BEGIN

DECLARE user varchar(50);

SELECT concat(fname,', ', sname) INTO user from users where id = buser;

RETURN USER;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `backup_details`
--

DROP TABLE IF EXISTS `backup_details`;
CREATE TABLE IF NOT EXISTS `backup_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `header_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `backup_time` datetime NOT NULL,
  `successful` char(1) NOT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `actions` varchar(100) DEFAULT NULL,
  `text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `backup_details`
--

INSERT INTO `backup_details` (`id`, `header_id`, `location_id`, `backup_time`, `successful`, `comments`, `actions`, `text`) VALUES
(1, 1, 1, '2019-02-09 13:02:45', 'N', 'No connection to server.', 'IT Security team contacted.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `backup_header`
--

DROP TABLE IF EXISTS `backup_header`;
CREATE TABLE IF NOT EXISTS `backup_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `backup_by` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `backup_date` date NOT NULL,
  `approved_date` datetime DEFAULT NULL,
  `del_flg` char(1) NOT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backup_date` (`backup_date`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `backup_header`
--

INSERT INTO `backup_header` (`id`, `backup_by`, `approved_by`, `backup_date`, `approved_date`, `del_flg`, `deleted_by`, `deleted_date`) VALUES
(1, 1, NULL, '2019-02-08', NULL, 'N', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `backup_location`
--

DROP TABLE IF EXISTS `backup_location`;
CREATE TABLE IF NOT EXISTS `backup_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `del_flg` char(1) NOT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `backup_location`
--

INSERT INTO `backup_location` (`id`, `name`, `ip`, `created_by`, `updated_by`, `created_date`, `last_update_date`, `del_flg`, `deleted_by`, `deleted_date`) VALUES
(1, 'Datastore', '10.10.100.100', 1, NULL, '2019-02-08 22:41:40', NULL, 'Y', 1, '2019-02-09 15:47:30');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `msg` varchar(600) NOT NULL,
  `msg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=330 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `user_id`, `msg`, `msg_time`) VALUES
(1, 1, 'Hello', '2016-07-08 12:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `movt_details`
--

DROP TABLE IF EXISTS `movt_details`;
CREATE TABLE IF NOT EXISTS `movt_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `header_id` int(11) NOT NULL,
  `tape_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movt_header`
--

DROP TABLE IF EXISTS `movt_header`;
CREATE TABLE IF NOT EXISTS `movt_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` int(11) NOT NULL,
  `destination` int(11) NOT NULL,
  `raised_by` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `raised_date` datetime NOT NULL,
  `approved_date` datetime DEFAULT NULL,
  `del_flg` char(1) NOT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tape_details`
--

DROP TABLE IF EXISTS `tape_details`;
CREATE TABLE IF NOT EXISTS `tape_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_no` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `location_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `del_flg` char(1) NOT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `s_no` (`s_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tape_location`
--

DROP TABLE IF EXISTS `tape_location`;
CREATE TABLE IF NOT EXISTS `tape_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `del_flg` char(1) NOT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) NOT NULL,
  `sname` varchar(30) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `status` int(1) NOT NULL,
  `category` int(1) NOT NULL,
  `squest` varchar(50) NOT NULL,
  `sans` varchar(30) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `cr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `sname`, `pwd`, `email`, `status`, `category`, `squest`, `sans`, `creator`, `cr_time`) VALUES
(1, 'John', 'Doe', 'testpass', 'test@gmail.com', 1, 2, '', '', 0, '2016-07-07 14:38:13');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
