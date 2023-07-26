-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2023 at 11:48 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prod_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `aplikasi`
--

CREATE TABLE `aplikasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_owner` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tlp` varchar(50) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `nama_aplikasi` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `copy_right` varchar(50) DEFAULT NULL,
  `versi` varchar(20) DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aplikasi`
--

INSERT INTO `aplikasi` (`id`, `nama_owner`, `alamat`, `tlp`, `title`, `nama_aplikasi`, `logo`, `copy_right`, `versi`, `tahun`) VALUES
(1, 'itsupport', 'Jl. Rorotan Babek TNI No.2-3, Cakung Tim., Kec. Cakung, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13910', '(021) 50311007', 'PT. Tradecorp', 'IT Management', 'cropped-favicon-tradecorp-180x180.png', 'Copyright &copy;', '1.0.0.0', 2023);

-- --------------------------------------------------------

--
-- Table structure for table `aset`
--

CREATE TABLE `aset` (
  `id_aset` bigint(20) UNSIGNED NOT NULL,
  `karyawanid` int(11) UNSIGNED NOT NULL,
  `tipeid` int(11) UNSIGNED NOT NULL,
  `merekid` int(11) UNSIGNED NOT NULL,
  `divisiid` int(11) UNSIGNED NOT NULL,
  `subdivisiid` int(11) UNSIGNED NOT NULL,
  `lokasiid` int(11) UNSIGNED NOT NULL,
  `qr_aset` varchar(100) NOT NULL,
  `nama_aset` varchar(255) NOT NULL,
  `serial_aset` varchar(255) NOT NULL,
  `jumlah_aset` varchar(50) NOT NULL,
  `status_aset` varchar(20) NOT NULL,
  `foto_aset` text DEFAULT NULL,
  `deskripsi_aset` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aset`
--

INSERT INTO `aset` (`id_aset`, `karyawanid`, `tipeid`, `merekid`, `divisiid`, `subdivisiid`, `lokasiid`, `qr_aset`, `nama_aset`, `serial_aset`, `jumlah_aset`, `status_aset`, `foto_aset`, `deskripsi_aset`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, '12345', 'Asus ROG Strix A507PX', '123321', '1', 'ok', 'aset.png', 'bla bla bla', '2023-07-16 04:17:16', '2023-07-16 04:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) UNSIGNED NOT NULL,
  `kdbarang` varchar(15) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `harga` decimal(10,0) DEFAULT NULL,
  `satuan` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kdbarang`, `nama`, `harga`, `satuan`) VALUES
(5, '23073519', 'AA', '12', '12'),
(6, '23074619', 'BB', '13', '13'),
(8, '23072319', 'asd', '123123', '123');

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `id_dept` int(20) UNSIGNED NOT NULL,
  `nama_dept` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_kar` int(20) UNSIGNED NOT NULL,
  `nik` int(100) NOT NULL,
  `foto_kar` varchar(100) NOT NULL,
  `nama_kar` varchar(255) NOT NULL,
  `email_kar` varchar(255) NOT NULL,
  `telfon_kar` varchar(100) NOT NULL,
  `jabatan_kar` varchar(255) NOT NULL,
  `alamat_kar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_kar`, `nik`, `foto_kar`, `nama_kar`, `email_kar`, `telfon_kar`, `jabatan_kar`, `alamat_kar`, `created_at`, `updated_at`) VALUES
(1, 0, 'rahmat.png', 'rahmat', 'rahmat@user.com', '081231213', 'Security', 'Jalan Jalan', '2023-07-18 07:34:23', '2023-07-18 07:34:23');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kat` int(11) UNSIGNED NOT NULL,
  `nama_kat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kat`, `nama_kat`) VALUES
(3, 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_tugas`
--

CREATE TABLE `laporan_tugas` (
  `id` int(11) UNSIGNED NOT NULL,
  `kdreport` varchar(15) DEFAULT NULL,
  `namareport` varchar(50) DEFAULT NULL,
  `harga` decimal(10,0) DEFAULT NULL,
  `satuan` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan_tugas`
--

INSERT INTO `laporan_tugas` (`id`, `kdreport`, `namareport`, `harga`, `satuan`) VALUES
(5, '23073519', 'AA', '12', '12'),
(6, '23074619', 'BB', '13', '13');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` int(20) UNSIGNED NOT NULL,
  `nama_lokasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `nama_lokasi`) VALUES
(1, 'Cakung'),
(2, 'Surabaya'),
(3, 'SCBD'),
(33, 'Makasar'),
(34, 'Aceh');

-- --------------------------------------------------------

--
-- Table structure for table `merek`
--

CREATE TABLE `merek` (
  `id_merek` int(20) UNSIGNED NOT NULL,
  `nama_merek` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merek`
--

INSERT INTO `merek` (`id_merek`, `nama_merek`) VALUES
(1, 'Asus'),
(3, 'Lenovo'),
(4, 'Sony'),
(5, 'YeaLink'),
(6, 'Cisco'),
(7, 'Xiaomi'),
(8, 'Apple'),
(9, 'MSI'),
(10, 'Gigabyte'),
(11, 'Logitech');

-- --------------------------------------------------------

--
-- Table structure for table `posisi`
--

CREATE TABLE `posisi` (
  `id_posisi` int(20) UNSIGNED NOT NULL,
  `nama_posisi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posisi`
--

INSERT INTO `posisi` (`id_posisi`, `nama_posisi`) VALUES
(1, 'IT'),
(4, 'HRGA'),
(6, 'Receptionist');

-- --------------------------------------------------------

--
-- Table structure for table `subdivisi`
--

CREATE TABLE `subdivisi` (
  `id_subdivisi` int(11) UNSIGNED NOT NULL,
  `nama_subdivisi` varchar(100) NOT NULL,
  `id_divisi` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subdivisi`
--

INSERT INTO `subdivisi` (`id_subdivisi`, `nama_subdivisi`, `id_divisi`) VALUES
(1, 'HR Recruitments', 1),
(2, 'IT Support Cabang', 4),
(37, 'a', 1),
(38, 'asd', 1),
(39, 'ffff', 1),
(40, 'hhh', 6),
(41, 'asa', 14);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_akses_menu`
--

CREATE TABLE `tbl_akses_menu` (
  `id` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `view_level` enum('Y','N') DEFAULT 'N',
  `add_level` enum('Y','N') DEFAULT 'N',
  `edit_level` enum('Y','N') DEFAULT 'N',
  `delete_level` enum('Y','N') DEFAULT 'N',
  `print_level` enum('Y','N') DEFAULT 'N',
  `upload_level` enum('Y','N') DEFAULT 'N',
  `v_btn` enum('Y','N') DEFAULT 'N',
  `v_btn1` enum('Y','N') DEFAULT 'N',
  `v_btn2` enum('Y','N') DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_akses_menu`
--

INSERT INTO `tbl_akses_menu` (`id`, `id_level`, `id_menu`, `view_level`, `add_level`, `edit_level`, `delete_level`, `print_level`, `upload_level`, `v_btn`, `v_btn1`, `v_btn2`) VALUES
(1, 1, 1, 'Y', 'N', 'N', 'N', 'N', 'N', 'Y', 'Y', 'N'),
(2, 1, 2, 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(43, 4, 1, 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(44, 4, 2, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(73, 1, 55, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(74, 4, 55, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(79, 1, 57, 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(80, 4, 57, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(85, 6, 1, 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(86, 6, 2, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(87, 6, 55, 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(88, 6, 57, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(89, 1, 59, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(90, 4, 59, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(92, 6, 59, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(93, 1, 60, 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(94, 4, 60, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(96, 6, 60, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_akses_submenu`
--

CREATE TABLE `tbl_akses_submenu` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_level` int(11) NOT NULL,
  `id_submenu` int(11) NOT NULL,
  `view_level` enum('Y','N') DEFAULT 'N',
  `add_level` enum('Y','N') DEFAULT 'N',
  `edit_level` enum('Y','N') DEFAULT 'N',
  `delete_level` enum('Y','N') DEFAULT 'N',
  `print_level` enum('Y','N') DEFAULT 'N',
  `upload_level` enum('Y','N') DEFAULT 'N',
  `v_btn` enum('Y','N') DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_akses_submenu`
--

INSERT INTO `tbl_akses_submenu` (`id`, `id_level`, `id_submenu`, `view_level`, `add_level`, `edit_level`, `delete_level`, `print_level`, `upload_level`, `v_btn`) VALUES
(2, 1, 2, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(4, 1, 1, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(6, 1, 7, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(7, 1, 8, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(9, 1, 10, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(59, 4, 1, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(60, 4, 2, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(61, 4, 7, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(62, 4, 8, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(63, 4, 10, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(141, 1, 47, 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(142, 4, 47, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(144, 1, 48, 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(145, 4, 48, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(150, 6, 1, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(151, 6, 2, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(152, 6, 7, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(153, 6, 8, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(154, 6, 10, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(155, 6, 47, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(156, 6, 48, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(158, 1, 50, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(159, 4, 50, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(161, 6, 50, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(166, 1, 52, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(167, 4, 52, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(169, 6, 52, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(170, 1, 53, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(171, 4, 53, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(173, 6, 53, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(174, 1, 54, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(175, 4, 54, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(177, 6, 54, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(178, 1, 55, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(179, 4, 55, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(181, 6, 55, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(182, 1, 56, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(183, 4, 56, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(185, 6, 56, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(186, 1, 57, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(187, 4, 57, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(189, 6, 57, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(190, 1, 58, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(191, 4, 58, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(193, 6, 58, 'N', 'N', 'N', 'N', 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(50) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `urutan` bigint(11) DEFAULT NULL,
  `is_active` enum('Y','N') DEFAULT 'Y',
  `parent` enum('Y') DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id_menu`, `nama_menu`, `link`, `icon`, `urutan`, `is_active`, `parent`) VALUES
(1, 'Dashboard', 'dashboard', 'fas fa-tachometer-alt', 1, 'Y', 'Y'),
(2, 'System', '#', 'fas fa-cogs', 10, 'Y', 'Y'),
(55, 'Master', '#', 'fa fa-database', 3, 'Y', 'Y'),
(57, 'User Setting', '#', 'fas fa-users', 4, 'Y', 'Y'),
(59, 'Progress Report', '#', 'fas fa-book', 2, 'Y', 'Y'),
(60, 'Assets Report', '#', 'fas fa-pen', 2, 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_submenu`
--

CREATE TABLE `tbl_submenu` (
  `id_submenu` int(11) NOT NULL,
  `nama_submenu` varchar(50) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `is_active` enum('Y','N') DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_submenu`
--

INSERT INTO `tbl_submenu` (`id_submenu`, `nama_submenu`, `link`, `icon`, `id_menu`, `is_active`) VALUES
(1, 'Menu', 'menu', 'far fa-circle', 2, 'Y'),
(2, 'SubMenu', 'submenu', 'far fa-circle', 2, 'Y'),
(7, 'Aplikasi', 'aplikasi', 'far fa-circle', 2, 'Y'),
(8, 'User', 'user', 'far fa-circle', 57, 'Y'),
(10, 'User Level', 'userlevel', 'far fa-circle', 57, 'Y'),
(47, 'Barang', 'barang', 'far fa-circle', 1, 'Y'),
(48, 'Kategori', 'kategori', 'far fa-circle', 1, 'Y'),
(50, 'Report Daily', 'todo', 'far fa-circle', 59, 'Y'),
(52, 'Location', 'lokasi', 'far fa-circle', 60, 'Y'),
(53, 'Type', 'tipe', 'far fa-circle', 60, 'Y'),
(54, 'Brand', 'merek', 'far fa-circle', 60, 'Y'),
(55, 'Departement', 'dept', 'far fa-circle', 60, 'Y'),
(56, 'Employee', 'karyawan', 'far fa-circle', 60, 'Y'),
(57, 'Asset', 'aset', 'far fa-circle', 60, 'Y'),
(58, 'SubDivision', 'subdivisi', 'far fa-circle', 60, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_level` int(11) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `is_active` enum('Y','N') DEFAULT 'Y',
  `id_loket` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `full_name`, `password`, `id_level`, `image`, `is_active`, `id_loket`) VALUES
(1, 'admin', 'Administrator', '$2y$05$GxKcIJJdFuw4kWwYpzcqm.NjqzpMdfSgoZy6mxxo2tBUwm50WnBbC', 1, 'admin1.jpg', 'Y', NULL),
(9, 'user', 'user', '$2y$05$5BBtyCQPH/WxWVWsZeuX4uxNgIbt8jIRa9ifuRg5xxkFlNZtWQ.tW', 4, 'user.png', 'Y', NULL),
(10, 'fena', 'Fena', '$2y$05$QJooAsOrjUxmEoUEx/NxWO/LqXLN4UywCE3AcI8EqTeUWL.1YahUW', 6, NULL, 'Y', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_userlevel`
--

CREATE TABLE `tbl_userlevel` (
  `id_level` int(11) UNSIGNED NOT NULL,
  `nama_level` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_userlevel`
--

INSERT INTO `tbl_userlevel` (`id_level`, `nama_level`) VALUES
(1, 'Administrator'),
(4, 'Purchasing'),
(6, 'HRGA');

-- --------------------------------------------------------

--
-- Table structure for table `tipe`
--

CREATE TABLE `tipe` (
  `id_tipe` int(20) UNSIGNED NOT NULL,
  `nama_tipe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tipe`
--

INSERT INTO `tipe` (`id_tipe`, `nama_tipe`) VALUES
(1, 'Laptop'),
(4, 'SSD'),
(5, 'Hardisk'),
(6, 'All In One PC'),
(7, 'Flashdisk'),
(11, 'NVME');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aplikasi`
--
ALTER TABLE `aplikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aset`
--
ALTER TABLE `aset`
  ADD PRIMARY KEY (`id_aset`),
  ADD KEY `tipeid` (`tipeid`),
  ADD KEY `merekid` (`merekid`),
  ADD KEY `divisiid` (`divisiid`),
  ADD KEY `lokasiid` (`lokasiid`),
  ADD KEY `pegawaiid` (`karyawanid`),
  ADD KEY `subdivisiid` (`subdivisiid`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`id_dept`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_kar`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kat`);

--
-- Indexes for table `laporan_tugas`
--
ALTER TABLE `laporan_tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indexes for table `merek`
--
ALTER TABLE `merek`
  ADD PRIMARY KEY (`id_merek`);

--
-- Indexes for table `posisi`
--
ALTER TABLE `posisi`
  ADD PRIMARY KEY (`id_posisi`);

--
-- Indexes for table `subdivisi`
--
ALTER TABLE `subdivisi`
  ADD PRIMARY KEY (`id_subdivisi`);

--
-- Indexes for table `tbl_akses_menu`
--
ALTER TABLE `tbl_akses_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `tbl_akses_submenu`
--
ALTER TABLE `tbl_akses_submenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_submenu` (`id_submenu`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `tbl_submenu`
--
ALTER TABLE `tbl_submenu`
  ADD PRIMARY KEY (`id_submenu`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `tbl_userlevel`
--
ALTER TABLE `tbl_userlevel`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `tipe`
--
ALTER TABLE `tipe`
  ADD PRIMARY KEY (`id_tipe`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aplikasi`
--
ALTER TABLE `aplikasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aset`
--
ALTER TABLE `aset`
  MODIFY `id_aset` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dept`
--
ALTER TABLE `dept`
  MODIFY `id_dept` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_kar` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kat` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `laporan_tugas`
--
ALTER TABLE `laporan_tugas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id_lokasi` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `merek`
--
ALTER TABLE `merek`
  MODIFY `id_merek` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posisi`
--
ALTER TABLE `posisi`
  MODIFY `id_posisi` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `subdivisi`
--
ALTER TABLE `subdivisi`
  MODIFY `id_subdivisi` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tbl_akses_menu`
--
ALTER TABLE `tbl_akses_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `tbl_akses_submenu`
--
ALTER TABLE `tbl_akses_submenu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `tbl_submenu`
--
ALTER TABLE `tbl_submenu`
  MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_userlevel`
--
ALTER TABLE `tbl_userlevel`
  MODIFY `id_level` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tipe`
--
ALTER TABLE `tipe`
  MODIFY `id_tipe` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aset`
--
ALTER TABLE `aset`
  ADD CONSTRAINT `aset_ibfk_1` FOREIGN KEY (`tipeid`) REFERENCES `tipe` (`id_tipe`),
  ADD CONSTRAINT `aset_ibfk_2` FOREIGN KEY (`merekid`) REFERENCES `merek` (`id_merek`),
  ADD CONSTRAINT `aset_ibfk_3` FOREIGN KEY (`divisiid`) REFERENCES `posisi` (`id_posisi`),
  ADD CONSTRAINT `aset_ibfk_4` FOREIGN KEY (`lokasiid`) REFERENCES `lokasi` (`id_lokasi`),
  ADD CONSTRAINT `aset_ibfk_5` FOREIGN KEY (`karyawanid`) REFERENCES `karyawan` (`id_kar`),
  ADD CONSTRAINT `aset_ibfk_6` FOREIGN KEY (`subdivisiid`) REFERENCES `subdivisi` (`id_subdivisi`);

--
-- Constraints for table `tbl_submenu`
--
ALTER TABLE `tbl_submenu`
  ADD CONSTRAINT `tbl_submenu_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `tbl_menu` (`id_menu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
