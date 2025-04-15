-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 11, 2019 at 12:19 AM
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
(1, 1, 1, '2019-02-09 13:02:45', 'N', 'No connection to server.', 'IT Security team contacted.', NULL),
(2, 1, 2, '2019-02-09 13:02:45', 'Y', NULL, NULL, NULL),
(3, 2, 1, '2019-02-09 13:05:32', 'Y', NULL, NULL, NULL),
(4, 2, 2, '2019-02-09 13:05:32', 'Y', NULL, NULL, NULL),
(5, 2, 3, '2019-02-09 13:05:32', 'Y', NULL, NULL, NULL),
(6, 3, 1, '2019-02-09 13:18:50', 'Y', NULL, NULL, 'Backup of Datastoreon 10.234.17.15'),
(7, 3, 2, '2019-02-09 13:18:50', 'Y', NULL, NULL, 'Backup of HPNLon 10.234.17.37'),
(8, 3, 3, '2019-02-09 13:18:50', 'Y', NULL, NULL, 'Backup of ICAMon 10.234.171.134'),
(9, 4, 1, '2019-02-09 13:20:48', 'Y', NULL, NULL, 'Backup of Datastore on 10.234.17.15'),
(10, 4, 2, '2019-02-09 13:20:48', 'Y', NULL, NULL, 'Backup of HPNL on 10.234.17.37'),
(11, 4, 3, '2019-02-09 13:20:48', 'Y', NULL, NULL, 'Backup of ICAM on 10.234.171.134'),
(12, 5, 1, '2019-02-09 15:50:30', 'Y', NULL, NULL, 'Backup of Datastore on 10.234.17.15'),
(13, 5, 2, '2019-02-09 15:50:30', 'N', 'Password Expired.', 'Password reset IR logged.', 'Backup of HPNL on 10.234.17.37'),
(14, 5, 3, '2019-02-09 15:50:30', 'Y', NULL, NULL, 'Backup of ICAM on 10.234.171.134'),
(15, 6, 1, '2019-02-09 15:55:25', 'Y', NULL, NULL, 'Backup of Datastore on 10.234.17.15'),
(16, 6, 2, '2019-02-09 15:55:25', 'Y', NULL, NULL, 'Backup of HPNL on 10.234.17.37'),
(17, 6, 3, '2019-02-09 15:55:25', 'Y', NULL, NULL, 'Backup of ICAM on 10.234.171.134'),
(18, 7, 2, '2019-02-09 16:47:50', 'Y', NULL, NULL, 'Backup of HPNL on 10.234.17.37'),
(19, 7, 3, '2019-02-09 16:47:50', 'Y', NULL, NULL, 'Backup of ICAM on 10.234.171.134'),
(20, 8, 2, '2019-02-10 00:32:50', 'Y', NULL, NULL, 'Backup of HPNL on 10.234.17.37'),
(21, 8, 3, '2019-02-10 00:32:50', 'Y', NULL, NULL, 'Backup of ICAM on 10.234.171.134');

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
(1, 1, NULL, '2019-02-08', NULL, 'N', NULL, NULL),
(2, 2, NULL, '2019-02-09', NULL, 'N', NULL, NULL),
(3, 1, NULL, '2019-02-07', NULL, 'N', NULL, NULL),
(4, 2, 1, '2019-02-06', '2019-02-09 15:36:23', 'N', NULL, NULL),
(5, 1, 3, '2019-02-10', '2019-02-10 07:47:44', 'N', NULL, NULL),
(6, 1, NULL, '2019-02-11', NULL, 'N', NULL, NULL),
(7, 1, NULL, '2019-02-12', NULL, 'N', NULL, NULL),
(8, 3, NULL, '2019-02-13', NULL, 'N', NULL, NULL);

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
(1, 'Datastore', '10.234.17.15', 2, NULL, '2019-02-08 22:41:40', NULL, 'Y', 1, '2019-02-09 15:47:30'),
(2, 'HPNL', '10.234.17.37', 2, NULL, '2019-02-08 23:18:19', NULL, 'N', NULL, NULL),
(3, 'ICAM', '10.234.171.134', 1, NULL, '2019-02-09 12:05:12', NULL, 'N', NULL, NULL);

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
(1, 1, 'zino', '2016-07-08 12:54:50'),
(2, 1, 'zino', '2016-07-08 12:54:50'),
(3, 1, 'zino', '2016-07-08 12:55:52'),
(4, 1, 'zino', '2016-07-08 12:55:52'),
(5, 1, 'hey', '2016-07-08 12:57:57'),
(6, 1, 'hey', '2016-07-08 12:57:57'),
(7, 1, 'looool', '2016-07-08 13:00:15'),
(8, 1, 'Thank God for me.', '2016-07-08 13:01:39'),
(9, 1, 'Thank God for me.', '2016-07-08 13:11:10'),
(10, 1, 'Thank God for me.', '2016-07-08 14:25:58'),
(321, 2, 'finally here', '2016-07-13 19:56:35'),
(320, 2, 'this is me', '2016-07-13 02:01:44'),
(319, 1, 'i am here', '2016-07-12 15:23:40'),
(318, 1, 'test 21', '2016-07-11 20:28:49'),
(317, 1, 'test 20', '2016-07-11 20:26:43'),
(316, 1, 'test 19', '2016-07-11 20:20:06'),
(315, 1, 'test 18', '2016-07-11 20:19:00'),
(314, 1, 'test 17', '2016-07-11 20:18:19'),
(313, 1, 'test 16', '2016-07-11 20:18:00'),
(312, 1, 'test 15\r\n', '2016-07-11 19:58:36'),
(311, 1, 'test 14', '2016-07-11 19:58:10'),
(310, 1, 'testing 13', '2016-07-11 19:54:11'),
(309, 1, 'testing 12', '2016-07-11 19:47:26'),
(308, 1, 'testing 11', '2016-07-11 19:46:06'),
(307, 1, 'testing 10', '2016-07-11 19:41:55'),
(306, 1, 'testing 9', '2016-07-11 19:40:27'),
(305, 1, 'testing 8', '2016-07-11 19:39:33'),
(304, 1, 'testing 7', '2016-07-11 19:13:55'),
(303, 1, 'testing 6', '2016-07-11 18:33:39'),
(302, 1, 'testing 5', '2016-07-11 18:14:47'),
(301, 1, 'maybe this time', '2016-07-11 18:06:30'),
(300, 1, 'testing 4', '2016-07-11 18:01:34'),
(299, 1, 'testing 3', '2016-07-11 17:58:39'),
(298, 1, 'testing2', '2016-07-11 17:58:16'),
(297, 1, 'testing', '2016-07-11 17:35:06'),
(296, 1, 'it will happen', '2016-07-11 17:29:41'),
(295, 1, 'na wa o', '2016-07-11 17:24:23'),
(294, 1, 'me', '2016-07-11 17:23:05'),
(293, 1, 'thrill', '2016-07-11 17:22:38'),
(292, 1, 'hey', '2016-07-11 14:05:27'),
(291, 1, 'd', '2016-07-11 13:56:06'),
(290, 1, 'd', '2016-07-11 13:56:06'),
(289, 1, 'b', '2016-07-11 13:56:01'),
(288, 1, 'a', '2016-07-11 13:55:28'),
(287, 1, 'anyways', '2016-07-11 13:52:16'),
(286, 1, 'but u dont see me', '2016-07-11 13:52:06'),
(285, 1, 'i see u', '2016-07-11 13:51:54'),
(284, 1, 'its been a long time', '2016-07-11 13:51:38'),
(283, 1, 'i really want to talk', '2016-07-11 13:51:27'),
(282, 1, 'hey there', '2016-07-11 13:51:09'),
(281, 1, 'lets try again', '2016-07-11 12:17:15'),
(280, 1, 'this should work', '2016-07-11 12:15:26'),
(279, 1, 'rivers', '2016-07-11 12:13:19'),
(278, 1, 'i just cant stand it', '2016-07-11 12:05:37'),
(277, 1, 'i still remember what u did last summer!!\r\nlollll', '2016-07-11 12:05:00'),
(276, 1, 'people everywhere', '2016-07-11 12:03:53'),
(275, 1, 'i need to know', '2016-07-11 12:00:43'),
(274, 1, 'im coming to get u', '2016-07-11 12:00:05'),
(273, 1, 'hey people', '2016-07-11 11:59:32'),
(272, 1, 'holla', '2016-07-11 11:58:11'),
(271, 1, 'hiya', '2016-07-11 11:57:21'),
(270, 1, 'lolllol', '2016-07-11 11:54:17'),
(269, 1, 'lol', '2016-07-11 11:53:55'),
(268, 1, 'holla', '2016-07-11 11:20:32'),
(267, 1, 'hi\r\n\r\nim here now', '2016-07-11 10:51:38'),
(265, 1, '2', '2016-07-09 17:58:52'),
(266, 1, 'I feel like I live here alone\r\n', '2016-07-09 21:57:50'),
(263, 1, 'how', '2016-07-09 00:25:49'),
(262, 1, 'how', '2016-07-09 00:25:00'),
(261, 1, 'how', '2016-07-09 00:24:55'),
(260, 1, 'hi', '2016-07-09 00:24:40'),
(259, 1, 'hey', '2016-07-09 00:24:33'),
(258, 1, 'hey', '2016-07-09 00:23:03'),
(257, 1, 'hey', '2016-07-09 00:22:56'),
(256, 1, 'They beat their chests \r\nthey beat it in vain...', '2016-07-09 00:22:49'),
(255, 1, 'They beat their chests \r\nthey beat it in vain...', '2016-07-09 00:21:34'),
(254, 1, 'They beat their chests \r\nthey beat it in vain...', '2016-07-09 00:21:09'),
(253, 1, 'They beat their chests \r\nthey beat it in vain...', '2016-07-09 00:20:58'),
(252, 1, 'James is a warrior', '2016-07-09 00:19:57'),
(251, 1, 'Pray for paris...', '2016-07-09 00:11:54'),
(250, 1, 'a candle was lit on the table', '2016-07-08 23:41:14'),
(249, 1, 'there was a man\r\non the roof', '2016-07-08 23:34:57'),
(248, 1, 'hi\r\n', '2016-07-08 22:56:58'),
(247, 1, 'there is an oasis at the middle of the desert.\r\n\r\nthis oasis is very crucial to the survival of people passing through.', '2016-07-08 22:53:32'),
(246, 1, 'this is not good', '2016-07-08 20:55:44'),
(245, 1, 'i am here \r\n\r\nto dominate', '2016-07-08 19:40:28'),
(244, 1, '12345', '2016-07-08 17:34:42'),
(243, 1, 'this is good', '2016-07-08 17:33:03'),
(242, 1, 'hahahahahahaha', '2016-07-08 15:03:51'),
(241, 1, 'yopppie', '2016-07-08 15:03:36'),
(240, 1, 'yopppie', '2016-07-08 15:03:36'),
(239, 1, 'hehehhehehehe\r\n', '2016-07-08 15:02:58'),
(238, 1, 'i am here for u', '2016-07-08 15:01:28'),
(237, 1, 'hey u', '2016-07-08 15:01:08'),
(236, 1, 'hello hi', '2016-07-08 14:31:15'),
(322, 1, 'hi', '2019-01-28 20:57:41'),
(323, 1, 'hi hi\r\n\r\n', '2019-01-28 21:27:05'),
(324, 1, 'hi hi', '2019-01-28 21:27:14'),
(325, 1, 'hey', '2019-01-28 21:53:08'),
(326, 1, 'here\'s', '2019-01-28 21:53:19'),
(327, 1, 'hehehehe na wa o, \r\n\r\njust like that? //`` zinos\'', '2019-02-07 23:33:43'),
(328, 2, 'i don\'t know', '2019-02-08 20:30:11'),
(329, 3, 'hi\r\n', '2019-02-09 16:15:43');

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
(1, 'Ewomazino', 'Egedegbe', 'manofgod', 'eezino@gmail.com', 1, 2, '', '', 0, '2016-07-07 14:38:13'),
(2, 'Kechi', 'Nomu', 'kechi', 'kechinomu@yahoo.com', 1, 1, 'hi, i was here with you but you acted like i wasnt', 'bye', 0, '2016-07-13 02:00:25'),
(3, 'Uche', 'Nwosu', 'Cisco300$', 'nwosuchris5@gmail.com', 1, 2, 'name', 'uche', 0, '2019-02-09 16:13:47');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
