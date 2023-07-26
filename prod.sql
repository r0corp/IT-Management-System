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
-- Database: `prod`
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
-- Table structure for table `aset_divisi`
--

CREATE TABLE `aset_divisi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_divisi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aset_divisi`
--

INSERT INTO `aset_divisi` (`id`, `nama_divisi`) VALUES
(1, 'IT'),
(4, 'HRGA'),
(6, 'aaa'),
(7, 'qqq');

-- --------------------------------------------------------

--
-- Table structure for table `aset_lokasi`
--

CREATE TABLE `aset_lokasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aset_lokasi`
--

INSERT INTO `aset_lokasi` (`id`, `nama`, `deskripsi`, `created_at`, `updated_at`) VALUES
(24, 'Cakung', 'Cakung', '2023-07-16 13:17:57', '2023-07-16 13:17:57'),
(25, 'Surabaya', 'Surabaya', '2023-07-16 13:17:48', '2023-07-16 13:17:48'),
(28, 'SCBD', 'SCBD Sudirman', '2023-07-16 13:18:20', '2023-07-16 13:18:20');

-- --------------------------------------------------------

--
-- Table structure for table `aset_merek`
--

CREATE TABLE `aset_merek` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aset_merek`
--

INSERT INTO `aset_merek` (`id`, `nama`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Asus', 'Asus', '2023-07-16 13:53:40', '2023-07-16 13:53:40'),
(3, 'Lenovo', 'Lenovo', '2023-07-16 13:53:51', '2023-07-16 13:53:51'),
(4, 'Sony', 'Sony', '2023-07-16 13:53:58', '2023-07-16 13:53:58'),
(5, 'YeaLink', 'YeaLink', '2023-07-16 13:54:07', '2023-07-16 13:54:07'),
(6, 'Cisco', 'Cisco', '2023-07-16 13:54:14', '2023-07-16 13:54:14'),
(7, 'Xiaomi', 'Xiaomi', '2023-07-16 13:56:10', '2023-07-16 13:56:10'),
(8, 'Apple', 'Apple', '2023-07-16 13:56:17', '2023-07-16 13:56:17'),
(9, 'MSI', 'MSI', '2023-07-16 13:56:27', '2023-07-16 13:56:27'),
(10, 'Gigabyte', 'Gigabyte', '2023-07-16 13:56:36', '2023-07-16 13:56:36'),
(11, 'Logitech', 'Logitech', '2023-07-16 13:59:03', '2023-07-16 13:59:03');

-- --------------------------------------------------------

--
-- Table structure for table `aset_tipe`
--

CREATE TABLE `aset_tipe` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aset_tipe`
--

INSERT INTO `aset_tipe` (`id`, `nama`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', 'Laptop', '2023-07-16 13:35:15', '2023-07-16 13:35:15'),
(4, 'SSD', 'SSD', '2023-07-16 13:43:15', '2023-07-16 13:43:15'),
(5, 'Hardisk', 'Hardisk', '2023-07-16 13:43:28', '2023-07-16 13:43:28'),
(6, 'All In One PC', 'All In One PC ', '2023-07-16 13:43:56', '2023-07-16 13:43:56'),
(7, 'Flashdisk', 'Flashdisk', '2023-07-16 13:44:06', '2023-07-16 13:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipeid` int(11) NOT NULL,
  `merekid` int(11) NOT NULL,
  `departemenid` int(11) NOT NULL,
  `lokasiid` int(11) NOT NULL,
  `qrcode` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `jumlah` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `gambar` text DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `checkstatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `tipeid`, `merekid`, `departemenid`, `lokasiid`, `qrcode`, `nama`, `serial`, `jumlah`, `status`, `gambar`, `deskripsi`, `created_at`, `updated_at`, `checkstatus`) VALUES
(1, 1, 1, 1, 1, '12345', 'Asus ROG Strix A507PX', '123321', '1', 'ok', 'aset.png', 'bla bla bla', '2023-07-16 04:17:16', '2023-07-16 04:17:16', 1);

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
(6, '23074619', 'BB', '13', '13');

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
(3, 'aa');

-- --------------------------------------------------------

--
-- Table structure for table `report_progress`
--

CREATE TABLE `report_progress` (
  `id` int(11) UNSIGNED NOT NULL,
  `kdreport` varchar(15) DEFAULT NULL,
  `namareport` varchar(50) DEFAULT NULL,
  `harga` decimal(10,0) DEFAULT NULL,
  `satuan` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report_progress`
--

INSERT INTO `report_progress` (`id`, `kdreport`, `namareport`, `harga`, `satuan`) VALUES
(5, '23073519', 'AA', '12', '12'),
(6, '23074619', 'BB', '13', '13');

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
(64, 5, 1, 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(65, 5, 2, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(73, 1, 55, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(74, 4, 55, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(75, 5, 55, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(79, 1, 57, 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(80, 4, 57, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(81, 5, 57, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(85, 6, 1, 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(86, 6, 2, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(87, 6, 55, 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(88, 6, 57, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(89, 1, 59, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(90, 4, 59, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(91, 5, 59, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(92, 6, 59, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(93, 1, 60, 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(94, 4, 60, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(95, 5, 60, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
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
(106, 5, 1, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(107, 5, 2, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(108, 5, 7, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(109, 5, 8, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(110, 5, 10, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(141, 1, 47, 'Y', 'N', 'N', 'N', 'N', 'N', 'N'),
(142, 4, 47, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(143, 5, 47, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(144, 1, 48, 'Y', 'N', 'N', 'N', 'N', 'N', 'N'),
(145, 4, 48, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(146, 5, 48, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(150, 6, 1, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(151, 6, 2, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(152, 6, 7, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(153, 6, 8, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(154, 6, 10, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(155, 6, 47, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(156, 6, 48, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(158, 1, 50, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(159, 4, 50, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(160, 5, 50, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(161, 6, 50, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(166, 1, 52, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(167, 4, 52, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(168, 5, 52, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(169, 6, 52, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(170, 1, 53, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(171, 4, 53, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(172, 5, 53, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(173, 6, 53, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(174, 1, 54, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(175, 4, 54, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(176, 5, 54, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(177, 6, 54, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(178, 1, 55, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(179, 4, 55, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(180, 5, 55, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(181, 6, 55, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(182, 1, 56, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(183, 4, 56, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(184, 5, 56, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(185, 6, 56, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(186, 1, 57, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N'),
(187, 4, 57, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(188, 5, 57, 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
(189, 6, 57, 'N', 'N', 'N', 'N', 'N', 'N', 'N');

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
(47, 'Barang', 'barang', 'far fa-circle', 55, 'Y'),
(48, 'Kategori', 'kategori', 'far fa-circle', 55, 'Y'),
(50, 'Report Daily', 'todo', 'far fa-circle', 59, 'Y'),
(52, 'Branch', 'branch', 'far fa-circle', 60, 'Y'),
(53, 'Type', 'type', 'far fa-circle', 60, 'Y'),
(54, 'Brand', 'brand', 'far fa-circle', 60, 'Y'),
(55, 'Departement', 'departement', 'far fa-circle', 60, 'Y'),
(56, 'Assets', 'asset', 'far fa-circle', 60, 'Y'),
(57, 'Employee', 'employee', 'far fa-circle', 60, 'Y');

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
(5, 'Accounting'),
(6, 'HRGA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aplikasi`
--
ALTER TABLE `aplikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aset_divisi`
--
ALTER TABLE `aset_divisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aset_lokasi`
--
ALTER TABLE `aset_lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aset_merek`
--
ALTER TABLE `aset_merek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aset_tipe`
--
ALTER TABLE `aset_tipe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kat`);

--
-- Indexes for table `report_progress`
--
ALTER TABLE `report_progress`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aplikasi`
--
ALTER TABLE `aplikasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aset_divisi`
--
ALTER TABLE `aset_divisi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `aset_lokasi`
--
ALTER TABLE `aset_lokasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `aset_merek`
--
ALTER TABLE `aset_merek`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `aset_tipe`
--
ALTER TABLE `aset_tipe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kat` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `report_progress`
--
ALTER TABLE `report_progress`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_akses_menu`
--
ALTER TABLE `tbl_akses_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `tbl_akses_submenu`
--
ALTER TABLE `tbl_akses_submenu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `tbl_submenu`
--
ALTER TABLE `tbl_submenu`
  MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_submenu`
--
ALTER TABLE `tbl_submenu`
  ADD CONSTRAINT `tbl_submenu_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `tbl_menu` (`id_menu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
