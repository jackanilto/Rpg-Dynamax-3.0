<?php
/*************************************/
/*           ezRPG script            */
/*         Written by Zeggy          */
/*         and CheapDevotion         */
/*    http://www.ezrpgproject.com    */
/*************************************/

include("./lib.php");
define("PAGENAME", "Theme Selection");

if (check_permissions($player, 75) == 0) //GM rank must be 85+ to configurate the rest of the game
{
	include("./header.php");
	echo "Your GM rank is not high enough to access this page!";
	include("./footer.php");
	exit;
}

if ($_POST['updatetheme'])
{
		$result = $db->execute('update `settings` set `value`=? where `name`="theme"', array($_POST['theme']));
		
		if (!$result)
		{
			//include("./header.php");
			echo "<center><font color=\"#990000\">Your theme was not selected.</font></center><br />";
			echo "<a href=\"themes.php\">Return to Theme Selecton</a></center>";
			//include("./footer.php");

		}
		else
		{
			header('Location: themes.php');
			exit;
		}

}

include("./header.php");

$path = "../templates/themes";
$dir_handle = @opendir($path) or die("Unable to open $path");


echo "<table width=\"100%\" border=\"0\">\n"; 
echo "<tr>\n"; 
echo "<td valign=\"top\">\n"; 
echo "<br /><fieldset style=\"width: 250px; \"><legend><b>Theme Selection Menu</b></legend>\n"; 
echo "<center><form method=\"POST\" action=\"themes.php\">\n"; 
echo "<label>Select Theme</label><br />\n"; 
echo "<select name=\"theme\">\n";


while ($file = readdir($dir_handle)) 
{
   if($file!="." && $file!="..")
	echo "<option " . (($setting->theme==$file) ? "selected=\"selected\"":"") . " value=\"" . $file . "\">" . $file . "</option>\n";
}
closedir($dir_handle);

echo "</select>\n"; 
echo "<br />\n"; 
echo "<br />\n"; 
echo "<input type=\"submit\" name=\"updatetheme\" value=\"Change Theme\" />\n"; 
echo "</form></center>\n"; 
echo "\n"; 
echo "\n"; 
echo "\n"; 
echo "</form></fieldset></td>\n"; 
echo "    \n"; 
echo "    \n"; 
echo "<td><fieldset><legend><b>Current Theme</b></legend>\n"; 
echo "	<center><h3>" . ucwords($setting->theme) . "</h3>\n"; 
echo "    <img border=\"1\" src=\"../templates/themes/" . $setting->theme . "/images/screenshot.jpg\" width=\"500\" height=\"450\" /></center>\n"; 
echo "    <br />\n"; 
echo "</fieldset></td>\n"; 
echo " </tr>\n"; 
echo "</table>\n";



include("./footer.php");
?>