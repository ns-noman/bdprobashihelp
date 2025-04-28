-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 28, 2025 at 11:48 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdprobashihelp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_method_id` bigint NOT NULL,
  `account_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `payment_method_id`, `account_no`, `holder_name`, `balance`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hand Cash', 'Self', '0.00', 1, 1, NULL, '2025-02-26 10:40:39', '2025-04-23 04:22:38'),
(2, 2, '01839317038', 'Self', '0.00', 1, 1, NULL, '2025-02-26 10:41:05', '2025-04-28 08:10:18'),
(3, 4, '20501680205073807', 'Nowab Shorif', '0.00', 1, 1, 1, '2025-02-26 10:42:59', '2025-04-28 08:10:18'),
(4, 1, 'Check', 'Self', '0.00', 1, 1, NULL, '2025-04-21 06:30:11', '2025-04-23 04:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `account_ledgers`
--

CREATE TABLE `account_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `account_id` bigint NOT NULL,
  `debit_amount` double(20,2) DEFAULT NULL COMMENT 'Withdrawal',
  `credit_amount` double(20,2) DEFAULT NULL COMMENT 'Deposit',
  `current_balance` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `transaction_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_ledgers`
--

INSERT INTO `account_ledgers` (`id`, `account_id`, `debit_amount`, `credit_amount`, `current_balance`, `reference_number`, `description`, `transaction_date`, `created_at`, `updated_at`) VALUES
(1, 2, 1000.00, NULL, -1000.00, NULL, 'Transfered to other account', '2025-04-28', '2025-04-28 08:09:47', '2025-04-28 08:09:47'),
(2, 3, NULL, 1000.00, 1000.00, '567hgjhu', 'Received from other account', '2025-04-28', '2025-04-28 08:09:47', '2025-04-28 08:09:47'),
(3, 3, 1000.00, NULL, 0.00, NULL, 'Transfered to other account', '2025-04-28', '2025-04-28 08:10:18', '2025-04-28 08:10:18'),
(4, 2, NULL, 1000.00, 0.00, '567890j', 'Received from other account', '2025-04-28', '2025-04-28 08:10:18', '2025-04-28 08:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `agent_id` int DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `agent_id`, `name`, `username`, `type`, `mobile`, `email`, `password`, `image`, `status`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 1, 'Super Admin', NULL, 1, '01800000000', 'admin@gmail.com', '$2y$10$72mM6bhPWEoFlgJKq1WaueJN1g7vMISry0HMa1c5THjRYa7HTISV2', 'admin-1725091483.jpeg', 1, '2024-08-30 19:03:44', '2024-12-31 17:48:55', 'Um2Jcvw02yBR23NOaES9QUhOnRaRZJYH72qYnfoan5KjcDkCGPv1vb7f1Hx7'),
(2, 1, 'Agent', NULL, 2, '62', 'agent@gmail.com', '$2y$10$.VcBTFGCDXfpv27VF7c32uIaDnGbmd2cJCZONPbN0P6Blysqu9j.i', NULL, 1, '2025-04-16 04:20:15', '2025-04-16 04:22:57', 'u44VNRpJKqnWwkkZZcIochNAGfOemImrMusKOcwBLDO2tEIGia8WQAYNtq2M');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date NOT NULL,
  `nid` bigint NOT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `is_self` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '0=Not Self, 1=Self',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `name`, `email`, `contact`, `address`, `dob`, `nid`, `balance`, `is_self`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 'Carlos Ewing', 'mobizyri@mailinator.com', '56', 'Ea perferendis Nam q', '1985-07-11', 70, '0.00', 0, 1, 1, 1, '2025-04-28 07:07:44', '2025-04-28 08:55:07');

-- --------------------------------------------------------

--
-- Table structure for table `basic_infos`
--

CREATE TABLE `basic_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `facebook_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `twitter_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `linkedin_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `youtube_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `assets_value` int NOT NULL,
  `total_employees` int NOT NULL,
  `total_companies` int NOT NULL,
  `start_year` int NOT NULL,
  `map_embed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_embed_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_embed_2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_embed_3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_infos`
--

INSERT INTO `basic_infos` (`id`, `title`, `meta_keywords`, `meta_description`, `logo`, `favicon`, `phone`, `telephone`, `fax`, `email`, `location`, `address`, `web_link`, `facebook_link`, `twitter_link`, `linkedin_link`, `youtube_link`, `assets_value`, `total_employees`, `total_companies`, `start_year`, `map_embed`, `video_embed_1`, `video_embed_2`, `video_embed_3`, `currency_symbol`, `created_at`, `updated_at`) VALUES
(1, 'BD Probashi Help', 'In consequuntur quib', 'Iusto Nam consectetu', 'logo-1745820941.png', 'favicon-1745820941.png', '+88 01839317038', '+88 01739317066', '+1 (343) 205-9606', 'bikeflow@gmail.com', 'Velit quia corrupti', '795 Folsom Ave, Suite 600, San Francisco, CA 94107', 'Quia atque nostrum q', 'Enim neque culpa ex', 'Deserunt odio cum ad', 'Deserunt in ducimus', 'Obcaecati autem reru', 60, 23, 72, 1993, 'Sit placeat et ut o', 'Vel dolore necessita', 'Consequuntur ex nesc', 'Proident dolore off', '৳', NULL, '2025-04-28 06:15:41');

-- --------------------------------------------------------

--
-- Table structure for table `bikes`
--

CREATE TABLE `bikes` (
  `id` bigint UNSIGNED NOT NULL,
  `model_id` bigint NOT NULL,
  `color_id` bigint NOT NULL,
  `registration_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `chassis_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `engine_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bike_models`
--

CREATE TABLE `bike_models` (
  `id` bigint UNSIGNED NOT NULL,
  `brand_id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacture_year` bigint DEFAULT NULL,
  `engine_capacity` bigint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bike_models`
--

INSERT INTO `bike_models` (`id`, `brand_id`, `name`, `manufacture_year`, `engine_capacity`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Yamaha R15 V4', 2018, 155, 1, '2025-02-27 04:41:08', '2025-02-27 04:47:52'),
(2, 1, 'Yamaha FZS-FI V3', 2018, 149, 1, '2025-02-27 05:05:38', '2025-02-27 05:05:38'),
(3, 5, 'BMW S 1000 RR', 2009, 999, 1, '2025-02-27 05:20:03', '2025-02-27 05:20:03'),
(4, 5, 'BMW R 1250 GS', 2018, 1254, 1, '2025-02-27 05:20:48', '2025-02-27 05:20:48'),
(5, 4, 'Ducati Panigale V4', 2018, 1103, 1, '2025-02-27 05:21:33', '2025-02-27 05:21:33'),
(6, 4, 'Ducati Monster', 1993, 904, 1, '2025-02-27 05:22:00', '2025-02-27 05:22:00'),
(7, 3, 'Kawasaki Ninja H2', 2015, 998, 1, '2025-02-27 05:22:50', '2025-02-27 05:22:50'),
(8, 3, 'Kawasaki Z900', 2017, 948, 1, '2025-02-27 05:23:18', '2025-02-27 05:23:18'),
(9, 2, 'Honda CBR1000RR-R Fireblade', 2018, 150, 1, '2025-02-27 08:56:40', '2025-02-27 08:56:40'),
(10, 2, 'Honda Africa Twin (CRF1100L)', 2009, 149, 1, '2025-02-27 08:57:07', '2025-02-27 08:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `bike_profits`
--

CREATE TABLE `bike_profits` (
  `id` bigint UNSIGNED NOT NULL,
  `bike_sale_id` bigint NOT NULL,
  `investor_id` bigint NOT NULL,
  `profit_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `profit_share_amount` decimal(20,2) DEFAULT NULL,
  `profit_entry_date` date NOT NULL,
  `profit_share_last_date` date DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '(To Share Profit) 0=Open, 1=Closed',
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bike_profit_share_records`
--

CREATE TABLE `bike_profit_share_records` (
  `id` bigint UNSIGNED NOT NULL,
  `bike_profit_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `date` date NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bike_purchases`
--

CREATE TABLE `bike_purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `investor_id` bigint NOT NULL,
  `bike_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `seller_id` bigint NOT NULL,
  `broker_id` bigint DEFAULT NULL,
  `bike_sale_id` int DEFAULT NULL COMMENT 'Need in repurchase',
  `purchase_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `servicing_cost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_cost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `purchase_date` date NOT NULL,
  `doc_nid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_reg_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_deed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `selling_status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Unsold, 1=Sold',
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bike_sales`
--

CREATE TABLE `bike_sales` (
  `id` bigint UNSIGNED NOT NULL,
  `bike_purchase_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `buyer_id` bigint NOT NULL,
  `sale_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sale_date` date NOT NULL,
  `doc_nid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_reg_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_deed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_transfer_date` date DEFAULT NULL,
  `is_name_transfered` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Transfered',
  `is_repurchased` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bike_services`
--

CREATE TABLE `bike_services` (
  `id` bigint UNSIGNED NOT NULL,
  `bike_service_category_id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bike_services`
--

INSERT INTO `bike_services` (`id`, `bike_service_category_id`, `name`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'General Bike Inspection', '1200.00', 1, '2025-03-05 07:03:49', '2025-03-05 07:07:00'),
(2, 1, 'Periodic Oil Change', '1000.00', 1, '2025-03-05 07:04:03', '2025-03-05 07:04:03'),
(3, 2, 'Engine Tuning', '1500.00', 1, '2025-03-05 07:04:22', '2025-03-05 07:06:44'),
(4, 2, 'Engine Oil Replacement', '3000.00', 1, '2025-03-05 07:04:34', '2025-03-05 07:04:34'),
(5, 3, 'Brake Pad Replacement', '5000.00', 1, '2025-03-05 07:04:51', '2025-03-05 07:04:51'),
(6, 3, 'Clutch Cable Adjustment', '4000.00', 1, '2025-03-05 07:05:04', '2025-03-05 07:05:04'),
(7, 4, 'Fork Oil Change', '2000.00', 1, '2025-03-05 07:05:19', '2025-03-05 07:05:19'),
(8, 4, 'Steering Bearing Replacement', '2000.00', 1, '2025-03-05 07:05:43', '2025-03-05 07:05:43'),
(9, 5, 'Battery Charging', '3000.00', 1, '2025-03-05 07:06:08', '2025-03-05 07:06:08'),
(10, 5, 'Headlight & Indicator Check', '3000.00', 1, '2025-03-05 07:06:23', '2025-03-05 07:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `bike_service_categories`
--

CREATE TABLE `bike_service_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bike_service_categories`
--

INSERT INTO `bike_service_categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Regular Maintenance', 1, '2025-03-05 05:58:15', '2025-03-05 05:58:15'),
(2, 'Engine Services', 1, '2025-03-05 05:58:32', '2025-03-05 05:58:32'),
(3, 'Brake & Clutch Services', 1, '2025-03-05 05:58:41', '2025-03-05 05:58:41'),
(4, 'Suspension & Steering', 1, '2025-03-05 05:58:47', '2025-03-05 05:58:47'),
(5, 'Electrical & Battery Services', 1, '2025-03-05 05:58:58', '2025-03-05 05:58:58'),
(6, 'Tyre & Wheel Services', 1, '2025-03-05 05:59:05', '2025-03-05 05:59:05'),
(7, 'Chain & Sprocket Services', 1, '2025-03-05 05:59:12', '2025-03-05 05:59:12'),
(8, 'Fuel System Services', 1, '2025-03-05 05:59:18', '2025-03-05 05:59:18'),
(9, 'Fuel System Services', 1, '2025-03-05 05:59:26', '2025-03-05 05:59:26'),
(10, 'Customization & Accessories', 1, '2025-03-05 05:59:35', '2025-03-05 05:59:35');

-- --------------------------------------------------------

--
-- Table structure for table `bike_service_records`
--

CREATE TABLE `bike_service_records` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bike_purchase_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  `date` date NOT NULL,
  `total_amount` decimal(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '0=Pending, 1=Approved',
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bike_service_record_details`
--

CREATE TABLE `bike_service_record_details` (
  `id` bigint UNSIGNED NOT NULL,
  `bike_service_record_id` bigint NOT NULL,
  `service_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Yamaha', NULL, 1, '2025-02-27 03:45:36', '2025-02-27 03:47:53'),
(2, 'Honda', NULL, 1, '2025-02-27 03:45:43', '2025-02-27 03:46:33'),
(3, 'Kawasaki', NULL, 1, '2025-02-27 03:47:19', '2025-02-27 03:47:19'),
(4, 'Ducati', NULL, 1, '2025-02-27 03:47:29', '2025-02-27 03:47:29'),
(5, 'BMW Motorrad', NULL, 1, '2025-02-27 03:47:47', '2025-02-27 03:47:47');

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `dl_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcn_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_cat_id` int NOT NULL DEFAULT '0',
  `cat_type_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_cat_id`, `cat_type_id`, `title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Safety Gear', NULL, 1, '2025-03-15 04:32:37', '2025-03-15 04:32:37'),
(2, 0, 1, 'Comfort & Convenience', NULL, 1, '2025-03-15 04:32:46', '2025-03-15 04:32:46'),
(3, 0, 1, 'Storage & Luggage', NULL, 1, '2025-03-15 04:33:00', '2025-03-15 04:33:00'),
(4, 0, 1, 'Lighting & Electrical', NULL, 1, '2025-03-15 04:33:11', '2025-03-15 04:33:11'),
(5, 0, 1, 'Aesthetic & Styling', NULL, 1, '2025-03-15 04:33:27', '2025-03-15 04:33:27'),
(6, 0, 2, 'Engine & Transmission', NULL, 1, '2025-03-15 04:33:38', '2025-03-15 04:33:38'),
(7, 0, 2, 'Braking System', NULL, 1, '2025-03-15 04:33:48', '2025-03-15 04:33:48'),
(8, 0, 2, 'Suspension & Chassis', NULL, 1, '2025-03-15 04:34:01', '2025-03-15 04:34:01'),
(9, 0, 2, 'Fuel System', NULL, 1, '2025-03-15 04:34:07', '2025-03-15 04:34:07'),
(11, 1, 1, 'Head Protection', NULL, 1, '2025-03-15 04:42:40', '2025-03-15 04:48:58'),
(12, 1, 1, 'Body Protection', NULL, 1, '2025-03-15 04:42:49', '2025-03-15 04:49:22'),
(13, 2, 1, 'Seating Comfort', NULL, 1, '2025-03-15 04:43:09', '2025-03-15 04:49:51'),
(14, 2, 1, 'Handle Enhancements', NULL, 1, '2025-03-15 04:43:21', '2025-03-15 04:50:15'),
(15, 3, 1, 'On-Bike Storage', NULL, 1, '2025-03-15 04:43:35', '2025-03-15 04:50:35'),
(16, 3, 1, 'Lockable Storage', NULL, 1, '2025-03-15 04:43:48', '2025-03-15 04:50:47'),
(17, 4, 1, 'Exterior Lighting', NULL, 1, '2025-03-15 04:44:00', '2025-03-15 04:52:06'),
(18, 4, 1, 'Electrical Accessories', NULL, 1, '2025-03-15 04:53:04', '2025-03-15 04:53:04'),
(19, 5, 1, 'Exterior Decoration', NULL, 1, '2025-03-15 04:53:21', '2025-03-15 04:53:21'),
(20, 5, 1, 'Functional Aesthetics', NULL, 1, '2025-03-15 04:53:45', '2025-03-15 04:53:45'),
(21, 6, 2, 'Internal Components', NULL, 1, '2025-03-15 04:54:00', '2025-03-15 04:54:00'),
(22, 6, 2, 'Transmission Parts', NULL, 1, '2025-03-15 04:54:10', '2025-03-15 04:54:10'),
(23, 7, 2, 'Brake Components', NULL, 1, '2025-03-15 04:54:21', '2025-03-15 04:54:21'),
(24, 7, 2, 'Hydraulic Systems', NULL, 1, '2025-03-15 04:54:29', '2025-03-15 04:54:29');

-- --------------------------------------------------------

--
-- Table structure for table `category_types`
--

CREATE TABLE `category_types` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_types`
--

INSERT INTO `category_types` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Accessories', '2025-03-15 04:05:13', '2025-03-15 04:05:13'),
(2, 'Spare Parts', '2025-03-15 04:05:13', '2025-03-15 04:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hex_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `hex_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Red', '#FF0000', 1, '2025-02-27 09:33:02', '2025-02-27 09:33:02'),
(2, 'Black', '#000000', 1, '2025-02-27 09:34:02', '2025-02-27 09:34:02'),
(3, 'Silver', '#C0C0C0', 1, '2025-02-27 09:34:17', '2025-02-27 09:34:17'),
(4, 'White', '#FFFFFF', 1, '2025-02-27 09:34:28', '2025-02-27 09:34:28'),
(5, 'Green', '#008000', 1, '2025-02-27 09:34:38', '2025-02-27 09:34:38'),
(6, 'Yellow', '#FFFF00', 1, '2025-02-27 09:34:51', '2025-02-27 09:38:40');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Walk-in Customer',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_balance` double(20,2) NOT NULL DEFAULT '0.00',
  `customer_type` tinyint NOT NULL DEFAULT '0' COMMENT '0=General Customer, 1=Default Customer',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `organization`, `current_balance`, `customer_type`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 'Walk-in Customer', NULL, NULL, NULL, NULL, 0.00, 1, '1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_ledgers`
--

CREATE TABLE `customer_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` int NOT NULL,
  `sale_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `particular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL,
  `credit_amount` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_payments`
--

CREATE TABLE `customer_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `sale_id` bigint DEFAULT NULL,
  `date` date NOT NULL,
  `amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `account_id` bigint NOT NULL,
  `expense_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `total_amount` decimal(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `cat_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `cat_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Rent & Utilities', 1, '2025-03-12 04:18:47', '2025-03-12 04:18:47'),
(2, 'Employee Salaries', 1, '2025-03-12 04:18:59', '2025-03-12 04:18:59'),
(3, 'Bike Parts & Accessories', 1, '2025-03-12 04:19:10', '2025-03-12 04:19:10'),
(4, 'Supplier Payments', 1, '2025-03-12 04:19:16', '2025-03-12 04:19:16'),
(5, 'Marketing & Advertising', 1, '2025-03-12 04:19:22', '2025-03-12 04:19:22'),
(6, 'Maintenance & Repairs', 1, '2025-03-12 04:19:29', '2025-03-12 04:19:29'),
(7, 'Insurance Costs', 1, '2025-03-12 04:19:34', '2025-03-12 04:19:34'),
(8, 'Software & Subscriptions', 1, '2025-03-12 04:19:41', '2025-03-12 04:19:41'),
(9, 'Office Supplies', 1, '2025-03-12 04:19:46', '2025-03-12 04:19:46'),
(10, 'Miscellaneous Expenses', 1, '2025-03-12 04:19:52', '2025-03-12 04:34:14');

-- --------------------------------------------------------

--
-- Table structure for table `expense_details`
--

CREATE TABLE `expense_details` (
  `id` bigint UNSIGNED NOT NULL,
  `expense_id` int NOT NULL,
  `expense_head_id` int NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_heads`
--

CREATE TABLE `expense_heads` (
  `id` bigint UNSIGNED NOT NULL,
  `expense_category_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_heads`
--

INSERT INTO `expense_heads` (`id`, `expense_category_id`, `title`, `code`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Office Rent', '8082', 1, 1, NULL, '2025-03-12 05:26:50', '2025-03-12 05:26:50'),
(2, 1, 'Electricity Bills', NULL, 1, 1, NULL, '2025-03-12 05:36:58', '2025-03-12 05:36:58'),
(3, 2, 'Monthly Salaries', NULL, 1, 1, NULL, '2025-03-12 05:49:49', '2025-03-12 05:49:49'),
(4, 2, 'Bonus & Incentives', NULL, 1, 1, NULL, '2025-03-12 05:50:02', '2025-03-12 05:50:02'),
(5, 3, 'Engine Parts', NULL, 1, 1, NULL, '2025-03-12 05:50:16', '2025-03-12 05:50:16'),
(6, 3, 'Tires & Tubes', NULL, 1, 1, NULL, '2025-03-12 05:50:24', '2025-03-12 05:50:24'),
(7, 4, 'Raw Material Payments', NULL, 1, 1, NULL, '2025-03-12 05:50:34', '2025-03-12 05:50:34'),
(8, 4, 'Supplier Service Fees', NULL, 1, 1, NULL, '2025-03-12 05:50:45', '2025-03-12 05:50:45'),
(9, 5, 'Digital Advertising', NULL, 1, 1, NULL, '2025-03-12 05:51:00', '2025-03-12 05:51:00'),
(10, 5, 'Print Advertising', NULL, 1, 1, NULL, '2025-03-12 05:51:09', '2025-03-12 05:51:09'),
(11, 6, 'Workshop Equipment Maintenance', NULL, 1, 1, NULL, '2025-03-12 05:51:27', '2025-03-12 05:51:27'),
(12, 5, 'Bike Repair Tools', NULL, 1, 1, NULL, '2025-03-12 05:51:36', '2025-03-12 05:51:36'),
(13, 7, 'Property Insurance', NULL, 1, 1, NULL, '2025-03-12 05:51:45', '2025-03-12 05:51:45'),
(14, 7, 'Vehicle Insurance', NULL, 1, 1, NULL, '2025-03-12 05:51:56', '2025-03-12 05:51:56'),
(15, 8, 'Point of Sale (POS) Software Subscription', NULL, 1, 1, NULL, '2025-03-12 05:52:21', '2025-03-12 05:52:21'),
(16, 8, 'Inventory Management Software', NULL, 1, 1, NULL, '2025-03-12 05:52:35', '2025-03-12 05:52:35'),
(17, 9, 'Stationery', NULL, 1, 1, NULL, '2025-03-12 05:52:50', '2025-03-12 05:52:50'),
(18, 9, 'Office Furniture', NULL, 1, 1, NULL, '2025-03-12 05:53:05', '2025-03-12 05:53:05'),
(19, 10, 'Bank Fees', NULL, 1, 1, NULL, '2025-03-12 05:53:23', '2025-03-12 05:53:23'),
(20, 10, 'Travel Expenses', NULL, 1, 1, 1, '2025-03-12 05:53:34', '2025-03-12 06:01:22');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_menus`
--

CREATE TABLE `frontend_menus` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `srln` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_in_menus` tinyint NOT NULL DEFAULT '1',
  `is_in_pages` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfer_histories`
--

CREATE TABLE `fund_transfer_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `transfer_date` date NOT NULL,
  `from_account_id` bigint UNSIGNED NOT NULL,
  `to_account_id` bigint UNSIGNED NOT NULL,
  `amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` bigint UNSIGNED DEFAULT NULL,
  `updated_by_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investor_transactions`
--

CREATE TABLE `investor_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `investor_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL COMMENT 'Withdrawal',
  `credit_amount` decimal(20,2) DEFAULT NULL COMMENT 'Deposit',
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` bigint DEFAULT NULL,
  `updated_by_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint UNSIGNED NOT NULL,
  `item_type` tinyint DEFAULT NULL COMMENT '0=Item, 1=Package',
  `package_id` int DEFAULT NULL,
  `package_item_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `purchase_price` double(20,2) NOT NULL DEFAULT '0.00',
  `sale_price` double(20,2) NOT NULL DEFAULT '0.00',
  `vat` double(20,2) NOT NULL DEFAULT '0.00',
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_type`, `package_id`, `package_item_id`, `name`, `description`, `purchase_price`, `sale_price`, `vat`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, NULL, 'Medical', NULL, 5000.00, 6000.00, 0.00, 1, '2025-04-28 10:39:34', '2025-04-28 10:39:34'),
(2, 0, NULL, NULL, 'Slip Proccess', NULL, 2000.00, 2100.00, 0.00, 1, '2025-04-28 10:53:22', '2025-04-28 10:53:22'),
(3, 0, NULL, NULL, 'Settlement', NULL, 2500.00, 3000.00, 0.00, 1, '2025-04-28 10:54:14', '2025-04-28 10:55:38'),
(4, 1, NULL, NULL, 'Basic Package', NULL, 4500.00, 5000.00, 0.00, 1, '2025-04-28 11:02:53', '2025-04-28 11:02:53'),
(5, NULL, 4, 2, '', NULL, 0.00, 0.00, 0.00, 1, '2025-04-28 11:02:53', '2025-04-28 11:02:53'),
(6, NULL, 4, 3, '', NULL, 0.00, 0.00, 0.00, 1, '2025-04-28 11:02:53', '2025-04-28 11:02:53');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `srln` int NOT NULL DEFAULT '1',
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `navicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_side_menu` tinyint NOT NULL DEFAULT '0',
  `create_route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `srln`, `menu_name`, `navicon`, `is_side_menu`, `create_route`, `route`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', '<i class=\"nav-icon fas fa-tachometer-alt\"></i>', 1, NULL, 'dashboard.index', 1, '2024-10-26 08:56:54', '2024-10-28 04:37:52'),
(2, 0, 2, 'Settings', '<i class=\"nav-icon fa-solid fa-gear\"></i>', 1, NULL, 'basic-infos.index', 1, '2024-10-26 09:11:38', '2025-04-28 06:24:07'),
(3, 0, 3, 'Admin Manage', '<i class=\"nav-icon fa-solid fa-users-line\"></i>', 1, NULL, NULL, 1, '2024-10-26 09:16:45', '2024-11-04 04:01:46'),
(4, 3, 1, 'Roles', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'roles.create', 'roles.index', 1, '2024-10-26 09:17:46', '2024-10-27 06:44:02'),
(5, 3, 2, 'Admins', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'admins.create', 'admins.index', 1, '2024-10-26 09:34:05', '2024-10-26 11:40:22'),
(6, 4, 1, 'Add', NULL, 0, NULL, 'roles.create', 1, '2024-10-26 09:37:12', '2024-10-27 11:12:43'),
(7, 4, 2, 'Edit', NULL, 0, NULL, 'roles.edit', 1, '2024-10-26 09:37:49', '2024-10-26 09:37:49'),
(8, 4, 3, 'Delete', NULL, 0, NULL, 'roles.destroy', 1, '2024-10-26 09:38:13', '2024-10-26 09:38:13'),
(9, 5, 1, 'Add', NULL, 0, NULL, 'admins.create', 1, '2024-10-26 09:47:35', '2024-10-27 10:57:28'),
(10, 5, 2, 'Edit', NULL, 0, NULL, 'admins.edit', 1, '2024-10-26 09:47:54', '2024-10-27 07:00:26'),
(11, 5, 3, 'Delete', NULL, 0, NULL, 'admins.destroy', 1, '2024-10-26 09:48:07', '2024-10-27 06:51:02'),
(12, 0, 4, 'Frontend Menus', '<i class=\"nav-icon fas fa-wrench\"></i>', 1, 'frontend-menus.create', 'frontend-menus.index', 0, '2024-10-27 10:13:54', '2024-12-17 08:49:59'),
(13, 0, 5, 'Backend Menus', '<i class=\"nav-icon fas fa-clipboard-list\"></i>', 0, 'menus.create', 'menus.index', 1, '2024-10-27 11:17:41', '2025-03-11 04:21:38'),
(15, 29, 1, 'Payment Methods', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'payment-methods.create', 'payment-methods.index', 1, '2024-10-27 12:09:17', '2025-02-19 12:42:44'),
(16, 69, 3, 'Colors', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'colors.create', 'colors.index', 1, '2024-10-28 04:25:23', '2025-02-27 12:00:10'),
(17, 29, 2, 'Accounts', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'accounts.create', 'accounts.index', 1, '2024-10-28 11:21:04', '2025-02-19 12:00:01'),
(21, 19, 1, 'Add', NULL, 0, NULL, 'service-types.create', 1, '2024-10-31 10:28:22', '2024-10-31 10:31:33'),
(23, 19, 3, 'Delete', NULL, 0, NULL, 'service-types.destroy', 1, '2024-10-31 10:29:54', '2024-10-31 10:31:16'),
(24, 16, 1, 'Add', NULL, 0, NULL, 'colors.create', 1, '2024-10-31 10:32:07', '2025-03-11 08:45:06'),
(25, 16, 2, 'Edit', NULL, 0, NULL, 'colors.edit', 1, '2024-10-31 10:32:22', '2025-03-11 08:45:11'),
(29, 0, 6, 'Account Manage', '<i class=\"nav-icon fa fa-credit-card\"></i>', 1, NULL, NULL, 1, '2024-11-03 08:16:54', '2025-04-21 06:28:17'),
(30, 0, 10, 'Service Manage', '<i class=\"nav-icon fa fa-tools\"></i>', 1, NULL, NULL, 0, '2024-11-03 10:01:16', '2025-04-28 08:45:50'),
(33, 2, 1, 'Edit', NULL, 0, NULL, 'basic-infos.edit', 1, '2024-11-09 10:07:19', '2024-11-09 10:07:19'),
(34, 43, 1, 'Branch Manage', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'branches.create', 'branches.index', 1, '2024-12-22 04:37:22', '2025-01-12 11:37:55'),
(35, 69, 5, 'Bike Purchases', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'bike-purchases.create', 'bike-purchases.index', 1, '2024-12-29 10:40:45', '2025-02-27 12:01:16'),
(36, 30, 2, 'Services', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, 'bike-services.create', 'bike-services.index', 1, '2024-12-29 11:01:41', '2025-03-08 06:15:52'),
(37, 20, 1, 'Add', NULL, 0, NULL, 'transfer-requisitions.create', 1, '2024-12-30 12:04:19', '2024-12-30 12:04:19'),
(38, 20, 2, 'Edit', NULL, 0, NULL, 'transfer-requisitions.edit', 1, '2024-12-30 12:04:54', '2024-12-30 12:04:54'),
(39, 20, 3, 'Delete', NULL, 0, NULL, 'transfer-requisitions.destroy', 1, '2024-12-30 12:05:24', '2024-12-30 12:05:24'),
(40, 69, 2, 'Bike Models', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'bike-models.create', 'bike-models.index', 1, '2025-01-04 05:01:10', '2025-02-27 12:00:44'),
(41, 40, 1, 'Add', '<i class=\"nav-icon fas fa-check-circle\"></i>', 0, NULL, 'assets-statuses.create', 1, '2025-01-04 06:21:56', '2025-01-04 06:21:56'),
(42, 36, 1, 'Edit', NULL, 0, NULL, 'transfer-requisitions.edit-incoming', 0, '2025-01-06 12:01:59', '2025-02-27 10:44:36'),
(43, 0, 12, 'Employee Manage', '<i class=\"fas fa-users\"></i>', 1, NULL, NULL, 0, '2025-01-12 11:17:06', '2025-02-19 07:05:07'),
(44, 43, 1, 'Departments', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'departments.create', 'departments.index', 1, '2025-01-12 11:20:43', '2025-01-12 11:22:11'),
(45, 43, 4, 'Employee', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'employees.create', 'employees.index', 1, '2025-01-12 11:37:35', '2025-01-19 18:31:03'),
(46, 184, 1, 'Bike Stock', NULL, 0, NULL, NULL, 1, '2025-01-19 08:34:20', '2025-03-19 06:27:09'),
(47, 184, 2, 'Investors Bike', NULL, 0, NULL, NULL, 1, '2025-01-19 08:34:37', '2025-04-16 10:32:00'),
(48, 184, 3, 'My Bikes', NULL, 0, NULL, NULL, 1, '2025-01-19 08:34:50', '2025-04-16 10:35:43'),
(49, 184, 4, 'Total Sold', NULL, 0, NULL, NULL, 1, '2025-01-19 08:35:06', '2025-04-16 10:32:29'),
(50, 184, 5, 'Today\'s Purchase', NULL, 0, NULL, NULL, 1, '2025-01-19 09:07:13', '2025-04-22 10:22:10'),
(51, 43, 3, 'Designation', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'designations.create', 'designations.index', 1, '2025-01-19 18:29:53', '2025-01-19 18:32:16'),
(52, 0, 13, 'All Reports', '<i class=\"nav-icon fas fa-file-alt\"></i>', 1, NULL, NULL, 0, '2025-01-29 04:26:54', '2025-04-28 06:21:56'),
(53, 52, 1, 'Asset Inventory', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'asset-innventory.assetInventoryIndex', 0, '2025-01-29 04:29:32', '2025-02-26 05:38:09'),
(54, 52, 2, 'Monthly Bike Sales', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.monthly-bike-sales', 1, '2025-01-29 04:30:09', '2025-03-22 04:02:11'),
(55, 52, 3, 'Bike Inventory', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.bike-inventory', 1, '2025-01-29 04:30:44', '2025-03-22 06:37:21'),
(56, 52, 4, 'Monthly Expense', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.monthly-expenses', 1, '2025-01-29 04:33:07', '2025-03-22 18:01:30'),
(57, 52, 5, 'Profit Loss Statement', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.profit-loss-statement', 1, '2025-01-29 04:36:00', '2025-04-13 09:24:28'),
(58, 52, 6, 'Accounts Ledger', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.account-ledger', 1, '2025-01-29 04:36:22', '2025-04-16 04:37:51'),
(59, 52, 7, 'Stock Reports', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.stock-reports', 1, '2025-01-29 04:36:39', '2025-04-20 05:42:15'),
(60, 52, 8, 'Stock History', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.stock-histories', 1, '2025-01-29 04:36:58', '2025-04-20 08:33:56'),
(61, 52, 9, 'Procurement History', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, NULL, 0, '2025-01-29 04:37:22', '2025-03-22 03:35:16'),
(62, 52, 10, 'Compliance', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, NULL, 0, '2025-01-29 04:37:43', '2025-03-22 03:35:25'),
(63, 0, 4, 'Agents', '<i class=\"nav-icon fas fa-user-tie\"></i>', 1, 'agents.create', 'agents.index', 1, '2025-02-19 07:06:17', '2025-04-28 06:38:15'),
(64, 167, 2, 'Investor Transaction', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'investor-transactions.create', 'investor-transactions.index', 1, '2025-02-20 04:28:14', '2025-04-21 07:08:53'),
(65, 64, 1, 'Edit', NULL, 0, NULL, 'investor-transactions.edit', 1, '2025-02-26 05:36:31', '2025-02-26 05:36:31'),
(66, 64, 2, 'Delete', NULL, 0, NULL, 'investor-transactions.destroy', 1, '2025-02-26 05:37:01', '2025-02-26 05:37:01'),
(67, 64, 3, 'Approve', NULL, 0, NULL, 'investor-transactions.approve', 1, '2025-02-26 05:38:40', '2025-02-26 05:38:40'),
(68, 64, 1, 'Add', NULL, 0, NULL, 'investor-transactions.create', 1, '2025-02-26 06:09:30', '2025-02-26 06:09:30'),
(69, 0, 7, 'Bike Manage', '<i class=\"nav-icon fa fa-motorcycle\"></i>', 1, NULL, NULL, 0, '2025-02-27 11:55:21', '2025-04-28 06:20:57'),
(70, 69, 1, 'Brands', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'brands.create', 'brands.index', 1, '2025-02-27 11:59:49', '2025-02-27 11:59:49'),
(71, 29, 3, 'Fund Transfer', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'fundtransfers.create', 'fundtransfers.index', 1, '2025-03-03 09:31:14', '2025-04-21 04:32:15'),
(72, 30, 1, 'Service Category', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'bike-service-categories.create', 'bike-service-categories.index', 1, '2025-03-05 05:33:32', '2025-03-08 06:15:47'),
(73, 69, 7, 'Bike Service Records', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'bike-service-records.create', 'bike-service-records.index', 1, '2025-03-05 09:42:01', '2025-03-09 03:35:59'),
(74, 30, 4, 'Cust Service Records', '<i class=\"far fa-dot-circle nav-icon\"></i>', 0, NULL, NULL, 1, '2025-03-08 06:14:26', '2025-03-11 04:35:03'),
(75, 72, 2, 'Add', NULL, 0, NULL, 'bike-service-categories.create', 1, '2025-03-08 09:30:58', '2025-03-08 09:31:30'),
(76, 72, 2, 'Edit', NULL, 0, NULL, 'bike-service-categories.edit', 1, '2025-03-08 09:32:41', '2025-03-08 09:32:41'),
(77, 36, 1, 'Add', NULL, 0, NULL, 'create-route:- bike-services.create', 1, '2025-03-08 09:34:17', '2025-03-08 09:34:17'),
(78, 36, 2, 'Edit', NULL, 0, NULL, 'bike-services.edit', 1, '2025-03-08 09:34:53', '2025-03-08 09:34:53'),
(79, 73, 1, 'Add', NULL, 0, NULL, 'bike-service-records.create', 1, '2025-03-08 09:35:53', '2025-03-08 09:35:53'),
(80, 73, 2, 'Edit', NULL, 0, NULL, 'bike-service-records.edit', 1, '2025-03-08 09:36:36', '2025-03-08 09:36:36'),
(81, 73, 3, 'Delete', NULL, 0, NULL, 'bike-service-records.destroy', 1, '2025-03-08 09:37:16', '2025-03-08 09:37:16'),
(82, 73, 4, 'Approve', NULL, 0, NULL, 'bike-service-records.approve', 1, '2025-03-08 09:38:04', '2025-03-08 09:38:04'),
(84, 69, 6, 'Bike Sales', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'bike-sales.create', 'bike-sales.index', 1, '2025-03-09 03:36:54', '2025-03-09 03:36:54'),
(85, 69, 8, 'Bike Profit', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'bike-profits.index', 1, '2025-03-10 07:21:36', '2025-03-10 08:23:41'),
(86, 63, 1, 'Edit', NULL, 0, NULL, 'agents.edit', 1, '2025-03-11 08:14:15', '2025-04-28 06:39:18'),
(87, 63, 1, 'Add', NULL, 0, NULL, 'agents.create', 1, '2025-03-11 08:14:52', '2025-04-28 06:38:51'),
(88, 15, 1, 'Add', NULL, 0, NULL, 'payment-methods.create', 1, '2025-03-11 08:15:34', '2025-03-11 08:15:34'),
(89, 15, 2, 'Edit', NULL, 0, NULL, 'payment-methods.edit', 1, '2025-03-11 08:15:51', '2025-03-11 08:15:51'),
(90, 17, 1, 'Add', NULL, 0, NULL, 'accounts.create', 1, '2025-03-11 08:16:27', '2025-03-11 08:16:27'),
(91, 17, 2, 'Edit', NULL, 0, NULL, 'accounts.edit', 1, '2025-03-11 08:16:42', '2025-03-11 08:16:42'),
(92, 70, 1, 'Add', NULL, 0, NULL, 'brands.create', 1, '2025-03-11 08:38:46', '2025-03-11 08:38:46'),
(93, 70, 2, 'Edit', NULL, 0, NULL, 'brands.edit', 1, '2025-03-11 08:38:59', '2025-03-11 08:38:59'),
(94, 40, 2, 'Edit', NULL, 0, NULL, 'bike-models.edit', 1, '2025-03-11 08:41:05', '2025-03-11 08:41:05'),
(95, 35, 1, 'Add', NULL, 0, NULL, 'bike-purchases.create', 1, '2025-03-11 08:46:20', '2025-03-18 04:35:27'),
(96, 35, 2, 'Edit', NULL, 0, NULL, 'bike-purchases.edit', 1, '2025-03-11 08:46:31', '2025-03-18 04:35:31'),
(97, 35, 3, 'Delete', NULL, 0, NULL, 'bike-purchases.destroy', 1, '2025-03-11 08:47:19', '2025-03-18 04:35:35'),
(98, 35, 4, 'Approve', NULL, 0, NULL, 'bike-purchases.approve', 1, '2025-03-11 08:48:25', '2025-03-18 04:35:39'),
(99, 84, 1, 'Add', NULL, 0, NULL, 'bike-sales.create', 1, '2025-03-11 08:49:28', '2025-03-11 08:49:28'),
(100, 84, 2, 'Edit', NULL, 0, NULL, 'bike-sales.edit', 1, '2025-03-11 08:49:39', '2025-03-11 08:49:39'),
(101, 84, 3, 'Delete', NULL, 0, NULL, 'bike-sales.destroy', 1, '2025-03-11 08:49:56', '2025-03-11 08:49:56'),
(102, 84, 4, 'Approve', NULL, 0, NULL, 'bike-sales.approve', 1, '2025-03-11 08:50:23', '2025-03-11 08:50:23'),
(103, 85, 1, 'Edit', NULL, 0, NULL, 'bike-profits.edit', 1, '2025-03-11 08:51:17', '2025-03-11 08:51:17'),
(104, 85, 2, 'Close', NULL, 0, NULL, 'bike-profits.change-status', 1, '2025-03-11 08:51:37', '2025-03-14 20:05:47'),
(105, 0, 10, 'Expense Manage', '<i class=\"nav-icon fa-solid fa-money-bill-wave\"></i>', 1, NULL, NULL, 0, '2025-03-12 03:50:17', '2025-04-28 06:21:38'),
(106, 105, 1, 'Category', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'expense-categories.create', 'expense-categories.index', 1, '2025-03-12 03:50:17', '2025-03-12 04:32:03'),
(107, 106, 1, 'Add', NULL, 0, 'expense-categories.create', 'expense-categories.create', 1, '2025-03-12 04:32:22', '2025-03-12 04:33:55'),
(108, 106, 2, 'Edit', NULL, 0, NULL, 'expense-categories.edit', 1, '2025-03-12 04:33:32', '2025-03-12 04:33:32'),
(109, 105, 1, 'Expense Heads', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'expense-heads.create', 'expense-heads.index', 1, '2025-03-12 05:14:34', '2025-03-12 05:14:34'),
(110, 105, 3, 'Expenses', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'expenses.create', 'expenses.index', 1, '2025-03-12 06:35:41', '2025-03-12 06:35:41'),
(111, 109, 1, 'Add', NULL, 0, NULL, 'expense-heads.create', 1, '2025-03-12 06:36:37', '2025-03-12 06:36:37'),
(112, 109, 2, 'Edit', NULL, 0, NULL, 'expense-heads.edit', 1, '2025-03-12 06:36:58', '2025-03-12 06:36:58'),
(113, 110, 1, 'Add', NULL, 0, NULL, 'expenses.create', 1, '2025-03-12 06:38:33', '2025-03-12 06:38:33'),
(114, 110, 2, 'Edit', NULL, 0, NULL, 'expenses.edit', 1, '2025-03-12 06:38:50', '2025-03-12 06:38:50'),
(115, 110, 3, 'Delete', NULL, 0, NULL, 'expenses.destroy', 1, '2025-03-12 06:39:22', '2025-03-12 06:39:22'),
(116, 110, 4, 'Approve', NULL, 0, NULL, 'expenses.approve', 1, '2025-03-12 06:39:54', '2025-03-12 06:39:54'),
(117, 73, 5, 'View', NULL, 0, NULL, 'bike-service-records.view', 1, '2025-03-12 09:21:49', '2025-03-20 08:05:57'),
(118, 110, 5, 'View', NULL, 0, NULL, 'expenses.view', 1, '2025-03-12 09:53:02', '2025-03-12 09:53:02'),
(119, 85, 3, 'View Records', NULL, 0, NULL, 'bike-profits.share-records', 1, '2025-03-14 20:06:39', '2025-03-14 20:06:39'),
(120, 119, 1, 'Edit', NULL, 0, NULL, 'bike-profits.share-records.edit', 1, '2025-03-14 20:08:04', '2025-03-14 20:08:04'),
(121, 119, 2, 'Delete', NULL, 0, NULL, 'bike-profits.share-records.destroy', 1, '2025-03-14 20:08:50', '2025-03-14 20:10:43'),
(122, 119, 3, 'Approve', NULL, 0, NULL, 'bike-profits.share-records.approve', 1, '2025-03-14 20:09:29', '2025-03-14 20:09:29'),
(123, 119, 0, 'Create', NULL, 0, NULL, 'bike-profits.share-records.create', 1, '2025-03-14 20:11:31', '2025-03-14 20:11:50'),
(124, 130, 1, 'Setup', '<i class=\"fa-solid fa-users-gear nav-icon\"></i>', 1, NULL, NULL, 1, '2025-03-15 04:25:16', '2025-03-17 03:32:06'),
(125, 124, 1, 'Category', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'categories.create', 'categories.index', 1, '2025-03-15 04:26:40', '2025-03-15 04:37:43'),
(126, 124, 2, 'Sub Category', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'sub-categories.create', 'sub-categories.index', 1, '2025-03-15 04:39:29', '2025-03-15 04:39:29'),
(127, 0, 6, 'Service Items', '<i class=\"nav-icon fas fa-stethoscope\"></i>', 1, 'items.create', 'items.index', 1, '2025-03-15 04:58:29', '2025-04-28 08:59:51'),
(128, 124, 4, 'Suppliers', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'suppliers.create', 'suppliers.index', 1, '2025-03-15 18:51:51', '2025-03-17 03:49:08'),
(129, 130, 4, 'Supplier Payments', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'payments.create', 'payments.index', 1, '2025-03-15 19:14:30', '2025-03-23 09:39:42'),
(130, 0, 11, 'Inventory Manage', '<i class=\"nav-icon fas fa-warehouse\"></i>', 1, NULL, NULL, 0, '2025-03-15 19:22:44', '2025-04-28 08:44:48'),
(131, 130, 2, 'Purchase', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'purchases.create', 'purchases.index', 1, '2025-03-16 09:00:54', '2025-03-23 09:38:41'),
(132, 84, 5, 'View', '<i class=\"far fa-dot-circle nav-icon\"></i>', 0, NULL, 'bike-service-records.invoice', 1, '2025-03-20 08:04:27', '2025-03-20 08:04:27'),
(133, 73, 6, 'Print', NULL, 0, NULL, 'bike-service-records.invoice.print', 1, '2025-03-20 08:05:40', '2025-03-20 08:06:27'),
(134, 35, 5, 'View', NULL, 0, NULL, 'bike-purchases.invoice', 1, '2025-03-20 09:05:09', '2025-03-20 09:05:09'),
(135, 35, 6, 'Print', NULL, 0, NULL, 'bike-purchases.invoice.print', 1, '2025-03-20 09:05:32', '2025-03-20 09:05:32'),
(136, 0, 5, 'Clients', '<i class=\"nav-icon fas fa-user-tie\"></i>', 1, 'customers.create', 'customers.index', 0, '2025-03-22 19:17:08', '2025-04-28 09:29:42'),
(137, 0, 6, 'Jobs', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'sales.create', 'sales.index', 0, '2025-03-22 20:31:30', '2025-04-28 09:30:36'),
(138, 0, 5, 'Client Payment', '<i class=\"nav-icon fas fa-hand-holding-usd\"></i>', 1, NULL, NULL, 1, '2025-03-23 08:47:00', '2025-04-28 11:47:51'),
(139, 0, 12, 'Loan Manage', '<i class=\"nav-icon fas fa-hand-holding-usd\"></i>', 1, NULL, NULL, 0, '2025-04-09 05:37:41', '2025-04-28 06:21:48'),
(140, 139, 1, 'Party Manage', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'parties.create', 'parties.index', 1, '2025-04-09 05:39:23', '2025-04-09 05:39:23'),
(141, 139, 2, 'Loans', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'loans.create', 'loans.index', 1, '2025-04-10 04:25:30', '2025-04-10 04:25:41'),
(142, 139, 3, 'Party Payments', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'party-payments.index', 1, '2025-04-10 18:01:23', '2025-04-10 18:03:56'),
(143, 141, 1, 'Add', NULL, 0, NULL, 'loans.create', 1, '2025-04-11 17:13:03', '2025-04-11 17:13:03'),
(144, 141, 2, 'Edit', NULL, 0, NULL, 'loans.edit', 1, '2025-04-11 17:15:09', '2025-04-11 17:15:09'),
(145, 141, 3, 'Delete', NULL, 0, NULL, 'loans.destroy', 1, '2025-04-11 17:15:28', '2025-04-11 17:15:28'),
(146, 141, 4, 'Approve', NULL, 0, NULL, 'loans.approve', 1, '2025-04-11 17:16:04', '2025-04-11 17:16:04'),
(147, 141, 5, 'View', NULL, 0, NULL, 'loans.invoice', 1, '2025-04-11 17:17:32', '2025-04-11 17:17:32'),
(148, 141, 6, 'Print', NULL, 0, NULL, 'loans.invoice.print', 1, '2025-04-11 17:17:58', '2025-04-11 17:17:58'),
(149, 131, 1, 'Add', NULL, 0, NULL, 'purchases.create', 1, '2025-04-13 07:08:40', '2025-04-13 07:08:40'),
(150, 131, 2, 'Edit', NULL, 0, NULL, 'purchases.edit', 1, '2025-04-13 07:09:15', '2025-04-13 07:09:15'),
(151, 131, 3, 'Delete', NULL, 0, NULL, 'purchases.destroy', 1, '2025-04-13 07:09:32', '2025-04-13 07:09:32'),
(152, 131, 5, 'View', NULL, 0, NULL, 'purchases.vouchar', 1, '2025-04-13 07:11:25', '2025-04-13 07:11:25'),
(153, 131, 6, 'Print', NULL, 0, NULL, 'purchases.vouchar.print', 1, '2025-04-13 07:11:48', '2025-04-13 07:11:48'),
(154, 131, 4, 'Add Payment', NULL, 0, NULL, 'purchases.payment.store', 1, '2025-04-13 07:12:31', '2025-04-13 07:13:29'),
(155, 137, 1, 'Add', NULL, 0, NULL, 'sales.create', 1, '2025-04-13 08:50:15', '2025-04-13 08:50:15'),
(156, 137, 2, 'Edit', NULL, 0, NULL, 'sales.edit', 1, '2025-04-13 08:50:37', '2025-04-13 08:50:37'),
(157, 137, 3, 'Delete', NULL, 0, NULL, 'sales.destroy', 1, '2025-04-13 08:50:52', '2025-04-13 08:50:52'),
(158, 137, 4, 'Approve', NULL, 0, NULL, 'sales.approve', 1, '2025-04-13 08:51:25', '2025-04-13 08:51:25'),
(159, 137, 5, 'View', NULL, 0, NULL, 'sales.invoice', 1, '2025-04-13 08:52:47', '2025-04-13 08:52:47'),
(160, 137, 6, 'Print', NULL, 0, NULL, 'sales.invoice.print', 1, '2025-04-13 08:53:16', '2025-04-13 08:53:16'),
(161, 137, 7, 'Payment', NULL, 0, NULL, 'sales.payment.store', 1, '2025-04-13 08:53:58', '2025-04-13 08:53:58'),
(162, 35, 8, 'Repurchase', NULL, 0, NULL, 'bike-purchases.repurchase', 1, '2025-04-20 05:24:13', '2025-04-20 05:24:13'),
(163, 71, 1, 'Add', NULL, 0, NULL, 'fundtransfers.create', 1, '2025-04-21 06:57:36', '2025-04-21 06:57:36'),
(164, 71, 2, 'Edit', NULL, 0, NULL, 'fundtransfers.edit', 1, '2025-04-21 06:57:55', '2025-04-21 06:57:55'),
(165, 71, 3, 'Delete', NULL, 0, NULL, 'fundtransfers.destroy', 1, '2025-04-21 06:58:14', '2025-04-21 06:58:14'),
(166, 71, 4, 'Approve', NULL, 0, NULL, 'fundtransfers.approve', 1, '2025-04-21 06:58:30', '2025-04-21 06:58:30'),
(167, 0, 5, 'Investor Manage', '<i class=\"nav-icon fas fa-user-tie\"></i>', 1, NULL, NULL, 0, '2025-04-21 07:05:14', '2025-04-28 06:38:05'),
(168, 184, 6, 'Today\'s Sale', NULL, 0, NULL, NULL, 1, '2025-04-22 10:22:35', '2025-04-22 10:22:35'),
(169, 182, 5, 'Today\'s Expense', NULL, 0, NULL, NULL, 1, '2025-04-22 10:22:53', '2025-04-22 10:22:53'),
(170, 182, 1, 'Today\'s Accessories Sales', NULL, 0, NULL, NULL, 1, '2025-04-22 10:23:13', '2025-04-22 10:23:30'),
(171, 182, 2, 'Today\'s Service Sales', NULL, 0, NULL, NULL, 1, '2025-04-22 10:23:49', '2025-04-22 10:23:49'),
(172, 182, 3, 'Today\'s Spare Parts Sales', NULL, 0, NULL, NULL, 1, '2025-04-22 10:24:04', '2025-04-22 10:24:04'),
(173, 183, 1, 'Today\'s Investor\'s Profit Payment', NULL, 0, NULL, NULL, 1, '2025-04-22 10:24:26', '2025-04-22 10:24:26'),
(174, 183, 2, 'Today\'s New Investment', NULL, 0, NULL, NULL, 1, '2025-04-22 10:24:47', '2025-04-22 10:24:47'),
(175, 183, 3, 'Today\'s Investment Withdraw', NULL, 0, NULL, NULL, 1, '2025-04-22 10:25:10', '2025-04-22 10:25:10'),
(176, 52, 5, 'Accounts Reports', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'reports.accounts-reports', 1, '2025-04-23 03:17:35', '2025-04-23 03:17:35'),
(177, 52, 11, 'Supplier Ledgers', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, NULL, 1, '2025-04-23 03:54:35', '2025-04-23 03:54:35'),
(178, 182, 4, 'Total sales and service', NULL, 0, NULL, NULL, 1, '2025-04-23 10:50:23', '2025-04-23 10:50:23'),
(179, 182, 6, 'Today Inventory Balance', NULL, 0, NULL, NULL, 1, '2025-04-23 10:53:52', '2025-04-23 10:53:52'),
(180, 183, 4, 'Investors Balance', NULL, 0, NULL, NULL, 1, '2025-04-23 10:56:04', '2025-04-23 10:56:04'),
(181, 183, 5, 'My Investment', NULL, 0, NULL, NULL, 1, '2025-04-23 10:57:37', '2025-04-23 10:57:37'),
(182, 1, 1, 'Sales & Expense Info', NULL, 0, NULL, NULL, 0, '2025-04-23 10:58:23', '2025-04-28 06:23:25'),
(183, 1, 2, 'Investement Info', NULL, 0, NULL, NULL, 0, '2025-04-23 11:00:28', '2025-04-28 06:32:52'),
(184, 1, 3, 'Bike Info', NULL, 0, NULL, NULL, 0, '2025-04-23 11:01:24', '2025-04-28 06:32:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 2),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(4, '2014_10_12_000000_create_users_table', 4),
(5, '2024_01_30_123321_create_roles_table', 5),
(6, '2024_01_30_123933_create_privileges_table', 6),
(7, '2023_12_26_114309_create_admins_table', 7),
(8, '2023_10_21_001204_create_basic_infos_table', 8),
(9, '2024_01_30_140322_create_menus_table', 9),
(10, '2024_10_26_114524_create_frontend_menus_table', 10),
(11, '2025_02_19_163817_create_payment_methods_table', 11),
(12, '2025_02_19_174328_create_accounts_table', 12),
(13, '2025_02_20_091126_create_account_ledgers_table', 13),
(14, '2025_02_20_100226_create_investor_transactions_table', 14),
(15, '2025_02_27_092131_create_brands_table', 15),
(16, '2025_02_27_095812_create_bike_models_table', 16),
(17, '2025_02_27_115707_create_colors_table', 17),
(18, '2025_02_27_154107_create_bikes_table', 18),
(19, '2025_02_27_163129_create_sellers_table', 19),
(20, '2025_03_05_104328_create_bike_service_categories_table', 20),
(21, '2025_03_05_120928_create_bike_services_table', 21),
(22, '2025_03_05_134659_create_bike_service_records_table', 22),
(23, '2025_03_05_134723_create_bike_service_record_details_table', 23),
(24, '2025_03_09_094639_create_buyers_table', 24),
(25, '2024_06_25_122016_create_expense_categories_table', 25),
(26, '2024_02_25_120043_create_expense_heads_table', 26),
(27, '2024_02_25_122743_create_expenses_table', 27),
(28, '2024_02_25_123102_create_expense_details_table', 28),
(29, '2025_03_09_152703_create_bike_profits_table', 29),
(30, '2025_03_14_233414_create_bike_profit_share_records_table', 30),
(31, '2023_12_13_144516_create_categories_table', 31),
(32, '2024_04_22_164354_create_category_types_table', 32),
(33, '2024_04_21_135934_create_units_table', 33),
(34, '2024_04_27_130014_create_stock_histories_table', 34),
(35, '2024_04_21_154700_create_suppliers_table', 35),
(37, '2024_04_28_171201_create_supplier_payments_table', 37),
(38, '2024_04_21_190732_create_purchase_details_table', 38),
(39, '2024_04_28_171225_create_supplier_ledgers_table', 39),
(40, '2025_03_23_005944_create_customer_ledgers_table', 40),
(41, '2025_03_23_121648_create_customer_payments_table', 41),
(42, '2025_04_09_103313_create_parties_table', 42),
(43, '2025_04_09_111223_create_party_loans_table', 43),
(44, '2025_04_09_105706_create_party_ledgers_table', 44),
(45, '2025_04_09_110301_create_party_payments_table', 45),
(46, '2025_03_23_005302_create_customers_table', 46),
(47, '2025_03_23_010022_create_sales_table', 47),
(48, '2025_02_27_162237_create_bike_purchases_table', 48),
(49, '2025_03_09_095309_create_bike_sales_table', 49),
(50, '2025_03_23_010039_create_sale_details_table', 50),
(51, '2024_04_21_174416_create_purchases_table', 51),
(52, '2025_04_18_232237_add_is_repurchased_to_bike_sales_table', 52),
(53, '2025_04_21_094759_create_fund_transfer_histories_table', 53),
(123, '2025_02_19_124857_create_agents_table', 54),
(130, '2023_12_26_170202_create_items_table', 55);

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

CREATE TABLE `parties` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nid_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `current_balance` double(20,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parties`
--

INSERT INTO `parties` (`id`, `name`, `email`, `phone`, `address`, `nid_number`, `date_of_birth`, `current_balance`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 'Nowab Shorif', 'nsanoman@gmail.com', '01839317038', 'Companigonj, Noakhali.', '234565432', '1997-03-01', 0.00, '1', 1, NULL, '2025-04-10 04:21:00', '2025-04-13 11:23:06'),
(2, 'Nyssa Griffith', 'rubekem@mailinator.com', '43', 'Ab unde et ad sint c', '719', '2002-04-04', 0.00, '1', 1, NULL, '2025-04-10 04:23:21', '2025-04-13 11:27:31'),
(3, 'Halla Cole', 'jerucece@mailinator.com', '99', 'Temporibus mollit au', '681', '1989-08-31', 0.00, '1', 1, NULL, '2025-04-10 04:23:26', '2025-04-11 17:30:08');

-- --------------------------------------------------------

--
-- Table structure for table `party_ledgers`
--

CREATE TABLE `party_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `party_id` int NOT NULL,
  `loan_id` int DEFAULT NULL,
  `loan_type` tinyint NOT NULL COMMENT '0 = loan_given, 1 = loan_taken',
  `payment_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `particular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL,
  `credit_amount` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `party_loans`
--

CREATE TABLE `party_loans` (
  `id` bigint UNSIGNED NOT NULL,
  `party_id` bigint UNSIGNED NOT NULL,
  `account_id` bigint UNSIGNED DEFAULT NULL,
  `loan_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_type` tinyint NOT NULL COMMENT '0 = loan_given, 1 = loan_taken',
  `amount` double(20,2) NOT NULL,
  `loan_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `last_payment_date` date DEFAULT NULL,
  `paid_amount` double(20,2) NOT NULL DEFAULT '0.00',
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint NOT NULL DEFAULT '0' COMMENT '0 = pending, -1 = partial, 1 = paid',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_id` int UNSIGNED DEFAULT NULL,
  `updated_by_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `party_payments`
--

CREATE TABLE `party_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `party_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `payment_type` tinyint NOT NULL COMMENT '0=paid to party, 1=collection from party',
  `loan_id` bigint DEFAULT NULL,
  `date` date NOT NULL,
  `amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 1, '2025-02-19 11:39:56', '2025-02-19 11:42:27'),
(2, 'Bkash', 1, '2025-02-19 11:40:10', '2025-02-19 11:40:10'),
(3, 'Nagad', 1, '2025-02-19 11:40:17', '2025-02-19 11:40:17'),
(4, 'Islami Bank', 1, '2025-02-19 11:40:50', '2025-02-19 11:40:50'),
(5, 'Sonali Bank', 1, '2025-02-19 12:25:19', '2025-02-19 12:25:19'),
(6, 'Rupali Bank', 1, '2025-02-19 12:28:52', '2025-02-20 06:21:18');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(32, 9, 1, '2025-02-26 12:18:38', '2025-02-26 12:18:38'),
(33, 9, 63, '2025-02-26 12:18:38', '2025-02-26 12:18:38'),
(34, 9, 29, '2025-02-26 12:18:38', '2025-02-26 12:18:38'),
(35, 9, 15, '2025-02-26 12:18:38', '2025-02-26 12:18:38'),
(36, 9, 17, '2025-02-26 12:18:38', '2025-02-26 12:18:38'),
(37, 9, 18, '2025-02-26 12:18:38', '2025-02-26 12:18:38'),
(38, 9, 27, '2025-02-26 12:18:38', '2025-02-26 12:18:38'),
(39, 9, 28, '2025-02-26 12:18:38', '2025-02-26 12:18:38'),
(40, 9, 64, '2025-02-26 12:18:38', '2025-02-26 12:18:38'),
(41, 9, 65, '2025-02-26 12:18:38', '2025-02-26 12:18:38'),
(42, 9, 68, '2025-02-26 12:18:38', '2025-02-26 12:18:38'),
(43, 9, 66, '2025-02-26 12:18:38', '2025-02-26 12:18:38'),
(44, 9, 67, '2025-02-26 12:18:38', '2025-02-26 12:18:38'),
(78, 2, 1, '2025-04-23 11:34:40', '2025-04-23 11:34:40'),
(79, 2, 183, '2025-04-23 11:34:40', '2025-04-23 11:34:40'),
(80, 2, 181, '2025-04-23 11:34:40', '2025-04-23 11:34:40'),
(81, 2, 184, '2025-04-23 11:34:40', '2025-04-23 11:34:40'),
(82, 2, 48, '2025-04-23 11:34:40', '2025-04-23 11:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_id` int NOT NULL,
  `account_id` bigint DEFAULT NULL,
  `vouchar_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `total_price` double(20,2) NOT NULL,
  `vat_tax` double(20,2) DEFAULT '0.00',
  `discount_method` tinyint NOT NULL DEFAULT '1' COMMENT '0=Percentage, 1=Solid',
  `discount_rate` double(20,2) NOT NULL,
  `discount` double(20,2) NOT NULL,
  `total_payable` double(20,2) NOT NULL,
  `paid_amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` decimal(20,2) NOT NULL,
  `unit_price` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `is_superadmin` tinyint NOT NULL DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `is_superadmin`, `created_by`, `role`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Super Admin', 1, NULL, NULL),
(2, 0, 1, 'Agent', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` int DEFAULT NULL,
  `bike_reg_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  `invoice_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `total_price` double(20,2) NOT NULL,
  `vat_tax` double(20,2) DEFAULT '0.00',
  `discount_method` tinyint NOT NULL DEFAULT '1' COMMENT '0=Percentage, 1=Solid',
  `discount_rate` double(20,2) NOT NULL,
  `discount` double(20,2) NOT NULL,
  `total_payable` double(20,2) NOT NULL,
  `paid_amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_id` int NOT NULL,
  `item_type` int NOT NULL COMMENT '0=item, 1=service',
  `item_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `quantity` double(20,2) NOT NULL,
  `unit_price` double(20,2) NOT NULL,
  `purchase_price` double(20,2) DEFAULT NULL,
  `profit` double(20,2) DEFAULT NULL,
  `net_sale_price` double(20,2) DEFAULT NULL,
  `net_profit` double(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `dl_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcn_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_type` tinyint DEFAULT '0' COMMENT '0=general seller, 1=broker',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1' COMMENT '0=inactive, 1=active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_histories`
--

CREATE TABLE `stock_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` int NOT NULL,
  `date` date NOT NULL,
  `particular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_in_qty` double(20,2) DEFAULT NULL,
  `stock_out_qty` double(20,2) DEFAULT NULL,
  `rate` double(20,2) NOT NULL DEFAULT '0.00',
  `current_stock` double(20,2) NOT NULL DEFAULT '0.00',
  `created_by_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_payable` double(20,2) NOT NULL DEFAULT '0.00',
  `opening_receivable` double(20,2) NOT NULL DEFAULT '0.00',
  `current_balance` double(20,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ledgers`
--

CREATE TABLE `supplier_ledgers` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_id` int NOT NULL,
  `purchase_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `particular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL,
  `credit_amount` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_payments`
--

CREATE TABLE `supplier_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `purchase_id` bigint DEFAULT NULL,
  `date` date NOT NULL,
  `amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `is_default` tinyint NOT NULL,
  `unit_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `is_default`, `unit_type`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'quantity', 'Piece', 1, NULL, NULL),
(2, 0, 'quantity', 'Pair', 1, NULL, NULL),
(3, 0, 'quantity', 'Set', 1, NULL, NULL),
(4, 0, 'quantity', 'Box', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basic_infos`
--
ALTER TABLE `basic_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bikes`
--
ALTER TABLE `bikes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bikes_registration_no_unique` (`registration_no`),
  ADD UNIQUE KEY `bikes_chassis_no_unique` (`chassis_no`),
  ADD UNIQUE KEY `bikes_engine_no_unique` (`engine_no`);

--
-- Indexes for table `bike_models`
--
ALTER TABLE `bike_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_profits`
--
ALTER TABLE `bike_profits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_profit_share_records`
--
ALTER TABLE `bike_profit_share_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_purchases`
--
ALTER TABLE `bike_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_sales`
--
ALTER TABLE `bike_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_services`
--
ALTER TABLE `bike_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_service_categories`
--
ALTER TABLE `bike_service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_service_records`
--
ALTER TABLE `bike_service_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bike_service_record_details`
--
ALTER TABLE `bike_service_record_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_types`
--
ALTER TABLE `category_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_ledgers`
--
ALTER TABLE `customer_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_details`
--
ALTER TABLE `expense_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_heads`
--
ALTER TABLE `expense_heads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `frontend_menus`
--
ALTER TABLE `frontend_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frontend_menus_slug_unique` (`slug`);

--
-- Indexes for table `fund_transfer_histories`
--
ALTER TABLE `fund_transfer_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investor_transactions`
--
ALTER TABLE `investor_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `investor_transactions_reference_number_unique` (`reference_number`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parties`
--
ALTER TABLE `parties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `party_ledgers`
--
ALTER TABLE `party_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `party_loans`
--
ALTER TABLE `party_loans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `party_loans_loan_no_unique` (`loan_no`);

--
-- Indexes for table `party_payments`
--
ALTER TABLE `party_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_histories`
--
ALTER TABLE `stock_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_ledgers`
--
ALTER TABLE `supplier_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_payments`
--
ALTER TABLE `supplier_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `basic_infos`
--
ALTER TABLE `basic_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bikes`
--
ALTER TABLE `bikes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bike_models`
--
ALTER TABLE `bike_models`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bike_profits`
--
ALTER TABLE `bike_profits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bike_profit_share_records`
--
ALTER TABLE `bike_profit_share_records`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bike_purchases`
--
ALTER TABLE `bike_purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bike_sales`
--
ALTER TABLE `bike_sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bike_services`
--
ALTER TABLE `bike_services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bike_service_categories`
--
ALTER TABLE `bike_service_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bike_service_records`
--
ALTER TABLE `bike_service_records`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bike_service_record_details`
--
ALTER TABLE `bike_service_record_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `buyers`
--
ALTER TABLE `buyers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `category_types`
--
ALTER TABLE `category_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_ledgers`
--
ALTER TABLE `customer_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_payments`
--
ALTER TABLE `customer_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `expense_details`
--
ALTER TABLE `expense_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_heads`
--
ALTER TABLE `expense_heads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontend_menus`
--
ALTER TABLE `frontend_menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fund_transfer_histories`
--
ALTER TABLE `fund_transfer_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `investor_transactions`
--
ALTER TABLE `investor_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `parties`
--
ALTER TABLE `parties`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `party_ledgers`
--
ALTER TABLE `party_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `party_loans`
--
ALTER TABLE `party_loans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `party_payments`
--
ALTER TABLE `party_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_histories`
--
ALTER TABLE `stock_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_ledgers`
--
ALTER TABLE `supplier_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_payments`
--
ALTER TABLE `supplier_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
