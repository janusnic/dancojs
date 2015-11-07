-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 04, 2014 at 03:10 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `codex_posts`
--

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(5) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image`, `order`, `created`, `modified`, `status`) VALUES
(1, '2014_the_amazing_spider_man_2.jpg', 1, '2014-10-02 00:00:00', '2014-10-02 00:00:00', 1),
(2, 'ampeli_alisa-other.jpg', 7, '2014-10-02 00:00:00', '2014-10-02 00:00:00', 1),
(3, 'aston-martin-36a.jpg', 11, '2014-10-02 00:00:00', '2014-10-02 00:00:00', 1),
(4, 'autumn_landscape.jpg', 4, '2014-10-02 00:00:00', '2014-10-02 00:00:00', 1),
(5, 'baby-198a.jpg', 5, '2014-10-02 00:00:00', '2014-10-02 00:00:00', 1),
(6, 'emily_asher_in_beautiful_creatures.jpg', 8, '2014-10-02 00:00:00', '2014-10-02 00:00:00', 1),
(7, 'happy_child_girl-wallpaper.jpg', 3, '2014-10-02 00:00:00', '2014-10-02 00:00:00', 1),
(8, 'Hollywood-Beautiful-Celebrities-Wallpapers.jpg', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(9, 'hot_mandee_leslie-wide.jpg', 10, '2014-10-02 00:00:00', '2014-10-02 00:00:00', 1),
(10, 'macro_nature.jpg', 12, '2014-10-02 00:00:00', '2014-10-02 00:00:00', 1),
(11, 'miscellaneous-babes-64a.jpg', 2, '2014-10-02 00:00:00', '2014-10-02 00:00:00', 1),
(12, 'places-177a.jpg', 6, '2014-10-02 00:00:00', '2014-10-02 00:00:00', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
