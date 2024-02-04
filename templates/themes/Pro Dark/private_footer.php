<?php if ($layout['sidebar1'] == 1) {
	require_once($current_sid1);
	insert_addins(2, $player, $setting, $lang, $db);}?>
<?php if ($layout['sidebar2'] == 1){
	require_once($current_sid2);
	insert_addins(3, $player, $setting, $lang, $db); }?>
<?php require_once($current_close);?>
<div id="footer">
<div id="bottom">
    <div id="bottom-left">
   	</div>
    <div id="bottom-right">
    </div>
</div>
	<div id="footer-text">Copyright (c) 2008, <a href="http://www.ezrpgproject.com/">ezRPG Project</a></div>
	</div>
</div>
</div>
</body>
</html>