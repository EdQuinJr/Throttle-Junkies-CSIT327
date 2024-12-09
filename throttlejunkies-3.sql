-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 09, 2024 at 06:45 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `throttlejunkies`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add products', 8, 'add_products'),
(30, 'Can change products', 8, 'change_products'),
(31, 'Can delete products', 8, 'delete_products'),
(32, 'Can view products', 8, 'view_products');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Cart`
--

CREATE TABLE `Cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(8, 'shop', 'products'),
(7, 'shop', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-09-29 09:26:28.000000'),
(2, 'auth', '0001_initial', '2024-09-29 09:26:30.000000'),
(3, 'admin', '0001_initial', '2024-09-29 09:26:30.000000'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-09-29 09:26:30.000000'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-09-29 09:26:30.000000'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-09-29 09:26:31.000000'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-09-29 09:26:31.000000'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-09-29 09:26:31.000000'),
(9, 'auth', '0004_alter_user_username_opts', '2024-09-29 09:26:31.000000'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-09-29 09:26:31.000000'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-09-29 09:26:31.000000'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-09-29 09:26:31.000000'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-09-29 09:26:31.000000'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-09-29 09:26:32.000000'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-09-29 09:26:32.000000'),
(16, 'auth', '0011_update_proxy_permissions', '2024-09-29 09:26:32.000000'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-09-29 09:26:32.000000'),
(18, 'sessions', '0001_initial', '2024-09-29 09:26:32.000000'),
(19, 'shop', '0001_initial', '2024-09-29 12:52:55.000000'),
(20, 'shop', '0002_remove_user_phone_remove_user_role_and_more', '2024-09-29 15:04:37.000000'),
(21, 'shop', '0002_alter_user_user_id', '2024-09-29 15:56:19.000000'),
(22, 'shop', '0003_user_last_login', '2024-09-29 16:04:39.000000'),
(23, 'shop', '0004_alter_user_password', '2024-09-29 16:26:03.000000'),
(24, 'shop', '0003_user_last_login_alter_user_password', '2024-09-29 18:29:32.000000'),
(25, 'shop', '0004_products', '2024-11-28 16:27:45.000000'),
(26, 'shop', '0005_alter_products_product_type', '2024-11-28 20:41:24.000000'),
(27, 'shop', '0006_auto_20241202_1119', '2024-12-02 11:23:35.000000'),
(28, 'shop', '0007_cart_orders_payments', '2024-12-03 16:25:23.000000');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('c6jttpra44dokhzf74djjyuhah1rn2d1', '.eJxVi0EOwiAQRe_C2jQMMCAuTTwHocMQiEqN0JXx7raJC939_PfeS4S4jhLWzs9QkzgJMOLwe86Rrtx20svymHbAbVSKoy5tutxjvZ2_yl9XYi9b5BwBZ7KgrLHSa8AZGDyy9M74BFFaMtuy5JHAocZk8MheZ5UdKiXeH8qhM4M:1tKMFT:7dtJK0yKyg9ZlDmsT4yHm8U9Fs6Nv4U9-NmrVBHE5J4', '2024-12-22 18:43:19.000000'),
('iykln7nko390wfbtel3sg5i4azyvrif5', '.eJxVizsOwjAQBe_iGkXrT8JCicQ5rN21LVuAg2KnQtydRKKA5hVvZl7K09qzX1tcfAnqrLQ6_H5Mcot1By3Pz2EHsfYi1Mtch-uDyv3yVf66TC1v0YR0BO2MZcRAVtgImJQEBLYZ0YFNJwAj6EIaNRKlZJG0mQIzsqj3B9CRNSY:1tI78e:dtdBtMzIZScqRCgp6UNCjgF5hltAyKbCo4kjToeGhpU', '2024-12-16 14:11:00.000000'),
('wxyjw289znvqxpsv37hs31jrwht885hb', '.eJxVizsOwjAQBe_iGkXrT8JCicQ5rN21LVuAg2KnQtydRKKA5hVvZl7K09qzX1tcfAnqrLQ6_H5Mcot1By3Pz2EHsfYi1Mtch-uDyv3yVf66TC1v0YR0BO2MZcRAVtgImJQEBLYZ0YFNJwAj6EIaNRKlZJG0mQIzsqj3B9CRNSY:1t6nQE:NfT423Y-X86--E8r9-GVmWIvTmA--XzdVvZkCUdlAqI', '2024-11-15 08:54:22.000000');

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`order_id`, `user_id`, `order_date`, `total_amount`) VALUES
(1, 1, '2024-12-02 05:50:58', 15000.00),
(2, 1, '2024-12-02 06:00:31', 119000.00),
(3, 1, '2024-12-03 00:26:58', 45000.00),
(4, 1, '2024-12-03 07:32:55', 45000.00),
(5, 1, '2024-12-03 09:29:24', 45000.00),
(6, 1, '2024-12-03 09:53:18', 54000.00),
(7, 1, '2024-12-03 10:03:20', 63000.00),
(8, 14, '2024-12-08 12:27:05', 6000.00),
(9, 14, '2024-12-08 15:26:20', 18000.00),
(10, 14, '2024-12-08 20:27:19', 42000.00),
(11, 14, '2024-12-08 20:47:29', 9000.00);

-- --------------------------------------------------------

--
-- Table structure for table `Order_Items`
--

CREATE TABLE `Order_Items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Payments`
--

CREATE TABLE `Payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','completed','failed','refunded','canceled') DEFAULT 'completed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Payments`
--

INSERT INTO `Payments` (`payment_id`, `order_id`, `payment_date`, `amount`, `status`) VALUES
(1, 5, '2024-12-03 09:47:53', 45000.00, 'completed'),
(2, 6, '2024-12-03 09:53:43', 54000.00, 'completed'),
(3, 7, '2024-12-03 10:03:38', 63000.00, 'completed'),
(4, 8, '2024-12-08 15:20:39', 6000.00, 'completed'),
(5, 9, '2024-12-08 15:28:14', 18000.00, 'completed'),
(6, 10, '2024-12-08 20:27:37', 42000.00, 'completed'),
(7, 11, '2024-12-08 20:47:58', 9000.00, 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `product_type` varchar(50) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`product_id`, `name`, `product_type`, `brand`, `price`, `year`, `description`, `stock_quantity`) VALUES
(1, 'Nmax', 'motorcycle', 'Yamaha', 3000.00, 2022, 'The Yamaha Nmax is a stylish, comfortable, and efficient scooter known for its performance and advanced features. Ideal for urban commuting.', 10),
(2, 'YZF-R1', 'motorcycle', 'Yamaha', 17000.00, 2023, 'The Yamaha YZF-R1 is a high-performance superbike, designed for racing enthusiasts who demand precision and speed.', 5),
(3, 'XSR', 'motorcycle', 'Yamaha', 9000.00, 2022, 'The Yamaha XSR is a modern-classic motorcycle that combines retro styling with advanced technology for a unique riding experience.', 8);

-- --------------------------------------------------------

--
-- Table structure for table `shop_user`
--

CREATE TABLE `shop_user` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role` varchar(15) NOT NULL,
  `surname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `role` enum('customer','administrator') DEFAULT 'customer',
  `last_login` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `first_name`, `surname`, `email`, `phone`, `password`, `role`, `last_login`) VALUES
(1, 'Edgar', 'Quindao', 'quindaoedgar122216@gmail.com', '1234567890', 'pbkdf2_sha256$870000$4HODIGNhAkKoRt51ZjSioO$iVM2gVO/g4uC44U3sQap583YxPcacpHZyckn9bafVzM=', 'customer', '2024-12-08 18:07:23.000000'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '0987654321', 'pbkdf2_sha256$870000$TVjNVh9j87nAhWIr3XKFHW$9yatOgOV1Unh5jcz/H8lrfsQ3sbLndqbTtI1diSb9GM=', 'customer', NULL),
(3, 'Mike', 'Johnson', 'mikejohnson@example.com', '1122334455', 'pbkdf2_sha256$870000$XLGn9CECHBBXWRhNKj3m0P$RucxKHM6g2d1jUvFHTD4kdoTRzyJHv0dV1Fqz6Q1Dgk=', 'customer', NULL),
(4, 'Emily', 'Brown', 'emilybrown@example.com', '5566778899', 'pbkdf2_sha256$870000$T8szdwJAHeCHK9FQPQGZK7$42bTkdK00USQS2SSe3rS4MW6HIhwi4WrqPOJG0+pUck=', 'customer', NULL),
(5, 'David', 'Wilson', 'davidwilson@example.com', '6677889900', 'pbkdf2_sha256$870000$PvrZijLzBbPZQ1de1n1JHP$t5x9mR0NUFLzLEhivEJjJhSNJA10FgK2iCm34/e4cfk=', 'customer', NULL),
(6, 'Sarah', 'Lee', 'sarahlee@example.com', '1010101010', 'pbkdf2_sha256$870000$pf66PtMgrMkwz4pjL7SqA6$rvJ95NGXNlq2Y2R5q9ptoGuFLkb0X6ejGf4fABQaFaQ=', 'customer', NULL),
(7, 'Chris', 'Martinez', 'chrismartinez@example.com', '1212121212', 'pbkdf2_sha256$870000$I9MFi53WqbzpgKmmRAn0lc$q5M9EawEeEtli1nIKfo26I8QreR+Pwwr8iamYXixbIM=', 'customer', NULL),
(8, 'Sophia', 'Garcia', 'sophiagarcia@example.com', '1313131313', 'pbkdf2_sha256$870000$QrX9XWWDlmLvL46CJhEUPa$OU+xYF2JiVaIoxieHd1jIZHq1RVT8DY9hveuMyY3v3w=', 'customer', NULL),
(9, 'James', 'Anderson', 'jamesanderson@example.com', '1414141414', 'pbkdf2_sha256$870000$daCxmulgVi6qR4gHPo8Dhp$udF1fE3vfpVs2/1WTWBPg9J7T8/vjfpBEso23a+VC5I=', 'customer', NULL),
(10, 'Olivia', 'Harris', 'oliviaharris@example.com', '1515151515', 'pbkdf2_sha256$870000$KRDKBROHtZiHVmgTgfKLcT$fBk7X0gU5gnSe4WMnMH4GUS+F/5YBz1roAFHW9ihIgM=', 'customer', NULL),
(13, 'edgardo', 'quindalo', 'quindao@gmail.com', NULL, 'pbkdf2_sha256$870000$4O65QXTR6iq22hYfFPas9x$9rAJkk19+VjPgt6avL523fk70d7pb1FP9dNZo3lKo20=', 'customer', NULL),
(14, 'peter', 'peter', 'peter@gmail.com', NULL, 'pbkdf2_sha256$870000$TED3JJLeTefrO5YVSOdX4U$gmM8c3FVp+f0a+FjdB7dY9xjBEjvtZx+/E6ZNWKjU3U=', 'customer', '2024-12-09 04:57:57.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `Cart`
--
ALTER TABLE `Cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `fk_cart_user` (`user_id`),
  ADD KEY `fk_cart_product` (`product_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Order_Items`
--
ALTER TABLE `Order_Items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `Payments`
--
ALTER TABLE `Payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `shop_user`
--
ALTER TABLE `shop_user`
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Cart`
--
ALTER TABLE `Cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Order_Items`
--
ALTER TABLE `Order_Items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Payments`
--
ALTER TABLE `Payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `Cart`
--
ALTER TABLE `Cart`
  ADD CONSTRAINT `fk_cart_product` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `Order_Items`
--
ALTER TABLE `Order_Items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `Payments`
--
ALTER TABLE `Payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
