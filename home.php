<?php
require_once("lib.php");
define("PAGENAME", $lang['page_home']);
$player = check_user($secret_key, $db);

// Garante UTF-8
if (!headers_sent()) {
    header('Content-Type: text/html; charset=utf-8');
}

require_once("templates/themes/" . $setting->theme . "/private_header.php");
?>

<style>
/* ======== ESTILO GERAL ======== */
.profile-container{
    display:flex;
    justify-content:space-between;
    align-items:flex-start;
    gap:20px;
    padding:20px;
    max-width:900px;
    margin:30px auto;
    font-family:Arial, sans-serif;
}

.card{
    background:#f8f8f8;
    border-radius:10px;
    box-shadow:0 2px 6px rgba(0,0,0,0.15);
    padding:20px;
    flex:1;
    transition:transform .2s;
}
.card:hover{transform:scale(1.02);}

.xp-bar-container{
    background:#ddd;
    border-radius:8px;
    height:18px;
    margin-top:5px;
    overflow:hidden;
    width:100%;
}
.xp-bar{
    background:linear-gradient(90deg,#27ae60,#2ecc71);
    height:100%;
    text-align:center;
    color:#fff;
    font-size:12px;
    line-height:18px;
    font-weight:bold;
}

.stats-summary{
    text-align:center;
    margin:30px auto;
    background:#eef3f7;
    padding:20px;
    border-radius:10px;
    width:70%;
    box-shadow:0 1px 4px rgba(0,0,0,0.1);
    font-weight:bold;
    color:#34495e;
}

.gold{color:#f1c40f;font-weight:bold;}
.stat-name{width:130px;display:inline-block;}

/* ======== BOTÃO ESTILIZADO ======== */
.btn-spend{
    background:linear-gradient(90deg,#3498db,#2980b9);
    color:#fff;
    padding:12px 30px;
    border:none;
    border-radius:8px;
    font-size:15px;
    cursor:pointer;
    transition:all 0.3s ease;
    box-shadow:0 3px 6px rgba(0,0,0,0.2);
    text-decoration:none;
    display:inline-block;
    margin-top:10px;
}
.btn-spend:hover{
    background:linear-gradient(90deg,#2980b9,#1c6ea4);
    transform:translateY(-2px);
    box-shadow:0 5px 10px rgba(0,0,0,0.25);
}
</style>

<div class="profile-container">
    <div class="card">
        <h3>&#128100; Informações</h3> <!-- 👤 -->
        <b><?=$lang['keyword_username']?>:</b> <?=$player->username?><br />
        <b><?=$lang['keyword_email']?>:</b> <?=$player->email?><br />
        <b><?=$lang['keyword_registered']?>:</b> <?=date("d/m/Y H:i", $player->registered)?><br />
        <?php $diff = time() - $player->registered; $age = intval(($diff / 3600) / 24); ?>
        <b><?=$lang['keyword_age']?>:</b> <?=$age?> <?=$lang['keyword_days']?><br />
        <b><?=$lang['keyword_kills']?>/<?=$lang['keyword_deaths']?>:</b> <?=$player->kills?>/<?=$player->deaths?><br />
    </div>

    <div class="card">
        <h3>&#9876; Status</h3> <!-- ⚔ -->
        <b><?=$lang['keyword_level']?>:</b> <?=$player->level?><br />
        <?php $percent = intval(($player->exp / $player->maxexp) * 100); ?>
        <b><?=$lang['keyword_exp']?>:</b> <?=$player->exp?> / <?=$player->maxexp?> (<?=$percent?>%)<br />
        <div class="xp-bar-container"><div class="xp-bar" style="width:<?=$percent?>%;"><?=$percent?>%</div></div>
        <br />
        <b><?=$lang['keyword_hp']?>:</b> <?=$player->hp?> / <?=$player->maxhp?><br />
        <b><?=$lang['keyword_energy']?>:</b> <?=$player->energy?> / <?=$player->maxenergy?><br />
        <b><?=$lang['keyword_gold']?>:</b> <span class="gold"><?=$player->gold?></span><br /><br />
        <h3>💪 Atributos</h3>
        <span class="stat-name"><?=$lang['keyword_strength']?>:</span> <?=$player->strength?><br />
        <span class="stat-name"><?=$lang['keyword_vitality']?>:</span> <?=$player->vitality?><br />
        <span class="stat-name"><?=$lang['keyword_agility']?>:</span> <?=$player->agility?><br />
    </div>
</div>

<div class="stats-summary">
<?php
if ($player->stat_points > 0) {
    echo sprintf($lang['msg_stats_greeting'], $player->stat_points);
    echo "<br><a href='stat_points.php' class='btn-spend'>⚡ Gastar Pontos Agora</a>";
} else {
    echo $lang['error_no_statpoints'];
}
?>
</div>

<?php
require_once("templates/themes/" . $setting->theme . "/private_footer.php");
?>
