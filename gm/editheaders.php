<?php
/*************************************/
/*           ezRPG script            */
/*         Written by Zeggy          */
/*         and CheapDevotion         */
/*    http://www.ezrpgproject.com    */
/*************************************/

include("./lib.php");
define("PAGENAME", "Edit Headers");

if (check_permissions($player, 75) == 0) //GM rank must be 85+ to configurate the rest of the game
{
	include("./header.php");
	echo "Your GM rank is not high enough to access this page!";
	include("./footer.php");
	exit;
}

if ($_POST['updateheader'])
{

		$result = $db->execute('update `headers` set `name`=?, `position`=? where `id`=?', array($_POST['name'], $_POST['position'], $_POST['id']));
		
		if (!$result)
		{
			echo "<center><font color=\"#990000\">Your header was not updated.</center><br />";
		}
		else
		{
			//include("./header.php");
			echo "<center>Your header has been updated!<br />";
			echo "<a href=\"editheaders.php\">Return to Headers Edit</a></center>";
			//include("./footer.php");
			exit;
		}

}

elseif ($_POST['deleteheader'])
{

		$result = $db->execute("DELETE FROM `headers` WHERE `id`=?", array($_POST['id']));

		
		if (!$result)
		{
			echo "<center><font color=\"#990000\">Your header was not deleted.</center><br />";
		}
		else
		{
			
			//include("./header.php");
			echo "<center>Your header has been deleted!<br />";
			echo "<a href=\"editheaders.php\">Return to Headers Edit</a></center>";
			//include("./footer.php");
			exit;
		}

}



include("./header.php");
?>
<table width="100%" border="0">
<tr>
<td valign="top">
<fieldset><legend><b>Edit Headers</b></legend>
<table width="100%" border="0">
<tr>
<td align="center"><b>Header Name</b></td>
<td align="center"><b>Position</b></td>
<td align="center"><b>Edit</b></td>
<td align="center"><b>Delete</b></td>
</tr>

<?php     
$query = $db->execute("select `id`, `name`, `position` from `headers` order by `position` asc");
$query2 = $db->execute("select `id`, `name`, `file`, `header_id`, `position`, `addin` from `links` order by `position` asc");

$bool = 1;
while($header = $query->fetchrow())
{
	echo "<form method=\"POST\" action=\"editheaders.php\"><tr>\n";
	echo "<input type=\"hidden\" name=\"id\" value=\"" . $header['id'] . "\" /></td>\n";
	echo "<td align=\"center\"><input type=\"text\" name=\"name\" value=\"" . $header['name'] . "\" /></td>\n";
	echo "<td align=\"center\"><input type=\"text\" name=\"position\" value=\"" . $header['position'] . "\" /></td>\n";
	echo "<td align=\"center\"><input type=\"submit\" name=\"updateheader\" value=\"Edit\" /></td>\n";
	echo "<td align=\"center\"><input type=\"submit\" name=\"deleteheader\" value=\"Delete\" /></td></tr></form>\n";

	$bool = ($bool==1)?2:1;
}
?>
</table>
</fieldset>

</td>
    <td valign="top" width="30%">
    
<fieldset><legend><b>Current Navigation</b></legend>
<br />
<?php
$headerquery = $db->execute("select * from `headers` order by `position` asc");

if ($headerquery->recordcount() == 0){}
else 
{
	while($header = $headerquery->fetchrow())
	{
		echo "<div class=\"navv\">\n";
		echo "<ul><li><a class=\"header\">" . $header['name']. "</a></li>\n";
		echo "<ul>";	
		$linkquery = $db->execute("select * from `links` where `header_id`=? order by `header_id`, `position` asc", array($header['id']));
			while ($link = $linkquery->fetchrow())
			{
					eval("?><li><a href=\"../" . $link['file'] . "\">" . $link['name'] . "</a></li>\n<?");
			}
		echo "</ul></ul></div><br /><br />";			
	}
}

if ($player->gm_rank > 20) {
	echo "<div class=\"navv\">";
	echo "<ul><li><a class=\"header\">ADMIN</a></li>";
	echo "<ul>";
	echo "<li><a href=\"../gm/index.php\">GM Panel Index</a></li>";
	echo "</ul></ul></div>";
}
?>
</fieldset>
</td>
</tr> 
</table>

<?php
include("./footer.php");
?>