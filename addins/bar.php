<div id="addin">
	<div id="addin-top-left">
	</div>
	<div id="addin-top-right">
	</div>
      <center><img src="./images/avatars/<?=$player->avatar?>" width="80" height="80" /></center>
	  <b><?=$lang['keyword_username']?>:</b> <?=$player->username?><br />
	  <b><?=$lang['keyword_level']?>:</b> <?=$player->level?><br />
<div id="exp_bar">
	<div id="exp_font">
	  <b><?=$lang['keyword_exp']?>:</b> <?=$player->exp?>/<?=$player->maxexp?>
	  <div id="exp_bar2" style="width:<?=($player->exp/$player->maxexp)*100?>%;">
	  </div>
	</div>
</div>
<div id="hp_bar">
	<div id="hp_font">
	  <b><?=$lang['keyword_hp']?>:</b> <?=$player->hp?>/<?=$player->maxhp?> 
		<div id="hp_bar2" style="width:<?=($player->hp/$player->maxhp)*100?>%;">
		</div>
	</div>
</div>
<div id="energy_bar">
	<div id="energy_font">
	  <b><?=$lang['keyword_energy']?>:</b> <?=$player->energy?>/<?=$player->maxenergy?> 
		<div id="energy_bar2" style="width:<?=($player->energy/$player->maxenergy)*100?>%;">
		</div>
	</div>
</div>
<b><?=$lang['keyword_gold']?>:</b> <?=$player->gold?><br />
	<div id="addin-bottom-left">
	</div>
	<div id="addin-bottom-right">
	</div>
</div>