-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2021 at 12:55 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `robs_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `First Name` varchar(30) NOT NULL,
  `Last Name` varchar(30) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Position` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`First Name`, `Last Name`, `Username`, `Password`, `Position`) VALUES
('Menzi', 'Dlamini', 'Gregz', '4321', 'Cashier'),
('Naham', 'Dlamini', 'sphelele', '1234', 'Stock Manager');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `StockCode` varchar(11) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `PromotionID` varchar(50) NOT NULL,
  `Stock Code` varchar(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Discount` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `Report_id` int(11) NOT NULL,
  `Sold_Items` varchar(20) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Qty` varchar(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`Report_id`, `Sold_Items`, `Description`, `Qty`, `Price`) VALUES
(1, 'C001', 'Afrisam Cement', '3', 30),
(1, 'C002', 'Afrisam Cement', '1', 150),
(1, 'C001', 'Afrisam Cement', '1', 30),
(1, 'C001', 'Afrisam Cement', '2', 30),
(1, 'C001', 'Afrisam Cement', '1', 30),
(1, 'C001', 'Afrisam Cement', '1', 30),
(1, 'C001', 'Afrisam Cement', '1', 30);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `StockCode` varchar(20) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Usage` varchar(50) NOT NULL,
  `Quantinty` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`StockCode`, `Description`, `Usage`, `Quantinty`, `Price`) VALUES
('C002', 'ScrewDriver', 'Star Screws', 74, 5),
('C003', 'Afrisam Cement', 'General Purpose', 53, 80),
('C006', 'cement', 'tilling', 28, 89),
('C007', 'Safety_Gloves', 'Electrical', 98, 15),
('C008', 'Safety_Boots', 'Heavy_Duty', 100, 80),
('C009', 'Safety-Gloves', 'Concrete', 84, 20);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL,
  `Supplier Name` varchar(50) NOT NULL,
  `StockCode` varchar(11) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD UNIQUE KEY `OrderID` (`OrderID`),
  ADD KEY `SupplierID` (`SupplierID`),
  ADD KEY `orders_ibfk_1` (`StockCode`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`PromotionID`),
  ADD KEY `Stock Code` (`Stock Code`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`StockCode`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SupplierID`),
  ADD KEY `StockCode` (`StockCode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`StockCode`) REFERENCES `stock` (`StockCode`);

--
-- Constraints for table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`Stock Code`) REFERENCES `stock` (`StockCode`);

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`StockCode`) REFERENCES `stock` (`StockCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
