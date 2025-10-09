<?php
/*************************************/
/*           ezRPG script            */
/*         Written by Zeggy          */
/*    http://ezrpg.bbgamezone.com    */
/*************************************/

//Function to check if user is logged in, and if so, return user data as an object
//$player = check_user($secret_key, $db, $setting);

// Dentro do arquivo functions.php:
function check_user($secret_key, &$db, &$setting = null) {
    $ip = isset($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
    if (!isset($_SESSION['userid']) || !isset($_SESSION['hash'])) {
        header("Location: index.php");
        exit;
    } else {
		$check = sha1($_SESSION['userid'] . $ip . $secret_key);
		if ($check != $_SESSION['hash']) {
			session_unset();
			session_destroy();
			header("Location: logout.php");
			exit;
		} else {
			$query = $db->execute("select * from `players` where `id`=?", array($_SESSION['userid']));
			$userarray = $query->fetchrow();
			if ($query->recordcount() == 0) {
				session_unset();
				session_destroy();
				header("Location: logout.php");
				exit;
			}
			$user = new stdClass(); // já está correto
            if (is_array($userarray)) {
                foreach($userarray as $key=>$value) {
                    $user->$key = $value;
                }
            }
			//Check if game is closed or not
            if (is_object($setting) && is_object($user)) {
                if ($setting->general_close_game == "yes" && $user->gm_rank <= 20) {
                    session_unset();
                    session_destroy();
                    header("Location: index.php");
                    exit;
                }
            }
			if ($user->ban >= time()) {
				//Clear user's session data
				session_unset();
				session_destroy();
				header("Location: index.php");
			}
			$query = $db->execute("update `players` set `last_active`=? where `id`=?", array(time(), $user->id));
			return $user;
		}
	}
}
//Gets the number of unread messages
function unread_messages($id, &$db) {
	$query = $db->getone("select count(*) as `count` from `mail` where `to`=? and `status`='unread'", array($id));
	return $query;
}
//Gets new log messages
function unread_log($id, &$db) {
	$query = $db->getone("select count(*) as `count` from `user_log` where `player_id`=? and `status`='unread'", array($id));
	return $query;
}
//Insert a log message into the user logs
function addlog($id, $msg) {
    global $db;
	$insert['player_id'] = $id;
	$insert['msg'] = $msg;
	$insert['time'] = time();
	$query = $db->autoexecute('user_log', $insert, 'INSERT');
}
//Insert a log message into the error log
function errorlog($msg, &$db) {
	$insert['msg'] = $msg;
	$insert['time'] = time();
	$query = $db->autoexecute('log_errors', $insert, 'INSERT');
}
//Insert a log message into the GM log
function gmlog($msg, &$db) {
	$insert['msg'] = $msg;
	$insert['time'] = time();
	$query = $db->autoexecute('log_gm', $insert, 'INSERT');
}
//Insert addin_modules
function insert_addins ($position, &$player, &$setting, &$lang, &$db) {
	$query = $db->execute("select * from `addins` where `position`=? order by `ord`", array($position));
	if ($query->recordcount() > 0) {
		while ($addin_modules = $query->fetchrow()) {
			 include ("addins/" . $addin_modules['link'] . "");
		}
	}
}
//Gets item name from table items.id
function item_name($item, &$db) {
	$query = $db->execute("select item_id from items where id=?", array($item));
	$specificitem=$query->fetchrow();
	$query = $db->execute("select name from blueprint_items where id=?", array($specificitem['item_id']));
	$typeitem = $query->fetchrow();
	return $typeitem['name'];
}
// Get player's name from id
function player_name($playerid, &$db) {
	$query = $db->execute("select `username` from `players` where id=?", array($playerid));
	$result = $query->fetchrow();
	return $result['username'];
}

?>