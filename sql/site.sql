-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2019 at 04:48 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `site`
--

-- --------------------------------------------------------

--
-- Table structure for table `navmenu`
--

CREATE TABLE `navmenu` (
  `navMenuId` int(10) UNSIGNED NOT NULL,
  `pageId` int(10) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `menuOrder` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `navmenu`
--

INSERT INTO `navmenu` (`navMenuId`, `pageId`, `label`, `menuOrder`) VALUES
(1, 1, 'Home', 1),
(2, 3, 'Products', 2),
(3, 2, 'About', 3),
(4, 4, 'Create Account', 4);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `pageId` int(10) UNSIGNED NOT NULL,
  `pageKey` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `filename` varchar(255) DEFAULT NULL,
  `data_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`pageId`, `pageKey`, `title`, `content`, `filename`, `data_modified`) VALUES
(1, 'home', 'Home', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus gravida lectus a erat elementum tempor. Donec eget erat vitae sem gravida gravida sed in erat. Proin non elit quis augue porta tincidunt. In hac habitasse platea dictumst. Fusce at orci varius, porta nibh eget, eleifend nibh. Aliquam erat volutpat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam neque urna, aliquam et enim eget, laoreet pulvinar tortor. Pellentesque facilisis vehicula purus at ornare. Nam semper dui et tincidunt gravida. Vivamus ut sagittis sapien, tempor rhoncus dolor. Duis pretium diam sed eleifend aliquam. Curabitur a auctor nibh, non dignissim tortor. Duis nulla lorem, lacinia ut metus vel, luctus mattis nunc.</p>', 'home.php', '2019-03-22 16:34:31'),
(2, 'about', 'About Us', '<p>Pellentesque ut dui vitae dui aliquam dapibus. Nullam placerat orci justo. Fusce maximus enim sed neque dictum, non luctus ligula bibendum. Donec sit amet fringilla ante. Donec mollis leo non maximus pulvinar. In sollicitudin turpis eget porta eleifend. Quisque eu aliquet arcu.</p>', 'about.php', '2019-03-22 14:49:11'),
(3, 'products', 'Products', '<a href=\"https://google.com\">Google</a>', 'products.php', '2019-03-22 14:49:14'),
(4, 'create_account', 'Create Acccount', '', 'create_account.php', '2019-03-26 13:39:09'),
(5, 'login', 'Login', 'Enter your username and password', 'login.php', '2019-03-26 13:39:38');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(10) UNSIGNED NOT NULL,
  `username` varchar(60) NOT NULL,
  `passHash` varchar(60) NOT NULL,
  `cookieHash` varchar(60) NOT NULL,
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `username`, `passHash`, `cookieHash`, `dateModified`) VALUES
(3, 'francisco', '$2y$10$uMICMy4wLMr8YRLv2yF8MOJaDeDaVFxB/HzcZw1NMEC8ezkBJQHLS', '', '2019-03-26 14:47:07'),
(4, 'anna', '$2y$10$bboSU5NB6b71Rh5iYjPULerBMRNqV9Iv9fyHjD4pN2WkFH6wemHgC', '', '2019-03-26 14:47:50'),
(5, 'Luc', '$2y$10$XW7Jtu2LY4HGs.HRuDPcdefuCfZehoFCJuBDN7wiw6KIUOvUNjNUK', '', '2019-03-26 15:02:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `navmenu`
--
ALTER TABLE `navmenu`
  ADD PRIMARY KEY (`navMenuId`),
  ADD KEY `pageId` (`pageId`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`pageId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `user_name` (`username`),
  ADD UNIQUE KEY `uname_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `navmenu`
--
ALTER TABLE `navmenu`
  MODIFY `navMenuId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `pageId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `navmenu`
--
ALTER TABLE `navmenu`
  ADD CONSTRAINT `navmenu_ibfk_1` FOREIGN KEY (`pageId`) REFERENCES `page` (`pageId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
