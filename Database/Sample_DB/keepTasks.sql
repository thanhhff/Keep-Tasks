-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 16, 2020 at 08:35 AM
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
(1, 1, 1, 'Admin\'s Team Board', '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(2, 1, 2, 'Web Programming Team Board', '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(3, 2, 3, 'Thanh\'s Team Board', '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(4, 3, 4, 'Thao\'s Team Board', '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(5, 4, 5, 'Do\'s Team Board', '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(6, 1, 2, 'Web Code Board', '2020-12-16 02:56:56', '2020-12-16 02:56:56');

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
(11, 1, 2, 3, 'Invite Thanh', 0, 0, '2020-12-16 06:56:31', '2020-12-16 06:56:31'),
(12, 1, 2, 3, 'Invite Thao', 0, 0, '2020-12-16 06:56:31', '2020-12-16 06:56:31');

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
(1, 1, 1, 1, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(2, 1, 1, 1, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(3, 1, 1, 1, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(4, 1, 1, 1, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(5, 1, 2, 2, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(6, 1, 2, 2, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(7, 1, 2, 2, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(8, 1, 2, 2, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(9, 2, 3, 3, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(10, 2, 3, 3, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(11, 2, 3, 3, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(12, 2, 3, 3, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(13, 3, 4, 4, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(14, 3, 4, 4, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(15, 3, 4, 4, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(16, 3, 4, 4, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(17, 4, 5, 5, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(18, 4, 5, 5, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(19, 4, 5, 5, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(20, 4, 5, 5, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(21, 1, 2, 6, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(22, 1, 2, 6, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(23, 1, 2, 6, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(24, 1, 2, 6, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(25, 1, 2, 6, 'Note', 'Note', 'text', NULL, 0, 1, '2020-12-16 02:57:57', '2020-12-16 02:57:57'),
(26, 3, 2, 7, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(27, 3, 2, 7, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(28, 3, 2, 7, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(29, 3, 2, 7, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(30, 1, 2, 8, 'owner', 'Owner', 'person', NULL, 0, 0, '2020-12-16 03:26:58', '2020-12-16 03:26:58'),
(31, 1, 2, 8, 'status', 'Status', 'label', NULL, 0, 0, '2020-12-16 03:26:58', '2020-12-16 03:26:58'),
(32, 1, 2, 8, 'due_date', 'Due Date', 'date', NULL, 0, 0, '2020-12-16 03:26:58', '2020-12-16 03:26:58'),
(33, 1, 2, 8, 'priority', 'Priority', 'label', NULL, 0, 0, '2020-12-16 03:26:58', '2020-12-16 03:26:58');

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
(1, 1, 1, 1, 2, 'bg', 'options', '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(2, 1, 1, 1, 4, 'bg', 'options', '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(3, 1, 2, 2, 6, 'bg', 'options', '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(4, 1, 2, 2, 8, 'bg', 'options', '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(5, 2, 3, 3, 10, 'bg', 'options', '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(6, 2, 3, 3, 12, 'bg', 'options', '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(7, 3, 4, 4, 14, 'bg', 'options', '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(8, 3, 4, 4, 16, 'bg', 'options', '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(9, 4, 5, 5, 18, 'bg', 'options', '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(10, 4, 5, 5, 20, 'bg', 'options', '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(11, 1, 2, 6, 22, 'bg', 'options', '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(12, 1, 2, 6, 24, 'bg', 'options', '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(13, 3, 2, 7, 27, 'bg', 'options', '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(14, 3, 2, 7, 29, 'bg', 'options', '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(15, 1, 2, 8, 31, 'bg', 'options', '2020-12-16 03:26:58', '2020-12-16 03:26:58'),
(16, 1, 2, 8, 33, 'bg', 'options', '2020-12-16 03:26:58', '2020-12-16 03:26:58');

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
(1, 1, 2, 5, 1, 'item', 'owner', 'Thanh Nguyen Trung', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:51:42', '2020-12-16 02:52:18'),
(2, 1, 2, 6, 1, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:51:42', '2020-12-16 02:52:24'),
(3, 1, 2, 7, 1, 'item', 'due_date', '2020-12-16', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:51:42', '2020-12-16 02:52:30'),
(4, 1, 2, 8, 1, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:51:42', '2020-12-16 02:52:33'),
(5, 1, 2, 5, 2, 'item', 'owner', 'Thao Do', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:52:45', '2020-12-16 02:52:51'),
(6, 1, 2, 6, 2, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:52:45', '2020-12-16 02:52:49'),
(7, 1, 2, 7, 2, 'item', 'due_date', '2020-12-16', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:52:45', '2020-12-16 02:52:54'),
(8, 1, 2, 8, 2, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:52:45', '2020-12-16 02:52:57'),
(9, 1, 2, 5, 3, 'item', 'owner', 'Do Le', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:53:06', '2020-12-16 02:53:10'),
(10, 1, 2, 6, 3, 'item', 'status', 'schedule', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:53:06', '2020-12-16 06:56:31'),
(11, 1, 2, 7, 3, 'item', 'due_date', '2020-12-17', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:53:06', '2020-12-16 02:53:13'),
(12, 1, 2, 8, 3, 'item', 'priority', 'low', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:53:06', '2020-12-16 02:53:16'),
(13, 1, 2, 5, 4, 'item', 'owner', 'Do Le', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:53:43', '2020-12-16 06:36:17'),
(14, 1, 2, 6, 4, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:53:43', '2020-12-16 02:53:49'),
(15, 1, 2, 7, 4, 'item', 'due_date', '2020-12-17', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:53:43', '2020-12-16 02:53:52'),
(16, 1, 2, 8, 4, 'item', 'priority', 'high', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:53:43', '2020-12-16 02:53:55'),
(17, 1, 2, 21, 5, 'item', 'owner', 'Thanh Nguyen Trung', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:57:09', '2020-12-16 06:12:33'),
(18, 1, 2, 22, 5, 'item', 'status', 'delegate', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:57:09', '2020-12-16 02:57:24'),
(19, 1, 2, 23, 5, 'item', 'due_date', '2020-12-18', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:57:09', '2020-12-16 02:57:48'),
(20, 1, 2, 24, 5, 'item', 'priority', 'high', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:57:09', '2020-12-16 02:57:52'),
(21, 1, 2, 25, 5, 'item', 'Note', 'Important !!!', NULL, NULL, NULL, NULL, NULL, '2020-12-16 02:58:05', '2020-12-16 02:58:21'),
(22, 1, 2, 30, 6, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 03:27:03', '2020-12-16 03:27:03'),
(23, 1, 2, 31, 6, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 03:27:03', '2020-12-16 03:27:03'),
(24, 1, 2, 32, 6, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 03:27:03', '2020-12-16 03:27:03'),
(25, 1, 2, 33, 6, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 03:27:03', '2020-12-16 03:27:03'),
(26, 3, 4, 13, 7, 'item', 'owner', 'Thao Do', NULL, NULL, NULL, NULL, NULL, '2020-12-16 04:18:50', '2020-12-16 04:18:53'),
(27, 3, 4, 14, 7, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-16 04:18:50', '2020-12-16 04:18:55'),
(28, 3, 4, 15, 7, 'item', 'due_date', '2020-12-17', NULL, NULL, NULL, NULL, NULL, '2020-12-16 04:18:50', '2020-12-16 04:18:59'),
(29, 3, 4, 16, 7, 'item', 'priority', 'medium', NULL, NULL, NULL, NULL, NULL, '2020-12-16 04:18:50', '2020-12-16 04:19:04'),
(30, 3, 2, 5, 8, 'item', 'owner', 'Thao Do', NULL, NULL, NULL, NULL, NULL, '2020-12-16 05:26:42', '2020-12-16 05:26:47'),
(31, 3, 2, 6, 8, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-16 05:26:42', '2020-12-16 05:26:49'),
(32, 3, 2, 7, 8, 'item', 'due_date', '2020-12-16', NULL, NULL, NULL, NULL, NULL, '2020-12-16 05:26:42', '2020-12-16 05:26:51'),
(33, 3, 2, 8, 8, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 05:26:42', '2020-12-16 05:26:42'),
(34, 2, 3, 9, 9, 'item', 'owner', 'Thanh Nguyen Trung', NULL, NULL, NULL, NULL, NULL, '2020-12-16 06:07:57', '2020-12-16 06:07:59'),
(35, 2, 3, 10, 9, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-16 06:07:57', '2020-12-16 06:08:01'),
(36, 2, 3, 11, 9, 'item', 'due_date', '2020-12-16', NULL, NULL, NULL, NULL, NULL, '2020-12-16 06:07:57', '2020-12-16 06:08:52'),
(37, 2, 3, 12, 9, 'item', 'priority', 'high', NULL, NULL, NULL, NULL, NULL, '2020-12-16 06:07:57', '2020-12-16 06:08:05'),
(38, 4, 5, 17, 10, 'item', 'owner', 'Do Le', NULL, NULL, NULL, NULL, NULL, '2020-12-16 06:57:01', '2020-12-16 06:59:46'),
(39, 4, 5, 18, 10, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-16 06:57:01', '2020-12-16 06:57:04'),
(40, 4, 5, 19, 10, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 06:57:01', '2020-12-16 06:57:01'),
(41, 4, 5, 20, 10, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 06:57:01', '2020-12-16 06:57:01'),
(42, 4, 2, 5, 11, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 06:59:05', '2020-12-16 06:59:05'),
(43, 4, 2, 6, 11, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-16 06:59:05', '2020-12-16 06:59:16'),
(44, 4, 2, 7, 11, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 06:59:05', '2020-12-16 06:59:05'),
(45, 4, 2, 8, 11, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 06:59:05', '2020-12-16 06:59:05'),
(46, 4, 5, 17, 12, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 07:00:08', '2020-12-16 07:00:08'),
(47, 4, 5, 18, 12, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-16 07:00:08', '2020-12-16 07:00:12'),
(48, 4, 5, 19, 12, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 07:00:08', '2020-12-16 07:00:08'),
(49, 4, 5, 20, 12, 'item', 'priority', 'high', NULL, NULL, NULL, NULL, NULL, '2020-12-16 07:00:08', '2020-12-16 07:00:15'),
(50, 1, 1, 1, 13, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 07:28:35', '2020-12-16 07:28:35'),
(51, 1, 1, 2, 13, 'item', 'status', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 07:28:35', '2020-12-16 07:28:35'),
(52, 1, 1, 3, 13, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 07:28:35', '2020-12-16 07:28:35'),
(53, 1, 1, 4, 13, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 07:28:35', '2020-12-16 07:28:35'),
(54, 3, 4, 13, 14, 'item', 'owner', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 07:29:42', '2020-12-16 07:29:42'),
(55, 3, 4, 14, 14, 'item', 'status', 'todo', NULL, NULL, NULL, NULL, NULL, '2020-12-16 07:29:42', '2020-12-16 07:30:14'),
(56, 3, 4, 15, 14, 'item', 'due_date', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 07:29:42', '2020-12-16 07:29:42'),
(57, 3, 4, 16, 14, 'item', 'priority', '', NULL, NULL, NULL, NULL, NULL, '2020-12-16 07:29:42', '2020-12-16 07:29:42');

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
(1, 1, 2, 2, 2, 'Kick-off Project KeepTasks', '2020-12-16 02:51:42', '2020-12-16 05:59:36', 1, '2020-12-16', 0),
(2, 1, 2, 2, 2, 'Meeting Room Create', '2020-12-16 02:52:45', '2020-12-16 02:54:02', 0, NULL, 1),
(3, 1, 2, 2, 2, 'Invite Member', '2020-12-16 02:53:06', '2020-12-16 02:54:02', 0, NULL, 2),
(4, 1, 2, 2, 3, 'Finish Report', '2020-12-16 02:53:43', '2020-12-16 05:26:45', 0, NULL, 1),
(5, 1, 2, 6, 7, 'Finnal Code !!!', '2020-12-16 02:57:09', '2020-12-16 02:57:09', 0, NULL, NULL),
(6, 1, 2, 8, 9, 'Test', '2020-12-16 03:27:02', '2020-12-16 03:27:02', 0, NULL, NULL),
(7, 3, 4, 4, 5, 'Hoàn thành bài tập tiếng Nhật', '2020-12-16 04:18:50', '2020-12-16 04:18:50', 0, NULL, NULL),
(8, 3, 2, 2, 3, 'Write Draft Report', '2020-12-16 05:26:42', '2020-12-16 05:26:45', 0, NULL, 0),
(9, 2, 3, 3, 4, 'Finish Project Web', '2020-12-16 06:07:57', '2020-12-16 06:07:57', 0, NULL, NULL),
(10, 4, 5, 5, 6, 'Kiểm tra tiến độ bài tập Web', '2020-12-16 06:57:01', '2020-12-16 07:00:11', 0, NULL, 1),
(11, 4, 2, 2, 10, 'Submit Project', '2020-12-16 06:59:05', '2020-12-16 06:59:05', 0, NULL, NULL),
(12, 4, 5, 5, 6, 'Kiểm tra chính tả Report', '2020-12-16 07:00:08', '2020-12-16 07:00:10', 0, NULL, 0),
(13, 1, 1, 1, 1, 'Create Use !', '2020-12-16 07:28:35', '2020-12-16 07:28:35', 0, NULL, NULL),
(14, 3, 4, 4, 5, 'Học từ vựng tiếng Nhật mới', '2020-12-16 07:29:41', '2020-12-16 07:29:41', 0, NULL, 1);

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
(1, 1, 1, 1, 2, 'backlog', 'Backlog', 'white', '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(2, 1, 1, 1, 2, 'todo', 'Todo', 'green', '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(3, 1, 1, 1, 2, 'schedule', 'Schedule', 'blue', '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(4, 1, 1, 1, 2, 'delegate', 'Delegate', 'yellow', '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(5, 1, 1, 1, 2, 'delete', 'Delete', 'red', '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(6, 1, 1, 1, 4, 'low', 'Low', 'green', '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(7, 1, 1, 1, 4, 'medium', 'Medium', 'yellow', '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(8, 1, 1, 1, 4, 'high', 'High', 'red', '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(9, 1, 2, 2, 6, 'backlog', 'Backlog', 'white', '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(10, 1, 2, 2, 6, 'todo', 'Todo', 'green', '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(11, 1, 2, 2, 6, 'schedule', 'Schedule', 'blue', '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(12, 1, 2, 2, 6, 'delegate', 'Delegate', 'yellow', '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(13, 1, 2, 2, 6, 'delete', 'Delete', 'red', '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(14, 1, 2, 2, 8, 'low', 'Low', 'green', '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(15, 1, 2, 2, 8, 'medium', 'Medium', 'yellow', '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(16, 1, 2, 2, 8, 'high', 'High', 'red', '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(17, 2, 3, 3, 10, 'backlog', 'Backlog', 'white', '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(18, 2, 3, 3, 10, 'todo', 'Todo', 'green', '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(19, 2, 3, 3, 10, 'schedule', 'Schedule', 'blue', '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(20, 2, 3, 3, 10, 'delegate', 'Delegate', 'yellow', '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(21, 2, 3, 3, 10, 'delete', 'Delete', 'red', '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(22, 2, 3, 3, 12, 'low', 'Low', 'green', '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(23, 2, 3, 3, 12, 'medium', 'Medium', 'yellow', '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(24, 2, 3, 3, 12, 'high', 'High', 'red', '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(25, 3, 4, 4, 14, 'backlog', 'Backlog', 'white', '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(26, 3, 4, 4, 14, 'todo', 'Todo', 'green', '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(27, 3, 4, 4, 14, 'schedule', 'Schedule', 'blue', '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(28, 3, 4, 4, 14, 'delegate', 'Delegate', 'yellow', '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(29, 3, 4, 4, 14, 'delete', 'Delete', 'red', '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(30, 3, 4, 4, 16, 'low', 'Low', 'green', '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(31, 3, 4, 4, 16, 'medium', 'Medium', 'yellow', '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(32, 3, 4, 4, 16, 'high', 'High', 'red', '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(33, 4, 5, 5, 18, 'backlog', 'Backlog', 'white', '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(34, 4, 5, 5, 18, 'todo', 'Todo', 'green', '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(35, 4, 5, 5, 18, 'schedule', 'Schedule', 'blue', '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(36, 4, 5, 5, 18, 'delegate', 'Delegate', 'yellow', '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(37, 4, 5, 5, 18, 'delete', 'Delete', 'red', '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(38, 4, 5, 5, 20, 'low', 'Low', 'green', '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(39, 4, 5, 5, 20, 'medium', 'Medium', 'yellow', '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(40, 4, 5, 5, 20, 'high', 'High', 'red', '2020-12-16 02:50:23', '2020-12-16 02:50:23'),
(41, 1, 2, 6, 22, 'backlog', 'Backlog', 'white', '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(42, 1, 2, 6, 22, 'todo', 'Todo', 'green', '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(43, 1, 2, 6, 22, 'schedule', 'Schedule', 'blue', '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(44, 1, 2, 6, 22, 'delegate', 'Delegate', 'yellow', '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(45, 1, 2, 6, 22, 'delete', 'Delete', 'red', '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(46, 1, 2, 6, 24, 'low', 'Low', 'green', '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(47, 1, 2, 6, 24, 'medium', 'Medium', 'yellow', '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(48, 1, 2, 6, 24, 'high', 'High', 'red', '2020-12-16 02:56:56', '2020-12-16 02:56:56'),
(49, 3, 2, 7, 27, 'backlog', 'Backlog', 'white', '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(50, 3, 2, 7, 27, 'todo', 'Todo', 'green', '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(51, 3, 2, 7, 27, 'schedule', 'Schedule', 'blue', '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(52, 3, 2, 7, 27, 'delegate', 'Delegate', 'yellow', '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(53, 3, 2, 7, 27, 'delete', 'Delete', 'red', '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(54, 3, 2, 7, 29, 'low', 'Low', 'green', '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(55, 3, 2, 7, 29, 'medium', 'Medium', 'yellow', '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(56, 3, 2, 7, 29, 'high', 'High', 'red', '2020-12-16 02:59:56', '2020-12-16 02:59:56'),
(57, 1, 2, 8, 31, 'backlog', 'Backlog', 'white', '2020-12-16 03:26:58', '2020-12-16 03:26:58'),
(58, 1, 2, 8, 31, 'todo', 'Todo', 'green', '2020-12-16 03:26:58', '2020-12-16 03:26:58'),
(59, 1, 2, 8, 31, 'schedule', 'Schedule', 'blue', '2020-12-16 03:26:58', '2020-12-16 03:26:58'),
(60, 1, 2, 8, 31, 'delegate', 'Delegate', 'yellow', '2020-12-16 03:26:58', '2020-12-16 03:26:58'),
(61, 1, 2, 8, 31, 'delete', 'Delete', 'red', '2020-12-16 03:26:58', '2020-12-16 03:26:58'),
(62, 1, 2, 8, 33, 'low', 'Low', 'green', '2020-12-16 03:26:58', '2020-12-16 03:26:58'),
(63, 1, 2, 8, 33, 'medium', 'Medium', 'yellow', '2020-12-16 03:26:58', '2020-12-16 03:26:58'),
(64, 1, 2, 8, 33, 'high', 'High', 'red', '2020-12-16 03:26:58', '2020-12-16 03:26:58');

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
(1, 1, 2, 'Project Github', 'https://github.com/thanhhff/Keep-Tasks', '2020-12-16 02:55:51', '2020-12-16 02:55:51'),
(2, 4, 5, 'My Facebook', 'https://www.facebook.com/profile.php?id=100018404929121', '2020-12-16 06:13:51', '2020-12-16 06:13:51'),
(3, 3, 4, '日本語の森', 'https://nihongonomori.com/', '2020-12-16 07:33:03', '2020-12-16 07:33:03');

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
(26, '2020_11_21_103930_create_jobs_table', 12),
(27, '2020_12_12_145618_crate_notes_table', 12),
(28, '2020_12_10_145838_settings', 13);

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

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('ICEMWLm56Kds2BwdATu6uwBdlhfKIEnUSuCB3Gtt', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoidktGWmtRV2NSVjdPdWJTSG1HNXo0dXBlT1NoTXJUTUl6Q0oxdGdnbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkZkhzcklhRHltaEFjTk1nZnVOUDc5T0ZHYmZsQS5yQXZ5Lkd3SU1heGtrZUo4YUpOcXJ2M1ciO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJGZIc3JJYUR5bWhBY05NZ2Z1TlA3OU9GR2JmbEEuckF2eS5Hd0lNYXhra2VKOGFKTnFydjNXIjt9', 1608104078);

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
(1, 1, 1, 1, 'Admin\'s Team Board', '2020-12-16 02:47:11', '2020-12-16 02:47:11', NULL, 0),
(2, 1, 2, 2, 'Planning', '2020-12-16 02:47:52', '2020-12-16 02:48:30', NULL, 0),
(3, 1, 2, 2, 'Write Report', '2020-12-16 02:48:31', '2020-12-16 02:48:40', NULL, 0),
(4, 2, 3, 3, 'Thanh\'s Team Board', '2020-12-16 02:49:25', '2020-12-16 02:49:25', NULL, 0),
(5, 3, 4, 4, 'Thao\'s Team Board', '2020-12-16 02:50:01', '2020-12-16 02:50:01', NULL, 0),
(6, 4, 5, 5, 'Do\'s Team Board', '2020-12-16 02:50:23', '2020-12-16 02:50:23', NULL, 0),
(7, 1, 2, 6, 'Web Code Board', '2020-12-16 02:56:56', '2020-12-16 02:56:56', NULL, 0),
(10, 4, 2, 2, 'Submit Project', '2020-12-16 06:58:43', '2020-12-16 06:58:59', NULL, 0);

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
(1, 2, 3, '2020-12-16', '2020-12-16 02:59:08', '2020-12-16 02:59:08');

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
(1, 1, 'Admin\'s Team', 1, '2020-12-16 02:47:11', '2020-12-16 02:47:11'),
(2, 1, 'Web Programming Team', 0, '2020-12-16 02:47:52', '2020-12-16 02:47:52'),
(3, 2, 'Thanh\'s Team', 1, '2020-12-16 02:49:25', '2020-12-16 02:49:25'),
(4, 3, 'Thao\'s Team', 1, '2020-12-16 02:50:01', '2020-12-16 02:50:01'),
(5, 4, 'Do\'s Team', 1, '2020-12-16 02:50:23', '2020-12-16 02:50:23');

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
(1, 2, 2, 'editor', '2020-12-16 02:51:55', '2020-12-16 03:00:56'),
(3, 2, 4, 'editor', '2020-12-16 02:52:07', '2020-12-16 03:01:06'),
(4, 2, 3, 'admin', '2020-12-16 03:27:52', '2020-12-16 03:27:52');

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
(1, 4, 2, 8, '\"[]\"', 'Write Draft Report', 0, 1, '2020-12-16 07:02:05', '2020-12-16 07:02:05', '2020-12-16 00:01:55', '2020-12-16 00:01:55', 11000),
(2, 3, 4, 14, '\"[]\"', 'Học từ vựng tiếng Nhật mới', 0, 1, '2020-12-16 07:33:22', '2020-12-16 07:33:22', '2020-12-16 00:32:39', '2020-12-16 00:32:39', 43000);

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
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$fHsrIaDymhAcNMgfuNP79OFGbflA.rAvy.GwIMaxkkeJ8aJNqrv3W', NULL, NULL, NULL, '2', NULL, '2020-12-16 02:47:11', '2020-12-16 07:28:55', NULL, NULL, NULL, NULL),
(2, 'Thanh Nguyen Trung', 'thanh@gmail.com', NULL, '$2y$10$PxkASEBIKx7amfpwGf.3vud/rheKQuaB9LagQKxjL2NZEnQT7XCwu', NULL, NULL, NULL, '3', NULL, '2020-12-16 02:49:25', '2020-12-16 06:08:59', NULL, NULL, NULL, NULL),
(3, 'Thao Do', 'thao@gmail.com', NULL, '$2y$10$CKeuaAbiz9uHXC9dsub2oOqo9FuMwPaSiUwNDO8LRbdpxBr0Oenn2', NULL, NULL, NULL, '4', NULL, '2020-12-16 02:50:01', '2020-12-16 07:32:30', NULL, NULL, NULL, NULL),
(4, 'Do Le', 'do@gmail.com', NULL, '$2y$10$1.BMGcmjFRi5CSfnPmgRbumD1UqD/AzFr62DPVcFjyiMlUtIRCR2G', NULL, NULL, NULL, '5', NULL, '2020-12-16 02:50:23', '2020-12-16 07:03:23', NULL, NULL, NULL, NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `checklists`
--
ALTER TABLE `checklists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `field_rules`
--
ALTER TABLE `field_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `field_values`
--
ALTER TABLE `field_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stages`
--
ALTER TABLE `stages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `standups`
--
ALTER TABLE `standups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `time_entries`
--
ALTER TABLE `time_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
