-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2021 at 12:45 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Mobile', '2021-12-20 03:01:58', '2021-12-20 03:01:58'),
(2, 'Laptop', '2021-12-20 03:02:28', '2021-12-20 03:02:28'),
(3, 'Computer', '2021-12-20 03:02:38', '2021-12-20 03:02:38'),
(5, 'Football', '2021-12-20 03:08:51', '2021-12-20 03:15:28'),
(7, 'Camera', '2021-12-20 06:51:35', '2021-12-21 05:57:50');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Customer 1', 'customer@gmail.com', '01111111121', 'Mirpur', 'backend/customer/1640154269.jpeg', '2021-12-22 00:11:32', '2021-12-22 00:24:45'),
(3, 'Customer 2', 'customer2@gmail.com', '01111111122', 'Mirpur', 'backend/customer/1640244610.png', '2021-12-23 01:30:11', '2021-12-23 01:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `address`, `salary`, `phone`, `nid`, `photo`, `joining_date`, `created_at`, `updated_at`) VALUES
(14, 'Demo', 'demo@gmail.com', 'Mirpur', '23000', '01111111111', '02132435452', 'backend/employee/1639894440.png', '2021-12-19', '2021-12-19 00:14:00', '2021-12-19 00:14:00'),
(15, 'Demo', 'demo1@gmail.com', 'Mirpur', '23000', '01111111112', '02132435453', 'backend/employee/1639894523.png', '2021-12-19', '2021-12-19 00:15:23', '2021-12-19 00:15:23'),
(16, 'Demo2', 'demo2@gmail.com', 'Mirpur', '23000', '01111111113', '02132435454', 'backend/employee/1639983310.jpeg', '2021-12-19', '2021-12-19 00:17:42', '2021-12-20 00:55:10'),
(24, 'Demo', 'demo3@gmail.com', 'Mirpur', '23000', '01111111114', '02132435455', 'backend/employee/1639916216.jpeg', '2021-12-19', '2021-12-19 05:27:50', '2021-12-19 06:16:56'),
(26, 'Demo', 'demo4@gmail.com', 'Mirpur', '23000', '01111111115', '02132435456', 'backend/employee/1639917918.png', '2021-12-19', '2021-12-19 05:57:22', '2021-12-19 06:45:18');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `details`, `amount`, `expense_date`, `created_at`, `updated_at`) VALUES
(1, 'Current Bill', '500', '2021-12-26', '2021-12-20 23:58:41', '2021-12-20 23:58:41'),
(3, 'Computer Bill', '600', '2021-12-20', '2021-12-21 01:09:09', '2021-12-21 01:33:13');

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--

CREATE TABLE `extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vat` int(11) NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extras`
--

INSERT INTO `extras` (`id`, `vat`, `logo`, `favicon`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 5, '', NULL, '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_12_18_062516_create_employees_table', 2),
(6, '2021_12_20_054929_create_suppliers_table', 3),
(7, '2021_12_20_073529_create_categories_table', 4),
(8, '2021_12_20_095154_create_products_table', 5),
(9, '2021_12_21_052315_create_expenses_table', 6),
(10, '2021_12_21_092542_create_salaries_table', 7),
(11, '2021_12_22_053928_create_customers_table', 8),
(12, '2021_12_22_110549_create_pos_table', 9),
(13, '2021_12_22_131837_create_extras_table', 10),
(14, '2021_12_23_055058_create_orders_table', 11),
(15, '2021_12_23_055318_create_order_details_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `qty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payby` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `qty`, `sub_total`, `vat`, `total`, `pay`, `due`, `payby`, `order_date`, `order_month`, `order_year`, `created_at`, `updated_at`) VALUES
(12, 1, '4', '1400', '5', '1470', '1400', '70', 'HandCash', '23/12/2021', 'December', '2021', '2021-12-23 01:11:59', '2021-12-23 01:11:59'),
(13, 1, '2', '700', '5', '735', '700', '35', 'HandCash', '23/12/2021', 'December', '2021', '2021-12-23 01:17:39', '2021-12-23 01:17:39'),
(14, 1, '2', '700', '5', '735', '735', '0', 'HandCash', '23/12/2021', 'December', '2021', '2021-12-23 01:23:52', '2021-12-23 01:23:52'),
(18, 3, '4', '1400', '5', '1470', '1400', '70', 'Cheaque', '23/12/2021', 'December', '2021', '2021-12-23 03:36:42', '2021-12-23 03:36:42'),
(19, 3, '1', '350', '5', '367.5', '350', '18', 'HandCash', '26/12/2021', 'December', '2021', '2021-12-26 05:05:54', '2021-12-26 05:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `pro_quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `pro_quantity`, `product_price`, `sub_total`, `created_at`, `updated_at`) VALUES
(3, 12, 11, '4', '350', '1400', '2021-12-23 01:11:59', '2021-12-23 01:11:59'),
(4, 13, 10, '2', '350', '700', '2021-12-23 01:17:39', '2021-12-23 01:17:39'),
(5, 14, 9, '2', '350', '700', '2021-12-23 01:23:52', '2021-12-23 01:23:52'),
(11, 18, 5, '1', '350', '350', '2021-12-23 03:36:42', '2021-12-23 03:36:42'),
(12, 18, 6, '1', '350', '350', '2021-12-23 03:36:42', '2021-12-23 03:36:42'),
(13, 18, 7, '2', '350', '700', '2021-12-23 03:36:42', '2021-12-23 03:36:42'),
(14, 19, 11, '1', '350', '350', '2021-12-26 05:05:54', '2021-12-26 05:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `root` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buying_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `buying_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `product_code`, `root`, `buying_price`, `selling_price`, `supplier_id`, `buying_date`, `image`, `quantity`, `created_at`, `updated_at`) VALUES
(3, 3, 'Product 1', 'P1001', 'Root', '300', '350', 3, '2021-12-20', 'backend/products/1640006309.jpeg', '20', '2021-12-20 06:50:16', '2021-12-21 07:06:58'),
(4, 7, 'Product 2', 'P1002', 'Root', '300', '350', 2, '2021-12-20', 'backend/products/1640006291.jpeg', '30', '2021-12-20 06:51:13', '2021-12-21 07:10:23'),
(5, 7, 'Product 3', 'P1003', 'Root', '300', '350', 3, '2021-12-22', 'backend/products/1640158303.jpeg', '49', '2021-12-22 01:31:43', '2021-12-23 03:36:42'),
(6, 5, 'Product 4', 'P1004', 'Root', '300', '350', 2, '2021-12-22', 'backend/products/1640158333.jpeg', '49', '2021-12-22 01:32:13', '2021-12-23 03:36:42'),
(7, 1, 'Product 5', 'P1005', 'Root', '300', '350', 2, '2021-12-22', 'backend/products/1640158366.jpeg', '48', '2021-12-22 01:32:46', '2021-12-23 03:36:42'),
(8, 3, 'Product 6', 'P1006', 'Root', '300', '350', 3, '2021-12-22', 'backend/products/1640158396.jpeg', '20', '2021-12-22 01:33:16', '2021-12-22 01:33:16'),
(9, 2, 'Product 7', 'P1007', 'Root', '300', '350', 3, '2021-12-22', 'backend/products/1640158426.jpeg', '18', '2021-12-22 01:33:46', '2021-12-23 01:23:52'),
(10, 3, 'Product 8', 'P1008', 'Root', '300', '350', 3, '2021-12-22', 'backend/products/1640158474.jpeg', '18', '2021-12-22 01:34:35', '2021-12-23 01:17:39'),
(11, 5, 'Product 9', 'P1009', 'Root', '300', '350', 3, '2021-12-22', 'backend/products/1640158509.jpeg', '15', '2021-12-22 01:35:09', '2021-12-26 05:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`id`, `employee_id`, `amount`, `salary_date`, `salary_month`, `salary_year`, `created_at`, `updated_at`) VALUES
(11, 26, '23000', '21-12-21', 'December', '2021', '2021-12-21 06:03:13', '2021-12-21 06:05:54'),
(12, 24, '23000', '21-12-21', 'November', '2021', '2021-12-21 06:03:18', '2021-12-21 06:03:18'),
(13, 16, '23000', '21-12-21', 'November', '2021', '2021-12-21 06:03:24', '2021-12-21 06:03:24'),
(14, 15, '23000', '21-12-21', 'December', '2021', '2021-12-21 06:03:28', '2021-12-21 06:09:24'),
(15, 14, '23000', '21-12-21', 'November', '2021', '2021-12-21 06:03:36', '2021-12-21 06:03:36'),
(17, 26, '23000', '21-12-21', 'November', '2021', '2021-12-21 06:10:04', '2021-12-21 06:10:04'),
(18, 15, '23000', '21-12-21', 'November', '2021', '2021-12-21 06:10:16', '2021-12-21 06:10:16'),
(19, 24, '23000', '21-12-21', 'December', '2021', '2021-12-21 06:10:34', '2021-12-21 06:10:34'),
(20, 16, '23000', '21-12-21', 'December', '2021', '2021-12-21 06:10:38', '2021-12-21 06:10:38'),
(21, 14, '23000', '21-12-21', 'December', '2021', '2021-12-21 06:10:48', '2021-12-21 06:10:48');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shopname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_name`, `email`, `address`, `phone`, `shopname`, `photo`, `created_at`, `updated_at`) VALUES
(2, 'Supplier 2', 'supplier2@gmail.com', 'Mirpur', '01111111102', 'Abdullah Grocery2', 'backend/supplier/1639982850.png', '2021-12-20 00:47:30', '2021-12-20 00:47:30'),
(3, 'Supplier 1', 'supplier@gmail.com', 'Mirpur', '01111111101', 'Abdullah Grocery', 'backend/supplier/1639984885.jpeg', '2021-12-20 01:06:36', '2021-12-20 06:33:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2a$12$FL1dak0EVJYd.aM4RPlYAuWx2a/MouzOSbdd0ckatGIZoUCr2czyu', NULL, '2021-12-12 06:27:17', '2021-12-12 06:27:17'),
(2, 'demo', 'demo@gmail.com', NULL, '$2y$10$bSQmm9K2JUZqfV.wwKG70e9Naw.4ItW6Y3YvqUDR8Ipuc.fehDk.K', NULL, '2021-12-12 23:49:39', '2021-12-12 23:49:39'),
(3, 'Demo2', 'demo2@gmail.com', NULL, '$2y$10$/vXnX3bwBsfAU4xZDDD2H.6MXcwEu6I.NjA51hYxta.9dBTd78xHK', NULL, '2021-12-15 00:54:08', '2021-12-15 00:54:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
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
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
