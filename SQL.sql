-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 08/10/2025 às 22:07
-- Versão do servidor: 8.0.37
-- Versão do PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ingressafacil_ogamexyz`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `addins`
--

CREATE TABLE `addins` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `position` tinyint NOT NULL,
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ord` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `addins`
--

INSERT INTO `addins` (`id`, `name`, `position`, `link`, `ord`) VALUES
(6, 'Hor Links', 1, 'createhorlink.php', 1),
(8, 'Vert Links', 2, 'createlink.php', 2),
(10, 'New Player Info', 2, 'bar.php', 1),
(11, 'Leaderboard', 3, 'leaders.php', 1),
(12, 'Creative Commons Logo', 2, 'CClogo.php', 3),
(16, 'Threads', 3, 'threads.php', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `blueprint_items`
--

CREATE TABLE `blueprint_items` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `type` enum('weapon','armour') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `effectiveness` int NOT NULL,
  `price` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Despejando dados para a tabela `blueprint_items`
--

INSERT INTO `blueprint_items` (`id`, `name`, `description`, `type`, `effectiveness`, `price`) VALUES
(3, 'Super Weapon', 'Hi bogatabeav', 'weapon', 32, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `forum_category`
--

CREATE TABLE `forum_category` (
  `id` varchar(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `descript` longtext NOT NULL,
  `access` int NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `forum_category`
--

INSERT INTO `forum_category` (`id`, `name`, `descript`, `access`) VALUES
('1', 'Stuff', 'You know, Stuff', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `forum_reply`
--

CREATE TABLE `forum_reply` (
  `th_id` int NOT NULL DEFAULT '0',
  `rep_id` int NOT NULL DEFAULT '0',
  `cat_id` int NOT NULL,
  `rep_detail` longtext NOT NULL,
  `rep_datetime` varchar(255) NOT NULL,
  `rep_name` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `forum_reply`
--

INSERT INTO `forum_reply` (`th_id`, `rep_id`, `cat_id`, `rep_detail`, `rep_datetime`, `rep_name`) VALUES
(100, 1, 0, 'adasdasda', '2010-02-22 19:49:12', 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `forum_thread`
--

CREATE TABLE `forum_thread` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `cat_id` int NOT NULL,
  `detail` longtext NOT NULL,
  `name` varchar(65) NOT NULL DEFAULT '',
  `datetime` varchar(255) NOT NULL,
  `recent` varchar(255) NOT NULL,
  `view` int NOT NULL DEFAULT '0',
  `reply` int NOT NULL DEFAULT '0',
  `sticky` binary(1) NOT NULL DEFAULT '0',
  `locked` binary(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `forum_thread`
--

INSERT INTO `forum_thread` (`id`, `title`, `cat_id`, `detail`, `name`, `datetime`, `recent`, `view`, `reply`, `sticky`, `locked`) VALUES
(107, 'Forum Clear', 1, 'You should always backup, just in case you get fumble fingers in phpmyadmin.', '10', '2010-02-22 19:30:04', '2010-02-22 19:30:04', 11, 0, 0x30, 0x30);

-- --------------------------------------------------------

--
-- Estrutura para tabela `headers`
--

CREATE TABLE `headers` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `position` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `headers`
--

INSERT INTO `headers` (`id`, `name`, `position`) VALUES
(1, 'Links', 1),
(2, 'Community', 2),
(3, 'Other', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `items`
--

CREATE TABLE `items` (
  `id` int NOT NULL,
  `player_id` int NOT NULL,
  `item_id` int NOT NULL,
  `status` enum('equipped','unequipped') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'unequipped'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `layouts`
--

CREATE TABLE `layouts` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `sidebar1` smallint NOT NULL,
  `sidebar2` smallint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `layouts`
--

INSERT INTO `layouts` (`id`, `name`, `sidebar1`, `sidebar2`) VALUES
(1, '3col-lsb-wohor.css', 1, 1),
(2, '3col-rsb-wohor.css', 1, 1),
(7, '2col-rsb-wohor.css', 1, 0),
(6, '2col-lsb-wohor.css', 1, 0),
(8, '1col-nsb-wohor.css', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `links`
--

CREATE TABLE `links` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `file` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `addin` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `header_id` int NOT NULL,
  `position` tinyint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `links`
--

INSERT INTO `links` (`id`, `name`, `file`, `addin`, `header_id`, `position`) VALUES
(23, 'Shop', 'shop.php', '', 1, 7),
(2, 'Inventory', 'inventory.php', '', 1, 3),
(4, 'Home', 'home.php', '', 1, 1),
(7, 'Log', 'log.php', '[<?=unread_log($player->id, $db)?>]', 1, 2),
(10, 'Bank', 'bank.php', '', 1, 4),
(11, 'Hospital', 'hospital.php', '', 1, 5),
(12, 'Battle', 'battle.php', '', 1, 6),
(14, 'Mail', 'mail.php', '[<?=unread_messages($player->id, $db)?>]', 2, 1),
(15, 'Member List', 'members.php', '', 2, 2),
(17, 'Forum', 'forum.php', '', 2, 3),
(19, 'DynaMax', 'http://sunofloki.com', '', 3, 2),
(20, 'Logout', 'logout.php', '', 3, 3),
(21, 'ezRPG', 'http://www.ezrpgproject.com', '', 3, 1),
(26, 'Search', 'search.php', '', 1, 8),
(27, 'Market', 'market.php', '', 1, 9),
(28, 'New - Battle Monster', 'battlem.php', '', 1, 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_errors`
--

CREATE TABLE `log_errors` (
  `id` int NOT NULL,
  `msg` text NOT NULL,
  `time` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_gm`
--

CREATE TABLE `log_gm` (
  `id` int NOT NULL,
  `msg` text NOT NULL,
  `time` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `log_gm`
--

INSERT INTO `log_gm` (`id`, `msg`, `time`) VALUES
(1, '<a href=\"users.php?id=admin\">admin</a> attempted to change the game configuration file, but couldn\'t. (IP 177.131.189.88)', 1759962285),
(2, '<a href=\"users.php?id=admin\">admin</a> attempted to change the game configuration file, but couldn\'t. (IP 177.131.189.88)', 1759962295);

-- --------------------------------------------------------

--
-- Estrutura para tabela `mail`
--

CREATE TABLE `mail` (
  `id` int NOT NULL,
  `to` int NOT NULL,
  `from` int NOT NULL,
  `subject` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `body` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `time` int NOT NULL,
  `status` enum('read','unread') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'unread'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `market`
--

CREATE TABLE `market` (
  `market_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `qty` int NOT NULL,
  `price` int NOT NULL,
  `total_cost` int NOT NULL,
  `seller_id` int NOT NULL,
  `seller` varchar(50) NOT NULL,
  `buyer_id` int NOT NULL,
  `sold` char(1) NOT NULL DEFAULT 'f'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Despejando dados para a tabela `market`
--

INSERT INTO `market` (`market_id`, `item_id`, `item_name`, `qty`, `price`, `total_cost`, `seller_id`, `seller`, `buyer_id`, `sold`) VALUES
(37, 3, 'Super Weapon', 1, 500, 500, 10, 'admin', 0, 't'),
(38, 3, 'Super Weapon', 1, 500, 500, 10, 'admin', 0, 't'),
(39, 3, 'Super Weapon', 1, 500, 500, 10, 'admin', 0, 't'),
(40, 3, 'Super Weapon', 1, 500, 500, 10, 'admin', 0, 't'),
(41, 3, 'Super Weapon', 1, 200, 200, 10, 'admin', 0, 't'),
(42, 3, 'Super Weapon', 1, 500, 500, 10, 'admin', 0, 't'),
(43, 3, 'Super Weapon', 1, 200, 200, 10, 'admin', 0, 't'),
(44, 3, 'Super Weapon', 1, 200, 200, 10, 'admin', 0, 't'),
(45, 3, 'Super Weapon', 1, 200, 200, 10, 'admin', 0, 't'),
(46, 3, 'Super Weapon', 1, 200, 200, 10, 'admin', 0, 't'),
(47, 3, 'Super Weapon', 1, 200, 200, 10, 'admin', 0, 't'),
(48, 3, 'Super Weapon', 1, 200, 200, 10, 'admin', 0, 't'),
(49, 3, 'Super Weapon', 1, 2100, 2100, 10, 'admin', 0, 't'),
(50, 3, 'Super Weapon', 1, 200, 200, 10, 'admin', 0, 't'),
(51, 3, 'Super Weapon', 1, 200, 200, 10, 'admin', 0, 't'),
(52, 3, 'Super Weapon', 1, 500, 500, 10, 'admin', 0, 't'),
(53, 3, 'Super Weapon', 1, 50, 50, 10, 'admin', 0, 'f');

-- --------------------------------------------------------

--
-- Estrutura para tabela `monsters`
--

CREATE TABLE `monsters` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `level` int NOT NULL,
  `strength` int NOT NULL,
  `vitality` int NOT NULL,
  `agility` int NOT NULL,
  `hp` int NOT NULL,
  `maxhp` int NOT NULL,
  `gold` int NOT NULL,
  `exp` int NOT NULL,
  `atkbonus` int DEFAULT '0',
  `defbonus` int DEFAULT '0',
  `image_path` varchar(255) DEFAULT NULL,
  `description` text,
  `deaths` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `monsters`
--

INSERT INTO `monsters` (`id`, `username`, `level`, `strength`, `vitality`, `agility`, `hp`, `maxhp`, `gold`, `exp`, `atkbonus`, `defbonus`, `image_path`, `description`, `deaths`) VALUES
(1, 'Goblin', 3, 8, 10, 6, 50, 50, 15, 10, 0, 0, 'images/monsters/goblin.png', 'Um pequeno e astuto inimigo das florestas, rápido e traiçoeiro.', 0),
(2, 'Orc', 6, 15, 20, 8, 120, 120, 35, 30, 2, 1, 'images/monsters/orc.png', 'Criatura forte e brutal das montanhas, com força bruta devastadora.', 0),
(3, 'Troll', 10, 30, 40, 10, 300, 300, 70, 80, 5, 2, 'images/monsters/troll.png', 'Gigante regenerador que vive nas cavernas úmidas.', 0),
(4, 'Wyvern', 15, 45, 30, 20, 450, 450, 120, 150, 7, 3, 'images/monsters/wyvern.png', 'Criatura alada de veneno mortal e agilidade surpreendente.', 0),
(5, 'Dark Knight', 25, 80, 60, 40, 800, 800, 300, 400, 12, 8, 'images/monsters/dark_knight.png', 'Guerreiro amaldiçoado coberto por uma armadura negra.', 0),
(6, 'Demon Lord', 35, 120, 100, 60, 1500, 1500, 800, 1000, 15, 10, 'images/monsters/demon_lord.png', 'O senhor dos abismos, mestre do fogo infernal.', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `players`
--

CREATE TABLE `players` (
  `id` int NOT NULL,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `rank` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'Member',
  `gm_rank` int NOT NULL DEFAULT '1',
  `registered` int NOT NULL,
  `last_active` int NOT NULL,
  `ip` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `last_ip` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `stat_points` int NOT NULL DEFAULT '5',
  `gold` int NOT NULL DEFAULT '100',
  `bank` int NOT NULL DEFAULT '0',
  `hp` int NOT NULL DEFAULT '50',
  `maxhp` int NOT NULL DEFAULT '50',
  `exp` int NOT NULL DEFAULT '0',
  `maxexp` int NOT NULL DEFAULT '50',
  `energy` int NOT NULL DEFAULT '10',
  `maxenergy` int NOT NULL DEFAULT '10',
  `strength` int NOT NULL DEFAULT '1',
  `vitality` int NOT NULL DEFAULT '1',
  `agility` int NOT NULL DEFAULT '1',
  `interest` tinyint(1) NOT NULL DEFAULT '0',
  `search` int NOT NULL DEFAULT '100',
  `kills` int NOT NULL DEFAULT '0',
  `deaths` int NOT NULL DEFAULT '0',
  `top_ten` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'level',
  `ban` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Despejando dados para a tabela `players`
--

INSERT INTO `players` (`id`, `username`, `password`, `email`, `rank`, `gm_rank`, `registered`, `last_active`, `ip`, `last_ip`, `avatar`, `level`, `stat_points`, `gold`, `bank`, `hp`, `maxhp`, `exp`, `maxexp`, `energy`, `maxenergy`, `strength`, `vitality`, `agility`, `interest`, `search`, `kills`, `deaths`, `top_ten`, `ban`) VALUES
(10, 'admin', '4b4e739494285f1e21c93ad201f6412ddd44644a', 'test@email.com', 'Member', 150, 1256490188, 1759971886, '98.74.29.192', '177.131.189.88', 'default.jpg', 5, 12, 21479, 0, 410, 410, 12, 330, 80, 10, 15, 13, 10, 0, 73, 79, 3, 'level', 1257285998),
(13, 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'test@boecking.de', 'Member', 1, 1258117522, 1258117522, '62.227.201.103', '', '', 1, 5, 100, 0, 50, 50, 0, 50, 10, 10, 1, 1, 1, 0, 100, 0, 9, 'level', 0),
(14, 'DummyPlayer', '408bda5b5c5d54c887930588a6eac879d8f985e1', 'moo@moo.moo', 'Member', 1, 1258166346, 1258166346, '98.74.32.234', '', '', 1, 5, 100, 0, 50, 50, 0, 50, 10, 10, 1, 1, 1, 0, 100, 0, 7, 'level', 0),
(15, 'FakePlayer', '408bda5b5c5d54c887930588a6eac879d8f985e1', 'moo@moo.test', 'Member', 1, 1258166380, 1258166380, '98.74.32.234', '', '', 1, 5, 100, 0, 50, 50, 0, 50, 10, 10, 1, 1, 1, 0, 100, 0, 6, 'level', 0),
(16, 'StrawMan', '408bda5b5c5d54c887930588a6eac879d8f985e1', 'moo@test.moo', 'Member', 1, 1258166414, 1258166414, '98.74.32.234', '', '', 1, 5, 100, 0, 50, 50, 0, 50, 10, 10, 1, 1, 1, 0, 100, 0, 7, 'level', 0),
(17, 'PushOver', '408bda5b5c5d54c887930588a6eac879d8f985e1', 'test@test.test', 'Member', 1, 1258167316, 1258167316, '98.74.32.234', '', '', 1, 5, 100, 0, 50, 50, 0, 50, 10, 10, 1, 1, 1, 0, 100, 0, 7, 'level', 0),
(18, 'muchila', '72355a7c17e0f383fe3bdce02e9882b1ad25511d', 'victorhugomartins28@hotmail.com', 'Member', 1, 1266926578, 1266926977, '200.100.195.191', '200.100.195.191', '', 1, 0, 100, 0, 50, 50, 0, 50, 10, 10, 6, 1, 1, 0, 100, 0, 0, 'strength', 0),
(19, 'janiltojack1', '4b4e739494285f1e21c93ad201f6412ddd44644a', 'janiltojack1@gmail.com', 'Member', 1, 1759577724, 1759577902, '177.131.189.88', '177.131.189.88', '', 1, 5, 101, 0, 50, 50, 0, 50, 10, 10, 1, 1, 1, 0, 96, 0, 0, 'level', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`name`, `value`) VALUES
('bank_interest_rate', '2'),
('bank_limit_type', 'variable'),
('bank_limit', '200'),
('battle_min_level', '3'),
('battle_round_limit', '30'),
('hospital_rate', '1'),
('general_stat_bar', 'image'),
('general_close_game', 'no'),
('index_log_ip', 'no'),
('index_log_error', 'no'),
('general_bar_filetype', 'PNG'),
('members_default_limit', '30'),
('register_status', 'open'),
('weapons_default_limit', '10'),
('armour_default_limit', '10'),
('layout', '3col-lsb-wohor.css'),
('theme', 'Pro Light'),
('width', '1024x960');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_log`
--

CREATE TABLE `user_log` (
  `id` int NOT NULL,
  `player_id` int NOT NULL,
  `msg` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `full_msg` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `status` enum('read','unread') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'unread',
  `time` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Despejando dados para a tabela `user_log`
--

INSERT INTO `user_log` (`id`, `player_id`, `msg`, `full_msg`, `status`, `time`) VALUES
(10, 13, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color=\"green\">admin attacked test for <b>37</b> damage! (13 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>34</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258119512),
(11, 13, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color=\"green\">admin attacked test for <b>36</b> damage! (14 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>34</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258139776),
(12, 13, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color=\"green\">admin attacked test for <b>34</b> damage! (16 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>38</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258547785),
(13, 14, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color=\"green\">admin attacked DummyPlayer for <b>38</b> damage! (12 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>36</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258547831),
(14, 15, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs FakePlayer</b><br /><br />\n<font color=\"green\">admin attacked FakePlayer for <b>35</b> damage! (15 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>38</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258547836),
(15, 16, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\n<font color=\"green\">admin attacked StrawMan for <b>35</b> damage! (15 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>35</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258547847),
(16, 17, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\n<font color=\"green\">admin attacked PushOver for <b>38</b> damage! (12 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>38</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258547857),
(17, 13, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color=\"green\">admin attacked test for <b>36</b> damage! (14 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>35</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258552351),
(18, 14, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color=\"green\">admin attacked DummyPlayer for <b>36</b> damage! (14 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>36</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258552359),
(19, 16, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\n<font color=\"green\">admin attacked StrawMan for <b>35</b> damage! (15 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>36</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258552367),
(20, 17, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\n<font color=\"green\">admin attacked PushOver for <b>37</b> damage! (13 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>36</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258552371),
(21, 13, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color=\"green\">admin attacked test for <b>4</b> damage! (46 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>7</b> damage! (39 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>6</b> damage! (33 HP left!)<br /></font>\n<font color=\"red\">test attacked admin for <b>2</b> damage! (138 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>8</b> damage! (25 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>6</b> damage! (19 HP left!)<br /></font>\nadmin tried to attack test but missed!<br />\n<font color=\"red\">test attacked admin for <b>2</b> damage! (136 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>6</b> damage! (13 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>6</b> damage! (7 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>5</b> damage! (2 HP left!)<br /></font>\n<font color=\"red\">test attacked admin for <b>1</b> damage! (135 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>8</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258810823),
(22, 14, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color=\"green\">admin attacked DummyPlayer for <b>5</b> damage! (45 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>6</b> damage! (39 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>4</b> damage! (35 HP left!)<br /></font>\nDummyPlayer tried to attack admin but missed!<br />\n<font color=\"green\">admin attacked DummyPlayer for <b>8</b> damage! (27 HP left!)<br /></font>\nadmin tried to attack DummyPlayer but missed!<br />\n<font color=\"green\">admin attacked DummyPlayer for <b>5</b> damage! (22 HP left!)<br /></font>\n<font color=\"red\">DummyPlayer attacked admin for <b>1</b> damage! (134 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>6</b> damage! (16 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>5</b> damage! (11 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>4</b> damage! (7 HP left!)<br /></font>\n<font color=\"red\">DummyPlayer attacked admin for <b>1</b> damage! (133 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>7</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258810829),
(23, 15, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs FakePlayer</b><br /><br />\n<font color=\"green\">admin attacked FakePlayer for <b>6</b> damage! (44 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>7</b> damage! (37 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>4</b> damage! (33 HP left!)<br /></font>\n<font color=\"red\">FakePlayer attacked admin for <b>1</b> damage! (132 HP left!)<br /></font>\nadmin tried to attack FakePlayer but missed!<br />\n<font color=\"green\">admin attacked FakePlayer for <b>4</b> damage! (29 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>5</b> damage! (24 HP left!)<br /></font>\n<font color=\"red\">FakePlayer attacked admin for <b>2</b> damage! (130 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>6</b> damage! (18 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>6</b> damage! (12 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>4</b> damage! (8 HP left!)<br /></font>\n<font color=\"red\">FakePlayer attacked admin for <b>1</b> damage! (129 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>7</b> damage! (1 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>7</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258810833),
(24, 16, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\n<font color=\"green\">admin attacked StrawMan for <b>6</b> damage! (44 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>4</b> damage! (40 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>4</b> damage! (36 HP left!)<br /></font>\n<font color=\"red\">StrawMan attacked admin for <b>1</b> damage! (128 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>6</b> damage! (30 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>8</b> damage! (22 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>7</b> damage! (15 HP left!)<br /></font>\nStrawMan tried to attack admin but missed!<br />\n<font color=\"green\">admin attacked StrawMan for <b>4</b> damage! (11 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>7</b> damage! (4 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>5</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258810838),
(25, 17, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\n<font color=\"green\">admin attacked PushOver for <b>8</b> damage! (42 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>8</b> damage! (34 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>8</b> damage! (26 HP left!)<br /></font>\n<font color=\"red\">PushOver attacked admin for <b>2</b> damage! (126 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>8</b> damage! (18 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>4</b> damage! (14 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>8</b> damage! (6 HP left!)<br /></font>\n<font color=\"red\">PushOver attacked admin for <b>1</b> damage! (125 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>6</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258810842),
(26, 13, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color=\"green\">admin attacked test for <b>12</b> damage! (38 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>16</b> damage! (22 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>15</b> damage! (7 HP left!)<br /></font>\n<font color=\"red\">test attacked admin for <b>2</b> damage! (238 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>15</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258937446),
(27, 14, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color=\"green\">admin attacked DummyPlayer for <b>12</b> damage! (38 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>12</b> damage! (26 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>16</b> damage! (10 HP left!)<br /></font>\n<font color=\"red\">DummyPlayer attacked admin for <b>2</b> damage! (236 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>16</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258937454),
(28, 15, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs FakePlayer</b><br /><br />\n<font color=\"green\">admin attacked FakePlayer for <b>15</b> damage! (35 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>16</b> damage! (19 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>16</b> damage! (3 HP left!)<br /></font>\n<font color=\"red\">FakePlayer attacked admin for <b>1</b> damage! (235 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>12</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258937460),
(29, 16, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\n<font color=\"green\">admin attacked StrawMan for <b>12</b> damage! (38 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>12</b> damage! (26 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>12</b> damage! (14 HP left!)<br /></font>\n<font color=\"red\">StrawMan attacked admin for <b>1</b> damage! (234 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>14</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258937466),
(30, 17, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\nadmin tried to attack PushOver but missed!<br />\n<font color=\"green\">admin attacked PushOver for <b>13</b> damage! (37 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>15</b> damage! (22 HP left!)<br /></font>\n<font color=\"red\">PushOver attacked admin for <b>1</b> damage! (233 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>13</b> damage! (9 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>15</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258937471),
(31, 13, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color=\"green\">admin attacked test for <b>17</b> damage! (33 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>18</b> damage! (15 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>14</b> damage! (1 HP left!)<br /></font>\ntest tried to attack admin but missed!<br />\n<font color=\"green\">admin attacked test for <b>14</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259034219),
(32, 14, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color=\"green\">admin attacked DummyPlayer for <b>16</b> damage! (34 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>16</b> damage! (18 HP left!)<br /></font>\nadmin tried to attack DummyPlayer but missed!<br />\n<font color=\"red\">DummyPlayer attacked admin for <b>2</b> damage! (258 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>18</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259034222),
(33, 15, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs FakePlayer</b><br /><br />\n<font color=\"green\">admin attacked FakePlayer for <b>15</b> damage! (35 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>18</b> damage! (17 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>14</b> damage! (3 HP left!)<br /></font>\n<font color=\"red\">FakePlayer attacked admin for <b>1</b> damage! (257 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>14</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259034224),
(34, 16, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\nadmin tried to attack StrawMan but missed!<br />\n<font color=\"green\">admin attacked StrawMan for <b>17</b> damage! (33 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>16</b> damage! (17 HP left!)<br /></font>\nStrawMan tried to attack admin but missed!<br />\n<font color=\"green\">admin attacked StrawMan for <b>16</b> damage! (1 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>17</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259034227),
(35, 17, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\n<font color=\"green\">admin attacked PushOver for <b>15</b> damage! (35 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>15</b> damage! (20 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>14</b> damage! (6 HP left!)<br /></font>\n<font color=\"red\">PushOver attacked admin for <b>2</b> damage! (255 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>14</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259034229),
(36, 13, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color=\"green\">admin attacked test for <b>18</b> damage! (32 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>15</b> damage! (17 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>15</b> damage! (2 HP left!)<br /></font>\n<font color=\"red\">test attacked admin for <b>1</b> damage! (259 HP left!)<br /></font>\n<font color=\"green\">admin attacked test for <b>17</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259078491),
(37, 14, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color=\"green\">admin attacked DummyPlayer for <b>18</b> damage! (32 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>16</b> damage! (16 HP left!)<br /></font>\n<font color=\"green\">admin attacked DummyPlayer for <b>17</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259078493),
(38, 15, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs FakePlayer</b><br /><br />\n<font color=\"green\">admin attacked FakePlayer for <b>18</b> damage! (32 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>17</b> damage! (15 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>18</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259078495),
(39, 16, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\nadmin tried to attack StrawMan but missed!<br />\n<font color=\"green\">admin attacked StrawMan for <b>15</b> damage! (35 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>15</b> damage! (20 HP left!)<br /></font>\n<font color=\"red\">StrawMan attacked admin for <b>2</b> damage! (257 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>17</b> damage! (3 HP left!)<br /></font>\n<font color=\"green\">admin attacked StrawMan for <b>18</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259078497),
(40, 17, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\n<font color=\"green\">admin attacked PushOver for <b>16</b> damage! (34 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>14</b> damage! (20 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>15</b> damage! (5 HP left!)<br /></font>\n<font color=\"red\">PushOver attacked admin for <b>2</b> damage! (255 HP left!)<br /></font>\n<font color=\"green\">admin attacked PushOver for <b>17</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259078499),
(41, 15, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs FakePlayer</b><br /><br />\nadmin tried to attack FakePlayer but missed!<br />\n<font color=\"green\">admin attacked FakePlayer for <b>30</b> damage! (20 HP left!)<br /></font>\n<font color=\"green\">admin attacked FakePlayer for <b>26</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259916039),
(42, 14, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color=\"green\">admin attacked DummyPlayer for <b>58</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259916162),
(43, 13, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color=\"green\">admin attacked test for <b>58</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259969126),
(44, 16, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\n<font color=\"green\">admin attacked StrawMan for <b>58</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259969133),
(45, 17, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\n<font color=\"green\">admin attacked PushOver for <b>60</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259969135),
(46, 1, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759969204),
(47, 1, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759969540),
(48, 1, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759969739),
(49, 2, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759969763),
(50, 2, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759969830),
(51, 2, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759969833),
(52, 2, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759969841),
(53, 2, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759969844),
(54, 2, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759969847),
(55, 2, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759969850),
(56, 2, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759969902),
(57, 2, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759969921),
(58, 1, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759969935),
(59, 1, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759970025),
(60, 1, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759970027),
(61, 1, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759970030),
(62, 1, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759970036),
(63, 1, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759970045),
(64, 1, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759970051),
(65, 1, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759970057),
(66, 1, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759970149),
(67, 1, 'You were attacked by <a href=\"profile.php?id=admin\">admin</a> and you were defeated...', '', 'unread', 1759971855);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `addins`
--
ALTER TABLE `addins`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `blueprint_items`
--
ALTER TABLE `blueprint_items`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `forum_reply`
--
ALTER TABLE `forum_reply`
  ADD KEY `rep_id` (`rep_id`);

--
-- Índices de tabela `forum_thread`
--
ALTER TABLE `forum_thread`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `headers`
--
ALTER TABLE `headers`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `layouts`
--
ALTER TABLE `layouts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `log_errors`
--
ALTER TABLE `log_errors`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `log_gm`
--
ALTER TABLE `log_gm`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `market`
--
ALTER TABLE `market`
  ADD PRIMARY KEY (`market_id`),
  ADD KEY `item_name` (`item_name`),
  ADD KEY `seller` (`seller`);

--
-- Índices de tabela `monsters`
--
ALTER TABLE `monsters`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `addins`
--
ALTER TABLE `addins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `blueprint_items`
--
ALTER TABLE `blueprint_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `forum_thread`
--
ALTER TABLE `forum_thread`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de tabela `headers`
--
ALTER TABLE `headers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `items`
--
ALTER TABLE `items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `layouts`
--
ALTER TABLE `layouts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `links`
--
ALTER TABLE `links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `log_errors`
--
ALTER TABLE `log_errors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `log_gm`
--
ALTER TABLE `log_gm`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `mail`
--
ALTER TABLE `mail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `market`
--
ALTER TABLE `market`
  MODIFY `market_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de tabela `monsters`
--
ALTER TABLE `monsters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `players`
--
ALTER TABLE `players`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
