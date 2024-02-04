<?php
// Sanitizes input
function Clean($str) {    
	return htmlspecialchars(strip_tags(mysql_real_escape_string(trim($str))));
}

// Unsanitizes input
function showClean($str) {     
	return stripcslashes($str);
}

// Convert bbcode tags to html
function bbCode($str)
{
	$str = str_replace("<BR>", "<br />", $str); //Valid xHTML
	$str = str_replace("grrr", "<img src=\"images/angry.png\" />", $str);
 	$str = str_replace("zzz", "<img src=\"images/sleepy.png\" />", $str);
	$str = str_replace("rofl", "<img src=\"images/rofl.png\" />", $str);
	$str = str_replace("8)", "<img src=\"images/cool.png\" />", $str);
	$str = str_replace(":'(", "<img src=\"images/cry.png\" />", $str);
	$str = str_replace(":S", "<img src=\"images/embarrassed.png\" />", $str);
	$str = str_replace(":D", "<img src=\"images/laugh.png\" />", $str);
	$str = str_replace(":(", "<img src=\"images/sad.png\" />", $str);
	$str = str_replace(":*)", "<img src=\"images/shy.png\" />", $str);
	$str = str_replace(":)", "<img src=\"images/smile.png\" />", $str);
	$str = str_replace(":O", "<img src=\"images/surprised.png\" />", $str);
	$str = str_replace(":P", "<img src=\"images/tongue.png\" />", $str);
	$str = str_replace(";)", "<img src=\"images/wink.png\" />", $str);
	$str = str_replace("^_^", "<img src=\"images/cute.png\" />", $str);
	$str = str_replace("@_@", "<img src=\"images/hypnotized.png\" />", $str);
	$str = preg_replace("#\n#i", '<br />', $str);
	$str = preg_replace("#\[(left|right|center)\](.+?)\[/\\1\]#is", "<div align=\"\\1\">\\2</div>", $str); 
	$str = preg_replace("#\[(b|i|u|s)\](.+?)\[/\\1\]#is", "<\\1>\\2</\\1>", $str);
	$str = preg_replace("#\[(url)\=(.+?)\](.*?)\[/\\1\]#is", "<a href=\"\\2\">\\3</a>", $str); 
	$str = preg_replace("#\[(url)\](.*?)\[/\\1\]#is", "<a href=\"\\2\">\\2</a>", $str); 
	$str = preg_replace("#\[(color)\=(.+?)\](.*?)\[/\\1\]#is", "<font color=\"\\2\">\\3</font>", $str); 
	$str = preg_replace("#\[(img)\](.*?)\[/\\1\]#is", "<img src=\"\\2\" width='280' height='280'/>", $str); 
	$str = preg_replace("#\[(youtube)\](.*?)\[/\\1\]#is", "<object width=\"320\" height=\"265\"><param name=\"movie\" value=\"http://www.youtube.com/v/\\2=en_US&fs=1&rel=0\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/\\2=en_US&fs=1&rel=0\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"300\" height=\"250\"></embed></object>", $str); 
    $str = preg_replace("/\[quote](.*)\[\/quote\]/Uis", "<div>Quote:</div><div style=\"border:solid 1px;\"><br />\\1<br /><br /></div>", $str);
    $str = preg_replace("/\[quote=(.*)](.*)\[\/quote\]/Uis", "<div>Quote from: \\1</div><div style=\"border:solid 1px;\"><br />\\2<br /><br /></div>", $str);
$str = preg_replace("/\[quote=(.*)](.*)\[\/quote\]/Uis", "<div>Quote from: \\1</div><div style=\"border:solid 1px;\"><br />\\2<br /><br /></div>", $str);
    return $str;
}
// Validation test functions (named to be self-explanatory)
function is_number($str)
{
	if(!preg_match("/^\-?\+?[0-9e1-9]+$/",$str))
		return false;
	return true;
}

function is_alpha_numeric($str)
{
	if(!preg_match("/^[A-Za-z0-9]+$/",$str))
		return false;
	return true;
}

function is_date($str)
{
	if(!preg_match("/^(\d){1,2}[-\/](\d){1,2}[-\/]\d{4}$/",$str,$matches))
		return -1;//Bad Date Format
	$T = split("[-/\\]",$str);
	$MON=array(0,31,28,31,30,31,30,31,31,30,31,30,31);
	$M = $T[0];
	$D = $T[1];
	$Y = $T[2];
	return $D>0 && ($D<=$MON[$M] ||	$D==29 && $Y%4==0 && ($Y%100!=0 || $Y%400==0)); 
}

function is_text($str)
{
	if(!preg_match("/^[A-Za-z0-9-\s]+$/",$str))
		return false;
	return true;
}

function is_empty($str)
{
	if(!empty($str)) 
		return true;
	return false;
}
//// Get player's avatar from id
function player_avatar($playerid, &$db) {
	$query = $db->execute("select `avatar` from `players` where id=?", array($playerid));
	$result = $query->fetchrow();
	return $result['avatar'];
}