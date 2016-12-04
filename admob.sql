-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2016 at 06:17 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admob`
--

-- --------------------------------------------------------

--
-- Table structure for table `ad_info`
--

CREATE TABLE `ad_info` (
  `ad_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `location_zip` text NOT NULL,
  `ad_link_key` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_info`
--

INSERT INTO `ad_info` (`ad_id`, `category_id`, `merchant_id`, `location_zip`, `ad_link_key`) VALUES
(2, 1, 1, 'ALL', 'QWI3APw11ic'),
(3, 1, 3, 'ALL', 'RGeCc7i72Zw'),
(6, 1, 2, 'ALL', '4_I9Vq7xStI'),
(7, 2, 4, 'ALL', 'rSwL43IobEQ'),
(10, 2, 5, 'ALL', 'MGuF2-AuWCU'),
(12, 2, 6, 'ALL', 'x9jet-SheMc'),
(13, 3, 7, 'ALL', 'Wo6BkRgvYF8'),
(14, 3, 8, 'ALL', 'vgBhE_khEaQ'),
(15, 3, 9, '560103,60290', 'afNui1C6oK0'),
(16, 4, 10, '560103', 'RnxMw0hzBE4'),
(17, 4, 11, '110005', '0hbWpQPrL4E'),
(18, 4, 12, 'ALL', 'qRgJSCjQau8'),
(19, 5, 14, 'ALL', 'idc9RRgN8'),
(20, 5, 15, '462016,530032,560103', '7C5gQLw3Yno'),
(21, 5, 13, 'ALL', 'Zp1lyHilNkU'),
(22, 9, 19, '462016,530032,400090,110005,560076', 'Rq_YBk8pRL4'),
(23, 8, 16, 'ALL', 'c9uruFJxmVY'),
(24, 8, 17, 'ALL', '4Tg1FtQLWo0'),
(25, 8, 18, '110005,560103', 'ud03uuaC5f0'),
(26, 9, 20, 'ALL', 'GAnalh4tpfk'),
(27, 9, 21, 'ALL', 'E_R5FXEiX84'),
(28, 10, 22, 'ALL', 'JusVKejDgA8'),
(29, 10, 23, 'ALL', '_y8W3IcKBMY'),
(30, 10, 24, 'ALL', 'zR2Y9-polFk'),
(31, 15, 25, '462016,400090,110005,560076', 'a9VWxdITjLA'),
(32, 15, 26, 'ALL', '5gYZ5VBrOsg'),
(33, 15, 27, '530032', '5gYZ5VBrOsg '),
(34, 12, 28, 'ALL', 'Q6dsRpVyyWs'),
(35, 12, 29, 'ALL', 'BzMLA8YIgG0'),
(36, 12, 30, '492010,530032,110005', '_gYdwWxSXBM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Loans'),
(2, 'ATM Withdrawls'),
(3, 'General Merchandise'),
(4, 'Jwellery'),
(5, 'Utilities'),
(8, 'Entertainment'),
(9, 'Meals/Dining'),
(10, 'Travel\r\n'),
(12, 'Electronics\r\n'),
(15, 'Health and Medical'),
(16, 'Automobile');

-- --------------------------------------------------------

--
-- Table structure for table `category_age_weightage`
--

CREATE TABLE `category_age_weightage` (
  `category_age_weightage_id` int(11) NOT NULL,
  `fb_age_category_type` int(11) NOT NULL,
  `category_id` text NOT NULL,
  `weight` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_age_weightage`
--

INSERT INTO `category_age_weightage` (`category_age_weightage_id`, `fb_age_category_type`, `category_id`, `weight`) VALUES
(1, 1, '1,2,3,4,5,8,9,10,12,15', '0,0,2,0,1,2,3,1,0,4'),
(2, 2, '1,2,3,4,5,8,9,10,12,15', '0,1,2,1,1,3,3,2,1,3'),
(3, 3, '1,2,3,4,5,8,9,10,12,15', '2,3,2,2,1,3,3,1,3,1'),
(4, 4, '1,2,3,4,5,8,9,10,12,15', '2,2,1,1,1,3,4,4,4,2'),
(5, 5, '1,2,3,4,5,8,9,10,12,15', '3,2,4,3,1,3,4,3,1,3');

-- --------------------------------------------------------

--
-- Table structure for table `category_user`
--

CREATE TABLE `category_user` (
  `user_id` int(11) NOT NULL,
  `category_list` text NOT NULL,
  `merchant_list` text NOT NULL,
  `amount_list` text NOT NULL,
  `location` varchar(6) NOT NULL,
  `weight_list` text NOT NULL,
  `weight_list_runtime` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_user`
--

INSERT INTO `category_user` (`user_id`, `category_list`, `merchant_list`, `amount_list`, `location`, `weight_list`, `weight_list_runtime`) VALUES
(2, '3,8,10,15', '9,16,23,25,26', '5000,1560,8000,2000', '560103', '30,10,48,12', '0,0,0,0'),
(3, '2,3,4,5,8,12', '4,5,7,8,10,15,18,25,26,27', '5000,7000,6000,2345,2331,3312', '110005', '19.2,26.9,23.08,9,10,11', '0,0,0,0,0,0');

-- --------------------------------------------------------

--
-- Table structure for table `celebrity_endorsement_weightage`
--

CREATE TABLE `celebrity_endorsement_weightage` (
  `celebrity_id` int(11) NOT NULL,
  `celebrity_name` text NOT NULL,
  `endorsement_list` text NOT NULL,
  `popularity` text NOT NULL,
  `weight_list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `celebrity_endorsement_weightage`
--

INSERT INTO `celebrity_endorsement_weightage` (`celebrity_id`, `celebrity_name`, `endorsement_list`, `popularity`, `weight_list`) VALUES
(1, 'Johnny Manziel', '31,32,33', '1', '1,0.8,1.2'),
(2, 'Aishwarya Rai', '10,11', '1', '1,1.3'),
(3, 'Ranbir Kapoor', '22,23', '1', '1,1'),
(4, 'Aliya Bhatt', '22,23', '1', '1,1'),
(5, 'Song Joong-ki', '19', '1', '1.1'),
(6, 'Oprah', '28', '1', '1'),
(7, 'Muhammad Ali ', '20', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `fb_like_merchant_weightage`
--

CREATE TABLE `fb_like_merchant_weightage` (
  `fb_like_merchant_weightage_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `weightage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fb_like_merchant_weightage`
--

INSERT INTO `fb_like_merchant_weightage` (`fb_like_merchant_weightage_id`, `merchant_id`, `weightage`) VALUES
(1, 1, '0.8'),
(2, 2, '1.2'),
(3, 3, '0.7'),
(4, 4, '0.65'),
(5, 5, '1.5'),
(6, 6, '0.9'),
(7, 7, '0.68'),
(8, 8, '1.2');

-- --------------------------------------------------------

--
-- Table structure for table `fb_user`
--

CREATE TABLE `fb_user` (
  `fb_user_id` int(11) NOT NULL,
  `category_user_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `age` int(11) NOT NULL,
  `education` text NOT NULL,
  `gender` text NOT NULL,
  `hometown` text NOT NULL,
  `interested_in` text NOT NULL,
  `date_of_birth` date NOT NULL,
  `sports` text NOT NULL,
  `books` text NOT NULL,
  `events` text NOT NULL,
  `likes` text NOT NULL,
  `checkins` text NOT NULL,
  `work` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fb_user`
--

INSERT INTO `fb_user` (`fb_user_id`, `category_user_id`, `name`, `age`, `education`, `gender`, `hometown`, `interested_in`, `date_of_birth`, `sports`, `books`, `events`, `likes`, `checkins`, `work`) VALUES
(2, 2, 'Praveen Bhukya', 22, 'B.Tech', 'Male', 'Hyderabad', '', '1994-04-14', 'cricket', 'Anita Desai', '', 'Amazon, Aishwarya Rai', '', 'Author'),
(3, 3, 'Sourav Mandal', 21, 'Phd\r\n', 'Male\r\n', 'Mumbai\r\n\r\n', 'Music\r\n', '1995-06-01', '\r\nVolley Ball', '', '', '', '', ''),
(4, 4, 'Ambar Mainini', 21, 'MBBS', 'Female', 'Delhi\r\n', 'Pencil Sketching, arts\r\n', '1995-02-13', 'BaseBall\r\n', '', '', 'Sachin, Shahid Kapoor', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `merchant`
--

CREATE TABLE `merchant` (
  `merchant_id` int(11) NOT NULL,
  `merchant_name` varchar(100) NOT NULL,
  `Category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `merchant`
--

INSERT INTO `merchant` (`merchant_id`, `merchant_name`, `Category_id`) VALUES
(0, '', 0),
(1, 'TATA CAPITAL', 1),
(2, 'INDIABULLS', 1),
(3, 'SBILOANS', 1),
(4, 'PAYTM', 2),
(5, 'FREECHARGE', 2),
(6, 'MOBIKWIK', 2),
(7, 'AMAZON', 3),
(8, 'FLIPKART', 3),
(9, 'PUMA', 3),
(10, 'TANISHQ', 4),
(11, 'LAKSHMI JEWELLERY', 4),
(12, 'PC CHANDRA ', 4),
(13, 'BIGBASKET', 5),
(14, 'GROFERS', 5),
(15, 'BIG BAZAAR', 5),
(16, 'BOOKMYSHOW', 8),
(17, 'RED CHILLIES ENTERTAINMENT', 8),
(18, 'WONDERLA', 8),
(19, 'DOMINOS', 9),
(20, 'PIZZA HUT', 9),
(21, 'SWIGGY', 9),
(22, 'MAKEMYTRIP', 10),
(23, 'CLEARTRIP', 10),
(24, 'EASYTRIP', 10),
(25, 'PRACTO', 15),
(26, 'ZOCTR', 15),
(27, 'MEDIKABAZAAR', 15),
(28, 'APPLE', 12),
(29, 'MICROSOFT', 12),
(30, 'SONY', 12),
(31, 'Mc DONALD''S', 9),
(32, 'NIKE', 3),
(33, 'NISSAN', 16);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('smandal@yodlee.com', '2b2911953b9291a721ffa5aec5e2d63d1dda25e430a89a7fa6c9341d7eb4aff9', '2016-11-19 15:00:44');

-- --------------------------------------------------------

--
-- Table structure for table `recurring_category`
--

CREATE TABLE `recurring_category` (
  `user_id` int(11) NOT NULL,
  `category_list` text NOT NULL,
  `Expected_Date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recurring_category`
--

INSERT INTO `recurring_category` (`user_id`, `category_list`, `Expected_Date`) VALUES
(2, '8', '2016-12-06'),
(3, '2', '2016-12-04');

-- --------------------------------------------------------

--
-- Table structure for table `twitter_user`
--

CREATE TABLE `twitter_user` (
  `twitter_user_id` int(11) NOT NULL,
  `category_user_id` int(11) NOT NULL,
  `user_name` text NOT NULL,
  `following_list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `twitter_user`
--

INSERT INTO `twitter_user` (`twitter_user_id`, `category_user_id`, `user_name`, `following_list`) VALUES
(2, 2, 'Praveen Bhukya', '2,4'),
(3, 3, 'Sourav Mandal', '3'),
(4, 4, 'Ambar Mainini', '6');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Tom Cruise', 'tom@yodlee.com', '$2y$10$uVM/FC1kGkkq8WlfLF.BsuwT74luXAw1B6t47jFHOmK4NUH95235y', 'zSEApuqbXAkPLxuWF1j2CvvaTq4Ql6XItOCtL7TNOAgJgYgUiPEvhj06xoap', '2016-11-20 05:37:00', '2016-11-29 04:37:11'),
(3, 'Shah Rukh Khan', 'srk@yodlee.com', '$2y$10$T5Z7mOpZ8G9emtDezmnxWO46YD7YBAxZMdIWQetGGEV3aCBV8LK7.', 'iCeKmyJwS3XfGLKMqL79pRz77vhPWVgnHIEl9seJPYE0wgHd1GYSdYK5QoDu', '2016-11-20 07:22:17', '2016-11-29 03:40:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad_info`
--
ALTER TABLE `ad_info`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `fk_category` (`category_id`),
  ADD KEY `fk_merchant` (`merchant_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `category_user`
--
ALTER TABLE `category_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `celebrity_endorsement_weightage`
--
ALTER TABLE `celebrity_endorsement_weightage`
  ADD PRIMARY KEY (`celebrity_id`);

--
-- Indexes for table `fb_like_merchant_weightage`
--
ALTER TABLE `fb_like_merchant_weightage`
  ADD PRIMARY KEY (`fb_like_merchant_weightage_id`);

--
-- Indexes for table `fb_user`
--
ALTER TABLE `fb_user`
  ADD UNIQUE KEY `fb_user_id` (`fb_user_id`);

--
-- Indexes for table `merchant`
--
ALTER TABLE `merchant`
  ADD PRIMARY KEY (`merchant_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `recurring_category`
--
ALTER TABLE `recurring_category`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `twitter_user`
--
ALTER TABLE `twitter_user`
  ADD PRIMARY KEY (`twitter_user_id`);

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
-- AUTO_INCREMENT for table `ad_info`
--
ALTER TABLE `ad_info`
  MODIFY `ad_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ad_info`
--
ALTER TABLE `ad_info`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `fk_merchant` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
