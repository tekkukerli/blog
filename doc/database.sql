-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Veebr 04, 2020 kell 12:10 PL
-- Serveri versioon: 10.4.8-MariaDB
-- PHP versioon: 7.3.11

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Andmebaas: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `blog`;

-- --------------------------------------------------------
--
--
-- Tabeli struktuur tabelile `post`


DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
                                      `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                      `post_subject` varchar(255) NOT NULL,
                                      `post_text` text NOT NULL,
                                      `post_created` timestamp NOT NULL DEFAULT current_timestamp(),
                                      `user_id` int(10) UNSIGNED NOT NULL,
                                      PRIMARY KEY (`post_id`),
                                      KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Andmete tõmmistamine tabelile `post`
--

INSERT INTO `post` (`post_id`, `post_subject`, `post_text`, `post_created`, `user_id`) VALUES
(4, 'Test', 'See on minu testpostituse sisu.', '2020-02-04 10:47:27', 1),
(5, 'Pealkiri', 'See on postituse sisu.', '2020-02-04 10:47:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE IF NOT EXISTS `post_tags` (
                                           `post_id` int(11) UNSIGNED NOT NULL,
                                           `tag_id` int(11) UNSIGNED NOT NULL,
                                           KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`post_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
                                     `tag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                     `tag_name` varchar(255) NOT NULL,
                                     PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tag_id`, `tag_name`) VALUES
(1, 'php'),
(2, 'web'),
(3, 'mvc'),
(4, 'framework');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
                                              `translation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                              `phrase` varchar(191) NOT NULL,
                                              `language` char(3) NOT NULL,
                                              `translation` varchar(191) DEFAULT NULL,
                                              `controller` varchar(15) NOT NULL,
                                              `action` varchar(20) NOT NULL,
                                              PRIMARY KEY (`translation_id`),
                                              UNIQUE KEY `language_phrase_controller_action_index` (`language`,`phrase`,`controller`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`translation_id`, `phrase`, `language`, `translation`, `controller`, `action`) VALUES
(1, 'Action', 'en', '{untranslated}', 'welcome', 'index'),
(2, 'Server returned response in an unexpected format', 'en', '{untranslated}', 'global', 'global'),
(3, 'Forbidden', 'en', '{untranslated}', 'global', 'global'),
(4, 'Server returned an error', 'en', '{untranslated}', 'global', 'global'),
(5, 'Action', 'en', '{untranslated}', 'halo', 'index'),
(6, 'Logout', 'en', '{untranslated}', 'global', 'global'),
(7, 'Settings', 'en', '{untranslated}', 'global', 'global'),
(8, 'Logged in as', 'en', '{untranslated}', 'global', 'global'),
(9, 'Log out', 'en', '{untranslated}', 'global', 'global'),
(10, 'Action', 'et', '{untranslated}', 'welcome', 'index'),
(11, 'Log out', 'et', '{untranslated}', 'global', 'global'),
(12, 'Server returned response in an unexpected format', 'et', '{untranslated}', 'global', 'global'),
(13, 'Forbidden', 'et', '{untranslated}', 'global', 'global'),
(14, 'Server returned an error', 'et', '{untranslated}', 'global', 'global'),
(15, 'Please sign in', 'et', '{untranslated}', 'global', 'global'),
(16, 'Email', 'et', '{untranslated}', 'global', 'global'),
(17, 'Password', 'et', '{untranslated}', 'global', 'global'),
(18, 'Sign in', 'et', '{untranslated}', 'global', 'global'),
(19, 'Please sign in', 'en', '{untranslated}', 'global', 'global'),
(20, 'Email', 'en', '{untranslated}', 'global', 'global'),
(21, 'Password', 'en', '{untranslated}', 'global', 'global'),
(22, 'Sign in', 'en', '{untranslated}', 'global', 'global'),
(23, 'Wrong username or password', 'en', '{untranslated}', 'global', 'global'),
(24, 'Oops...', 'en', '{untranslated}', 'global', 'global'),
(25, 'Close', 'en', '{untranslated}', 'global', 'global'),
(26, 'Server returned an error. Please try again later ', 'en', '{untranslated}', 'global', 'global'),
(27, 'Oops...', 'et', '{untranslated}', 'global', 'global'),
(28, 'Close', 'et', '{untranslated}', 'global', 'global'),
(29, 'Server returned an error. Please try again later ', 'et', '{untranslated}', 'global', 'global');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
                                       `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                                       `is_admin` tinyint(4) NOT NULL DEFAULT 0,
                                       `password` varchar(191) NOT NULL,
                                       `email` varchar(191) NOT NULL,
                                       `deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
                                       `name` varchar(191) NOT NULL,
                                       PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Andmete tõmmistamine tabelile `users`
--

INSERT INTO `users` (`user_id`, `is_admin`, `password`, `email`, `deleted`, `name`) VALUES
(1, 1, '$2y$10$vTje.ndUFKHyuotY99iYkO.2aHJUgOsy2x0RMXP1UmrTe6CQsKbtm', 'demo@example.com', 0, 'Demo User');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `post`
--
ALTER TABLE `post`
    ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `post_tags`
--
ALTER TABLE `post_tags`
    ADD CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `tag` (`tag_id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

