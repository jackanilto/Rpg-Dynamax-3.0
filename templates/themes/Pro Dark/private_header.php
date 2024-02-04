<html>
<head>
<title><?=$config_name?>: <?=PAGENAME?></title>
<link rel="stylesheet" type="text/css" href="./templates/main.php" />
<script language="JavaScript" src="./lib/script.js">
</script>
</head>
<body>
<div id="wrapper">
<div id="top">
    	<div id="top-left">
   		</div>
    	<div id="top-right">
    	</div>
</div>
	<div id="header">
    <div id="header-logo">
    </div>
		<br />
		<?php insert_addins(1, $player, $setting, $lang, $db); ?>
	</div>
<?php require_once($current_wrap);?>
