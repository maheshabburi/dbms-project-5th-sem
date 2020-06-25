-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 07, 2019 at 01:30 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_support`
--

DROP TABLE IF EXISTS `chat_support`;
CREATE TABLE IF NOT EXISTS `chat_support` (
  `txt_id` int(20) NOT NULL,
  `client` varchar(20) NOT NULL,
  `executive` varchar(30) NOT NULL DEFAULT 'Not Allotted',
  `txt_from` varchar(30) NOT NULL,
  `txt_to` varchar(30) NOT NULL,
  `txt` varchar(200) NOT NULL,
  `instance` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donate`
--

DROP TABLE IF EXISTS `donate`;
CREATE TABLE IF NOT EXISTS `donate` (
  `restaurant` varchar(30) NOT NULL,
  `item_name` varchar(30) NOT NULL,
  `item_quan` varchar(30) NOT NULL,
  `instance` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `restaurant_id` varchar(40) NOT NULL,
  `sno` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `price` int(10) NOT NULL,
  `discount` int(3) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`sno`,`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`restaurant_id`, `sno`, `name`, `price`, `discount`, `description`) VALUES
('kms@gmail.com', 1, 'chicken biryani', 500, 10, 'nonveg and veg'),
('ashwins@gmail.com', 2, 'idly vada', 600, 10, 'veg'),
('apna@gmail.com', 3, 'otthappam', 200, 10, 'nonveg and veg'),
('kfc@gmail.com', 4, 'chicken wings', 800, 20, 'nonveg and veg'),
('marvel@gmail.com', 5, 'apple juice', 850, 20, 'nonveg anf veg'),
('kms@gmail.com', 6, 'barbeque chicken', 200, 100, 'nonveg'),
('ashwins@gmail.com', 7, 'chilli idly', 60, 10, 'veg'),
('ashwins@gmail.com', 8, 'gopi masala', 60, 10, 'eggish');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(20) NOT NULL AUTO_INCREMENT,
  `order_from` varchar(40) NOT NULL,
  `order_by` varchar(40) NOT NULL,
  `rider` varchar(40) NOT NULL,
  `rider_status` varchar(30) NOT NULL DEFAULT 'pending',
  `items` varchar(100) NOT NULL,
  `total` float NOT NULL,
  `instance` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(100) NOT NULL,
  `otp` varchar(5) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'placed',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100026 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_from`, `order_by`, `rider`, `rider_status`, `items`, `total`, `instance`, `address`, `otp`, `status`) VALUES
(100000, 'ashwins@gmail.com', 'mahesh@nitt.edu', 'Not Alloted (Refresh Page)', 'not allotted', '2 3', 1710, '2019-10-28 22:56:09', '', '1802', 'placed'),
(100001, 'kfc@gmail.com', 'mahesh@nitt.edu', 'babu@gmail.com', 'pending', '4 3', 2040, '2019-10-28 23:07:13', '', '1190', 'placed'),
(100002, 'kms@gmail.com', 'mahesh@nitt.edu', 'babu@gmail.com', 'pending', '1 1 6 1', 485, '2019-10-28 23:11:08', '', '1860', 'placed'),
(100003, 'ashwins@gmail.com', 'mahesh@nitt.edu', 'babu@gmail.com', 'pending', '2 10 7 10 8 8', 6726, '2019-10-28 23:12:36', '', '1995', 'placed'),
(100004, 'kfc@gmail.com', 'mahesh@nitt.edu', 'babu@gmail.com', 'pending', '4 1', 680, '2019-10-28 23:18:07', '', '1939', 'placed'),
(100005, 'ashwins@gmail.com', 'mahesh@nitt.edu', 'babu@gmail.com', 'pending', '7 1 8 1', 114, '2019-10-28 23:21:26', '', '1176', 'placed'),
(100006, 'ashwins@gmail.com', 'mahesh@nitt.edu', 'babu@gmail.com', 'pending', '7 1 8 1', 114, '2019-10-28 23:24:44', '', '1663', 'placed'),
(100007, 'kfc@gmail.com', 'mahesh@nitt.edu', 'babu@gmail.com', 'pending', '4 1', 680, '2019-10-28 23:25:20', '', '1666', 'placed'),
(100008, 'kfc@gmail.com', 'mahesh@nitt.edu', 'babu@gmail.com', 'pending', '4 1', 680, '2019-10-28 23:30:02', '', '1912', 'placed'),
(100009, 'kfc@gmail.com', 'mahesh@nitt.edu', 'babu@gmail.com', 'pending', '4 1', 680, '2019-10-28 23:33:38', '', '1427', 'placed'),
(100010, 'kms@gmail.com', 'mahesh@nitt.edu', 'babu@gmail.com', 'pending', '1 1', 475, '2019-10-28 23:35:35', '', '1415', 'placed'),
(100011, 'ashwins@gmail.com', 'gopi@gmail.com', 'babu@gmail.com', 'pending', '2 1 7 1 8 1', 684, '2019-10-28 23:36:36', '', '1859', 'placed'),
(100012, 'kfc@gmail.com', 'gopi@gmail.com', 'babu@gmail.com', 'pending', '4 1', 680, '2019-10-28 23:37:42', '', '1255', 'placed'),
(100013, 'kfc@gmail.com', 'gopi@gmail.com', 'babu@gmail.com', 'pending', '4 1', 680, '2019-10-28 23:38:35', '', '1854', 'placed'),
(100014, 'kfc@gmail.com', 'gopi@gmail.com', 'babu@gmail.com', 'pending', '4 1', 680, '2019-10-28 23:40:56', '', '1361', 'placed'),
(100015, 'kfc@gmail.com', 'gopi@gmail.com', 'babu@gmail.com', 'pending', '4 1', 680, '2019-10-28 23:42:02', '', '1432', 'placed'),
(100017, 'kms@gmail.com', 'gopi@gmail.com', 'babu@gmail.com', 'pending', '6 1', 10, '2019-10-28 23:43:41', '', '1196', 'placed'),
(100018, 'kms@gmail.com', 'gopi@gmail.com', 'babu@gmail.com', 'pending', '1 1', 475, '2019-10-28 23:45:05', '', '1006', 'placed'),
(100019, 'kms@gmail.com', 'gopi@gmail.com', 'babu@gmail.com', 'pending', '1 1', 475, '2019-10-28 23:46:10', '', '1976', 'placed'),
(100020, 'kfc@gmail.com', 'gopi@gmail.com', 'babu@gmail.com', 'pending', '4 1', 680, '2019-10-28 23:46:21', '', '1772', 'placed'),
(100021, 'kfc@gmail.com', 'gopi@gmail.com', 'mahi@gmail.com', 'pending', '4 1', 680, '2019-10-28 23:46:40', '', '1815', 'placed'),
(100022, 'kfc@gmail.com', 'mahesh@nitt.edu', 'babu@gmail.com', 'pending', '4 1', 680, '2019-10-28 23:50:55', '', '1500', 'placed'),
(100023, 'kms@gmail.com', 'mahesh@nitt.edu', 'mahi@gmail.com', 'pending', '1 1 6 1', 485, '2019-10-28 23:54:23', '', '1994', 'placed'),
(100024, 'ashwins@gmail.com', 'mahesh@nitt.edu', 'shankar@gmail.com', 'pending', '7 1', 57, '2019-11-07 17:58:46', '', '1442', 'placed'),
(100025, 'ashwins@gmail.com', 'mahesh@nitt.edu', 'babu@gmail.com', 'pending', '7 1', 57, '2019-11-07 18:55:55', '', '1090', 'placed');

-- --------------------------------------------------------

--
-- Table structure for table `recommend`
--

DROP TABLE IF EXISTS `recommend`;
CREATE TABLE IF NOT EXISTS `recommend` (
  `res_name` varchar(500) NOT NULL,
  `item_name` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `first` int(20) NOT NULL,
  `second` int(20) NOT NULL,
  `third` int(20) NOT NULL,
  `fourth` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE IF NOT EXISTS `restaurants` (
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `wallet` float NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL DEFAULT 'Offline',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`name`, `password`, `email`, `phone`, `address`, `description`, `wallet`, `status`) VALUES
('apna', 'apna', 'apna@@gmail.com', '2252525252', 'nitt', 'nonveg and veg', 5000, 'Online'),
('ashwins', 'ashwins', 'ashwins@gmail.com', '9989798979', 'trichy', 'veg', 5000, 'Online'),
('kfc', 'kfc', 'kfc@gmail.com', '4556456456', 'trichy', 'nonveg and ved', 50000, 'Online'),
('kms', 'kms', 'kms@gmail.com', '9969696996', 'trichy', 'nonveg and veg', 5000, 'Online'),
('marvel', 'marvel', 'marvel@gmail.com', '1121212121', 'trichy', 'nonveg and veg', 5000, 'Offline');

-- --------------------------------------------------------

--
-- Table structure for table `riders`
--

DROP TABLE IF EXISTS `riders`;
CREATE TABLE IF NOT EXISTS `riders` (
  `name` varchar(30) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Offline',
  `streak` int(10) NOT NULL DEFAULT '0',
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `riders`
--

INSERT INTO `riders` (`name`, `phone`, `address`, `status`, `streak`, `email`) VALUES
('babu', '9894561231', 'trichy', 'Online', 8, 'babu@gmail.com'),
('bingu', '9638527411', 'trichy', 'Offline', 4, 'bingu@gmail.com'),
('mahi', '9959595959', 'trichy', 'Online', 7, 'mahi@gmail.com'),
('shankar', '7889989898', 'trichy', 'Online', 7, 'shankar@gmail.com'),
('sunny', '5545645644', 'trichy', 'Online', 7, 'sunny@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
CREATE TABLE IF NOT EXISTS `stats` (
  `ip_address` varchar(30) NOT NULL,
  `coordinates` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'visited',
  `client` varchar(30) NOT NULL DEFAULT 'visit',
  `instance` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats`
--

INSERT INTO `stats` (`ip_address`, `coordinates`, `city`, `status`, `client`, `instance`) VALUES
('::1', '', '', 'visited', 'visit', '2019-10-28 22:53:28'),
('::1', '', '', 'visited', 'visit', '2019-10-28 22:53:41'),
('::1', '', '', 'visited', 'visit', '2019-10-28 22:54:11'),
('::1', '', '', 'login', 'mahesh@nitt.edu', '2019-10-28 22:54:11'),
('::1', '', '', 'visited', 'visit', '2019-10-28 23:36:22'),
('::1', '', '', 'visited', 'visit', '2019-10-28 23:36:31'),
('::1', '', '', 'login', 'gopi@gmail.com', '2019-10-28 23:36:31'),
('::1', '', '', 'visited', 'visit', '2019-10-28 23:47:28'),
('::1', '', '', 'visited', 'visit', '2019-10-28 23:47:35'),
('::1', '', '', 'visited', 'visit', '2019-10-28 23:47:40'),
('::1', '', '', 'visited', 'visit', '2019-10-28 23:47:57'),
('::1', '', '', 'login', 'mahesh@nitt.edu', '2019-10-28 23:47:57'),
('::1', '', '', 'visited', 'visit', '2019-11-07 18:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
CREATE TABLE IF NOT EXISTS `support` (
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(100) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(100) NOT NULL,
  `wallet` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `password`, `email`, `phone`, `address`, `wallet`) VALUES
('gopi', 'gopi', 'gopi@gmail.com', '9989898989', 'nitt', 50000),
('harish', 'harish', 'harish@gmail.com', '9959895645', 'nitt', 50000),
('mahesh', 'mahesh', 'mahesh@nitt.edu', '1324567891', 'nitt', 50000),
('ravi', 'ravi', 'ravi@gmail.com', '1234569875', 'nitt', 50000),
('surya', 'surya', 'surya@gmail.com', '1234567987', 'nitt', 50000);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
