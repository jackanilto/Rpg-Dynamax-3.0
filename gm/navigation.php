<?php
/*************************************/
/*           ezRPG script            */
/*         Written by Zeggy          */
/*         and CheapDevotion         */
/*    http://www.ezrpgproject.com    */
/*************************************/

include("./lib.php");
define("PAGENAME", "Link Navigation");

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
			echo "<a href=\"navigation.php\">Return to Navigation</a></center>";
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
		$insert['position'] = ($_POST['position']);

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
			echo "<a href=\"navigation.php\">Return to Navigation</a></center>";
			//include("./footer.php");			
			exit;
		}

}

elseif ($_POST['updateheader'])
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
			echo "<a href=\"navigation.php\">Return to Navigation</a></center>";
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
			echo "<a href=\"navigation.php\">Return to Navigation</a></center>";
			//include("./footer.php");
			exit;
		}

}

elseif ($_POST['updatelink'])
{

		$result = $db->execute('update `links` set `name`=?, `position`=?, `file`=?, `addin`=?, `header_id`=? where `id`=?', array($_POST['name'], $_POST['position'], $_POST['file'], $_POST['addin'], $_POST['header_id'], $_POST['id']));
		
		if (!$result)
		{
			echo "<center><font color=\"#990000\">Your link was not dated.</center><br />";
		}
		else
		{
			//include("./header.php");
			echo "<center>Your link has been updated!<br />";
			echo "<a href=\"navigation.php\">Return to Navigation</a></center>";
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
			echo "<a href=\"navigation.php\">Return to Navigation</a></center>";
			//include("./footer.php");			
			exit;
		}

}

include("./header.php");
?>
<br />
<h1><center>Navigation Menu</center></h1>

<table width="100%" border="0" align="center">
  <tr>
    <th><h2>Create New Header</h2></th>
    <th><h2>Create New Link</h2></th>
  </tr>
  <tr>
    <td valign="top"> <form method="POST" action="navigation.php">
    <table border="1" align="center" cellpadding="2" cellspacing="1"  rules="groups" frame="box" >
      <tr>
        <td align="center"><LABEL for=""><b>Name</b>&nbsp;</LABEL><br /><input type="text" name="name" value="<?=$_POST['name'];?>" class="form3"></td>
      </tr>
      <tr>
        <td align="center"><LABEL for=""><b>Position</b>&nbsp;</LABEL><br /><input type="text" name="position" value="<?=$_POST['position'];?>" class="form3"><br /><br /></td>
      </tr>
      <tr>
        <td align="center"><input type="submit" name="header" value="Create Header" /></td>
      </tr>
    </table>
    </form>
</td>
    <td valign="top"><form method="POST" action="navigation.php">
      <table border="1" align="center" cellpadding="2" cellspacing="1"  rules="groups" frame="box" >
        <tr>
          <td align="center"><LABEL for=""><b>Name</b>&nbsp;</LABEL><br /><input type="text" name="name" value="<?=$_POST['name'];?>" class="form3">          </td>
          </tr>
        <tr>
          <td align="center"><LABEL for=""><b>File</b>&nbsp;</LABEL><br /><input type="text" name="file" value="<?=$_POST['file'];?>" class="form3">          </td>
          </tr>
        <tr>
          <td align="center"><LABEL for=""><b>Code Add-in</b>&nbsp;</LABEL><br /><input type="text" name="addin" value="<?=$_POST['addin'];?>" class="form3">          </td>
          </tr>
        <tr>
          <td align="center"><LABEL for=""><b>Header</b>&nbsp;</LABEL><br /><select class="form3" name="header_id" >
              <?php 
		$query = $db->execute("select `id`, `name`, `position` from `headers` order by `position` asc");

		while ($header =$query->fetchrow())
		{
        echo "<option value=\"" . $header['id'] . "\">" . $header['name'] . "</option>\n";
        }
		?>
            </select>          </td>
          </tr>
        <tr>
          <td align="center"><LABEL for=""><b>Position</b>&nbsp;</LABEL><br /><input type="text" name="position" value="<?=$_POST['position'];?>" class="form3">          </td>
          </tr>
        <tr>
          <td align="center"><input type="submit" name="link" value="Create Link" />          </td>
          </tr>
        </table>
      </form>
    </td>
  </tr>
  <tr>
    <td valign="top"><center><h2>Edit/Delete Headers</h2></center></td>
    <td valign="top"><center><h2>Edit/Delete Links</h2></center></td>
  </tr>
  <tr>
    <td valign="top"><table border="1" align="center" cellpadding="2" cellspacing="1"  rules="groups" frame="box" >
      <tr>
        <th>Header Name</th>
        <th>Position</th>
        <th>Update</th>
        <th>Delete</th>
      </tr>
      <?php
$query = $db->execute("select `id`, `name`, `position` from `headers` order by `position` asc");
$query2 = $db->execute("select `id`, `name`, `file`, `header_id`, `position`, `addin` from `links` order by `position` asc");

$bool = 1;
while($header = $query->fetchrow())
{
	echo "<form method=\"POST\" action=\"navigation.php\"><tr>\n";
	echo "<input type=\"hidden\" name=\"id\" value=\"" . $header['id'] . "\" /></td>\n";
	echo "<td align=\"center\"><input type=\"text\" name=\"name\" value=\"" . $header['name'] . "\" class=\"form1\"/></td>\n";
	echo "<td align=\"center\"><input type=\"text\" name=\"position\" value=\"" . $header['position'] . "\" class=\"form2\"/></td>\n";
	echo "<td align=\"center\"><input type=\"submit\" name=\"updateheader\" value=\"Update\" /></td>\n";
	echo "<td align=\"center\"><input type=\"submit\" name=\"deleteheader\" value=\"Delete\" /></td></tr></form>\n";

	$bool = ($bool==1)?2:1;
}
?>
    </table></td>
    <td valign="top"><table border="1" align="center" cellpadding="2" cellspacing="1"  rules="groups" frame="box" >
      <tr>
        <th><b>Link Name</b></th>
        <th><b>Position</b></th>
        <th><b>File Name</b></th>
        <th><b>Code Add-in</b></th>
        <th><b>Header</b></th>
        <th><b>Update</b></th>
        <th><b>Delete</b></th>
        
        </tr>
      <?php
//Select all members ordered by level (highest first, members table also doubles as rankings table)
$query = $db->execute("select `id`, `name`, `position` from `headers` order by `position` asc");
$query2 = $db->execute("select `id`, `name`, `file`, `header_id`, `position`, `addin` from `links` order by `header_id`, `position`");

$bool = 1;
while($link = $query2->fetchrow())
{
	echo "<form method=\"POST\" action=\"navigation.php\"><tr>\n";
	echo "<input type=\"hidden\" name=\"id\" value=\"" . $link['id'] . "\" /></td>\n";
	echo "<td align=\"center\"><input type=\"text\" name=\"name\" value=\"" . $link['name'] . "\" class=\"form1\"/></td>\n";
	echo "<td align=\"center\"><input type=\"text\" name=\"position\" value=\"" . $link['position'] . "\" class=\"form2\"/></td>\n";
	echo "<td align=\"center\"><input type=\"text\" name=\"file\" value=\"" . $link['file'] . "\" class=\"form1\"/></td>\n";
	echo "<td align=\"center\"><input type=\"text\" name=\"addin\" value=\"" . $link['addin'] . "\" class=\"form3\"/></td>\n";	
	echo "<td align=\"center\"><select class=\"form3\" name=\"header_id\" >";
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
	echo "<td align=\"center\"><input type=\"submit\" name=\"updatelink\" value=\"Update\" /></td>\n";
	echo "<td align=\"center\"><input type=\"submit\" name=\"deletelink\" value=\"Delete\" /></td></tr></form>\n";
	$bool = ($bool==1)?2:1;
}
?>
    </table></td>
  </tr>
</table>
<br />





<?php
include("./footer.php");
?>