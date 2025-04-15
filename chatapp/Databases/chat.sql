-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2016 at 06:30 PM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--
CREATE DATABASE IF NOT EXISTS `chat` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `chat`;
-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `msg` varchar(600) NOT NULL,
  `msg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(236, 1, 'hello hi', '2016-07-08 14:31:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `sname` varchar(30) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `status` int(1) NOT NULL,
  `category` int(1) NOT NULL,
  `squest` varchar(50) NOT NULL,
  `sans` varchar(30) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `cr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `sname`, `pwd`, `email`, `status`, `category`, `squest`, `sans`, `creator`, `cr_time`) VALUES
(1, 'Ewomazino', 'Egedegbe', 'manofgod', 'eezino@gmail.com', 1, 2, '', '', 0, '2016-07-07 14:38:13'),
(2, 'Kechi', 'Nomu', 'kechi', 'kechinomu@yahoo.com', 1, 1, 'hi, i was here with you but you acted like i wasnt', 'bye', 0, '2016-07-13 02:00:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
