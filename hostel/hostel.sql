-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2025 at 02:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostel`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `guests` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `room_type`, `full_name`, `email`, `phone`, `check_in`, `check_out`, `guests`, `created_at`) VALUES
(7, 'AC Room', 'MD Tanvir', 'siamahmed8687@gmail.com', '01756049292', '2025-10-01', '2025-10-31', 11, '2025-10-22 09:35:06'),
(8, 'VIP Room', 'MD Tanvir', 'mdtanvir3999@gmail.com', '01756049292', '2025-10-18', '2025-10-29', 2, '2025-10-22 09:57:27'),
(9, 'VIP Room', 'MD Tanvir', 'mdtanvir3999@gmail.com', '01756049292', '2025-10-18', '2025-10-29', 2, '2025-10-22 09:57:35'),
(10, 'VIP Room', 'MD Tanvir', 'mdtanvir3999@gmail.com', '01756049292', '2025-10-23', '2025-10-31', 3, '2025-10-22 10:03:11');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `fullname`, `email`, `phone`, `gender`, `password`) VALUES
(1, 'nirob', 'nirobmolla@gmail.com', '01780156150', 'male', '$2y$10$3houfJYsc3tjfxp4EpyjKOZ23eoGjQPbqS0kjF9pxOLont3Zf1Ou6'),
(2, 'nirob molla', 'nirob@gmail.com', '01780156150', 'male', '$2y$10$UDNdX5oGeBPZjbO6I0.Bru4YT7z83VGbr8guAuI2qLPaxtVe.Jpmq'),
(3, 'nur', 'nurnobi@gmail.com', '0178888888', 'male', '$2y$10$GC1dhtInwtQfuZrKn.n28OsQuAgfZRO.gUl0.0Cqg1KhVJxI276H2'),
(5, 'sharna', 'sharnaisit@gmail.com', '01756049292', 'female', '$2y$10$xXwXadC/IvwcytxV1UFdbus8U6GvAtrOEG3H59fmTeQ8b5J29Ziw2'),
(6, 'MD tanvir ahmed ', 'mdtanvir3999@gmail.com', '01756049292', 'male', '$2y$10$Bj2oIbvTA8a8QQBLXsDRXuFHV7IdqtP3QCb76iNACRqQnM7b55PRW'),
(15, 'tanim', 'm...9@gmail.com', '01756049292', 'male', '$2y$10$WhxkvKNzXaDHBqzJmhIKPenXQNJxAxmseKHpiFuPkrtXj2LMC.aqi');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `subject`, `message`, `created_at`) VALUES
(10, 'md tanvir ahamed', 'mdtanvir3999@gmail.com', 'ckfs', 'kdksf', '2025-10-08 14:03:07'),
(11, 'md tanvir ahamed', 'mdtanvir3999@gmail.com', 'ckfs', 'kdksf', '2025-10-08 14:04:32'),
(12, 'Md Tanvir Ahamed ', 'mdtanvir3999@gmail.com', 'nuy8exi7', 'dtjzwsrdtyl', '2025-10-08 14:06:39'),
(13, '', '', '', '', '2025-10-15 09:10:25'),
(14, 'sjlwe', 'dklnfcwe@gmail.com', 'jlc', 'jc,wdc', '2025-10-15 09:12:07'),
(15, 'Md Tanvir Ahamed ', 'mdtanvir58697@gmail.com', 'nuy8exi7', 'MXLCV', '2025-10-21 14:07:19'),
(16, '', '', '', '', '2025-11-01 14:49:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
