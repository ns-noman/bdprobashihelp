-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 09, 2025 at 01:07 PM
-- Server version: 10.11.15-MariaDB
-- PHP Version: 8.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdprobas_bdprobashihelp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` bigint(20) NOT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active, 0=inactive',
  `created_by_id` bigint(20) DEFAULT NULL,
  `updated_by_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `payment_method_id`, `account_no`, `holder_name`, `balance`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hand Cash', 'Self', 0.00, 1, 1, 1, NULL, '2025-08-01 07:34:03'),
(2, 2, 'Investment Capital', 'Self', 0.00, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_ledgers`
--

CREATE TABLE `account_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `debit_amount` double(20,2) DEFAULT NULL COMMENT 'Withdrawal',
  `credit_amount` double(20,2) DEFAULT NULL COMMENT 'Deposit',
  `current_balance` double(20,2) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `agent_id`, `name`, `username`, `type`, `mobile`, `email`, `password`, `image`, `status`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, NULL, 'BALAL HOSSAIN', NULL, 1, '01717171223', 'admin@gmail.com', '$2y$10$72mM6bhPWEoFlgJKq1WaueJN1g7vMISry0HMa1c5THjRYa7HTISV2', 'admin-1748359557.jpg', 1, '2024-08-30 19:03:44', '2025-06-26 14:32:13', 'G7HcKHYYE0XHxRLQAAWCsXeHnu2rzbQBTrSJdOIJXhtkURAOBa8htH3QcouA'),
(2, 1, 'Jannat-AAI', NULL, 2, '8801893291015', 'jannati-aai@gmail.com', '$2y$10$n7vaM10g4JadX7tp1e97wucWWexL4h8rDJpGUJkVHnDGesKL9MzVm', NULL, 1, '2025-05-27 07:30:04', '2025-05-27 07:32:44', NULL),
(3, 2, 'Emam Hossain-AEHB', NULL, 2, '8801712556088', 'imamair2021@gmail.com', '$2y$10$p4UBo7Qz9ZraZ0ZGNfLGueF9fiF8o9HxdyFLRq561YYXd/Q3Nnzpa', NULL, 1, '2025-05-27 18:12:01', '2025-05-27 18:12:58', 'lUjW2YYTOp6Iaj4x6YZn0FtKXpMgV47qG4saMR7s5dIdyxGAIBpRNVkZ8dM3'),
(4, 3, 'SUHEL AHMED/SAAS', NULL, 2, '01736621425', 'saairservicekanaighat@gmail.com', '$2y$10$lPynkjtMdjZMQdy2hqI2JOADLS9JcV.bGEakiGTFKsR/ORwt3GXFG', NULL, 1, '2025-05-29 15:05:15', '2025-06-01 06:59:17', NULL),
(5, 4, 'Tazul Islam (TABOM)', NULL, 2, '8801863550621', 'tazult937@gmail.com', '$2y$10$cp/ECH9KSy2YjIsYv3aCOOf14I1Jg6IErGdM1Owpy48bbw0GZ1S7e', NULL, 1, '2025-05-31 09:44:02', '2025-06-09 13:24:43', NULL),
(6, NULL, 'Raihan', NULL, 3, '01839317038', 'rayanc430@gmail.com', '$2y$10$BFsTCUky8SYs5oiTYnCOquRDmT7WId7mVzJ0fnnnO6m3FRFDuxxGa', 'admin-1750073550.jpg', 0, '2025-06-01 06:58:47', '2025-12-07 04:51:43', 'THQCkXEThIm9eX5IdSorAgdMq5CQm12XQ38yS2tmJxJL8irxl2IUr7GNhUrc'),
(7, 5, 'Mr. Shihab (AINT)', NULL, 2, '8801756733986', 'shihabbdph@gmail.com', '$2y$10$.mP.VKBNEDd/OPipz.S0IumXjHFzlC1OvgaKvoYVGKXDZ7sGkvUV6', NULL, 1, '2025-06-15 08:55:55', '2025-06-16 06:32:22', 'jddo7IqRDLJK18VbiKbubYlN2sXf69aa7m1C5N58CXsAuxTMG9S6EYv4pkdc'),
(8, 6, 'Mr. Shakil (ISTAI)', NULL, 2, '8801941356122', 'istair.intl@gmail.com', '$2y$10$rCcBnU.FJvgLNBPYZlN4Vuh3rarjUnZd2vL7p.BKgAgi1wB6C6jxy', NULL, 1, '2025-06-15 09:14:29', '2025-07-02 07:28:35', 'PO91Zayzr9v7NGjzAmykC4sNDunZlGAmlNm6B0Jw2FLmHb3WRjx248Wv2L6S'),
(9, 7, 'Mr. Moin (AITI)', NULL, 2, '8801617767132', 'moinaiti@gmail.com', '$2y$10$X4egHVlPi3KmQqGee/N1zeqVr4CV/8g14ydu4ZFfj6XyU7e.uOxJq', NULL, 1, '2025-06-18 09:35:40', '2025-06-18 09:36:16', NULL),
(10, 8, 'Mr.Imran Hossain', NULL, 2, '8801711442443', 'bdarmaan@gmail.com', '$2y$10$cbqDa7M.P2D83BJlO2UBU.11GuM30roF5yM0raPsFKoLcxQpqA2vG', NULL, 1, '2025-06-20 10:39:02', '2025-06-20 10:41:23', NULL),
(11, 9, 'A.K.M Fazlul Haque Bacchu', NULL, 2, '8801711861594', 'rngrint2017@gmail.com', '$2y$10$Dzd2kVv9oee1SxbChZacFeIwSUXFODgGgG50r3V2nK52wkZUjnup.', NULL, 1, '2025-06-20 15:20:37', '2025-06-20 15:22:50', 'mioRK7RbHBfSr8WvCeb3lMseOY1St7pm4TgNPK3fJZ1iAD9MPCA3ryI9QR0f'),
(12, 10, 'Md Abdus Sukur Howlader (Kajal)', NULL, 2, '8801759133307', 'kajal699@yahoo.com', '$2y$10$u/L4fKEgsykTjV39X.JeouiY5k.4kCcrFp/lsYjnxKGxuVM2RO9IC', NULL, 1, '2025-06-21 11:11:00', '2025-06-21 11:11:36', NULL),
(13, 11, 'Mr Shohid', NULL, 2, '8801821294392', 'scba@gmail.com', '$2y$10$Awnb9vQXIvQvwTqY9YYlMOOg7gw8tRdVM.J8TGEhEdJo/Y38ZgtJW', NULL, 1, '2025-06-21 11:29:47', '2025-06-21 11:30:32', NULL),
(14, 12, 'Mr. Mehidi Hasan', NULL, 2, '8801711842641', 'mhat@gmail.com', '$2y$10$03UXy0qxtQbk3BMPcU0JM.3oMBRlWUZyPL0znCUiSQuffMbl2FSlC', NULL, 1, '2025-06-23 10:20:02', '2025-06-23 10:24:11', NULL),
(15, 13, 'MR.SOLEMAN', NULL, 2, '8801706193037', 'arafiwasi007@gmail.com', '$2y$10$2EGV8G3/R2ZyifZqwLOK0.vOVqVvkZnw9IABtZUcy4TSmAuqP4kMS', NULL, 1, '2025-06-27 16:24:25', '2025-06-27 16:24:48', 'Tm0pFWB9s9QmrQiShpUjodtZymr92VxRVn8FOWbmmOqXuaIhxsENkAYmtHAM'),
(16, 14, 'Amzad Hossain (RAZIA)', NULL, 2, '8801902532204', 'mzad3305@gmail.com', '$2y$10$0slQTJlYThbhKHhf1wg8Res1/ih8ulKq2OKrooNDkB17E8KZWqjn2', NULL, 1, '2025-06-28 06:17:30', '2025-06-28 06:18:11', 'KSjXcnXVzTagG3Et3HBLX1bBS1Ci5EJvSZ8bOlxULYp2VJYIqXpbsuUQ2xMU'),
(17, 15, 'MR HARUN', NULL, 2, '8801831585799', 'shohagsinha777@gmail.com', '$2y$10$/6CmzTVMf2pcdVxBoJfkNOKUzKICLZeEwgEJx6uep2iTlYn1YGMye', NULL, 1, '2025-07-02 05:07:50', '2025-07-02 05:16:01', NULL),
(18, 16, 'SOURAV UDDIN SUNNY (BSL)', NULL, 2, '8801775270376', 'gmaisouravuddinsunny@gmail.com', '$2y$10$B5sH.5nlnzV1Qh27650pZemE8/WEUrzOOdzO.EbLPc25ognE0VU8y', NULL, 1, '2025-07-02 18:06:20', '2025-07-02 18:08:08', NULL),
(19, 17, 'Rehan_Faiza', NULL, 2, '8801758364093', 'taniaakterranu55@gmail.com', '$2y$10$pJnaKZ4CvjGPNn5YdyHQdusq1GMNnSyaHAZJjbXF.JMLYExlQUbvC', NULL, 0, '2025-07-05 11:12:25', '2025-07-05 11:46:21', NULL),
(20, NULL, 'Rehan & Faiza', NULL, 5, '+880 1709988255', 'rehanfaiza@gmail.com', '$2y$10$6yrqVEO07gW7cX46mqOY8e5jQPWYr9icpOyfNcRBRVoNWp7jtqwMi', NULL, 1, '2025-07-05 11:52:49', '2025-09-04 12:27:23', 'AwDp2Y0wzfZjuvMSR5OZi7gzhGABpnlF6ZXnxDXTWxVA05VoHAuwXoP69tb2'),
(21, 18, 'Mohammad Murshad Alam (MHO)', NULL, 2, '8801817121737', 'murshadalam@rocketmail.com', '$2y$10$OM4dVZO/fqVTYpfDbx12y.CXBf9QYddumwx7vfX7eP9qr81FEqMU6', NULL, 1, '2025-07-11 08:18:00', '2025-07-11 08:18:33', NULL),
(22, 19, 'Rakib Hossen  (PILTD)', NULL, 2, '8801815451331', 'rakibpiltd@gmail.com', '$2y$10$kMqqxuygJPRg0iOYFepTfe4ctK/qghXZ0LGxP3kk8MJQDqs3YG1Oy', NULL, 1, '2025-07-12 10:46:02', '2025-07-12 10:46:21', NULL),
(23, 20, 'Mr. Osman (DHAKA)', NULL, 2, '8801717837865', 'dhaka@gmail.com', '$2y$10$rjqm2Cu.QvDTCWXZ4jwFS.d53Lvf4zyCYAUq1ZM1C6HdhR37HNQHa', NULL, 1, '2025-07-12 16:24:25', '2025-07-12 16:25:36', '5hp0BTjczBOzpTdVms4JN3qbbr15lLeZPD3vXdfaJ3mDrphUmm9lbaPjfQwL'),
(24, 21, 'Muhibullah Masum (ISLAMI)', NULL, 2, '8801924483030', 'islamitravelsbd@gmail.com', '$2y$10$QpDEYfKmOMLycSyc2BwMzOF5SLcUx49Sgm/A7hvTEO/XhpcltUogC', 'admin-1752524104.jpg', 1, '2025-07-14 18:42:52', '2025-07-14 20:15:04', 'GN9WpOF8lMLYCq9kgLFZgdnea6oxqFgFh71K5QZZG2NFLXwtQ27atntEmQ6O'),
(25, 22, 'Md Bellal Khan', NULL, 2, '8801628696385', 'bellalkhan@gmail.com', '$2y$10$bMn8jDzPNC/wI0CzRCmgNOrP8JpqSoCxSadMbuAndXtuBazXzZHAq', NULL, 1, '2025-07-15 18:09:06', '2025-07-15 18:10:06', NULL),
(26, 23, 'Mr Shohel', NULL, 2, '8801773852603', 'mstudio5536@gmail.com', '$2y$10$Oc0puIX8N6G32GEdNQ4LkOntphGXeqiamyzo5mXHSLu8SEG/jfkye', NULL, 1, '2025-08-02 17:33:50', '2025-08-07 08:50:31', 'PDhpj58XVWJNPEVjvlLUVEyhSK2TuWucx06TcpOz1zyZbC3bfDDdKUAnGhvF'),
(27, 24, 'SIBBIR (SBIR)', NULL, 2, '8801611177771', 'sbir@gmail.com', '$2y$10$9Od274kp8IDk3Bu2XLPWC.9qcppXfDC2P1JelM7iEIjMJpVKkIzYi', NULL, 1, '2025-08-05 05:23:51', '2025-08-05 05:26:34', NULL),
(28, 25, 'Murshad Alam- (MHO) All', NULL, 2, '8801817121737', 'mho@gmail.com', '$2y$10$76d9ApfBDxzpo9fOkzdB/eAhf3KTQQ97w6CM.mXuFPzLRwiWZ3.CK', NULL, 1, '2025-08-05 05:26:12', '2025-08-05 05:26:28', NULL),
(29, 26, 'Mr. Bappy & Rubel (BR007)', NULL, 2, '8801839396539', 'br007@gmail.com', '$2y$10$18r2JrtQfFr5NWeIqDXqPeGEHwU5cFniI3.cS5SHPFfnTKRLYRLT6', NULL, 1, '2025-08-05 06:46:39', '2025-08-05 06:46:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `basic_infos`
--

CREATE TABLE `basic_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `location` text NOT NULL,
  `address` text NOT NULL,
  `web_link` text DEFAULT NULL,
  `facebook_link` text DEFAULT NULL,
  `twitter_link` text DEFAULT NULL,
  `linkedin_link` text DEFAULT NULL,
  `youtube_link` text DEFAULT NULL,
  `assets_value` int(11) NOT NULL,
  `total_employees` int(11) NOT NULL,
  `total_companies` int(11) NOT NULL,
  `start_year` int(11) NOT NULL,
  `map_embed` longtext NOT NULL,
  `video_embed_1` longtext NOT NULL,
  `video_embed_2` longtext NOT NULL,
  `video_embed_3` longtext NOT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_infos`
--

INSERT INTO `basic_infos` (`id`, `title`, `meta_keywords`, `meta_description`, `logo`, `favicon`, `phone`, `telephone`, `fax`, `email`, `location`, `address`, `web_link`, `facebook_link`, `twitter_link`, `linkedin_link`, `youtube_link`, `assets_value`, `total_employees`, `total_companies`, `start_year`, `map_embed`, `video_embed_1`, `video_embed_2`, `video_embed_3`, `currency_symbol`, `created_at`, `updated_at`) VALUES
(1, 'BD Probashi Help', 'Sit pariatur Numqua', 'Voluptatem cumque q', 'logo-1745820941.png', 'favicon-1745820941.png', '+8801717171223', '+1 (691) 538-1161', '+1 (708) 916-5628', 'support@bdprobashihelp.com', 'Soluta eos nihil en', '=বিডি প্রবাসী হেল্প =  অফিস নং- ক-২,তিন তলা, লিফট-২, Rupayan FPAB Tower,( পল্টন টাওয়ার এর ১ টা বিল্ডিং পূর্ব পার্শ্বে), জামান টাওয়ার এর উল্টা পাশে , কালভার্ট  রোড , ঢাকা-১০০০।', 'Excepturi cupiditate', 'Et non nihil commodi', 'Cillum officia debit', 'Consectetur eum temp', 'Eligendi cupiditate', 87, 78, 100, 1981, 'Maxime voluptatem r', 'Voluptates iusto pro', 'Suscipit labore sit', 'Dignissimos eum est', '৳', NULL, '2025-05-27 15:31:28');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_cat_id` int(11) NOT NULL DEFAULT 0,
  `cat_type_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
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
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'AL', 'Albania', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'DZ', 'Algeria', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'AS', 'American Samoa', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'AD', 'Andorra', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'AO', 'Angola', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'AI', 'Anguilla', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'AQ', 'Antarctica', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'AG', 'Antigua and Barbuda', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'AR', 'Argentina', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'AM', 'Armenia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'AW', 'Aruba', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'AU', 'Australia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'AT', 'Austria', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'AZ', 'Azerbaijan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'BS', 'Bahamas', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'BH', 'Bahrain', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'BD', 'Bangladesh', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'BB', 'Barbados', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'BY', 'Belarus', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'BE', 'Belgium', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'BZ', 'Belize', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'BJ', 'Benin', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'BM', 'Bermuda', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'BT', 'Bhutan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'BO', 'Bolivia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'BA', 'Bosnia and Herzegovina', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'BW', 'Botswana', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'BV', 'Bouvet Island', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'BR', 'Brazil', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'IO', 'British Indian Ocean Territory', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'BN', 'Brunei Darussalam', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'BG', 'Bulgaria', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'BF', 'Burkina Faso', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'BI', 'Burundi', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'KH', 'Cambodia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'CM', 'Cameroon', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'CA', 'Canada', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'CV', 'Cape Verde', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'KY', 'Cayman Islands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'CF', 'Central African Republic', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'TD', 'Chad', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'CL', 'Chile', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'CN', 'China', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'CX', 'Christmas Island', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'CC', 'Cocos (Keeling) Islands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'CO', 'Colombia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'KM', 'Comoros', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'CD', 'Democratic Republic of the Congo', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'CG', 'Republic of Congo', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'CK', 'Cook Islands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'CR', 'Costa Rica', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'HR', 'Croatia (Hrvatska)', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'CU', 'Cuba', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'CY', 'Cyprus', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'CZ', 'Czech Republic', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'DK', 'Denmark', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'DJ', 'Djibouti', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'DM', 'Dominica', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'DO', 'Dominican Republic', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'TL', 'East Timor', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'EC', 'Ecuador', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'EG', 'Egypt', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'SV', 'El Salvador', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'GQ', 'Equatorial Guinea', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'ER', 'Eritrea', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'EE', 'Estonia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'ET', 'Ethiopia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'FK', 'Falkland Islands (Malvinas)', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'FO', 'Faroe Islands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'FJ', 'Fiji', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'FI', 'Finland', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'FR', 'France', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'FX', 'France, Metropolitan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'GF', 'French Guiana', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'PF', 'French Polynesia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'TF', 'French Southern Territories', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'GA', 'Gabon', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'GM', 'Gambia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'GE', 'Georgia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'DE', 'Germany', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'GH', 'Ghana', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'GI', 'Gibraltar', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'GG', 'Guernsey', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'GR', 'Greece', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'GL', 'Greenland', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'GD', 'Grenada', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'GP', 'Guadeloupe', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'GU', 'Guam', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'GT', 'Guatemala', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'GN', 'Guinea', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'GW', 'Guinea-Bissau', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'GY', 'Guyana', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'HT', 'Haiti', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'HM', 'Heard and Mc Donald Islands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'HN', 'Honduras', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'HK', 'Hong Kong', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'HU', 'Hungary', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'IS', 'Iceland', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'IN', 'India', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'IM', 'Isle of Man', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'ID', 'Indonesia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'IR', 'Iran (Islamic Republic of)', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'IQ', 'Iraq', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'IE', 'Ireland', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'IL', 'Israel', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'IT', 'Italy', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'CI', 'Ivory Coast', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'JE', 'Jersey', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'JM', 'Jamaica', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'JP', 'Japan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'JO', 'Jordan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'KZ', 'Kazakhstan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'KE', 'Kenya', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'KI', 'Kiribati', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'KP', 'Korea, Democratic People\'s Republic of', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'KR', 'Korea, Republic of', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'XK', 'Kosovo', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'KW', 'Kuwait', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'KG', 'Kyrgyzstan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'LA', 'Lao People\'s Democratic Republic', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'LV', 'Latvia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'LB', 'Lebanon', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'LS', 'Lesotho', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'LR', 'Liberia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'LY', 'Libyan Arab Jamahiriya', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'LI', 'Liechtenstein', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'LT', 'Lithuania', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'LU', 'Luxembourg', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'MO', 'Macau', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'MK', 'North Macedonia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'MG', 'Madagascar', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'MW', 'Malawi', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'MY', 'Malaysia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'MV', 'Maldives', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'ML', 'Mali', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'MT', 'Malta', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'MH', 'Marshall Islands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'MQ', 'Martinique', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'MR', 'Mauritania', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'MU', 'Mauritius', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'YT', 'Mayotte', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'MX', 'Mexico', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'FM', 'Micronesia, Federated States of', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'MD', 'Moldova, Republic of', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'MC', 'Monaco', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'MN', 'Mongolia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'ME', 'Montenegro', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'MS', 'Montserrat', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'MA', 'Morocco', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'MZ', 'Mozambique', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'MM', 'Myanmar', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'NA', 'Namibia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'NR', 'Nauru', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'NP', 'Nepal', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'NL', 'Netherlands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'AN', 'Netherlands Antilles', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'NC', 'New Caledonia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'NZ', 'New Zealand', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'NI', 'Nicaragua', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'NE', 'Niger', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'NG', 'Nigeria', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'NU', 'Niue', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'NF', 'Norfolk Island', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'MP', 'Northern Mariana Islands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'NO', 'Norway', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'OM', 'Oman', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'PK', 'Pakistan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'PW', 'Palau', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'PS', 'Palestine', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'PA', 'Panama', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'PG', 'Papua New Guinea', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'PY', 'Paraguay', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'PE', 'Peru', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'PH', 'Philippines', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'PN', 'Pitcairn', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'PL', 'Poland', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'PT', 'Portugal', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'PR', 'Puerto Rico', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'QA', 'Qatar', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'RE', 'Reunion', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'RO', 'Romania', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'RU', 'Russian Federation', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'RW', 'Rwanda', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'KN', 'Saint Kitts and Nevis', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'LC', 'Saint Lucia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'VC', 'Saint Vincent and the Grenadines', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'WS', 'Samoa', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'SM', 'San Marino', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'ST', 'Sao Tome and Principe', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'SA', 'Saudi Arabia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'SN', 'Senegal', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'RS', 'Serbia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'SC', 'Seychelles', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'SL', 'Sierra Leone', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'SG', 'Singapore', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'SK', 'Slovakia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'SI', 'Slovenia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'SB', 'Solomon Islands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'SO', 'Somalia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'ZA', 'South Africa', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'GS', 'South Georgia South Sandwich Islands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'SS', 'South Sudan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'ES', 'Spain', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'LK', 'Sri Lanka', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'SH', 'St. Helena', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'PM', 'St. Pierre and Miquelon', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'SD', 'Sudan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'SR', 'Suriname', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'SJ', 'Svalbard and Jan Mayen Islands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'SZ', 'Eswatini', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'SE', 'Sweden', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'CH', 'Switzerland', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'SY', 'Syrian Arab Republic', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'TW', 'Taiwan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'TJ', 'Tajikistan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'TZ', 'Tanzania, United Republic of', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'TH', 'Thailand', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'TG', 'Togo', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'TK', 'Tokelau', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'TO', 'Tonga', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'TT', 'Trinidad and Tobago', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'TN', 'Tunisia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'TR', 'Turkey', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'TM', 'Turkmenistan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'TC', 'Turks and Caicos Islands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'TV', 'Tuvalu', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'UG', 'Uganda', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'UA', 'Ukraine', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'AE', 'United Arab Emirates', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'GB', 'United Kingdom', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'US', 'United States', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'UM', 'United States minor outlying islands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'UY', 'Uruguay', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'UZ', 'Uzbekistan', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'VU', 'Vanuatu', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'VA', 'Vatican City State', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'VE', 'Venezuela', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'VN', 'Vietnam', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'VG', 'Virgin Islands (British)', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'VI', 'Virgin Islands (U.S.)', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'WF', 'Wallis and Futuna Islands', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'EH', 'Western Sahara', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'YE', 'Yemen', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'ZM', 'Zambia', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'ZW', 'Zimbabwe', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `current_balance` double(20,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `code`, `email`, `phone`, `address`, `organization`, `current_balance`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 'Jannat(AAI)', 'AAI', 'jannati-aai@gmail.com', '8801893291015', '37/2, Zaman Tower (2nd Floor), Purana Paltan, Dhaka-1000', 'Anifa air international', 0.00, '1', 1, NULL, '2025-05-27 01:30:04', '2025-06-20 14:55:26'),
(2, 'Emam Hossain(AEHB)', 'AEHB', 'imamair2021@gmail.com', '8801712556088', '118 DIT Ext. Road, Fokirapul, Dhaka-1000', 'Bismillah Telecom', 0.00, '1', 1, NULL, '2025-05-27 12:12:01', '2025-06-19 05:19:56'),
(3, 'SUHEL AHMED(SAAS)', 'SAAS', 'saairservicekanaighat@gmail.com', '01736621425', 'AZIZ COMPLEX, KANAIGHAT UTTAR BAZAR', 'SA AIR SERVICE', 0.00, '1', 1, NULL, '2025-05-29 09:05:15', '2025-07-06 07:00:49'),
(4, 'Tazul Islam (TABOM)', 'TABOM', 'tazult937@gmail.com', '8801863550621', 'Palton, Dhaka, Bangladesh', 'Tazul overseas international', 0.00, '1', 1, NULL, '2025-05-31 03:44:02', '2025-06-26 11:23:17'),
(5, 'Mr. Shihab (AINT)', 'AINT', 'abdullahaircervice@gmail.com', '8801756733986', 'Nur Travels, নিচ তলা, Rupayan FPAB Tower, জামান টাওয়ার এর উল্টা পাশে , কালভার্ট রোড , ঢাকা-১০০০।', 'Abdullah air International', 0.00, '1', 1, NULL, '2025-06-15 02:55:55', '2025-08-01 07:34:03'),
(6, 'Mr. Shakil (ISTAI)', 'ISTAI', 'istair.shakil@gmail.com', '8801941356122', 'KR Plaza, 31 Purana Paltan, Dhaka-1000. , Dhaka, Bangladesh', 'IST Air International', 0.00, '1', 1, NULL, '2025-06-15 03:14:29', '2025-07-18 14:45:09'),
(7, 'Mr. Moin (AITI)', 'AITI', 'moinaiti@gmail.com', '8801617767132', 'Polton, Dhaka, Bangladesh', 'Moin travels and tourism', 0.00, '1', 1, NULL, '2025-06-18 09:35:40', '2025-06-18 09:35:40'),
(8, 'Mr.Imran Hossain', 'DTA', 'bdarmaan@gmail.com', '8801711442443', 'House-18, Section-12, Block-E, Avenue-1, Mirpur, Dhaka-1216', 'DHAKA TOURISM', 0.00, '1', 1, NULL, '2025-06-20 10:39:02', '2025-06-20 10:39:02'),
(9, 'A.K.M Fazlul Haque Bacchu-RANGER', 'RANGER', 'rngrint2017@gmail.com', '8801711861594', '78, Naya Paltan, Shanjari Tower, (5th Floor), Flat No- 6/C, Dhaka-1000', 'RANGER INTERNATIONAL', 0.00, '1', 1, NULL, '2025-06-20 15:20:37', '2025-07-13 17:57:31'),
(10, 'Md Abdus Sukur Howlader (Kajal)', 'AMDC-S', 'kajal699@yahoo.com', '8801759133307', '81/3,D.I.T Ext Road, Fakirapool, (2nd  Floor), Z-Net Tower Goli) Motijheel, Dhaka-1000', 'ADHUNIK DIAGNOSTIC & MEDICAL CENTER LTD.', 0.00, '1', 1, NULL, '2025-06-21 11:11:00', '2025-06-21 11:11:00'),
(11, 'Mr Shohid-SCBA', 'SCBA', 'scba@gmail.com', '8801821294392', 'Cocacola, Baridhara, Dhaka-1205, Bangladesh', 'Shohid Tour and Travels', 0.00, '1', 1, NULL, '2025-06-21 11:29:46', '2025-06-24 11:08:00'),
(12, 'Mr. Mehidi Hasan-MHAT', 'MHAT', 'mhat@gmail.com', '8801711842641', 'Aktam Tower, Bijoy Nagoor, Dhaka', 'Mehidi Tour and Travel', 0.00, '1', 1, NULL, '2025-06-23 10:20:01', '2025-06-24 11:07:47'),
(13, 'MR.SOLEMAN (ARAFI)', 'ARAFI', 'arafiwasi007@gmail.com', '8801706193037', 'PALTON, DHAKA', 'SOLEMANTOURS AND TRAVELS', 0.00, '1', 1, NULL, '2025-06-27 16:24:25', '2025-06-28 10:19:00'),
(14, 'Amzad Hossain (RAZIA)', 'RAZIA', 'mzad3305@gmail.com', '8801902532204', '40/1/A Nurjahan Trade Center,Suite-A 11,(10th Floor)Nayapaltan, Dhaka.', 'Razia air International.', 0.00, '1', 1, NULL, '2025-06-28 06:17:30', '2025-07-07 19:01:22'),
(15, 'MR HARUN (HAI)', 'HAI', 'shohagsinha777@gmail.com', '8801831585799', 'K-2, 2nd Floor, Lift-2, Rupayan FPAB Tower, (Beside Palton Tower) 2 Nayapalton, Box Culvert Road, Dhaka-1000', 'HARUN AIR INTERNATIONAL AND HARUN TOURS & TRAVELS', 0.00, '1', 1, NULL, '2025-07-02 05:07:50', '2025-07-05 12:58:52'),
(16, 'SOURAV UDDIN SUNNY (BSL)', 'BSL', 'gmaisouravuddinsunny@gmail.com', '8801775270376', 'CHINA TOWN, LIFT 4, SHOP # (5/30)=67/1,68 V.I.P Road, Naya Paltan, Dhaka-1000, Dhaka, Bangladesh', 'BSL OVERSEAS', 0.00, '1', 1, NULL, '2025-07-02 18:06:20', '2025-07-02 18:06:20'),
(17, 'aaa', 'aa', 'abcd@gmail.com', '14777', 'Mirpur, Dhaka, Bangladesh', 'tour and travel', 0.00, '0', 1, NULL, '2025-07-05 11:12:25', '2025-07-05 13:26:30'),
(18, 'Mohammad Murshad Alam (MHO)', 'MHO', 'murshadalam@rocketmail.com', '8801817121737', 'Baliadi Mansion,\r\n16, Dilkusha C/A Room (4th Floor)\r\nMotijheel Dhaka-1000\r\nBangladesh', 'H.H Overseas', 0.00, '1', 1, NULL, '2025-07-11 08:17:59', '2025-07-15 02:54:11'),
(19, 'Rakib Hossen  (PILTD)', 'PILTD', 'rakibpiltd@gmail.com', '8801815451331', 'Motijheel', 'PI LTD', 0.00, '1', 1, NULL, '2025-07-12 10:46:02', '2025-07-15 04:16:31'),
(20, 'Mr. Osman (DHAKA)', 'DHAKA', 'dhaka@gmail.com', '8801717837865', 'Palton, Dhaka, Bangladesh', 'Osman Tour and Travel', 0.00, '1', 1, NULL, '2025-07-12 16:24:25', '2025-07-18 13:33:04'),
(21, 'Muhibullah Masum (ISLAMI)', 'ISLAMI', 'islamitravelsbd@gmail.com', '8801924483030', 'Hotel Al Salam Bhavon (1st Floor), 47 Fokirapul more, Dhaka', 'ISLAMI TRAVELS BANGLADESH', 0.00, '1', 1, NULL, '2025-07-14 18:42:52', '2025-07-14 18:42:52'),
(22, 'Md Bellal Khan (BKHAN)', 'BKHAN', 'bellalkhan@gmail.com', '8801628696385', 'Fokirapul', 'Bellal Khan tours and travels', 0.00, '1', 1, NULL, '2025-07-15 18:09:06', '2025-07-15 18:09:25'),
(23, 'SOHEL HOSSAIN (SHAHIN)', 'SHAHIN', 'mstudio5536@gmail.com', '01773852603', '37/2,Purana Paltan, Pritam Zaman Tower, (11th Floor), Room # 1205,Dhaka-1000', 'AL HAMJA OVERSEAS LTD. (RL-1690)', 1000.00, '1', 1, NULL, '2025-08-02 17:33:50', '2025-10-02 07:46:03'),
(24, 'SIBBIR (SBIR)', 'SBIR', 'sbir@gmail.com', '8801611177771', 'PuranaPalton, Dhaka, Bangladesh', 'Sibbir Tour and Travels', 0.00, '1', 1, NULL, '2025-08-05 05:23:51', '2025-08-05 05:23:51'),
(25, 'Mr. Murad', 'KAZITTL', 'murad@gmail.com', '8801956850760', 'Purana Palton, Dhaka, Bangladesh', 'Kazi tours & travels ltd', 0.00, '1', 1, NULL, '2025-08-05 05:26:12', '2025-12-06 06:25:36'),
(26, 'Mr. Bappy & Rubel (BR007)', 'BR007', 'br007@gmail.com', '8801839396539', 'Purana Palton, Dhaka, Bangladesh', 'Bappy & Rubel  Tour and Travels', 0.00, '1', 1, NULL, '2025-08-05 06:46:39', '2025-08-05 06:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `customer_ledgers`
--

CREATE TABLE `customer_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `particular` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL,
  `credit_amount` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_ledgers`
--

INSERT INTO `customer_ledgers` (`id`, `customer_id`, `sale_id`, `payment_id`, `account_id`, `particular`, `date`, `debit_amount`, `credit_amount`, `current_balance`, `reference_number`, `note`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 23, 1, NULL, NULL, 'Sale', '2025-10-02', NULL, 1000.00, 1000.00, NULL, NULL, 1, NULL, '2025-10-02 07:46:03', '2025-10-02 07:46:03'),
(2, 23, 1, NULL, NULL, 'Sale', '2025-10-02', NULL, 0.00, 1000.00, NULL, NULL, 1, NULL, '2025-10-02 07:48:13', '2025-10-02 07:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `customer_payments`
--

CREATE TABLE `customer_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `sale_id` bigint(20) DEFAULT NULL,
  `date` date NOT NULL,
  `amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Approved',
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `expense_no` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `total_amount` decimal(20,2) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Approved',
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `cat_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Rent', 1, '2025-05-29 16:28:48', '2025-05-29 16:28:48'),
(2, 'Salary', 1, '2025-05-29 16:29:03', '2025-05-29 16:29:03'),
(3, 'Purchase', 1, '2025-05-29 16:29:23', '2025-05-29 16:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `expense_details`
--

CREATE TABLE `expense_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_id` int(11) NOT NULL,
  `expense_head_id` int(11) NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_heads`
--

CREATE TABLE `expense_heads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_category_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_heads`
--

INSERT INTO `expense_heads` (`id`, `expense_category_id`, `title`, `code`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Office Rent', NULL, 1, 1, NULL, '2025-05-29 16:29:51', '2025-05-29 16:29:51'),
(2, 2, 'Staff Salary', NULL, 1, 1, NULL, '2025-05-29 16:30:04', '2025-05-29 16:30:04'),
(3, 3, 'Service Purchase', NULL, 1, 1, NULL, '2025-05-29 16:30:19', '2025-05-29 16:30:19'),
(4, 3, 'Slip', NULL, 1, 1, NULL, '2025-05-29 19:27:28', '2025-05-29 19:27:28');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_menus`
--

CREATE TABLE `frontend_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `srln` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_in_menus` tinyint(4) NOT NULL DEFAULT 1,
  `is_in_pages` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfer_histories`
--

CREATE TABLE `fund_transfer_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transfer_date` date NOT NULL,
  `from_account_id` bigint(20) UNSIGNED NOT NULL,
  `to_account_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Approved',
  `created_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investor_transactions`
--

CREATE TABLE `investor_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `investor_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL COMMENT 'Withdrawal',
  `credit_amount` decimal(20,2) DEFAULT NULL COMMENT 'Deposit',
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Approved, 2=Cancelled',
  `created_by_id` bigint(20) DEFAULT NULL,
  `updated_by_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_type` tinyint(4) DEFAULT NULL COMMENT '0=Item, 1=Package',
  `package_id` int(11) DEFAULT NULL,
  `package_item_id` int(11) DEFAULT NULL,
  `srl` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `purchase_price` double(20,2) NOT NULL DEFAULT 0.00,
  `sale_price` double(20,2) NOT NULL DEFAULT 0.00,
  `next_item_id` int(11) DEFAULT NULL COMMENT 'for service works order',
  `vat` double(20,2) NOT NULL DEFAULT 0.00,
  `is_saleable` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_type`, `package_id`, `package_item_id`, `srl`, `name`, `description`, `purchase_price`, `sale_price`, `next_item_id`, `vat`, `is_saleable`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, NULL, 1, 'Pre Medical', NULL, 0.00, 0.00, 2, 0.00, 1, 1, '2025-05-04 21:25:44', '2025-05-27 15:35:16'),
(2, 0, NULL, NULL, 2, 'Satelment', NULL, 300.00, 500.00, 3, 0.00, 1, 1, '2025-05-04 21:26:53', '2025-07-20 02:31:19'),
(3, 0, NULL, NULL, 3, 'Slip Proccess', NULL, 2000.00, 2500.00, 4, 0.00, 1, 1, '2025-05-04 21:27:42', '2025-06-18 18:51:01'),
(4, 0, NULL, NULL, 4, 'MOFA', NULL, 0.00, 0.00, 5, 0.00, 0, 1, '2025-05-04 21:28:02', '2025-05-04 21:28:02'),
(5, 0, NULL, NULL, 5, 'Fit Card', NULL, 0.00, 0.00, 0, 0.00, 0, 1, '2025-05-04 22:41:34', '2025-05-04 22:41:34'),
(6, 1, NULL, NULL, NULL, 'Slip Process Self', NULL, 0.00, 0.00, NULL, 0.00, 1, 1, '2025-05-27 06:23:54', '2025-05-27 06:23:54'),
(7, NULL, 6, 3, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 06:23:54', '2025-05-27 06:23:54'),
(8, 1, NULL, NULL, NULL, 'Standard PKG-1 ( Pre Medical, Satelment, MOFA Update ,FIT Card)', NULL, 500.00, 1000.00, NULL, 0.00, 1, 1, '2025-05-27 07:46:30', '2025-10-02 07:15:39'),
(13, 1, NULL, NULL, NULL, 'Satelment- P1-2K  (Satelment, MOFA,FIT Card)', NULL, 1500.00, 2000.00, NULL, 0.00, 1, 1, '2025-05-27 15:38:04', '2025-06-27 16:56:37'),
(26, 1, NULL, NULL, NULL, 'Satelment- P2-4K (Satelment, MOFA,FIT Card)', NULL, 3500.00, 4000.00, NULL, 0.00, 1, 1, '2025-05-27 15:58:28', '2025-06-27 16:54:57'),
(31, 1, NULL, NULL, NULL, 'Satelment- P4-6.5K  (Satelment, MOFA,FIT Card)', NULL, 6000.00, 6500.00, NULL, 0.00, 1, 1, '2025-05-27 15:59:13', '2025-06-28 09:57:59'),
(36, 1, NULL, NULL, NULL, 'Slip P-3K', NULL, 3000.00, 3000.00, NULL, 0.00, 1, 1, '2025-06-18 18:52:15', '2025-10-02 07:16:31'),
(42, NULL, 26, 1, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-06-27 16:56:24', '2025-06-27 16:56:24'),
(43, NULL, 26, 2, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-06-27 16:56:24', '2025-06-27 16:56:24'),
(44, NULL, 26, 4, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-06-27 16:56:24', '2025-06-27 16:56:24'),
(45, NULL, 26, 5, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-06-27 16:56:24', '2025-06-27 16:56:24'),
(46, NULL, 13, 1, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-06-27 16:56:37', '2025-06-27 16:56:37'),
(47, NULL, 13, 2, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-06-27 16:56:37', '2025-06-27 16:56:37'),
(48, NULL, 13, 4, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-06-27 16:56:37', '2025-06-27 16:56:37'),
(49, NULL, 13, 5, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-06-27 16:56:37', '2025-06-27 16:56:37'),
(54, 1, NULL, NULL, NULL, 'Satelment- P3-5K (Satelment, Slip, MOFA,FIT Card)', NULL, 4000.00, 5000.00, NULL, 0.00, 1, 1, '2025-06-28 09:57:35', '2025-12-07 05:58:05'),
(59, NULL, 31, 1, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-06-28 09:57:59', '2025-06-28 09:57:59'),
(60, NULL, 31, 2, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-06-28 09:57:59', '2025-06-28 09:57:59'),
(61, NULL, 31, 4, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-06-28 09:57:59', '2025-06-28 09:57:59'),
(62, NULL, 31, 5, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-06-28 09:57:59', '2025-06-28 09:57:59'),
(67, 1, NULL, NULL, NULL, 'Only Service Charge', NULL, 300.00, 500.00, NULL, 0.00, 1, 1, '2025-07-20 02:32:13', '2025-07-20 02:32:13'),
(68, NULL, 67, 2, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-07-20 02:32:13', '2025-07-20 02:32:13'),
(69, 1, NULL, NULL, NULL, 'Satelment- P5-11.5K (Pre Medical, Satelment, MOFA, Fit Card)', NULL, 11000.00, 11500.00, NULL, 0.00, 1, 1, '2025-07-20 03:06:46', '2025-07-20 03:06:46'),
(70, NULL, 69, 2, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-07-20 03:06:46', '2025-07-20 03:06:46'),
(77, NULL, 8, 2, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-10-02 07:15:39', '2025-10-02 07:15:39'),
(78, NULL, 8, 4, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-10-02 07:15:39', '2025-10-02 07:15:39'),
(79, NULL, 8, 5, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-10-02 07:15:39', '2025-10-02 07:15:39'),
(80, NULL, 36, 3, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-10-02 07:16:31', '2025-10-02 07:16:31'),
(81, NULL, 54, 2, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-12-07 05:58:05', '2025-12-07 05:58:05'),
(82, NULL, 54, 3, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-12-07 05:58:05', '2025-12-07 05:58:05'),
(83, NULL, 54, 4, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-12-07 05:58:05', '2025-12-07 05:58:05'),
(84, NULL, 54, 5, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-12-07 05:58:05', '2025-12-07 05:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `job_service_records`
--

CREATE TABLE `job_service_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `entry_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `medical_centers` varchar(255) DEFAULT NULL,
  `slip_no` varchar(255) DEFAULT NULL,
  `mofa_no` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes',
  `is_complete` tinyint(4) NOT NULL DEFAULT 0,
  `is_agent_purchased` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=Yes, 0=No',
  `status_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_service_records`
--

INSERT INTO `job_service_records` (`id`, `job_id`, `item_id`, `entry_date`, `expire_date`, `remarks`, `medical_centers`, `slip_no`, `mofa_no`, `is_enabled`, `is_active`, `is_complete`, `is_agent_purchased`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-09-08', '2025-10-03', 'Held-Up REMARKS:Deformity in lt hand small finger ,RBS/FBS:225 SGPT:72 SGOT:67', '2:Center-2:c-2|3:Center-3:c-3|4:Center-4:c-4|5:Center-5:c-5|7:Center-7:c-7', NULL, NULL, 1, 0, 1, 1, 6, '2025-10-02 07:42:47', '2025-10-02 07:50:28'),
(2, 1, 2, '2025-10-02', '2025-10-03', NULL, NULL, NULL, NULL, 1, 0, 1, 1, 10, '2025-10-02 07:42:47', '2025-10-02 07:50:28'),
(3, 1, 3, '2025-10-02', '2025-10-03', NULL, '4:Center-4:c-4', '91309202574576463', NULL, 1, 0, 1, 1, 16, '2025-10-02 07:42:47', '2025-10-02 07:50:28'),
(4, 1, 4, NULL, '2025-11-08', NULL, '4:Center-4:c-4', NULL, NULL, 1, 1, 0, 1, 17, '2025-10-02 07:42:47', '2025-10-02 07:50:28'),
(5, 1, 5, NULL, NULL, NULL, '4:Center-4:c-4', NULL, NULL, 0, 0, 0, 1, 22, '2025-10-02 07:42:47', '2025-10-02 07:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `medical_centers`
--

CREATE TABLE `medical_centers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Inactive, 1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medical_centers`
--

INSERT INTO `medical_centers` (`id`, `parent_id`, `name`, `code`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'SR Medical & Diagnostic Center', 'SRMDC', '2/1 Nova Tower, (1st Floor), Naya Paltan, Dhaka-1000, Bangladesh.', 1, NULL, NULL),
(2, NULL, 'Muscat Medical Center', 'MMC', 'Kakoli Foot-Overbridge, Bonani, Dhaka 1212.', 1, NULL, NULL),
(3, 1, 'Center-1', 'c-1', '', 1, NULL, NULL),
(4, 1, 'Center-2', 'c-2', '', 1, NULL, NULL),
(5, 1, 'EchoLab, Dhaka', 'c-3', '', 1, NULL, '2025-12-09 07:07:35'),
(6, 1, 'Center-4', 'c-4', '', 1, NULL, NULL),
(7, 1, 'Center-5', 'c-5', '', 1, NULL, NULL),
(8, 1, 'Center-6', 'c-6', '', 1, NULL, '2025-12-09 06:54:26'),
(9, 1, 'SR, Dhaka', 'c-7', '', 1, NULL, '2025-12-09 07:05:10'),
(10, 2, 'Center-8', 'c-8', '', 1, NULL, NULL),
(11, 2, 'Center-9', 'c-9', '', 1, NULL, NULL),
(12, 2, 'Center-10', 'c-10', '', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `srln` int(11) NOT NULL DEFAULT 1,
  `menu_name` varchar(255) NOT NULL,
  `navicon` varchar(255) DEFAULT NULL,
  `is_side_menu` tinyint(4) NOT NULL DEFAULT 0,
  `create_route` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `srln`, `menu_name`, `navicon`, `is_side_menu`, `create_route`, `route`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', '<i class=\"nav-icon fas fa-tachometer-alt\"></i>', 1, NULL, 'dashboard.index', 1, '2024-10-25 20:56:54', '2024-10-27 16:37:52'),
(2, 0, 2, 'Settings', '<i class=\"nav-icon fa-solid fa-gear\"></i>', 1, NULL, 'basic-infos.index', 1, '2024-10-25 21:11:38', '2025-04-27 18:24:07'),
(3, 0, 3, 'Admin Manage', '<i class=\"nav-icon fa-solid fa-users-line\"></i>', 1, NULL, NULL, 1, '2024-10-25 21:16:45', '2024-11-03 16:01:46'),
(4, 3, 1, 'Roles', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'roles.create', 'roles.index', 1, '2024-10-25 21:17:46', '2024-10-26 18:44:02'),
(5, 3, 2, 'Admins', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'admins.create', 'admins.index', 1, '2024-10-25 21:34:05', '2024-10-25 23:40:22'),
(6, 4, 1, 'Add', NULL, 0, NULL, 'roles.create', 1, '2024-10-25 21:37:12', '2024-10-26 23:12:43'),
(7, 4, 2, 'Edit', NULL, 0, NULL, 'roles.edit', 1, '2024-10-25 21:37:49', '2024-10-25 21:37:49'),
(8, 4, 3, 'Delete', NULL, 0, NULL, 'roles.destroy', 1, '2024-10-25 21:38:13', '2024-10-25 21:38:13'),
(9, 5, 1, 'Add', NULL, 0, NULL, 'admins.create', 1, '2024-10-25 21:47:35', '2024-10-26 22:57:28'),
(10, 5, 2, 'Edit', NULL, 0, NULL, 'admins.edit', 1, '2024-10-25 21:47:54', '2024-10-26 19:00:26'),
(11, 5, 3, 'Delete', NULL, 0, NULL, 'admins.destroy', 1, '2024-10-25 21:48:07', '2024-10-26 18:51:02'),
(12, 0, 4, 'Frontend Menus', '<i class=\"nav-icon fas fa-wrench\"></i>', 1, 'frontend-menus.create', 'frontend-menus.index', 0, '2024-10-26 22:13:54', '2024-12-16 20:49:59'),
(13, 0, 5, 'Backend Menus', '<i class=\"nav-icon fas fa-clipboard-list\"></i>', 0, 'menus.create', 'menus.index', 1, '2024-10-26 23:17:41', '2025-03-10 16:21:38'),
(15, 29, 1, 'Payment Methods', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'payment-methods.create', 'payment-methods.index', 1, '2024-10-27 00:09:17', '2025-02-19 00:42:44'),
(16, 69, 3, 'Colors', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'colors.create', 'colors.index', 1, '2024-10-27 16:25:23', '2025-02-27 00:00:10'),
(17, 29, 2, 'Accounts', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'accounts.create', 'accounts.index', 1, '2024-10-27 23:21:04', '2025-02-19 00:00:01'),
(21, 19, 1, 'Add', NULL, 0, NULL, 'service-types.create', 1, '2024-10-30 22:28:22', '2024-10-30 22:31:33'),
(23, 19, 3, 'Delete', NULL, 0, NULL, 'service-types.destroy', 1, '2024-10-30 22:29:54', '2024-10-30 22:31:16'),
(24, 16, 1, 'Add', NULL, 0, NULL, 'colors.create', 1, '2024-10-30 22:32:07', '2025-03-10 20:45:06'),
(25, 16, 2, 'Edit', NULL, 0, NULL, 'colors.edit', 1, '2024-10-30 22:32:22', '2025-03-10 20:45:11'),
(29, 0, 6, 'Account Manage', '<i class=\"nav-icon fa fa-credit-card\"></i>', 1, NULL, NULL, 1, '2024-11-02 20:16:54', '2025-05-05 06:08:06'),
(30, 0, 10, 'Service Manage', '<i class=\"nav-icon fa fa-tools\"></i>', 1, NULL, NULL, 0, '2024-11-02 22:01:16', '2025-04-27 20:45:50'),
(33, 2, 1, 'Edit', NULL, 0, NULL, 'basic-infos.edit', 1, '2024-11-08 22:07:19', '2024-11-08 22:07:19'),
(34, 43, 1, 'Branch Manage', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'branches.create', 'branches.index', 1, '2024-12-21 16:37:22', '2025-01-11 23:37:55'),
(35, 69, 5, 'Bike Purchases', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'bike-purchases.create', 'bike-purchases.index', 1, '2024-12-28 22:40:45', '2025-02-27 00:01:16'),
(36, 30, 2, 'Services', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, 'bike-services.create', 'bike-services.index', 1, '2024-12-28 23:01:41', '2025-03-07 18:15:52'),
(37, 20, 1, 'Add', NULL, 0, NULL, 'transfer-requisitions.create', 1, '2024-12-30 00:04:19', '2024-12-30 00:04:19'),
(38, 20, 2, 'Edit', NULL, 0, NULL, 'transfer-requisitions.edit', 1, '2024-12-30 00:04:54', '2024-12-30 00:04:54'),
(39, 20, 3, 'Delete', NULL, 0, NULL, 'transfer-requisitions.destroy', 1, '2024-12-30 00:05:24', '2024-12-30 00:05:24'),
(40, 69, 2, 'Bike Models', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'bike-models.create', 'bike-models.index', 1, '2025-01-03 17:01:10', '2025-02-27 00:00:44'),
(41, 40, 1, 'Add', '<i class=\"nav-icon fas fa-check-circle\"></i>', 0, NULL, 'assets-statuses.create', 1, '2025-01-03 18:21:56', '2025-01-03 18:21:56'),
(42, 36, 1, 'Edit', NULL, 0, NULL, 'transfer-requisitions.edit-incoming', 0, '2025-01-06 00:01:59', '2025-02-26 22:44:36'),
(43, 0, 12, 'Employee Manage', '<i class=\"fas fa-users\"></i>', 1, NULL, NULL, 0, '2025-01-11 23:17:06', '2025-02-18 19:05:07'),
(44, 43, 1, 'Departments', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'departments.create', 'departments.index', 1, '2025-01-11 23:20:43', '2025-01-11 23:22:11'),
(45, 43, 4, 'Employee', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'employees.create', 'employees.index', 1, '2025-01-11 23:37:35', '2025-01-19 06:31:03'),
(46, 184, 6, 'FIT Card Delivery Done', NULL, 0, NULL, NULL, 1, '2025-01-18 20:34:20', '2025-08-04 01:00:05'),
(47, 184, 1, 'Today Medical Completed', NULL, 0, NULL, NULL, 1, '2025-01-18 20:34:37', '2025-08-04 00:57:57'),
(48, 184, 2, 'Waiting For Medical Result', NULL, 0, NULL, NULL, 1, '2025-01-18 20:34:50', '2025-08-04 00:58:25'),
(49, 184, 3, 'Settlement Pending', NULL, 0, NULL, NULL, 1, '2025-01-18 20:35:06', '2025-08-04 00:58:39'),
(50, 184, 4, 'Online On Wafid', NULL, 0, NULL, NULL, 1, '2025-01-18 21:07:13', '2025-08-04 00:58:54'),
(51, 43, 3, 'Designation', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'designations.create', 'designations.index', 1, '2025-01-19 06:29:53', '2025-01-19 06:32:16'),
(52, 0, 13, 'All Reports', '<i class=\"nav-icon fas fa-file-alt\"></i>', 1, NULL, NULL, 1, '2025-01-28 16:26:54', '2025-04-27 18:21:56'),
(56, 52, 4, 'Monthly Expense', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.monthly-expenses', 1, '2025-01-28 16:33:07', '2025-07-14 04:32:47'),
(57, 52, 5, 'Profit Loss Statement', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.profit-loss-statement', 1, '2025-01-28 16:36:00', '2025-05-26 23:48:39'),
(58, 52, 6, 'Accounts Ledger', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.account-ledger', 1, '2025-01-28 16:36:22', '2025-04-15 16:37:51'),
(63, 0, 4, 'Investors', '<i class=\"nav-icon fas fa-user-tie\"></i>', 0, NULL, NULL, 0, '2025-02-18 19:06:17', '2025-04-29 16:55:41'),
(64, 167, 2, 'Investor Transaction', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'investor-transactions.create', 'investor-transactions.index', 1, '2025-02-19 16:28:14', '2025-04-20 19:08:53'),
(65, 64, 1, 'Edit', NULL, 0, NULL, 'investor-transactions.edit', 1, '2025-02-25 17:36:31', '2025-02-25 17:36:31'),
(66, 64, 2, 'Delete', NULL, 0, NULL, 'investor-transactions.destroy', 1, '2025-02-25 17:37:01', '2025-02-25 17:37:01'),
(67, 64, 3, 'Approve', NULL, 0, NULL, 'investor-transactions.approve', 1, '2025-02-25 17:38:40', '2025-02-25 17:38:40'),
(68, 64, 1, 'Add', NULL, 0, NULL, 'investor-transactions.create', 1, '2025-02-25 18:09:30', '2025-02-25 18:09:30'),
(69, 0, 7, 'Bike Manage', '<i class=\"nav-icon fa fa-motorcycle\"></i>', 1, NULL, NULL, 0, '2025-02-26 23:55:21', '2025-04-27 18:20:57'),
(70, 69, 1, 'Brands', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'brands.create', 'brands.index', 1, '2025-02-26 23:59:49', '2025-02-26 23:59:49'),
(71, 29, 3, 'Fund Transfer', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'fundtransfers.create', 'fundtransfers.index', 1, '2025-03-02 21:31:14', '2025-04-20 16:32:15'),
(72, 30, 1, 'Service Category', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'bike-service-categories.create', 'bike-service-categories.index', 1, '2025-03-04 17:33:32', '2025-03-07 18:15:47'),
(73, 69, 7, 'Bike Service Records', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'bike-service-records.create', 'bike-service-records.index', 1, '2025-03-04 21:42:01', '2025-03-08 15:35:59'),
(74, 30, 4, 'Cust Service Records', '<i class=\"far fa-dot-circle nav-icon\"></i>', 0, NULL, NULL, 1, '2025-03-07 18:14:26', '2025-03-10 16:35:03'),
(75, 72, 2, 'Add', NULL, 0, NULL, 'bike-service-categories.create', 1, '2025-03-07 21:30:58', '2025-03-07 21:31:30'),
(76, 72, 2, 'Edit', NULL, 0, NULL, 'bike-service-categories.edit', 1, '2025-03-07 21:32:41', '2025-03-07 21:32:41'),
(77, 36, 1, 'Add', NULL, 0, NULL, 'create-route:- bike-services.create', 1, '2025-03-07 21:34:17', '2025-03-07 21:34:17'),
(78, 36, 2, 'Edit', NULL, 0, NULL, 'bike-services.edit', 1, '2025-03-07 21:34:53', '2025-03-07 21:34:53'),
(79, 73, 1, 'Add', NULL, 0, NULL, 'bike-service-records.create', 1, '2025-03-07 21:35:53', '2025-03-07 21:35:53'),
(80, 73, 2, 'Edit', NULL, 0, NULL, 'bike-service-records.edit', 1, '2025-03-07 21:36:36', '2025-03-07 21:36:36'),
(81, 73, 3, 'Delete', NULL, 0, NULL, 'bike-service-records.destroy', 1, '2025-03-07 21:37:16', '2025-03-07 21:37:16'),
(82, 73, 4, 'Approve', NULL, 0, NULL, 'bike-service-records.approve', 1, '2025-03-07 21:38:04', '2025-03-07 21:38:04'),
(84, 69, 6, 'Bike Sales', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'bike-sales.create', 'bike-sales.index', 1, '2025-03-08 15:36:54', '2025-03-08 15:36:54'),
(85, 69, 8, 'Bike Profit', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'bike-profits.index', 1, '2025-03-09 19:21:36', '2025-03-09 20:23:41'),
(86, 63, 1, 'Edit', NULL, 0, NULL, 'agents.edit', 1, '2025-03-10 20:14:15', '2025-04-27 18:39:18'),
(87, 63, 1, 'Add', NULL, 0, NULL, 'agents.create', 1, '2025-03-10 20:14:52', '2025-04-27 18:38:51'),
(88, 15, 1, 'Add', NULL, 0, NULL, 'payment-methods.create', 1, '2025-03-10 20:15:34', '2025-03-10 20:15:34'),
(89, 15, 2, 'Edit', NULL, 0, NULL, 'payment-methods.edit', 1, '2025-03-10 20:15:51', '2025-03-10 20:15:51'),
(90, 17, 1, 'Add', NULL, 0, NULL, 'accounts.create', 1, '2025-03-10 20:16:27', '2025-03-10 20:16:27'),
(91, 17, 2, 'Edit', NULL, 0, NULL, 'accounts.edit', 1, '2025-03-10 20:16:42', '2025-03-10 20:16:42'),
(92, 70, 1, 'Add', NULL, 0, NULL, 'brands.create', 1, '2025-03-10 20:38:46', '2025-03-10 20:38:46'),
(93, 70, 2, 'Edit', NULL, 0, NULL, 'brands.edit', 1, '2025-03-10 20:38:59', '2025-03-10 20:38:59'),
(94, 40, 2, 'Edit', NULL, 0, NULL, 'bike-models.edit', 1, '2025-03-10 20:41:05', '2025-03-10 20:41:05'),
(95, 35, 1, 'Add', NULL, 0, NULL, 'bike-purchases.create', 1, '2025-03-10 20:46:20', '2025-03-17 16:35:27'),
(96, 35, 2, 'Edit', NULL, 0, NULL, 'bike-purchases.edit', 1, '2025-03-10 20:46:31', '2025-03-17 16:35:31'),
(97, 35, 3, 'Delete', NULL, 0, NULL, 'bike-purchases.destroy', 1, '2025-03-10 20:47:19', '2025-03-17 16:35:35'),
(98, 35, 4, 'Approve', NULL, 0, NULL, 'bike-purchases.approve', 1, '2025-03-10 20:48:25', '2025-03-17 16:35:39'),
(99, 84, 1, 'Add', NULL, 0, NULL, 'bike-sales.create', 1, '2025-03-10 20:49:28', '2025-03-10 20:49:28'),
(100, 84, 2, 'Edit', NULL, 0, NULL, 'bike-sales.edit', 1, '2025-03-10 20:49:39', '2025-03-10 20:49:39'),
(101, 84, 3, 'Delete', NULL, 0, NULL, 'bike-sales.destroy', 1, '2025-03-10 20:49:56', '2025-03-10 20:49:56'),
(102, 84, 4, 'Approve', NULL, 0, NULL, 'bike-sales.approve', 1, '2025-03-10 20:50:23', '2025-03-10 20:50:23'),
(103, 85, 1, 'Edit', NULL, 0, NULL, 'bike-profits.edit', 1, '2025-03-10 20:51:17', '2025-03-10 20:51:17'),
(104, 85, 2, 'Close', NULL, 0, NULL, 'bike-profits.change-status', 1, '2025-03-10 20:51:37', '2025-03-14 08:05:47'),
(105, 0, 10, 'Expense Manage', '<i class=\"nav-icon fa-solid fa-money-bill-wave\"></i>', 1, NULL, NULL, 1, '2025-03-11 15:50:17', '2025-05-29 04:27:37'),
(106, 105, 1, 'Category', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'expense-categories.create', 'expense-categories.index', 1, '2025-03-11 15:50:17', '2025-03-11 16:32:03'),
(107, 106, 1, 'Add', NULL, 0, 'expense-categories.create', 'expense-categories.create', 1, '2025-03-11 16:32:22', '2025-03-11 16:33:55'),
(108, 106, 2, 'Edit', NULL, 0, NULL, 'expense-categories.edit', 1, '2025-03-11 16:33:32', '2025-03-11 16:33:32'),
(109, 105, 1, 'Expense Heads', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'expense-heads.create', 'expense-heads.index', 1, '2025-03-11 17:14:34', '2025-03-11 17:14:34'),
(110, 105, 3, 'Expenses', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'expenses.create', 'expenses.index', 1, '2025-03-11 18:35:41', '2025-03-11 18:35:41'),
(111, 109, 1, 'Add', NULL, 0, NULL, 'expense-heads.create', 1, '2025-03-11 18:36:37', '2025-03-11 18:36:37'),
(112, 109, 2, 'Edit', NULL, 0, NULL, 'expense-heads.edit', 1, '2025-03-11 18:36:58', '2025-03-11 18:36:58'),
(113, 110, 1, 'Add', NULL, 0, NULL, 'expenses.create', 1, '2025-03-11 18:38:33', '2025-03-11 18:38:33'),
(114, 110, 2, 'Edit', NULL, 0, NULL, 'expenses.edit', 1, '2025-03-11 18:38:50', '2025-03-11 18:38:50'),
(115, 110, 3, 'Delete', NULL, 0, NULL, 'expenses.destroy', 1, '2025-03-11 18:39:22', '2025-03-11 18:39:22'),
(116, 110, 4, 'Approve', NULL, 0, NULL, 'expenses.approve', 1, '2025-03-11 18:39:54', '2025-03-11 18:39:54'),
(117, 73, 5, 'View', NULL, 0, NULL, 'bike-service-records.view', 1, '2025-03-11 21:21:49', '2025-03-19 20:05:57'),
(118, 110, 5, 'View', NULL, 0, NULL, 'expenses.view', 1, '2025-03-11 21:53:02', '2025-03-11 21:53:02'),
(119, 85, 3, 'View Records', NULL, 0, NULL, 'bike-profits.share-records', 1, '2025-03-14 08:06:39', '2025-03-14 08:06:39'),
(120, 119, 1, 'Edit', NULL, 0, NULL, 'bike-profits.share-records.edit', 1, '2025-03-14 08:08:04', '2025-03-14 08:08:04'),
(121, 119, 2, 'Delete', NULL, 0, NULL, 'bike-profits.share-records.destroy', 1, '2025-03-14 08:08:50', '2025-03-14 08:10:43'),
(122, 119, 3, 'Approve', NULL, 0, NULL, 'bike-profits.share-records.approve', 1, '2025-03-14 08:09:29', '2025-03-14 08:09:29'),
(123, 119, 0, 'Create', NULL, 0, NULL, 'bike-profits.share-records.create', 1, '2025-03-14 08:11:31', '2025-03-14 08:11:50'),
(124, 130, 1, 'Setup', '<i class=\"fa-solid fa-users-gear nav-icon\"></i>', 1, NULL, NULL, 1, '2025-03-14 16:25:16', '2025-03-16 15:32:06'),
(125, 124, 1, 'Category', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'categories.create', 'categories.index', 1, '2025-03-14 16:26:40', '2025-03-14 16:37:43'),
(126, 124, 2, 'Sub Category', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'sub-categories.create', 'sub-categories.index', 1, '2025-03-14 16:39:29', '2025-03-14 16:39:29'),
(127, 0, 6, 'Service Items', '<i class=\"nav-icon fas fa-stethoscope\"></i>', 1, 'items.create', 'items.index', 1, '2025-03-14 16:58:29', '2025-04-27 20:59:51'),
(128, 124, 4, 'Suppliers', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'suppliers.create', 'suppliers.index', 1, '2025-03-15 06:51:51', '2025-03-16 15:49:08'),
(129, 130, 4, 'Supplier Payments', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'payments.create', 'payments.index', 1, '2025-03-15 07:14:30', '2025-03-22 21:39:42'),
(130, 0, 11, 'Inventory Manage', '<i class=\"nav-icon fas fa-warehouse\"></i>', 1, NULL, NULL, 0, '2025-03-15 07:22:44', '2025-04-27 20:44:48'),
(131, 130, 2, 'Purchase', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'purchases.create', 'purchases.index', 1, '2025-03-15 21:00:54', '2025-03-22 21:38:41'),
(132, 84, 5, 'View', '<i class=\"far fa-dot-circle nav-icon\"></i>', 0, NULL, 'bike-service-records.invoice', 1, '2025-03-19 20:04:27', '2025-03-19 20:04:27'),
(133, 73, 6, 'Print', NULL, 0, NULL, 'bike-service-records.invoice.print', 1, '2025-03-19 20:05:40', '2025-03-19 20:06:27'),
(134, 35, 5, 'View', NULL, 0, NULL, 'bike-purchases.invoice', 1, '2025-03-19 21:05:09', '2025-03-19 21:05:09'),
(135, 35, 6, 'Print', NULL, 0, NULL, 'bike-purchases.invoice.print', 1, '2025-03-19 21:05:32', '2025-03-19 21:05:32'),
(136, 0, 5, 'Agent', '<i class=\"nav-icon fas fa-user-tie\"></i>', 1, 'customers.create', 'customers.index', 1, '2025-03-22 07:17:08', '2025-04-29 16:56:08'),
(137, 0, 6, 'Jobs', '<i class=\"fa fa-tasks nav-icon\"></i>', 1, 'sales.create', 'sales.index', 1, '2025-03-22 08:31:30', '2025-04-28 17:03:09'),
(138, 0, 8, 'Agent Payments', '<i class=\"nav-icon fas fa-hand-holding-usd\"></i>', 1, 'customer-payments.create', 'customer-payments.index', 1, '2025-03-22 20:47:00', '2025-05-24 20:56:34'),
(139, 0, 12, 'Loan Manage', '<i class=\"nav-icon fas fa-hand-holding-usd\"></i>', 1, NULL, NULL, 0, '2025-04-08 17:37:41', '2025-04-27 18:21:48'),
(140, 139, 1, 'Party Manage', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'parties.create', 'parties.index', 1, '2025-04-08 17:39:23', '2025-04-08 17:39:23'),
(141, 139, 2, 'Loans', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, 'loans.create', 'loans.index', 1, '2025-04-09 16:25:30', '2025-04-09 16:25:41'),
(142, 139, 3, 'Party Payments', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'party-payments.index', 1, '2025-04-10 06:01:23', '2025-04-10 06:03:56'),
(143, 141, 1, 'Add', NULL, 0, NULL, 'loans.create', 1, '2025-04-11 05:13:03', '2025-04-11 05:13:03'),
(144, 141, 2, 'Edit', NULL, 0, NULL, 'loans.edit', 1, '2025-04-11 05:15:09', '2025-04-11 05:15:09'),
(145, 141, 3, 'Delete', NULL, 0, NULL, 'loans.destroy', 1, '2025-04-11 05:15:28', '2025-04-11 05:15:28'),
(146, 141, 4, 'Approve', NULL, 0, NULL, 'loans.approve', 1, '2025-04-11 05:16:04', '2025-04-11 05:16:04'),
(147, 141, 5, 'View', NULL, 0, NULL, 'loans.invoice', 1, '2025-04-11 05:17:32', '2025-04-11 05:17:32'),
(148, 141, 6, 'Print', NULL, 0, NULL, 'loans.invoice.print', 1, '2025-04-11 05:17:58', '2025-04-11 05:17:58'),
(149, 131, 1, 'Add', NULL, 0, NULL, 'purchases.create', 1, '2025-04-12 19:08:40', '2025-04-12 19:08:40'),
(150, 131, 2, 'Edit', NULL, 0, NULL, 'purchases.edit', 1, '2025-04-12 19:09:15', '2025-04-12 19:09:15'),
(151, 131, 3, 'Delete', NULL, 0, NULL, 'purchases.destroy', 1, '2025-04-12 19:09:32', '2025-04-12 19:09:32'),
(152, 131, 5, 'View', NULL, 0, NULL, 'purchases.vouchar', 1, '2025-04-12 19:11:25', '2025-04-12 19:11:25'),
(153, 131, 6, 'Print', NULL, 0, NULL, 'purchases.vouchar.print', 1, '2025-04-12 19:11:48', '2025-04-12 19:11:48'),
(154, 131, 4, 'Add Payment', NULL, 0, NULL, 'purchases.payment.store', 1, '2025-04-12 19:12:31', '2025-04-12 19:13:29'),
(155, 137, 1, 'Add', NULL, 0, NULL, 'sales.create', 1, '2025-04-12 20:50:15', '2025-04-12 20:50:15'),
(156, 137, 2, 'Edit', NULL, 0, NULL, 'sales.edit', 1, '2025-04-12 20:50:37', '2025-04-12 20:50:37'),
(157, 137, 3, 'Delete', NULL, 0, NULL, 'sales.destroy', 1, '2025-04-12 20:50:52', '2025-04-12 20:50:52'),
(158, 137, 4, 'Approve', NULL, 0, NULL, 'sales.approve', 1, '2025-04-12 20:51:25', '2025-04-12 20:51:25'),
(159, 137, 5, 'View', NULL, 0, NULL, 'sales.invoice', 1, '2025-04-12 20:52:47', '2025-04-12 20:52:47'),
(160, 137, 6, 'Print', NULL, 0, NULL, 'sales.invoice.print', 1, '2025-04-12 20:53:16', '2025-04-12 20:53:16'),
(161, 137, 7, 'Payment', NULL, 0, NULL, 'sales.payment.store', 1, '2025-04-12 20:53:58', '2025-04-12 20:53:58'),
(162, 35, 8, 'Repurchase', NULL, 0, NULL, 'bike-purchases.repurchase', 1, '2025-04-19 17:24:13', '2025-04-19 17:24:13'),
(163, 71, 1, 'Add', NULL, 0, NULL, 'fundtransfers.create', 1, '2025-04-20 18:57:36', '2025-04-20 18:57:36'),
(164, 71, 2, 'Edit', NULL, 0, NULL, 'fundtransfers.edit', 1, '2025-04-20 18:57:55', '2025-04-20 18:57:55'),
(165, 71, 3, 'Delete', NULL, 0, NULL, 'fundtransfers.destroy', 1, '2025-04-20 18:58:14', '2025-04-20 18:58:14'),
(166, 71, 4, 'Approve', NULL, 0, NULL, 'fundtransfers.approve', 1, '2025-04-20 18:58:30', '2025-04-20 18:58:30'),
(167, 0, 5, 'Investor Manage', '<i class=\"nav-icon fas fa-user-tie\"></i>', 1, NULL, NULL, 0, '2025-04-20 19:05:14', '2025-04-27 18:38:05'),
(168, 184, 5, 'FIT Card Ready', NULL, 0, NULL, NULL, 1, '2025-04-21 22:22:35', '2025-08-04 00:59:15'),
(169, 182, 5, 'Total Cancelled Job', NULL, 0, NULL, NULL, 1, '2025-04-21 22:22:53', '2025-06-25 16:22:39'),
(170, 182, 1, 'Total Pending Job', NULL, 0, NULL, NULL, 1, '2025-04-21 22:23:13', '2025-06-25 16:21:34'),
(171, 182, 2, 'Total Procesing Job', NULL, 0, NULL, NULL, 1, '2025-04-21 22:23:49', '2025-06-25 16:21:53'),
(172, 182, 3, 'Total Refunded Job', NULL, 0, NULL, NULL, 1, '2025-04-21 22:24:04', '2025-06-25 16:22:15'),
(173, 183, 1, 'Requested For Settlement', NULL, 0, NULL, NULL, 1, '2025-04-21 22:24:26', '2025-06-25 16:25:51'),
(174, 183, 2, 'Requested For Slip', NULL, 0, NULL, NULL, 1, '2025-04-21 22:24:47', '2025-06-25 16:26:11'),
(175, 183, 3, 'Requested For MOFA', NULL, 0, NULL, NULL, 1, '2025-04-21 22:25:10', '2025-06-25 16:26:22'),
(176, 52, 5, 'Accounts Reports', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'reports.accounts-reports', 1, '2025-04-22 15:17:35', '2025-04-22 15:17:35'),
(178, 182, 4, 'Total Completed Job', NULL, 0, NULL, NULL, 1, '2025-04-22 22:50:23', '2025-06-25 16:22:28'),
(180, 183, 4, 'Requested For Fit Card', NULL, 0, NULL, NULL, 1, '2025-04-22 22:56:04', '2025-06-25 16:26:35'),
(182, 1, 1, 'Job Status', NULL, 0, NULL, NULL, 1, '2025-04-22 22:58:23', '2025-06-25 16:20:49'),
(183, 1, 2, 'All Request', NULL, 0, NULL, NULL, 1, '2025-04-22 23:00:28', '2025-06-25 16:25:11'),
(184, 1, 3, 'Others Service Status', NULL, 0, NULL, NULL, 1, '2025-04-22 23:01:24', '2025-08-04 00:57:16'),
(185, 137, 8, 'Add New Item', NULL, 0, NULL, 'sales.add-new-item', 1, '2025-05-24 05:19:20', '2025-05-24 05:19:20'),
(186, 137, 9, 'Service Status Update', NULL, 0, NULL, 'sales.service-edit', 1, '2025-05-24 05:22:40', '2025-05-24 05:22:40'),
(188, 137, 10, 'Pre-Medical Token', NULL, 0, NULL, 'sales.token.print', 1, '2025-06-18 23:22:25', '2025-06-18 23:22:25'),
(189, 52, 7, 'Settlement Report', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'reports.settlement', 1, '2025-07-14 04:35:01', '2025-07-14 04:39:08'),
(190, 52, 8, 'Agent Ledger', '<i class=\"far fa-dot-circle nav-icon\"></i>', 1, NULL, 'reports.agent-ledgers', 1, '2025-08-11 03:34:10', '2025-08-11 03:34:10'),
(191, 0, 7, 'Medical Centers', '<i class=\"fa fa-hospital nav-icon\"></i>', 1, 'medical-centers.create', 'medical-centers.index', 1, '2025-12-08 22:00:09', '2025-12-08 22:00:09');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
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
(25, '2024_06_25_122016_create_expense_categories_table', 25),
(26, '2024_02_25_120043_create_expense_heads_table', 26),
(27, '2024_02_25_122743_create_expenses_table', 27),
(28, '2024_02_25_123102_create_expense_details_table', 28),
(31, '2023_12_13_144516_create_categories_table', 31),
(32, '2024_04_22_164354_create_category_types_table', 32),
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
(53, '2025_04_21_094759_create_fund_transfer_histories_table', 53),
(144, '2025_03_23_005302_create_customers_table', 58),
(146, '2025_03_23_010022_create_sales_table', 59),
(149, '2025_03_23_010039_create_sale_details_table', 60),
(153, '2025_05_04_123429_create_medical_centers_table', 62),
(154, '2025_04_30_171205_create_job_service_records_table', 63),
(155, '2023_12_26_170202_create_items_table', 64),
(156, '2025_05_04_103031_create_status_lists_table', 65),
(157, '2024_04_21_174416_create_purchases_table', 66),
(158, '2025_02_20_100226_create_investor_transactions_table', 66),
(159, '2025_06_19_124508_add_medical_column_to_job', 66),
(160, '2025_06_19_125154_add_medical_type_to_medical_centers', 66),
(161, '2025_06_19_165534_add_agent_code_to_customer_table', 66),
(162, '2025_08_04_150402_add_is_active_to_job_service_records_table', 67),
(163, '2025_12_09_101255_add_field_name_to_medical_centers_table', 68);

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

CREATE TABLE `parties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `nid_number` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `current_balance` double(20,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `party_ledgers`
--

CREATE TABLE `party_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `party_id` int(11) NOT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `loan_type` tinyint(4) NOT NULL COMMENT '0 = loan_given, 1 = loan_taken',
  `payment_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `particular` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL,
  `credit_amount` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `party_loans`
--

CREATE TABLE `party_loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `party_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `loan_no` varchar(255) NOT NULL,
  `loan_type` tinyint(4) NOT NULL COMMENT '0 = loan_given, 1 = loan_taken',
  `amount` double(20,2) NOT NULL,
  `loan_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `last_payment_date` date DEFAULT NULL,
  `paid_amount` double(20,2) NOT NULL DEFAULT 0.00,
  `reference_number` varchar(255) DEFAULT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = pending, -1 = partial, 1 = paid',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Approved',
  `note` text DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `party_payments`
--

CREATE TABLE `party_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `party_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `payment_type` tinyint(4) NOT NULL COMMENT '0=paid to party, 1=collection from party',
  `loan_id` bigint(20) DEFAULT NULL,
  `date` date NOT NULL,
  `amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Approved',
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_virtual` int(11) NOT NULL DEFAULT 0 COMMENT '0=not virtual, 1=virtual',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active, 0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `is_virtual`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 0, 1, NULL, NULL),
(2, 'Investment Capital', 1, 1, NULL, NULL),
(3, 'Bkash', 0, 1, '2025-06-28 17:35:58', '2025-06-28 17:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
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
(128, 4, 1, '2025-06-21 15:54:06', '2025-06-21 15:54:06'),
(138, 1, 1, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(139, 1, 2, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(140, 1, 33, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(141, 1, 3, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(142, 1, 4, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(143, 1, 6, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(144, 1, 7, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(145, 1, 8, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(146, 1, 5, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(147, 1, 9, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(148, 1, 10, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(149, 1, 11, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(150, 1, 13, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(151, 1, 136, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(152, 1, 29, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(153, 1, 15, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(154, 1, 88, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(155, 1, 89, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(156, 1, 17, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(157, 1, 90, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(158, 1, 91, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(159, 1, 71, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(160, 1, 163, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(161, 1, 164, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(162, 1, 165, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(163, 1, 166, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(164, 1, 127, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(165, 1, 137, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(166, 1, 155, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(167, 1, 156, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(168, 1, 157, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(169, 1, 158, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(170, 1, 159, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(171, 1, 160, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(172, 1, 161, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(173, 1, 185, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(174, 1, 186, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(175, 1, 188, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(176, 1, 138, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(177, 1, 105, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(178, 1, 106, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(179, 1, 107, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(180, 1, 108, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(181, 1, 109, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(182, 1, 111, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(183, 1, 112, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(184, 1, 110, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(185, 1, 113, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(186, 1, 114, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(187, 1, 115, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(188, 1, 116, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(189, 1, 118, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(190, 1, 52, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(191, 1, 57, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(192, 1, 176, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(193, 1, 58, '2025-06-26 14:34:21', '2025-06-26 14:34:21'),
(285, 3, 1, '2025-07-05 11:31:51', '2025-07-05 11:31:51'),
(286, 3, 137, '2025-07-05 11:31:51', '2025-07-05 11:31:51'),
(287, 3, 155, '2025-07-05 11:31:51', '2025-07-05 11:31:51'),
(288, 3, 158, '2025-07-05 11:31:51', '2025-07-05 11:31:51'),
(289, 3, 159, '2025-07-05 11:31:51', '2025-07-05 11:31:51'),
(290, 3, 160, '2025-07-05 11:31:51', '2025-07-05 11:31:51'),
(291, 3, 186, '2025-07-05 11:31:51', '2025-07-05 11:31:51'),
(292, 3, 188, '2025-07-05 11:31:51', '2025-07-05 11:31:51'),
(379, 2, 1, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(380, 2, 182, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(381, 2, 170, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(382, 2, 171, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(383, 2, 172, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(384, 2, 178, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(385, 2, 169, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(386, 2, 183, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(387, 2, 173, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(388, 2, 174, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(389, 2, 175, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(390, 2, 180, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(391, 2, 137, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(392, 2, 155, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(393, 2, 159, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(394, 2, 160, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(395, 2, 186, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(396, 2, 188, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(397, 2, 52, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(398, 2, 190, '2025-08-12 03:39:19', '2025-08-12 03:39:19'),
(399, 5, 1, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(400, 5, 182, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(401, 5, 170, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(402, 5, 171, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(403, 5, 172, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(404, 5, 178, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(405, 5, 169, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(406, 5, 183, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(407, 5, 173, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(408, 5, 174, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(409, 5, 175, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(410, 5, 180, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(411, 5, 137, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(412, 5, 159, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(413, 5, 52, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(414, 5, 56, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(415, 5, 57, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(416, 5, 176, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(417, 5, 58, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(418, 5, 189, '2025-09-04 12:31:02', '2025-09-04 12:31:02'),
(419, 5, 190, '2025-09-04 12:31:02', '2025-09-04 12:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `vouchar_no` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `total_price` double(20,2) NOT NULL,
  `vat_tax` double(20,2) DEFAULT 0.00,
  `discount_method` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Percentage, 1=Solid',
  `discount_rate` double(20,2) NOT NULL,
  `discount` double(20,2) NOT NULL,
  `total_payable` double(20,2) NOT NULL,
  `paid_amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '1',
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_superadmin` tinyint(4) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `is_default` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `is_superadmin`, `created_by`, `role`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Super Admin', 1, NULL, NULL),
(2, 0, 1, 'Agent', 1, NULL, NULL),
(3, 0, 1, 'Manager', 0, '2025-05-27 15:34:26', '2025-05-27 15:34:26'),
(4, 0, 1, 'HR', 0, '2025-06-21 15:54:06', '2025-06-21 15:54:06'),
(5, 0, 1, 'Rehan_Faiza', 0, '2025-07-05 11:04:12', '2025-07-05 11:04:12');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `medical_id` bigint(20) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `passenger_name` varchar(255) NOT NULL,
  `passenger_passport_no` varchar(255) NOT NULL,
  `passport_img` varchar(255) DEFAULT NULL,
  `localhost_no` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `total_price` double(20,2) NOT NULL,
  `vat_tax` double(20,2) DEFAULT 0.00,
  `discount_method` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Percentage, 1=Solid',
  `discount_rate` double(20,2) NOT NULL,
  `discount` double(20,2) NOT NULL,
  `total_payable` double(20,2) NOT NULL,
  `paid_amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `payment_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = pending, -1 = partial, 1 = paid',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Processing, 2=Complete, 3=Refunded, 4=Cancelled',
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `country_id`, `customer_id`, `medical_id`, `account_id`, `passenger_name`, `passenger_passport_no`, `passport_img`, `localhost_no`, `invoice_no`, `date`, `total_price`, `vat_tax`, `discount_method`, `discount_rate`, `discount`, `total_payable`, `paid_amount`, `reference_number`, `note`, `payment_status`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 191, 23, 1, NULL, 'Md Rubel Khan', 'A08764145', NULL, 'SRD09469703', '0000001', '2025-09-08', 1000.00, 0.00, 0, 0.00, 0.00, 1000.00, 0.00, NULL, NULL, 0, 1, 1, 1, '2025-10-02 07:42:47', '2025-10-02 07:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `unit_price` double(20,2) NOT NULL,
  `purchase_price` double(20,2) DEFAULT NULL,
  `profit` double(20,2) DEFAULT NULL,
  `net_sale_price` double(20,2) DEFAULT NULL,
  `net_profit` double(20,2) DEFAULT NULL,
  `is_service_generated` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=No, 1=Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_details`
--

INSERT INTO `sale_details` (`id`, `sale_id`, `item_id`, `date`, `unit_price`, `purchase_price`, `profit`, `net_sale_price`, `net_profit`, `is_service_generated`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-09-08', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-10-02 07:42:47', '2025-10-02 07:42:54'),
(2, 1, 8, '2025-09-08', 1000.00, 500.00, 500.00, 1000.00, 500.00, 0, '2025-10-02 07:46:03', '2025-10-02 07:46:03'),
(3, 1, 6, '2025-09-08', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-10-02 07:48:13', '2025-10-02 07:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `status_lists`
--

CREATE TABLE `status_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `srl` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `name_for_agent` varchar(255) DEFAULT NULL,
  `color_code` varchar(255) NOT NULL,
  `status_state` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Initial State, 1=Middle State, 2=Final State',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Inactive, 1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_lists`
--

INSERT INTO `status_lists` (`id`, `item_id`, `srl`, `name`, `name_for_agent`, `color_code`, `status_state`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Pending', NULL, '#dc3545', 0, 1, NULL, NULL),
(2, 1, 2, 'Medical Completed', NULL, '#17a2b8', 1, 1, NULL, NULL),
(3, 1, 3, 'Waiting For Medical Result', NULL, '#17a2b8', 1, 1, NULL, NULL),
(4, 1, 4, 'Unfit & Processing For Refund', NULL, '#17a2b8', 1, 1, NULL, NULL),
(5, 1, 6, 'Refund Completed', NULL, '#212529', 2, 1, NULL, NULL),
(6, 1, 7, 'Result Published', NULL, '#28a745', 2, 1, NULL, NULL),
(7, 2, 1, 'Pending', NULL, '#dc3545', 0, 1, NULL, NULL),
(8, 2, 2, 'Requested For Settlement', 'Request For Settlement', '#b8860b', 1, 1, NULL, NULL),
(9, 2, 3, 'Settlement Processing', NULL, '#17a2b8', 1, 1, NULL, NULL),
(10, 2, 4, 'Settlement Completed', NULL, '#28a745', 2, 1, NULL, NULL),
(11, 3, 1, 'Pending', NULL, '#dc3545', 0, 1, NULL, NULL),
(12, 3, 2, 'Requested For Slip', 'Request For Slip', '#b8860b', 1, 1, NULL, NULL),
(13, 3, 3, 'Processing', NULL, '#17a2b8', 1, 1, NULL, NULL),
(14, 3, 4, 'Slip Received', NULL, '#17a2b8', 1, 1, NULL, NULL),
(15, 3, 5, 'Slip Submission Done', NULL, '#17a2b8', 1, 1, NULL, NULL),
(16, 3, 6, 'Online Fit On WAFID', NULL, '#28a745', 2, 1, NULL, NULL),
(17, 4, 1, 'Pending', NULL, '#dc3545', 0, 1, NULL, NULL),
(18, 4, 2, 'Requested For MOFA', 'Request For MOFA', '#b8860b', 1, 1, NULL, NULL),
(19, 4, 3, 'MOFA Received', NULL, '#17a2b8', 1, 1, NULL, NULL),
(20, 4, 4, 'MOFA Processing', NULL, '#17a2b8', 1, 1, NULL, NULL),
(21, 4, 5, 'MOFA Updated On Visa Platform', NULL, '#28a745', 2, 1, NULL, NULL),
(22, 5, 1, 'Pending', NULL, '#dc3545', 0, 1, NULL, NULL),
(23, 5, 2, 'Requested For Fit Card', 'Request For Fit Card', '#b8860b', 1, 1, NULL, NULL),
(24, 5, 3, 'Fit Card Processing', NULL, '#17a2b8', 1, 1, NULL, NULL),
(25, 5, 4, 'Fit Card Ready For Delivery', NULL, '#17a2b8', 1, 1, NULL, NULL),
(26, 5, 5, 'Delivery Done', NULL, '#28a745', 2, 1, NULL, NULL),
(27, 1, 5, 'Refund Received', NULL, '#17a2b8', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `opening_payable` double(20,2) NOT NULL DEFAULT 0.00,
  `opening_receivable` double(20,2) NOT NULL DEFAULT 0.00,
  `current_balance` double(20,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ledgers`
--

CREATE TABLE `supplier_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `particular` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL,
  `credit_amount` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_payments`
--

CREATE TABLE `supplier_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `purchase_id` bigint(20) DEFAULT NULL,
  `date` date NOT NULL,
  `amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Approved',
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `phone` varchar(30) NOT NULL,
  `default_address` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
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
-- Indexes for table `basic_infos`
--
ALTER TABLE `basic_infos`
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
-- Indexes for table `job_service_records`
--
ALTER TABLE `job_service_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_centers`
--
ALTER TABLE `medical_centers`
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

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
-- Indexes for table `status_lists`
--
ALTER TABLE `status_lists`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `basic_infos`
--
ALTER TABLE `basic_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `category_types`
--
ALTER TABLE `category_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `customer_ledgers`
--
ALTER TABLE `customer_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_payments`
--
ALTER TABLE `customer_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expense_details`
--
ALTER TABLE `expense_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_heads`
--
ALTER TABLE `expense_heads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontend_menus`
--
ALTER TABLE `frontend_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fund_transfer_histories`
--
ALTER TABLE `fund_transfer_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `investor_transactions`
--
ALTER TABLE `investor_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `job_service_records`
--
ALTER TABLE `job_service_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medical_centers`
--
ALTER TABLE `medical_centers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `parties`
--
ALTER TABLE `parties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `party_ledgers`
--
ALTER TABLE `party_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `party_loans`
--
ALTER TABLE `party_loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `party_payments`
--
ALTER TABLE `party_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=420;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status_lists`
--
ALTER TABLE `status_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_ledgers`
--
ALTER TABLE `supplier_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_payments`
--
ALTER TABLE `supplier_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
