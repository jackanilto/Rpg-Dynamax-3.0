<?php
/*************************************/
/*           ezRPG script            */
/*          Written by Zen           */
/*    http://www.krunthi.com/game    */
/*    http://www.ezrpgproject.com/   */
/*************************************/
/*       Modified for X-Panel        */
/*************************************/

include("../lib.php");
define("PAGENAME", "Monster Register");
include("panel_lib.php");
//$player = check_user($secret_key, $db);

echo'<table width="800"><tr><td>';

if ($player->access < 100)
{
//include("templates/private_header.php");
echo "Admin Access Only!" ;
//include("templates/private_footer.php");
exit;
}

$msg1 = "<font color=\"red\">"; //Username error?
$error = 0;

if ($_POST['register'])
{
	//Check if username has already been used
	$query = $db->execute("select `id` from `monsters` where `username`=?", array($_POST['username']));
	//Check username
	if (!$_POST['username']) { //If username isn't filled in...
		$msg1 .= "You need to fill in a username!<br />\n"; //Add to error message
		$error = 1; //Set error check
	}
	else if (strlen($_POST['username']) < 3)
	{ //If username is too short...
		$msg1 .= "Your username must be longer than 3 characters!<br />\n"; //Add to error message
		$error = 1; //Set error check
	}
	else if ($query->recordcount() > 0)
	{
		$msg1 .= "That name has already been used.<br />\n";
		$error = 1; //Set error check
	}
}
	
	
	if ($error == 0)
	{
		$insert['username'] = $_POST['username'];
		$insert['level'] = ($_POST['level']);
		$insert['image_path'] = ($_POST['image']);
		$insert['strength'] = ($_POST['strength']);
		$insert['vitality'] = ($_POST['vitality']);
		$insert['agility'] = ($_POST['agility']);
		$insert['hp'] = ($_POST['hp']);
		$insert['gold'] = ($_POST['gold']);
		$query = $db->autoexecute('monsters', $insert, 'INSERT');
		
		
		if (!$query)
		{
			$could_not_register = "";
		}
		else
		{
			$insertid = $db->Insert_ID();
			
			//include("templates/header.php");
			echo "Congratulations! You have successfully registered a new monster!<br />";
			echo "<a href=\"register_monster.php\">GoBack</a>";
			//include("templates/footer.php");
			exit;
		}
	}

$msg1 .= "</font>"; //Username error

//include("templates/header.php");

?>

<?=$could_not_register?>
<style type="text/css">
<!--
.style1 {color: #555500}
.style2 {color: #FF0000}
-->
</style>

<form method="POST" action="register_monster.php">
<table width="100%">
<tr><td width="40%"><span class="style1"><b>Monster Name</b>:</span></td>
<td><input name="username" type="text" value="<?=$_POST['username'];?>" /></td>
</tr>
<tr><td colspan="2"><span class="style1">Enter the monster's name.<br />
      <?=$msg1;?>
      <br />
</span></td>
</tr>

<tr><td width="40%"><span class="style1"><b>Image</b>:</span></td>
<td><input name="image" type="text" value="<?=$_POST['image'];?>" /></td>
</tr>
<tr><td colspan="2"><span class="style1">Type in your desired image (default.jpg, small.jpg, big.jpg). You can upload more images into images/monsters folder.<br />
      <br />
</span></td>
</tr>

<tr><td width="40%"><span class="style1"><b>Level</b>:</span></td>
<td><input name="level" type="level" value="<?=$_POST['level'];?>" /></td>
</tr>
<tr><td colspan="2"><span class="style1">Type in your desired level.<br />
      <br />
</span></td>
</tr>

<tr><td width="40%"><span class="style1"><b>Strength</b>:</span></td>
<td><input name="strength" type="strength" value="<?=$_POST['strength'];?>" /></td>
</tr>
<tr><td colspan="2"><span class="style1">Type in your desired strength.<br />
      <br />
</span></td>
</tr>

<tr><td width="40%"><span class="style1"><b>Vitality</b>:</span></td>
<td><input name="vitality" type="vitality" value="<?=$_POST['vitality'];?>" /></td>
</tr>
<tr><td colspan="2"><span class="style1">Type in your desired vitality.<br />
      <br />
</span></td>
</tr>

<tr><td width="40%"><span class="style1"><b>Agility</b>:</span></td>
<td><input name="agility" type="agility" value="<?=$_POST['agility'];?>" /></td>
</tr>
<tr><td colspan="2"><span class="style1">Type in your desired agility.<br />
      <br />
</span></td>
</tr>

<tr><td width="40%"><span class="style1"><b>HP</b>:</span></td>
<td><input name="hp" type="hp" value="<?=$_POST['hp'];?>" /></td>
</tr>
<tr><td colspan="2"><span class="style1">Type in your desired hp.<br />
      <br />
</span></td>
</tr>

<tr><td width="40%"><span class="style1"><b>Gold</b>:</span></td>
<td><input name="gold" type="gold" value="<?=$_POST['gold'];?>" /></td>
</tr>
<tr><td colspan="2"><span class="style1">Type in your desired gold.<br />
      <br />
</span></td>
</tr>

<tr>
  <td colspan="2" align="center"><span class="style2">Register it!</span><br />
    <input type="submit" name="register" value="Register!"></td>
</tr>
</table>
</form>


<?php
//include("templates/footer.php");
echo'</td><td width=50>';
echo'</td><td width=300 valign=top>';


echo"<form action='$_PHP_SELF?action=createdefault' method='post'>";
echo'<input type="submit" value="create a few example monsters" /></form>';
if($_GET['action']=='createdefault')
{
$xlazy_externalmode=1;
include'lazymod/lazyblueprints.php';
addSimpleMonsterBlueprint('Small monster','small.jpg',1);
addSimpleMonsterBlueprint('Average monster','default.jpg',3);
addSimpleMonsterBlueprint('Big monster','big.jpg',5);
addSimpleMonsterBlueprint('Scary big monster','big.jpg',10);
addSimpleMonsterBlueprint('Boss','big.jpg',25);
echo("Example monsters created.");
}

echo"<form action='$_PHP_SELF?action=clear' method='post'>";
echo'<input type="submit" value="delete ALL monsters" /></form>';
if($_GET['action']=='clear')
{
$xlazy_externalmode=1;
include'lazymod/lazyblueprints.php';
deleteAllMonsterBlueprints();
echo("All monsters deleted.");
}

echo"Note: not all monsters will be visible on the battle page (depends on your level)<br>";
echo'</td></tr></table>';
modInfo("Register monster (by Zen)",2);
?>