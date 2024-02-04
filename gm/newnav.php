<?php
/*************************************/
/*           ezRPG script            */
/*         Written by Zeggy          */
/*         and CheapDevotion         */
/*    http://www.ezrpgproject.com    */
/*************************************/
include("./lib.php");
define("PAGENAME", "Create New Navigation");

if (check_permissions($player, 75) == 0) //GM rank must be 85+ to configurate the rest of the game
{
	include("./header.php");
	echo "Your GM rank is not high enough to access this page!";
	include("./footer.php");
	exit;
}

if ($_POST['header'])
{
		$insert['name'] = $_POST['name'];
		$insert['position'] = ($_POST['position']);

		$query = $db->autoexecute('headers', $insert, 'INSERT');
		
		
		if (!$query)
		{
			echo "<center><font color=\"#990000\">Your header was not created.</center><br />";

		}
		else
		{
			$insertid = $db->Insert_ID();
			
			//include("./header.php");
			echo "<center>Your new header has been created!<br />";
			echo "<a href=\"newnav.php\">Return to New Navigation Creation</a></center>";
			//include("./footer.php");
			exit;
		}
}

elseif ($_POST['link'])
{
		$insert['name'] = $_POST['name'];
		$insert['file'] = $_POST['file'];
		$insert['addin'] = $_POST['addin'];
		$insert['header_id'] = $_POST['header_id'];
		$insert['position'] = $_POST['position'];

		$query = $db->autoexecute('links', $insert, 'INSERT');
		
		
		if (!$query)
		{
			echo "<center><font color=\"#990000\">Your link was not created.</center><br />";
		}
		else
		{
			$insertid = $db->Insert_ID();
					
			//include("./header.php");
			echo "<center>Your new link has been created!<br />";
			echo "<a href=\"newnav.php\">Return to New Navigation Creation</a></center>";
			//include("./footer.php");			
			exit;
		}

}

include("./header.php");
?>
<table width="100%" border="0">
  <tr>
    <td valign="top">
    
<form method="POST" action="newnav.php"> 
<fieldset><legend><b>Create New Header</b></legend>
<LABEL for=""><b>Name</b>&nbsp;</LABEL><br /><input type="text" name="name" value="<?=$_POST['name']?>"><br />
<LABEL for=""><b>Position</b>&nbsp;</LABEL><br /><input type="text" name="position" value="<?=$_POST['position']?>"><br /><br />
<input type="submit" name="header" value="Create Header" />
</fieldset>
</form>
    
    </td>
    <td valign="top">
    
<form method="POST" action="newnav.php">
<fieldset><legend><b>Create New Link</b></legend>
<LABEL for=""><b>Name</b>&nbsp;</LABEL><br /><input type="text" name="name" value="<?=$_POST['name']?>"><br />
<LABEL for=""><b>File</b>&nbsp;</LABEL><br /><input type="text" name="file" value="<?=$_POST['file']?>"><br />
<LABEL for=""><b>Code Add-in</b>&nbsp;</LABEL><br /><input type="text" name="addin" value="<?=$_POST['addin']?>"><br />
<LABEL for=""><b>Header</b>&nbsp;</LABEL><br />
<select class="form3" name="header_id" >
<?php
              
		$query = $db->execute("select `id`, `name`, `position` from `headers` order by `position` asc");

		while ($header =$query->fetchrow())
		{
        echo "<option value=\"" . $header['id'] . "\">" . $header['name'] . "</option>\n";
        }
?>
</select><br /><br />
<LABEL for=""><b>Position</b>&nbsp;</LABEL><br />
<input type="text" name="position" value="<?=$_POST['position']?>">
<br /><br />
<input type="submit" name="link" value="Create Link" />
</fieldset>
</form>
    
    </td>
    <td valign="top">
    
<fieldset><legend><b>Current Navigation</b></legend>
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