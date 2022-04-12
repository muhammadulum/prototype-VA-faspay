-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 29, 2020 at 03:12 PM
-- Server version: 10.3.27-MariaDB-0+deb10u1
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prototype_faspay`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembayaran`
--

CREATE TABLE `detail_pembayaran` (
  `id_faspay_pembayaran` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `nis` int(11) NOT NULL,
  `time_post` time NOT NULL,
  `batas_bayar` datetime NOT NULL,
  `time_respon` time NOT NULL,
  `trx_id` int(11) NOT NULL,
  `va` varchar(150) NOT NULL,
  `nominal` int(11) NOT NULL,
  `status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pembayaran`
--

INSERT INTO `detail_pembayaran` (`id_faspay_pembayaran`, `tanggal`, `nis`, `time_post`, `batas_bayar`, `time_respon`, `trx_id`, `va`, `nominal`, `status`) VALUES
(132, '2020-12-08 11:01:17', 171051043, '11:01:17', '2020-12-09 11:01:17', '11:01:17', 18340, '17105104318340', 16000, 'a'),
(133, '2020-12-08 11:39:10', 171051043, '11:39:10', '2020-12-09 11:39:10', '11:39:10', 86793, '17105104386793', 11000, 'a'),
(134, '2020-12-08 11:39:19', 171051043, '11:39:19', '2020-12-09 11:39:19', '11:39:19', 62359, '17105104362359', 11000, 'a'),
(135, '2020-12-08 11:40:20', 171051043, '11:40:20', '2020-12-09 11:40:20', '11:40:20', 75089, '17105104375089', 11000, 'a'),
(136, '2020-12-13 19:58:14', 17105169, '19:58:14', '2020-12-14 19:58:14', '19:58:14', 27053, '1710516927053', 16000, 'a'),
(137, '2020-12-23 15:27:37', 171051033, '15:27:37', '2020-12-24 15:27:37', '15:27:37', 90354, '17105103390354', 15000, 'a'),
(138, '2020-12-28 14:41:24', 1881988, '14:41:24', '2020-12-29 14:41:24', '14:41:24', 25610, '188198825610', 0, 'a'),
(139, '2020-12-28 14:42:39', 1881988, '14:42:39', '2020-12-29 14:42:39', '14:42:39', 64173, '188198864173', 16000, 'a'),
(140, '2020-12-29 10:59:16', 342, '10:59:16', '2020-12-30 10:59:16', '10:59:16', 63497, '34263497', 15000, 'a');

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'wpu123', 1, 0, 0, NULL, 1),
(2, 2, 'rahasia', 1, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `limits`
--

INSERT INTO `limits` (`id`, `uri`, `count`, `hour_started`, `api_key`) VALUES
(1, 'uri:api/mahasiswa/index:get', 1, 1605670340, 'wpu123'),
(2, 'uri:api/pembayaran/index:get', 1, 1606594982, 'rahasia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pembayaran`
--
ALTER TABLE `detail_pembayaran`
  ADD PRIMARY KEY (`id_faspay_pembayaran`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pembayaran`
--
ALTER TABLE `detail_pembayaran`
  MODIFY `id_faspay_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
