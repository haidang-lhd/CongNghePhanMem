-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.4-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for webshop
CREATE DATABASE IF NOT EXISTS `webshop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webshop`;

-- Dumping structure for table webshop.book
CREATE TABLE IF NOT EXISTS `book` (
  `bkid` int(11) NOT NULL AUTO_INCREMENT,
  `bkname` varchar(45) NOT NULL,
  `bkemail` varchar(45) NOT NULL,
  `bkphone` varchar(45) NOT NULL,
  `bktime` datetime NOT NULL,
  `bknum` int(11) NOT NULL,
  `booking` varchar(45) NOT NULL,
  `bkmemo` text DEFAULT NULL,
  PRIMARY KEY (`bkid`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- Dumping data for table webshop.book: ~41 rows (approximately)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`bkid`, `bkname`, `bkemail`, `bkphone`, `bktime`, `bknum`, `booking`, `bkmemo`) VALUES
	(2, 'ss', 'aaa', 's', '2020-01-01 10:10:10', 1, 'aaa', 'hoho'),
	(3, 'ss', 'aaa', 's', '2020-01-01 10:10:10', 3, 'aaa', 'gdfgf'),
	(5, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(6, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 3, 'sss', '89879789'),
	(7, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 3, 'sss', '985685'),
	(8, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 4, 'sss', '985685'),
	(9, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 4, 'sss', '985685'),
	(10, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 4, 'sss', '985685'),
	(11, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 3, 'sss', '985685'),
	(12, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 4, 'sss', '985685'),
	(13, 'a', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 5, 'sss', '985685'),
	(14, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 3, 'sss', '985685'),
	(15, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 3, 'sss', '985685'),
	(16, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 4, 'sss', '985685'),
	(17, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 4, 'sss', '985685'),
	(18, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 4, 'sss', '985685'),
	(19, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 2, 'sss', '985685'),
	(20, 'ddd', '0986393130', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(21, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 4, 'sss', '985685'),
	(22, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 2, 'sss', '985685'),
	(23, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 3, 'sss', '985685'),
	(24, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 3, 'sss', '985685'),
	(25, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 3, 'sss', '985685'),
	(26, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 3, 'sss', '985685'),
	(27, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 3, 'sss', '985685'),
	(28, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 3, 'sss', '985685'),
	(29, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 3, 'sss', '985685'),
	(30, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(31, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(32, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(33, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(34, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(35, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(36, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(37, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(38, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(39, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(40, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(41, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 2, 'sss', '985685'),
	(42, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 1, 'sss', '985685'),
	(64, 'ddd', 'bichchiit1701@gmail.com', 'hhh', '2020-01-01 10:10:10', 2, 'a', '985685');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;

-- Dumping structure for table webshop.cateory
CREATE TABLE IF NOT EXISTS `cateory` (
  `ctgid` int(11) NOT NULL AUTO_INCREMENT,
  `ctname` varchar(45) NOT NULL,
  `service` char(1) NOT NULL,
  PRIMARY KEY (`ctgid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table webshop.cateory: ~4 rows (approximately)
/*!40000 ALTER TABLE `cateory` DISABLE KEYS */;
INSERT INTO `cateory` (`ctgid`, `ctname`, `service`) VALUES
	(1, 'All', 't'),
	(2, 'Drinks', 't'),
	(3, 'Food', 't'),
	(4, 'Dinner', 't');
/*!40000 ALTER TABLE `cateory` ENABLE KEYS */;

-- Dumping structure for table webshop.contact
CREATE TABLE IF NOT EXISTS `contact` (
  `coid` int(11) NOT NULL AUTO_INCREMENT,
  `coname` varchar(45) NOT NULL,
  `priphone` varchar(45) NOT NULL,
  `subphone` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `unused` bit(1) NOT NULL,
  `opening` varchar(45) DEFAULT NULL,
  `weekday` varchar(45) DEFAULT NULL,
  `weekend` varchar(45) DEFAULT NULL,
  `aboutus` varchar(45) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `logitude` double DEFAULT NULL,
  PRIMARY KEY (`coid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webshop.contact: ~0 rows (approximately)
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;

-- Dumping structure for table webshop.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `muid` int(11) NOT NULL AUTO_INCREMENT,
  `ctgid` int(11) NOT NULL,
  `muname` varchar(45) NOT NULL,
  `intro` varchar(45) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `price` double NOT NULL,
  `currency` char(3) DEFAULT NULL,
  PRIMARY KEY (`muid`),
  KEY `FK_menu_ctgid_cateory_ctgid` (`ctgid`),
  CONSTRAINT `FK_menu_ctgid_cateory_ctgid` FOREIGN KEY (`ctgid`) REFERENCES `cateory` (`ctgid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Dumping data for table webshop.menu: ~14 rows (approximately)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`muid`, `ctgid`, `muname`, `intro`, `details`, `price`, `currency`) VALUES
	(1, 1, 'Special Drink1 ', 'images/img-01.jpg', 'Sed id magna vitae eros sagittis euismod.', 222, '1'),
	(2, 1, 'Special Drink2', 'images/img-02.jpg', 'Sed id magna vitae eros sagittis euismod.', 1222, '2'),
	(3, 1, 'Special Drink3', 'images/img-03.jpg', 'Sed id magna vitae eros sagittis euismod.', 2323, '3'),
	(4, 1, 'Special Drink4', 'images/img-04.jpg', 'Sed id magna vitae eros sagittis euismod.', 333, '4'),
	(5, 1, 'Special Drink5', 'images/img-05.jpg', 'Sed id magna vitae eros sagittis euismod.', 222, '5'),
	(6, 1, 'Special Drink6', 'images/img-06.jpg', 'Sed id magna vitae eros sagittis euismod.', 222, '6'),
	(7, 1, 'Special Drink7', 'images/img-07.jpg', 'Sed id magna vitae eros sagittis euismod.', 133, '7'),
	(8, 1, 'Special Drink8', 'images/img-08.jpg', 'Sed id magna vitae eros sagittis euismod.', 2323, '8'),
	(9, 2, 'Special Drink1', 'images/img-01.jpg', 'Sed id magna vitae eros sagittis euismod.', 11, '9'),
	(10, 2, 'Special Drink3', 'images/img-02.jpg', 'Sed id magna vitae eros sagittis euismod.', 11, '10'),
	(11, 2, 'Special Drink3', 'images/img-03.jpg', 'Sed id magna vitae eros sagittis euismod.', 11, '11'),
	(12, 3, 'Special Drink1', 'images/img-01.jpg', 'Sed id magna vitae eros sagittis euismod.', 11, '12'),
	(13, 3, 'Special Drink2', 'images/img-02.jpg', 'Sed id magna vitae eros sagittis euismod.', 11, '13'),
	(14, 4, 'Special Drink1', 'images/img-01.jpg', 'Sed id magna vitae eros sagittis euismod.', 2, 'd');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table webshop.post
CREATE TABLE IF NOT EXISTS `post` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `byname` varchar(45) DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `content` text DEFAULT NULL,
  `visible` bit(1) DEFAULT NULL,
  `tagid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FK_post_tagid_tag_tagid` (`tagid`),
  CONSTRAINT `FK_post_tagid_tag_tagid` FOREIGN KEY (`tagid`) REFERENCES `tag` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webshop.post: ~0 rows (approximately)
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

-- Dumping structure for table webshop.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `tagid` int(11) NOT NULL AUTO_INCREMENT,
  `tgname` varchar(45) NOT NULL,
  PRIMARY KEY (`tagid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table webshop.tag: ~3 rows (approximately)
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`tagid`, `tgname`) VALUES
	(1, 'null'),
	(2, 'gogi'),
	(3, 'gogi');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
