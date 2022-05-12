-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220423.6d54ac471a
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2022 at 05:49 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electrogrid`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing_table`
--

CREATE TABLE `billing_table` (
  `billID` int(11) NOT NULL,
  `billName` varchar(30) NOT NULL,
  `billAddress` varchar(100) NOT NULL,
  `billUnits` int(20) NOT NULL,
  `billUnitPrice` decimal(6,2) NOT NULL,
  `billTotPrice` decimal(6,2) NOT NULL,
  `billDate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `billing_table`
--

INSERT INTO `billing_table` (`billID`, `billName`, `billAddress`, `billUnits`, `billUnitPrice`, `billTotPrice`, `billDate`) VALUES
(1, 'Walter', '65 C, Alawwa.', 110, '18.50', '3000.00', '23/4/2022'),
(3, 'Sandun', 'kalubowila', 120, '15.00', '2560.00', '2022.1.4');

-- --------------------------------------------------------

--
-- Table structure for table `payment_form`
--

CREATE TABLE `payment_form` (
  `payment_id` int(11) NOT NULL,
  `payment_code` varchar(10) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `month_of_bill` varchar(10) NOT NULL,
  `bill_amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_form`
--

INSERT INTO `payment_form` (`payment_id`, `payment_code`, `customer_id`, `month_of_bill`, `bill_amount`, `date`) VALUES
(5, 'p001', 'c001', 'April', '1500.00', '2022-05-02'),
(6, 'p002', 'c002', 'March', '2000.00', '2022-04-26');

-- --------------------------------------------------------

--
-- Table structure for table `power_rate`
--

CREATE TABLE `power_rate` (
  `rateID` int(11) NOT NULL,
  `numberOfUnits` varchar(30) NOT NULL,
  `DomesticPrice` decimal(10,2) NOT NULL,
  `CommercialPrice` decimal(10,2) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `power_rate`
--

INSERT INTO `power_rate` (`rateID`, `numberOfUnits`, `DomesticPrice`, `CommercialPrice`, `Date`) VALUES
(6, '31 - 60', '8.00', '12.00', '2022-04-22'),
(7, '61 - 90', '12.00', '24.00', '2022-04-23'),
(8, '61 - 90', '12.00', '24.00', '2022-04-23'),
(9, '61 - 90', '12.00', '25.00', '2022-04-23'),
(10, '91 - 120', '17.00', '34.00', '2022-04-24');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address` varchar(300) NOT NULL,
  `contactno` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `address`, `contactno`) VALUES
(27, 'Thakshi', 'aha11', 'Dehiwala', '0766453456'),
(31, 'Sadeesha', '1234sx', 'Matara', '0766453111');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing_table`
--
ALTER TABLE `billing_table`
  ADD PRIMARY KEY (`billID`);

--
-- Indexes for table `payment_form`
--
ALTER TABLE `payment_form`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `power_rate`
--
ALTER TABLE `power_rate`
  ADD PRIMARY KEY (`rateID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing_table`
--
ALTER TABLE `billing_table`
  MODIFY `billID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_form`
--
ALTER TABLE `payment_form`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `power_rate`
--
ALTER TABLE `power_rate`
  MODIFY `rateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



