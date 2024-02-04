<?php
/*************************************/
/*           ezRPG script            */
/*         Written by Zeggy          */
/*         and CheapDevotion         */
/*    http://www.ezrpgproject.com    */
/*************************************/

include("./lib.php");
define("PAGENAME", "Edit Links");

if (check_permissions($player, 75) == 0) //GM rank must be 85+ to configurate the rest of the game
{
	include("./header.php");
	echo "Your GM rank is not high enough to access this page!";
	include("./footer.php");
	exit;
}

if ($_POST['updatelink'])
{

		$result = $db->execute('update `links` set `name`=?, `position`=?, `file`=?, `addin`=?, `header_id`=? where `id`=?', array($_POST['name'], $_POST['position'], $_POST['file'], $_POST['addin'], $_POST['header_id'], $_POST['id']));
		
		if (!$result)
		{
			echo "<center><font color=\"#990000\">Your link was not updated.</center><br />";
		}
		else
		{
			//include("./header.php");
			echo "<center>Your link has been updated!<br />";
			echo "<a href=\"editlinks.php\">Return to Link Edit</a></center>";
			//include("./footer.php");
			exit;
		}

}

elseif ($_POST['deletelink'])
{

		$result = $db->execute("DELETE FROM `links` WHERE `id`=?", array($_POST['id']));

		
		if (!$result)
		{
			echo "<center><font color=\"#990000\">Your link was not deleted.</center><br />";
		}
		else
		{
			//include("./header.php");
			echo "<center>Your link has been deleted!<br />";
			echo "<a href=\"editlinks.php\">Return to Link Edit</a></center>";
			//include("./footer.php");			
			exit;
		}

}

include("./header.php");

echo "<table style=\"font-size : 10pt;\" width=\"100%\" border=\"0\">\n"; 
echo "  <tr>\n"; 
echo "    <td>\n"; 
echo "    <fieldset><legend><b>Edit Links</b></legend>\n"; 
echo "    <table style=\"font-size : 10pt;\" align=\"center\">\n"; 
echo "      <tr>\n"; 
echo "        <td><b>Link Name</b></td>\n"; 
echo "        <td><b>Position</b></td>\n"; 
echo "        <td><b>File Name</b></td>\n"; 
echo "        <td><b>Code Add-in</b></td>\n"; 
echo "        <td><b>Header</b></td>\n"; 
echo "        <td><b>Edit</b></td>\n"; 
echo "        <td><b>Delete</b></td>\n"; 
echo "        \n"; 
echo "        </tr>\n";

      
//Select all members ordered by level (highest first, members table also doubles as rankings table)
$query = $db->execute("select `id`, `name`, `position` from `headers` order by `position` asc");
$query2 = $db->execute("select `id`, `name`, `file`, `header_id`, `position`, `addin` from `links` order by `header_id`, `position`");
$bool = 1;
while($link = $query2->fetchrow())
{
	echo "<form method=\"POST\" action=\"editlinks.php\"><tr>\n";
	echo "<input type=\"hidden\" name=\"id\" value=\"" . $link['id'] . "\" /></td>\n";
	echo "<td align=\"center\"><input type=\"text\" name=\"name\" value=\"" . $link['name'] . "\" size=\"13\"/></td>\n";
	echo "<td align=\"center\"><input type=\"text\" name=\"position\" value=\"" . $link['position'] . "\" size=\"2\" /></td>\n";
	echo "<td align=\"center\"><input type=\"text\" name=\"file\" value=\"" . $link['file'] . "\" size=\"13\"/></td>\n";
	echo "<td align=\"center\"><textarea rows=\"4\" cols=\"20\" name=\"addin\" />" . $link['addin'] . "</textarea></td>\n";	
	echo "<td align=\"center\"><select name=\"header_id\" >";
	$query = $db->execute("select `id`, `name`, `position` from `headers` order by `position` asc");
		while ($header =$query->fetchrow())
		{
        echo "<option value=\"" . $header['id'] . "\" "; 	
		if ($header['id']==$link['header_id'])
		{
			echo "selected=\"selected\"";
		}		
		echo ">" . $header['name'] . "</option>\n";
        }
    echo "</select></td>\n";
	echo "<td align=\"center\"><input type=\"submit\" name=\"updatelink\" value=\"Edit\" /></td>\n";
	echo "<td align=\"center\"><input type=\"submit\" name=\"deletelink\" value=\"Delete\" /></td></tr></form>\n";
	$bool = ($bool==1)?2:1;
}

echo "   </table></fieldset></td>\n"; 
echo "    <td></td>\n"; 
echo "  </tr>\n"; 
echo "</table>\n";






include("./footer.php");
?>