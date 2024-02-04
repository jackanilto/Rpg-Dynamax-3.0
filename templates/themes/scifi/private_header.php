<html>
<head>
<title><?=$config_name?>: <?=PAGENAME?></title>
<link rel="stylesheet" type="text/css" href="./templates/main.php" />
<script language="JavaScript" src="./lib/script.js">
</script>
</head>
<body>
<div id="wrapper">
	<div id="header">
		<h1><center><?=$config_name?></center></h1><br />
		<?php insert_addins(1, $player, $setting, $lang, $db); ?>
	</div>
<?php require_once($current_wrap);?>



