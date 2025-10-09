<?php
/*************************************/
/*   ezRPG script (Dynamax Version)  */
/*   Dynamax written by Bogatabeav   */
/*      http://sunofloki.com         */
/*************************************/
echo "<div id=\"addin\"><div id=\"addin-top-left\"></div>
<div id=\"addin-top-right\"></div><table style=\"{font-size:9px;border:0px;}\"><br />";	
if (isset($_POST['new_criteria']) && $_POST['new_criteria']) {
	$result = $db->execute('update `players` set `top_ten`=? where `id`=?', array($_POST['leader'], $_POST['id']));
}
if ($player->top_ten == "bank") {
	$result = $db->execute('select `id`, `username`, `bank` from `players` order by `bank` desc limit 10');
	echo "<tr><h2>Richest Players</h2></tr>";
	echo "<tr><td><b><u>Name</u></b></td><td><b><u>Amount</u></b></td></tr>";
	while ($leaders = $result->fetchrow()) {
		echo "<tr><td><a href=\"profile.php?id=" . $leaders['username'] . "\">" . $leaders['username'] . "</a></td><td>$" .  $leaders['bank'] . "<td></tr>";
	}
	echo "</table>";
} elseif ($player->top_ten == "level") {
	$result = $db->execute('select `id`, `username`, `level` from `players` order by `level` desc limit 10');
	echo "<tr><h2>Highest Levels</h2></tr>";
	echo "<tr><th align=\"left\"><b><u>Name</u></b></th><th align=\"left\"><b><u>Level</u></b></th></tr>";
	while ($leaders = $result->fetchrow()) {
		echo "<tr><td><a href=\"profile.php?id=" . $leaders['username'] . "\">" . $leaders['username'] . "</a></td><td>" .  $leaders['level'] . "<td></tr>";
	}
	echo "</table>";
} elseif ($player->top_ten == "kills") {
	$result = $db->execute('select `id`, `username`, `kills` from `players` order by `kills` desc limit 10');	
	echo "<tr><h2>Most Kills</h2></tr>";
	echo "<tr><th align=\"left\"><b><u>Name</u></b></th><th align=\"left\"><b><u>Kill Count</u></b></th></tr>";
	while ($leaders = $result->fetchrow()) {
		echo "<tr><td><a href=\"profile.php?id=" . $leaders['username'] . "\">" . $leaders['username'] . "</a></td><td>" .  $leaders['kills'] . "<td></tr>";
	}
	echo "</table>";
} elseif ($player->top_ten == "strength") {
	$result = $db->execute('select `id`, `username`, `strength` from `players` order by `strength` desc limit 10');
	echo "<tr><h2>Highest Strength</h2></tr>";
	echo "<tr><th align=\"left\"><b><u>Name</u></b></th><th align=\"left\"><b><u>Rating</u></b></th></tr>";
	while ($leaders = $result->fetchrow()) {
		echo "<tr><td><a href=\"profile.php?id=" . $leaders['username'] . "\">" . $leaders['username'] . "</a></td><td>" .  $leaders['strength'] . "<td></tr>";
	}
	echo "</table>";
} elseif ($player->top_ten == "vitality") {
	$result = $db->execute('select `id`, `username`, `vitality` from `players` order by `vitality` desc limit 10');
	echo "<tr><h2>Highest Vitality</h2></tr>";
	echo "<tr><th align=\"left\"><b><u>Name</u></b></th><th align=\"left\"><b><u>Rating</u></b></th></tr>";
	while ($leaders = $result->fetchrow()) {
		echo "<tr><td><a href=\"profile.php?id=" . $leaders['username'] . "\">" . $leaders['username'] . "</a></td><td>" .  $leaders['vitality'] . "<td></tr>";
	}
	echo "</table>";
} elseif ($player->top_ten == "agility") {
	$result = $db->execute('select `id`, `username`, `agility` from `players` order by `agility` desc limit 10');	
	echo "<tr><h2>Highest Agility</h2></tr>";
	echo "<tr><th align=\"left\"><b><u>Name</u></b></th><th align=\"left\"><b><u>Rating</u></b></th></tr>";
	while ($leaders = $result->fetchrow()) {
		echo "<tr><td><a href=\"profile.php?id=" . $leaders['username'] . "\">" . $leaders['username'] . "</a></td><td>" .  $leaders['agility'] . "<td></tr>";
	}
	echo "</table>";
} else {

	echo "</table>";
}
?>
<br />
<form method="POST" action="<?=strtolower(PAGENAME)?>.php" style="{margin:0px;}">
<input type="hidden" name="id" value="<?=$player->id?>">
Search Leaders by
<select name="leader">
<option <?php echo "" . (($player->top_ten=="level") ? "selected=\"selected\"":"") . ""; ?> value="level">Level</option>
<option <?php echo "" . (($player->top_ten=="bank") ? "selected=\"selected\"":"") . ""; ?> value="bank">Gold</option>
<option <?php echo "" . (($player->top_ten=="strength") ? "selected=\"selected\"":"") . ""; ?> value="strength">Strength</option>
<option <?php echo "" . (($player->top_ten=="vitality") ? "selected=\"selected\"":"") . ""; ?> value="vitality">Vitality</option>
<option <?php echo "" . (($player->top_ten=="agility") ? "selected=\"selected\"":"") . ""; ?> value="agility">Agility</option>
<option <?php echo "" . (($player->top_ten=="kills") ? "selected=\"selected\"":"") . ""; ?> value="kills">Most Kills</option>
<option <?php echo "" . (($player->top_ten=="hide") ? "selected=\"selected\"":"") . ""; ?> value="hide">Minimize</option>
</select>
<input type="submit" name="new_criteria" value="Update" onclick="location.reload(true)" />
</form>
	<div id="addin-bottom-left">
	</div>
	<div id="addin-bottom-right">
	</div>
</div>