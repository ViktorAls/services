-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.20 - MySQL Community Server (GPL)
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных service
CREATE DATABASE IF NOT EXISTS `service` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `service`;

-- Дамп структуры для таблица service.connection
CREATE TABLE IF NOT EXISTS `connection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `picture_json` text COLLATE utf8mb4_unicode_ci,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domains` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `connection_user_id_foreign` (`user_id`),
  CONSTRAINT `connection_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы service.connection: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `connection` DISABLE KEYS */;
INSERT INTO `connection` (`id`, `picture_json`, `key`, `domains`, `created_at`, `updated_at`, `user_id`) VALUES
	(2, '[{"id":25},{"id":26},{"id":15},{"id":32},{"id":17},{"id":24},{"id":19},{"id":21},{"id":20},{"id":18},{"id":22},{"id":16},{"id":8},{"id":2},{"id":13},{"id":10},{"id":11},{"id":4},{"id":7},{"id":3},{"id":9},{"id":5},{"id":29},{"id":31}]', '18a998c0baa2b9fed9e44e03737c1b21554751a1', 'рпав', '2019-04-15 15:17:33', '2019-04-15 16:36:43', 10);
/*!40000 ALTER TABLE `connection` ENABLE KEYS */;

-- Дамп структуры для таблица service.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы service.migrations: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_03_28_072612_create_pictures_table', 1),
	(4, '2019_03_28_072710_create_connection_table', 1),
	(6, '2019_03_17_165448_create_role_table', 2),
	(7, '2019_03_17_165749_create_user_role_table', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Дамп структуры для таблица service.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы service.password_resets: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Дамп структуры для таблица service.pictures
CREATE TABLE IF NOT EXISTS `pictures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture_url` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pictures_user_id_foreign` (`user_id`),
  CONSTRAINT `pictures_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы service.pictures: ~302 rows (приблизительно)
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` (`id`, `url`, `picture_url`, `created_at`, `updated_at`, `user_id`) VALUES
	(4, '452fghjkl;\'', 'VzNYv2Bx2Cgr8RDbYnVy.png', '2019-04-15 14:09:46', '2019-04-15 14:10:14', 10),
	(5, '452fghjkl;\'', 'VzNYv2Bx2Cgr8RDbYnVy.png', '2019-04-15 14:09:46', '2019-04-15 14:10:14', 10),
	(6, '452fghjkl;\'', 'VzNYv2Bx2Cgr8RDbYnVy.png', '2019-04-15 14:09:46', '2019-04-15 14:10:14', 10),
	(7, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(8, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(9, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(10, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(11, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(12, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(13, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(14, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(15, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(16, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(17, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(18, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(19, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(20, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(21, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(22, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(23, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(24, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(25, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(26, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(27, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(28, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(29, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(30, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(31, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(32, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(33, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(34, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(35, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(36, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(37, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(38, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(39, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(40, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(41, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(42, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(43, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(44, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(45, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(46, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(47, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(48, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(49, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(50, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(51, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(52, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(53, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(54, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(55, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(56, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(57, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(58, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(59, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(60, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(61, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(62, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(63, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(64, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(65, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(66, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(67, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(68, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(69, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(70, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(71, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(72, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(73, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(74, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(75, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(76, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(77, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(78, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(79, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(80, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(81, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(82, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(83, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(84, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(85, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(86, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(87, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(88, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(89, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(90, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(91, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(92, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(93, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(94, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(95, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(96, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(97, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(98, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(99, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(100, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(101, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(102, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(103, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(104, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(105, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(106, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(107, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(108, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(109, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(110, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(111, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(112, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(113, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(114, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(115, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(116, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(117, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(118, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(119, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(120, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(121, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(122, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(123, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(124, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(125, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(126, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(127, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(128, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(129, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(130, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(131, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(132, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(133, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(134, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(135, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(136, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(137, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(138, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(139, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(140, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(141, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(142, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(143, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(144, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(145, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(146, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(147, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(148, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(149, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(150, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(151, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(152, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(153, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(154, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(155, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(156, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(157, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(158, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(159, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(160, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(161, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(162, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(163, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(164, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(165, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(166, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(167, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(168, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(169, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(170, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(171, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(172, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(173, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(174, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(175, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(176, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(177, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(178, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(179, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(180, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(181, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(182, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(183, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(184, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(185, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(186, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(187, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(188, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(189, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(190, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(191, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(192, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(193, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(194, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(195, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(196, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(197, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(198, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(199, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(200, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(201, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(202, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(203, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(204, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(205, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(206, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(207, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(208, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(209, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(210, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(211, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(212, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(213, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(214, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(215, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(216, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(217, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(218, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(219, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(220, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(221, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(222, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(223, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(224, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(225, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(226, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(227, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(228, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(229, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(230, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(231, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(232, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(233, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(234, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(235, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(236, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(237, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(238, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(239, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(240, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(241, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(242, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(243, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(244, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(245, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(246, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(247, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(248, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(249, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(250, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(251, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(252, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(253, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(254, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(255, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(256, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(257, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(258, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(259, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(260, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(261, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(262, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(263, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(264, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(265, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(266, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(267, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(268, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(269, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(270, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(271, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(272, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(273, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(274, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(275, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(276, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(277, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(278, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(279, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(280, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(281, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(282, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(283, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(284, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(285, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(286, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(287, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(288, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(289, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(290, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(291, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(292, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(293, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(294, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(295, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(296, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(297, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(298, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(299, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(300, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(301, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10),
	(302, 'авпвапв', 'bvH6fwo0AJQCJ1ww4uzF.png', '2019-04-15 14:09:54', '2019-04-15 14:09:54', 10);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;

-- Дамп структуры для таблица service.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы service.roles: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `created_at`, `updated_at`, `name`) VALUES
	(5, '2019-03-28 13:57:58', '2019-03-28 13:57:58', 'admin'),
	(7, '2019-03-28 13:58:10', '2019-03-28 13:58:10', 'manager');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Дамп структуры для таблица service.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы service.users: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(10, 'Ivan', 'vip.viktor98@inbox.ru', '$2y$10$t1N7T7kgYXz71klnFiMqYOipi5sKj/nyKt7MhfR3B4eJw2h/jThJu', NULL, '2019-04-12 15:07:22', '2019-04-12 15:07:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Дамп структуры для таблица service.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role_user_id_foreign` (`user_id`),
  KEY `user_role_role_id_foreign` (`role_id`),
  CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы service.user_role: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `created_at`, `updated_at`, `user_id`, `role_id`) VALUES
	(27, '2019-04-15 14:40:14', '2019-04-15 14:40:14', 10, 5),
	(28, '2019-04-15 14:40:16', '2019-04-15 14:40:16', 10, 7);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
