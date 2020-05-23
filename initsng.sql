-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 23, 2020 at 01:30 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `initsng`
--

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

DROP TABLE IF EXISTS `businesses`;
CREATE TABLE IF NOT EXISTS `businesses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `rating` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `businesses`
--

INSERT INTO `businesses` (`id`, `name`, `address`, `phone`, `email`, `image`, `website`, `views`, `rating`, `status`, `description`, `created_at`, `updated_at`) VALUES
(9, 'Devchris', 'CAD Zone Plot C5, Dawaki District, Bwari Area Council, Abuja FCT.', '08183780409', 'christopher@devchris.com.ng', 'upload/1590168351.png', 'https://www.devchris.com.ng', 4, '4.50', 'active', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2020-05-22 16:25:51', '2020-05-23 12:09:25'),
(10, 'Initsng', 'Suite SC9 Sparkle plaza off first Avenue Gwarinpa. FCT Abuja Nigeria', '09057041663', 'info@initsng.com', 'upload/1590168421.jpg', 'https://www.initsng.ng', 6, '3.22', 'active', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-05-22 16:27:01', '2020-05-23 07:25:48'),
(11, 'EG Superwash', 'Donatus street, Off RCC Road, Benin-Agbor Road, Benin City, Edo State', '08183780409', 'ehi@ehicodes.com.ng', 'upload/1590171454.jpg', 'https://www.ehicodes.com.ng', 5, '4.50', 'inactive', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', '2020-05-22 17:17:34', '2020-05-23 10:13:27'),
(12, 'Ritalori', 'Suite SC9 Sparkle plaza off first Avenue Gwarinpa. FCT Abuja Nigeria', '08183780409', 'root@ist.com', 'upload/1590187677.jpg', 'https://www.initsng.ng', 2, '0.50', 'active', 'Donatus street, Off RCC Road, Benin-Agbor Road, Benin City, Edo StateDonatus street, Off RCC Road, Benin-Agbor Road, Benin City, Edo State', '2020-05-22 21:47:57', '2020-05-22 21:48:34'),
(13, 'Landslot Int', 'Donatus street, Off RCC Road, Benin-Agbor Road, Benin City, Edo State', '08183780409', 'info@landslot.com.ng', 'upload/1590232370.png', 'https://www.landslot.com', 0, '0.00', 'inactive', 'Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', '2020-05-23 10:12:50', '2020-05-23 11:26:14'),
(14, 'Net Surge', '14 Ademola Tunko Street, Off Lekki Phase II Roundabout', '09057041663', 'info@netsurge.com', 'upload/1590232549.png', 'https://www.netsurge.com.ng', 0, '0.00', 'active', 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', '2020-05-23 10:15:49', '2020-05-23 10:15:49'),
(15, 'Google', '14 Ademola Tunko Street, Off Lekki Phase II Roundabout', '09057041663', 'info@google.com', 'upload/1590232723.png', 'https://google.com', 0, '0.00', 'active', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', '2020-05-23 10:18:43', '2020-05-23 10:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `business_categories`
--

DROP TABLE IF EXISTS `business_categories`;
CREATE TABLE IF NOT EXISTS `business_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_categories`
--

INSERT INTO `business_categories` (`id`, `business_id`, `category_id`, `created_at`, `updated_at`) VALUES
(42, 9, 4, '2020-05-23 12:09:25', '2020-05-23 12:09:25'),
(41, 9, 2, '2020-05-23 12:09:25', '2020-05-23 12:09:25'),
(13, 10, 7, '2020-05-22 17:16:13', '2020-05-22 17:16:13'),
(12, 10, 6, '2020-05-22 17:16:13', '2020-05-22 17:16:13'),
(11, 10, 3, '2020-05-22 17:16:13', '2020-05-22 17:16:13'),
(40, 9, 7, '2020-05-23 12:09:25', '2020-05-23 12:09:25'),
(23, 11, 8, '2020-05-23 10:13:27', '2020-05-23 10:13:27'),
(22, 11, 7, '2020-05-23 10:13:27', '2020-05-23 10:13:27'),
(16, 12, 7, '2020-05-22 21:47:57', '2020-05-22 21:47:57'),
(17, 12, 12, '2020-05-22 21:47:57', '2020-05-22 21:47:57'),
(39, 13, 17, '2020-05-23 11:26:14', '2020-05-23 11:26:14'),
(38, 13, 16, '2020-05-23 11:26:14', '2020-05-23 11:26:14'),
(37, 13, 15, '2020-05-23 11:26:14', '2020-05-23 11:26:14'),
(36, 13, 4, '2020-05-23 11:26:14', '2020-05-23 11:26:14'),
(24, 14, 3, '2020-05-23 10:15:49', '2020-05-23 10:15:49'),
(25, 14, 7, '2020-05-23 10:15:49', '2020-05-23 10:15:49'),
(26, 14, 14, '2020-05-23 10:15:49', '2020-05-23 10:15:49'),
(27, 14, 16, '2020-05-23 10:15:49', '2020-05-23 10:15:49'),
(28, 15, 1, '2020-05-23 10:18:43', '2020-05-23 10:18:43'),
(29, 15, 3, '2020-05-23 10:18:43', '2020-05-23 10:18:43'),
(30, 15, 6, '2020-05-23 10:18:43', '2020-05-23 10:18:43'),
(31, 15, 7, '2020-05-23 10:18:43', '2020-05-23 10:18:43'),
(32, 15, 16, '2020-05-23 10:18:43', '2020-05-23 10:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Information Technology', '2020-05-21 16:47:49', '2020-05-21 16:47:49'),
(2, 'Agriculture', '2020-05-21 16:48:37', '2020-05-23 12:27:17'),
(3, 'Culture &Tourism', '2020-05-21 16:48:49', '2020-05-21 19:52:06'),
(4, 'Mining & Excavation', '2020-05-21 17:12:49', '2020-05-21 19:55:02'),
(6, 'Entertainment', '2020-05-21 17:13:31', '2020-05-21 19:41:01'),
(7, 'Travels and Resort', '2020-05-21 20:24:21', '2020-05-21 20:25:16'),
(8, 'Education', '2020-05-21 20:31:24', '2020-05-21 20:31:24'),
(12, 'Worshop', '2020-05-22 21:47:00', '2020-05-23 11:24:23'),
(13, 'Software development', '2020-05-23 07:29:48', '2020-05-23 07:29:48'),
(14, 'Religion', '2020-05-23 08:30:46', '2020-05-23 08:30:46'),
(15, 'Furniture', '2020-05-23 10:08:40', '2020-05-23 10:08:40'),
(16, 'Upholstery', '2020-05-23 10:08:52', '2020-05-23 12:20:04'),
(17, 'Plumbing & Maintenance', '2020-05-23 10:09:43', '2020-05-23 11:37:29'),
(18, 'Electricals', '2020-05-23 10:33:32', '2020-05-23 10:33:32'),
(19, 'Polish', '2020-05-23 11:51:19', '2020-05-23 12:09:11'),
(20, 'Web development', '2020-05-23 12:10:14', '2020-05-23 12:10:14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 2),
(17, '2020_05_21_162058_create_businesses_table', 3),
(18, '2020_05_21_162141_create_categories_table', 3),
(19, '2020_05_21_162155_create_images_table', 3),
(20, '2020_05_21_163142_create_business_categories_table', 3),
(21, '2020_05_22_105755_create_ratings_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE IF NOT EXISTS `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `business_id`, `rating`, `created_at`, `updated_at`) VALUES
(1, '10', 3.00, '2020-05-22 21:18:37', '2020-05-22 21:18:37'),
(2, '10', 3.00, '2020-05-22 21:19:03', '2020-05-22 21:19:03'),
(3, '10', 3.00, '2020-05-22 21:19:35', '2020-05-22 21:19:35'),
(4, '10', 2.50, '2020-05-22 21:29:02', '2020-05-22 21:29:02'),
(5, '10', 4.50, '2020-05-22 21:31:32', '2020-05-22 21:31:32'),
(6, '10', 1.00, '2020-05-22 21:32:29', '2020-05-22 21:32:29'),
(7, '10', 3.50, '2020-05-22 21:33:26', '2020-05-22 21:33:26'),
(14, '11', 3.50, '2020-05-22 21:45:58', '2020-05-22 21:45:58'),
(13, '11', 2.50, '2020-05-22 21:45:43', '2020-05-22 21:45:43'),
(15, '9', 4.50, '2020-05-22 21:46:15', '2020-05-22 21:46:15'),
(16, '12', 0.50, '2020-05-22 21:48:34', '2020-05-22 21:48:34'),
(17, '10', 5.00, '2020-05-23 05:09:00', '2020-05-23 05:09:00'),
(18, '11', 5.00, '2020-05-23 05:13:37', '2020-05-23 05:13:37'),
(19, '10', 3.50, '2020-05-23 07:25:48', '2020-05-23 07:25:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Christopher Okokon Ntuk', 'engchris95@gmail.com', NULL, '$2y$10$gSXacOGIheb76Ud.EomTbuF3o/L0o02XJNsv1SYw4DXRQDb1pczhu', NULL, '2020-05-21 13:40:44', '2020-05-21 13:40:44');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
