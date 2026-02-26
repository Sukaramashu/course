-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Фев 26 2026 г., 09:59
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cameraw`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bookings`
--

CREATE TABLE `bookings` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL COMMENT 'NULL если запись без авторизации',
  `service_id` int UNSIGNED NOT NULL,
  `client_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `status` enum('new','confirmed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `cancel_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `service_id`, `client_name`, `client_phone`, `client_email`, `booking_date`, `booking_time`, `status`, `cancel_reason`, `cancelled_at`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Администратор', '+79001234567', 'admin@cameraw.ru', '2026-02-22', '15:00:00', 'cancelled', NULL, NULL, '2026-02-21 08:46:56', '2026-02-21 08:50:01'),
(2, 1, 1, 'Администратор', '+79001234567', 'admin@cameraw.ru', '2026-02-21', '10:00:00', 'new', NULL, NULL, '2026-02-21 08:50:17', '2026-02-21 08:50:17'),
(3, 1, 1, 'Администратор', '+79001234567', 'admin@cameraw.ru', '2026-02-21', '16:00:00', 'cancelled', NULL, NULL, '2026-02-21 10:22:49', '2026-02-24 09:06:03'),
(4, 1, 2, 'Администратор', '+79001234567', 'admin@cameraw.ru', '2026-02-27', '19:00:00', 'new', NULL, NULL, '2026-02-23 12:04:26', '2026-02-23 12:04:26'),
(5, 1, 1, 'Администратор', '+79001234567', 'admin@cameraw.ru', '2026-02-27', '20:00:00', 'confirmed', NULL, NULL, '2026-02-24 17:46:33', '2026-02-24 18:18:27'),
(6, 1, 2, 'Администратор', '+79001234567', 'admin@cameraw.ru', '2026-02-26', '11:00:00', 'new', NULL, NULL, '2026-02-25 16:16:35', '2026-02-25 16:16:35');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Портрет', 'portrait', '2026-02-19 12:03:58', '2026-02-19 12:03:58'),
(2, 'Семейная', 'family', '2026-02-19 12:03:58', '2026-02-19 12:03:58'),
(3, 'Документы', 'documents', '2026-02-19 12:03:58', '2026-02-19 12:03:58'),
(4, 'Предметная', 'product', '2026-02-19 12:03:58', '2026-02-19 12:03:58');

-- --------------------------------------------------------

--
-- Структура таблицы `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `success` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `email`, `ip_address`, `success`, `created_at`) VALUES
(1, 'admin@cameraw.ru', '127.0.0.1', 0, '2026-02-20 19:37:35'),
(2, 'admin@cameraw.ru', '127.0.0.1', 0, '2026-02-20 19:40:51'),
(3, 'admin@cameraw.ru', '127.0.0.1', 0, '2026-02-20 19:45:01'),
(4, 'admin@cameraw.ru', '127.0.0.1', 0, '2026-02-20 19:53:02');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
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

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(4, 'App\\Models\\User', 1, 'auth_token', '04bf47cf220b2389dfea58e8f4e5d0c1b5d072982b5dd9b3b71264b5257a9543', '[\"*\"]', '2026-02-26 03:56:55', NULL, '2026-02-25 01:56:42', '2026-02-26 03:56:55');

-- --------------------------------------------------------

--
-- Структура таблицы `photosessions`
--

CREATE TABLE `photosessions` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `booking_id` int UNSIGNED NOT NULL,
  `max_selections` int UNSIGNED NOT NULL DEFAULT '10' COMMENT 'Максимум фото для выбора клиентом',
  `status` enum('created','waiting_selection','in_progress','ready') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'created',
  `download_expires_at` datetime DEFAULT NULL COMMENT 'Срок действия ссылки на скачивание',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `photosessions`
--

INSERT INTO `photosessions` (`id`, `user_id`, `booking_id`, `max_selections`, `status`, `download_expires_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, 'ready', NULL, '2026-02-21 08:49:03', '2026-02-21 10:20:44'),
(2, 1, 3, 10, 'ready', NULL, '2026-02-21 10:23:28', '2026-02-25 05:22:47'),
(3, 1, 5, 10, 'ready', NULL, '2026-02-24 18:18:27', '2026-02-25 05:22:31');

-- --------------------------------------------------------

--
-- Структура таблицы `photosession_photos`
--

CREATE TABLE `photosession_photos` (
  `id` int UNSIGNED NOT NULL,
  `photosession_id` int UNSIGNED NOT NULL,
  `file_path` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int UNSIGNED NOT NULL COMMENT 'Размер файла в байтах',
  `is_original` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 - исходное фото, 0 - обработанное',
  `is_selected` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Выбрано клиентом для ретуши',
  `comment` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Комментарий клиента к фото',
  `selected_at` datetime DEFAULT NULL COMMENT 'Дата и время выбора фото',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `photosession_photos`
--

INSERT INTO `photosession_photos` (`id`, `photosession_id`, `file_path`, `original_name`, `file_size`, `is_original`, `is_selected`, `comment`, `selected_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'photosession_photos/iHvoq6nSAou72uRhHSaWbH3hzVmoWhdDxD7U7Y4h.png', 'Capture001.png', 2878542, 1, 0, NULL, NULL, '2026-02-21 08:49:12', '2026-02-21 10:20:15'),
(3, 1, 'photosessions/1/originals/GlDCqGdXQLVCvYxi5GjMGB1S5stMAXftMNDbmAue.png', 'Capture001.png', 2878542, 1, 1, NULL, '2026-02-21 10:20:15', '2026-02-21 10:19:11', '2026-02-21 10:20:15'),
(4, 1, 'photosessions/1/originals/SpBrB0Ihxw3PyWFRvmS98ouq4rhc9uXiApRKKcjc.png', 'Capture001.png', 2878542, 1, 1, NULL, '2026-02-21 10:20:15', '2026-02-21 10:19:36', '2026-02-21 10:20:15'),
(5, 1, 'photosessions/1/processed/6lFBZsscIUgssGBvL3QbcQJQCDTWHyJWsbMnxMgM.png', 'Capture001.png', 2878542, 0, 0, NULL, NULL, '2026-02-21 10:20:44', '2026-02-21 10:20:44'),
(6, 2, 'photosessions/2/originals/rZeMVZHMRt7BjDoTj0LXfwWMyQaqzsGJZmzPjulH.png', 'Capture001.png', 2878542, 1, 0, NULL, NULL, '2026-02-21 10:23:47', '2026-02-21 10:23:47'),
(7, 2, 'photosessions/2/originals/7ducqTRCVukdfQldDjvGY3D1hdadvPij55Qaiqq2.jpg', 'Airbrush-IMAGE-ENHANCER-1770915481942-1770915481943.jpg', 1004357, 1, 0, NULL, NULL, '2026-02-23 09:58:36', '2026-02-23 09:58:36'),
(8, 2, 'photosessions/2/originals/J7EYXXEhdRAdl5ZW3XwB5EPnKPtJQBn5UTHHysaP.jpg', '5843972084803307269.jpg', 106229, 1, 0, NULL, NULL, '2026-02-24 15:13:30', '2026-02-24 15:13:30'),
(9, 2, 'photosessions/2/originals/FooLoms2zqpbJ6ey2dDmUgYSnEuZ6ED8ZNB2JTRs.jpg', '5843972084803307269.jpg', 106229, 1, 0, NULL, NULL, '2026-02-24 15:13:44', '2026-02-24 15:13:44');

-- --------------------------------------------------------

--
-- Структура таблицы `portfolio_photos`
--

CREATE TABLE `portfolio_photos` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `file_path` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int UNSIGNED NOT NULL COMMENT 'Размер файла в байтах',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `portfolio_photos`
--

INSERT INTO `portfolio_photos` (`id`, `category_id`, `file_path`, `original_name`, `file_size`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://placehold.co/600x800/png?text=Portrait', 'portrait.jpg', 1024, '2026-02-21 02:06:55', '2026-02-21 02:06:55'),
(2, 2, 'https://placehold.co/800x600/png?text=Family', 'family.jpg', 2048, '2026-02-21 02:06:55', '2026-02-21 02:06:55'),
(3, 3, 'https://placehold.co/600x600/png?text=Docs', 'doc.jpg', 512, '2026-02-21 02:06:55', '2026-02-21 02:06:55'),
(4, 4, 'https://placehold.co/800x800/png?text=Product', 'product.jpg', 1024, '2026-02-21 02:06:55', '2026-02-21 02:06:55'),
(5, 1, 'https://placehold.co/600x800/png?text=Portrait', 'portrait.jpg', 1024, '2026-02-21 02:06:55', '2026-02-21 02:06:55'),
(6, 2, 'https://placehold.co/800x600/png?text=Family', 'family.jpg', 2048, '2026-02-21 02:06:55', '2026-02-21 02:06:55'),
(7, 3, 'https://placehold.co/600x600/png?text=Docs', 'doc.jpg', 512, '2026-02-21 02:06:55', '2026-02-21 02:06:55'),
(8, 4, 'https://placehold.co/800x800/png?text=Product', 'product.jpg', 1024, '2026-02-21 02:06:55', '2026-02-21 02:06:55'),
(12, 1, 'portfolio/yyW2fQX2O21n1cLHatQuN2g930KsHb8u23YAZl0Q.jpg', 'gcp_a_ты_добавил_лишнюю_на(1).jpeg', 315138, '2026-02-24 09:05:42', '2026-02-24 09:05:42');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_from` decimal(10,2) NOT NULL,
  `price_to` decimal(10,2) DEFAULT NULL COMMENT 'NULL если фиксированная цена',
  `duration` int UNSIGNED NOT NULL COMMENT 'Длительность в минутах',
  `photos_included` int UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Количество фото входящих в услугу',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `image`, `price_from`, `price_to`, `duration`, `photos_included`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Фото на документы', 'Срочное фото на паспорт, визу, права и другие документы. Печать в течение 10 минут.', 'services/fH9NTQOc8os4Aq0Z67wUD5Wa6LQsSv7tCjM2Gura.png', '200.00', '600.00', 15, 4, 0, '2026-02-19 12:03:58', '2026-02-24 18:15:47'),
(2, 'Портретная фотосессия', 'Индивидуальная художественная или деловая портретная съёмка в студии.', 'services/yyjo86a1dakPXXb7GTuiDuzDJpEuYApQetdlsGf7.jpg', '2500.00', '4000.00', 60, 10, 1, '2026-02-19 12:03:58', '2026-02-25 15:57:13'),
(3, 'Семейная фотосессия', 'Тёплая семейная съёмка в студии. Подходит для семей с детьми любого возраста.', NULL, '3000.00', '5500.00', 90, 15, 1, '2026-02-19 12:03:58', '2026-02-19 12:03:58'),
(4, 'Печать фотографий', 'Печать цифровых фотографий в различных форматах: 10x15, 15x21, 20x30 и другие.', 'services/EM8py287glgbHLoFp2qsredqnLcosUH0P8VAfyi1.png', '50.00', '500.00', 10, 0, 0, '2026-02-19 12:03:58', '2026-02-25 19:19:28'),
(5, 'Реставрация старых фото', 'Цифровая реставрация старых, повреждённых или выцветших фотографий.', NULL, '500.00', '2000.00', 30, 1, 1, '2026-02-19 12:03:58', '2026-02-19 12:03:58');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('guest','client','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'client',
  `status` enum('active','blocked','unverified') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unverified',
  `email_verified_at` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role`, `status`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Администратор', 'admin@cameraw.ru', '+79001234566', '$2y$10$VkxyZgLL7N7F2sQ8aSVlC.RgdSFzFz.PoI36evom5BWaHGG8ZLreu', 'admin', 'active', '2026-02-19 12:03:58', NULL, '2026-02-19 12:03:58', '2026-02-25 17:53:11'),
(2, 'Админ', 'arjikeys@gmail.com', '+79822402260', '$2y$10$GshjPJ/O4uvDMriRIzD.aO2dj4dVmUSXYgQO1RkvA8U8xcDSyOiaC', 'client', 'active', NULL, NULL, '2026-02-21 06:50:19', '2026-02-21 06:50:19'),
(3, 'Админ', 'admin@gmail.com', '+79822402260', '$2y$10$BSzwYsCTE5CJO9BXycPSbeCq4rYNl9d2WO.a8ZSS7C.7nAvLIydo2', 'client', 'active', NULL, NULL, '2026-02-21 06:52:40', '2026-02-24 15:13:57');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_service_id` (`service_id`),
  ADD KEY `idx_booking_date` (`booking_date`),
  ADD KEY `idx_status` (`status`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Индексы таблицы `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_token` (`token`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `photosessions`
--
ALTER TABLE `photosessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_id` (`booking_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`);

--
-- Индексы таблицы `photosession_photos`
--
ALTER TABLE `photosession_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_photosession_id` (`photosession_id`),
  ADD KEY `idx_is_selected` (`is_selected`),
  ADD KEY `idx_is_original` (`is_original`);

--
-- Индексы таблицы `portfolio_photos`
--
ALTER TABLE `portfolio_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category_id` (`category_id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `photosessions`
--
ALTER TABLE `photosessions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `photosession_photos`
--
ALTER TABLE `photosession_photos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `portfolio_photos`
--
ALTER TABLE `portfolio_photos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_booking_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_booking_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `photosessions`
--
ALTER TABLE `photosessions`
  ADD CONSTRAINT `fk_photosession_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_photosession_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `photosession_photos`
--
ALTER TABLE `photosession_photos`
  ADD CONSTRAINT `fk_photo_photosession` FOREIGN KEY (`photosession_id`) REFERENCES `photosessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `portfolio_photos`
--
ALTER TABLE `portfolio_photos`
  ADD CONSTRAINT `fk_portfolio_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
