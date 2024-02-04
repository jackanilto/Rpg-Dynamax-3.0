<?php
/*************************************/
/*           ezRPG script            */
/*         Written by Zeggy          */
/*         and CheapDevotion         */
/*    http://www.ezrpgproject.com    */
/*************************************/

include("./lib.php");
define("PAGENAME", "Layout Editor");

if (check_permissions($player, 75) == 0) //GM rank must be 85+ to configurate the rest of the game
{
	include("./header.php");
	echo "Your GM rank is not high enough to access this page!";
	include("./footer.php");
	exit;
}

if ($_POST['updatelayout'])
{
		if ($_POST['col']=="1col")
		{
			$_POST['sb'] = "nsb";	
		}
		$newlayout = $_POST['col'] . "-" . $_POST['sb'] . "-wohor.css";
		
		$result = $db->execute('update `settings` set `value`=? where `name`="layout"', array($newlayout));
		$result = $db->execute('update `settings` set `value`=? where `name`="width"', array($_POST['width']));
		
		if (!$result)
		{
			//include("./header.php");
			echo "<center><font color=\"#990000\">Your layout was not updated.</font></center><br />";
			echo "<a href=\"layout.php\">Return to Layout Editor</a></center>";
			//include("./footer.php");

		}
		else
		{
			header('Location: layout.php');
			exit;
		}

}

include("./header.php");
$col = substr($setting->layout, -18, 4);
$sb = substr($setting->layout, -13, 3);
$hor = substr($setting->layout, -9, 5);
$image = substr($setting->layout, -18, 14);
?>
<table width="100%" border="0">
  <tr>
    <td valign="top">
    <br />
<fieldset style="width: 250px; "><legend><b>Layout Creation Menu</b></legend>
<center><form method="POST" action="layout.php">
<label>Select Width</label><br />
<select name="width">
<option <?php echo "" . (($setting->width=="100") ? "selected=\"selected\"":"") . ""; ?> value="100">Fluid Width(100%)</option>
<option <?php echo "" . (($setting->width=="80") ? "selected=\"selected\"":"") . ""; ?> value="80">Fluid Width(80%)</option>
<option <?php echo "" . (($setting->width=="60") ? "selected=\"selected\"":"") . ""; ?> value="60">Fluid Width(60%)</option>
<option <?php echo "" . (($setting->width=="800x600") ? "selected=\"selected\"":"") . ""; ?> value="800x600">Fixed Width(800px x 600px)</option>
<option <?php echo "" . (($setting->width=="1024x960") ? "selected=\"selected\"":"") . ""; ?> value="1024x960">Fixed Width(1024px x 960px)</option>
</select>
<br /><br />
<label>Number of Columns</label><br />
<select name="col">
<option <?php echo "" . (($col=="3col") ? "selected=\"selected\"":"") . ""; ?> value="3col">3 Columns</option>
<option <?php echo "" . (($col=="2col") ? "selected=\"selected\"":"") . ""; ?> value="2col">2 Columns</option>
<option <?php echo "" . (($col=="1col") ? "selected=\"selected\"":"") . ""; ?> value="1col">1 Column</option>
</select>
<br /><br />
<label>Sidebar One Position</label><br />
<select name="sb">
<option <?php echo "" . (($sb=="lsb") ? "selected=\"selected\"":"") . ""; ?> value="lsb">Left Sidebar</option>
<option <?php echo "" . (($sb=="rsb") ? "selected=\"selected\"":"") . ""; ?> value="rsb">Right Sidebar</option>
</select>
<br /><br />
<input type="submit" name="updatelayout" value="Change Layout" />
</form></center></fieldset></td>
    <td align="top"><fieldset><legend><b>Current Layout</b></legend>
    <br />
	<center> <img src="../templates/layouts/images/header.jpg" width="450" height="50" alt="" /></center>
<?php 
	echo "" . (($hor=="w_hor") ? "<center><img src=\"../templates/layouts/images/hor.jpg\" width=\"450\" height=\"25\" alt=\"\" /></center>":"") . ""; 
?>
 	<center> <img src="../templates/layouts/images/<?=$col?><?=$sb?>.jpg" width="450" height="350" alt="" /></center>


	<center> <img src="../templates/layouts/images/footer.jpg" width="450" height="25" alt="" /></center>
   	<center> <img src="../templates/layouts/images/<?=$setting->width?>.jpg" width="450" height="40" alt="" /></center>
    <br />

</fieldset></td>
  </tr>
</table>


<?php
include("./footer.php");
?>