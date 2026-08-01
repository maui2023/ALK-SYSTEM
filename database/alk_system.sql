-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2026 at 05:30 AM
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
-- Database: `alk_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `pangkat` varchar(100) DEFAULT NULL,
  `tahap_pangkat` int(11) DEFAULT 99,
  `susunan_pangkat` int(11) DEFAULT 99,
  `no_anggota` varchar(50) NOT NULL,
  `bahagian` enum('MARKAS','TADBIR','BLK','BBK','PNPL','AWAM') NOT NULL,
  `jawatan` varchar(100) DEFAULT NULL,
  `no_ic` varchar(20) DEFAULT NULL,
  `no_telefon` varchar(20) DEFAULT NULL,
  `status` enum('aktif','tidak_aktif') DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `nama`, `pangkat`, `tahap_pangkat`, `susunan_pangkat`, `no_anggota`, `bahagian`, `jawatan`, `no_ic`, `no_telefon`, `status`, `created_at`, `gambar`) VALUES
(6, 'DATO\' MOHAMAD NOORLIZAM BIN SHAMSUDDIN', 'BRIG JEN', 4, 99, '3005141', 'MARKAS', 'KOMANDAN', '', '019-2415141', 'aktif', '2026-07-09 16:39:43', NULL),
(8, 'AHMAD SAFUAN BIN JAAFAR', 'LT KOL', 6, 99, '3009806', 'MARKAS', 'PEGAWAI MEMERINTAH', '', '', 'aktif', '2026-07-09 16:45:01', NULL),
(9, 'SYED AZMI BIN SYED JAFFAR', 'MEJ', 7, 99, '3006723', 'MARKAS', 'PS 2 ATUR TURUS', '', '010-4093047', 'aktif', '2026-07-09 16:47:04', NULL),
(10, 'MAHAZEAN BINTI MAT LAWI', 'LT KDR TLDM', 7, 99, 'N/403589', 'MARKAS', 'PS 2 TADBIR', '', '011-63353589', 'aktif', '2026-07-09 16:48:13', NULL),
(11, 'AWANGKU MOHAMMAD HAFIZ BIN AWANGKU BAGUL', 'KAPT', 8, 99, '3015096', 'MARKAS', 'AJUTAN', '', '014-5995440', 'aktif', '2026-07-09 16:49:10', NULL),
(12, 'AMAR UZAIR BIN HANIZAN', 'KAPT', 8, 99, '3013704', 'MARKAS', 'PEGAWAI TADBIR', '', '019-3598113', 'aktif', '2026-07-09 16:49:52', NULL),
(13, 'NOORSYAHIDDAWATI BINTI ABDULLAH SANI', 'MEJ', 7, 99, '3010652', 'BBK', 'PS 2 PENGURUSAN', '', '011-39908664', 'aktif', '2026-07-09 16:52:32', NULL),
(14, 'MOHD SANIN BIN SUPARMAN', 'MEJ', 7, 99, '3008484', 'BLK', 'KETUA JURULATIH', '', '013-4208484', 'aktif', '2026-07-09 16:54:10', NULL),
(15, 'ARIEF RAHMAN HAKIM BIN MOHD ALI', 'MEJ', 7, 99, '3006531', 'PNPL', 'KETUA BAHAGIAN PNPL', '', '016-9124689', 'aktif', '2026-07-09 16:55:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catatan_tidak_hadir`
--

CREATE TABLE `catatan_tidak_hadir` (
  `id` int(11) NOT NULL,
  `kehadiran_id` int(11) NOT NULL,
  `sebab` varchar(255) NOT NULL,
  `lokasi` enum('luar_pasukan','dalam_pasukan') DEFAULT 'luar_pasukan',
  `tarikh_mula` date NOT NULL,
  `tarikh_tamat` date NOT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `catatan_tidak_hadir`
--

INSERT INTO `catatan_tidak_hadir` (`id`, `kehadiran_id`, `sebab`, `lokasi`, `tarikh_mula`, `tarikh_tamat`, `catatan`, `created_at`) VALUES
(9, 32, 'Attend C', 'dalam_pasukan', '2026-07-31', '2026-08-01', '', '2026-07-31 02:38:14'),
(10, 33, 'Cuti', 'luar_pasukan', '2026-07-30', '2026-07-31', '', '2026-07-31 04:15:15');

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran`
--

CREATE TABLE `kehadiran` (
  `id` int(11) NOT NULL,
  `anggota_id` int(11) NOT NULL,
  `tarikh` date NOT NULL,
  `status` enum('hadir','tidak_hadir') NOT NULL,
  `jenis` varchar(10) DEFAULT NULL,
  `dikemaskini_oleh` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`id`, `anggota_id`, `tarikh`, `status`, `jenis`, `dikemaskini_oleh`, `created_at`) VALUES
(31, 12, '2026-07-31', 'hadir', NULL, 1, '2026-07-31 02:30:46'),
(32, 11, '2026-07-31', 'tidak_hadir', NULL, 1, '2026-07-31 02:38:14'),
(33, 10, '2026-07-31', 'tidak_hadir', NULL, 1, '2026-07-31 04:15:15');

-- --------------------------------------------------------

--
-- Table structure for table `log_aktiviti`
--

CREATE TABLE `log_aktiviti` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `aksi` varchar(255) NOT NULL,
  `butiran` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log_aktiviti`
--

INSERT INTO `log_aktiviti` (`id`, `user_id`, `aksi`, `butiran`, `created_at`) VALUES
(1, 1, 'Tambah Row Penyata', 'Row: Cuti | Kategori: luar_pasukan', '2026-05-18 06:47:45'),
(2, 1, 'Tambah User', 'Username: user01 | Role: user | Bahagian: MARKAS', '2026-05-18 06:49:09'),
(3, 1, 'Tambah Anggota', 'Nama: KAPT FARHAN | No: 3017362 | Bahagian: MARKAS', '2026-05-18 06:59:22'),
(4, 1, 'Rekod Kehadiran', 'Anggota ID: 1 | Status: Hadir | Tarikh: 2026-05-18', '2026-05-18 06:59:35'),
(5, 1, 'Tambah Anggota', 'Nama: NAIM | No: 3017440 | Bahagian: BLK', '2026-05-18 07:01:02'),
(6, 1, 'Rekod Kehadiran', 'Anggota ID: 2 | Status: Hadir | Tarikh: 2026-05-18', '2026-05-18 07:01:13'),
(7, 1, 'Tambah User', 'Username: user02 | Role: user | Bahagian: BLK', '2026-05-18 07:01:54'),
(8, 1, 'Reset Password (Request)', 'Username: user02', '2026-05-18 07:02:43'),
(9, 1, 'Reset Password', 'Username: user02', '2026-05-18 07:03:48'),
(10, 1, 'Rekod Kehadiran', 'Anggota ID: 1 | Status: Hadir | Tarikh: 2026-05-18', '2026-05-18 07:14:58'),
(11, 1, 'Rekod Kehadiran', 'Anggota ID: 2 | Status: Hadir | Tarikh: 2026-05-18', '2026-05-18 07:15:00'),
(12, 1, 'Tambah User', 'Username: viewer01 | Role: viewer | Bahagian: MARKAS', '2026-05-19 04:12:16'),
(13, 1, 'Reset Password (Request)', 'Username: viewer01', '2026-05-19 04:13:24'),
(14, 1, 'Tambah Column Penyata', 'Column: MARKAS', '2026-05-19 04:23:45'),
(15, 1, 'Tambah Column Penyata', 'Column: BLK', '2026-05-19 04:23:56'),
(16, 1, 'Tambah Column Penyata', 'Column: BBK', '2026-05-19 04:24:05'),
(17, 1, 'Tambah Column Penyata', 'Column: BBK', '2026-05-19 04:24:41'),
(18, 1, 'Tambah Column Penyata', 'Column: BBK', '2026-05-19 04:26:07'),
(19, 1, 'Tambah Column Penyata', 'Column: BBK', '2026-05-19 04:26:17'),
(20, 1, 'Tambah Column Penyata', 'Column: BBK', '2026-05-19 04:29:35'),
(21, 1, 'Tambah Column', 'Column: BBK', '2026-05-19 04:48:19'),
(22, 1, 'Simpan Penyata', 'Tarikh: 2026-05-19', '2026-05-19 04:48:34'),
(23, 1, 'Rekod Kehadiran', 'Anggota ID: 1 | Status: Hadir | Tarikh: 2026-05-19', '2026-05-19 04:51:38'),
(24, 1, 'Rekod Kehadiran', 'Anggota ID: 2 | Status: Hadir | Tarikh: 2026-05-19', '2026-05-19 04:51:41'),
(25, 1, 'Rekod Kehadiran', 'Anggota ID: 2 | Status: Hadir | Tarikh: 2026-05-19', '2026-05-19 04:51:42'),
(26, 1, 'Tambah User', 'Username: user03 | Role: user | Bahagian: BBK', '2026-05-19 04:52:41'),
(27, 1, 'Padam Column', 'Column ID: 5', '2026-05-19 07:41:02'),
(28, 1, 'Padam Column', 'Column ID: 6', '2026-05-19 07:41:06'),
(29, 1, 'Rekod Kehadiran', 'Anggota ID: 1 | Status: Hadir | Tarikh: 2026-05-20', '2026-05-20 00:27:10'),
(30, 1, 'Rekod Kehadiran', 'Anggota ID: 2 | Status: Hadir | Tarikh: 2026-05-20', '2026-05-20 00:27:11'),
(31, 1, 'Edit Anggota', 'ID: 2 | Nama: NAIM', '2026-05-20 03:51:50'),
(32, 1, 'Edit Anggota', 'ID: 2 | Nama: NAIM', '2026-05-20 03:53:12'),
(33, 1, 'Edit Anggota', 'ID: 2 | Nama: NAIM', '2026-05-20 03:56:47'),
(34, 1, 'Edit Anggota', 'ID: 2 | Nama: NAIM', '2026-05-20 04:01:20'),
(35, 1, 'Edit Anggota', 'ID: 2 | Nama: NAIM', '2026-05-20 04:03:03'),
(36, 1, 'Edit Anggota', 'ID: 2 | Nama: NAIM', '2026-05-20 04:03:23'),
(37, 1, 'Edit Anggota', 'ID: 2 | Nama: NAIM', '2026-05-20 04:04:00'),
(38, 1, 'Buang Gambar', 'ID: 2', '2026-05-20 04:04:39'),
(39, 1, 'Buang Gambar', 'ID: 2', '2026-05-20 04:05:34'),
(40, 1, 'Edit Anggota', 'ID: 2 | Nama: NAIM', '2026-05-20 04:06:19'),
(41, 1, 'Edit Anggota', 'ID: 1 | Nama: KAPT FARHAN', '2026-05-20 04:06:25'),
(42, 1, 'Edit Anggota', 'ID: 2 | Nama: NAIM', '2026-05-20 04:07:02'),
(43, 1, 'Edit Anggota', 'ID: 1 | Nama: KAPT FARHAN', '2026-05-20 04:07:28'),
(44, 1, 'Tambah Anggota', 'Nama: LT AMIRUL | No: 3017475 | Bahagian: BBK', '2026-05-20 04:09:17'),
(45, 1, 'Edit Anggota', 'ID: 1 | Nama: KAPT FARHAN', '2026-05-20 04:34:07'),
(46, 1, 'Edit Anggota', 'ID: 1 | Nama: KAPT FARHAN', '2026-05-20 04:34:17'),
(47, 1, 'Rekod Kehadiran', 'Anggota ID: 1 | Status: Hadir | Tarikh: 2026-05-20', '2026-05-20 04:35:00'),
(48, 1, 'Rekod Kehadiran', 'Anggota ID: 2 | Status: Hadir | Tarikh: 2026-05-20', '2026-05-20 04:35:01'),
(49, 1, 'Rekod Kehadiran', 'Anggota ID: 2 | Status: Hadir | Tarikh: 2026-05-20', '2026-05-20 04:35:02'),
(50, 1, 'Rekod Kehadiran', 'Anggota ID: 3 | Status: Hadir | Tarikh: 2026-05-20', '2026-05-20 04:35:03'),
(51, 1, 'Padam Column', 'Column ID: 4', '2026-05-20 04:35:13'),
(52, 1, 'Padam Column', 'Column ID: 7', '2026-05-20 04:35:16'),
(53, 1, 'Padam Column', 'Column ID: 8', '2026-05-20 04:35:20'),
(54, 1, 'Rekod Kehadiran', 'Anggota ID: 1 | Status: Tidak Hadir | Sebab: Cuti', '2026-05-21 03:40:59'),
(55, 1, 'Padam Anggota', 'ID: 1', '2026-05-21 03:41:58'),
(56, 1, 'Padam Anggota', 'ID: 1', '2026-05-21 04:07:04'),
(57, 1, 'Edit Anggota', 'ID: 2 | Nama: NAIM', '2026-05-21 04:36:44'),
(58, 1, 'Edit Anggota', 'ID: 3 | Nama: LT AMIRUL', '2026-05-21 04:41:25'),
(59, 1, 'Edit Anggota', 'ID: 2 | Nama: NAIM', '2026-05-21 04:41:26'),
(60, 1, 'Edit Anggota', 'ID: 2 | Nama: NAIM', '2026-05-21 04:42:23'),
(61, 1, 'Edit Anggota', 'ID: 2 | Nama: NAIM', '2026-05-21 04:42:45'),
(62, 1, 'Edit Anggota', 'ID: 3 | Nama: LT AMIRUL', '2026-05-21 04:45:26'),
(63, 1, 'Edit Anggota', 'ID: 3 | Nama: LT AMIRUL', '2026-05-21 14:45:21'),
(64, 2, 'Tambah Column', 'Column: AWAM', '2026-06-04 08:08:44'),
(65, 1, 'Rekod Kehadiran', 'Anggota ID: 3 | Status: Hadir | Tarikh: 2026-06-08', '2026-06-08 09:26:05'),
(66, 1, 'Rekod Kehadiran', 'Anggota ID: 2 | Status: Hadir | Tarikh: 2026-06-08', '2026-06-08 09:26:07'),
(67, 1, 'Tambah User', 'Username: USER001 | Role: user | Bahagian: PNPL', '2026-06-08 09:27:13'),
(68, 1, 'Simpan Penyata', 'Tarikh: 2026-07-09', '2026-07-09 08:16:57'),
(69, 1, 'Simpan Penyata', 'Tarikh: 2026-07-09', '2026-07-09 08:18:06'),
(70, 1, 'Simpan Penyata', 'Tarikh: 2026-07-09', '2026-07-09 08:18:15'),
(71, 1, 'Simpan Penyata', 'Tarikh: 2026-07-09', '2026-07-09 08:18:41'),
(72, 1, 'Tambah Row', 'Row: Kursus | Kategori: luar_pasukan', '2026-07-09 08:36:41'),
(73, 1, 'Rekod Kehadiran', 'Anggota ID: 3 | Status: Hadir | Tarikh: 2026-07-09', '2026-07-09 08:37:35'),
(74, 1, 'Rekod Kehadiran', 'Anggota ID: 2 | Status: Hadir | Tarikh: 2026-07-09', '2026-07-09 08:37:37'),
(75, 1, 'Tambah Column', 'Column: PNPL', '2026-07-09 08:38:18'),
(76, 1, 'Delete User', 'User ID: ', '2026-07-09 09:09:30'),
(77, 1, 'Delete User', 'User ID: ', '2026-07-09 09:14:32'),
(78, 1, 'Reset Password', 'Username: user02', '2026-07-09 09:27:06'),
(79, 1, 'Delete User', 'User ID: 3', '2026-07-09 09:28:08'),
(80, 1, 'Delete User', 'User ID: 3', '2026-07-09 09:47:14'),
(81, 1, 'Tambah Anggota', 'Nama: KPL DIN | No: 376666 | Bahagian: BBK', '2026-07-09 09:51:21'),
(82, 1, 'Edit Anggota', 'ID: 4 | Nama: KPL DIN', '2026-07-09 09:51:47'),
(83, 1, 'Edit Anggota', 'ID: 3 | Nama: LK AMIRUL', '2026-07-09 09:54:15'),
(84, 1, 'Edit Anggota', 'ID: 3 | Nama: LT AMIRUL', '2026-07-09 09:54:25'),
(85, 1, 'Edit Anggota', 'ID: 3 | Nama: LT AMIRUL', '2026-07-09 10:36:18'),
(86, 1, 'Tambah User', 'Username: VIEWER05 | Role: viewer | Bahagian: AWAM', '2026-07-09 10:39:39'),
(87, 1, 'Rekod Kehadiran', 'Anggota ID: 4 | Status: Hadir | Tarikh: 2026-07-09', '2026-07-09 11:04:14'),
(88, 1, 'Rekod Kehadiran', 'Anggota ID: 4 | Status: Hadir | Tarikh: 2026-07-09', '2026-07-09 11:50:11'),
(89, 1, 'Edit Anggota', 'ID: 4 | Nama: KPL DIN', '2026-07-09 11:51:41'),
(90, 1, 'Edit Anggota', 'ID: 4 | Nama: KPL DIN', '2026-07-09 11:51:51'),
(91, 1, 'Tambah User', 'Username: USER002 | Role: user | Bahagian: MARKAS', '2026-07-09 11:53:08'),
(92, 1, 'Reset Password (Request)', 'Username: viewer01', '2026-07-09 11:59:09'),
(93, 1, 'Tambah User', 'Username: viewer02 | Role: viewer | Bahagian: MARKAS', '2026-07-09 12:00:03'),
(94, 1, 'Reset Password (Request)', 'Username: viewer01', '2026-07-09 12:02:41'),
(95, 1, 'Delete User', 'User ID: 9', '2026-07-09 15:27:46'),
(96, 1, 'Delete User', 'User ID: 8', '2026-07-09 15:27:48'),
(97, 1, 'Delete User', 'User ID: 7', '2026-07-09 15:27:50'),
(98, 1, 'Delete User', 'User ID: 6', '2026-07-09 15:27:52'),
(99, 1, 'Delete User', 'User ID: 5', '2026-07-09 15:27:54'),
(100, 1, 'Delete User', 'User ID: 4', '2026-07-09 15:27:56'),
(101, 1, 'Tambah User', 'Username: viewer01 | Role: viewer | Bahagian: MARKAS', '2026-07-09 15:29:02'),
(102, 1, 'Reset Password (Request)', 'Username: viewer01', '2026-07-09 15:30:06'),
(103, 1, 'Padam Anggota', 'ID: 4', '2026-07-09 15:31:25'),
(104, 1, 'Padam Anggota', 'ID: 3', '2026-07-09 15:31:28'),
(105, 1, 'Padam Anggota', 'ID: 2', '2026-07-09 15:31:31'),
(106, 1, 'Tambah Anggota', 'Pangkat: Kapten | No: 3017440 | Nama: naim | Bahagian: MARKAS', '2026-07-09 16:04:16'),
(107, 1, 'Edit Anggota', 'ID: 5 | Pangkat: Kapten | No: 3017440 | Nama: naim', '2026-07-09 16:04:36'),
(108, 1, 'Edit Anggota', 'ID: 5 | Pangkat: Kapten | No: 3017440 | Nama: naim', '2026-07-09 16:05:06'),
(109, 1, 'Rekod Kehadiran', 'Anggota ID: 5 | Status: Hadir | Tarikh: 2026-07-09', '2026-07-09 16:08:49'),
(110, 1, 'Edit Anggota', 'ID: 5 | Pangkat: Kapten | No: 376456 | Nama: Rodjudin', '2026-07-09 16:17:48'),
(111, 1, 'Tambah Anggota', 'Pangkat: Brig Jen | No: 3005141 | Nama: DATO\' MOHAMAD NOORLIZAM BIN SHAMSUDDIN | Bahagian: MARKAS', '2026-07-09 16:39:43'),
(112, 1, 'Tambah Anggota', 'Pangkat: KOL | No: 3007374 | Nama: ZAM AZHARI BIN ZAINUDI | Bahagian: MARKAS', '2026-07-09 16:41:07'),
(113, 1, 'Tambah Anggota', 'Pangkat: LT KOL | No: 3009806 | Nama: AHMAD SAFUAN BIN JAAFAR | Bahagian: MARKAS', '2026-07-09 16:45:01'),
(114, 1, 'Tambah Anggota', 'Pangkat: MEJ | No: 3006723 | Nama: SYED AZMI BIN SYED JAFFAR | Bahagian: MARKAS', '2026-07-09 16:47:04'),
(115, 1, 'Tambah Anggota', 'Pangkat: LT KDR TLDM | No: N/403589 | Nama: MAHAZEAN BINTI MAT LAWI | Bahagian: MARKAS', '2026-07-09 16:48:13'),
(116, 1, 'Tambah Anggota', 'Pangkat: KAPT | No: 3015096 | Nama: AWANGKU MOHAMMAD HAFIZ BIN AWANGKU BAGUL | Bahagian: MARKAS', '2026-07-09 16:49:10'),
(117, 1, 'Tambah Anggota', 'Pangkat: KAPT | No: 3013704 | Nama: AMAR UZAIR BIN HANIZAN | Bahagian: MARKAS', '2026-07-09 16:49:52'),
(118, 1, 'Tambah Anggota', 'Pangkat: MEJ | No: 3010652 | Nama: NOORSYAHIDDAWATI BINTI ABDULLAH SANI | Bahagian: BBK', '2026-07-09 16:52:32'),
(119, 1, 'Tambah Anggota', 'Pangkat: MEJ | No: 3008484 | Nama: MOHD SANIN BIN SUPARMAN | Bahagian: BLK', '2026-07-09 16:54:10'),
(120, 1, 'Tambah Anggota', 'Pangkat: MEJ | No: 3006531 | Nama: ARIEF RAHMAN HAKIM BIN MOHD ALI | Bahagian: PNPL', '2026-07-09 16:55:30'),
(121, 1, 'Rekod Kehadiran', 'Anggota ID: 10 | Status: Tidak Hadir | Sebab: Kuarantin', '2026-07-09 17:02:34'),
(122, 1, 'Padam Anggota', 'ID: 5', '2026-07-09 17:13:24'),
(123, 1, 'Rekod Kehadiran', 'Anggota ID: 10 | Status: Hadir | Tarikh: 2026-07-09', '2026-07-09 17:33:52'),
(124, 1, 'Edit Anggota', 'ID: 6 | Pangkat: Brig Jen | No: 3005141 | Nama: DATO\' MOHAMAD NOORLIZAM BIN SHAMSUDDIN', '2026-07-10 00:23:13'),
(125, 1, 'Padam Row', 'Row ID: 3', '2026-07-10 00:45:32'),
(126, 1, 'Rekod Kehadiran', 'Anggota ID: 12 | Status: Hadir', '2026-07-10 00:45:44'),
(127, 1, 'Rekod Kehadiran', 'Anggota ID: 10 | Status: Tidak Hadir | Lokasi: dalam_pasukan | Sebab: Lepas Tugas', '2026-07-10 00:46:27'),
(128, 1, 'Rekod Kehadiran', 'Anggota ID: 10 | Status: Hadir', '2026-07-10 01:03:52'),
(129, 1, 'Rekod Kehadiran', 'Anggota ID: 11 | Status: Hadir', '2026-07-10 01:04:03'),
(130, 1, 'Rekod Kehadiran', 'Anggota ID: 10 | Status: Tidak Hadir | Lokasi: dalam_pasukan | Sebab: Lepas Tugas', '2026-07-10 01:04:27'),
(131, 1, 'Edit Anggota', 'ID: 7 | Pangkat: KOL | No: 3007374 | Nama: ZAM AZHARI BIN ZAINUDI', '2026-07-10 01:11:49'),
(132, 1, 'Edit Anggota', 'ID: 7 | Pangkat: KOL | No: 3007374 | Nama: ZAM AZHARI BIN ZAINUDIN', '2026-07-10 01:12:02'),
(133, 1, 'Tambah User', 'Username: viewer02 | Role: viewer | Bahagian: MARKAS', '2026-07-10 01:52:51'),
(134, 1, 'Delete User', 'User ID: 11', '2026-07-10 01:53:40'),
(135, 1, 'Delete User', 'User ID: 10', '2026-07-10 01:53:43'),
(136, 1, 'Tambah User', 'Username: viewer01 | Role: viewer | Bahagian: TADBIR', '2026-07-10 01:54:10'),
(137, 1, 'Rekod Kehadiran', 'Anggota ID: 12 | Status: Hadir', '2026-07-16 00:58:57'),
(138, 1, 'Rekod Kehadiran', 'Anggota ID: 10 | Status: Tidak Hadir | Lokasi: dalam_pasukan | Sebab: Attend C', '2026-07-16 00:59:41'),
(139, 1, 'Tambah Row', 'Row: Kursus | Kategori: dalam_pasukan', '2026-07-16 01:00:16'),
(140, 1, 'Tambah Row', 'Row: Attend C | Kategori: dalam_pasukan', '2026-07-27 04:20:19'),
(141, 1, 'Edit Anggota', 'ID: 7 | Pangkat: KOL | No: 3007374 | Nama: ZAM AZHARI BIN ZAINUDIN', '2026-07-27 05:01:06'),
(142, 1, 'Padam Anggota', 'ID: 7', '2026-07-27 05:01:12'),
(143, 1, 'Edit Anggota', 'ID: 15 | Pangkat: MEJ | No: 3006531 | Nama: ARIEF RAHMAN HAKIM BIN MOHD ALI', '2026-07-27 05:03:15'),
(144, 1, 'Edit Anggota', 'ID: 13 | Pangkat: MEJ | No: 3010652 | Nama: NOORSYAHIDDAWATI BINTI ABDULLAH SANI', '2026-07-27 05:03:25'),
(145, 1, 'Edit Anggota', 'ID: 13 | Pangkat: MEJ | No: 3010652 | Nama: NOORSYAHIDDAWATI BINTI ABDULLAH SANI', '2026-07-27 05:06:37'),
(146, 1, 'Edit Anggota', 'ID: 13 | Pangkat: MEJ | No: 3010652 | Nama: NOORSYAHIDDAWATI BINTI ABDULLAH SANI', '2026-07-27 05:07:01'),
(147, 1, 'Edit Anggota', 'ID: 13 | Pangkat: MEJ | No: 3010652 | Nama: NOORSYAHIDDAWATI BINTI ABDULLAH SANI', '2026-07-27 05:07:53'),
(148, 1, 'Edit Anggota', 'ID: 13 | Pangkat: MEJ | No: 3010652 | Nama: NOORSYAHIDDAWATI BINTI ABDULLAH SANI', '2026-07-27 05:08:20'),
(149, 1, 'Edit Anggota', 'ID: 13 | Pangkat: MEJ | No: 3010652 | Nama: NOORSYAHIDDAWATI BINTI ABDULLAH SANI', '2026-07-27 05:08:53'),
(150, 1, 'Edit Anggota', 'ID: 13 | Pangkat: MEJ | No: 3010652 | Nama: NOORSYAHIDDAWATI BINTI ABDULLAH SANI', '2026-07-27 05:09:40'),
(151, 1, 'Edit Anggota', 'ID: 13 | Pangkat: MEJ | No: 3010652 | Nama: NOORSYAHIDDAWATI BINTI ABDULLAH SANI', '2026-07-27 05:10:29'),
(152, 1, 'Edit Anggota', 'ID: 13 | Pangkat: MEJ | No: 3010652 | Nama: NOORSYAHIDDAWATI BINTI ABDULLAH SANI', '2026-07-27 05:11:34'),
(153, 1, 'Edit Anggota', 'ID: 13 | Pangkat: MEJ | No: 3010652 | Nama: NOORSYAHIDDAWATI BINTI ABDULLAH SANI', '2026-07-27 05:11:48'),
(154, 2, 'Simpan Penyata', 'Tarikh: 2026-07-27', '2026-07-27 06:51:41'),
(155, 1, 'Rekod Kehadiran', 'ID: 12 | Hadir', '2026-07-27 06:52:06'),
(156, 1, 'Rekod Kehadiran', 'ID: 11 | Tidak Hadir | dalam_pasukan | Attend C', '2026-07-27 06:52:28'),
(157, 1, 'Rekod Kehadiran (Admin)', 'ID: 12 | Hadir', '2026-07-30 11:59:07'),
(158, 1, 'Rekod Kehadiran (Admin)', 'ID: 11 | Tidak Berbaris | dalam_pasukan | kecederaan', '2026-07-30 11:59:38'),
(159, 1, 'Edit Anggota', 'ID: 6 | Pangkat: BRIG JEN | No: 3005141 | Nama: DATO\' MOHAMAD NOORLIZAM BIN SHAMSUDDIN', '2026-07-30 12:18:29'),
(160, 1, 'Edit Anggota', 'ID: 10 | Pangkat: LT KDR TLDM | No: N/403589 | Nama: MAHAZEAN BINTI MAT LAWI', '2026-07-30 12:18:41'),
(161, 1, 'Tambah User', 'Username: USER02 | Role: user | Bahagian: BLK', '2026-07-30 12:49:11'),
(162, 1, 'Rekod Kehadiran (Admin)', 'ID: 12 | Hadir', '2026-07-30 12:50:49'),
(163, 1, 'Rekod Kehadiran (Admin)', 'ID: 10 | Tidak Berbaris | dalam_pasukan | PT PAGI', '2026-07-30 12:52:11'),
(164, 1, 'Reset Password', 'Username: USER02', '2026-07-30 12:54:02'),
(165, 1, 'Delete User', 'User ID: 13', '2026-07-30 13:17:13'),
(166, 1, 'Edit User', 'User ID: 12 | Nama: NAIM | Role: viewer', '2026-07-30 13:30:22'),
(167, 1, 'Rekod Kehadiran (Admin)', 'ID: 11 | Hadir', '2026-07-30 13:31:36'),
(168, 1, 'Buang Gambar', 'ID: 10', '2026-07-30 15:53:07'),
(169, 1, 'Buang Gambar', 'ID: 10', '2026-07-30 15:53:19'),
(170, 1, 'Rekod Kehadiran (Admin)', 'ID: 12 | Hadir', '2026-07-31 02:30:46'),
(171, 1, 'Rekod Kehadiran (Admin)', 'ID: 11 | Tidak Berbaris | dalam_pasukan | Attend C', '2026-07-31 02:38:14'),
(172, 1, 'Rekod Kehadiran (Admin)', 'ID: 10 | Tidak Berbaris | luar_pasukan | Cuti', '2026-07-31 04:15:15');

-- --------------------------------------------------------

--
-- Table structure for table `penyata_column`
--

CREATE TABLE `penyata_column` (
  `id` int(11) NOT NULL,
  `nama_column` varchar(100) NOT NULL,
  `dicipta_oleh` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyata_column`
--

INSERT INTO `penyata_column` (`id`, `nama_column`, `dicipta_oleh`, `created_at`) VALUES
(1, 'MARKAS', 1, '2026-05-19 04:23:45'),
(2, 'BLK', 1, '2026-05-19 04:23:56'),
(3, 'BBK', 1, '2026-05-19 04:24:05'),
(9, 'AWAM', 2, '2026-06-04 08:08:44'),
(10, 'PNPL', 1, '2026-07-09 08:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `penyata_data`
--

CREATE TABLE `penyata_data` (
  `id` int(11) NOT NULL,
  `row_id` int(11) NOT NULL,
  `column_id` int(11) NOT NULL,
  `bahagian` enum('MARKAS','TADBIR','BLK','BBK','PNPL','AWAM') NOT NULL,
  `nilai` int(11) DEFAULT 0,
  `tarikh` date NOT NULL,
  `dikemaskini_oleh` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyata_data`
--

INSERT INTO `penyata_data` (`id`, `row_id`, `column_id`, `bahagian`, `nilai`, `tarikh`, `dikemaskini_oleh`, `created_at`) VALUES
(1, 1, 1, '', 0, '2026-05-19', 1, '2026-05-19 04:48:34'),
(2, 1, 2, '', 0, '2026-05-19', 1, '2026-05-19 04:48:34'),
(3, 1, 3, '', 0, '2026-05-19', 1, '2026-05-19 04:48:34'),
(9, 2, 1, '', 0, '2026-05-19', 1, '2026-05-19 04:48:34'),
(10, 2, 2, '', 0, '2026-05-19', 1, '2026-05-19 04:48:34'),
(11, 2, 3, '', 0, '2026-05-19', 1, '2026-05-19 04:48:34'),
(17, 1, 1, '', 0, '2026-07-09', 1, '2026-07-09 08:16:57'),
(18, 1, 2, '', 0, '2026-07-09', 1, '2026-07-09 08:16:57'),
(19, 1, 3, '', 0, '2026-07-09', 1, '2026-07-09 08:16:57'),
(20, 1, 9, '', 0, '2026-07-09', 1, '2026-07-09 08:16:57'),
(21, 2, 1, '', 0, '2026-07-09', 1, '2026-07-09 08:16:57'),
(22, 2, 2, '', 0, '2026-07-09', 1, '2026-07-09 08:16:57'),
(23, 2, 3, '', 0, '2026-07-09', 1, '2026-07-09 08:16:57'),
(24, 2, 9, '', 0, '2026-07-09', 1, '2026-07-09 08:16:57'),
(25, 1, 1, '', 0, '2026-07-09', 1, '2026-07-09 08:18:06'),
(26, 1, 2, '', 0, '2026-07-09', 1, '2026-07-09 08:18:06'),
(27, 1, 3, '', 0, '2026-07-09', 1, '2026-07-09 08:18:06'),
(28, 1, 9, '', 0, '2026-07-09', 1, '2026-07-09 08:18:06'),
(29, 2, 1, '', 0, '2026-07-09', 1, '2026-07-09 08:18:06'),
(30, 2, 2, '', 0, '2026-07-09', 1, '2026-07-09 08:18:06'),
(31, 2, 3, '', 0, '2026-07-09', 1, '2026-07-09 08:18:06'),
(32, 2, 9, '', 0, '2026-07-09', 1, '2026-07-09 08:18:06'),
(33, 1, 1, '', 0, '2026-07-09', 1, '2026-07-09 08:18:15'),
(34, 1, 2, '', 0, '2026-07-09', 1, '2026-07-09 08:18:15'),
(35, 1, 3, '', 0, '2026-07-09', 1, '2026-07-09 08:18:15'),
(36, 1, 9, '', 0, '2026-07-09', 1, '2026-07-09 08:18:15'),
(37, 2, 1, '', 0, '2026-07-09', 1, '2026-07-09 08:18:15'),
(38, 2, 2, '', 0, '2026-07-09', 1, '2026-07-09 08:18:15'),
(39, 2, 3, '', 0, '2026-07-09', 1, '2026-07-09 08:18:15'),
(40, 2, 9, '', 0, '2026-07-09', 1, '2026-07-09 08:18:15'),
(41, 1, 1, '', 0, '2026-07-09', 1, '2026-07-09 08:18:41'),
(42, 1, 2, '', 0, '2026-07-09', 1, '2026-07-09 08:18:41'),
(43, 1, 3, '', 0, '2026-07-09', 1, '2026-07-09 08:18:41'),
(44, 1, 9, '', 0, '2026-07-09', 1, '2026-07-09 08:18:41'),
(45, 2, 1, '', 0, '2026-07-09', 1, '2026-07-09 08:18:41'),
(46, 2, 2, '', 0, '2026-07-09', 1, '2026-07-09 08:18:41'),
(47, 2, 3, '', 0, '2026-07-09', 1, '2026-07-09 08:18:41'),
(48, 2, 9, '', 0, '2026-07-09', 1, '2026-07-09 08:18:41');

-- --------------------------------------------------------

--
-- Table structure for table `penyata_row`
--

CREATE TABLE `penyata_row` (
  `id` int(11) NOT NULL,
  `kategori` enum('luar_pasukan','dalam_pasukan','berbaris') NOT NULL,
  `nama_row` varchar(100) NOT NULL,
  `dicipta_oleh` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyata_row`
--

INSERT INTO `penyata_row` (`id`, `kategori`, `nama_row`, `dicipta_oleh`, `created_at`) VALUES
(1, 'luar_pasukan', 'Cuti', 1, '2026-05-18 06:47:45'),
(2, 'luar_pasukan', 'Kursus', 2, '2026-05-18 06:58:08'),
(5, 'dalam_pasukan', 'Attend C', 1, '2026-07-27 04:20:19');

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('pending','selesai') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user','viewer') NOT NULL,
  `bahagian` enum('MARKAS','TADBIR','BLK','BBK','PNPL','AWAM') NOT NULL,
  `first_login` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `role`, `bahagian`, `first_login`, `created_at`) VALUES
(1, 'Administrator', 'admin01', '$2y$10$67E8nlvz7n6dWDIwIdQya.ZqqES6DUGYaEpPAJWrWxHN7.qXFB6UK', 'admin', 'MARKAS', 0, '2026-05-18 03:07:35'),
(2, 'NAIM', 'user01', '$2y$10$fKtIwx5gK.mprh7/DlZ.oOnY6s12gbNT2EXAzb4relwV6IaR6/Afy', 'user', 'MARKAS', 0, '2026-05-18 06:49:09'),
(12, 'NAIM', 'viewer01', '$2y$10$..S552OXtF0xT4e7vbc0mec3225Zt.yBH8Q9WxudapRPF2E73sdRa', 'viewer', 'TADBIR', 0, '2026-07-10 01:54:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_anggota` (`no_anggota`);

--
-- Indexes for table `catatan_tidak_hadir`
--
ALTER TABLE `catatan_tidak_hadir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kehadiran_id` (`kehadiran_id`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anggota_id` (`anggota_id`),
  ADD KEY `dikemaskini_oleh` (`dikemaskini_oleh`);

--
-- Indexes for table `log_aktiviti`
--
ALTER TABLE `log_aktiviti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `penyata_column`
--
ALTER TABLE `penyata_column`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dicipta_oleh` (`dicipta_oleh`);

--
-- Indexes for table `penyata_data`
--
ALTER TABLE `penyata_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `row_id` (`row_id`),
  ADD KEY `column_id` (`column_id`),
  ADD KEY `dikemaskini_oleh` (`dikemaskini_oleh`);

--
-- Indexes for table `penyata_row`
--
ALTER TABLE `penyata_row`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dicipta_oleh` (`dicipta_oleh`);

--
-- Indexes for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `catatan_tidak_hadir`
--
ALTER TABLE `catatan_tidak_hadir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `log_aktiviti`
--
ALTER TABLE `log_aktiviti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `penyata_column`
--
ALTER TABLE `penyata_column`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `penyata_data`
--
ALTER TABLE `penyata_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `penyata_row`
--
ALTER TABLE `penyata_row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catatan_tidak_hadir`
--
ALTER TABLE `catatan_tidak_hadir`
  ADD CONSTRAINT `catatan_tidak_hadir_ibfk_1` FOREIGN KEY (`kehadiran_id`) REFERENCES `kehadiran` (`id`);

--
-- Constraints for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD CONSTRAINT `kehadiran_ibfk_1` FOREIGN KEY (`anggota_id`) REFERENCES `anggota` (`id`),
  ADD CONSTRAINT `kehadiran_ibfk_2` FOREIGN KEY (`dikemaskini_oleh`) REFERENCES `users` (`id`);

--
-- Constraints for table `log_aktiviti`
--
ALTER TABLE `log_aktiviti`
  ADD CONSTRAINT `log_aktiviti_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `penyata_column`
--
ALTER TABLE `penyata_column`
  ADD CONSTRAINT `penyata_column_ibfk_1` FOREIGN KEY (`dicipta_oleh`) REFERENCES `users` (`id`);

--
-- Constraints for table `penyata_data`
--
ALTER TABLE `penyata_data`
  ADD CONSTRAINT `penyata_data_ibfk_1` FOREIGN KEY (`row_id`) REFERENCES `penyata_row` (`id`),
  ADD CONSTRAINT `penyata_data_ibfk_2` FOREIGN KEY (`column_id`) REFERENCES `penyata_column` (`id`),
  ADD CONSTRAINT `penyata_data_ibfk_3` FOREIGN KEY (`dikemaskini_oleh`) REFERENCES `users` (`id`);

--
-- Constraints for table `penyata_row`
--
ALTER TABLE `penyata_row`
  ADD CONSTRAINT `penyata_row_ibfk_1` FOREIGN KEY (`dicipta_oleh`) REFERENCES `users` (`id`);

--
-- Constraints for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `reset_password_request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
