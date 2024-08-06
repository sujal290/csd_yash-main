-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2024 at 08:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csd_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `id_emp`
--

CREATE TABLE `id_emp` (
  `id` int(6) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `gen` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `cadre_id` tinyint(4) NOT NULL,
  `desig_id` int(5) NOT NULL,
  `internal_desig_id` int(4) NOT NULL,
  `group_id` int(5) NOT NULL,
  `user_type` char(9) NOT NULL,
  `telephone_no` varchar(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1,
  `is_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_deleted` enum('YES','NO') NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `id_emp`
--

INSERT INTO `id_emp` (`id`, `first_name`, `middle_name`, `last_name`, `gen`, `dob`, `mobile_no`, `email_id`, `cadre_id`, `desig_id`, `internal_desig_id`, `group_id`, `user_type`, `telephone_no`, `username`, `password`, `status`, `is_created`, `is_deleted`) VALUES
(2, 'Jane', 'Mary', 'Johnson', 'Female', '1992-05-15', '9876543211', 'jane.johnson@example.com', 2, 2, 2, 2, 'admin', '1234567891', 'admin', 'admin', 1, '2024-07-09 05:43:44', 'NO'),
(1, 'John', 'Doe', 'Smith', 'Male', '1990-01-01', '9876543210', 'john.doe@example.com', 1, 1, 1, 1, 'user', '1234567890', 'user', 'user', 1, '2024-07-09 05:43:44', 'NO'),
(3, 'ane', 'Mary', 'Johnson', 'Female', '1992-05-15', '9876543211', 'jane.johnson@example.com', 2, 2, 2, 2, 'user', '1234567891', 'user2', 'user2', 1, '2024-07-09 05:43:44', 'NO'),
(4, 'Kane', 'Mary', 'Johnson', 'Female', '1992-05-15', '9876543211', 'jane.johnson@example.com', 2, 2, 2, 2, 'user', '1234567891', 'user3', 'user3', 1, '2024-07-09 05:43:44', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `sno` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `item_image` varchar(400) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` decimal(10,2) DEFAULT 0.00,
  `date_&_time_added` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Remarks` text DEFAULT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `limitt` decimal(10,2) DEFAULT NULL,
  `limit1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`sno`, `itemId`, `name`, `category`, `description`, `item_image`, `price`, `stock_quantity`, `date_&_time_added`, `Remarks`, `Unit`, `limitt`, `limit1`) VALUES
(53, 100, 'a', 'C3', 'a', 'cat-1.png', 5.00, 50.00, '2024-08-05 23:44:02', 'a', 'Kg', 20.00, 15),
(54, 102, 'b', 'C1', 'b', 'default.png', 25.00, 100.00, '2024-08-05 23:45:45', 'b', 'Kg', 25.00, 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `sno` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date_and_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`sno`, `user_id`, `order_id`, `status`, `date_and_time`) VALUES
(7, 1, 871641, 1, '2024-08-04 23:22:42'),
(8, 1, 989817, 2, '2024-08-04 23:48:59'),
(9, 1, 697963, 1, '2024-08-05 13:44:21');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `sno` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `price` decimal(10,3) DEFAULT NULL,
  `date_and_time` datetime DEFAULT current_timestamp(),
  `Unit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`sno`, `order_id`, `item_id`, `item_name`, `quantity`, `price`, `date_and_time`, `Unit`) VALUES
(15, 871641, 105, 'Parle-G', 50.00, 55.000, '2024-08-04 23:22:42', 'Packets'),
(16, 989817, 100, 'apple', 3.00, 50.000, '2024-08-04 23:48:59', 'Kg'),
(17, 989817, 102, 'orange', 3.00, 60.000, '2024-08-04 23:48:59', 'Kg'),
(18, 697963, 105, 'Parle-G', 2.00, 55.000, '2024-08-05 13:44:21', 'Packets');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `id_emp`
--
ALTER TABLE `id_emp`
  ADD PRIMARY KEY (`username`,`desig_id`),
  ADD KEY `fk_id_emp_id_desig` (`desig_id`),
  ADD KEY `fk_id_emp_group_id` (`group_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `itemId` (`itemId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
