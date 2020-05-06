-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 06, 2020 at 06:11 PM
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
-- Database: `healthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `creditcardinfo`
--

DROP TABLE IF EXISTS `creditcardinfo`;
CREATE TABLE IF NOT EXISTS `creditcardinfo` (
  `CCID` int(10) NOT NULL AUTO_INCREMENT,
  `cardNo` varchar(16) NOT NULL,
  `cvv` varchar(3) NOT NULL,
  `ccHolderName` varchar(30) NOT NULL,
  `ccExpDate` varchar(10) NOT NULL,
  `paymentID` varchar(10) NOT NULL,
  PRIMARY KEY (`CCID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `creditcardinfo`
--

INSERT INTO `creditcardinfo` (`CCID`, `cardNo`, `cvv`, `ccHolderName`, `ccExpDate`, `paymentID`) VALUES
(1, '8888888811111111', '456', 'Bha', '02/8', '4'),
(2, '1542369854786321', '127', 'Bhanuka', '02/28', '3'),
(3, '2222211111111', '456', 'Bhanuka', '87/8', '6'),
(4, '1542369854786321', '127', 'IB', '02/28', '4'),
(5, '2222211111111', '456', 'xyz', '87/8', '6'),
(6, '1234561234567890', '545', 'bhanuka', '2021/05/12', '24');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `paymentID` int(10) NOT NULL AUTO_INCREMENT,
  `patientID` int(10) NOT NULL,
  `hospitalID` int(10) NOT NULL,
  `docID` int(10) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `appointmentID` varchar(10) NOT NULL,
  `paymentStatus` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`paymentID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`paymentID`, `patientID`, `hospitalID`, `docID`, `amount`, `appointmentID`, `paymentStatus`, `date`) VALUES
(4, 1230, 1100, 1, 'Rs3500', '112', 'PAID', '21-04-2020 09:11:24');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
