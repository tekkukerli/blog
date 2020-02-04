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


-- Andmete tõmmistamine tabelile `users`
--
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
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

