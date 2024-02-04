<?php
/*************************************/
/*   ezRPG script (Dynamax Version)  */
/*   Dynamax written by Bogatabeav   */
/*      http://sunofloki.com         */
/*************************************/
$headerquery = $db->execute("select * from `headers` order by `position` asc");
if ($headerquery->recordcount() == 0){}
else {
	while($header = $headerquery->fetchrow()) {
		echo "<div class=\"navv\">\n";
		echo "<ul><div id=\"navv-top\"><div id=\"navv-top-left\"></div><div id=\"navv-top-right\"></div></div><a class=\"header\">" . $header['name']. "</a>\n";
		echo "<ul>";	
		$linkquery = $db->execute("select * from `links` where `header_id`=? order by `header_id`, `position` asc", array($header['id']));
			while ($link = $linkquery->fetchrow()) {
					eval("?><li><a href=\"" . $link['file'] . "\">" . $link['name'] . " " . $link['addin'] . "</a></li>\n<?");
			}
		echo "</ul></ul></div>";	
		echo "<div id=\"navv-bottom\"><div id=\"navv-bottom-left\"></div><div id=\"navv-bottom-right\"></div></div>";
	}
}
if ($player->gm_rank > 20) {
	echo "<div class=\"navv\">";
	echo "<ul><div id=\"navv-top\"><div id=\"navv-top-left\"></div><div id=\"navv-top-right\"></div></div><a class=\"header\">ADMIN</a>";
	echo "<ul>";
	echo "<li><a href=\"gm/index.php\">GM Panel Index</a></li>";
	echo "</ul></ul></div>";
	echo "<div id=\"navv-bottom\"><div id=\"navv-bottom-left\"></div><div id=\"navv-bottom-right\"></div></div>";
}
?>