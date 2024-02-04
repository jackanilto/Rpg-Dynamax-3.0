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
		<div id="header-text">
			<?=$config_name?>
		</div>
	</div>
<?php insert_addins(1, $player, $setting, $lang, $db);?>
<?php require_once($current_wrap);?>
