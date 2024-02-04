<div id="addin">
	<div id="addin-top-left">
	</div>
	<div id="addin-top-right">
	</div>
<?php
echo "<h2>Latest Threads<br/></h2>";
$result = $db->execute("SELECT * FROM `forum_thread` ORDER BY datetime desc LIMIT 5");
if ($result!=NULL) {
	echo "<table style=\"{font-size:10px;border:0px;}\">";
	while ($row = $result->fetchrow()) {
		$newtime = date('g:i a',strtotime($row['datetime']));
		$newdate = date('j M y',strtotime($row['datetime']));
		$playername = player_name($row['name'], $db);
		echo "<tr>";
		echo "<td><a href=\"forum.php?page=th&th_id=" . $row['id'] . "\">" . $row['title'] . "</a></td>";
		echo "</tr>";
		echo "<tr>";
		echo "<td>by <a href=\"profile.php?id=" . $playername . "\">" . $playername . "</a></td>";
		echo "</tr>";
		echo "<tr>";
		echo "<td colspan=\"2\">at " .  $newtime  . " on " .  $newdate  . "</td>";
		echo "</tr>";
	}
	echo "</table>";

} else {
	echo "There are no threads.";	
}
?>
	<div id="addin-bottom-left">
	</div>
	<div id="addin-bottom-right">
	</div>
</div>