-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 16, 2020 at 03:24 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `automations`
--

CREATE TABLE `automations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `automation_recipe_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `board_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sentence` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`config`)),
  `track` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`track`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `automation_recipes`
--

CREATE TABLE `automation_recipes` (
  `id` bigint(20) NOT NULL,
  `automation_service_id` bigint(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `service_name` varchar(50) DEFAULT '0',
  `mapper` text DEFAULT NULL,
  `sentence` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `automation_services`
--

CREATE TABLE `automation_services` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `logo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `boards`
--

CREATE TABLE `boards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boards`
--

INSERT INTO `boards` (`id`, `user_id`, `team_id`, `name`, `created_at`, `updated_at`) VALUES
(3, 2, 2, 'Trung\'s Team Board', '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(8, 3, 3, 'Nguyen\'s Team Board', '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(9, 3, 3, 'fadf', '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(12, 4, 4, 'New Board', '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(14, 4, 4, 'New Board 2', '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(15, 1, 1, 'Hello', '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(17, 4, 1, 'New', '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(19, 4, 4, 'New Board', '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(20, 4, 4, 'New', '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(21, 5, 5, 'Thanh\'s Team Board', '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(22, 4, 6, 'Thanhhff Teams Board', '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(23, 5, 6, 'New Board', '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(26, 4, 7, 'Thanhhff Team Board', '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(27, 4, 8, 'New Team Board', '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(28, 4, 8, 'fasfasf', '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(29, 4, 4, 'Helllo', '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(30, 4, 4, 'new', '2020-12-15 17:39:42', '2020-12-15 17:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `checklists`
--

CREATE TABLE `checklists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) DEFAULT 0,
  `done` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checklists`
--

INSERT INTO `checklists` (`id`, `user_id`, `team_id`, `item_id`, `title`, `order`, `done`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 2, 'dsafasffasf', 0, 0, '2020-11-26 23:46:52', '2020-11-26 23:46:52'),
(18, 4, 4, 8, 'Lisst', 0, 0, '2020-12-02 07:46:50', '2020-12-02 07:46:50'),
(31, 4, 4, 15, 'Bcdefgh', 0, 0, '2020-12-03 05:47:38', '2020-12-03 05:47:38'),
(37, 4, 4, 17, 'Hello', 0, 0, '2020-12-03 07:27:03', '2020-12-03 07:27:03'),
(39, 4, 4, 26, 'fasdfsffasf', 0, 0, '2020-12-08 14:45:21', '2020-12-08 14:45:21'),
(42, 4, 6, 38, 'fsadfas', 0, 0, '2020-12-12 11:59:56', '2020-12-12 11:59:56'),
(43, 4, 6, 38, 'fasdfa', 0, 0, '2020-12-12 11:59:56', '2020-12-12 11:59:56'),
(46, 4, 4, 46, 'fasdfasf', 0, 0, '2020-12-15 04:38:21', '2020-12-15 04:38:21'),
(47, 4, 4, 46, 'fasf', 0, 0, '2020-12-15 04:38:21', '2020-12-15 04:38:21'),
(53, 4, 4, 48, 'KKKK', 0, 0, '2020-12-15 16:37:45', '2020-12-15 16:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `board_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `hide` tinyint(3) UNSIGNED DEFAULT 0,
  `manual` tinyint(3) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `user_id`, `team_id`, `board_id`, `name`, `title`, `type`, `options`, `hide`, `manual`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(2, 1, 1, 1, 'status', 'Status', 'label', NULL, 0, 0, '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(3, 1, 1, 1, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(4, 1, 1, 1, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(5, 1, 1, 2, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(6, 1, 1, 2, 'status', 'Status', 'label', NULL, 0, 0, '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(7, 1, 1, 2, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(8, 1, 1, 2, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(9, 1, 1, 2, 'Note', 'Note', 'text', NULL, 0, 1, '2020-11-25 03:57:01', '2020-11-25 03:57:01'),
(10, 1, 1, 2, 'Note', 'Note', 'text', NULL, 0, 1, '2020-11-25 03:57:06', '2020-11-25 03:57:06'),
(11, 1, 1, 2, 'Note', 'Note', 'text', NULL, 0, 1, '2020-11-25 03:57:08', '2020-11-25 03:57:08'),
(12, 1, 1, 2, 'Note', 'Note', 'text', NULL, 0, 1, '2020-11-25 03:57:08', '2020-11-25 03:57:08'),
(13, 1, 1, 2, 'Note', 'Note', 'text', NULL, 0, 1, '2020-11-25 03:57:08', '2020-11-25 03:57:08'),
(14, 1, 1, 2, 'Note', 'Note', 'text', NULL, 0, 1, '2020-11-25 03:57:08', '2020-11-25 03:57:08'),
(15, 1, 1, 2, 'Note', 'Note', 'text', NULL, 0, 1, '2020-11-25 03:57:09', '2020-11-25 03:57:09'),
(16, 1, 1, 2, 'Note', 'Note', 'text', NULL, 0, 1, '2020-11-25 03:57:09', '2020-11-25 03:57:09'),
(17, 1, 1, 2, 'Note', 'Note', 'text', NULL, 0, 1, '2020-11-25 03:57:09', '2020-11-25 03:57:09'),
(18, 1, 1, 2, 'Note', 'Note', 'text', NULL, 0, 1, '2020-11-25 03:57:10', '2020-11-25 03:57:10'),
(19, 1, 1, 2, 'Note', 'Note', 'text', NULL, 0, 1, '2020-11-25 03:57:10', '2020-11-25 03:57:10'),
(20, 1, 1, 2, 'noteaa', 'noteaa', 'text', NULL, 0, 1, '2020-11-25 09:01:50', '2020-11-25 09:01:50'),
(21, 2, 2, 3, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(22, 2, 2, 3, 'status', 'Status', 'label', NULL, 0, 0, '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(23, 2, 2, 3, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(24, 2, 2, 3, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(25, 1, 1, 4, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(26, 1, 1, 4, 'status', 'Status', 'label', NULL, 0, 0, '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(27, 1, 1, 4, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(28, 1, 1, 4, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(29, 1, 1, 5, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(30, 1, 1, 5, 'status', 'Status', 'label', NULL, 0, 0, '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(31, 1, 1, 5, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(32, 1, 1, 5, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(33, 1, 1, 6, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(34, 1, 1, 6, 'status', 'Status', 'label', NULL, 0, 0, '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(35, 1, 1, 6, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(36, 1, 1, 6, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(37, 1, 1, 7, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(38, 1, 1, 7, 'status', 'Status', 'label', NULL, 0, 0, '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(39, 1, 1, 7, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(40, 1, 1, 7, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(41, 3, 3, 8, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(42, 3, 3, 8, 'status', 'Status', 'label', NULL, 0, 0, '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(43, 3, 3, 8, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(44, 3, 3, 8, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(45, 3, 3, 9, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(46, 3, 3, 9, 'status', 'Status', 'label', NULL, 0, 0, '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(47, 3, 3, 9, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(48, 3, 3, 9, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(49, 1, 1, 10, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(50, 1, 1, 10, 'status', 'Status', 'label', NULL, 0, 0, '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(51, 1, 1, 10, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(52, 1, 1, 10, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(53, 4, 4, 11, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-02 03:30:32', '2020-12-02 03:30:32'),
(55, 4, 4, 11, 'due_date', 'Due Date', 'date', NULL, 0, 1, '2020-12-02 03:30:32', '2020-12-02 07:37:08'),
(56, 4, 4, 11, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-02 03:30:32', '2020-12-02 03:30:32'),
(57, 4, 4, 12, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(58, 4, 4, 12, 'status', 'Status', 'label', NULL, 0, 1, '2020-12-02 03:38:55', '2020-12-03 07:36:27'),
(59, 4, 4, 12, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(60, 4, 4, 12, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(61, 1, 1, 13, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(62, 1, 1, 13, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(63, 1, 1, 13, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(64, 1, 1, 13, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(69, 4, 4, 14, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(70, 4, 4, 14, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(71, 4, 4, 14, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(72, 4, 4, 14, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(73, 1, 1, 15, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(74, 1, 1, 15, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(75, 1, 1, 15, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(76, 1, 1, 15, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(78, 4, 4, 16, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(79, 4, 4, 16, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(80, 4, 4, 16, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(81, 4, 4, 16, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(82, 4, 1, 17, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(83, 4, 1, 17, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(84, 4, 1, 17, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(85, 4, 1, 17, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(86, 4, 4, 18, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(87, 4, 4, 18, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(88, 4, 4, 18, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(89, 4, 4, 18, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(90, 4, 4, 19, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(91, 4, 4, 19, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(92, 4, 4, 19, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(93, 4, 4, 19, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(94, 4, 4, 20, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(95, 4, 4, 20, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(96, 4, 4, 20, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(97, 4, 4, 20, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(99, 5, 5, 21, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(100, 5, 5, 21, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(101, 5, 5, 21, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(102, 5, 5, 21, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(103, 4, 6, 22, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(104, 4, 6, 22, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(105, 4, 6, 22, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(106, 4, 6, 22, 'priority', 'Priority', 'label', NULL, 0, 1, '2020-12-10 07:53:30', '2020-12-12 12:25:30'),
(107, 5, 6, 23, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(108, 5, 6, 23, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(109, 5, 6, 23, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(110, 5, 6, 23, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(111, 4, 6, 24, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(112, 4, 6, 24, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(113, 4, 6, 24, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(114, 4, 6, 24, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(115, 4, 6, 25, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(116, 4, 6, 25, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(117, 4, 6, 25, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(118, 4, 6, 25, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(119, 4, 6, 22, 'new', 'Người 2', 'person', NULL, 0, 1, '2020-12-12 12:25:13', '2020-12-12 12:25:19'),
(120, 4, 6, 22, 'người 3', 'người 3', 'person', NULL, 0, 1, '2020-12-12 12:25:40', '2020-12-12 12:25:40'),
(121, 4, 7, 26, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(122, 4, 7, 26, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(123, 4, 7, 26, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(124, 4, 7, 26, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(125, 4, 8, 27, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(126, 4, 8, 27, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(127, 4, 8, 27, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(128, 4, 8, 27, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(129, 4, 8, 28, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(130, 4, 8, 28, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(131, 4, 8, 28, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(132, 4, 8, 28, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(133, 4, 4, 29, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(134, 4, 4, 29, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(135, 4, 4, 29, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(136, 4, 4, 29, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(137, 4, 4, 29, 'Hello', 'Hello', 'text', NULL, 0, 1, '2020-12-15 16:04:17', '2020-12-15 16:04:17'),
(144, 4, 4, 29, 'New', 'New', 'text', NULL, 0, 1, '2020-12-15 17:24:24', '2020-12-15 17:24:24'),
(145, 4, 4, 30, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-15 17:39:42', '2020-12-15 17:39:42'),
(146, 4, 4, 30, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-15 17:39:42', '2020-12-15 17:39:42'),
(147, 4, 4, 30, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-15 17:39:42', '2020-12-15 17:39:42'),
(148, 4, 4, 30, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-15 17:39:42', '2020-12-15 17:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `field_rules`
--

CREATE TABLE `field_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `board_id` bigint(20) UNSIGNED NOT NULL,
  `field_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `field_rules`
--

INSERT INTO `field_rules` (`id`, `user_id`, `team_id`, `board_id`, `field_id`, `name`, `reference`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 'bg', 'options', '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(2, 1, 1, 1, 4, 'bg', 'options', '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(3, 1, 1, 2, 6, 'bg', 'options', '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(4, 1, 1, 2, 8, 'bg', 'options', '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(5, 2, 2, 3, 22, 'bg', 'options', '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(6, 2, 2, 3, 24, 'bg', 'options', '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(7, 1, 1, 4, 26, 'bg', 'options', '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(8, 1, 1, 4, 28, 'bg', 'options', '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(9, 1, 1, 5, 30, 'bg', 'options', '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(10, 1, 1, 5, 32, 'bg', 'options', '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(11, 1, 1, 6, 34, 'bg', 'options', '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(12, 1, 1, 6, 36, 'bg', 'options', '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(13, 1, 1, 7, 38, 'bg', 'options', '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(14, 1, 1, 7, 40, 'bg', 'options', '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(15, 3, 3, 8, 42, 'bg', 'options', '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(16, 3, 3, 8, 44, 'bg', 'options', '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(17, 3, 3, 9, 46, 'bg', 'options', '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(18, 3, 3, 9, 48, 'bg', 'options', '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(19, 1, 1, 10, 50, 'bg', 'options', '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(20, 1, 1, 10, 52, 'bg', 'options', '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(21, 4, 4, 11, 54, 'bg', 'options', '2020-12-02 03:30:32', '2020-12-02 03:30:32'),
(22, 4, 4, 11, 56, 'bg', 'options', '2020-12-02 03:30:32', '2020-12-02 03:30:32'),
(23, 4, 4, 12, 58, 'bg', 'options', '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(24, 4, 4, 12, 60, 'bg', 'options', '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(25, 1, 1, 13, 62, 'bg', 'options', '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(26, 1, 1, 13, 64, 'bg', 'options', '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(27, 4, 4, 14, 70, 'bg', 'options', '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(28, 4, 4, 14, 72, 'bg', 'options', '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(29, 1, 1, 15, 74, 'bg', 'options', '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(30, 1, 1, 15, 76, 'bg', 'options', '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(31, 4, 4, 16, 79, 'bg', 'options', '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(32, 4, 4, 16, 81, 'bg', 'options', '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(33, 4, 1, 17, 83, 'bg', 'options', '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(34, 4, 1, 17, 85, 'bg', 'options', '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(35, 4, 4, 18, 87, 'bg', 'options', '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(36, 4, 4, 18, 89, 'bg', 'options', '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(37, 4, 4, 19, 91, 'bg', 'options', '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(38, 4, 4, 19, 93, 'bg', 'options', '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(39, 4, 4, 20, 95, 'bg', 'options', '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(40, 4, 4, 20, 97, 'bg', 'options', '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(41, 5, 5, 21, 100, 'bg', 'options', '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(42, 5, 5, 21, 102, 'bg', 'options', '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(43, 4, 6, 22, 104, 'bg', 'options', '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(44, 4, 6, 22, 106, 'bg', 'options', '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(45, 5, 6, 23, 108, 'bg', 'options', '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(46, 5, 6, 23, 110, 'bg', 'options', '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(47, 4, 6, 24, 112, 'bg', 'options', '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(48, 4, 6, 24, 114, 'bg', 'options', '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(49, 4, 6, 25, 116, 'bg', 'options', '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(50, 4, 6, 25, 118, 'bg', 'options', '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(51, 4, 7, 26, 122, 'bg', 'options', '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(52, 4, 7, 26, 124, 'bg', 'options', '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(53, 4, 8, 27, 126, 'bg', 'options', '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(54, 4, 8, 27, 128, 'bg', 'options', '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(55, 4, 8, 28, 130, 'bg', 'options', '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(56, 4, 8, 28, 132, 'bg', 'options', '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(57, 4, 4, 29, 134, 'bg', 'options', '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(58, 4, 4, 29, 136, 'bg', 'options', '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(59, 4, 4, 30, 146, 'bg', 'options', '2020-12-15 17:39:42', '2020-12-15 17:39:42'),
(60, 4, 4, 30, 148, 'bg', 'options', '2020-12-15 17:39:42', '2020-12-15 17:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `field_values`
--

CREATE TABLE `field_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `field_id` bigint(20) UNSIGNED NOT NULL,
  `entity_id` bigint(20) UNSIGNED NOT NULL,
  `resource` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `time_value` time DEFAULT NULL,
  `decimal_value` decimal(8,2) DEFAULT NULL,
  `check_value` tinyint(1) DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `field_values`
--

INSERT INTO `field_values` (`id`, `user_id`, `team_id`, `field_id`, `entity_id`, `resource`, `field_name`, `value`, `date_value`, `time_value`, `decimal_value`, `check_value`, `text_value`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, 1, 'item', 'owner', 'Thanh', NULL, NULL, NULL, NULL, NULL, '2020-11-25 03:56:43', '2020-11-25 03:56:46'),
(2, 1, 1, 6, 1, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-11-25 03:56:43', '2020-11-25 03:56:48'),
(3, 1, 1, 7, 1, 'item', 'due_date', '2020-11-26', NULL, NULL, NULL, NULL, NULL, '2020-11-25 03:56:43', '2020-11-25 03:56:50'),
(4, 1, 1, 8, 1, 'item', 'priority', 'medium', NULL, NULL, NULL, NULL, NULL, '2020-11-25 03:56:43', '2020-11-25 03:56:53'),
(5, 1, 1, 9, 1, 'item', 'Note', '', NULL, NULL, NULL, NULL, NULL, '2020-11-25 09:02:01', '2020-11-25 09:02:01'),
(6, 1, 1, 10, 1, 'item', 'Note', '', NULL, NULL, NULL, NULL, NULL, '2020-11-25 09:02:01', '2020-11-25 09:02:01'),
(7, 1, 1, 11, 1, 'item', 'Note', '', NULL, NULL, NULL, NULL, NULL, '2020-11-25 09:02:01', '2020-11-25 09:02:01'),
(8, 1, 1, 12, 1, 'item', 'Note', '', NULL, NULL, NULL, NULL, NULL, '2020-11-25 09:02:01', '2020-11-25 09:02:01'),
(9, 1, 1, 13, 1, 'item', 'Note', '', NULL, NULL, NULL, NULL, NULL, '2020-11-25 09:02:01', '2020-11-25 09:02:01'),
(10, 1, 1, 14, 1, 'item', 'Note', '', NULL, NULL, NULL, NULL, NULL, '2020-11-25 09:02:01', '2020-11-25 09:02:01'),
(11, 1, 1, 15, 1, 'item', 'Note', '', NULL, NULL, NULL, NULL, NULL, '2020-11-25 09:02:01', '2020-11-25 09:02:01'),
(12, 1, 1, 16, 1, 'item', 'Note', '', NULL, NULL, NULL, NULL, NULL, '2020-11-25 09:02:01', '2020-11-25 09:02:01'),
(13, 1, 1, 17, 1, 'item', 'Note', '', NULL, NULL, NULL, NULL, NULL, '2020-11-25 09:02:01', '2020-11-25 09:02:01'),
(14, 1, 1, 18, 1, 'item', 'Note', '', NULL, NULL, NULL, NULL, NULL, '2020-11-25 09:02:01', '2020-11-25 09:02:01'),
(15, 1, 1, 19, 1, 'item', 'Note', '', NULL, NULL, NULL, NULL, NULL, '2020-11-25 09:02:01', '2020-11-25 09:02:01'),
(16, 1, 1, 20, 1, 'item', 'noteaa', 'aafsdaf', NULL, NULL, NULL, NULL, NULL, '2020-11-25 09:02:01', '2020-11-25 09:02:01'),
(17, 1, 1, 1, 2, 'item', 'owner', 'Thanh', NULL, NULL, NULL, NULL, NULL, '2020-11-25 10:13:15', '2020-11-25 10:13:19'),
(18, 1, 1, 2, 2, 'item', 'status', 'backlog', NULL, NULL, NULL, NULL, NULL, '2020-11-25 10:13:15', '2020-11-25 10:13:21'),
(19, 1, 1, 3, 2, 'item', 'due_date', '2020-11-25', NULL, NULL, NULL, NULL, NULL, '2020-11-25 10:13:15', '2020-11-25 10:13:25'),
(20, 1, 1, 4, 2, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-11-25 10:13:15', '2020-11-25 10:13:33'),
(21, 1, 1, 2, 3, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-11-25 10:13:44', '2020-11-25 10:13:44'),
(22, 1, 1, 1, 3, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-11-25 10:14:46', '2020-11-25 10:14:46'),
(23, 1, 1, 3, 3, 'item', 'due_date', '2020-11-26', NULL, NULL, NULL, NULL, NULL, '2020-11-25 10:14:46', '2020-11-26 23:46:10'),
(24, 1, 1, 4, 3, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-11-25 10:14:46', '2020-11-25 10:18:48'),
(25, 1, 1, 1, 4, 'item', 'owner', 'Thanh', NULL, NULL, NULL, NULL, NULL, '2020-11-26 23:45:31', '2020-11-26 23:45:34'),
(26, 1, 1, 2, 4, 'item', 'status', 'backlog', NULL, NULL, NULL, NULL, NULL, '2020-11-26 23:45:31', '2020-11-26 23:45:37'),
(27, 1, 1, 3, 4, 'item', 'due_date', '2020-11-25', NULL, NULL, NULL, NULL, NULL, '2020-11-26 23:45:31', '2020-11-26 23:45:40'),
(28, 1, 1, 4, 4, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-11-26 23:45:31', '2020-11-26 23:45:43'),
(29, 3, 3, 41, 5, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-11-30 03:46:10', '2020-11-30 03:46:10'),
(30, 3, 3, 42, 5, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-11-30 03:46:10', '2020-11-30 03:46:10'),
(31, 3, 3, 43, 5, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-11-30 03:46:10', '2020-11-30 03:46:10'),
(32, 3, 3, 44, 5, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-11-30 03:46:10', '2020-11-30 03:46:10'),
(33, 3, 3, 41, 6, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-11-30 03:46:12', '2020-11-30 03:46:12'),
(34, 3, 3, 42, 6, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-11-30 03:46:12', '2020-11-30 03:46:12'),
(35, 3, 3, 43, 6, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-11-30 03:46:12', '2020-11-30 03:46:12'),
(36, 3, 3, 44, 6, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-11-30 03:46:12', '2020-11-30 03:46:12'),
(37, 1, 1, 37, 7, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-11-30 04:11:02', '2020-11-30 04:11:02'),
(38, 1, 1, 38, 7, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-11-30 04:11:02', '2020-11-30 04:11:02'),
(39, 1, 1, 39, 7, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-11-30 04:11:02', '2020-11-30 04:11:02'),
(40, 1, 1, 40, 7, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-11-30 04:11:02', '2020-11-30 04:11:02'),
(41, 4, 4, 53, 8, 'item', 'owner', 'Nguyen Trung Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:35:20', '2020-12-02 07:35:25'),
(42, 4, 4, 54, 8, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:35:20', '2020-12-02 07:36:19'),
(43, 4, 4, 55, 8, 'item', 'due_date', '2020-12-03', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:35:20', '2020-12-02 07:35:30'),
(44, 4, 4, 56, 8, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:35:20', '2020-12-02 07:35:33'),
(45, 4, 4, 66, 8, 'item', 'Nani', 'Nguyen Trung Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:37:23', '2020-12-02 07:41:46'),
(46, 4, 4, 67, 8, 'item', 'Nani', 'Nguyen Trung Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:41:25', '2020-12-02 07:41:46'),
(47, 4, 4, 68, 8, 'item', 'Naninini', 'aaa', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:41:35', '2020-12-02 07:41:37'),
(48, 4, 4, 53, 9, 'item', 'owner', 'Nguyen Trung Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:47:02', '2020-12-02 07:47:05'),
(49, 4, 4, 54, 9, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:47:02', '2020-12-02 07:47:12'),
(50, 4, 4, 55, 9, 'item', 'due_date', '2020-12-02', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:47:02', '2020-12-02 07:47:14'),
(51, 4, 4, 56, 9, 'item', 'priority', 'medium', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:47:02', '2020-12-02 07:47:17'),
(52, 4, 4, 66, 9, 'item', 'Nani', '', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:47:02', '2020-12-02 07:47:02'),
(53, 4, 4, 67, 9, 'item', 'Nani', '', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:47:02', '2020-12-02 07:47:02'),
(54, 4, 4, 68, 9, 'item', 'Naninini', '', NULL, NULL, NULL, NULL, NULL, '2020-12-02 07:47:02', '2020-12-02 07:47:02'),
(55, 1, 1, 73, 10, 'item', 'owner', 'Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:51:57', '2020-12-03 00:52:00'),
(56, 1, 1, 74, 10, 'item', 'status', 'schedule', NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:51:57', '2020-12-03 00:52:05'),
(57, 1, 1, 75, 10, 'item', 'due_date', '2020-12-24', NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:51:57', '2020-12-03 00:52:10'),
(58, 1, 1, 76, 10, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-12-03 00:51:57', '2020-12-03 00:52:13'),
(59, 4, 4, 53, 11, 'item', 'owner', 'Nguyen Trung Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-03 03:48:53', '2020-12-03 03:48:56'),
(60, 4, 4, 54, 11, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-03 03:48:53', '2020-12-03 03:48:57'),
(61, 4, 4, 55, 11, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 03:48:53', '2020-12-03 03:48:53'),
(62, 4, 4, 56, 11, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-12-03 03:48:53', '2020-12-03 03:49:02'),
(63, 4, 4, 66, 11, 'item', 'Nani', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 03:48:53', '2020-12-03 03:48:53'),
(64, 4, 4, 67, 11, 'item', 'Nani', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 03:48:53', '2020-12-03 03:48:53'),
(65, 4, 4, 68, 11, 'item', 'Naninini', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 03:48:53', '2020-12-03 03:48:53'),
(66, 4, 4, 57, 12, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 03:56:31', '2020-12-03 03:56:31'),
(67, 4, 4, 58, 12, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-03 03:56:31', '2020-12-03 03:56:34'),
(68, 4, 4, 59, 12, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 03:56:31', '2020-12-03 03:56:31'),
(69, 4, 4, 60, 12, 'item', 'priority', 'high', NULL, NULL, NULL, NULL, NULL, '2020-12-03 03:56:31', '2020-12-03 03:56:52'),
(70, 4, 4, 53, 13, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:06:05', '2020-12-03 05:06:05'),
(71, 4, 4, 54, 13, 'item', 'status', 'delegate', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:06:05', '2020-12-03 07:07:59'),
(72, 4, 4, 55, 13, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:06:05', '2020-12-03 05:06:05'),
(73, 4, 4, 56, 13, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:06:05', '2020-12-03 05:06:05'),
(74, 4, 4, 66, 13, 'item', 'Nani', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:06:05', '2020-12-03 05:06:05'),
(75, 4, 4, 67, 13, 'item', 'Nani', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:06:05', '2020-12-03 05:06:05'),
(76, 4, 4, 68, 13, 'item', 'Naninini', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:06:05', '2020-12-03 05:06:05'),
(77, 4, 4, 53, 14, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:36:19', '2020-12-03 05:36:19'),
(78, 4, 4, 54, 14, 'item', 'status', 'schedule', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:36:19', '2020-12-03 05:36:24'),
(79, 4, 4, 55, 14, 'item', 'due_date', '2020-12-03', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:36:19', '2020-12-03 05:36:35'),
(80, 4, 4, 56, 14, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:36:19', '2020-12-03 05:36:38'),
(81, 4, 4, 66, 14, 'item', 'Nani', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:36:19', '2020-12-03 05:36:19'),
(82, 4, 4, 67, 14, 'item', 'Nani', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:36:19', '2020-12-03 05:36:19'),
(83, 4, 4, 68, 14, 'item', 'Naninini', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:36:19', '2020-12-03 05:36:19'),
(84, 4, 4, 57, 15, 'item', 'owner', 'Nguyen Trung Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:37:17', '2020-12-03 05:37:42'),
(85, 4, 4, 58, 15, 'item', 'status', 'backlog', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:37:17', '2020-12-03 05:47:38'),
(86, 4, 4, 59, 15, 'item', 'due_date', '2020-12-04', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:37:17', '2020-12-03 05:38:05'),
(87, 4, 4, 60, 15, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:37:17', '2020-12-03 05:38:07'),
(88, 4, 4, 77, 15, 'item', 'Number', 'Nguyen Trung Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:38:21', '2020-12-03 05:39:23'),
(89, 4, 4, 57, 16, 'item', 'owner', 'Nguyen Trung Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:47:50', '2020-12-03 05:47:53'),
(90, 4, 4, 58, 16, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:47:50', '2020-12-04 02:25:16'),
(91, 4, 4, 59, 16, 'item', 'due_date', '2020-12-04', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:47:50', '2020-12-04 02:24:59'),
(92, 4, 4, 60, 16, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:47:50', '2020-12-03 05:47:50'),
(93, 4, 4, 77, 16, 'item', 'Number', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 05:47:50', '2020-12-03 05:47:50'),
(94, 4, 4, 53, 17, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:39', '2020-12-03 07:26:39'),
(95, 4, 4, 54, 17, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:39', '2020-12-03 07:26:39'),
(96, 4, 4, 55, 17, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:39', '2020-12-03 07:26:39'),
(97, 4, 4, 56, 17, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:40', '2020-12-03 07:26:40'),
(98, 4, 4, 66, 17, 'item', 'Nani', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:40', '2020-12-03 07:26:40'),
(99, 4, 4, 67, 17, 'item', 'Nani', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:40', '2020-12-03 07:26:40'),
(100, 4, 4, 68, 17, 'item', 'Naninini', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:40', '2020-12-03 07:26:40'),
(101, 4, 4, 53, 18, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:59', '2020-12-03 07:26:59'),
(102, 4, 4, 54, 18, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:59', '2020-12-03 07:26:59'),
(103, 4, 4, 55, 18, 'item', 'due_date', '2020-12-05', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:59', '2020-12-04 02:24:48'),
(104, 4, 4, 56, 18, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:59', '2020-12-03 07:26:59'),
(105, 4, 4, 66, 18, 'item', 'Nani', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:59', '2020-12-03 07:26:59'),
(106, 4, 4, 67, 18, 'item', 'Nani', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:59', '2020-12-03 07:26:59'),
(107, 4, 4, 68, 18, 'item', 'Naninini', '', NULL, NULL, NULL, NULL, NULL, '2020-12-03 07:26:59', '2020-12-03 07:26:59'),
(108, 4, 1, 82, 19, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-04 02:28:30', '2020-12-04 02:28:30'),
(109, 4, 1, 83, 19, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-04 02:28:30', '2020-12-04 02:28:30'),
(110, 4, 1, 84, 19, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-04 02:28:30', '2020-12-04 02:28:30'),
(111, 4, 1, 85, 19, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-04 02:28:30', '2020-12-04 02:28:30'),
(112, 4, 4, 90, 20, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:10:06', '2020-12-08 14:10:06'),
(113, 4, 4, 91, 20, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:10:06', '2020-12-08 14:10:06'),
(114, 4, 4, 92, 20, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:10:06', '2020-12-08 14:10:06'),
(115, 4, 4, 93, 20, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:10:06', '2020-12-08 14:10:06'),
(116, 4, 4, 90, 21, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:10:09', '2020-12-08 14:10:09'),
(117, 4, 4, 91, 21, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:10:09', '2020-12-08 15:16:48'),
(118, 4, 4, 92, 21, 'item', 'due_date', '2020-12-09', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:10:09', '2020-12-08 15:16:49'),
(119, 4, 4, 93, 21, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:10:09', '2020-12-08 14:10:09'),
(120, 4, 4, 90, 22, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:10:12', '2020-12-08 14:10:12'),
(121, 4, 4, 91, 22, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:10:12', '2020-12-08 14:10:12'),
(122, 4, 4, 92, 22, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:10:12', '2020-12-08 14:10:12'),
(123, 4, 4, 93, 22, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:10:12', '2020-12-08 14:10:12'),
(124, 4, 4, 57, 23, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:19:27', '2020-12-08 14:19:27'),
(125, 4, 4, 58, 23, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:19:27', '2020-12-08 14:19:27'),
(126, 4, 4, 59, 23, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:19:27', '2020-12-08 14:19:27'),
(127, 4, 4, 60, 23, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:19:27', '2020-12-08 14:19:27'),
(128, 4, 4, 57, 24, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:19:40', '2020-12-08 14:19:40'),
(129, 4, 4, 58, 24, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:19:40', '2020-12-08 14:19:40'),
(130, 4, 4, 59, 24, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:19:40', '2020-12-08 14:19:40'),
(131, 4, 4, 60, 24, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:19:40', '2020-12-08 14:19:40'),
(132, 4, 4, 94, 25, 'item', 'owner', 'Nguyen Trung Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:31:41', '2020-12-08 14:44:08'),
(133, 4, 4, 95, 25, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:31:41', '2020-12-08 14:44:11'),
(134, 4, 4, 96, 25, 'item', 'due_date', '2020-12-09', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:31:41', '2020-12-08 14:44:14'),
(135, 4, 4, 97, 25, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:31:41', '2020-12-08 14:44:21'),
(136, 4, 4, 94, 26, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:32:01', '2020-12-08 14:32:01'),
(137, 4, 4, 95, 26, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:32:01', '2020-12-08 14:32:01'),
(138, 4, 4, 96, 26, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:32:01', '2020-12-08 14:32:01'),
(139, 4, 4, 97, 26, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:32:01', '2020-12-08 14:32:01'),
(140, 4, 4, 94, 27, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:32:11', '2020-12-08 14:32:11'),
(141, 4, 4, 95, 27, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:32:11', '2020-12-08 14:32:11'),
(142, 4, 4, 96, 27, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:32:11', '2020-12-08 14:32:11'),
(143, 4, 4, 97, 27, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:32:11', '2020-12-08 14:32:11'),
(144, 4, 4, 94, 28, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:33:53', '2020-12-08 14:33:53'),
(145, 4, 4, 95, 28, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:33:53', '2020-12-08 14:33:53'),
(146, 4, 4, 96, 28, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:33:53', '2020-12-08 14:33:53'),
(147, 4, 4, 97, 28, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:33:53', '2020-12-08 14:33:53'),
(148, 4, 4, 98, 25, 'item', 'Tag', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:45:04', '2020-12-08 14:45:07'),
(149, 4, 4, 57, 29, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:51:42', '2020-12-08 14:51:42'),
(150, 4, 4, 58, 29, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:51:42', '2020-12-08 14:51:42'),
(151, 4, 4, 59, 29, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:51:42', '2020-12-08 14:51:42'),
(152, 4, 4, 60, 29, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 14:51:42', '2020-12-08 14:51:42'),
(153, 4, 4, 57, 30, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 15:09:13', '2020-12-08 15:09:13'),
(154, 4, 4, 58, 30, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 15:09:13', '2020-12-08 15:09:13'),
(155, 4, 4, 59, 30, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 15:09:13', '2020-12-08 15:09:13'),
(156, 4, 4, 60, 30, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-08 15:09:13', '2020-12-08 15:09:13'),
(157, 4, 4, 57, 31, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-09 11:58:03', '2020-12-09 11:58:03'),
(158, 4, 4, 58, 31, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-09 11:58:03', '2020-12-09 11:58:03'),
(159, 4, 4, 59, 31, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-09 11:58:04', '2020-12-09 11:58:04'),
(160, 4, 4, 60, 31, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-09 11:58:04', '2020-12-09 11:58:04'),
(161, 5, 6, 107, 32, 'item', 'owner', 'Thanh NT', NULL, NULL, NULL, NULL, NULL, '2020-12-10 07:54:29', '2020-12-12 07:48:06'),
(162, 5, 6, 108, 32, 'item', 'status', 'schedule', NULL, NULL, NULL, NULL, NULL, '2020-12-10 07:54:29', '2020-12-12 07:48:11'),
(163, 5, 6, 109, 32, 'item', 'due_date', '2020-12-13', NULL, NULL, NULL, NULL, NULL, '2020-12-10 07:54:29', '2020-12-12 07:48:13'),
(164, 5, 6, 110, 32, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-12-10 07:54:29', '2020-12-12 07:48:16'),
(165, 4, 6, 103, 33, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-10 08:16:52', '2020-12-10 08:16:52'),
(166, 4, 6, 104, 33, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-10 08:16:52', '2020-12-10 08:16:56'),
(167, 4, 6, 105, 33, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-10 08:16:52', '2020-12-10 08:16:52'),
(168, 4, 6, 106, 33, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-10 08:16:52', '2020-12-10 08:16:52'),
(169, 5, 5, 99, 34, 'item', 'owner', 'Thanh NT', NULL, NULL, NULL, NULL, NULL, '2020-12-12 07:45:46', '2020-12-12 07:45:48'),
(170, 5, 5, 100, 34, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-12 07:45:46', '2020-12-12 07:45:50'),
(171, 5, 5, 101, 34, 'item', 'due_date', '2020-12-13', NULL, NULL, NULL, NULL, NULL, '2020-12-12 07:45:46', '2020-12-12 07:45:52'),
(172, 5, 5, 102, 34, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-12-12 07:45:46', '2020-12-12 07:45:54'),
(173, 5, 5, 99, 35, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 07:45:58', '2020-12-12 07:45:58'),
(174, 5, 5, 100, 35, 'item', 'status', 'schedule', NULL, NULL, NULL, NULL, NULL, '2020-12-12 07:45:58', '2020-12-12 07:46:04'),
(175, 5, 5, 101, 35, 'item', 'due_date', '2020-12-13', NULL, NULL, NULL, NULL, NULL, '2020-12-12 07:45:58', '2020-12-12 07:46:07'),
(176, 5, 5, 102, 35, 'item', 'priority', 'medium', NULL, NULL, NULL, NULL, NULL, '2020-12-12 07:45:58', '2020-12-12 07:46:09'),
(177, 5, 6, 107, 36, 'item', 'owner', 'Nguyen Trung Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-12 07:49:01', '2020-12-12 07:49:02'),
(178, 5, 6, 108, 36, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-12 07:49:01', '2020-12-12 07:49:05'),
(179, 5, 6, 109, 36, 'item', 'due_date', '2020-12-13', NULL, NULL, NULL, NULL, NULL, '2020-12-12 07:49:01', '2020-12-12 07:49:08'),
(180, 5, 6, 110, 36, 'item', 'priority', 'high', NULL, NULL, NULL, NULL, NULL, '2020-12-12 07:49:01', '2020-12-12 07:49:10'),
(181, 4, 6, 103, 37, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 11:28:11', '2020-12-12 11:28:11'),
(182, 4, 6, 104, 37, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 11:28:11', '2020-12-12 11:28:11'),
(183, 4, 6, 105, 37, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 11:28:11', '2020-12-12 11:28:11'),
(184, 4, 6, 106, 37, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 11:28:11', '2020-12-12 11:28:11'),
(185, 4, 6, 103, 38, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 11:54:23', '2020-12-12 11:54:23'),
(186, 4, 6, 104, 38, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 11:54:23', '2020-12-12 11:54:23'),
(187, 4, 6, 105, 38, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 11:54:23', '2020-12-12 11:54:23'),
(188, 4, 6, 106, 38, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 11:54:23', '2020-12-12 11:54:23'),
(189, 4, 6, 103, 39, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 11:59:52', '2020-12-12 11:59:52'),
(190, 4, 6, 104, 39, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 11:59:52', '2020-12-12 11:59:52'),
(191, 4, 6, 105, 39, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 11:59:52', '2020-12-12 11:59:52'),
(192, 4, 6, 106, 39, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 11:59:52', '2020-12-12 11:59:52'),
(193, 4, 6, 103, 40, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:00:05', '2020-12-12 12:00:05'),
(194, 4, 6, 104, 40, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:00:05', '2020-12-12 12:00:05'),
(195, 4, 6, 105, 40, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:00:05', '2020-12-12 12:00:05'),
(196, 4, 6, 106, 40, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:00:05', '2020-12-12 12:00:05'),
(197, 4, 6, 103, 41, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:11:50', '2020-12-12 12:11:50'),
(198, 4, 6, 104, 41, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:11:50', '2020-12-12 12:11:50'),
(199, 4, 6, 105, 41, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:11:50', '2020-12-12 12:11:50'),
(200, 4, 6, 106, 41, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:11:51', '2020-12-12 12:11:51'),
(201, 4, 6, 103, 42, 'item', 'owner', 'Thanh NT', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:21:51', '2020-12-12 12:25:57'),
(202, 4, 6, 104, 42, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:21:51', '2020-12-12 13:12:27'),
(203, 4, 6, 105, 42, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:21:51', '2020-12-12 12:21:51'),
(204, 4, 6, 106, 42, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:21:51', '2020-12-12 12:21:51'),
(205, 4, 6, 103, 43, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:21:59', '2020-12-12 12:21:59'),
(206, 4, 6, 104, 43, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:21:59', '2020-12-12 12:21:59'),
(207, 4, 6, 105, 43, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:21:59', '2020-12-12 12:21:59'),
(208, 4, 6, 106, 43, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:21:59', '2020-12-12 12:21:59'),
(209, 4, 6, 103, 44, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:23:23', '2020-12-12 12:23:23'),
(210, 4, 6, 104, 44, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:23:23', '2020-12-12 12:23:23'),
(211, 4, 6, 105, 44, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:23:23', '2020-12-12 12:23:23'),
(212, 4, 6, 106, 44, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:23:23', '2020-12-12 12:23:23'),
(213, 4, 6, 119, 42, 'item', 'new', 'Nguyen Trung Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:25:22', '2020-12-12 12:25:22'),
(214, 4, 6, 120, 42, 'item', 'người 3', 'Thanh NT', NULL, NULL, NULL, NULL, NULL, '2020-12-12 12:25:43', '2020-12-12 12:25:43'),
(215, 4, 4, 57, 45, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 15:53:00', '2020-12-12 15:53:00'),
(216, 4, 4, 58, 45, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-12 15:53:00', '2020-12-12 15:53:02'),
(217, 4, 4, 59, 45, 'item', 'due_date', '2020-12-12', NULL, NULL, NULL, NULL, NULL, '2020-12-12 15:53:00', '2020-12-12 15:53:05'),
(218, 4, 4, 60, 45, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-12 15:53:00', '2020-12-12 15:53:00'),
(219, 4, 4, 57, 46, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 04:38:11', '2020-12-15 04:38:11'),
(220, 4, 4, 58, 46, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 04:38:11', '2020-12-15 04:38:11'),
(221, 4, 4, 59, 46, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 04:38:11', '2020-12-15 04:38:11'),
(222, 4, 4, 60, 46, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 04:38:11', '2020-12-15 04:38:11'),
(223, 4, 4, 133, 47, 'item', 'owner', 'Nguyen Trung Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-15 15:53:06', '2020-12-15 16:03:57'),
(224, 4, 4, 134, 47, 'item', 'status', 'delete', NULL, NULL, NULL, NULL, NULL, '2020-12-15 15:53:06', '2020-12-15 16:37:01'),
(225, 4, 4, 135, 47, 'item', 'due_date', '2020-12-09', NULL, NULL, NULL, NULL, NULL, '2020-12-15 15:53:06', '2020-12-15 16:03:59'),
(226, 4, 4, 136, 47, 'item', 'priority', 'medium', NULL, NULL, NULL, NULL, NULL, '2020-12-15 15:53:06', '2020-12-15 16:04:02'),
(227, 4, 4, 133, 48, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 15:53:11', '2020-12-15 15:53:11'),
(228, 4, 4, 134, 48, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-15 15:53:11', '2020-12-15 16:37:42'),
(229, 4, 4, 135, 48, 'item', 'due_date', '2020-12-16', NULL, NULL, NULL, NULL, NULL, '2020-12-15 15:53:11', '2020-12-15 16:37:45'),
(230, 4, 4, 136, 48, 'item', 'priority', 'high', NULL, NULL, NULL, NULL, NULL, '2020-12-15 15:53:12', '2020-12-15 16:37:22'),
(231, 4, 4, 137, 47, 'item', 'Hello', 'Test AA', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:04:22', '2020-12-15 16:04:38'),
(232, 4, 4, 138, 47, 'item', 'Hello', 'Test AA', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:04:38', '2020-12-15 16:04:38'),
(233, 4, 4, 133, 49, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:08:27', '2020-12-15 16:08:27'),
(234, 4, 4, 134, 49, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:08:27', '2020-12-15 16:08:27'),
(235, 4, 4, 135, 49, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:08:27', '2020-12-15 16:08:27'),
(236, 4, 4, 136, 49, 'item', 'priority', 'medium', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:08:27', '2020-12-15 17:37:45'),
(237, 4, 4, 137, 49, 'item', 'Hello', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:08:27', '2020-12-15 16:08:27'),
(238, 4, 4, 138, 49, 'item', 'Hello', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:08:27', '2020-12-15 16:08:27'),
(239, 4, 4, 137, 48, 'item', 'Hello', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:21:29', '2020-12-15 16:21:29'),
(240, 4, 4, 138, 48, 'item', 'Hello', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:21:29', '2020-12-15 16:21:29'),
(241, 4, 4, 140, 47, 'item', 'tét', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:37:01', '2020-12-15 16:37:01'),
(242, 4, 4, 141, 47, 'item', 'tét', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:37:01', '2020-12-15 16:37:01'),
(243, 4, 4, 142, 47, 'item', 'abcd', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:37:01', '2020-12-15 16:37:01'),
(244, 4, 4, 143, 47, 'item', 'abcdfasf', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:37:01', '2020-12-15 16:37:01'),
(245, 4, 4, 140, 48, 'item', 'tét', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:37:22', '2020-12-15 16:37:22'),
(246, 4, 4, 141, 48, 'item', 'tét', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:37:22', '2020-12-15 16:37:22'),
(247, 4, 4, 142, 48, 'item', 'abcd', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:37:22', '2020-12-15 16:37:22'),
(248, 4, 4, 143, 48, 'item', 'abcdfasf', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 16:37:22', '2020-12-15 16:37:22'),
(249, 4, 4, 133, 50, 'item', 'owner', 'Nguyen Trung Thanh', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:21:55', '2020-12-15 17:22:09'),
(250, 4, 4, 134, 50, 'item', 'status', 'backlog', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:21:55', '2020-12-15 17:22:25'),
(251, 4, 4, 135, 50, 'item', 'due_date', '2020-12-16', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:21:55', '2020-12-15 17:22:27'),
(252, 4, 4, 136, 50, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:21:55', '2020-12-15 17:22:30'),
(253, 4, 4, 137, 50, 'item', 'Hello', 'fsafas', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:21:55', '2020-12-15 17:23:15'),
(254, 4, 4, 138, 50, 'item', 'Hello', 'fsafas', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:21:55', '2020-12-15 17:23:15'),
(255, 4, 4, 140, 50, 'item', 'tét', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:21:55', '2020-12-15 17:21:55'),
(256, 4, 4, 141, 50, 'item', 'tét', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:21:55', '2020-12-15 17:21:55'),
(257, 4, 4, 142, 50, 'item', 'abcd', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:21:55', '2020-12-15 17:21:55'),
(258, 4, 4, 143, 50, 'item', 'abcdfasf', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:21:55', '2020-12-15 17:21:55'),
(259, 4, 4, 140, 49, 'item', 'tét', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:22:29', '2020-12-15 17:22:29'),
(260, 4, 4, 141, 49, 'item', 'tét', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:22:29', '2020-12-15 17:22:29'),
(261, 4, 4, 142, 49, 'item', 'abcd', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:22:29', '2020-12-15 17:22:29'),
(262, 4, 4, 143, 49, 'item', 'abcdfasf', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:22:29', '2020-12-15 17:22:29'),
(263, 4, 4, 133, 51, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:34:59', '2020-12-15 17:34:59'),
(264, 4, 4, 134, 51, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:34:59', '2020-12-15 17:34:59'),
(265, 4, 4, 135, 51, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:34:59', '2020-12-15 17:34:59'),
(266, 4, 4, 136, 51, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:34:59', '2020-12-15 17:36:28'),
(267, 4, 4, 137, 51, 'item', 'Hello', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:34:59', '2020-12-15 17:34:59'),
(268, 4, 4, 144, 51, 'item', 'New', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:34:59', '2020-12-15 17:34:59'),
(269, 4, 4, 144, 49, 'item', 'New', '', NULL, NULL, NULL, NULL, NULL, '2020-12-15 17:37:45', '2020-12-15 17:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `board_id` bigint(20) UNSIGNED NOT NULL,
  `stage_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `done` tinyint(1) NOT NULL DEFAULT 0,
  `commit_date` date DEFAULT NULL,
  `order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `user_id`, `team_id`, `board_id`, `stage_id`, `title`, `created_at`, `updated_at`, `done`, `commit_date`, `order`) VALUES
(1, 1, 1, 2, 2, 'heleo', '2020-11-25 03:56:43', '2020-11-25 08:06:15', 0, NULL, NULL),
(2, 1, 1, 1, 1, 'Hello', '2020-11-25 10:13:15', '2020-11-26 23:47:20', 0, NULL, NULL),
(3, 1, 1, 1, 1, 'aaaakk', '2020-11-25 10:13:44', '2020-11-26 23:46:51', 1, '2020-11-27', NULL),
(4, 1, 1, 1, 5, 'Nani kore', '2020-11-26 23:45:31', '2020-11-26 23:46:57', 1, '2020-11-27', NULL),
(5, 3, 3, 8, 11, 'fasdf', '2020-11-30 03:46:10', '2020-11-30 03:46:10', 0, NULL, NULL),
(6, 3, 3, 8, 11, 'fafaf', '2020-11-30 03:46:12', '2020-11-30 03:46:12', 0, NULL, 1),
(7, 1, 1, 7, 9, 'fasdfas', '2020-11-30 04:11:02', '2020-12-02 07:34:19', 1, '2020-12-02', NULL),
(8, 4, 4, 11, 14, 'Hoc tap 20202', '2020-12-02 07:35:20', '2020-12-02 07:48:06', 1, '2020-12-02', NULL),
(9, 4, 4, 11, 14, 'Cong viec 2', '2020-12-02 07:47:02', '2020-12-02 07:47:42', 1, '2020-12-02', 1),
(10, 1, 1, 15, 20, 'Hello', '2020-12-03 00:51:57', '2020-12-03 00:51:57', 0, NULL, NULL),
(11, 4, 4, 11, 14, 'Todo 01', '2020-12-03 03:48:53', '2020-12-03 03:55:59', 1, '2020-12-03', NULL),
(13, 4, 4, 11, 14, 'New', '2020-12-03 05:06:05', '2020-12-03 07:26:32', 1, '2020-12-03', NULL),
(14, 4, 4, 11, 18, 'Hello World 2', '2020-12-03 05:36:19', '2020-12-03 07:26:35', 1, '2020-12-03', NULL),
(15, 4, 4, 12, 15, 'Abcd 02020', '2020-12-03 05:37:17', '2020-12-03 05:47:38', 1, '2020-12-03', NULL),
(17, 4, 4, 11, 18, 'Hello', '2020-12-03 07:26:39', '2020-12-03 07:36:44', 0, NULL, 1),
(18, 4, 4, 11, 18, '22', '2020-12-03 07:26:59', '2020-12-03 07:36:44', 0, NULL, 0),
(19, 4, 1, 17, 23, 'Hello', '2020-12-04 02:28:30', '2020-12-04 02:28:30', 0, NULL, NULL),
(21, 4, 4, 19, 26, 'FASDFA', '2020-12-08 14:10:09', '2020-12-12 15:53:17', 1, '2020-12-12', NULL),
(22, 4, 4, 19, 27, 'fasdfa', '2020-12-08 14:10:12', '2020-12-08 14:10:12', 0, NULL, NULL),
(25, 4, 4, 20, 29, 'dfsafs', '2020-12-08 14:31:41', '2020-12-12 16:08:39', 1, '2020-12-12', NULL),
(26, 4, 4, 20, 30, 'fasfaff', '2020-12-08 14:32:01', '2020-12-08 14:45:21', 1, '2020-12-08', NULL),
(27, 4, 4, 20, 30, 'fdsafas', '2020-12-08 14:32:11', '2020-12-08 14:32:12', 1, '2020-12-08', 1),
(28, 4, 4, 20, 29, 'daD', '2020-12-08 14:33:53', '2020-12-08 14:33:53', 0, NULL, 1),
(37, 4, 6, 22, 34, 'fasdf', '2020-12-12 11:28:11', '2020-12-12 11:28:11', 0, NULL, NULL),
(38, 4, 6, 22, 32, 'dasd', '2020-12-12 11:54:23', '2020-12-12 11:59:55', 1, '2020-12-12', NULL),
(39, 4, 6, 22, 32, 'dasd', '2020-12-12 11:59:52', '2020-12-12 11:59:59', 1, '2020-12-12', 1),
(42, 4, 6, 22, 32, 'fasfa', '2020-12-12 12:21:50', '2020-12-12 12:21:50', 0, NULL, NULL),
(43, 4, 6, 22, 38, '4000', '2020-12-12 12:21:59', '2020-12-12 12:21:59', 0, NULL, NULL),
(44, 4, 6, 22, 39, 'fasf', '2020-12-12 12:23:23', '2020-12-12 12:23:23', 0, NULL, NULL),
(45, 4, 4, 12, 15, 'jlfksadf', '2020-12-12 15:53:00', '2020-12-12 16:08:37', 1, '2020-12-12', NULL),
(46, 4, 4, 12, 15, 'fasfas', '2020-12-15 04:38:11', '2020-12-15 04:38:11', 0, NULL, NULL),
(47, 4, 4, 29, 43, 'fasfad', '2020-12-15 15:53:06', '2020-12-15 15:53:06', 0, NULL, NULL),
(48, 4, 4, 29, 43, 'Hello 15/12/2020', '2020-12-15 15:53:11', '2020-12-15 15:53:11', 0, NULL, 1),
(49, 4, 4, 29, 44, 'efasfsa', '2020-12-15 16:08:27', '2020-12-15 16:08:27', 0, NULL, NULL),
(50, 4, 4, 29, 44, 'kkk', '2020-12-15 17:21:54', '2020-12-15 17:21:54', 0, NULL, 1),
(51, 4, 4, 29, 47, 'New', '2020-12-15 17:34:59', '2020-12-15 17:34:59', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `board_id` bigint(20) UNSIGNED NOT NULL,
  `field_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `user_id`, `team_id`, `board_id`, `field_id`, `name`, `label`, `color`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 'backlog', 'Backlog', 'white', '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(2, 1, 1, 1, 2, 'todo', 'Todo', 'green', '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(3, 1, 1, 1, 2, 'schedule', 'Schedule', 'blue', '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(4, 1, 1, 1, 2, 'delegate', 'Delegate', 'yellow', '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(5, 1, 1, 1, 2, 'delete', 'Delete', 'red', '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(6, 1, 1, 1, 4, 'low', 'Low', 'green', '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(7, 1, 1, 1, 4, 'medium', 'Medium', 'yellow', '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(8, 1, 1, 1, 4, 'high', 'High', 'red', '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(9, 1, 1, 2, 6, 'backlog', 'Backlog', 'white', '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(10, 1, 1, 2, 6, 'todo', 'Todo', 'green', '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(11, 1, 1, 2, 6, 'schedule', 'Schedule', 'blue', '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(12, 1, 1, 2, 6, 'delegate', 'Delegate', 'yellow', '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(13, 1, 1, 2, 6, 'delete', 'Delete', 'red', '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(14, 1, 1, 2, 8, 'low', 'Low', 'green', '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(15, 1, 1, 2, 8, 'medium', 'Medium', 'yellow', '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(16, 1, 1, 2, 8, 'high', 'High', 'red', '2020-11-25 03:56:10', '2020-11-25 03:56:10'),
(17, 2, 2, 3, 22, 'backlog', 'Backlog', 'white', '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(18, 2, 2, 3, 22, 'todo', 'Todo', 'green', '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(19, 2, 2, 3, 22, 'schedule', 'Schedule', 'blue', '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(20, 2, 2, 3, 22, 'delegate', 'Delegate', 'yellow', '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(21, 2, 2, 3, 22, 'delete', 'Delete', 'red', '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(22, 2, 2, 3, 24, 'low', 'Low', 'green', '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(23, 2, 2, 3, 24, 'medium', 'Medium', 'yellow', '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(24, 2, 2, 3, 24, 'high', 'High', 'red', '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(25, 1, 1, 4, 26, 'backlog', 'Backlog', 'white', '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(26, 1, 1, 4, 26, 'todo', 'Todo', 'green', '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(27, 1, 1, 4, 26, 'schedule', 'Schedule', 'blue', '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(28, 1, 1, 4, 26, 'delegate', 'Delegate', 'yellow', '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(29, 1, 1, 4, 26, 'delete', 'Delete', 'red', '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(30, 1, 1, 4, 28, 'low', 'Low', 'green', '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(31, 1, 1, 4, 28, 'medium', 'Medium', 'yellow', '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(32, 1, 1, 4, 28, 'high', 'High', 'red', '2020-11-26 23:49:26', '2020-11-26 23:49:26'),
(33, 1, 1, 5, 30, 'backlog', 'Backlog', 'white', '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(34, 1, 1, 5, 30, 'todo', 'Todo', 'green', '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(35, 1, 1, 5, 30, 'schedule', 'Schedule', 'blue', '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(36, 1, 1, 5, 30, 'delegate', 'Delegate', 'yellow', '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(37, 1, 1, 5, 30, 'delete', 'Delete', 'red', '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(38, 1, 1, 5, 32, 'low', 'Low', 'green', '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(39, 1, 1, 5, 32, 'medium', 'Medium', 'yellow', '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(40, 1, 1, 5, 32, 'high', 'High', 'red', '2020-11-27 06:13:35', '2020-11-27 06:13:35'),
(41, 1, 1, 6, 34, 'backlog', 'Backlog', 'white', '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(42, 1, 1, 6, 34, 'todo', 'Todo', 'green', '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(43, 1, 1, 6, 34, 'schedule', 'Schedule', 'blue', '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(44, 1, 1, 6, 34, 'delegate', 'Delegate', 'yellow', '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(45, 1, 1, 6, 34, 'delete', 'Delete', 'red', '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(46, 1, 1, 6, 36, 'low', 'Low', 'green', '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(47, 1, 1, 6, 36, 'medium', 'Medium', 'yellow', '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(48, 1, 1, 6, 36, 'high', 'High', 'red', '2020-11-27 06:13:55', '2020-11-27 06:13:55'),
(49, 1, 1, 7, 38, 'backlog', 'Backlog', 'white', '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(50, 1, 1, 7, 38, 'todo', 'Todo', 'green', '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(51, 1, 1, 7, 38, 'schedule', 'Schedule', 'blue', '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(52, 1, 1, 7, 38, 'delegate', 'Delegate', 'yellow', '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(53, 1, 1, 7, 38, 'delete', 'Delete', 'red', '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(54, 1, 1, 7, 40, 'low', 'Low', 'green', '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(55, 1, 1, 7, 40, 'medium', 'Medium', 'yellow', '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(56, 1, 1, 7, 40, 'high', 'High', 'red', '2020-11-30 03:10:16', '2020-11-30 03:10:16'),
(57, 3, 3, 8, 42, 'backlog', 'Backlog', 'white', '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(58, 3, 3, 8, 42, 'todo', 'Todo', 'green', '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(59, 3, 3, 8, 42, 'schedule', 'Schedule', 'blue', '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(60, 3, 3, 8, 42, 'delegate', 'Delegate', 'yellow', '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(61, 3, 3, 8, 42, 'delete', 'Delete', 'red', '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(62, 3, 3, 8, 44, 'low', 'Low', 'green', '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(63, 3, 3, 8, 44, 'medium', 'Medium', 'yellow', '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(64, 3, 3, 8, 44, 'high', 'High', 'red', '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(65, 3, 3, 9, 46, 'backlog', 'Backlog', 'white', '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(66, 3, 3, 9, 46, 'todo', 'Todo', 'green', '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(67, 3, 3, 9, 46, 'schedule', 'Schedule', 'blue', '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(68, 3, 3, 9, 46, 'delegate', 'Delegate', 'yellow', '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(69, 3, 3, 9, 46, 'delete', 'Delete', 'red', '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(70, 3, 3, 9, 48, 'low', 'Low', 'green', '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(71, 3, 3, 9, 48, 'medium', 'Medium', 'yellow', '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(72, 3, 3, 9, 48, 'high', 'High', 'red', '2020-11-30 03:46:37', '2020-11-30 03:46:37'),
(73, 1, 1, 10, 50, 'backlog', 'Backlog', 'white', '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(74, 1, 1, 10, 50, 'todo', 'Todo', 'green', '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(75, 1, 1, 10, 50, 'schedule', 'Schedule', 'blue', '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(76, 1, 1, 10, 50, 'delegate', 'Delegate', 'yellow', '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(77, 1, 1, 10, 50, 'delete', 'Delete', 'red', '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(78, 1, 1, 10, 52, 'low', 'Low', 'green', '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(79, 1, 1, 10, 52, 'medium', 'Medium', 'yellow', '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(80, 1, 1, 10, 52, 'high', 'High', 'red', '2020-11-30 03:53:26', '2020-11-30 03:53:26'),
(81, 4, 4, 11, 54, 'backlog', 'Backlog', 'white', '2020-12-02 03:30:32', '2020-12-02 03:30:32'),
(82, 4, 4, 11, 54, 'todo', 'Todo', 'green', '2020-12-02 03:30:32', '2020-12-02 03:30:32'),
(83, 4, 4, 11, 54, 'schedule', 'Schedule', 'blue', '2020-12-02 03:30:32', '2020-12-02 03:30:32'),
(84, 4, 4, 11, 54, 'delegate', 'Delegate', 'yellow', '2020-12-02 03:30:32', '2020-12-02 03:30:32'),
(85, 4, 4, 11, 54, 'delete', 'Delete', 'red', '2020-12-02 03:30:32', '2020-12-02 03:30:32'),
(86, 4, 4, 11, 56, 'low', 'Low', 'green', '2020-12-02 03:30:32', '2020-12-02 03:30:32'),
(87, 4, 4, 11, 56, 'medium', 'Medium', 'yellow', '2020-12-02 03:30:32', '2020-12-02 03:30:32'),
(88, 4, 4, 11, 56, 'high', 'High', 'red', '2020-12-02 03:30:32', '2020-12-02 03:30:32'),
(89, 4, 4, 12, 58, 'backlog', 'Backlog', 'white', '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(90, 4, 4, 12, 58, 'todo', 'Todo', 'green', '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(91, 4, 4, 12, 58, 'schedule', 'Schedule', 'blue', '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(92, 4, 4, 12, 58, 'delegate', 'Delegate', 'yellow', '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(93, 4, 4, 12, 58, 'delete', 'Delete', 'red', '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(94, 4, 4, 12, 60, 'low', 'Low', 'green', '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(95, 4, 4, 12, 60, 'medium', 'Medium', 'yellow', '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(96, 4, 4, 12, 60, 'high', 'High', 'red', '2020-12-02 03:38:55', '2020-12-02 03:38:55'),
(97, 1, 1, 13, 62, 'backlog', 'Backlog', 'white', '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(98, 1, 1, 13, 62, 'todo', 'Todo', 'green', '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(99, 1, 1, 13, 62, 'schedule', 'Schedule', 'blue', '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(100, 1, 1, 13, 62, 'delegate', 'Delegate', 'yellow', '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(101, 1, 1, 13, 62, 'delete', 'Delete', 'red', '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(102, 1, 1, 13, 64, 'low', 'Low', 'green', '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(103, 1, 1, 13, 64, 'medium', 'Medium', 'yellow', '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(104, 1, 1, 13, 64, 'high', 'High', 'red', '2020-12-02 06:39:14', '2020-12-02 06:39:14'),
(105, 4, 4, 14, 70, 'backlog', 'Backlog', 'white', '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(106, 4, 4, 14, 70, 'todo', 'Todo', 'green', '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(107, 4, 4, 14, 70, 'schedule', 'Schedule', 'blue', '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(108, 4, 4, 14, 70, 'delegate', 'Delegate', 'yellow', '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(109, 4, 4, 14, 70, 'delete', 'Delete', 'red', '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(110, 4, 4, 14, 72, 'low', 'Low', 'green', '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(111, 4, 4, 14, 72, 'medium', 'Medium', 'yellow', '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(112, 4, 4, 14, 72, 'high', 'High', 'red', '2020-12-02 17:22:29', '2020-12-02 17:22:29'),
(113, 1, 1, 15, 74, 'backlog', 'Backlog', 'white', '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(114, 1, 1, 15, 74, 'todo', 'Todo', 'green', '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(115, 1, 1, 15, 74, 'schedule', 'Schedule', 'blue', '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(116, 1, 1, 15, 74, 'delegate', 'Delegate', 'yellow', '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(117, 1, 1, 15, 74, 'delete', 'Delete', 'red', '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(118, 1, 1, 15, 76, 'low', 'Low', 'green', '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(119, 1, 1, 15, 76, 'medium', 'Medium', 'yellow', '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(120, 1, 1, 15, 76, 'high', 'High', 'red', '2020-12-03 00:51:47', '2020-12-03 00:51:47'),
(121, 4, 4, 16, 79, 'backlog', 'Backlog', 'white', '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(122, 4, 4, 16, 79, 'todo', 'Todo', 'green', '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(123, 4, 4, 16, 79, 'schedule', 'Schedule', 'blue', '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(124, 4, 4, 16, 79, 'delegate', 'Delegate', 'yellow', '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(125, 4, 4, 16, 79, 'delete', 'Delete', 'red', '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(126, 4, 4, 16, 81, 'low', 'Low', 'green', '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(127, 4, 4, 16, 81, 'medium', 'Medium', 'yellow', '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(128, 4, 4, 16, 81, 'high', 'High', 'red', '2020-12-03 07:34:27', '2020-12-03 07:34:27'),
(129, 4, 1, 17, 83, 'backlog', 'Backlog', 'white', '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(130, 4, 1, 17, 83, 'todo', 'Todo', 'green', '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(131, 4, 1, 17, 83, 'schedule', 'Schedule', 'blue', '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(132, 4, 1, 17, 83, 'delegate', 'Delegate', 'yellow', '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(133, 4, 1, 17, 83, 'delete', 'Delete', 'red', '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(134, 4, 1, 17, 85, 'low', 'Low', 'green', '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(135, 4, 1, 17, 85, 'medium', 'Medium', 'yellow', '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(136, 4, 1, 17, 85, 'high', 'High', 'red', '2020-12-04 02:28:25', '2020-12-04 02:28:25'),
(137, 4, 4, 18, 87, 'backlog', 'Backlog', 'white', '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(138, 4, 4, 18, 87, 'todo', 'Todo', 'green', '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(139, 4, 4, 18, 87, 'schedule', 'Schedule', 'blue', '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(140, 4, 4, 18, 87, 'delegate', 'Delegate', 'yellow', '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(141, 4, 4, 18, 87, 'delete', 'Delete', 'red', '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(142, 4, 4, 18, 89, 'low', 'Low', 'green', '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(143, 4, 4, 18, 89, 'medium', 'Medium', 'yellow', '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(144, 4, 4, 18, 89, 'high', 'High', 'red', '2020-12-08 13:53:11', '2020-12-08 13:53:11'),
(145, 4, 4, 19, 91, 'backlog', 'Backlog', 'white', '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(146, 4, 4, 19, 91, 'todo', 'Todo', 'green', '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(147, 4, 4, 19, 91, 'schedule', 'Schedule', 'blue', '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(148, 4, 4, 19, 91, 'delegate', 'Delegate', 'yellow', '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(149, 4, 4, 19, 91, 'delete', 'Delete', 'red', '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(150, 4, 4, 19, 93, 'low', 'Low', 'green', '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(151, 4, 4, 19, 93, 'medium', 'Medium', 'yellow', '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(152, 4, 4, 19, 93, 'high', 'High', 'red', '2020-12-08 14:09:57', '2020-12-08 14:09:57'),
(153, 4, 4, 20, 95, 'backlog', 'Backlog', 'white', '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(154, 4, 4, 20, 95, 'todo', 'Todo', 'green', '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(155, 4, 4, 20, 95, 'schedule', 'Schedule', 'blue', '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(156, 4, 4, 20, 95, 'delegate', 'Delegate', 'yellow', '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(157, 4, 4, 20, 95, 'delete', 'Delete', 'red', '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(158, 4, 4, 20, 97, 'low', 'Low', 'green', '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(159, 4, 4, 20, 97, 'medium', 'Medium', 'yellow', '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(160, 4, 4, 20, 97, 'high', 'High', 'red', '2020-12-08 14:28:35', '2020-12-08 14:28:35'),
(161, 5, 5, 21, 100, 'backlog', 'Backlog', 'white', '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(162, 5, 5, 21, 100, 'todo', 'Todo', 'green', '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(163, 5, 5, 21, 100, 'schedule', 'Schedule', 'blue', '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(164, 5, 5, 21, 100, 'delegate', 'Delegate', 'yellow', '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(165, 5, 5, 21, 100, 'delete', 'Delete', 'red', '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(166, 5, 5, 21, 102, 'low', 'Low', 'green', '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(167, 5, 5, 21, 102, 'medium', 'Medium', 'yellow', '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(168, 5, 5, 21, 102, 'high', 'High', 'red', '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(169, 4, 6, 22, 104, 'backlog', 'Backlog', 'white', '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(170, 4, 6, 22, 104, 'todo', 'Todo', 'green', '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(171, 4, 6, 22, 104, 'schedule', 'Schedule', 'blue', '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(172, 4, 6, 22, 104, 'delegate', 'Delegate', 'yellow', '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(173, 4, 6, 22, 104, 'delete', 'Delete', 'red', '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(174, 4, 6, 22, 106, 'low', 'Low', 'green', '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(175, 4, 6, 22, 106, 'medium', 'Medium', 'yellow', '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(176, 4, 6, 22, 106, 'high', 'High', 'red', '2020-12-10 07:53:30', '2020-12-10 07:53:30'),
(177, 5, 6, 23, 108, 'backlog', 'Backlog', 'white', '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(178, 5, 6, 23, 108, 'todo', 'Todo', 'green', '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(179, 5, 6, 23, 108, 'schedule', 'Schedule', 'blue', '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(180, 5, 6, 23, 108, 'delegate', 'Delegate', 'yellow', '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(181, 5, 6, 23, 108, 'delete', 'Delete', 'red', '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(182, 5, 6, 23, 110, 'low', 'Low', 'green', '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(183, 5, 6, 23, 110, 'medium', 'Medium', 'yellow', '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(184, 5, 6, 23, 110, 'high', 'High', 'red', '2020-12-10 07:54:25', '2020-12-10 07:54:25'),
(185, 4, 6, 24, 112, 'backlog', 'Backlog', 'white', '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(186, 4, 6, 24, 112, 'todo', 'Todo', 'green', '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(187, 4, 6, 24, 112, 'schedule', 'Schedule', 'blue', '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(188, 4, 6, 24, 112, 'delegate', 'Delegate', 'yellow', '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(189, 4, 6, 24, 112, 'delete', 'Delete', 'red', '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(190, 4, 6, 24, 114, 'low', 'Low', 'green', '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(191, 4, 6, 24, 114, 'medium', 'Medium', 'yellow', '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(192, 4, 6, 24, 114, 'high', 'High', 'red', '2020-12-12 12:05:17', '2020-12-12 12:05:17'),
(193, 4, 6, 25, 116, 'backlog', 'Backlog', 'white', '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(194, 4, 6, 25, 116, 'todo', 'Todo', 'green', '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(195, 4, 6, 25, 116, 'schedule', 'Schedule', 'blue', '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(196, 4, 6, 25, 116, 'delegate', 'Delegate', 'yellow', '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(197, 4, 6, 25, 116, 'delete', 'Delete', 'red', '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(198, 4, 6, 25, 118, 'low', 'Low', 'green', '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(199, 4, 6, 25, 118, 'medium', 'Medium', 'yellow', '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(200, 4, 6, 25, 118, 'high', 'High', 'red', '2020-12-12 12:21:02', '2020-12-12 12:21:02'),
(201, 4, 7, 26, 122, 'backlog', 'Backlog', 'white', '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(202, 4, 7, 26, 122, 'todo', 'Todo', 'green', '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(203, 4, 7, 26, 122, 'schedule', 'Schedule', 'blue', '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(204, 4, 7, 26, 122, 'delegate', 'Delegate', 'yellow', '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(205, 4, 7, 26, 122, 'delete', 'Delete', 'red', '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(206, 4, 7, 26, 124, 'low', 'Low', 'green', '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(207, 4, 7, 26, 124, 'medium', 'Medium', 'yellow', '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(208, 4, 7, 26, 124, 'high', 'High', 'red', '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(209, 4, 8, 27, 126, 'backlog', 'Backlog', 'white', '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(210, 4, 8, 27, 126, 'todo', 'Todo', 'green', '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(211, 4, 8, 27, 126, 'schedule', 'Schedule', 'blue', '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(212, 4, 8, 27, 126, 'delegate', 'Delegate', 'yellow', '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(213, 4, 8, 27, 126, 'delete', 'Delete', 'red', '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(214, 4, 8, 27, 128, 'low', 'Low', 'green', '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(215, 4, 8, 27, 128, 'medium', 'Medium', 'yellow', '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(216, 4, 8, 27, 128, 'high', 'High', 'red', '2020-12-15 14:40:14', '2020-12-15 14:40:14'),
(217, 4, 8, 28, 130, 'backlog', 'Backlog', 'white', '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(218, 4, 8, 28, 130, 'todo', 'Todo', 'green', '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(219, 4, 8, 28, 130, 'schedule', 'Schedule', 'blue', '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(220, 4, 8, 28, 130, 'delegate', 'Delegate', 'yellow', '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(221, 4, 8, 28, 130, 'delete', 'Delete', 'red', '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(222, 4, 8, 28, 132, 'low', 'Low', 'green', '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(223, 4, 8, 28, 132, 'medium', 'Medium', 'yellow', '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(224, 4, 8, 28, 132, 'high', 'High', 'red', '2020-12-15 15:01:21', '2020-12-15 15:01:21'),
(225, 4, 4, 29, 134, 'backlog', 'Backlog', 'white', '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(226, 4, 4, 29, 134, 'todo', 'Todo', 'green', '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(227, 4, 4, 29, 134, 'schedule', 'Schedule', 'blue', '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(228, 4, 4, 29, 134, 'delegate', 'Delegate', 'yellow', '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(229, 4, 4, 29, 134, 'delete', 'Delete', 'red', '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(230, 4, 4, 29, 136, 'low', 'Low', 'green', '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(231, 4, 4, 29, 136, 'medium', 'Medium', 'yellow', '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(232, 4, 4, 29, 136, 'high', 'High', 'red', '2020-12-15 15:52:56', '2020-12-15 15:52:56'),
(233, 4, 4, 30, 146, 'backlog', 'Backlog', 'white', '2020-12-15 17:39:42', '2020-12-15 17:39:42'),
(234, 4, 4, 30, 146, 'todo', 'Todo', 'green', '2020-12-15 17:39:42', '2020-12-15 17:39:42'),
(235, 4, 4, 30, 146, 'schedule', 'Schedule', 'blue', '2020-12-15 17:39:42', '2020-12-15 17:39:42'),
(236, 4, 4, 30, 146, 'delegate', 'Delegate', 'yellow', '2020-12-15 17:39:42', '2020-12-15 17:39:42'),
(237, 4, 4, 30, 146, 'delete', 'Delete', 'red', '2020-12-15 17:39:42', '2020-12-15 17:39:42'),
(238, 4, 4, 30, 148, 'low', 'Low', 'green', '2020-12-15 17:39:42', '2020-12-15 17:39:42'),
(239, 4, 4, 30, 148, 'medium', 'Medium', 'yellow', '2020-12-15 17:39:42', '2020-12-15 17:39:42'),
(240, 4, 4, 30, 148, 'high', 'High', 'red', '2020-12-15 17:39:42', '2020-12-15 17:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `user_id`, `team_id`, `title`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Thanh', 'https://facebook.com', '2020-11-25 15:48:29', '2020-12-02 06:59:30'),
(7, 4, 4, 'My Facebook', 'https://www.facebook.com/thanhhff/', '2020-12-03 05:00:34', '2020-12-03 05:00:34'),
(12, 5, 6, 'Helloofsafasf', 'kdklsaf', '2020-12-12 09:23:18', '2020-12-12 09:23:18'),
(13, 5, 6, 'Hello', 'View', '2020-12-12 10:00:07', '2020-12-12 10:00:07'),
(14, 5, 6, 'fasfasfafa', 'fasdfasf', '2020-12-12 10:00:17', '2020-12-12 10:00:17'),
(15, 5, 6, 'New', 'new', '2020-12-12 10:00:40', '2020-12-12 10:00:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_05_21_100000_create_teams_table', 1),
(7, '2020_05_21_200000_create_team_user_table', 1),
(8, '2020_09_09_010554_create_sessions_table', 1),
(9, '2020_09_09_160027_create_boards_table', 1),
(10, '2020_09_09_160136_create_stages_table', 1),
(11, '2020_09_09_160158_create_items_table', 1),
(12, '2020_09_10_025804_create_fields_table', 1),
(13, '2020_09_10_025841_create_labels_table', 1),
(14, '2020_09_10_025906_create_field_rules_table', 1),
(15, '2020_09_11_120519_create_field_values_table', 1),
(16, '2020_09_18_050109_items', 2),
(17, '2020_09_25_195750_add_order_to_stage', 3),
(18, '2020_09_25_210508_add_order_to_items', 4),
(19, '2020_09_25_212621_standup', 5),
(20, '2020_09_26_144503_users_tokens', 6),
(21, '2020_09_28_033250_automation', 7),
(22, '2020_10_21_230004_create_links_table', 8),
(23, '2020_10_26_112148_create_time_entries_table', 9),
(24, '2020_11_07_093739_update_duration', 10),
(25, '2020_11_11_144835_create_checklists_table', 11),
(26, '2020_11_13_210644_dashboard', 12),
(27, '2020_11_21_103930_create_jobs_table', 13),
(28, '2020_12_10_145838_settings', 14),
(29, '2020_12_12_145618_crate_notes_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `user_id`, `team_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(10, 5, 6, 'test', '{\"title\":\"test\",\"url\":\"test\"}', '2020-12-12 10:01:22', '2020-12-12 10:01:22'),
(11, 5, 6, 'New', '{\"title\":\"New\",\"content\":\"new\"}', '2020-12-12 10:05:44', '2020-12-12 10:05:44'),
(12, 5, 6, '???', '{\"title\":\"???\",\"content\":\"???\"}', '2020-12-12 10:07:52', '2020-12-12 10:07:52'),
(13, 5, 6, '????', '{\"title\":\"????\",\"content\":\"???\"}', '2020-12-12 10:08:10', '2020-12-12 10:08:10'),
(14, 5, 6, '????', '{\"title\":\"????\",\"url\":\"?????\"}', '2020-12-12 10:08:22', '2020-12-12 10:08:22'),
(15, 5, 6, 'dfafasfadsf', '{\"title\":\"dfafasfadsf\"}', '2020-12-12 10:10:07', '2020-12-12 10:10:07'),
(30, 4, 6, 'New note', '{\"title\":\"New note\"}', '2020-12-12 13:01:25', '2020-12-12 13:01:25'),
(31, 4, 6, 'Ngay mai co lich hen o cong ty luc 10h', '{\"title\":\"Ngay mai co lich hen o cong ty luc 10h\"}', '2020-12-12 13:01:59', '2020-12-12 13:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('thanh@gmail.com', '$2y$10$4i70/jRZ2wyhuALvDYrK/e3A35UHR5A8DNWb9kDA9kg.mujKd1Sqm', '2020-12-12 17:41:13'),
('thanhnt@gmail.com', '$2y$10$XRilnMkoCA6DqHh/StbvIuRA83NxdZws891SVwArBGH2RsG8.Gn3u', '2020-12-12 17:42:35');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 4, 'Trung', 'eb60767832d63f66f3fea72bc83a00999152fbb54f7d34d80dd8df8267eca981', '[\"create\",\"read\"]', NULL, '2020-12-10 08:16:32', '2020-12-10 08:16:32'),
(3, 'App\\Models\\User', 4, 'new', '4caaba710d2dd98f66ea11b201865cd7fe36dbd4be6228efb4338325dd18ad81', '[\"read\"]', NULL, '2020-12-12 17:35:26', '2020-12-12 17:35:26'),
(4, 'App\\Models\\User', 5, 'Thanhhff', '06607b33d1b853565c00c0e315b32f230cadd3d620a66f84d95fc0589a411bd0', '[\"read\"]', NULL, '2020-12-12 17:35:54', '2020-12-12 17:35:54');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('OeUP2A1D2NG0ItXbUXkPZ1WskS32q0pDqCZCy6cw', 4, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiako4R0RCRVlLRWxNUFI3RmJoRzlDYWtNelRnc1ZxSUJlRmJuYkN4OCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkb1hVdldZdDRJbTRGdS55cWIxLzFydWF6Qmo0cFBsaGlzanhIMWJ2ZE5ZZU5PUjBIMDFMRDIiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDBiMy9KNVZIaDBlR25qLnlCOXBSWS5ia1BBRHFLN2pHaFMuLm1QdGtBMVRVd3BtVGhSRW5LIjt9', 1608050673),
('VrB5kuLFUifb5VvwN5d45nV122J2ItMRRvjaq9JM', 4, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiVVZoSXhQRlRGRjJGN0xoQ1VEa3E1OXJiYWhZNDdVR0JXZjY2d05KZCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkb1hVdldZdDRJbTRGdS55cWIxLzFydWF6Qmo0cFBsaGlzanhIMWJ2ZE5ZZU5PUjBIMDFMRDIiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJG9YVXZXWXQ0SW00RnUueXFiMS8xcnVhekJqNHBQbGhpc2p4SDFidmROWWVOT1IwSDAxTEQyIjt9', 1608085419),
('ZiObZHU9CmyFb2svlnrVQQ2CM9tsse4Sy3QeJPK2', 4, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiQmdrRlUyT3Y5SnMxV1hhOU5HTnR5Ylo1OXlaMHplZDJVbVl0dWNQYyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjU6ImxvZ2luIjthOjI6e3M6ODoicmVtZW1iZXIiO2I6MDtzOjI6ImlkIjtpOjQ7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQ7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRvWFV2V1l0NEltNEZ1LnlxYjEvMXJ1YXpCajRwUGxoaXNqeEgxYnZkTlllTk9SMEgwMUxEMiI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkb1hVdldZdDRJbTRGdS55cWIxLzFydWF6Qmo0cFBsaGlzanhIMWJ2ZE5ZZU5PUjBIMDFMRDIiO30=', 1608053985);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stages`
--

CREATE TABLE `stages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `board_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stages`
--

INSERT INTO `stages` (`id`, `user_id`, `team_id`, `board_id`, `name`, `created_at`, `updated_at`, `color`, `order`) VALUES
(4, 2, 2, 3, 'Trung\'s Team Board', '2020-11-25 17:00:30', '2020-11-25 17:00:30', NULL, 0),
(11, 3, 3, 8, 'Nguyen\'s Team Board', '2020-11-30 03:19:14', '2020-11-30 03:19:14', NULL, 0),
(12, 3, 3, 9, 'fadf', '2020-11-30 03:46:37', '2020-11-30 03:46:37', NULL, 0),
(15, 4, 4, 12, 'Stage 3', '2020-12-02 03:38:55', '2020-12-08 15:04:30', NULL, 0),
(17, 4, 4, 12, 'Stage 3i', '2020-12-02 07:51:14', '2020-12-08 15:04:52', NULL, 0),
(19, 4, 4, 14, 'New Board 2', '2020-12-02 17:22:29', '2020-12-02 17:22:29', NULL, 0),
(20, 1, 1, 15, 'Hello', '2020-12-03 00:51:47', '2020-12-03 00:51:47', NULL, 0),
(23, 4, 1, 17, 'New', '2020-12-04 02:28:25', '2020-12-04 02:28:25', NULL, 0),
(25, 4, 4, 19, 'New Board', '2020-12-08 14:09:57', '2020-12-08 14:09:57', NULL, 0),
(26, 4, 4, 19, 'Stage 2', '2020-12-08 14:10:03', '2020-12-08 14:10:03', NULL, 0),
(27, 4, 4, 19, 'Stage 3', '2020-12-08 14:10:04', '2020-12-08 14:10:04', NULL, 0),
(28, 4, 4, 19, 'Stage 4', '2020-12-08 14:27:40', '2020-12-08 14:27:40', NULL, 0),
(29, 4, 4, 20, 'New', '2020-12-08 14:28:35', '2020-12-08 14:28:35', NULL, 0),
(30, 4, 4, 20, 'Stage 2', '2020-12-08 14:31:56', '2020-12-08 14:31:56', NULL, 0),
(31, 5, 5, 21, 'Thanh\'s Team Board', '2020-12-10 07:53:06', '2020-12-10 07:53:06', NULL, 0),
(32, 4, 6, 22, 'Thanhhff Teams Board', '2020-12-10 07:53:30', '2020-12-10 07:53:30', NULL, 0),
(33, 5, 6, 23, 'New Board', '2020-12-10 07:54:25', '2020-12-10 07:54:25', NULL, 0),
(40, 4, 7, 26, 'Thanhhff Team Board', '2020-12-12 16:13:07', '2020-12-12 16:13:07', NULL, 0),
(41, 4, 8, 27, 'New Team Board', '2020-12-15 14:40:14', '2020-12-15 14:40:14', NULL, 0),
(42, 4, 8, 28, 'fasfasf', '2020-12-15 15:01:21', '2020-12-15 15:01:21', NULL, 0),
(43, 4, 4, 29, 'Helllo', '2020-12-15 15:52:56', '2020-12-15 15:52:56', NULL, 0),
(44, 4, 4, 29, 'Stage 2', '2020-12-15 16:08:22', '2020-12-15 16:08:22', NULL, 0),
(45, 4, 4, 29, 'Stage 2', '2020-12-15 16:08:23', '2020-12-15 16:08:23', NULL, 0),
(46, 4, 4, 29, 'Stage 4', '2020-12-15 17:23:33', '2020-12-15 17:23:33', NULL, 0),
(47, 4, 4, 29, 'Stage 5', '2020-12-15 17:34:53', '2020-12-15 17:34:53', NULL, 0),
(48, 4, 4, 30, 'new', '2020-12-15 17:39:42', '2020-12-15 17:39:42', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `standups`
--

CREATE TABLE `standups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `standups`
--

INSERT INTO `standups` (`id`, `user_id`, `team_id`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-11-25', '2020-11-25 02:36:07', '2020-11-25 02:36:07'),
(2, 2, 2, '2020-11-25', '2020-11-25 17:00:36', '2020-11-25 17:00:36'),
(3, 1, 1, '2020-11-25', '2020-11-25 17:08:35', '2020-11-25 17:08:35'),
(4, 1, 1, '2020-11-25', '2020-11-25 17:11:55', '2020-11-25 17:11:55'),
(5, 1, 1, '2020-11-26', '2020-11-26 23:50:09', '2020-11-26 23:50:09'),
(6, 1, 1, '2020-11-26', '2020-11-26 23:50:13', '2020-11-26 23:50:13'),
(7, 1, 1, '2020-11-26', '2020-11-26 23:50:18', '2020-11-26 23:50:18'),
(8, 1, 1, '2020-11-26', '2020-11-26 23:52:31', '2020-11-26 23:52:31'),
(9, 1, 1, '2020-11-26', '2020-11-26 23:55:21', '2020-11-26 23:55:21'),
(10, 1, 1, '2020-11-26', '2020-11-26 23:55:31', '2020-11-26 23:55:31'),
(11, 1, 1, '2020-11-26', '2020-11-26 23:55:51', '2020-11-26 23:55:51'),
(12, 1, 1, '2020-11-27', '2020-11-27 01:54:34', '2020-11-27 01:54:34'),
(13, 4, 4, '2020-12-02', '2020-12-02 03:30:39', '2020-12-02 03:30:39'),
(14, 1, 1, '2020-12-02', '2020-12-02 06:33:10', '2020-12-02 06:33:10'),
(15, 4, 4, '2020-12-03', '2020-12-03 03:48:17', '2020-12-03 03:48:17'),
(16, 5, 5, '2020-12-10', '2020-12-10 09:32:35', '2020-12-10 09:32:35'),
(17, 4, 6, '2020-12-12', '2020-12-12 11:19:27', '2020-12-12 11:19:27');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1, 1, 'Thanh\'s Team', 1, '2020-11-25 02:36:03', '2020-11-25 02:36:03'),
(2, 2, 'Trung\'s Team', 1, '2020-11-25 17:00:30', '2020-11-25 17:00:30'),
(3, 3, 'Nguyen\'s Team', 1, '2020-11-30 03:19:14', '2020-11-30 03:19:14'),
(4, 4, 'Nguyen\'s Team', 1, '2020-12-02 03:30:32', '2020-12-02 03:30:32'),
(5, 5, 'Thanh\'s Team', 1, '2020-12-10 07:53:06', '2020-12-10 07:53:06'),
(7, 4, 'Thanhhff Team', 0, '2020-12-12 16:13:07', '2020-12-12 16:13:07'),
(8, 4, 'New Team', 0, '2020-12-15 14:40:14', '2020-12-15 14:40:14');

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_user`
--

INSERT INTO `team_user` (`id`, `team_id`, `user_id`, `role`, `created_at`, `updated_at`) VALUES
(4, 8, 1, 'editor', '2020-12-15 15:06:31', '2020-12-15 15:06:31');

-- --------------------------------------------------------

--
-- Table structure for table `time_entries`
--

CREATE TABLE `time_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `label_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`label_ids`)),
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `duration` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_entries`
--

INSERT INTO `time_entries` (`id`, `user_id`, `team_id`, `item_id`, `label_ids`, `description`, `billable`, `status`, `start`, `end`, `created_at`, `updated_at`, `duration`) VALUES
(5, 1, 1, 1, '\"[]\"', 'heleo', 0, 1, '2020-11-25 12:11:15', '2020-11-25 12:11:15', '2020-11-25 05:11:12', '2020-11-25 05:11:12', 3000),
(6, 1, 1, 3, '\"[]\"', 'aaaakk', 0, 1, '2020-11-25 16:48:35', '2020-11-25 16:48:35', '2020-11-25 09:48:34', '2020-11-25 09:48:34', 1000),
(7, 1, 1, 1, '\"[]\"', 'heleo', 0, 1, '2020-12-02 06:58:56', '2020-12-02 06:58:56', '2020-12-01 23:58:54', '2020-12-01 23:58:54', 2000),
(8, 1, 1, 1, '\"[]\"', 'heleo', 0, 1, '2020-12-02 06:59:21', '2020-12-02 06:59:21', '2020-12-01 23:59:16', '2020-12-01 23:59:16', 5000),
(9, 4, 4, 11, '\"[]\"', 'Todo 01', 0, 1, '2020-12-03 03:49:27', '2020-12-03 03:49:27', '2020-12-02 20:49:25', '2020-12-02 20:49:25', 2000),
(10, 4, 4, NULL, '\"[]\"', 'New Todo', 1, 1, '2020-12-03 04:34:06', '2020-12-03 04:34:06', '2020-12-02 21:34:02', '2020-12-02 21:34:02', 4740),
(11, 4, 4, 13, '\"[]\"', 'New', 0, 1, '2020-12-03 06:41:07', '2020-12-03 06:41:07', '2020-12-02 23:41:06', '2020-12-02 23:41:06', 1000),
(12, 4, 4, 13, '\"[]\"', 'New', 0, 1, '2020-12-03 06:41:16', '2020-12-03 06:41:16', '2020-12-02 23:41:14', '2020-12-02 23:41:14', 2000),
(13, 4, 4, 13, '\"[]\"', 'New', 0, 1, '2020-12-03 06:41:30', '2020-12-03 06:41:30', '2020-12-02 23:41:24', '2020-12-02 23:41:24', 6000),
(14, 4, 4, 25, '\"[]\"', 'dfsafs', 0, 1, '2020-12-08 15:17:17', '2020-12-08 15:17:17', '2020-12-08 08:17:16', '2020-12-08 08:17:16', 1000),
(15, 4, 4, 21, '\"[]\"', 'FASDFA', 0, 1, '2020-12-08 15:17:20', '2020-12-08 15:17:20', '2020-12-08 08:17:19', '2020-12-08 08:17:19', 1000),
(16, 4, 6, 33, '\"[]\"', 'Update', 0, 1, '2020-12-10 08:17:23', '2020-12-10 08:17:23', '2020-12-10 01:17:14', '2020-12-10 01:17:14', 10000),
(17, 4, 6, 33, '\"[]\"', 'Update', 0, 1, '2020-12-10 08:28:25', '2020-12-10 08:28:25', '2020-12-10 01:28:23', '2020-12-10 01:28:23', 2000),
(18, 4, 6, 33, '\"[]\"', 'Update', 0, 1, '2020-12-10 08:28:31', '2020-12-10 08:28:31', '2020-12-10 01:28:26', '2020-12-10 01:28:26', 5000),
(19, 5, 5, 34, '\"[]\"', 'New Item', 0, 1, '2020-12-12 07:46:30', '2020-12-12 07:46:30', '2020-12-12 00:46:29', '2020-12-12 00:46:29', 1000),
(20, 5, 5, NULL, '\"[]\"', 'fasdf', 0, 1, '2020-12-12 07:46:49', '2020-12-12 07:46:49', '2020-12-12 00:46:47', '2020-12-12 00:46:47', 1512),
(21, 5, 6, NULL, '\"[]\"', 'Next', 0, 1, '2020-12-12 07:48:39', '2020-12-12 07:48:39', '2020-12-12 00:48:37', '2020-12-12 00:48:37', 1597),
(22, 5, 6, 36, '\"[]\"', 'New', 0, 1, '2020-12-12 07:49:27', '2020-12-12 07:49:27', '2020-12-12 00:49:25', '2020-12-12 00:49:25', 2000),
(23, 4, 6, 33, '\"[]\"', 'Update', 0, 1, '2020-12-12 11:07:03', '2020-12-12 11:07:03', '2020-12-12 04:07:01', '2020-12-12 04:07:01', 2000),
(24, 4, 6, 33, '\"[]\"', 'Update', 0, 1, '2020-12-12 11:23:06', '2020-12-12 11:23:06', '2020-12-12 04:23:04', '2020-12-12 04:23:04', 2000),
(25, 4, 4, 25, '\"[]\"', 'dfsafs', 0, 1, '2020-12-12 16:02:41', '2020-12-12 16:02:40', '2020-12-12 09:02:38', '2020-12-12 09:02:38', 2000),
(26, 4, 4, 25, '\"[]\"', 'dfsafs', 0, 1, '2020-12-12 16:02:46', '2020-12-12 16:02:46', '2020-12-12 09:02:45', '2020-12-12 09:02:45', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tokenable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hash` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `tokenable_type`, `tokenable_id`, `hash`, `token`) VALUES
(1, 'Thanh', 'thanh@gmail.com', NULL, '$2y$10$hNNeFxWUXsL2sL25ObIMQ.ypligzE.pMAg6B2Qh5wmetP1yHZxzp.', NULL, NULL, 'ENCTQtZaiR4lPbmviPcgIWgBlSCa02csA0hP0L7AW0ube67YHtN2WdJM4qoT', '1', 'profile-photos/azDu4OXPtviguRunVfhW0Uf6eTfi29V3WldLfl1J.jpeg', '2020-11-25 02:36:03', '2020-11-27 04:31:25', NULL, NULL, NULL, NULL),
(2, 'Trung', 'trung@gmail.com', NULL, '$2y$10$63sBzpDg2sXZWYYnbc9nteX6NJzwfJEimsfLpRe3v.Wc6zEM.FFIm', NULL, NULL, NULL, '2', NULL, '2020-11-25 17:00:30', '2020-11-25 17:00:30', NULL, NULL, NULL, NULL),
(3, 'Nguyen Thanh', 'thanhnguyen@gmail.com', NULL, '$2y$10$GDFF7i.hdfKsT5QzvvpHX.AAFrLyITDF0u.KrEfLswlbbA/cOcnZK', NULL, NULL, NULL, '3', NULL, '2020-11-30 03:19:14', '2020-11-30 03:19:14', NULL, NULL, NULL, NULL),
(4, 'Nguyen Trung Thanh', 'admin@gmail.com', NULL, '$2y$10$oXUvWYt4Im4Fu.yqb1/1ruazBj4pPlhisjxH1bvdNYeNOR0H01LD2', NULL, NULL, NULL, '4', NULL, '2020-12-02 03:30:32', '2020-12-15 16:44:33', NULL, NULL, NULL, NULL),
(5, 'Thanh NT', 'thanhnt@gmail.com', NULL, '$2y$10$rg00ura.05oiE5d579ut5OrHRea3iz.VJj9QOSEt4VFF9V4Wx3SYK', NULL, NULL, NULL, NULL, NULL, '2020-12-10 07:53:06', '2020-12-15 15:10:55', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `automations`
--
ALTER TABLE `automations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automation_recipes`
--
ALTER TABLE `automation_recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automation_services`
--
ALTER TABLE `automation_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checklists`
--
ALTER TABLE `checklists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `field_rules`
--
ALTER TABLE `field_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `field_values`
--
ALTER TABLE `field_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stages`
--
ALTER TABLE `stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `standups`
--
ALTER TABLE `standups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indexes for table `time_entries`
--
ALTER TABLE `time_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `automations`
--
ALTER TABLE `automations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `automation_recipes`
--
ALTER TABLE `automation_recipes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `automation_services`
--
ALTER TABLE `automation_services`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `checklists`
--
ALTER TABLE `checklists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `field_rules`
--
ALTER TABLE `field_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `field_values`
--
ALTER TABLE `field_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stages`
--
ALTER TABLE `stages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `standups`
--
ALTER TABLE `standups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `time_entries`
--
ALTER TABLE `time_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
