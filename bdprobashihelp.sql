-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 19, 2025 at 11:38 AM
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
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, 1, 'Hand Cash', 'Self', '48000.00', 1, 1, 1, NULL, '2025-06-18 12:25:18'),
(2, 2, 'Investment Capital', 'Self', '0.00', 1, 1, NULL, NULL, NULL);

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
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `transaction_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_ledgers`
--

INSERT INTO `account_ledgers` (`id`, `account_id`, `debit_amount`, `credit_amount`, `current_balance`, `reference_number`, `description`, `transaction_date`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 7000.00, 7000.00, NULL, 'Sale Payment', '2025-05-22', '2025-05-27 07:35:11', '2025-05-27 07:35:11'),
(2, 1, NULL, 5000.00, 12000.00, NULL, 'Sale Payment', '2025-05-27', '2025-05-27 07:47:36', '2025-05-27 07:47:36'),
(3, 1, NULL, 7000.00, 19000.00, NULL, 'Sale Payment', '2025-05-22', '2025-05-27 07:50:44', '2025-05-27 07:50:44'),
(4, 1, NULL, 1000.00, 20000.00, NULL, 'Sale Payment', '2025-05-27', '2025-05-27 07:52:29', '2025-05-27 07:52:29'),
(5, 1, NULL, 2000.00, 22000.00, NULL, 'Sale Payment', '2025-05-28', '2025-05-27 18:20:37', '2025-05-27 18:20:37'),
(6, 1, 14000.00, NULL, 8000.00, NULL, 'Expenses', '2025-05-22', '2025-05-29 19:26:22', '2025-05-29 19:26:22'),
(7, 1, NULL, 6500.00, 14500.00, NULL, 'Sale Payment', '2025-05-29', '2025-06-09 11:59:47', '2025-06-09 11:59:47'),
(8, 1, NULL, 2000.00, 16500.00, NULL, 'Sale Payment', '2025-05-20', '2025-06-09 12:13:09', '2025-06-09 12:13:09'),
(9, 1, NULL, 2000.00, 18500.00, NULL, 'Sale Payment', '2025-05-29', '2025-06-09 12:24:45', '2025-06-09 12:24:45'),
(10, 1, NULL, 2000.00, 20500.00, NULL, 'Sale Payment', '2025-06-09', '2025-06-09 12:40:45', '2025-06-09 12:40:45'),
(11, 1, NULL, 2000.00, 22500.00, NULL, 'Sale Payment', '2025-06-01', '2025-06-09 12:55:53', '2025-06-09 12:55:53'),
(12, 1, NULL, 2000.00, 24500.00, NULL, 'Sale Payment', '2025-06-01', '2025-06-09 13:09:06', '2025-06-09 13:09:06'),
(13, 1, NULL, 2000.00, 26500.00, NULL, 'Sale Payment', '2025-06-01', '2025-06-09 13:17:19', '2025-06-09 13:17:19'),
(14, 1, 10000.00, NULL, 16500.00, NULL, 'Expenses', '2025-06-04', '2025-06-13 17:48:16', '2025-06-13 17:48:16'),
(15, 1, NULL, 2000.00, 18500.00, NULL, 'Sale Payment', '2025-05-01', '2025-06-15 11:38:02', '2025-06-15 11:38:02'),
(16, 1, NULL, 7000.00, 25500.00, NULL, 'Sale Payment', '2025-06-17', '2025-06-17 06:14:56', '2025-06-17 06:14:56'),
(17, 1, NULL, 7000.00, 32500.00, NULL, 'Sale Payment', '2025-06-17', '2025-06-17 06:29:29', '2025-06-17 06:29:29'),
(18, 1, NULL, 2000.00, 34500.00, NULL, 'Sale Payment', '2025-06-18', '2025-06-18 08:50:37', '2025-06-18 08:50:37'),
(19, 1, NULL, 2500.00, 37000.00, NULL, 'Sale Payment', '2025-06-18', '2025-06-18 09:23:59', '2025-06-18 09:23:59'),
(20, 1, NULL, 7000.00, 44000.00, NULL, 'Sale Payment', '2025-06-18', '2025-06-18 11:08:46', '2025-06-18 11:08:46'),
(21, 1, NULL, 4000.00, 48000.00, NULL, 'Sale Payment', '2025-06-18', '2025-06-18 12:25:18', '2025-06-18 12:25:18');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `agent_id` int DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `agent_id`, `name`, `username`, `type`, `mobile`, `email`, `password`, `image`, `status`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, NULL, 'Super Admin', NULL, 1, '01717171223', 'admin@gmail.com', '$2y$10$72mM6bhPWEoFlgJKq1WaueJN1g7vMISry0HMa1c5THjRYa7HTISV2', 'admin-1750138827.png', 1, '2024-08-30 19:03:44', '2025-06-17 05:40:27', 'JWM7qTWEFbvlGharTZSHnE2KH7DSy9C1Hu1bmlSSQrzYCnLEki04qxnr315l'),
(2, 1, 'Jannat-AAI', NULL, 2, '8801893291015', 'jannati-aai@gmail.com', '$2y$10$n7vaM10g4JadX7tp1e97wucWWexL4h8rDJpGUJkVHnDGesKL9MzVm', NULL, 1, '2025-05-27 07:30:04', '2025-05-27 07:32:44', NULL),
(3, 2, 'Emam Hossain-AEHB', NULL, 2, '8801712556088', 'imamair2021@gmail.com', '$2y$10$p4UBo7Qz9ZraZ0ZGNfLGueF9fiF8o9HxdyFLRq561YYXd/Q3Nnzpa', NULL, 1, '2025-05-27 18:12:01', '2025-05-27 18:12:58', 'lUjW2YYTOp6Iaj4x6YZn0FtKXpMgV47qG4saMR7s5dIdyxGAIBpRNVkZ8dM3'),
(4, 3, 'SUHEL AHMED/SAAS', NULL, 2, '01736621425', 'saairservicekanaighat@gmail.com', '$2y$10$lPynkjtMdjZMQdy2hqI2JOADLS9JcV.bGEakiGTFKsR/ORwt3GXFG', NULL, 1, '2025-05-29 15:05:15', '2025-06-01 06:59:17', NULL),
(5, 4, 'Tazul Islam (TABOM)', NULL, 2, '8801863550621', 'tazult937@gmail.com', '$2y$10$cp/ECH9KSy2YjIsYv3aCOOf14I1Jg6IErGdM1Owpy48bbw0GZ1S7e', NULL, 1, '2025-05-31 09:44:02', '2025-06-09 13:24:43', NULL),
(6, NULL, 'Raihan', NULL, 3, '01839317038', 'rayanc430@gmail.com', '$2y$10$BFsTCUky8SYs5oiTYnCOquRDmT7WId7mVzJ0fnnnO6m3FRFDuxxGa', 'admin-1750073550.jpg', 1, '2025-06-01 06:58:47', '2025-06-16 11:32:30', 'GJcjN3jW29RlbiRHG8JRC11yBAaBEMLBptfPUJzFm9YzZ1znjW4mVUgKGSPf'),
(7, 5, 'Mr. Shihab (AINT)', NULL, 2, '8801756733986', 'shihabbdph@gmail.com', '$2y$10$.mP.VKBNEDd/OPipz.S0IumXjHFzlC1OvgaKvoYVGKXDZ7sGkvUV6', NULL, 1, '2025-06-15 08:55:55', '2025-06-16 06:32:22', 'jddo7IqRDLJK18VbiKbubYlN2sXf69aa7m1C5N58CXsAuxTMG9S6EYv4pkdc'),
(8, 6, 'Mr. Shakil (ISTAI)', NULL, 2, '8801941356122', 'istair.intl@gmail.com', '$2y$10$n0fPk17JIlhAMtZ0bp28geNG0ATse1VXLw/h/QxWl0BJzdeJvmzmi', NULL, 1, '2025-06-15 09:14:29', '2025-06-17 05:46:26', 'B1jGxV1GpSY9J3r8vZRaeBFbocX27Pqza6fjxhAkkPYBKTGUX8B9I3SSoigm');

-- --------------------------------------------------------

--
-- Table structure for table `basic_infos`
--

CREATE TABLE `basic_infos` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_link` text COLLATE utf8mb4_unicode_ci,
  `facebook_link` text COLLATE utf8mb4_unicode_ci,
  `twitter_link` text COLLATE utf8mb4_unicode_ci,
  `linkedin_link` text COLLATE utf8mb4_unicode_ci,
  `youtube_link` text COLLATE utf8mb4_unicode_ci,
  `assets_value` int NOT NULL,
  `total_employees` int NOT NULL,
  `total_companies` int NOT NULL,
  `start_year` int NOT NULL,
  `map_embed` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_embed_1` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_embed_2` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_embed_3` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `id` bigint UNSIGNED NOT NULL,
  `parent_cat_id` int NOT NULL DEFAULT '0',
  `cat_type_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` int NOT NULL,
  `country_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `country_name` varchar(100) NOT NULL DEFAULT '',
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`, `status`) VALUES
(1, 'AF', 'Afghanistan', 0),
(2, 'AL', 'Albania', 0),
(3, 'DZ', 'Algeria', 0),
(4, 'AS', 'American Samoa', 0),
(5, 'AD', 'Andorra', 0),
(6, 'AO', 'Angola', 0),
(7, 'AI', 'Anguilla', 0),
(8, 'AQ', 'Antarctica', 0),
(9, 'AG', 'Antigua and Barbuda', 0),
(10, 'AR', 'Argentina', 0),
(11, 'AM', 'Armenia', 0),
(12, 'AW', 'Aruba', 0),
(13, 'AU', 'Australia', 0),
(14, 'AT', 'Austria', 0),
(15, 'AZ', 'Azerbaijan', 0),
(16, 'BS', 'Bahamas', 0),
(17, 'BH', 'Bahrain', 0),
(18, 'BD', 'Bangladesh', 0),
(19, 'BB', 'Barbados', 0),
(20, 'BY', 'Belarus', 0),
(21, 'BE', 'Belgium', 0),
(22, 'BZ', 'Belize', 0),
(23, 'BJ', 'Benin', 0),
(24, 'BM', 'Bermuda', 0),
(25, 'BT', 'Bhutan', 0),
(26, 'BO', 'Bolivia', 0),
(27, 'BA', 'Bosnia and Herzegovina', 0),
(28, 'BW', 'Botswana', 0),
(29, 'BV', 'Bouvet Island', 0),
(30, 'BR', 'Brazil', 0),
(31, 'IO', 'British Indian Ocean Territory', 0),
(32, 'BN', 'Brunei Darussalam', 0),
(33, 'BG', 'Bulgaria', 0),
(34, 'BF', 'Burkina Faso', 0),
(35, 'BI', 'Burundi', 0),
(36, 'KH', 'Cambodia', 0),
(37, 'CM', 'Cameroon', 0),
(38, 'CA', 'Canada', 0),
(39, 'CV', 'Cape Verde', 0),
(40, 'KY', 'Cayman Islands', 0),
(41, 'CF', 'Central African Republic', 0),
(42, 'TD', 'Chad', 0),
(43, 'CL', 'Chile', 0),
(44, 'CN', 'China', 0),
(45, 'CX', 'Christmas Island', 0),
(46, 'CC', 'Cocos (Keeling) Islands', 0),
(47, 'CO', 'Colombia', 0),
(48, 'KM', 'Comoros', 0),
(49, 'CD', 'Democratic Republic of the Congo', 0),
(50, 'CG', 'Republic of Congo', 0),
(51, 'CK', 'Cook Islands', 0),
(52, 'CR', 'Costa Rica', 0),
(53, 'HR', 'Croatia (Hrvatska)', 0),
(54, 'CU', 'Cuba', 0),
(55, 'CY', 'Cyprus', 0),
(56, 'CZ', 'Czech Republic', 0),
(57, 'DK', 'Denmark', 0),
(58, 'DJ', 'Djibouti', 0),
(59, 'DM', 'Dominica', 0),
(60, 'DO', 'Dominican Republic', 0),
(61, 'TL', 'East Timor', 0),
(62, 'EC', 'Ecuador', 0),
(63, 'EG', 'Egypt', 0),
(64, 'SV', 'El Salvador', 0),
(65, 'GQ', 'Equatorial Guinea', 0),
(66, 'ER', 'Eritrea', 0),
(67, 'EE', 'Estonia', 0),
(68, 'ET', 'Ethiopia', 0),
(69, 'FK', 'Falkland Islands (Malvinas)', 0),
(70, 'FO', 'Faroe Islands', 0),
(71, 'FJ', 'Fiji', 0),
(72, 'FI', 'Finland', 0),
(73, 'FR', 'France', 0),
(74, 'FX', 'France, Metropolitan', 0),
(75, 'GF', 'French Guiana', 0),
(76, 'PF', 'French Polynesia', 0),
(77, 'TF', 'French Southern Territories', 0),
(78, 'GA', 'Gabon', 0),
(79, 'GM', 'Gambia', 0),
(80, 'GE', 'Georgia', 0),
(81, 'DE', 'Germany', 0),
(82, 'GH', 'Ghana', 0),
(83, 'GI', 'Gibraltar', 0),
(84, 'GG', 'Guernsey', 0),
(85, 'GR', 'Greece', 0),
(86, 'GL', 'Greenland', 0),
(87, 'GD', 'Grenada', 0),
(88, 'GP', 'Guadeloupe', 0),
(89, 'GU', 'Guam', 0),
(90, 'GT', 'Guatemala', 0),
(91, 'GN', 'Guinea', 0),
(92, 'GW', 'Guinea-Bissau', 0),
(93, 'GY', 'Guyana', 0),
(94, 'HT', 'Haiti', 0),
(95, 'HM', 'Heard and Mc Donald Islands', 0),
(96, 'HN', 'Honduras', 0),
(97, 'HK', 'Hong Kong', 0),
(98, 'HU', 'Hungary', 0),
(99, 'IS', 'Iceland', 0),
(100, 'IN', 'India', 0),
(101, 'IM', 'Isle of Man', 0),
(102, 'ID', 'Indonesia', 0),
(103, 'IR', 'Iran (Islamic Republic of)', 0),
(104, 'IQ', 'Iraq', 0),
(105, 'IE', 'Ireland', 0),
(106, 'IL', 'Israel', 0),
(107, 'IT', 'Italy', 0),
(108, 'CI', 'Ivory Coast', 0),
(109, 'JE', 'Jersey', 0),
(110, 'JM', 'Jamaica', 0),
(111, 'JP', 'Japan', 0),
(112, 'JO', 'Jordan', 0),
(113, 'KZ', 'Kazakhstan', 0),
(114, 'KE', 'Kenya', 0),
(115, 'KI', 'Kiribati', 0),
(116, 'KP', 'Korea, Democratic People\'s Republic of', 0),
(117, 'KR', 'Korea, Republic of', 0),
(118, 'XK', 'Kosovo', 0),
(119, 'KWI', 'Kuwait', 1),
(120, 'KG', 'Kyrgyzstan', 0),
(121, 'LA', 'Lao People\'s Democratic Republic', 0),
(122, 'LV', 'Latvia', 0),
(123, 'LB', 'Lebanon', 0),
(124, 'LS', 'Lesotho', 0),
(125, 'LR', 'Liberia', 0),
(126, 'LY', 'Libyan Arab Jamahiriya', 0),
(127, 'LI', 'Liechtenstein', 0),
(128, 'LT', 'Lithuania', 0),
(129, 'LU', 'Luxembourg', 0),
(130, 'MO', 'Macau', 0),
(131, 'MK', 'North Macedonia', 0),
(132, 'MG', 'Madagascar', 0),
(133, 'MW', 'Malawi', 0),
(134, 'MY', 'Malaysia', 0),
(135, 'MV', 'Maldives', 0),
(136, 'ML', 'Mali', 0),
(137, 'MT', 'Malta', 0),
(138, 'MH', 'Marshall Islands', 0),
(139, 'MQ', 'Martinique', 0),
(140, 'MR', 'Mauritania', 0),
(141, 'MU', 'Mauritius', 0),
(142, 'YT', 'Mayotte', 0),
(143, 'MX', 'Mexico', 0),
(144, 'FM', 'Micronesia, Federated States of', 0),
(145, 'MD', 'Moldova, Republic of', 0),
(146, 'MC', 'Monaco', 0),
(147, 'MN', 'Mongolia', 0),
(148, 'ME', 'Montenegro', 0),
(149, 'MS', 'Montserrat', 0),
(150, 'MA', 'Morocco', 0),
(151, 'MZ', 'Mozambique', 0),
(152, 'MM', 'Myanmar', 0),
(153, 'NA', 'Namibia', 0),
(154, 'NR', 'Nauru', 0),
(155, 'NP', 'Nepal', 0),
(156, 'NL', 'Netherlands', 0),
(157, 'AN', 'Netherlands Antilles', 0),
(158, 'NC', 'New Caledonia', 0),
(159, 'NZ', 'New Zealand', 0),
(160, 'NI', 'Nicaragua', 0),
(161, 'NE', 'Niger', 0),
(162, 'NG', 'Nigeria', 0),
(163, 'NU', 'Niue', 0),
(164, 'NF', 'Norfolk Island', 0),
(165, 'MP', 'Northern Mariana Islands', 0),
(166, 'NO', 'Norway', 0),
(167, 'OM', 'Oman', 0),
(168, 'PK', 'Pakistan', 0),
(169, 'PW', 'Palau', 0),
(170, 'PS', 'Palestine', 0),
(171, 'PA', 'Panama', 0),
(172, 'PG', 'Papua New Guinea', 0),
(173, 'PY', 'Paraguay', 0),
(174, 'PE', 'Peru', 0),
(175, 'PH', 'Philippines', 0),
(176, 'PN', 'Pitcairn', 0),
(177, 'PL', 'Poland', 0),
(178, 'PT', 'Portugal', 0),
(179, 'PR', 'Puerto Rico', 0),
(180, 'QA', 'Qatar', 0),
(181, 'RE', 'Reunion', 0),
(182, 'RO', 'Romania', 0),
(183, 'RU', 'Russian Federation', 0),
(184, 'RW', 'Rwanda', 0),
(185, 'KN', 'Saint Kitts and Nevis', 0),
(186, 'LC', 'Saint Lucia', 0),
(187, 'VC', 'Saint Vincent and the Grenadines', 0),
(188, 'WS', 'Samoa', 0),
(189, 'SM', 'San Marino', 0),
(190, 'ST', 'Sao Tome and Principe', 0),
(191, 'KSA', 'Saudi Arabia', 1),
(192, 'SN', 'Senegal', 0),
(193, 'RS', 'Serbia', 0),
(194, 'SC', 'Seychelles', 0),
(195, 'SL', 'Sierra Leone', 0),
(196, 'SG', 'Singapore', 0),
(197, 'SK', 'Slovakia', 0),
(198, 'SI', 'Slovenia', 0),
(199, 'SB', 'Solomon Islands', 0),
(200, 'SO', 'Somalia', 0),
(201, 'ZA', 'South Africa', 0),
(202, 'GS', 'South Georgia South Sandwich Islands', 0),
(203, 'SS', 'South Sudan', 0),
(204, 'ES', 'Spain', 0),
(205, 'LK', 'Sri Lanka', 0),
(206, 'SH', 'St. Helena', 0),
(207, 'PM', 'St. Pierre and Miquelon', 0),
(208, 'SD', 'Sudan', 0),
(209, 'SR', 'Suriname', 0),
(210, 'SJ', 'Svalbard and Jan Mayen Islands', 0),
(211, 'SZ', 'Eswatini', 0),
(212, 'SE', 'Sweden', 0),
(213, 'CH', 'Switzerland', 0),
(214, 'SY', 'Syrian Arab Republic', 0),
(215, 'TW', 'Taiwan', 0),
(216, 'TJ', 'Tajikistan', 0),
(217, 'TZ', 'Tanzania, United Republic of', 0),
(218, 'TH', 'Thailand', 0),
(219, 'TG', 'Togo', 0),
(220, 'TK', 'Tokelau', 0),
(221, 'TO', 'Tonga', 0),
(222, 'TT', 'Trinidad and Tobago', 0),
(223, 'TN', 'Tunisia', 0),
(224, 'TR', 'Turkey', 0),
(225, 'TM', 'Turkmenistan', 0),
(226, 'TC', 'Turks and Caicos Islands', 0),
(227, 'TV', 'Tuvalu', 0),
(228, 'UG', 'Uganda', 0),
(229, 'UA', 'Ukraine', 0),
(230, 'AE', 'United Arab Emirates', 0),
(231, 'GB', 'United Kingdom', 0),
(232, 'US', 'United States', 0),
(233, 'UM', 'United States minor outlying islands', 0),
(234, 'UY', 'Uruguay', 0),
(235, 'UZ', 'Uzbekistan', 0),
(236, 'VU', 'Vanuatu', 0),
(237, 'VA', 'Vatican City State', 0),
(238, 'VE', 'Venezuela', 0),
(239, 'VN', 'Vietnam', 0),
(240, 'VG', 'Virgin Islands (British)', 0),
(241, 'VI', 'Virgin Islands (U.S.)', 0),
(242, 'WF', 'Wallis and Futuna Islands', 0),
(243, 'EH', 'Western Sahara', 0),
(244, 'YE', 'Yemen', 0),
(245, 'ZM', 'Zambia', 0),
(246, 'ZW', 'Zimbabwe', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `organization` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_balance` double(20,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `code`, `email`, `phone`, `address`, `organization`, `current_balance`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 'Jannat(AAI)', 'AAI', 'jannati-aai@gmail.com', '8801893291015', '37/2, Zaman Tower (2nd Floor), Purana Paltan, Dhaka-1000', 'Anifa air international', 4000.00, '1', 1, NULL, '2025-05-27 07:30:04', '2025-06-19 11:20:26'),
(2, 'Emam Hossain(AEHB)', 'AEHB', 'imamair2021@gmail.com', '8801712556088', '118 DIT Ext. Road, Fokirapul, Dhaka-1000', 'Bismillah Telecom', 0.00, '1', 1, NULL, '2025-05-27 18:12:01', '2025-06-19 11:19:56'),
(3, 'SUHEL AHMED(SAAS)', 'SAAS', 'saairservicekanaighat@gmail.com', '01736621425', 'AZIZ COMPLEX, KANAIGHAT UTTAR BAZAR', 'SA AIR SERVICE', 0.00, '1', 1, NULL, '2025-05-29 15:05:15', '2025-06-19 11:19:37'),
(4, 'Tazul Islam (TABOM)', 'TABOM', 'tazult937@gmail.com', '8801863550621', 'Palton, Dhaka, Bangladesh', 'Tazul overseas international', 0.00, '1', 1, NULL, '2025-05-31 09:44:02', '2025-06-19 11:19:16'),
(5, 'Mr. Shihab (AINT)', 'AINT', 'abdullahaircervice@gmail.com', '8801756733986', 'Nur Travels, নিচ তলা, Rupayan FPAB Tower, জামান টাওয়ার এর উল্টা পাশে , কালভার্ট রোড , ঢাকা-১০০০।', 'Abdullah air International', 0.00, '1', 1, NULL, '2025-06-15 08:55:55', '2025-06-19 11:19:01'),
(6, 'Mr. Shakil (ISTAI)', 'ISTAI', 'istair.intl@gmail.com', '8801941356122', 'KR Plaza, 31 Purana Paltan, Dhaka-1000. , Dhaka, Bangladesh', 'IST Air International', 0.00, '1', 1, NULL, '2025-06-15 09:14:29', '2025-06-18 08:50:37');

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
  `particular` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL,
  `credit_amount` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_ledgers`
--

INSERT INTO `customer_ledgers` (`id`, `customer_id`, `sale_id`, `payment_id`, `account_id`, `particular`, `date`, `debit_amount`, `credit_amount`, `current_balance`, `reference_number`, `note`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, 'Sale', '2025-05-22', NULL, '7000.00', '7000.00', NULL, NULL, 1, NULL, '2025-05-27 07:35:11', '2025-05-27 07:35:11'),
(2, 1, NULL, 1, 1, 'Payment', '2025-05-22', '7000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-05-27 07:35:11', '2025-05-27 07:35:11'),
(3, 1, 1, NULL, NULL, 'Sale', '2025-05-27', NULL, '5000.00', '5000.00', NULL, NULL, 1, NULL, '2025-05-27 07:47:36', '2025-05-27 07:47:36'),
(4, 1, NULL, 2, 1, 'Payment', '2025-05-27', '5000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-05-27 07:47:36', '2025-05-27 07:47:36'),
(5, 1, 2, NULL, NULL, 'Sale', '2025-05-22', NULL, '7000.00', '7000.00', NULL, NULL, 1, NULL, '2025-05-27 07:50:44', '2025-05-27 07:50:44'),
(6, 1, NULL, 3, 1, 'Payment', '2025-05-22', '7000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-05-27 07:50:44', '2025-05-27 07:50:44'),
(7, 1, 2, NULL, NULL, 'Sale', '2025-05-27', NULL, '5000.00', '5000.00', NULL, NULL, 1, NULL, '2025-05-27 07:52:29', '2025-05-27 07:52:29'),
(8, 1, NULL, 4, 1, 'Payment', '2025-05-27', '1000.00', NULL, '4000.00', NULL, NULL, 1, NULL, '2025-05-27 07:52:29', '2025-05-27 07:52:29'),
(9, 2, 3, NULL, NULL, 'Sale', '2025-04-16', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-05-27 18:18:15', '2025-05-27 18:18:15'),
(10, 2, 3, NULL, NULL, 'Sale', '2025-05-28', NULL, '2000.00', '2000.00', NULL, NULL, 1, NULL, '2025-05-27 18:20:37', '2025-05-27 18:20:37'),
(11, 2, NULL, 5, 1, 'Payment', '2025-05-28', '2000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-05-27 18:20:37', '2025-05-27 18:20:37'),
(12, 2, 3, NULL, NULL, 'Sale', '2025-05-28', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-05-27 18:22:18', '2025-05-27 18:22:18'),
(13, 3, 4, NULL, NULL, 'Sale', '2025-06-01', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-01 06:56:07', '2025-06-01 06:56:07'),
(14, 3, 5, NULL, NULL, 'Sale', '2025-06-01', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-01 06:57:32', '2025-06-01 06:57:32'),
(15, 3, 6, NULL, NULL, 'Sale', '2025-06-01', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-01 08:53:24', '2025-06-01 08:53:24'),
(16, 3, 7, NULL, NULL, 'Sale', '2025-06-01', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-01 08:53:26', '2025-06-01 08:53:26'),
(17, 4, 12, NULL, NULL, 'Sale', '2025-06-02', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-02 14:36:04', '2025-06-02 14:36:04'),
(18, 3, 8, NULL, NULL, 'Sale', '2025-06-02', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-02 14:36:16', '2025-06-02 14:36:16'),
(19, 4, 11, NULL, NULL, 'Sale', '2025-06-02', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-02 14:36:21', '2025-06-02 14:36:21'),
(20, 3, 9, NULL, NULL, 'Sale', '2025-06-02', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-02 14:36:28', '2025-06-02 14:36:28'),
(21, 3, 10, NULL, NULL, 'Sale', '2025-06-02', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-02 14:36:38', '2025-06-02 14:36:38'),
(22, 4, 13, NULL, NULL, 'Sale', '2025-05-06', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 11:54:59', '2025-06-09 11:54:59'),
(23, 4, 13, NULL, NULL, 'Sale', '2025-05-29', NULL, '6500.00', '6500.00', NULL, NULL, 1, NULL, '2025-06-09 11:59:47', '2025-06-09 11:59:47'),
(24, 4, NULL, 6, 1, 'Payment', '2025-05-29', '6500.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-09 11:59:47', '2025-06-09 11:59:47'),
(25, 4, 13, NULL, NULL, 'Sale', '2025-05-29', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:02:18', '2025-06-09 12:02:18'),
(26, 4, 14, NULL, NULL, 'Sale', '2025-05-14', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:08:11', '2025-06-09 12:08:11'),
(27, 4, 14, NULL, NULL, 'Sale', '2025-05-20', NULL, '2000.00', '2000.00', NULL, NULL, 1, NULL, '2025-06-09 12:13:09', '2025-06-09 12:13:09'),
(28, 4, NULL, 7, 1, 'Payment', '2025-05-20', '2000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:13:09', '2025-06-09 12:13:09'),
(29, 4, 14, NULL, NULL, 'Sale', '2025-05-22', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:14:10', '2025-06-09 12:14:10'),
(30, 4, 15, NULL, NULL, 'Sale', '2025-05-25', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:21:17', '2025-06-09 12:21:17'),
(31, 4, 15, NULL, NULL, 'Sale', '2025-05-29', NULL, '2000.00', '2000.00', NULL, NULL, 1, NULL, '2025-06-09 12:24:45', '2025-06-09 12:24:45'),
(32, 4, NULL, 8, 1, 'Payment', '2025-05-29', '2000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:24:45', '2025-06-09 12:24:45'),
(33, 4, 15, NULL, NULL, 'Sale', '2025-05-29', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:25:53', '2025-06-09 12:25:53'),
(34, 4, 16, NULL, NULL, 'Sale', '2025-05-25', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:31:36', '2025-06-09 12:31:36'),
(35, 4, 17, NULL, NULL, 'Sale', '2025-05-25', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:35:51', '2025-06-09 12:35:51'),
(36, 4, 17, NULL, NULL, 'Sale', '2025-06-09', NULL, '2000.00', '2000.00', NULL, NULL, 1, NULL, '2025-06-09 12:40:45', '2025-06-09 12:40:45'),
(37, 4, NULL, 9, 1, 'Payment', '2025-06-09', '2000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:40:45', '2025-06-09 12:40:45'),
(38, 4, 17, NULL, NULL, 'Sale', '2025-06-01', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:49:29', '2025-06-09 12:49:29'),
(39, 4, 18, NULL, NULL, 'Sale', '2025-05-25', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:53:43', '2025-06-09 12:53:43'),
(40, 4, 18, NULL, NULL, 'Sale', '2025-06-01', NULL, '2000.00', '2000.00', NULL, NULL, 1, NULL, '2025-06-09 12:55:53', '2025-06-09 12:55:53'),
(41, 4, NULL, 10, 1, 'Payment', '2025-06-01', '2000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:55:53', '2025-06-09 12:55:53'),
(42, 4, 18, NULL, NULL, 'Sale', '2025-05-31', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 12:57:22', '2025-06-09 12:57:22'),
(43, 4, 19, NULL, NULL, 'Sale', '2025-05-26', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 13:03:56', '2025-06-09 13:03:56'),
(44, 4, 19, NULL, NULL, 'Sale', '2025-06-01', NULL, '2000.00', '2000.00', NULL, NULL, 1, NULL, '2025-06-09 13:09:06', '2025-06-09 13:09:06'),
(45, 4, NULL, 11, 1, 'Payment', '2025-06-01', '2000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-09 13:09:06', '2025-06-09 13:09:06'),
(46, 4, 19, NULL, NULL, 'Sale', '2025-06-01', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 13:10:04', '2025-06-09 13:10:04'),
(47, 4, 20, NULL, NULL, 'Sale', '2025-05-26', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 13:14:30', '2025-06-09 13:14:30'),
(48, 4, 20, NULL, NULL, 'Sale', '2025-06-01', NULL, '2000.00', '2000.00', NULL, NULL, 1, NULL, '2025-06-09 13:17:19', '2025-06-09 13:17:19'),
(49, 4, NULL, 12, 1, 'Payment', '2025-06-01', '2000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-09 13:17:19', '2025-06-09 13:17:19'),
(50, 4, 20, NULL, NULL, 'Sale', '2025-06-02', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-09 13:18:09', '2025-06-09 13:18:09'),
(51, 3, 21, NULL, NULL, 'Sale', '2025-06-01', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 05:09:41', '2025-06-15 05:09:41'),
(52, 3, 22, NULL, NULL, 'Sale', '2025-06-01', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 05:09:43', '2025-06-15 05:09:43'),
(53, 3, 26, NULL, NULL, 'Sale', '2025-06-01', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 05:09:47', '2025-06-15 05:09:47'),
(54, 3, 25, NULL, NULL, 'Sale', '2025-06-02', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 05:09:58', '2025-06-15 05:09:58'),
(55, 3, 24, NULL, NULL, 'Sale', '2025-06-02', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 05:10:10', '2025-06-15 05:10:10'),
(56, 3, 23, NULL, NULL, 'Sale', '2025-06-01', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 05:10:15', '2025-06-15 05:10:15'),
(57, 2, 35, NULL, NULL, 'Sale', '2025-05-31', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 07:52:34', '2025-06-15 07:52:34'),
(58, 2, 34, NULL, NULL, 'Sale', '2025-05-28', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 07:53:04', '2025-06-15 07:53:04'),
(59, 2, 33, NULL, NULL, 'Sale', '2025-05-27', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 07:53:15', '2025-06-15 07:53:15'),
(60, 2, 32, NULL, NULL, 'Sale', '2025-05-19', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 07:53:24', '2025-06-15 07:53:24'),
(61, 2, 31, NULL, NULL, 'Sale', '2025-05-18', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 07:53:31', '2025-06-15 07:53:31'),
(62, 2, 30, NULL, NULL, 'Sale', '2025-05-18', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 07:53:43', '2025-06-15 07:53:43'),
(63, 2, 29, NULL, NULL, 'Sale', '2025-05-18', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 07:53:53', '2025-06-15 07:53:53'),
(64, 4, 28, NULL, NULL, 'Sale', '2025-06-02', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 07:53:59', '2025-06-15 07:53:59'),
(65, 4, 27, NULL, NULL, 'Sale', '2025-06-02', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 07:54:10', '2025-06-15 07:54:10'),
(66, 5, 40, NULL, NULL, 'Sale', '2025-04-07', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 09:56:02', '2025-06-15 09:56:02'),
(67, 5, 79, NULL, NULL, 'Sale', '2025-04-16', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:33:06', '2025-06-15 11:33:06'),
(68, 5, 78, NULL, NULL, 'Sale', '2025-04-16', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:33:21', '2025-06-15 11:33:21'),
(69, 5, 78, NULL, NULL, 'Sale', '2025-05-01', NULL, '2000.00', '2000.00', NULL, NULL, 1, NULL, '2025-06-15 11:38:02', '2025-06-15 11:38:02'),
(70, 5, NULL, 13, 1, 'Payment', '2025-05-01', '2000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-15 11:38:02', '2025-06-15 11:38:02'),
(71, 6, 85, NULL, NULL, 'Sale', '2025-05-22', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:18', '2025-06-15 11:57:18'),
(72, 6, 84, NULL, NULL, 'Sale', '2025-05-20', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:24', '2025-06-15 11:57:24'),
(73, 6, 83, NULL, NULL, 'Sale', '2025-05-07', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:29', '2025-06-15 11:57:29'),
(74, 6, 83, NULL, NULL, 'Sale', '2025-05-07', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:31', '2025-06-15 11:57:31'),
(75, 6, 82, NULL, NULL, 'Sale', '2025-05-06', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:34', '2025-06-15 11:57:34'),
(76, 6, 82, NULL, NULL, 'Sale', '2025-05-06', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:36', '2025-06-15 11:57:36'),
(77, 6, 81, NULL, NULL, 'Sale', '2025-04-08', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:39', '2025-06-15 11:57:39'),
(78, 6, 81, NULL, NULL, 'Sale', '2025-04-08', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:41', '2025-06-15 11:57:41'),
(79, 6, 80, NULL, NULL, 'Sale', '2025-04-07', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:43', '2025-06-15 11:57:43'),
(80, 5, 77, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:47', '2025-06-15 11:57:47'),
(81, 5, 76, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:51', '2025-06-15 11:57:51'),
(82, 5, 76, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:53', '2025-06-15 11:57:53'),
(83, 5, 75, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:56', '2025-06-15 11:57:56'),
(84, 5, 75, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:57:58', '2025-06-15 11:57:58'),
(85, 5, 74, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:01', '2025-06-15 11:58:01'),
(86, 5, 74, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:03', '2025-06-15 11:58:03'),
(87, 5, 73, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:06', '2025-06-15 11:58:06'),
(88, 5, 72, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:09', '2025-06-15 11:58:09'),
(89, 5, 72, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:11', '2025-06-15 11:58:11'),
(90, 5, 71, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:13', '2025-06-15 11:58:13'),
(91, 5, 71, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:15', '2025-06-15 11:58:15'),
(92, 5, 70, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:17', '2025-06-15 11:58:17'),
(93, 5, 70, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:19', '2025-06-15 11:58:19'),
(94, 5, 69, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:24', '2025-06-15 11:58:24'),
(95, 5, 69, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:24', '2025-06-15 11:58:24'),
(96, 5, 69, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:26', '2025-06-15 11:58:26'),
(97, 5, 68, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:28', '2025-06-15 11:58:28'),
(98, 5, 68, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:29', '2025-06-15 11:58:29'),
(99, 5, 67, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:34', '2025-06-15 11:58:34'),
(100, 5, 67, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:35', '2025-06-15 11:58:35'),
(101, 5, 67, NULL, NULL, 'Sale', '2025-04-15', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:36', '2025-06-15 11:58:36'),
(102, 5, 66, NULL, NULL, 'Sale', '2025-04-13', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:40', '2025-06-15 11:58:40'),
(103, 5, 66, NULL, NULL, 'Sale', '2025-04-13', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:41', '2025-06-15 11:58:41'),
(104, 5, 65, NULL, NULL, 'Sale', '2025-04-13', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:44', '2025-06-15 11:58:44'),
(105, 5, 65, NULL, NULL, 'Sale', '2025-04-13', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:46', '2025-06-15 11:58:46'),
(106, 5, 64, NULL, NULL, 'Sale', '2025-04-12', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:49', '2025-06-15 11:58:49'),
(107, 5, 64, NULL, NULL, 'Sale', '2025-04-12', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:51', '2025-06-15 11:58:51'),
(108, 5, 63, NULL, NULL, 'Sale', '2025-04-12', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:54', '2025-06-15 11:58:54'),
(109, 5, 63, NULL, NULL, 'Sale', '2025-04-12', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:55', '2025-06-15 11:58:55'),
(110, 5, 62, NULL, NULL, 'Sale', '2025-04-12', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:58:59', '2025-06-15 11:58:59'),
(111, 5, 62, NULL, NULL, 'Sale', '2025-04-12', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:01', '2025-06-15 11:59:01'),
(112, 5, 61, NULL, NULL, 'Sale', '2025-04-12', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:04', '2025-06-15 11:59:04'),
(113, 5, 61, NULL, NULL, 'Sale', '2025-04-12', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:05', '2025-06-15 11:59:05'),
(114, 5, 60, NULL, NULL, 'Sale', '2025-04-12', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:07', '2025-06-15 11:59:07'),
(115, 5, 60, NULL, NULL, 'Sale', '2025-04-12', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:09', '2025-06-15 11:59:09'),
(116, 5, 59, NULL, NULL, 'Sale', '2025-04-12', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:12', '2025-06-15 11:59:12'),
(117, 5, 59, NULL, NULL, 'Sale', '2025-04-12', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:14', '2025-06-15 11:59:14'),
(118, 5, 58, NULL, NULL, 'Sale', '2025-04-12', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:16', '2025-06-15 11:59:16'),
(119, 5, 57, NULL, NULL, 'Sale', '2025-04-10', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:18', '2025-06-15 11:59:18'),
(120, 5, 57, NULL, NULL, 'Sale', '2025-04-10', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:20', '2025-06-15 11:59:20'),
(121, 5, 56, NULL, NULL, 'Sale', '2025-04-09', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:25', '2025-06-15 11:59:25'),
(122, 5, 55, NULL, NULL, 'Sale', '2025-04-09', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:30', '2025-06-15 11:59:30'),
(123, 5, 54, NULL, NULL, 'Sale', '2025-04-09', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:38', '2025-06-15 11:59:38'),
(124, 5, 53, NULL, NULL, 'Sale', '2025-04-09', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:42', '2025-06-15 11:59:42'),
(125, 5, 52, NULL, NULL, 'Sale', '2025-04-08', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:53', '2025-06-15 11:59:53'),
(126, 5, 51, NULL, NULL, 'Sale', '2025-04-08', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 11:59:58', '2025-06-15 11:59:58'),
(127, 5, 50, NULL, NULL, 'Sale', '2025-04-08', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:00:03', '2025-06-15 12:00:03'),
(128, 5, 49, NULL, NULL, 'Sale', '2025-04-08', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:00:10', '2025-06-15 12:00:10'),
(129, 5, 48, NULL, NULL, 'Sale', '2025-04-07', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:00:16', '2025-06-15 12:00:16'),
(130, 5, 47, NULL, NULL, 'Sale', '2025-04-07', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:00:23', '2025-06-15 12:00:23'),
(131, 5, 46, NULL, NULL, 'Sale', '2025-04-07', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:01:08', '2025-06-15 12:01:08'),
(132, 5, 45, NULL, NULL, 'Sale', '2025-04-07', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:01:15', '2025-06-15 12:01:15'),
(133, 5, 44, NULL, NULL, 'Sale', '2025-04-07', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:01:23', '2025-06-15 12:01:23'),
(134, 5, 43, NULL, NULL, 'Sale', '2025-04-07', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:01:29', '2025-06-15 12:01:29'),
(135, 5, 42, NULL, NULL, 'Sale', '2025-04-07', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:01:36', '2025-06-15 12:01:36'),
(136, 5, 41, NULL, NULL, 'Sale', '2025-04-07', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:01:46', '2025-06-15 12:01:46'),
(137, 5, 39, NULL, NULL, 'Sale', '2025-04-06', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:02:08', '2025-06-15 12:02:08'),
(138, 5, 38, NULL, NULL, 'Sale', '2025-04-06', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:02:17', '2025-06-15 12:02:17'),
(139, 5, 37, NULL, NULL, 'Sale', '2025-04-05', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:02:44', '2025-06-15 12:02:44'),
(140, 5, 36, NULL, NULL, 'Sale', '2025-05-07', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-15 12:02:52', '2025-06-15 12:02:52'),
(141, 5, 86, NULL, NULL, 'Sale', '2025-06-16', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-16 14:15:43', '2025-06-16 14:15:43'),
(142, 5, 87, NULL, NULL, 'Sale', '2025-06-16', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-16 14:17:01', '2025-06-16 14:17:01'),
(143, 5, 88, NULL, NULL, 'Sale', '2025-06-16', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-16 14:18:08', '2025-06-16 14:18:08'),
(144, 3, 89, NULL, NULL, 'Sale', '2025-06-16', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-16 14:19:17', '2025-06-16 14:19:17'),
(145, 6, 95, NULL, NULL, 'Sale', '2025-06-17', NULL, '0.00', '0.00', NULL, NULL, 8, NULL, '2025-06-17 06:11:32', '2025-06-17 06:11:32'),
(146, 6, 95, NULL, NULL, 'Sale', '2025-06-17', NULL, '7000.00', '7000.00', NULL, NULL, 1, NULL, '2025-06-17 06:14:56', '2025-06-17 06:14:56'),
(147, 6, NULL, 14, 1, 'Payment', '2025-06-17', '7000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-17 06:14:56', '2025-06-17 06:14:56'),
(148, 6, 96, NULL, NULL, 'Sale', '2025-06-17', NULL, '7000.00', '7000.00', NULL, NULL, 8, NULL, '2025-06-17 06:29:29', '2025-06-17 06:29:29'),
(149, 6, NULL, 15, 1, 'Payment', '2025-06-17', '7000.00', NULL, '0.00', NULL, NULL, 8, NULL, '2025-06-17 06:29:29', '2025-06-17 06:29:29'),
(150, 5, 93, NULL, NULL, 'Sale', '2025-06-16', NULL, '0.00', '0.00', NULL, NULL, 6, NULL, '2025-06-17 06:49:21', '2025-06-17 06:49:21'),
(151, 6, 95, NULL, NULL, 'Sale', '2025-06-18', NULL, '2000.00', '2000.00', NULL, NULL, 1, NULL, '2025-06-18 08:50:37', '2025-06-18 08:50:37'),
(152, 6, NULL, 16, 1, 'Payment', '2025-06-18', '2000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-18 08:50:37', '2025-06-18 08:50:37'),
(153, 6, 95, NULL, NULL, 'Sale', '2025-06-18', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-18 08:51:59', '2025-06-18 08:51:59'),
(154, 2, 100, NULL, NULL, 'Sale', '2025-06-18', NULL, '2500.00', '2500.00', NULL, NULL, 1, NULL, '2025-06-18 09:23:59', '2025-06-18 09:23:59'),
(155, 2, NULL, 17, 1, 'Payment', '2025-06-18', '2500.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-18 09:23:59', '2025-06-18 09:23:59'),
(156, 6, 101, NULL, NULL, 'Sale', '2025-06-18', NULL, '0.00', '0.00', NULL, NULL, 8, NULL, '2025-06-18 10:25:34', '2025-06-18 10:25:34'),
(157, 2, 102, NULL, NULL, 'Sale', '2025-06-18', NULL, '7000.00', '7000.00', NULL, NULL, 1, NULL, '2025-06-18 11:08:45', '2025-06-18 11:08:45'),
(158, 2, NULL, 18, 1, 'Payment', '2025-06-18', '7000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-18 11:08:46', '2025-06-18 11:08:46'),
(159, 2, 100, NULL, NULL, 'Sale', '2025-06-18', NULL, '4000.00', '4000.00', NULL, NULL, 1, NULL, '2025-06-18 12:25:18', '2025-06-18 12:25:18'),
(160, 2, NULL, 19, 1, 'Payment', '2025-06-18', '4000.00', NULL, '0.00', NULL, NULL, 1, NULL, '2025-06-18 12:25:18', '2025-06-18 12:25:18'),
(161, 6, 104, NULL, NULL, 'Sale', '2025-06-19', NULL, '0.00', '0.00', NULL, NULL, 1, NULL, '2025-06-19 07:50:32', '2025-06-19 07:50:32');

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
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_payments`
--

INSERT INTO `customer_payments` (`id`, `customer_id`, `account_id`, `sale_id`, `date`, `amount`, `reference_number`, `note`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2025-05-22', 7000.00, NULL, NULL, 1, 1, NULL, '2025-05-27 07:35:11', '2025-05-27 07:35:11'),
(2, 1, 1, 1, '2025-05-27', 5000.00, NULL, NULL, 1, 1, NULL, '2025-05-27 07:47:36', '2025-05-27 07:47:36'),
(3, 1, 1, 2, '2025-05-22', 7000.00, NULL, NULL, 1, 1, NULL, '2025-05-27 07:50:44', '2025-05-27 07:50:44'),
(4, 1, 1, 2, '2025-05-27', 1000.00, NULL, NULL, 1, 1, NULL, '2025-05-27 07:52:29', '2025-05-27 07:52:29'),
(5, 2, 1, 3, '2025-05-28', 2000.00, NULL, NULL, 1, 1, NULL, '2025-05-27 18:20:37', '2025-05-27 18:20:37'),
(6, 4, 1, 13, '2025-05-29', 6500.00, NULL, NULL, 1, 1, NULL, '2025-06-09 11:59:47', '2025-06-09 11:59:47'),
(7, 4, 1, 14, '2025-05-20', 2000.00, NULL, NULL, 1, 1, NULL, '2025-06-09 12:13:09', '2025-06-09 12:13:09'),
(8, 4, 1, 15, '2025-05-29', 2000.00, NULL, NULL, 1, 1, NULL, '2025-06-09 12:24:45', '2025-06-09 12:24:45'),
(9, 4, 1, 17, '2025-06-09', 2000.00, NULL, NULL, 1, 1, NULL, '2025-06-09 12:40:45', '2025-06-09 12:40:45'),
(10, 4, 1, 18, '2025-06-01', 2000.00, NULL, NULL, 1, 1, NULL, '2025-06-09 12:55:53', '2025-06-09 12:55:53'),
(11, 4, 1, 19, '2025-06-01', 2000.00, NULL, NULL, 1, 1, NULL, '2025-06-09 13:09:06', '2025-06-09 13:09:06'),
(12, 4, 1, 20, '2025-06-01', 2000.00, NULL, NULL, 1, 1, NULL, '2025-06-09 13:17:19', '2025-06-09 13:17:19'),
(13, 5, 1, 78, '2025-05-01', 2000.00, NULL, NULL, 1, 1, NULL, '2025-06-15 11:38:02', '2025-06-15 11:38:02'),
(14, 6, 1, 95, '2025-06-17', 7000.00, NULL, NULL, 1, 1, NULL, '2025-06-17 06:14:56', '2025-06-17 06:14:56'),
(15, 6, 1, 96, '2025-06-17', 7000.00, NULL, NULL, 1, 8, NULL, '2025-06-17 06:29:29', '2025-06-17 06:29:29'),
(16, 6, 1, 95, '2025-06-18', 2000.00, NULL, NULL, 1, 1, NULL, '2025-06-18 08:50:37', '2025-06-18 08:50:37'),
(17, 2, 1, 100, '2025-06-18', 2500.00, NULL, NULL, 1, 1, NULL, '2025-06-18 09:23:59', '2025-06-18 09:23:59'),
(18, 2, 1, 102, '2025-06-18', 7000.00, NULL, NULL, 1, 1, NULL, '2025-06-18 11:08:46', '2025-06-18 11:08:46'),
(19, 2, 1, 100, '2025-06-18', 4000.00, NULL, NULL, 1, 1, NULL, '2025-06-18 12:25:18', '2025-06-18 12:25:18');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `account_id` bigint NOT NULL,
  `expense_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `total_amount` decimal(20,2) NOT NULL,
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `account_id`, `expense_no`, `date`, `total_amount`, `reference_number`, `note`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, '0000001', '2025-05-22', '14000.00', NULL, 'Pre-Medical Fee', 1, 1, 1, '2025-05-29 19:26:08', '2025-05-29 19:26:22'),
(2, 1, '0000002', '2025-06-04', '10000.00', NULL, '5000Tk.  due ..have to pay after vacation', 1, 1, 1, '2025-06-13 17:48:05', '2025-06-13 17:48:16');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `cat_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
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
  `id` bigint UNSIGNED NOT NULL,
  `expense_id` int NOT NULL,
  `expense_head_id` int NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_details`
--

INSERT INTO `expense_details` (`id`, `expense_id`, `expense_head_id`, `amount`, `quantity`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '7000.00', '2.00', NULL, '2025-05-29 19:26:08', '2025-05-29 19:26:08'),
(2, 2, 2, '10000.00', '1.00', NULL, '2025-06-13 17:48:05', '2025-06-13 17:48:05');

-- --------------------------------------------------------

--
-- Table structure for table `expense_heads`
--

CREATE TABLE `expense_heads` (
  `id` bigint UNSIGNED NOT NULL,
  `expense_category_id` bigint NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, 1, 'Office Rent', NULL, 1, 1, NULL, '2025-05-29 16:29:51', '2025-05-29 16:29:51'),
(2, 2, 'Staff Salary', NULL, 1, 1, NULL, '2025-05-29 16:30:04', '2025-05-29 16:30:04'),
(3, 3, 'Service Purchase', NULL, 1, 1, NULL, '2025-05-29 16:30:19', '2025-05-29 16:30:19'),
(4, 3, 'Slip', NULL, 1, 1, NULL, '2025-05-29 19:27:28', '2025-05-29 19:27:28');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved, 2=Cancelled',
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
  `srl` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `purchase_price` double(20,2) NOT NULL DEFAULT '0.00',
  `sale_price` double(20,2) NOT NULL DEFAULT '0.00',
  `next_item_id` int DEFAULT NULL COMMENT 'for service works order',
  `vat` double(20,2) NOT NULL DEFAULT '0.00',
  `is_saleable` tinyint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_type`, `package_id`, `package_item_id`, `srl`, `name`, `description`, `purchase_price`, `sale_price`, `next_item_id`, `vat`, `is_saleable`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, NULL, 1, 'Pre Medical', NULL, 0.00, 0.00, 2, 0.00, 1, 1, '2025-05-04 21:25:44', '2025-05-27 15:35:16'),
(2, 0, NULL, NULL, 2, 'Settlement', NULL, 2500.00, 3000.00, 3, 0.00, 1, 1, '2025-05-04 21:26:53', '2025-06-17 05:41:29'),
(3, 0, NULL, NULL, 3, 'Slip Process', NULL, 2000.00, 2500.00, 4, 0.00, 1, 1, '2025-05-04 21:27:42', '2025-06-17 05:41:38'),
(4, 0, NULL, NULL, 4, 'MOFA', NULL, 0.00, 0.00, 5, 0.00, 0, 1, '2025-05-04 21:28:02', '2025-05-04 21:28:02'),
(5, 0, NULL, NULL, 5, 'Fit Card', NULL, 0.00, 0.00, 0, 0.00, 0, 1, '2025-05-04 22:41:34', '2025-05-04 22:41:34'),
(6, 1, NULL, NULL, NULL, 'Slip Process Self', NULL, 0.00, 0.00, NULL, 0.00, 1, 1, '2025-05-27 06:23:54', '2025-05-27 06:23:54'),
(7, NULL, 6, 3, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 06:23:54', '2025-05-27 06:23:54'),
(8, 1, NULL, NULL, NULL, 'Standard PKG-1 ( Satelment, Slip, MOFA,FIT Card)', NULL, 3000.00, 5000.00, NULL, 0.00, 1, 1, '2025-05-27 07:46:30', '2025-05-27 07:46:30'),
(13, 1, NULL, NULL, NULL, 'Satelment- P1-2K', NULL, 1500.00, 2000.00, NULL, 0.00, 1, 1, '2025-05-27 15:38:04', '2025-05-27 15:57:26'),
(18, NULL, 8, 2, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:55:25', '2025-05-27 15:55:25'),
(19, NULL, 8, 3, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:55:25', '2025-05-27 15:55:25'),
(20, NULL, 8, 4, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:55:25', '2025-05-27 15:55:25'),
(21, NULL, 8, 5, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:55:25', '2025-05-27 15:55:25'),
(22, NULL, 13, 1, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:57:26', '2025-05-27 15:57:26'),
(23, NULL, 13, 2, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:57:26', '2025-05-27 15:57:26'),
(24, NULL, 13, 4, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:57:26', '2025-05-27 15:57:26'),
(25, NULL, 13, 5, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:57:26', '2025-05-27 15:57:26'),
(26, 1, NULL, NULL, NULL, 'Satelment- P2-4K', NULL, 3500.00, 4000.00, NULL, 0.00, 1, 1, '2025-05-27 15:58:28', '2025-05-27 15:58:28'),
(27, NULL, 26, 1, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:58:28', '2025-05-27 15:58:28'),
(28, NULL, 26, 2, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:58:28', '2025-05-27 15:58:28'),
(29, NULL, 26, 4, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:58:28', '2025-05-27 15:58:28'),
(30, NULL, 26, 5, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:58:28', '2025-05-27 15:58:28'),
(31, 1, NULL, NULL, NULL, 'Satelment- P3-6.5K', NULL, 6000.00, 6500.00, NULL, 0.00, 1, 1, '2025-05-27 15:59:13', '2025-05-27 15:59:13'),
(32, NULL, 31, 1, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:59:13', '2025-05-27 15:59:13'),
(33, NULL, 31, 2, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:59:13', '2025-05-27 15:59:13'),
(34, NULL, 31, 4, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:59:13', '2025-05-27 15:59:13'),
(35, NULL, 31, 5, NULL, '', NULL, 0.00, 0.00, NULL, 0.00, NULL, 1, '2025-05-27 15:59:13', '2025-05-27 15:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `job_service_records`
--

CREATE TABLE `job_service_records` (
  `id` bigint UNSIGNED NOT NULL,
  `job_id` int NOT NULL,
  `item_id` int NOT NULL,
  `entry_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medical_centers` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slip_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mofa_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_enabled` tinyint NOT NULL DEFAULT '0',
  `is_complete` tinyint NOT NULL DEFAULT '0',
  `is_agent_purchased` tinyint NOT NULL DEFAULT '0' COMMENT '1=Yes, 0=No',
  `status_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_service_records`
--

INSERT INTO `job_service_records` (`id`, `job_id`, `item_id`, `entry_date`, `expire_date`, `remarks`, `medical_centers`, `slip_no`, `mofa_no`, `is_enabled`, `is_complete`, `is_agent_purchased`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-05-22', '2025-06-16', 'Held-Up TBIL:1.8', '1:Center-1:c-1|2:Center-2:c-2|4:Center-4:c-4|5:Center-5:c-5', NULL, NULL, 1, 1, 1, 6, '2025-05-27 07:34:50', '2025-05-27 07:37:44'),
(2, 1, 2, NULL, '2025-06-16', NULL, NULL, NULL, NULL, 1, 1, 1, 10, '2025-05-27 07:34:50', '2025-05-27 07:48:02'),
(3, 1, 3, NULL, '2025-06-16', NULL, NULL, NULL, NULL, 1, 1, 1, 16, '2025-05-27 07:34:50', '2025-05-29 15:37:26'),
(4, 1, 4, NULL, '2025-07-22', NULL, NULL, NULL, NULL, 1, 0, 1, 17, '2025-05-27 07:34:50', '2025-05-29 15:37:26'),
(5, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-05-27 07:34:50', '2025-05-27 07:35:11'),
(6, 2, 1, '2025-05-22', '2025-06-16', 'Auto FIT', '1:Center-1:c-1|2:Center-2:c-2|4:Center-4:c-4|5:Center-5:c-5', NULL, NULL, 1, 1, 1, 6, '2025-05-27 07:50:39', '2025-05-27 07:51:56'),
(7, 2, 2, NULL, '2025-06-16', NULL, NULL, NULL, NULL, 1, 1, 1, 10, '2025-05-27 07:50:39', '2025-05-27 07:52:41'),
(8, 2, 3, '2025-05-27', '2025-06-16', NULL, '4:Center-4:c-4', '92605202572693749', NULL, 1, 1, 1, 16, '2025-05-27 07:50:39', '2025-05-29 15:24:49'),
(9, 2, 4, NULL, '2025-07-21', NULL, '4:Center-4:c-4', NULL, NULL, 1, 0, 1, 17, '2025-05-27 07:50:39', '2025-05-29 15:24:49'),
(10, 2, 5, NULL, NULL, NULL, '4:Center-4:c-4', NULL, NULL, 0, 0, 1, 22, '2025-05-27 07:50:39', '2025-05-27 07:54:04'),
(11, 3, 1, '2025-04-16', '2025-05-11', 'CHEST X-RAY:Fibrosis With Calcification', '1:Center-1:c-1|4:Center-4:c-4', NULL, NULL, 1, 1, 1, 6, '2025-05-27 18:18:05', '2025-05-27 18:19:49'),
(12, 3, 2, NULL, '2025-05-11', NULL, NULL, NULL, NULL, 1, 1, 1, 10, '2025-05-27 18:18:05', '2025-05-27 18:20:50'),
(13, 3, 3, '2025-05-28', '2025-05-11', NULL, '6:Center-6:c-6', '91105202572354717', NULL, 1, 1, 1, 16, '2025-05-27 18:18:05', '2025-05-27 18:24:40'),
(14, 3, 4, '2025-05-28', '2025-07-07', NULL, '6:Center-6:c-6', NULL, 'E793661965', 1, 1, 1, 21, '2025-05-27 18:18:05', '2025-05-27 18:26:12'),
(15, 3, 5, '2025-05-28', NULL, NULL, '6:Center-6:c-6', NULL, NULL, 1, 1, 1, 26, '2025-05-27 18:18:05', '2025-05-27 18:26:35'),
(16, 4, 1, '2025-06-01', '2025-06-26', NULL, NULL, NULL, NULL, 1, 0, 1, 2, '2025-06-01 06:55:55', '2025-06-01 09:01:34'),
(17, 4, 2, NULL, '2025-06-26', NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-01 06:55:55', '2025-06-01 09:01:34'),
(18, 4, 3, NULL, '2025-06-26', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-01 06:55:55', '2025-06-01 09:01:34'),
(19, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-01 06:55:55', '2025-06-01 06:56:07'),
(20, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-01 06:55:55', '2025-06-01 06:56:07'),
(21, 5, 1, '2025-06-01', '2025-06-26', NULL, NULL, NULL, NULL, 1, 0, 1, 2, '2025-06-01 06:57:28', '2025-06-01 09:01:04'),
(22, 5, 2, NULL, '2025-06-26', NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-01 06:57:28', '2025-06-01 09:01:04'),
(23, 5, 3, NULL, '2025-06-26', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-01 06:57:28', '2025-06-01 09:01:04'),
(24, 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-01 06:57:28', '2025-06-01 06:57:32'),
(25, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-01 06:57:28', '2025-06-01 06:57:32'),
(26, 6, 1, '2025-06-01', '2025-06-26', NULL, NULL, NULL, NULL, 1, 0, 1, 2, '2025-06-01 07:35:29', '2025-06-01 09:00:52'),
(27, 6, 2, NULL, '2025-06-26', NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-01 07:35:29', '2025-06-01 09:00:52'),
(28, 6, 3, NULL, '2025-06-26', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-01 07:35:29', '2025-06-01 09:00:52'),
(29, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-01 07:35:29', '2025-06-01 08:53:24'),
(30, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-01 07:35:29', '2025-06-01 08:53:24'),
(31, 7, 1, '2025-06-01', '2025-06-26', NULL, NULL, NULL, NULL, 1, 0, 1, 2, '2025-06-01 07:39:13', '2025-06-01 09:00:36'),
(32, 7, 2, NULL, '2025-06-26', NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-01 07:39:13', '2025-06-01 09:00:36'),
(33, 7, 3, NULL, '2025-06-26', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-01 07:39:13', '2025-06-01 09:00:36'),
(34, 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-01 07:39:13', '2025-06-01 08:53:26'),
(35, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-01 07:39:13', '2025-06-01 08:53:26'),
(36, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-02 10:42:53', '2025-06-02 14:36:16'),
(37, 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-02 10:42:53', '2025-06-02 10:42:53'),
(38, 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-02 10:42:53', '2025-06-02 10:42:53'),
(39, 8, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-02 10:42:53', '2025-06-02 14:36:16'),
(40, 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-02 10:42:53', '2025-06-02 14:36:16'),
(41, 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-02 10:45:29', '2025-06-02 14:36:28'),
(42, 9, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-02 10:45:29', '2025-06-02 10:45:29'),
(43, 9, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-02 10:45:29', '2025-06-02 10:45:29'),
(44, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-02 10:45:29', '2025-06-02 14:36:28'),
(45, 9, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-02 10:45:29', '2025-06-02 14:36:28'),
(46, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-02 10:46:16', '2025-06-02 14:36:38'),
(47, 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-02 10:46:16', '2025-06-02 10:46:16'),
(48, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-02 10:46:16', '2025-06-02 10:46:16'),
(49, 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-02 10:46:16', '2025-06-02 14:36:38'),
(50, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-02 10:46:16', '2025-06-02 14:36:38'),
(51, 11, 1, '2025-06-02', '2025-06-27', NULL, NULL, NULL, NULL, 1, 0, 1, 3, '2025-06-02 10:47:17', '2025-06-09 13:22:15'),
(52, 11, 2, NULL, '2025-06-27', NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-02 10:47:17', '2025-06-09 11:50:53'),
(53, 11, 3, NULL, '2025-06-27', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-02 10:47:17', '2025-06-09 11:50:53'),
(54, 11, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-02 10:47:17', '2025-06-02 14:36:21'),
(55, 11, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-02 10:47:17', '2025-06-02 14:36:21'),
(56, 12, 1, '2025-06-02', '2025-06-27', NULL, NULL, NULL, NULL, 1, 0, 1, 3, '2025-06-02 10:50:22', '2025-06-09 13:21:41'),
(57, 12, 2, NULL, '2025-06-27', NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-02 10:50:22', '2025-06-09 11:50:00'),
(58, 12, 3, NULL, '2025-06-27', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-02 10:50:22', '2025-06-09 11:50:00'),
(59, 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-02 10:50:22', '2025-06-02 14:36:04'),
(60, 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-02 10:50:22', '2025-06-02 14:36:04'),
(61, 13, 1, '2025-05-06', '2025-05-31', 'Tumor in rt shoulder ,CHEST X-RAY:Scoliosis', '1:Center-1:c-1|6:Center-6:c-6|7:Center-7:c-7', NULL, NULL, 1, 1, 1, 6, '2025-06-09 11:54:45', '2025-06-09 11:57:26'),
(62, 13, 2, NULL, '2025-05-31', NULL, NULL, NULL, NULL, 1, 1, 1, 10, '2025-06-09 11:54:45', '2025-06-09 12:01:01'),
(63, 13, 3, '2025-06-09', '2025-05-31', NULL, '6:Center-6:c-6', '91805202572503396', NULL, 1, 1, 1, 16, '2025-06-09 11:54:45', '2025-06-09 12:06:02'),
(64, 13, 4, NULL, '2025-07-14', NULL, '6:Center-6:c-6', NULL, NULL, 1, 0, 1, 17, '2025-06-09 11:54:45', '2025-06-09 12:06:02'),
(65, 13, 5, NULL, NULL, NULL, '6:Center-6:c-6', NULL, NULL, 0, 0, 1, 22, '2025-06-09 11:54:45', '2025-06-09 12:04:00'),
(66, 14, 1, '2025-05-14', '2025-06-08', 'Auto FIT', '1:Center-1:c-1|2:Center-2:c-2|4:Center-4:c-4|5:Center-5:c-5|6:Center-6:c-6', NULL, NULL, 1, 1, 1, 6, '2025-06-09 12:08:02', '2025-06-09 12:11:48'),
(67, 14, 2, NULL, '2025-06-08', NULL, NULL, NULL, NULL, 1, 1, 1, 10, '2025-06-09 12:08:02', '2025-06-09 12:13:34'),
(68, 14, 3, '2025-06-09', '2025-06-08', NULL, '6:Center-6:c-6', '92105202572585442', NULL, 1, 1, 1, 16, '2025-06-09 12:08:02', '2025-06-09 12:17:18'),
(69, 14, 4, NULL, '2025-07-21', NULL, '6:Center-6:c-6', NULL, NULL, 1, 0, 1, 17, '2025-06-09 12:08:02', '2025-06-09 12:17:18'),
(70, 14, 5, NULL, NULL, NULL, '6:Center-6:c-6', NULL, NULL, 0, 0, 1, 22, '2025-06-09 12:08:02', '2025-06-09 12:15:37'),
(71, 15, 1, '2025-05-25', '2025-06-19', 'Auto FIT', '1:Center-1:c-1|2:Center-2:c-2|4:Center-4:c-4|5:Center-5:c-5|6:Center-6:c-6', NULL, NULL, 1, 1, 1, 6, '2025-06-09 12:21:08', '2025-06-09 12:24:01'),
(72, 15, 2, NULL, '2025-06-19', NULL, NULL, NULL, NULL, 1, 1, 1, 10, '2025-06-09 12:21:08', '2025-06-09 12:25:18'),
(73, 15, 3, '2025-06-09', '2025-06-19', NULL, '6:Center-6:c-6', '93005202572767950', NULL, 1, 1, 1, 16, '2025-06-09 12:21:08', '2025-06-09 12:28:18'),
(74, 15, 4, NULL, '2025-07-25', NULL, '6:Center-6:c-6', NULL, NULL, 1, 0, 1, 17, '2025-06-09 12:21:08', '2025-06-09 12:28:18'),
(75, 15, 5, NULL, NULL, NULL, '6:Center-6:c-6', NULL, NULL, 0, 0, 1, 22, '2025-06-09 12:21:08', '2025-06-09 12:26:59'),
(76, 16, 1, '2025-05-25', '2025-06-19', NULL, NULL, NULL, NULL, 1, 0, 1, 3, '2025-06-09 12:31:27', '2025-06-09 12:33:36'),
(77, 16, 2, NULL, '2025-06-19', NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-09 12:31:27', '2025-06-09 12:32:06'),
(78, 16, 3, NULL, '2025-06-19', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-09 12:31:27', '2025-06-09 12:32:06'),
(79, 16, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-09 12:31:27', '2025-06-09 12:31:36'),
(80, 16, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-09 12:31:27', '2025-06-09 12:31:36'),
(81, 17, 1, '2025-05-25', '2025-06-19', 'Infected psoriasis', '1:Center-1:c-1|6:Center-6:c-6', NULL, NULL, 1, 1, 1, 6, '2025-06-09 12:35:40', '2025-06-09 12:38:05'),
(82, 17, 2, '2025-06-09', '2025-06-19', NULL, NULL, NULL, NULL, 1, 1, 1, 10, '2025-06-09 12:35:40', '2025-06-09 12:48:41'),
(83, 17, 3, '2025-06-09', '2025-06-19', NULL, '6:Center-6:c-6', '93005202572768036', NULL, 1, 1, 1, 16, '2025-06-09 12:35:40', '2025-06-09 12:51:52'),
(84, 17, 4, NULL, '2025-07-25', NULL, '6:Center-6:c-6', NULL, NULL, 1, 0, 1, 17, '2025-06-09 12:35:40', '2025-06-09 12:51:52'),
(85, 17, 5, NULL, NULL, NULL, '6:Center-6:c-6', NULL, NULL, 0, 0, 1, 22, '2025-06-09 12:35:40', '2025-06-09 12:50:41'),
(86, 18, 1, '2025-05-25', '2025-06-19', 'Auto FIT', '1:Center-1:c-1|2:Center-2:c-2|4:Center-4:c-4|5:Center-5:c-5|6:Center-6:c-6', NULL, NULL, 1, 1, 1, 6, '2025-06-09 12:53:33', '2025-06-09 12:55:07'),
(87, 18, 2, NULL, '2025-06-19', NULL, NULL, NULL, NULL, 1, 1, 1, 10, '2025-06-09 12:53:33', '2025-06-09 12:56:35'),
(88, 18, 3, '2025-06-09', '2025-06-19', NULL, '6:Center-6:c-6', '93005202572767979', NULL, 1, 1, 1, 16, '2025-06-09 12:53:33', '2025-06-09 12:59:23'),
(89, 18, 4, NULL, '2025-07-27', NULL, '6:Center-6:c-6', NULL, NULL, 1, 0, 1, 17, '2025-06-09 12:53:33', '2025-06-09 12:59:23'),
(90, 18, 5, NULL, NULL, NULL, '6:Center-6:c-6', NULL, NULL, 0, 0, 1, 22, '2025-06-09 12:53:33', '2025-06-09 12:58:33'),
(91, 19, 1, '2025-05-26', '2025-06-20', 'CHEST X-RAY:Calcification', '1:Center-1:c-1|2:Center-2:c-2|4:Center-4:c-4|5:Center-5:c-5|6:Center-6:c-6', NULL, NULL, 1, 1, 1, 6, '2025-06-09 13:03:47', '2025-06-09 13:06:33'),
(92, 19, 2, NULL, '2025-06-20', NULL, NULL, NULL, NULL, 1, 1, 1, 10, '2025-06-09 13:03:47', '2025-06-09 13:09:39'),
(93, 19, 3, '2025-06-09', '2025-06-20', NULL, '6:Center-6:c-6', '93005202572768008', NULL, 1, 1, 1, 16, '2025-06-09 13:03:47', '2025-06-09 13:12:36'),
(94, 19, 4, NULL, '2025-07-28', NULL, '6:Center-6:c-6', NULL, NULL, 1, 0, 1, 17, '2025-06-09 13:03:47', '2025-06-09 13:12:36'),
(95, 19, 5, NULL, NULL, NULL, '6:Center-6:c-6', NULL, NULL, 0, 0, 1, 22, '2025-06-09 13:03:47', '2025-06-09 13:11:12'),
(96, 20, 1, '2025-05-26', '2025-06-20', 'CHEST X-RAY:Left Hilar Calcification', '1:Center-1:c-1|2:Center-2:c-2|4:Center-4:c-4|5:Center-5:c-5|6:Center-6:c-6', NULL, NULL, 1, 1, 1, 6, '2025-06-09 13:14:20', '2025-06-09 13:16:40'),
(97, 20, 2, NULL, '2025-06-20', NULL, NULL, NULL, NULL, 1, 1, 1, 10, '2025-06-09 13:14:20', '2025-06-09 13:17:42'),
(98, 20, 3, '2025-06-09', '2025-06-20', NULL, '6:Center-6:c-6', '93105202572783329', NULL, 1, 1, 1, 16, '2025-06-09 13:14:20', '2025-06-09 13:19:38'),
(99, 20, 4, NULL, '2025-07-27', NULL, '6:Center-6:c-6', NULL, NULL, 1, 0, 1, 17, '2025-06-09 13:14:20', '2025-06-09 13:19:38'),
(100, 20, 5, NULL, NULL, NULL, '6:Center-6:c-6', NULL, NULL, 0, 0, 1, 22, '2025-06-09 13:14:20', '2025-06-09 13:19:01'),
(101, 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:01:10', '2025-06-15 05:09:41'),
(102, 21, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:01:10', '2025-06-15 05:01:10'),
(103, 21, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:01:10', '2025-06-15 05:01:10'),
(104, 21, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:01:10', '2025-06-15 05:09:41'),
(105, 21, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:01:10', '2025-06-15 05:09:41'),
(106, 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:03:21', '2025-06-15 05:09:43'),
(107, 22, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:03:21', '2025-06-15 05:03:21'),
(108, 22, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:03:21', '2025-06-15 05:03:21'),
(109, 22, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:03:21', '2025-06-15 05:09:43'),
(110, 22, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:03:21', '2025-06-15 05:09:43'),
(111, 23, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:05:14', '2025-06-15 05:10:15'),
(112, 23, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:05:14', '2025-06-15 05:05:14'),
(113, 23, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:05:14', '2025-06-15 05:05:14'),
(114, 23, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:05:14', '2025-06-15 05:10:15'),
(115, 23, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:05:14', '2025-06-15 05:10:15'),
(116, 24, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:06:38', '2025-06-15 05:10:10'),
(117, 24, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:06:38', '2025-06-15 05:06:38'),
(118, 24, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:06:38', '2025-06-15 05:06:38'),
(119, 24, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:06:38', '2025-06-15 05:10:10'),
(120, 24, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:06:38', '2025-06-15 05:10:10'),
(121, 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:07:45', '2025-06-15 05:09:58'),
(122, 25, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:07:45', '2025-06-15 05:07:45'),
(123, 25, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:07:45', '2025-06-15 05:07:45'),
(124, 25, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:07:45', '2025-06-15 05:09:58'),
(125, 25, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:07:45', '2025-06-15 05:09:58'),
(126, 26, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:09:36', '2025-06-15 05:09:47'),
(127, 26, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:09:36', '2025-06-15 05:09:36'),
(128, 26, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:09:36', '2025-06-15 05:09:36'),
(129, 26, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:09:36', '2025-06-15 05:09:47'),
(130, 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:09:36', '2025-06-15 05:09:47'),
(131, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:15:01', '2025-06-15 07:54:10'),
(132, 27, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:15:01', '2025-06-15 05:15:01'),
(133, 27, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:15:01', '2025-06-15 05:15:01'),
(134, 27, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:15:01', '2025-06-15 07:54:10'),
(135, 27, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:15:01', '2025-06-15 07:54:10'),
(136, 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:16:03', '2025-06-15 07:53:59'),
(137, 28, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:16:03', '2025-06-15 05:16:03'),
(138, 28, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:16:03', '2025-06-15 05:16:03'),
(139, 28, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:16:03', '2025-06-15 07:53:59'),
(140, 28, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:16:03', '2025-06-15 07:53:59'),
(141, 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:18:39', '2025-06-15 07:53:53'),
(142, 29, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:18:39', '2025-06-15 05:18:39'),
(143, 29, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:18:39', '2025-06-15 05:18:39'),
(144, 29, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:18:39', '2025-06-15 07:53:53'),
(145, 29, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:18:39', '2025-06-15 07:53:53'),
(146, 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:19:40', '2025-06-15 07:53:43'),
(147, 30, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:19:40', '2025-06-15 05:19:40'),
(148, 30, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:19:40', '2025-06-15 05:19:40'),
(149, 30, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:19:40', '2025-06-15 07:53:43'),
(150, 30, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:19:40', '2025-06-15 07:53:43'),
(151, 31, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:21:15', '2025-06-15 07:53:31'),
(152, 31, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:21:15', '2025-06-15 05:21:15'),
(153, 31, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:21:15', '2025-06-15 05:21:15'),
(154, 31, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:21:15', '2025-06-15 07:53:31'),
(155, 31, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:21:15', '2025-06-15 07:53:31'),
(156, 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:22:46', '2025-06-15 07:53:24'),
(157, 32, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:22:46', '2025-06-15 05:22:46'),
(158, 32, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:22:46', '2025-06-15 05:22:46'),
(159, 32, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:22:46', '2025-06-15 07:53:24'),
(160, 32, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:22:46', '2025-06-15 07:53:24'),
(161, 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:24:29', '2025-06-15 07:53:15'),
(162, 33, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:24:29', '2025-06-15 05:24:29'),
(163, 33, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:24:29', '2025-06-15 05:24:29'),
(164, 33, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:24:29', '2025-06-15 07:53:15'),
(165, 33, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:24:29', '2025-06-15 07:53:15'),
(166, 34, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:25:32', '2025-06-15 07:53:04'),
(167, 34, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:25:32', '2025-06-15 05:25:32'),
(168, 34, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:25:32', '2025-06-15 05:25:32'),
(169, 34, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:25:32', '2025-06-15 07:53:04'),
(170, 34, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:25:32', '2025-06-15 07:53:04'),
(171, 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 05:26:56', '2025-06-15 07:52:34'),
(172, 35, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 05:26:56', '2025-06-15 05:26:56'),
(173, 35, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 05:26:56', '2025-06-15 05:26:56'),
(174, 35, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 05:26:56', '2025-06-15 07:52:34'),
(175, 35, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 05:26:56', '2025-06-15 07:52:34'),
(176, 36, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 09:10:41', '2025-06-15 12:02:52'),
(177, 36, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 09:10:41', '2025-06-15 09:10:41'),
(178, 36, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 09:10:41', '2025-06-15 09:10:41'),
(179, 36, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 09:10:41', '2025-06-15 12:02:52'),
(180, 36, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 09:10:41', '2025-06-15 12:02:52'),
(181, 37, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 09:12:52', '2025-06-15 12:02:44'),
(182, 37, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 09:12:52', '2025-06-15 09:12:52'),
(183, 37, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 09:12:52', '2025-06-15 09:12:52'),
(184, 37, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 09:12:52', '2025-06-15 12:02:44'),
(185, 37, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 09:12:52', '2025-06-15 12:02:44'),
(186, 38, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 09:13:55', '2025-06-15 12:02:17'),
(187, 38, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 09:13:55', '2025-06-15 09:13:55'),
(188, 38, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 09:13:55', '2025-06-15 09:13:55'),
(189, 38, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 09:13:55', '2025-06-15 12:02:17'),
(190, 38, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 09:13:55', '2025-06-15 12:02:17'),
(191, 39, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 09:30:51', '2025-06-15 12:02:08'),
(192, 39, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 09:30:51', '2025-06-15 09:30:51'),
(193, 39, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 09:30:51', '2025-06-15 09:30:51'),
(194, 39, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 09:30:51', '2025-06-15 12:02:08'),
(195, 39, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 09:30:51', '2025-06-15 12:02:08'),
(196, 40, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 09:33:19', '2025-06-15 09:56:02'),
(197, 40, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 09:33:19', '2025-06-15 09:33:19'),
(198, 40, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 09:33:19', '2025-06-15 09:33:19'),
(199, 40, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 09:33:19', '2025-06-15 09:56:02'),
(200, 40, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 09:33:19', '2025-06-15 09:56:02'),
(201, 41, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 09:56:38', '2025-06-15 12:01:46'),
(202, 41, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 09:56:38', '2025-06-15 09:56:38'),
(203, 41, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 09:56:38', '2025-06-15 09:56:38'),
(204, 41, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 09:56:38', '2025-06-15 12:01:46'),
(205, 41, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 09:56:38', '2025-06-15 12:01:46'),
(206, 42, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 09:58:08', '2025-06-15 12:01:36'),
(207, 42, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 09:58:08', '2025-06-15 09:58:08'),
(208, 42, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 09:58:08', '2025-06-15 09:58:08'),
(209, 42, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 09:58:08', '2025-06-15 12:01:36'),
(210, 42, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 09:58:08', '2025-06-15 12:01:36'),
(211, 43, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 09:59:19', '2025-06-15 12:01:29'),
(212, 43, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 09:59:19', '2025-06-15 09:59:19'),
(213, 43, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 09:59:19', '2025-06-15 09:59:19'),
(214, 43, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 09:59:19', '2025-06-15 12:01:29'),
(215, 43, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 09:59:19', '2025-06-15 12:01:29'),
(216, 44, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:06:59', '2025-06-15 12:01:23'),
(217, 44, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:06:59', '2025-06-15 10:06:59'),
(218, 44, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:06:59', '2025-06-15 10:06:59'),
(219, 44, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:06:59', '2025-06-15 12:01:23'),
(220, 44, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:06:59', '2025-06-15 12:01:23'),
(221, 45, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:08:59', '2025-06-15 12:01:15'),
(222, 45, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:08:59', '2025-06-15 10:08:59'),
(223, 45, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:08:59', '2025-06-15 10:08:59'),
(224, 45, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:08:59', '2025-06-15 12:01:15'),
(225, 45, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:08:59', '2025-06-15 12:01:15'),
(226, 46, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:09:51', '2025-06-15 12:01:08'),
(227, 46, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:09:51', '2025-06-15 10:09:51'),
(228, 46, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:09:51', '2025-06-15 10:09:51'),
(229, 46, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:09:51', '2025-06-15 12:01:08'),
(230, 46, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:09:51', '2025-06-15 12:01:08'),
(231, 47, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:13:25', '2025-06-15 12:00:23'),
(232, 47, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:13:25', '2025-06-15 10:13:25'),
(233, 47, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:13:25', '2025-06-15 10:13:25'),
(234, 47, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:13:25', '2025-06-15 12:00:23'),
(235, 47, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:13:25', '2025-06-15 12:00:23'),
(236, 48, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:15:18', '2025-06-15 12:00:16'),
(237, 48, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:15:18', '2025-06-15 10:15:18'),
(238, 48, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:15:18', '2025-06-15 10:15:18'),
(239, 48, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:15:18', '2025-06-15 12:00:16'),
(240, 48, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:15:18', '2025-06-15 12:00:16'),
(241, 49, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:16:25', '2025-06-15 12:00:10'),
(242, 49, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:16:25', '2025-06-15 10:16:25'),
(243, 49, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:16:25', '2025-06-15 10:16:25'),
(244, 49, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:16:25', '2025-06-15 12:00:10'),
(245, 49, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:16:25', '2025-06-15 12:00:10'),
(246, 50, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:17:17', '2025-06-15 12:00:03'),
(247, 50, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:17:17', '2025-06-15 10:17:17'),
(248, 50, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:17:17', '2025-06-15 10:17:17'),
(249, 50, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:17:17', '2025-06-15 12:00:03'),
(250, 50, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:17:17', '2025-06-15 12:00:03'),
(251, 51, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:18:19', '2025-06-15 11:59:58'),
(252, 51, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:18:19', '2025-06-15 10:18:19'),
(253, 51, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:18:19', '2025-06-15 10:18:19'),
(254, 51, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:18:19', '2025-06-15 11:59:58'),
(255, 51, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:18:19', '2025-06-15 11:59:58'),
(256, 52, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:19:20', '2025-06-15 11:59:53'),
(257, 52, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:19:20', '2025-06-15 10:19:20'),
(258, 52, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:19:20', '2025-06-15 10:19:20'),
(259, 52, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:19:20', '2025-06-15 11:59:53'),
(260, 52, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:19:20', '2025-06-15 11:59:53'),
(261, 53, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:20:50', '2025-06-15 11:59:42'),
(262, 53, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:20:50', '2025-06-15 10:20:50'),
(263, 53, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:20:50', '2025-06-15 10:20:50'),
(264, 53, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:20:50', '2025-06-15 11:59:42'),
(265, 53, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:20:50', '2025-06-15 11:59:42'),
(266, 54, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:22:37', '2025-06-15 11:59:38'),
(267, 54, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:22:37', '2025-06-15 10:22:37'),
(268, 54, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:22:37', '2025-06-15 10:22:37'),
(269, 54, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:22:37', '2025-06-15 11:59:38'),
(270, 54, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:22:37', '2025-06-15 11:59:38'),
(271, 55, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:24:14', '2025-06-15 11:59:30'),
(272, 55, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:24:14', '2025-06-15 10:24:14'),
(273, 55, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:24:14', '2025-06-15 10:24:14'),
(274, 55, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:24:14', '2025-06-15 11:59:30'),
(275, 55, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:24:14', '2025-06-15 11:59:30'),
(276, 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:25:02', '2025-06-15 11:59:25'),
(277, 56, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:25:02', '2025-06-15 10:25:02'),
(278, 56, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:25:02', '2025-06-15 10:25:02'),
(279, 56, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:25:02', '2025-06-15 11:59:25'),
(280, 56, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:25:02', '2025-06-15 11:59:25'),
(281, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:29:20', '2025-06-15 11:59:20'),
(282, 57, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:29:20', '2025-06-15 10:29:20'),
(283, 57, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:29:20', '2025-06-15 10:29:20'),
(284, 57, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:29:20', '2025-06-15 11:59:18'),
(285, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:29:20', '2025-06-15 11:59:18'),
(286, 58, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:30:19', '2025-06-15 11:59:16'),
(287, 58, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:30:19', '2025-06-15 10:30:19'),
(288, 58, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:30:19', '2025-06-15 10:30:19'),
(289, 58, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:30:19', '2025-06-15 11:59:16'),
(290, 58, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:30:19', '2025-06-15 11:59:16'),
(291, 59, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:31:56', '2025-06-15 11:59:14'),
(292, 59, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:31:56', '2025-06-15 10:31:56'),
(293, 59, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:31:56', '2025-06-15 10:31:56'),
(294, 59, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:31:56', '2025-06-15 11:59:12'),
(295, 59, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:31:56', '2025-06-15 11:59:12'),
(296, 60, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:33:27', '2025-06-15 11:59:09'),
(297, 60, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:33:27', '2025-06-15 10:33:27'),
(298, 60, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:33:27', '2025-06-15 10:33:27'),
(299, 60, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:33:27', '2025-06-15 11:59:07'),
(300, 60, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:33:27', '2025-06-15 11:59:07'),
(301, 61, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:34:30', '2025-06-15 11:59:05'),
(302, 61, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:34:30', '2025-06-15 10:34:30'),
(303, 61, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:34:30', '2025-06-15 10:34:30'),
(304, 61, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:34:30', '2025-06-15 11:59:04'),
(305, 61, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:34:30', '2025-06-15 11:59:04'),
(306, 62, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:35:42', '2025-06-15 11:59:01'),
(307, 62, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:35:42', '2025-06-15 10:35:42'),
(308, 62, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:35:42', '2025-06-15 10:35:42'),
(309, 62, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:35:42', '2025-06-15 11:58:59'),
(310, 62, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:35:42', '2025-06-15 11:58:59'),
(311, 63, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:36:48', '2025-06-15 11:58:55'),
(312, 63, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:36:48', '2025-06-15 10:36:48'),
(313, 63, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:36:48', '2025-06-15 10:36:48'),
(314, 63, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:36:48', '2025-06-15 11:58:54'),
(315, 63, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:36:48', '2025-06-15 11:58:54'),
(316, 64, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:38:24', '2025-06-15 11:58:51'),
(317, 64, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:38:24', '2025-06-15 10:38:24'),
(318, 64, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:38:24', '2025-06-15 10:38:24'),
(319, 64, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:38:24', '2025-06-15 11:58:49'),
(320, 64, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:38:24', '2025-06-15 11:58:49'),
(321, 65, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:39:28', '2025-06-15 11:58:46'),
(322, 65, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:39:28', '2025-06-15 10:39:28'),
(323, 65, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:39:28', '2025-06-15 10:39:28'),
(324, 65, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:39:28', '2025-06-15 11:58:44'),
(325, 65, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:39:28', '2025-06-15 11:58:44'),
(326, 66, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:41:13', '2025-06-15 11:58:41'),
(327, 66, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:41:13', '2025-06-15 10:41:13'),
(328, 66, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:41:13', '2025-06-15 10:41:13'),
(329, 66, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:41:13', '2025-06-15 11:58:40'),
(330, 66, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:41:13', '2025-06-15 11:58:40'),
(331, 67, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:42:13', '2025-06-15 11:58:36'),
(332, 67, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:42:13', '2025-06-15 10:42:13'),
(333, 67, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:42:13', '2025-06-15 10:42:13'),
(334, 67, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:42:13', '2025-06-15 11:58:34'),
(335, 67, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:42:13', '2025-06-15 11:58:34'),
(336, 68, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:43:07', '2025-06-15 11:58:29'),
(337, 68, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:43:07', '2025-06-15 10:43:07'),
(338, 68, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:43:07', '2025-06-15 10:43:07'),
(339, 68, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:43:07', '2025-06-15 11:58:28'),
(340, 68, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:43:07', '2025-06-15 11:58:28'),
(341, 69, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:44:30', '2025-06-15 11:58:26'),
(342, 69, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:44:30', '2025-06-15 10:44:30'),
(343, 69, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:44:30', '2025-06-15 10:44:30'),
(344, 69, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:44:30', '2025-06-15 11:58:24'),
(345, 69, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:44:30', '2025-06-15 11:58:24'),
(346, 70, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:45:30', '2025-06-15 11:58:19'),
(347, 70, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:45:30', '2025-06-15 10:45:30'),
(348, 70, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:45:30', '2025-06-15 10:45:30'),
(349, 70, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:45:30', '2025-06-15 11:58:18'),
(350, 70, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:45:30', '2025-06-15 11:58:18'),
(351, 71, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:46:12', '2025-06-15 11:58:15'),
(352, 71, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:46:12', '2025-06-15 10:46:12'),
(353, 71, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:46:12', '2025-06-15 10:46:12'),
(354, 71, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:46:12', '2025-06-15 11:58:13'),
(355, 71, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:46:12', '2025-06-15 11:58:13'),
(356, 72, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:48:33', '2025-06-15 11:58:11'),
(357, 72, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:48:33', '2025-06-15 10:48:33'),
(358, 72, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:48:33', '2025-06-15 10:48:33'),
(359, 72, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:48:33', '2025-06-15 11:58:09'),
(360, 72, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:48:33', '2025-06-15 11:58:09'),
(361, 73, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:49:38', '2025-06-15 11:58:06'),
(362, 73, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:49:38', '2025-06-15 10:49:38'),
(363, 73, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:49:38', '2025-06-15 10:49:38'),
(364, 73, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:49:38', '2025-06-15 11:58:06'),
(365, 73, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:49:38', '2025-06-15 11:58:06'),
(366, 74, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:50:42', '2025-06-15 11:58:03'),
(367, 74, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:50:42', '2025-06-15 10:50:42'),
(368, 74, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:50:42', '2025-06-15 10:50:42'),
(369, 74, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:50:42', '2025-06-15 11:58:01'),
(370, 74, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:50:42', '2025-06-15 11:58:01'),
(371, 75, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:52:34', '2025-06-15 11:57:58'),
(372, 75, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:52:34', '2025-06-15 10:52:34'),
(373, 75, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:52:34', '2025-06-15 10:52:34'),
(374, 75, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:52:34', '2025-06-15 11:57:56'),
(375, 75, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:52:34', '2025-06-15 11:57:56'),
(376, 76, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:53:28', '2025-06-15 11:57:53'),
(377, 76, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:53:28', '2025-06-15 10:53:28'),
(378, 76, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:53:28', '2025-06-15 10:53:28'),
(379, 76, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:53:28', '2025-06-15 11:57:51'),
(380, 76, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:53:28', '2025-06-15 11:57:51'),
(381, 77, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 10:54:12', '2025-06-15 11:57:47'),
(382, 77, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:54:12', '2025-06-15 10:54:12'),
(383, 77, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:54:12', '2025-06-15 10:54:12'),
(384, 77, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:54:12', '2025-06-15 11:57:47'),
(385, 77, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:54:12', '2025-06-15 11:57:47'),
(386, 78, 1, '2025-04-16', '2025-05-11', 'H/o Fructure in rt hand ,CHEST X-RAY:Fibrosis With Calcification', '1:Center-1:c-1', NULL, NULL, 1, 1, 1, 6, '2025-06-15 10:54:58', '2025-06-15 11:36:57'),
(387, 78, 2, NULL, '2025-05-11', NULL, NULL, NULL, NULL, 1, 0, 1, 7, '2025-06-15 10:54:58', '2025-06-15 11:38:02'),
(388, 78, 3, NULL, '2025-05-11', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:54:58', '2025-06-15 11:34:32'),
(389, 78, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:54:58', '2025-06-15 11:33:21'),
(390, 78, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:54:58', '2025-06-15 11:33:21'),
(391, 79, 1, '2025-04-16', '2025-05-11', NULL, NULL, NULL, NULL, 1, 0, 1, 2, '2025-06-15 10:56:19', '2025-06-15 17:41:52'),
(392, 79, 2, NULL, '2025-05-11', NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 10:56:19', '2025-06-15 17:44:23'),
(393, 79, 3, NULL, '2025-05-11', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 10:56:19', '2025-06-15 17:44:23'),
(394, 79, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 10:56:19', '2025-06-15 11:33:06'),
(395, 79, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 10:56:19', '2025-06-15 11:33:06'),
(396, 80, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 11:01:56', '2025-06-15 11:57:43'),
(397, 80, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 11:01:56', '2025-06-15 11:01:56'),
(398, 80, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 11:01:56', '2025-06-15 11:01:56'),
(399, 80, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 11:01:56', '2025-06-15 11:57:43'),
(400, 80, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 11:01:56', '2025-06-15 11:57:43'),
(401, 81, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 11:03:15', '2025-06-15 11:57:41'),
(402, 81, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 11:03:15', '2025-06-15 11:03:15'),
(403, 81, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 11:03:15', '2025-06-15 11:03:15'),
(404, 81, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 11:03:15', '2025-06-15 11:57:39'),
(405, 81, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 11:03:15', '2025-06-15 11:57:39'),
(406, 82, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 11:04:35', '2025-06-15 11:57:36'),
(407, 82, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 11:04:35', '2025-06-15 11:04:35'),
(408, 82, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 11:04:35', '2025-06-15 11:04:35'),
(409, 82, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 11:04:35', '2025-06-15 11:57:34'),
(410, 82, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 11:04:35', '2025-06-15 11:57:34'),
(411, 83, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 11:05:13', '2025-06-15 11:57:31'),
(412, 83, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 11:05:13', '2025-06-15 11:05:13'),
(413, 83, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 11:05:13', '2025-06-15 11:05:13'),
(414, 83, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 11:05:13', '2025-06-15 11:57:29'),
(415, 83, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 11:05:13', '2025-06-15 11:57:29'),
(416, 84, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 11:06:16', '2025-06-15 11:57:24'),
(417, 84, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 11:06:16', '2025-06-15 11:06:16'),
(418, 84, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 11:06:16', '2025-06-15 11:06:16'),
(419, 84, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 11:06:16', '2025-06-15 11:57:24'),
(420, 84, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 11:06:16', '2025-06-15 11:57:24'),
(421, 85, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-15 11:07:49', '2025-06-15 11:57:18'),
(422, 85, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-15 11:07:49', '2025-06-15 11:07:49'),
(423, 85, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-15 11:07:49', '2025-06-15 11:07:49'),
(424, 85, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-15 11:07:49', '2025-06-15 11:57:18'),
(425, 85, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-15 11:07:49', '2025-06-15 11:57:18'),
(426, 86, 1, '2025-06-16', '2025-07-11', NULL, NULL, NULL, NULL, 1, 0, 1, 2, '2025-06-16 14:15:38', '2025-06-16 14:15:56'),
(427, 86, 2, NULL, '2025-07-11', NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-16 14:15:38', '2025-06-16 14:15:56'),
(428, 86, 3, NULL, '2025-07-11', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-16 14:15:38', '2025-06-16 14:15:56'),
(429, 86, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-16 14:15:38', '2025-06-16 14:15:43'),
(430, 86, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-16 14:15:38', '2025-06-16 14:15:43'),
(431, 87, 1, '2025-06-16', '2025-07-11', NULL, NULL, NULL, NULL, 1, 0, 1, 2, '2025-06-16 14:16:56', '2025-06-16 14:17:09'),
(432, 87, 2, NULL, '2025-07-11', NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-16 14:16:56', '2025-06-16 14:17:09'),
(433, 87, 3, NULL, '2025-07-11', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-16 14:16:56', '2025-06-16 14:17:09'),
(434, 87, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-16 14:16:56', '2025-06-16 14:17:01'),
(435, 87, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-16 14:16:56', '2025-06-16 14:17:01'),
(436, 88, 1, '2025-06-16', '2025-07-11', NULL, NULL, NULL, NULL, 1, 0, 1, 2, '2025-06-16 14:18:02', '2025-06-16 14:18:16'),
(437, 88, 2, NULL, '2025-07-11', NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-16 14:18:02', '2025-06-16 14:18:16'),
(438, 88, 3, NULL, '2025-07-11', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-16 14:18:02', '2025-06-16 14:18:16'),
(439, 88, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-16 14:18:02', '2025-06-16 14:18:08'),
(440, 88, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-16 14:18:02', '2025-06-16 14:18:08'),
(441, 89, 1, '2025-06-16', '2025-07-11', NULL, NULL, NULL, NULL, 1, 0, 1, 2, '2025-06-16 14:19:12', '2025-06-16 14:19:25'),
(442, 89, 2, NULL, '2025-07-11', NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-16 14:19:12', '2025-06-16 14:19:25'),
(443, 89, 3, NULL, '2025-07-11', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-16 14:19:12', '2025-06-16 14:19:25'),
(444, 89, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-16 14:19:12', '2025-06-16 14:19:17'),
(445, 89, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-16 14:19:12', '2025-06-16 14:19:17'),
(446, 90, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2025-06-17 04:18:38', '2025-06-17 04:18:38'),
(447, 90, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-17 04:18:38', '2025-06-17 04:18:38');
INSERT INTO `job_service_records` (`id`, `job_id`, `item_id`, `entry_date`, `expire_date`, `remarks`, `medical_centers`, `slip_no`, `mofa_no`, `is_enabled`, `is_complete`, `is_agent_purchased`, `status_id`, `created_at`, `updated_at`) VALUES
(448, 90, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-17 04:18:38', '2025-06-17 04:18:38'),
(449, 90, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 17, '2025-06-17 04:18:38', '2025-06-17 04:18:38'),
(450, 90, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 22, '2025-06-17 04:18:38', '2025-06-17 04:18:38'),
(451, 91, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2025-06-17 04:22:06', '2025-06-17 04:22:06'),
(452, 91, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-17 04:22:06', '2025-06-17 04:22:06'),
(453, 91, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-17 04:22:06', '2025-06-17 04:22:06'),
(454, 91, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 17, '2025-06-17 04:22:06', '2025-06-17 04:22:06'),
(455, 91, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 22, '2025-06-17 04:22:06', '2025-06-17 04:22:06'),
(456, 92, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2025-06-17 04:23:08', '2025-06-17 04:23:08'),
(457, 92, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-17 04:23:08', '2025-06-17 04:23:08'),
(458, 92, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-17 04:23:08', '2025-06-17 04:23:08'),
(459, 92, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 17, '2025-06-17 04:23:08', '2025-06-17 04:23:08'),
(460, 92, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 22, '2025-06-17 04:23:08', '2025-06-17 04:23:08'),
(461, 93, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1, '2025-06-17 04:24:12', '2025-06-17 06:49:21'),
(462, 93, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-17 04:24:12', '2025-06-17 04:24:12'),
(463, 93, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-17 04:24:12', '2025-06-17 04:24:12'),
(464, 93, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-17 04:24:12', '2025-06-17 06:49:21'),
(465, 93, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-17 04:24:12', '2025-06-17 06:49:21'),
(466, 94, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2025-06-17 06:05:55', '2025-06-17 06:05:55'),
(467, 94, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-17 06:05:55', '2025-06-17 06:05:55'),
(468, 94, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-17 06:05:55', '2025-06-17 06:05:55'),
(469, 94, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 17, '2025-06-17 06:05:55', '2025-06-17 06:05:55'),
(470, 94, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 22, '2025-06-17 06:05:55', '2025-06-17 06:05:55'),
(471, 95, 1, '2025-06-15', '2025-07-10', 'L.Eye(D-Un):36 R.Eye(D-Un):36', '1:Center-1:c-1|10:Center-10:c-10|2:Center-2:c-2', NULL, NULL, 1, 1, 1, 6, '2025-06-17 06:07:34', '2025-06-18 08:49:50'),
(472, 95, 2, NULL, '2025-07-10', NULL, NULL, NULL, NULL, 1, 1, 1, 10, '2025-06-17 06:07:34', '2025-06-18 08:51:45'),
(473, 95, 3, '2025-06-18', '2025-07-10', NULL, '1:Center-1:c-1', '23456897655678', NULL, 1, 1, 1, 16, '2025-06-17 06:07:34', '2025-06-18 12:27:54'),
(474, 95, 4, '2025-06-18', '2025-08-12', NULL, '1:Center-1:c-1', NULL, '23456789', 1, 1, 1, 21, '2025-06-17 06:07:34', '2025-06-18 12:29:07'),
(475, 95, 5, '2025-06-18', NULL, NULL, '1:Center-1:c-1', NULL, NULL, 1, 0, 1, 23, '2025-06-17 06:07:34', '2025-06-18 12:29:29'),
(476, 96, 1, '2025-06-17', '2025-07-12', 'hjfjgfghdfgdf', '1:Center-1:c-1|10:Center-10:c-10|2:Center-2:c-2', NULL, NULL, 1, 1, 1, 6, '2025-06-17 06:27:39', '2025-06-17 06:33:13'),
(477, 96, 2, NULL, '2025-07-12', NULL, NULL, NULL, NULL, 1, 0, 0, 7, '2025-06-17 06:27:39', '2025-06-17 06:33:13'),
(478, 96, 3, NULL, '2025-07-12', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-17 06:27:39', '2025-06-17 06:32:07'),
(479, 96, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-17 06:27:39', '2025-06-17 06:29:29'),
(480, 96, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-17 06:27:39', '2025-06-17 06:29:29'),
(481, 97, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2025-06-17 06:52:13', '2025-06-17 06:52:13'),
(482, 97, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-17 06:52:13', '2025-06-17 06:52:13'),
(483, 97, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-17 06:52:13', '2025-06-17 06:52:13'),
(484, 97, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 17, '2025-06-17 06:52:13', '2025-06-17 06:52:13'),
(485, 97, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 22, '2025-06-17 06:52:13', '2025-06-17 06:52:13'),
(486, 98, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2025-06-17 10:57:53', '2025-06-17 10:57:53'),
(487, 98, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-17 10:57:53', '2025-06-17 10:57:53'),
(488, 98, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-17 10:57:53', '2025-06-17 10:57:53'),
(489, 98, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 17, '2025-06-17 10:57:53', '2025-06-17 10:57:53'),
(490, 98, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 22, '2025-06-17 10:57:53', '2025-06-17 10:57:53'),
(491, 99, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '2025-06-17 12:00:26', '2025-06-17 12:00:26'),
(492, 99, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-17 12:00:26', '2025-06-17 12:00:26'),
(493, 99, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-17 12:00:26', '2025-06-17 12:00:26'),
(494, 99, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 17, '2025-06-17 12:00:26', '2025-06-17 12:00:26'),
(495, 99, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 22, '2025-06-17 12:00:26', '2025-06-17 12:00:26'),
(496, 100, 1, '2025-06-18', '2025-07-13', 'L.Eye(D-Un):36 R.Eye(D-Un):36', '1:Center-1:c-1|2:Center-2:c-2', NULL, NULL, 1, 1, 1, 6, '2025-06-18 09:20:57', '2025-06-18 12:24:59'),
(497, 100, 2, '2025-06-18', '2025-07-13', NULL, NULL, NULL, NULL, 1, 0, 1, 8, '2025-06-18 09:20:57', '2025-06-18 12:25:37'),
(498, 100, 3, NULL, '2025-07-13', NULL, NULL, NULL, NULL, 0, 0, 1, 11, '2025-06-18 09:20:57', '2025-06-18 09:25:49'),
(499, 100, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-18 09:20:57', '2025-06-18 09:23:59'),
(500, 100, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-18 09:20:57', '2025-06-18 09:23:59'),
(501, 101, 1, NULL, NULL, NULL, '1:Center-1:c-1', NULL, NULL, 1, 0, 0, 1, '2025-06-18 10:23:31', '2025-06-18 10:25:34'),
(502, 101, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-18 10:23:31', '2025-06-18 10:23:31'),
(503, 101, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-18 10:23:31', '2025-06-18 10:23:31'),
(504, 101, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-18 10:23:31', '2025-06-18 10:25:34'),
(505, 101, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-18 10:23:31', '2025-06-18 10:25:34'),
(506, 102, 1, '2025-06-18', '2025-07-13', NULL, '10:Center-10:c-10|2:Center-2:c-2|4:Center-4:c-4', NULL, NULL, 1, 0, 1, 2, '2025-06-18 11:06:10', '2025-06-18 12:24:41'),
(507, 102, 2, NULL, '2025-07-13', NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-18 11:06:10', '2025-06-18 12:24:41'),
(508, 102, 3, NULL, '2025-07-13', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-18 11:06:10', '2025-06-18 12:24:41'),
(509, 102, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-18 11:06:10', '2025-06-18 11:08:46'),
(510, 102, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-18 11:06:10', '2025-06-18 11:08:46'),
(511, 103, 1, NULL, NULL, NULL, '2:Center-2:c-2', NULL, NULL, 0, 0, 0, 1, '2025-06-18 11:26:46', '2025-06-18 11:26:46'),
(512, 103, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 7, '2025-06-18 11:26:46', '2025-06-18 11:26:46'),
(513, 103, 3, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-18 11:26:46', '2025-06-18 11:26:46'),
(514, 103, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 17, '2025-06-18 11:26:46', '2025-06-18 11:26:46'),
(515, 103, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 22, '2025-06-18 11:26:46', '2025-06-18 11:26:46'),
(516, 104, 1, '2025-06-19', '2025-07-14', 'Chest-Issues', '1:Center-1:c-1|2:Center-2:c-2', NULL, NULL, 1, 1, 1, 6, '2025-06-19 07:25:23', '2025-06-19 07:52:28'),
(517, 104, 2, NULL, '2025-07-14', NULL, NULL, NULL, NULL, 1, 0, 0, 7, '2025-06-19 07:25:23', '2025-06-19 07:52:28'),
(518, 104, 3, NULL, '2025-07-14', NULL, NULL, NULL, NULL, 0, 0, 0, 11, '2025-06-19 07:25:23', '2025-06-19 07:52:17'),
(519, 104, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 17, '2025-06-19 07:25:23', '2025-06-19 07:50:32'),
(520, 104, 5, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 22, '2025-06-19 07:25:23', '2025-06-19 07:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `medical_centers`
--

CREATE TABLE `medical_centers` (
  `id` bigint UNSIGNED NOT NULL,
  `medical_type` tinyint NOT NULL DEFAULT '0' COMMENT '0=fake, 1=real',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Inactive, 1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medical_centers`
--

INSERT INTO `medical_centers` (`id`, `medical_type`, `name`, `code`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Center-1', 'c-1', '', 1, NULL, NULL),
(2, 0, 'Center-2', 'c-2', '', 1, NULL, NULL),
(3, 0, 'Center-3', 'c-3', '', 1, NULL, NULL),
(4, 0, 'Center-4', 'c-4', '', 1, NULL, NULL),
(5, 0, 'Center-5', 'c-5', '', 1, NULL, NULL),
(6, 0, 'Center-6', 'c-6', '', 1, NULL, NULL),
(7, 0, 'Center-7', 'c-7', '', 1, NULL, NULL),
(8, 0, 'Center-8', 'c-8', '', 1, NULL, NULL),
(9, 0, 'Center-9', 'c-9', '', 1, NULL, NULL),
(10, 0, 'Center-10', 'c-10', '', 1, NULL, NULL),
(11, 1, 'SR Medical & Diagnostic Center', 'SRMDC', '2/1 Nova Tower, (1st Floor), Naya Paltan, Dhaka-1000, Bangladesh.', 1, NULL, NULL),
(12, 1, 'Muscat Medical Center', 'MMC', 'Kakoli Foot-Overbridge, Bonani, Dhaka 1212.', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `srln` int NOT NULL DEFAULT '1',
  `menu_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `navicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_side_menu` tinyint NOT NULL DEFAULT '0',
  `create_route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(29, 0, 6, 'Account Manage', '<i class=\"nav-icon fa fa-credit-card\"></i>', 1, NULL, NULL, 1, '2024-11-03 08:16:54', '2025-05-05 18:08:06'),
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
(52, 0, 13, 'All Reports', '<i class=\"nav-icon fas fa-file-alt\"></i>', 1, NULL, NULL, 1, '2025-01-29 04:26:54', '2025-04-28 06:21:56'),
(56, 52, 4, 'Monthly Expense', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.monthly-expenses', 0, '2025-01-29 04:33:07', '2025-05-27 06:30:24'),
(57, 52, 5, 'Profit Loss Statement', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.profit-loss-statement', 1, '2025-01-29 04:36:00', '2025-05-27 11:48:39'),
(58, 52, 6, 'Accounts Ledger', '<i class=\"nav-icon far fa-dot-circle\"></i>', 1, NULL, 'reports.account-ledger', 1, '2025-01-29 04:36:22', '2025-04-16 04:37:51'),
(63, 0, 4, 'Investors', '<i class=\"nav-icon fas fa-user-tie\"></i>', 0, NULL, NULL, 0, '2025-02-19 07:06:17', '2025-04-30 04:55:41'),
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
(105, 0, 10, 'Expense Manage', '<i class=\"nav-icon fa-solid fa-money-bill-wave\"></i>', 1, NULL, NULL, 1, '2025-03-12 03:50:17', '2025-05-29 16:27:37'),
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
(136, 0, 5, 'Agent', '<i class=\"nav-icon fas fa-user-tie\"></i>', 1, 'customers.create', 'customers.index', 1, '2025-03-22 19:17:08', '2025-04-30 04:56:08'),
(137, 0, 6, 'Jobs', '<i class=\"fa fa-tasks nav-icon\"></i>', 1, 'sales.create', 'sales.index', 1, '2025-03-22 20:31:30', '2025-04-29 05:03:09'),
(138, 0, 8, 'Agent Payments', '<i class=\"nav-icon fas fa-hand-holding-usd\"></i>', 1, 'customer-payments.create', 'customer-payments.index', 1, '2025-03-23 08:47:00', '2025-05-25 08:56:34'),
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
(178, 182, 4, 'Total sales and service', NULL, 0, NULL, NULL, 1, '2025-04-23 10:50:23', '2025-04-23 10:50:23'),
(179, 182, 6, 'Today Inventory Balance', NULL, 0, NULL, NULL, 1, '2025-04-23 10:53:52', '2025-04-23 10:53:52'),
(180, 183, 4, 'Investors Balance', NULL, 0, NULL, NULL, 1, '2025-04-23 10:56:04', '2025-04-23 10:56:04'),
(181, 183, 5, 'My Investment', NULL, 0, NULL, NULL, 1, '2025-04-23 10:57:37', '2025-04-23 10:57:37'),
(182, 1, 1, 'Sales & Expense Info', NULL, 0, NULL, NULL, 0, '2025-04-23 10:58:23', '2025-04-28 06:23:25'),
(183, 1, 2, 'Investement Info', NULL, 0, NULL, NULL, 0, '2025-04-23 11:00:28', '2025-04-28 06:32:52'),
(184, 1, 3, 'Bike Info', NULL, 0, NULL, NULL, 0, '2025-04-23 11:01:24', '2025-04-28 06:32:58'),
(185, 137, 8, 'Add New Item', NULL, 0, NULL, 'sales.add-new-item', 1, '2025-05-24 17:19:20', '2025-05-24 17:19:20'),
(186, 137, 9, 'Service Status Update', NULL, 0, NULL, 'sales.service-edit', 1, '2025-05-24 17:22:40', '2025-05-24 17:22:40'),
(188, 137, 10, 'Pre-Medical Token', NULL, 0, NULL, 'sales.token.print', 1, '2025-06-19 11:22:25', '2025-06-19 11:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(158, '2025_02_20_100226_create_investor_transactions_table', 67),
(159, '2025_06_17_161858_add_passport_img_to_sales_table', 67),
(160, '2025_06_17_170313_add_country_to_sales_table', 68),
(162, '2025_06_19_124508_add_medical_column_to_job', 69),
(165, '2025_06_19_125154_add_medical_type_to_medical_centers', 70),
(166, '2025_06_19_165534_add_agent_code_to_customer_table', 71);

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

CREATE TABLE `parties` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `nid_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `current_balance` double(20,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `particular` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL,
  `credit_amount` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
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
  `loan_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_type` tinyint NOT NULL COMMENT '0 = loan_given, 1 = loan_taken',
  `amount` double(20,2) NOT NULL,
  `loan_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `last_payment_date` date DEFAULT NULL,
  `paid_amount` double(20,2) NOT NULL DEFAULT '0.00',
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint NOT NULL DEFAULT '0' COMMENT '0 = pending, -1 = partial, 1 = paid',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `note` text COLLATE utf8mb4_unicode_ci,
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
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_virtual` int NOT NULL DEFAULT '0' COMMENT '0=not virtual, 1=virtual',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=active, 0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `is_virtual`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 0, 1, NULL, NULL),
(2, 'Investment Capital', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
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
(113, 3, 1, '2025-06-01 09:22:35', '2025-06-01 09:22:35'),
(114, 3, 137, '2025-06-01 09:22:35', '2025-06-01 09:22:35'),
(115, 3, 155, '2025-06-01 09:22:35', '2025-06-01 09:22:35'),
(116, 3, 158, '2025-06-01 09:22:35', '2025-06-01 09:22:35'),
(117, 3, 159, '2025-06-01 09:22:35', '2025-06-01 09:22:35'),
(118, 3, 160, '2025-06-01 09:22:35', '2025-06-01 09:22:35'),
(119, 3, 161, '2025-06-01 09:22:35', '2025-06-01 09:22:35'),
(120, 3, 186, '2025-06-01 09:22:35', '2025-06-01 09:22:35'),
(128, 2, 1, '2025-06-19 11:23:01', '2025-06-19 11:23:01'),
(129, 2, 137, '2025-06-19 11:23:01', '2025-06-19 11:23:01'),
(130, 2, 155, '2025-06-19 11:23:01', '2025-06-19 11:23:01'),
(131, 2, 156, '2025-06-19 11:23:01', '2025-06-19 11:23:01'),
(132, 2, 159, '2025-06-19 11:23:01', '2025-06-19 11:23:01'),
(133, 2, 160, '2025-06-19 11:23:01', '2025-06-19 11:23:01'),
(134, 2, 186, '2025-06-19 11:23:01', '2025-06-19 11:23:01'),
(135, 2, 188, '2025-06-19 11:23:01', '2025-06-19 11:23:01');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `supplier_id` int NOT NULL,
  `account_id` bigint DEFAULT NULL,
  `vouchar_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `total_price` double(20,2) NOT NULL,
  `vat_tax` double(20,2) DEFAULT '0.00',
  `discount_method` tinyint NOT NULL DEFAULT '1' COMMENT '0=Percentage, 1=Solid',
  `discount_rate` double(20,2) NOT NULL,
  `discount` double(20,2) NOT NULL,
  `total_payable` double(20,2) NOT NULL,
  `paid_amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
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
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `is_superadmin`, `created_by`, `role`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Super Admin', 1, NULL, NULL),
(2, 0, 1, 'Agent', 1, NULL, NULL),
(3, 0, 1, 'Manager', 0, '2025-05-27 15:34:26', '2025-05-27 15:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` int NOT NULL,
  `medical_id` bigint DEFAULT NULL,
  `country_id` bigint DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  `passenger_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passenger_passport_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passport_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localhost_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `total_price` double(20,2) NOT NULL,
  `vat_tax` double(20,2) DEFAULT '0.00',
  `discount_method` tinyint NOT NULL DEFAULT '1' COMMENT '0=Percentage, 1=Solid',
  `discount_rate` double(20,2) NOT NULL,
  `discount` double(20,2) NOT NULL,
  `total_payable` double(20,2) NOT NULL,
  `paid_amount` double(20,2) NOT NULL,
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `payment_status` tinyint NOT NULL DEFAULT '0' COMMENT '0 = pending, -1 = partial, 1 = paid',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Processing, 2=Complete, 3=Refunded, 4=Cancelled',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customer_id`, `medical_id`, `country_id`, `account_id`, `passenger_name`, `passenger_passport_no`, `passport_img`, `localhost_no`, `invoice_no`, `date`, `total_price`, `vat_tax`, `discount_method`, `discount_rate`, `discount`, `total_payable`, `paid_amount`, `reference_number`, `note`, `payment_status`, `status`, `created_by_id`, `updated_by_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, 1, 'Md Shameem Hossain', 'EM0800520', NULL, 'SRD05645030', '0000001', '2025-05-22', 12000.00, 0.00, 0, 0.00, 0.00, 12000.00, 12000.00, NULL, NULL, 1, 1, 1, 1, '2025-05-27 07:34:50', '2025-05-27 07:47:36'),
(2, 1, NULL, NULL, 1, 'Md Nazrul Islam', 'A17279680', NULL, 'SRD05130689', '0000002', '2025-05-22', 12000.00, 0.00, 0, 0.00, 0.00, 12000.00, 8000.00, NULL, NULL, 0, 1, 1, 1, '2025-05-27 07:50:39', '2025-05-27 07:52:29'),
(3, 2, NULL, NULL, 1, 'Ibrahim Khalil', 'A11166679', NULL, 'SRD04593063', '0000003', '2025-04-16', 2000.00, 0.00, 0, 0.00, 0.00, 2000.00, 2000.00, NULL, NULL, 1, 2, 1, 1, '2025-05-27 18:18:05', '2025-05-27 18:26:35'),
(4, 3, NULL, NULL, 1, 'Sazal Chowdhury', 'A03820990', NULL, 'SRD06715669', '0000004', '2025-06-01', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 1, NULL, '2025-06-01 06:55:55', '2025-06-01 06:56:07'),
(5, 3, NULL, NULL, 1, 'Md Forid Uddin', 'A18721832', NULL, 'SRD06433967', '0000005', '2025-06-01', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 1, NULL, '2025-06-01 06:57:28', '2025-06-01 06:57:32'),
(6, 3, NULL, NULL, 1, 'MD FORID UDDIN', 'A18721832', NULL, 'SRD06433967', '0000006', '2025-06-01', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-01 07:35:29', '2025-06-01 08:53:24'),
(7, 3, NULL, NULL, 1, 'SAZAL CHOWDHURY', 'A03820990', NULL, 'SRD06715669', '0000007', '2025-06-01', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-01 07:39:13', '2025-06-01 08:53:26'),
(8, 3, NULL, NULL, 1, 'Md Shahibur Rahman', 'A13810751', NULL, 'SRD06902779', '0000008', '2025-06-02', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-02 10:42:53', '2025-06-02 14:36:16'),
(9, 3, NULL, NULL, 1, 'Md Monir Ahmed', 'EM0533193', NULL, 'SRD06737931', '0000009', '2025-06-02', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-02 10:45:29', '2025-06-02 14:36:28'),
(10, 3, NULL, NULL, 1, 'Md Monir Ahmed', 'EM0533193', NULL, 'SRD06737931', '0000010', '2025-06-02', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-02 10:46:16', '2025-06-02 14:36:38'),
(11, 4, NULL, NULL, 1, 'Shaful Islam', 'A15376150', NULL, 'SRD06605496', '0000011', '2025-06-02', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-02 10:47:17', '2025-06-02 14:36:21'),
(12, 4, NULL, NULL, 1, 'Delowar Hossain', 'A14902002', NULL, 'SRD06900059', '0000012', '2025-06-02', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-02 10:50:22', '2025-06-02 14:36:04'),
(13, 4, NULL, NULL, 1, 'Akash Sheikh', 'A17020936', NULL, 'SRD05895070', '0000013', '2025-05-06', 6500.00, 0.00, 0, 0.00, 0.00, 6500.00, 6500.00, NULL, NULL, 1, 1, 1, 1, '2025-06-09 11:54:45', '2025-06-09 11:59:47'),
(14, 4, NULL, NULL, 1, 'Mohammed Yeasin', 'EJ0651295', NULL, 'SRD05532324', '0000014', '2025-05-14', 2000.00, 0.00, 0, 0.00, 0.00, 2000.00, 2000.00, NULL, NULL, 1, 1, 1, 1, '2025-06-09 12:08:02', '2025-06-09 12:13:09'),
(15, 4, NULL, NULL, 1, 'Daudul Islam', 'A15499580', NULL, 'SRD05873552', '0000015', '2025-05-25', 2000.00, 0.00, 0, 0.00, 0.00, 2000.00, 2000.00, NULL, NULL, 1, 1, 1, 1, '2025-06-09 12:21:08', '2025-06-09 12:24:45'),
(16, 4, NULL, NULL, 1, 'Md Abdul', 'A17536053', NULL, 'SRD05949520', '0000016', '2025-05-25', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 1, NULL, '2025-06-09 12:31:27', '2025-06-09 12:31:36'),
(17, 4, NULL, NULL, 1, 'Md Sujan', 'A06935606', NULL, 'SRD05196516', '0000017', '2025-05-25', 2000.00, 0.00, 0, 0.00, 0.00, 2000.00, 2000.00, NULL, NULL, 1, 1, 1, 1, '2025-06-09 12:35:40', '2025-06-09 12:40:45'),
(18, 4, NULL, NULL, 1, 'Sheik Saiful', 'A14052431', NULL, 'SRD05026683', '0000018', '2025-05-25', 2000.00, 0.00, 0, 0.00, 0.00, 2000.00, 2000.00, NULL, NULL, 1, 1, 1, 1, '2025-06-09 12:53:33', '2025-06-09 12:55:53'),
(19, 4, NULL, NULL, 1, 'Mohammed Ali', 'A04056165', NULL, 'SRD05330163', '0000019', '2025-05-26', 2000.00, 0.00, 0, 0.00, 0.00, 2000.00, 2000.00, NULL, NULL, 1, 1, 1, 1, '2025-06-09 13:03:47', '2025-06-09 13:09:06'),
(20, 4, NULL, NULL, 1, 'Delwar Hossain', 'A07589798', NULL, 'SRD05726876', '0000020', '2025-05-26', 2000.00, 0.00, 0, 0.00, 0.00, 2000.00, 2000.00, NULL, NULL, 1, 1, 1, 1, '2025-06-09 13:14:20', '2025-06-09 13:17:19'),
(21, 3, NULL, NULL, 1, 'Sazal Chowdhury', 'A03820990', NULL, 'SRD06715669', '0000021', '2025-06-01', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:01:10', '2025-06-15 05:09:41'),
(22, 3, NULL, NULL, 1, 'Md Shahibur Rahman', 'A13810751', NULL, 'SRD06902779', '0000022', '2025-06-01', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:03:21', '2025-06-15 05:09:43'),
(23, 3, NULL, NULL, 1, 'Md Forid Uddin', 'A18721832', NULL, 'SRD06433967', '0000023', '2025-06-01', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:05:14', '2025-06-15 05:10:15'),
(24, 3, NULL, NULL, 1, 'Md Monir Ahmed', 'EM0533193', NULL, 'SRD06737931', '0000024', '2025-06-02', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:06:38', '2025-06-15 05:10:10'),
(25, 3, NULL, NULL, 1, 'Parbej Ahmed', 'A18555191', NULL, 'SRD06661652', '0000025', '2025-06-02', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:07:45', '2025-06-15 05:09:58'),
(26, 3, NULL, NULL, 1, 'Nazim Uddin', 'A16512721', NULL, 'SRD06103743', '0000026', '2025-06-01', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:09:36', '2025-06-15 05:09:47'),
(27, 4, NULL, NULL, 1, 'Shaful Islam', 'A15376150', NULL, 'SRD06605496', '0000027', '2025-06-02', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:15:01', '2025-06-15 07:54:10'),
(28, 4, NULL, NULL, 1, 'Delowar Hossain', 'A14902002', NULL, 'SRD06900059', '0000028', '2025-06-02', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:16:03', '2025-06-15 07:53:59'),
(29, 2, NULL, NULL, 1, 'Md Rayhan Sarkar', 'A16670279', NULL, 'SRD05985123', '0000029', '2025-05-18', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:18:39', '2025-06-15 07:53:53'),
(30, 2, NULL, NULL, 1, 'Md. Milon Babu', 'A08911843', NULL, 'SRD05812912', '0000030', '2025-05-18', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:19:40', '2025-06-15 07:53:43'),
(31, 2, NULL, NULL, 1, 'Md Razwanul Kobir', 'A05896961', NULL, 'SRD05411412', '0000031', '2025-05-18', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:21:15', '2025-06-15 07:53:31'),
(32, 2, NULL, NULL, 1, 'Rukhan Mia', 'EK0503169', NULL, 'SRD05824278', '0000032', '2025-05-19', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:22:46', '2025-06-15 07:53:24'),
(33, 2, NULL, NULL, 1, 'Md Mosthofa', 'A18019062', NULL, 'SRD05935577', '0000033', '2025-05-27', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:24:29', '2025-06-15 07:53:15'),
(34, 2, NULL, NULL, 1, 'Md Sadek Mia', 'A11640654', NULL, 'SRD05194466', '0000034', '2025-05-28', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:25:32', '2025-06-15 07:53:04'),
(35, 2, NULL, NULL, 1, 'Md Razu', 'A17124153', NULL, 'SRD05360807', '0000035', '2025-05-31', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 05:26:56', '2025-06-15 07:52:34'),
(36, 5, NULL, NULL, 1, 'Sojib Mia', 'A14932501', NULL, 'SRD05295303', '0000036', '2025-05-07', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 09:10:41', '2025-06-15 12:02:52'),
(37, 5, NULL, NULL, 1, 'Md Shagor Miah', 'A17588297', NULL, 'SRD04152824', '0000037', '2025-04-05', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 09:12:52', '2025-06-15 12:02:44'),
(38, 5, NULL, NULL, 1, 'Belayet Hossen', 'EM0694632', NULL, 'SRD04658379', '0000038', '2025-04-06', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 09:13:55', '2025-06-15 12:02:17'),
(39, 5, NULL, NULL, 1, 'Md Sohag', 'A03889773', NULL, 'SRD04749196', '0000039', '2025-04-06', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 09:30:51', '2025-06-15 12:02:08'),
(40, 5, NULL, NULL, 1, 'Md Shawon', 'B00621721', NULL, 'SRD04779848', '0000040', '2025-04-07', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 09:33:19', '2025-06-15 09:56:02'),
(41, 5, NULL, NULL, 1, 'Bayzid Ahmed', 'A15963441', NULL, 'SRD04034390', '0000041', '2025-04-07', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 09:56:38', '2025-06-15 12:01:46'),
(42, 5, NULL, NULL, 1, 'Fahim Mia', 'A16442316', NULL, 'SRD04672725', '0000042', '2025-04-07', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 09:58:08', '2025-06-15 12:01:36'),
(43, 5, NULL, NULL, 1, 'Mohammad Nazmul', 'EJ0660651', NULL, 'SRD04255248', '0000043', '2025-04-07', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 09:59:19', '2025-06-15 12:01:29'),
(44, 5, NULL, NULL, 1, 'Shaheda Akter', 'A05953427', NULL, 'SRD04689446', '0000044', '2025-04-07', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:06:59', '2025-06-15 12:01:23'),
(45, 5, NULL, NULL, 1, 'Md Maruf', 'A17822001', NULL, 'SRD04208938', '0000045', '2025-04-07', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:08:59', '2025-06-15 12:01:15'),
(46, 5, NULL, NULL, 1, 'Kazi Emran', 'A17851330', NULL, 'SRD04397722', '0000046', '2025-04-07', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:09:51', '2025-06-15 12:01:08'),
(47, 5, NULL, NULL, 1, 'Ponir Hossan', 'A18221336', NULL, 'SRD04108308', '0000047', '2025-04-07', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:13:25', '2025-06-15 12:00:23'),
(48, 5, NULL, NULL, 1, 'Md Saidul Hasan', 'A16077000', NULL, 'SRD04657082', '0000048', '2025-04-07', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:15:18', '2025-06-15 12:00:16'),
(49, 5, NULL, NULL, 1, 'Hafijul Haque', 'A16559381', NULL, 'SRD04676597', '0000049', '2025-04-08', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:16:25', '2025-06-15 12:00:10'),
(50, 5, NULL, NULL, 1, 'Abdur Rahim', 'EJ0692185', NULL, 'SRD04379158', '0000050', '2025-04-08', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:17:17', '2025-06-15 12:00:03'),
(51, 5, NULL, NULL, 1, 'Md Zahirul Islam', 'A16383157', NULL, 'SRD04605469', '0000051', '2025-04-08', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:18:19', '2025-06-15 11:59:58'),
(52, 5, NULL, NULL, 1, 'Limon', 'A08833819', NULL, 'SRD04814210', '0000052', '2025-04-08', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:19:20', '2025-06-15 11:59:53'),
(53, 5, NULL, NULL, 1, 'Md Sowad Hossain', 'A18265050', NULL, 'SRD04622172', '0000053', '2025-04-09', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:20:50', '2025-06-15 11:59:42'),
(54, 5, NULL, NULL, 1, 'Mohd Masiur Rahman', 'A16733509', NULL, 'SRD04939618', '0000054', '2025-04-09', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:22:37', '2025-06-15 11:59:38'),
(55, 5, NULL, NULL, 1, 'Md Sheber Ali', 'A17310405', NULL, 'SRD04746585', '0000055', '2025-04-09', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:24:14', '2025-06-15 11:59:30'),
(56, 5, NULL, NULL, 1, 'Md Moslim', 'EK0098309', NULL, 'SRD04832468', '0000056', '2025-04-09', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:25:02', '2025-06-15 11:59:25'),
(57, 5, NULL, NULL, 1, 'Md Naeem', 'B00565008', NULL, 'SRD04834143', '0000057', '2025-04-10', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:29:20', '2025-06-15 11:59:18'),
(58, 5, NULL, NULL, 1, 'Siam Bepari', 'A11354451', NULL, 'SRD04491754', '0000058', '2025-04-12', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:30:19', '2025-06-15 11:59:16'),
(59, 5, NULL, NULL, 1, 'Shahadat Hossain', 'A08943709', NULL, 'SRD04234365', '0000059', '2025-04-12', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:31:56', '2025-06-15 11:59:12'),
(60, 5, NULL, NULL, 1, 'Md Tarak Chokidar', 'A18309839', NULL, 'SRD04689591', '0000060', '2025-04-12', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:33:27', '2025-06-15 11:59:07'),
(61, 5, NULL, NULL, 1, 'Dipon Paul', 'A17610848', NULL, 'SRD04464075', '0000061', '2025-04-12', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:34:30', '2025-06-15 11:59:04'),
(62, 5, NULL, NULL, 1, 'Md Rezaul Hasab', 'A07927042', NULL, 'SRD04452776', '0000062', '2025-04-12', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:35:42', '2025-06-15 11:58:59'),
(63, 5, NULL, NULL, 1, 'Md Abu Taher Kholifa', 'A14561678', NULL, 'SRD04287216', '0000063', '2025-04-12', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:36:48', '2025-06-15 11:58:54'),
(64, 5, NULL, NULL, 1, 'Md Israfil Hossain', 'A09054990', NULL, 'SRD04425626', '0000064', '2025-04-12', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:38:24', '2025-06-15 11:58:49'),
(65, 5, NULL, NULL, 1, 'Fazle Rabbi Sakib', 'A06976275', NULL, 'SRD04295310', '0000065', '2025-04-13', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:39:28', '2025-06-15 11:58:44'),
(66, 5, NULL, NULL, 1, 'Md Shihab', 'A08296866', NULL, 'SRD04594061', '0000066', '2025-04-13', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:41:13', '2025-06-15 11:58:40'),
(67, 5, NULL, NULL, 1, 'Md Forkhan Hosan', 'A09213453', NULL, 'SRD04863272', '0000067', '2025-04-15', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:42:13', '2025-06-15 11:58:34'),
(68, 5, NULL, NULL, 1, 'Md Shanto', 'A07812265', NULL, 'SRD04218586', '0000068', '2025-04-15', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:43:07', '2025-06-15 11:58:28'),
(69, 5, NULL, NULL, 1, 'Md Jubayer Hossain', 'A15310225', NULL, 'SRD04257732', '0000069', '2025-04-15', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:44:30', '2025-06-15 11:58:24'),
(70, 5, NULL, NULL, 1, 'Md Regun Hossain', 'A15515305', NULL, 'SRD04203789', '0000070', '2025-04-15', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:45:30', '2025-06-15 11:58:17'),
(71, 5, NULL, NULL, 1, 'Abu Taher', 'A03277712', NULL, 'SRD04299495', '0000071', '2025-04-15', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:46:12', '2025-06-15 11:58:13'),
(72, 5, NULL, NULL, 1, 'Md Shiblu Pramanik', 'A11661767', NULL, 'SRD04149080', '0000072', '2025-04-15', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:48:32', '2025-06-15 11:58:09'),
(73, 5, NULL, NULL, 1, 'Arman Hosshen', 'A03656043', NULL, 'SRD04440588', '0000073', '2025-04-15', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:49:38', '2025-06-15 11:58:06'),
(74, 5, NULL, NULL, 1, 'Md Omar Faruk', 'A15033539', NULL, 'SRD04036158', '0000074', '2025-04-15', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:50:42', '2025-06-15 11:58:01'),
(75, 5, NULL, NULL, 1, 'Abdur Razzak Akash', 'A08684962', NULL, 'SRD04599415', '0000075', '2025-04-15', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:52:34', '2025-06-15 11:57:56'),
(76, 5, NULL, NULL, 1, 'Md Hasan Sheikh', 'A16088719', NULL, 'SRD04025974', '0000076', '2025-04-15', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:53:28', '2025-06-15 11:57:51'),
(77, 5, NULL, NULL, 1, 'Md Yasin', 'A08943946', NULL, 'SRD04921083', '0000077', '2025-04-15', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:54:12', '2025-06-15 11:57:47'),
(78, 5, NULL, NULL, 1, 'Meraz Gazi', 'A18088325', NULL, 'SRD04265457', '0000078', '2025-04-16', 2000.00, 0.00, 0, 0.00, 0.00, 2000.00, 2000.00, NULL, NULL, 1, 1, 6, 1, '2025-06-15 10:54:58', '2025-06-15 11:38:02'),
(79, 5, NULL, NULL, 1, 'Md Labu Ukil', 'A16663991', NULL, 'SRD04673906', '0000079', '2025-04-16', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 10:56:19', '2025-06-15 11:33:06'),
(80, 6, NULL, NULL, 1, 'Md Al Amin', 'A08386067', NULL, 'SRD04115598', '0000080', '2025-04-07', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 11:01:56', '2025-06-15 11:57:43'),
(81, 6, NULL, NULL, 1, 'Sabbir Mia', 'A11037240', NULL, 'SRD04717129', '0000081', '2025-04-08', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 11:03:15', '2025-06-15 11:57:39'),
(82, 6, NULL, NULL, 1, 'Md Jahid Hossen', 'A12269628', NULL, 'SRD05176199', '0000082', '2025-05-06', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 11:04:35', '2025-06-15 11:57:34'),
(83, 6, NULL, NULL, 1, 'Rejaul Houque Choudury', 'A16664488', NULL, 'SRD05277730', '0000083', '2025-05-07', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 11:05:13', '2025-06-15 11:57:29'),
(84, 6, NULL, NULL, 1, 'Abu Nayeem', 'EK0422480', NULL, 'SRD05048572', '0000084', '2025-05-20', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 11:06:16', '2025-06-15 11:57:24'),
(85, 6, NULL, NULL, 1, 'Khairuzaman', 'A12221607', NULL, 'SRD05155041', '0000085', '2025-05-22', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-15 11:07:49', '2025-06-15 11:57:18'),
(86, 5, NULL, NULL, 1, 'Md Muktar Hossain', 'A18841836', NULL, 'SRD06803994', '0000086', '2025-06-16', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 1, NULL, '2025-06-16 14:15:38', '2025-06-16 14:15:43'),
(87, 5, NULL, NULL, NULL, 'Samsul Haque', 'A13311448', NULL, 'SRD06548029', '0000087', '2025-06-16', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 1, NULL, '2025-06-16 14:16:56', '2025-06-16 14:17:01'),
(88, 5, NULL, NULL, 1, 'Atikur Rahman Sourav', 'A04478402', NULL, 'SRD06194450', '0000088', '2025-06-16', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 1, NULL, '2025-06-16 14:18:02', '2025-06-16 14:18:08'),
(89, 3, NULL, NULL, NULL, 'Md Shiblu Miah', 'A15953817', NULL, 'SRD06644491', '0000089', '2025-06-16', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 1, NULL, '2025-06-16 14:19:12', '2025-06-16 14:19:17'),
(90, 3, NULL, NULL, 1, 'Md Shiblu Miah', 'A15953817', NULL, 'SRD06644491', '0000090', '2025-06-16', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 0, 6, NULL, '2025-06-17 04:18:38', '2025-06-17 04:18:38'),
(91, 5, NULL, NULL, 1, 'Md Muktar Hossain', 'A18841836', NULL, 'SRD06803994', '0000091', '2025-06-16', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 0, 6, NULL, '2025-06-17 04:22:06', '2025-06-17 04:22:06'),
(92, 5, NULL, NULL, 1, 'Samsul Haque', 'A13311448', NULL, 'SRD06548029', '0000092', '2025-06-16', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 0, 6, NULL, '2025-06-17 04:23:08', '2025-06-17 04:23:08'),
(93, 5, NULL, NULL, 1, 'Atikur Rahman Sourav', 'A04478402', NULL, 'SRD06194450', '0000093', '2025-06-16', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 6, NULL, '2025-06-17 04:24:12', '2025-06-17 06:49:21'),
(95, 6, NULL, NULL, NULL, '3456789', '8765432456789', NULL, NULL, '0000095', '2025-06-17', 9000.00, 0.00, 0, 0.00, 0.00, 9000.00, 9000.00, NULL, NULL, 1, 1, 8, 1, '2025-06-17 06:07:34', '2025-06-18 08:50:37'),
(96, 6, NULL, NULL, 1, '9876542345678', '65098765443567', NULL, '456789', '0000096', '2025-06-17', 7000.00, 0.00, 0, 0.00, 0.00, 7000.00, 7000.00, NULL, NULL, 1, 1, 8, 1, '2025-06-17 06:27:39', '2025-06-17 06:29:29'),
(97, 6, NULL, NULL, NULL, 'Shoriful Alom', '34567890', NULL, NULL, '0000097', '2025-06-17', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 0, 8, NULL, '2025-06-17 06:52:13', '2025-06-17 06:52:13'),
(98, 2, NULL, NULL, 1, '9876542345678', '65098765443567', 'doc-07f66962-595d-424f-97dc-285df7370b06.png', '456789', '0000098', '2025-06-17', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 0, 1, 1, '2025-06-17 10:57:53', '2025-06-17 11:32:52'),
(99, 3, NULL, 191, NULL, '9876542345678', '65098765443567', 'doc-cdd9cf3c-060f-40b3-8145-e33757e3091d.png', '456789', '0000099', '2025-06-17', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 0, 1, NULL, '2025-06-17 12:00:26', '2025-06-17 12:00:26'),
(100, 2, NULL, 18, 1, 'Nowab Shorif', '5678934', 'doc-2599bbfb-5d51-48a0-b840-c5b84a95a022.jpg', '7923434567', '0000100', '2025-06-18', 6500.00, 0.00, 0, 0.00, 0.00, 6500.00, 6500.00, NULL, NULL, 1, 1, 1, 1, '2025-06-18 09:20:57', '2025-06-18 12:25:18'),
(101, 6, NULL, 191, NULL, 'Kawa Kader', '123456789', 'doc-8edaee34-d8d6-4723-8664-dd4a704c3a9e.png', NULL, '0000101', '2025-06-18', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 8, NULL, '2025-06-18 10:23:31', '2025-06-18 10:25:34'),
(102, 2, NULL, 191, 1, 'Malek Azad', '36456dfgdfg', 'doc-d5b38a8f-daa3-4cfe-a91b-e9086f014a6d.png', '7923434567', '0000102', '2025-06-18', 7000.00, 0.00, 0, 0.00, 0.00, 7000.00, 7000.00, NULL, NULL, 1, 1, 1, NULL, '2025-06-18 11:06:10', '2025-06-18 11:08:46'),
(103, 2, NULL, 1, NULL, 'Malek Azad', '36456dfgdfg', NULL, '7923434567', '0000103', '2025-06-18', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 0, 1, 1, '2025-06-18 11:26:46', '2025-06-18 11:28:49'),
(104, 6, 11, 191, NULL, 'Malek Azad', '6789075475', NULL, '34567890', '0000104', '2025-06-19', 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 1, 1, 1, '2025-06-19 07:25:23', '2025-06-19 07:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `date` date NOT NULL,
  `unit_price` double(20,2) NOT NULL,
  `purchase_price` double(20,2) DEFAULT NULL,
  `profit` double(20,2) DEFAULT NULL,
  `net_sale_price` double(20,2) DEFAULT NULL,
  `net_profit` double(20,2) DEFAULT NULL,
  `is_service_generated` tinyint NOT NULL DEFAULT '0' COMMENT '0=No, 1=Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_details`
--

INSERT INTO `sale_details` (`id`, `sale_id`, `item_id`, `date`, `unit_price`, `purchase_price`, `profit`, `net_sale_price`, `net_profit`, `is_service_generated`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-05-22', 7000.00, 7000.00, 0.00, 7000.00, 0.00, 0, '2025-05-27 07:34:50', '2025-05-27 07:35:11'),
(2, 1, 8, '2025-05-22', 5000.00, 3000.00, 2000.00, 5000.00, 2000.00, 0, '2025-05-27 07:47:36', '2025-05-27 07:47:36'),
(3, 2, 1, '2025-05-22', 7000.00, 7000.00, 0.00, 7000.00, 0.00, 0, '2025-05-27 07:50:39', '2025-05-27 07:50:44'),
(4, 2, 8, '2025-05-22', 5000.00, 3000.00, 2000.00, 5000.00, 2000.00, 0, '2025-05-27 07:52:29', '2025-05-27 07:52:29'),
(5, 3, 1, '2025-04-16', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-05-27 18:18:05', '2025-05-27 18:18:15'),
(6, 3, 13, '2025-04-16', 2000.00, 1500.00, 500.00, 2000.00, 500.00, 0, '2025-05-27 18:20:37', '2025-05-27 18:20:37'),
(7, 3, 6, '2025-04-16', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-05-27 18:22:18', '2025-05-27 18:22:18'),
(8, 4, 1, '2025-06-01', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-01 06:55:55', '2025-06-01 06:56:07'),
(9, 5, 1, '2025-06-01', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-01 06:57:28', '2025-06-01 06:57:32'),
(10, 6, 1, '2025-06-01', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-01 07:35:29', '2025-06-01 08:53:24'),
(11, 7, 1, '2025-06-01', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-01 07:39:13', '2025-06-01 08:53:26'),
(12, 8, 1, '2025-06-02', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-02 10:42:53', '2025-06-02 14:36:16'),
(13, 9, 1, '2025-06-02', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-02 10:45:29', '2025-06-02 14:36:28'),
(14, 10, 1, '2025-06-02', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-02 10:46:16', '2025-06-02 14:36:38'),
(15, 11, 1, '2025-06-02', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-02 10:47:17', '2025-06-02 14:36:21'),
(16, 12, 1, '2025-06-02', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-02 10:50:22', '2025-06-02 14:36:04'),
(17, 13, 1, '2025-05-06', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 11:54:45', '2025-06-09 11:54:59'),
(18, 13, 31, '2025-05-06', 6500.00, 6000.00, 500.00, 6500.00, 500.00, 0, '2025-06-09 11:59:47', '2025-06-09 11:59:47'),
(19, 13, 6, '2025-05-06', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 12:02:18', '2025-06-09 12:02:18'),
(20, 14, 1, '2025-05-14', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 12:08:02', '2025-06-09 12:08:11'),
(21, 14, 13, '2025-05-14', 2000.00, 1500.00, 500.00, 2000.00, 500.00, 0, '2025-06-09 12:13:09', '2025-06-09 12:13:09'),
(22, 14, 6, '2025-05-14', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 12:14:10', '2025-06-09 12:14:10'),
(23, 15, 1, '2025-05-25', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 12:21:08', '2025-06-09 12:21:17'),
(24, 15, 13, '2025-05-25', 2000.00, 1500.00, 500.00, 2000.00, 500.00, 0, '2025-06-09 12:24:45', '2025-06-09 12:24:45'),
(25, 15, 6, '2025-05-25', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 12:25:53', '2025-06-09 12:25:53'),
(26, 16, 1, '2025-05-25', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 12:31:27', '2025-06-09 12:31:36'),
(27, 17, 1, '2025-05-25', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 12:35:40', '2025-06-09 12:35:51'),
(28, 17, 13, '2025-05-25', 2000.00, 1500.00, 500.00, 2000.00, 500.00, 0, '2025-06-09 12:40:45', '2025-06-09 12:40:45'),
(29, 17, 6, '2025-05-25', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 12:49:29', '2025-06-09 12:49:29'),
(30, 18, 1, '2025-05-25', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 12:53:33', '2025-06-09 12:53:43'),
(31, 18, 13, '2025-05-25', 2000.00, 1500.00, 500.00, 2000.00, 500.00, 0, '2025-06-09 12:55:53', '2025-06-09 12:55:53'),
(32, 18, 6, '2025-05-25', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 12:57:22', '2025-06-09 12:57:22'),
(33, 19, 1, '2025-05-26', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 13:03:47', '2025-06-09 13:03:56'),
(34, 19, 13, '2025-05-26', 2000.00, 1500.00, 500.00, 2000.00, 500.00, 0, '2025-06-09 13:09:06', '2025-06-09 13:09:06'),
(35, 19, 6, '2025-05-26', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 13:10:04', '2025-06-09 13:10:04'),
(36, 20, 1, '2025-05-26', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 13:14:20', '2025-06-09 13:14:30'),
(37, 20, 13, '2025-05-26', 2000.00, 1500.00, 500.00, 2000.00, 500.00, 0, '2025-06-09 13:17:19', '2025-06-09 13:17:19'),
(38, 20, 6, '2025-05-26', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-09 13:18:09', '2025-06-09 13:18:09'),
(39, 21, 1, '2025-06-01', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:01:10', '2025-06-15 05:09:41'),
(40, 22, 1, '2025-06-01', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:03:21', '2025-06-15 05:09:43'),
(41, 23, 1, '2025-06-01', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:05:14', '2025-06-15 05:10:15'),
(42, 24, 1, '2025-06-02', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:06:38', '2025-06-15 05:10:10'),
(43, 25, 1, '2025-06-02', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:07:45', '2025-06-15 05:09:58'),
(44, 26, 1, '2025-06-01', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:09:36', '2025-06-15 05:09:47'),
(45, 27, 1, '2025-06-02', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:15:01', '2025-06-15 07:54:10'),
(46, 28, 1, '2025-06-02', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:16:03', '2025-06-15 07:53:59'),
(47, 29, 1, '2025-05-18', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:18:39', '2025-06-15 07:53:53'),
(48, 30, 1, '2025-05-18', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:19:40', '2025-06-15 07:53:43'),
(49, 31, 1, '2025-05-18', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:21:15', '2025-06-15 07:53:31'),
(50, 32, 1, '2025-05-19', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:22:46', '2025-06-15 07:53:24'),
(51, 33, 1, '2025-05-27', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:24:29', '2025-06-15 07:53:15'),
(52, 34, 1, '2025-05-28', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:25:32', '2025-06-15 07:53:04'),
(53, 35, 1, '2025-05-31', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 05:26:56', '2025-06-15 07:52:34'),
(54, 36, 1, '2025-05-07', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 09:10:41', '2025-06-15 12:02:52'),
(55, 37, 1, '2025-04-05', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 09:12:52', '2025-06-15 12:02:44'),
(56, 38, 1, '2025-04-06', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 09:13:55', '2025-06-15 12:02:17'),
(57, 39, 1, '2025-04-06', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 09:30:51', '2025-06-15 12:02:08'),
(58, 40, 1, '2025-04-07', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 09:33:19', '2025-06-15 09:56:02'),
(59, 41, 1, '2025-04-07', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 09:56:38', '2025-06-15 12:01:46'),
(60, 42, 1, '2025-04-07', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 09:58:08', '2025-06-15 12:01:36'),
(61, 43, 1, '2025-04-07', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 09:59:19', '2025-06-15 12:01:29'),
(62, 44, 1, '2025-04-07', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:06:59', '2025-06-15 12:01:23'),
(63, 45, 1, '2025-04-07', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:08:59', '2025-06-15 12:01:15'),
(64, 46, 1, '2025-04-07', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:09:51', '2025-06-15 12:01:08'),
(65, 47, 1, '2025-04-07', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:13:25', '2025-06-15 12:00:23'),
(66, 48, 1, '2025-04-07', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:15:18', '2025-06-15 12:00:16'),
(67, 49, 1, '2025-04-08', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:16:25', '2025-06-15 12:00:10'),
(68, 50, 1, '2025-04-08', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:17:17', '2025-06-15 12:00:03'),
(69, 51, 1, '2025-04-08', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:18:19', '2025-06-15 11:59:58'),
(70, 52, 1, '2025-04-08', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:19:20', '2025-06-15 11:59:53'),
(71, 53, 1, '2025-04-09', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:20:50', '2025-06-15 11:59:42'),
(72, 54, 1, '2025-04-09', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:22:37', '2025-06-15 11:59:38'),
(73, 55, 1, '2025-04-09', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:24:14', '2025-06-15 11:59:30'),
(74, 56, 1, '2025-04-09', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:25:02', '2025-06-15 11:59:25'),
(75, 57, 1, '2025-04-10', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:29:20', '2025-06-15 11:59:18'),
(76, 58, 1, '2025-04-12', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:30:19', '2025-06-15 11:59:16'),
(77, 59, 1, '2025-04-12', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:31:56', '2025-06-15 11:59:12'),
(78, 60, 1, '2025-04-12', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:33:27', '2025-06-15 11:59:07'),
(79, 61, 1, '2025-04-12', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:34:30', '2025-06-15 11:59:04'),
(80, 62, 1, '2025-04-12', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:35:42', '2025-06-15 11:58:59'),
(81, 63, 1, '2025-04-12', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:36:48', '2025-06-15 11:58:54'),
(82, 64, 1, '2025-04-12', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:38:24', '2025-06-15 11:58:49'),
(83, 65, 1, '2025-04-13', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:39:28', '2025-06-15 11:58:44'),
(84, 66, 1, '2025-04-13', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:41:13', '2025-06-15 11:58:40'),
(85, 67, 1, '2025-04-15', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:42:13', '2025-06-15 11:58:34'),
(86, 68, 1, '2025-04-15', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:43:07', '2025-06-15 11:58:28'),
(87, 69, 1, '2025-04-15', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:44:30', '2025-06-15 11:58:24'),
(88, 70, 1, '2025-04-15', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:45:30', '2025-06-15 11:58:17'),
(89, 71, 1, '2025-04-15', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:46:12', '2025-06-15 11:58:13'),
(90, 72, 1, '2025-04-15', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:48:32', '2025-06-15 11:58:09'),
(91, 73, 1, '2025-04-15', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:49:38', '2025-06-15 11:58:06'),
(92, 74, 1, '2025-04-15', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:50:42', '2025-06-15 11:58:01'),
(93, 75, 1, '2025-04-15', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:52:34', '2025-06-15 11:57:56'),
(94, 76, 1, '2025-04-15', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:53:28', '2025-06-15 11:57:51'),
(95, 77, 1, '2025-04-15', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:54:12', '2025-06-15 11:57:47'),
(96, 78, 1, '2025-04-16', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:54:58', '2025-06-15 11:33:21'),
(97, 79, 1, '2025-04-16', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 10:56:19', '2025-06-15 11:33:06'),
(98, 80, 1, '2025-04-07', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 11:01:56', '2025-06-15 11:57:43'),
(99, 81, 1, '2025-04-08', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 11:03:15', '2025-06-15 11:57:39'),
(100, 82, 1, '2025-05-06', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 11:04:35', '2025-06-15 11:57:34'),
(101, 83, 1, '2025-05-07', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 11:05:13', '2025-06-15 11:57:29'),
(102, 84, 1, '2025-05-20', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 11:06:16', '2025-06-15 11:57:24'),
(103, 85, 1, '2025-05-22', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-15 11:07:49', '2025-06-15 11:57:18'),
(104, 78, 13, '2025-04-16', 2000.00, 1500.00, 500.00, 2000.00, 500.00, 0, '2025-06-15 11:38:02', '2025-06-15 11:38:02'),
(105, 86, 1, '2025-06-16', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-16 14:15:38', '2025-06-16 14:15:43'),
(106, 87, 1, '2025-06-16', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-16 14:16:56', '2025-06-16 14:17:01'),
(107, 88, 1, '2025-06-16', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-16 14:18:02', '2025-06-16 14:18:08'),
(108, 89, 1, '2025-06-16', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-16 14:19:12', '2025-06-16 14:19:17'),
(109, 90, 1, '2025-06-16', 0.00, NULL, NULL, NULL, NULL, 0, '2025-06-17 04:18:38', '2025-06-17 04:18:38'),
(110, 91, 1, '2025-06-16', 0.00, NULL, NULL, NULL, NULL, 0, '2025-06-17 04:22:06', '2025-06-17 04:22:06'),
(111, 92, 1, '2025-06-16', 0.00, NULL, NULL, NULL, NULL, 0, '2025-06-17 04:23:08', '2025-06-17 04:23:08'),
(112, 93, 1, '2025-06-16', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-17 04:24:12', '2025-06-17 06:49:21'),
(113, 95, 1, '2025-06-17', 7000.00, 0.00, 7000.00, 7000.00, 7000.00, 0, '2025-06-17 06:14:56', '2025-06-17 06:14:56'),
(114, 96, 1, '2025-06-17', 7000.00, 0.00, 7000.00, 7000.00, 7000.00, 0, '2025-06-17 06:29:12', '2025-06-17 06:29:29'),
(118, 98, 1, '2025-06-17', 0.00, NULL, NULL, NULL, NULL, 0, '2025-06-17 11:32:52', '2025-06-17 11:32:52'),
(119, 99, 1, '2025-06-17', 0.00, NULL, NULL, NULL, NULL, 0, '2025-06-17 12:00:26', '2025-06-17 12:00:26'),
(120, 95, 13, '2025-06-17', 2000.00, 1500.00, 500.00, 2000.00, 500.00, 0, '2025-06-18 08:50:37', '2025-06-18 08:50:37'),
(121, 95, 6, '2025-06-17', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-18 08:51:59', '2025-06-18 08:52:00'),
(122, 100, 3, '2025-06-18', 2500.00, 2000.00, 500.00, 2500.00, 500.00, 0, '2025-06-18 09:20:57', '2025-06-18 09:23:59'),
(123, 100, 1, '2025-06-18', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-18 09:20:57', '2025-06-18 09:23:59'),
(124, 102, 1, '2025-06-18', 7000.00, 0.00, 7000.00, 7000.00, 7000.00, 0, '2025-06-18 11:06:10', '2025-06-18 11:08:45'),
(126, 103, 1, '2025-06-18', 0.00, NULL, NULL, NULL, NULL, 0, '2025-06-18 11:28:49', '2025-06-18 11:28:49'),
(127, 100, 26, '2025-06-18', 4000.00, 3500.00, 500.00, 4000.00, 500.00, 0, '2025-06-18 12:25:18', '2025-06-18 12:25:18'),
(131, 104, 1, '2025-06-19', 0.00, 0.00, 0.00, 0.00, 0.00, 0, '2025-06-19 07:36:58', '2025-06-19 07:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `status_lists`
--

CREATE TABLE `status_lists` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` int NOT NULL,
  `srl` int NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_for_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_state` tinyint NOT NULL DEFAULT '0' COMMENT '0=Initial State, 1=Middle State, 2=Final State',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Inactive, 1=Active',
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
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `organization` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_payable` double(20,2) NOT NULL DEFAULT '0.00',
  `opening_receivable` double(20,2) NOT NULL DEFAULT '0.00',
  `current_balance` double(20,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
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
  `particular` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `debit_amount` decimal(20,2) DEFAULT NULL,
  `credit_amount` decimal(20,2) DEFAULT NULL,
  `current_balance` decimal(20,2) NOT NULL,
  `reference_number` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
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
  `reference_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `created_by_id` int DEFAULT NULL,
  `updated_by_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `basic_infos`
--
ALTER TABLE `basic_infos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_ledgers`
--
ALTER TABLE `customer_ledgers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `customer_payments`
--
ALTER TABLE `customer_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expense_details`
--
ALTER TABLE `expense_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_heads`
--
ALTER TABLE `expense_heads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `job_service_records`
--
ALTER TABLE `job_service_records`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=521;

--
-- AUTO_INCREMENT for table `medical_centers`
--
ALTER TABLE `medical_centers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

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
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `status_lists`
--
ALTER TABLE `status_lists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
