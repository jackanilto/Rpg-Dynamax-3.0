<?php 
header("Content-type: text/css");
include("../lib.php"); 
?>
@import url('../templates/layouts/width/<?=$setting->width?>.css');
@import url('../templates/layouts/<?=$setting->layout?>');
@import url('../templates/themes/<?=$setting->theme?>/style.css');
