

--------------------------------------------------------

--
-- Table structure for table `addins`
--

CREATE TABLE IF NOT EXISTS `addins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `position` tinyint(3) NOT NULL,
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ord` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `addins`
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
-- Table structure for table `blueprint_items`
--

CREATE TABLE IF NOT EXISTS `blueprint_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `description` text COLLATE latin1_general_ci NOT NULL,
  `type` enum('weapon','armour') COLLATE latin1_general_ci NOT NULL,
  `effectiveness` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `blueprint_items`
--

INSERT INTO `blueprint_items` (`id`, `name`, `description`, `type`, `effectiveness`, `price`) VALUES
(3, 'Super Weapon', 'Hi bogatabeav', 'weapon', 32, 10);

-- --------------------------------------------------------

--
-- Table structure for table `forum_category`
--

CREATE TABLE IF NOT EXISTS `forum_category` (
  `id` varchar(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `descript` longtext NOT NULL,
  `access` int(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_category`
--

INSERT INTO `forum_category` (`id`, `name`, `descript`, `access`) VALUES
('1', 'Stuff', 'You know, Stuff', 1);

-- --------------------------------------------------------

--
-- Table structure for table `forum_reply`
--

CREATE TABLE IF NOT EXISTS `forum_reply` (
  `th_id` int(4) NOT NULL DEFAULT '0',
  `rep_id` int(4) NOT NULL DEFAULT '0',
  `cat_id` int(4) NOT NULL,
  `rep_detail` longtext NOT NULL,
  `rep_datetime` varchar(255) NOT NULL,
  `rep_name` int(4) NOT NULL,
  KEY `rep_id` (`rep_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forum_reply`
--

INSERT INTO `forum_reply` (`th_id`, `rep_id`, `cat_id`, `rep_detail`, `rep_datetime`, `rep_name`) VALUES
(100, 1, 0, 'adasdasda', '2010-02-22 19:49:12', 10);

-- --------------------------------------------------------

--
-- Table structure for table `forum_thread`
--

CREATE TABLE IF NOT EXISTS `forum_thread` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `cat_id` int(4) NOT NULL,
  `detail` longtext NOT NULL,
  `name` varchar(65) NOT NULL DEFAULT '',
  `datetime` varchar(255) NOT NULL,
  `recent` varchar(255) NOT NULL,
  `view` int(4) NOT NULL DEFAULT '0',
  `reply` int(4) NOT NULL DEFAULT '0',
  `sticky` binary(1) NOT NULL DEFAULT '0',
  `locked` binary(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=108 ;

--
-- Dumping data for table `forum_thread`
--

INSERT INTO `forum_thread` (`id`, `title`, `cat_id`, `detail`, `name`, `datetime`, `recent`, `view`, `reply`, `sticky`, `locked`) VALUES
(107, 'Forum Clear', 1, 'You should always backup, just in case you get fumble fingers in phpmyadmin.', '10', '2010-02-22 19:30:04', '2010-02-22 19:30:04', 11, 0, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `headers`
--

CREATE TABLE IF NOT EXISTS `headers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `position` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `headers`
--

INSERT INTO `headers` (`id`, `name`, `position`) VALUES
(1, 'Links', 1),
(2, 'Community', 2),
(3, 'Other', 3);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `status` enum('equipped','unequipped') COLLATE latin1_general_ci NOT NULL DEFAULT 'unequipped',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `player_id`, `item_id`, `status`) VALUES
(26, 10, 3, 'equipped');

-- --------------------------------------------------------

--
-- Table structure for table `layouts`
--

CREATE TABLE IF NOT EXISTS `layouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `sidebar1` smallint(6) NOT NULL,
  `sidebar2` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `layouts`
--

INSERT INTO `layouts` (`id`, `name`, `sidebar1`, `sidebar2`) VALUES
(1, '3col-lsb-wohor.css', 1, 1),
(2, '3col-rsb-wohor.css', 1, 1),
(7, '2col-rsb-wohor.css', 1, 0),
(6, '2col-lsb-wohor.css', 1, 0),
(8, '1col-nsb-wohor.css', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `file` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `addin` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `header_id` int(11) NOT NULL,
  `position` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `links`
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
(27, 'Market', 'market.php', '', 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `log_errors`
--

CREATE TABLE IF NOT EXISTS `log_errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` text NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `log_errors`
--


-- --------------------------------------------------------

--
-- Table structure for table `log_gm`
--

CREATE TABLE IF NOT EXISTS `log_gm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` text NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `log_gm`
--


-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE IF NOT EXISTS `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `subject` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `body` text COLLATE latin1_general_ci NOT NULL,
  `time` int(11) NOT NULL,
  `status` enum('read','unread') COLLATE latin1_general_ci NOT NULL DEFAULT 'unread',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `mail`
--


-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE IF NOT EXISTS `market` (
  `market_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `seller` varchar(50) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `sold` char(1) NOT NULL DEFAULT 'f',
  PRIMARY KEY (`market_id`),
  KEY `item_name` (`item_name`),
  KEY `seller` (`seller`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `market`
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
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `rank` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'Member',
  `gm_rank` int(11) NOT NULL DEFAULT '1',
  `registered` int(11) NOT NULL,
  `last_active` int(11) NOT NULL,
  `ip` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `last_ip` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `avatar` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `stat_points` int(11) NOT NULL DEFAULT '5',
  `gold` int(11) NOT NULL DEFAULT '100',
  `bank` int(11) NOT NULL DEFAULT '0',
  `hp` int(11) NOT NULL DEFAULT '50',
  `maxhp` int(11) NOT NULL DEFAULT '50',
  `exp` int(11) NOT NULL DEFAULT '0',
  `maxexp` int(11) NOT NULL DEFAULT '50',
  `energy` int(11) NOT NULL DEFAULT '10',
  `maxenergy` int(11) NOT NULL DEFAULT '10',
  `strength` int(11) NOT NULL DEFAULT '1',
  `vitality` int(11) NOT NULL DEFAULT '1',
  `agility` int(11) NOT NULL DEFAULT '1',
  `interest` tinyint(1) NOT NULL DEFAULT '0',
  `search` int(11) NOT NULL DEFAULT '100',
  `kills` int(11) NOT NULL DEFAULT '0',
  `deaths` int(11) NOT NULL DEFAULT '0',
  `top_ten` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'level',
  `ban` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `username`, `password`, `email`, `rank`, `gm_rank`, `registered`, `last_active`, `ip`, `last_ip`, `avatar`, `level`, `stat_points`, `gold`, `bank`, `hp`, `maxhp`, `exp`, `maxexp`, `energy`, `maxenergy`, `strength`, `vitality`, `agility`, `interest`, `search`, `kills`, `deaths`, `top_ten`, `ban`) VALUES
(10, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'test@email.com', 'Member', 75, 1256490188, 1266893414, '98.74.29.192', '98.74.26.212', 'default.jpg', 2, 3, 21692, 0, 320, 320, 67, 120, 10, 10, 15, 13, 10, 0, 100, 36, 2, 'level', 1257285998),
(13, 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'test@boecking.de', 'Member', 1, 1258117522, 1258117522, '62.227.201.103', '', '', 1, 5, 100, 0, 50, 50, 0, 50, 10, 10, 1, 1, 1, 0, 100, 0, 9, 'level', 0),
(14, 'DummyPlayer', '408bda5b5c5d54c887930588a6eac879d8f985e1', 'moo@moo.moo', 'Member', 1, 1258166346, 1258166346, '98.74.32.234', '', '', 1, 5, 100, 0, 50, 50, 0, 50, 10, 10, 1, 1, 1, 0, 100, 0, 7, 'level', 0),
(15, 'FakePlayer', '408bda5b5c5d54c887930588a6eac879d8f985e1', 'moo@moo.test', 'Member', 1, 1258166380, 1258166380, '98.74.32.234', '', '', 1, 5, 100, 0, 50, 50, 0, 50, 10, 10, 1, 1, 1, 0, 100, 0, 6, 'level', 0),
(16, 'StrawMan', '408bda5b5c5d54c887930588a6eac879d8f985e1', 'moo@test.moo', 'Member', 1, 1258166414, 1258166414, '98.74.32.234', '', '', 1, 5, 100, 0, 50, 50, 0, 50, 10, 10, 1, 1, 1, 0, 100, 0, 7, 'level', 0),
(17, 'PushOver', '408bda5b5c5d54c887930588a6eac879d8f985e1', 'test@test.test', 'Member', 1, 1258167316, 1258167316, '98.74.32.234', '', '', 1, 5, 100, 0, 50, 50, 0, 50, 10, 10, 1, 1, 1, 0, 100, 0, 7, 'level', 0),
(18, 'muchila', '72355a7c17e0f383fe3bdce02e9882b1ad25511d', 'victorhugomartins28@hotmail.com', 'Member', 1, 1266926578, 1266926977, '200.100.195.191', '200.100.195.191', '', 1, 0, 100, 0, 50, 50, 0, 50, 10, 10, 6, 1, 1, 0, 100, 0, 0, 'strength', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
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
-- Table structure for table `user_log`
--

CREATE TABLE IF NOT EXISTS `user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `msg` text COLLATE latin1_general_ci NOT NULL,
  `full_msg` text COLLATE latin1_general_ci NOT NULL,
  `status` enum('read','unread') COLLATE latin1_general_ci NOT NULL DEFAULT 'unread',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=46 ;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`id`, `player_id`, `msg`, `full_msg`, `status`, `time`) VALUES
(10, 13, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color="green">admin attacked test for <b>37</b> damage! (13 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>34</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258119512),
(11, 13, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color="green">admin attacked test for <b>36</b> damage! (14 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>34</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258139776),
(12, 13, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color="green">admin attacked test for <b>34</b> damage! (16 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>38</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258547785),
(13, 14, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color="green">admin attacked DummyPlayer for <b>38</b> damage! (12 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>36</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258547831),
(14, 15, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs FakePlayer</b><br /><br />\n<font color="green">admin attacked FakePlayer for <b>35</b> damage! (15 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>38</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258547836),
(15, 16, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\n<font color="green">admin attacked StrawMan for <b>35</b> damage! (15 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>35</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258547847),
(16, 17, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\n<font color="green">admin attacked PushOver for <b>38</b> damage! (12 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>38</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258547857),
(17, 13, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color="green">admin attacked test for <b>36</b> damage! (14 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>35</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258552351),
(18, 14, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color="green">admin attacked DummyPlayer for <b>36</b> damage! (14 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>36</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258552359),
(19, 16, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\n<font color="green">admin attacked StrawMan for <b>35</b> damage! (15 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>36</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258552367),
(20, 17, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\n<font color="green">admin attacked PushOver for <b>37</b> damage! (13 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>36</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258552371),
(21, 13, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color="green">admin attacked test for <b>4</b> damage! (46 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>7</b> damage! (39 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>6</b> damage! (33 HP left!)<br /></font>\n<font color="red">test attacked admin for <b>2</b> damage! (138 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>8</b> damage! (25 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>6</b> damage! (19 HP left!)<br /></font>\nadmin tried to attack test but missed!<br />\n<font color="red">test attacked admin for <b>2</b> damage! (136 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>6</b> damage! (13 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>6</b> damage! (7 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>5</b> damage! (2 HP left!)<br /></font>\n<font color="red">test attacked admin for <b>1</b> damage! (135 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>8</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258810823),
(22, 14, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color="green">admin attacked DummyPlayer for <b>5</b> damage! (45 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>6</b> damage! (39 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>4</b> damage! (35 HP left!)<br /></font>\nDummyPlayer tried to attack admin but missed!<br />\n<font color="green">admin attacked DummyPlayer for <b>8</b> damage! (27 HP left!)<br /></font>\nadmin tried to attack DummyPlayer but missed!<br />\n<font color="green">admin attacked DummyPlayer for <b>5</b> damage! (22 HP left!)<br /></font>\n<font color="red">DummyPlayer attacked admin for <b>1</b> damage! (134 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>6</b> damage! (16 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>5</b> damage! (11 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>4</b> damage! (7 HP left!)<br /></font>\n<font color="red">DummyPlayer attacked admin for <b>1</b> damage! (133 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>7</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258810829),
(23, 15, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs FakePlayer</b><br /><br />\n<font color="green">admin attacked FakePlayer for <b>6</b> damage! (44 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>7</b> damage! (37 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>4</b> damage! (33 HP left!)<br /></font>\n<font color="red">FakePlayer attacked admin for <b>1</b> damage! (132 HP left!)<br /></font>\nadmin tried to attack FakePlayer but missed!<br />\n<font color="green">admin attacked FakePlayer for <b>4</b> damage! (29 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>5</b> damage! (24 HP left!)<br /></font>\n<font color="red">FakePlayer attacked admin for <b>2</b> damage! (130 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>6</b> damage! (18 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>6</b> damage! (12 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>4</b> damage! (8 HP left!)<br /></font>\n<font color="red">FakePlayer attacked admin for <b>1</b> damage! (129 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>7</b> damage! (1 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>7</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258810833),
(24, 16, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\n<font color="green">admin attacked StrawMan for <b>6</b> damage! (44 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>4</b> damage! (40 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>4</b> damage! (36 HP left!)<br /></font>\n<font color="red">StrawMan attacked admin for <b>1</b> damage! (128 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>6</b> damage! (30 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>8</b> damage! (22 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>7</b> damage! (15 HP left!)<br /></font>\nStrawMan tried to attack admin but missed!<br />\n<font color="green">admin attacked StrawMan for <b>4</b> damage! (11 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>7</b> damage! (4 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>5</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258810838),
(25, 17, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\n<font color="green">admin attacked PushOver for <b>8</b> damage! (42 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>8</b> damage! (34 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>8</b> damage! (26 HP left!)<br /></font>\n<font color="red">PushOver attacked admin for <b>2</b> damage! (126 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>8</b> damage! (18 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>4</b> damage! (14 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>8</b> damage! (6 HP left!)<br /></font>\n<font color="red">PushOver attacked admin for <b>1</b> damage! (125 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>6</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258810842),
(26, 13, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color="green">admin attacked test for <b>12</b> damage! (38 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>16</b> damage! (22 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>15</b> damage! (7 HP left!)<br /></font>\n<font color="red">test attacked admin for <b>2</b> damage! (238 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>15</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258937446),
(27, 14, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color="green">admin attacked DummyPlayer for <b>12</b> damage! (38 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>12</b> damage! (26 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>16</b> damage! (10 HP left!)<br /></font>\n<font color="red">DummyPlayer attacked admin for <b>2</b> damage! (236 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>16</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258937454),
(28, 15, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs FakePlayer</b><br /><br />\n<font color="green">admin attacked FakePlayer for <b>15</b> damage! (35 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>16</b> damage! (19 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>16</b> damage! (3 HP left!)<br /></font>\n<font color="red">FakePlayer attacked admin for <b>1</b> damage! (235 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>12</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258937460),
(29, 16, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\n<font color="green">admin attacked StrawMan for <b>12</b> damage! (38 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>12</b> damage! (26 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>12</b> damage! (14 HP left!)<br /></font>\n<font color="red">StrawMan attacked admin for <b>1</b> damage! (234 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>14</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258937466),
(30, 17, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\nadmin tried to attack PushOver but missed!<br />\n<font color="green">admin attacked PushOver for <b>13</b> damage! (37 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>15</b> damage! (22 HP left!)<br /></font>\n<font color="red">PushOver attacked admin for <b>1</b> damage! (233 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>13</b> damage! (9 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>15</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1258937471),
(31, 13, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color="green">admin attacked test for <b>17</b> damage! (33 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>18</b> damage! (15 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>14</b> damage! (1 HP left!)<br /></font>\ntest tried to attack admin but missed!<br />\n<font color="green">admin attacked test for <b>14</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259034219),
(32, 14, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color="green">admin attacked DummyPlayer for <b>16</b> damage! (34 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>16</b> damage! (18 HP left!)<br /></font>\nadmin tried to attack DummyPlayer but missed!<br />\n<font color="red">DummyPlayer attacked admin for <b>2</b> damage! (258 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>18</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259034222),
(33, 15, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs FakePlayer</b><br /><br />\n<font color="green">admin attacked FakePlayer for <b>15</b> damage! (35 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>18</b> damage! (17 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>14</b> damage! (3 HP left!)<br /></font>\n<font color="red">FakePlayer attacked admin for <b>1</b> damage! (257 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>14</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259034224),
(34, 16, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\nadmin tried to attack StrawMan but missed!<br />\n<font color="green">admin attacked StrawMan for <b>17</b> damage! (33 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>16</b> damage! (17 HP left!)<br /></font>\nStrawMan tried to attack admin but missed!<br />\n<font color="green">admin attacked StrawMan for <b>16</b> damage! (1 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>17</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259034227),
(35, 17, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\n<font color="green">admin attacked PushOver for <b>15</b> damage! (35 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>15</b> damage! (20 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>14</b> damage! (6 HP left!)<br /></font>\n<font color="red">PushOver attacked admin for <b>2</b> damage! (255 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>14</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259034229),
(36, 13, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color="green">admin attacked test for <b>18</b> damage! (32 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>15</b> damage! (17 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>15</b> damage! (2 HP left!)<br /></font>\n<font color="red">test attacked admin for <b>1</b> damage! (259 HP left!)<br /></font>\n<font color="green">admin attacked test for <b>17</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259078491),
(37, 14, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color="green">admin attacked DummyPlayer for <b>18</b> damage! (32 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>16</b> damage! (16 HP left!)<br /></font>\n<font color="green">admin attacked DummyPlayer for <b>17</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259078493),
(38, 15, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs FakePlayer</b><br /><br />\n<font color="green">admin attacked FakePlayer for <b>18</b> damage! (32 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>17</b> damage! (15 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>18</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259078495),
(39, 16, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\nadmin tried to attack StrawMan but missed!<br />\n<font color="green">admin attacked StrawMan for <b>15</b> damage! (35 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>15</b> damage! (20 HP left!)<br /></font>\n<font color="red">StrawMan attacked admin for <b>2</b> damage! (257 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>17</b> damage! (3 HP left!)<br /></font>\n<font color="green">admin attacked StrawMan for <b>18</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259078497),
(40, 17, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\n<font color="green">admin attacked PushOver for <b>16</b> damage! (34 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>14</b> damage! (20 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>15</b> damage! (5 HP left!)<br /></font>\n<font color="red">PushOver attacked admin for <b>2</b> damage! (255 HP left!)<br /></font>\n<font color="green">admin attacked PushOver for <b>17</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259078499),
(41, 15, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs FakePlayer</b><br /><br />\nadmin tried to attack FakePlayer but missed!<br />\n<font color="green">admin attacked FakePlayer for <b>30</b> damage! (20 HP left!)<br /></font>\n<font color="green">admin attacked FakePlayer for <b>26</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259916039),
(42, 14, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs DummyPlayer</b><br /><br />\n<font color="green">admin attacked DummyPlayer for <b>58</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259916162),
(43, 13, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs test</b><br /><br />\n<font color="green">admin attacked test for <b>58</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259969126),
(44, 16, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs StrawMan</b><br /><br />\n<font color="green">admin attacked StrawMan for <b>58</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259969133),
(45, 17, 'You were attacked by <a href="profile.php?id=admin">admin</a> and you were defeated...', '<b>admin vs PushOver</b><br /><br />\n<font color="green">admin attacked PushOver for <b>60</b> damage! (Dead)<br /></font>\n<br /><u>You were defeated by admin!</u><br />\n', 'unread', 1259969135);
