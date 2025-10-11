<?php
/*************************************/
/*           ezRPG script            */
/*         Written by Zeggy          */
/*************************************/
require_once("lib.php");

// Garante UTF-8
if (!headers_sent()) {
    header('Content-Type: text/html; charset=utf-8');
}


define("PAGENAME", $lang['page_stats']);
$player = check_user($secret_key, $db);

if ($player->stat_points > 0) {
    switch($_GET['act']) {
        case '0':
            $db->execute("UPDATE `players` SET `stat_points`=?, `strength`=? WHERE `id`=?", 
                array($player->stat_points - 1, $player->strength + 1, $player->id));
            $player = check_user($secret_key, $db);
            $msg = "<b>" . sprintf($lang['msg_trained_str'], $player->strength) . "</b><br /><br />";
            break;

        case '1':
            $db->execute("UPDATE `players` SET `stat_points`=?, `vitality`=?, `maxhp`=? WHERE `id`=?", 
                array($player->stat_points - 1, $player->vitality + 1, $player->maxhp + 20, $player->id));
            $player = check_user($secret_key, $db);
            $msg = "<b>" . sprintf($lang['msg_trained_vit'], $player->vitality) . "</b><br /><br />";
            break;

        case '2':
            $db->execute("UPDATE `players` SET `stat_points`=?, `agility`=? WHERE `id`=?", 
                array($player->stat_points - 1, $player->agility + 1, $player->id));
            $player = check_user($secret_key, $db);
            $msg = "<b>" . sprintf($lang['msg_trained_agi'], $player->agility) . "</b><br /><br />";
            break;
    }
}

require_once("templates/themes/" . $setting->theme . "/private_header.php");
echo $msg;
?>

<style>
.stats-container {
    width: 400px;
    margin: 20px auto;
    background: #f4f6f8;
    border-radius: 10px;
    box-shadow: 0 3px 6px rgba(0,0,0,0.15);
    padding: 20px;
    font-family: Arial, sans-serif;
}
.stats-container h3 {
    text-align: center;
    margin-bottom: 15px;
    color: #333;
}
.stat-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #fff;
    margin: 8px 0;
    padding: 10px 12px;
    border-radius: 8px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}
.stat-name {
    flex: 1;
    font-weight: bold;
    color: #2c3e50;
}
.stat-value {
    margin-left: 10px;
    color: #555;
}
.plus-button {
    background: #2ecc71;
    border: none;
    color: white;
    font-size: 16px;
    font-weight: bold;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    cursor: pointer;
    transition: 0.2s;
}
.plus-button:hover {
    background: #27ae60;
    transform: scale(1.1);
}
.points-remaining {
    text-align: center;
    font-weight: bold;
    margin-bottom: 10px;
    color: #34495e;
}
</style>

<div class="stats-container">
    <h3>⚡ Distribuir Pontos</h3>

    <?php if ($player->stat_points == 0) { ?>
        <div class="points-remaining"><?=$lang['error_no_statpoints2']?></div>
    <?php } else { ?>
        <div class="points-remaining">
            <?=sprintf($lang['msg_stats_greeting'], $player->stat_points)?>
        </div>

        <div class="stat-row">
            <form method="get" action="stat_points.php" style="margin:5;">
                <input type="hidden" name="act" value="0">
                <button type="submit" class="plus-button">+</button>
            </form>
            <div class="stat-name"><?=$lang['keyword_strength']?></div>
            <div class="stat-value">Total: <?=$player->strength?></div>
        </div>

        <div class="stat-row">
            <form method="get" action="stat_points.php" style="margin:5;">
                <input type="hidden" name="act" value="1">
                <button type="submit" class="plus-button">+</button>
            </form>
            <div class="stat-name"><?=$lang['keyword_vitality']?></div>
            <div class="stat-value">Total: <?=$player->vitality?></div>
        </div>

        <div class="stat-row">
            <form method="get" action="stat_points.php" style="margin:5;">
                <input type="hidden" name="act" value="2">
                <button type="submit" class="plus-button">+</button>   
            </form>
            <div class="stat-name"><?=$lang['keyword_agility']?></div>
            <div class="stat-value">Total: <?=$player->agility?></div>
        </div>
        
                <?php if (!empty($msg)): ?>
            <div class="stat-msg">
                <center><?=$msg?></center>
            </div>
            <?php endif; ?>
        
        
        
    <?php } ?>
</div>

<?php
require_once("templates/themes/" . $setting->theme . "/private_footer.php");
?>
