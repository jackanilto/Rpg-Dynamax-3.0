<?php
/*************************************/
/*   ezRPG script (Dynamax Version)  */
/*   Dynamax written by Bogatabeav   */
/*      http://sunofloki.com         */
/*************************************/
$headerquery = $db->execute("select * from `headers` order by `position` asc");
if ($headerquery->recordcount() == 0){}
else {
	echo "<div class=\"navh\"><ul id=\"navh\">";
	while($header = $headerquery->fetchrow()) {
		echo "<li class=\"header\">" . strtoupper($header['name']). "<ul>";
		$linkquery = $db->execute("select * from `links` where `header_id`=? order by `header_id`, `position` asc", array($header['id']));
			while ($link = $linkquery->fetchrow()) {
					eval("?><li><a href=\"" . $link['file'] . "\">" . $link['name'] . " " . $link['addin'] . "</a></li><?");
			}
		echo "</ul></li>";	
	}
	if ($player->gm_rank > 20) {
	echo "<li class=\"header\">ADMIN<ul>";
	echo "<li><a href=\"gm/index.php\">GM Panel Index</a></li>";
	echo "</ul></li>";
	echo "</ul></div>";
	}
}
?>