<?php
/*************************************/
/*      ezRPG script (modified)      */
/*       Written by Bogatabeav       */
/*    http://www.ezrpgproject.com    */
/*************************************/
include("./lib.php");
define("PAGENAME", "Addins Placement Editor");
if (check_permissions($player, 75) == 0) 

//GM rank must be 85+ to configurate the rest of the game
{
include("./header.php");
echo "Your GM rank is not high enough to access this page!";
include("./footer.php");
exit;
}

if ($_POST['update_addin'])
{
	$query = $db->execute('update `addins` set `name`=?, `position`=?, `ord`=? where `link`=?', array($_POST['name'], $_POST['position'], $_POST['ord'], $_POST['link']));

	if (!$query)
	{
		//include("./header.php");
		echo "<center><font color=\"#990000\">Your Addins have not been not updated.</font></center><br />";
		echo "<a href=\"addins.php\">Return to Addins Placement Editor</a></center>";
		//include("./footer.php");
	}
	else
	{
		header('Location: addins.php');
		exit; 
	}
}

elseif ($_POST['add_addin'])
{
	$insert['name'] = $_POST['name'];
	$insert['position'] = ($_POST['position']);
	$insert['link'] = $_POST['link'];
	$insert['ord'] = $_POST['ord'];
	
		$query = $db->autoexecute('addins', $insert, 'INSERT');



	if (!$query)
	{
		echo "<center><font color=\"#990000\">Your Addin has not been not updated.</font></center><br />";
	}
	else
	{
		$insertid = $db->Insert_ID();
		
		//include("./header.php");
		echo "<center>Your addin has has been updated!<br />";
		echo "<a href=\"addins.php\">Return to Addins Placement Editor</a></center>";
		//include("./footer.php");
		exit;
	}
}

include("./header.php");
echo "<fieldset><legend><b>Addin Placement Menu</b></legend>";
echo "<table width=\"100%\" >";
echo "<tr><th>Name</th><th>Addin File</th><th>Page Position</th><th>Placement Order</th><th>Action</th></tr>"; 

if ($handle = opendir('../addins')) 
{
   	while (false !== ($file = readdir($handle)))
	{
        if ($file != "." && $file != "..")
		{
			$query = $db->execute("select * from `addins` where `link`=? order by `position`, ord", array($file));
			$addin_query = $query->fetchrow();
			
	 		if ($addin_query['link']==$file)
 			{
			echo "<tr>";
			echo "<form method=\"POST\" action=\"addins.php\">";
			echo "<td align=\"center\"><label><input type=\"text\" name=\"name\" value=\"" . $addin_query['name'] . "\" ></td>";
 			echo "<td align=\"center\"><input type=\"text\" name=\"link\" value=\"" . $addin_query['link'] . "\" readonly></td>";
			echo "<td align=\"center\"><select name=\"position\">";
			echo "<option value=\"1\"" . (($addin_query['position']=="1")?" selected=\"selected\"":"") . ">Top Horizontal Bar</option>";
			echo "<option value=\"2\"" . (($addin_query['position']=="2")?" selected=\"selected\"":"") . ">Sidebar 1</option>";
			echo "<option value=\"3\"" . (($addin_query['position']=="3")?" selected=\"selected\"":"") . ">Sidebar 2</option>";
 			echo "<option value=\"0\"" . (($addin_query['position']=="0")?" selected=\"selected\"":"") . ">Remove from page</option>";
 			echo "</select></td>";
			echo "<td align=\"center\"><select name=\"ord\">";
			echo "<option value=\"1\"" . (($addin_query['ord']=="1") ? " selected=\"selected\"":"") . ">1</option>";
 			echo "<option value=\"2\"" . (($addin_query['ord']=="2") ? " selected=\"selected\"":"") . ">2</option>";
 			echo "<option value=\"3\"" . (($addin_query['ord']=="3") ? " selected=\"selected\"":"") . ">3</option>";
 			echo "<option value=\"4\"" . (($addin_query['ord']=="4") ? " selected=\"selected\"":"") . ">4</option>";
 			echo "<option value=\"5\"" . (($addin_query['ord']=="5") ? " selected=\"selected\"":"") . ">5</option>";
 			echo "<option value=\"0\"" . (($addin_query['ord']=="0") ? " selected=\"selected\"":"") . ">Remove from page</option>";
			echo "</select></td>";
			echo "<td align=\"center\"><input type=\"submit\" name=\"update_addin\" value=\"Update\" /></td>";
 			echo "</form></tr>";
 			}
			else 
			{
			echo "<tr>";
			echo "<form method=\"POST\" action=\"addins.php\">";
			echo "<td align=\"center\"><input type=\"text\" name=\"name\" value=\"" . $_POST['name'] . "\" ></td>";
			echo "<td align=\"center\"><input type=\"text\" name=\"link\" value=\"" . $file . "\" readonly></td>";
			echo "<td align=\"center\"><select name=\"position\">";
			echo "<option value=\"1\">Top Horizontal Bar</option>";
			echo "<option value=\"2\">Sidebar 1</option>";
			echo "<option value=\"3\">Sidebar 2</option>";
			echo "<option value=\"0\" selected=\"selected\">Not on page</option>";
			echo "</select></td>";
			echo "<td align=\"center\"><select name=\"ord\">";
			echo "<option value=\"1\">1</option>";
			echo "<option value=\"2\">2</option>";
			echo "<option value=\"3\">3</option>";
			echo "<option value=\"4\">4</option>";
			echo "<option value=\"5\">5</option>";
			echo "<option value=\"0\" selected=\"selected\">Not on page</option>";
			echo "</select></td>";
			echo "<td align=\"center\"><input type=\"submit\" name=\"add_addin\" value=\"Update\" /></td>";
 			echo "</form></tr>";
			}
  		}
	}
 	closedir($handle);
}

echo "</table></fieldset>";

include("./footer.php");
?>