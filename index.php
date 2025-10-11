<?php
/*************************************/
/*           ezRPG script            */
/*         Written by Zeggy          */
/*    http://www.ezrpgproject.com    */
/*************************************/
require_once("lib.php");
define("PAGENAME", $lang['page_index']);

$error = 0;
$errormsg = "";
if ($_POST['login']) {
    $banquery = $db->execute("select `ban` from `players` where `username`=?", array($_POST['username']));
    $banned = $banquery->fetchrow();
    if ($_POST['username'] == "") {
        $errormsg = $lang['error_enter_username'];
        $error = 1;
    }
    else if ($banned['ban'] >= time()) {
        $errormsg = $lang['error_banned_username'];
        $error = 1;
    }
    else if ($_POST['password'] == "") {
        $errormsg = $lang['error_enter_password'];
        $error = 1;
    }
    else if ($error == 0) {
        $query = $db->execute("select `id`, `username`, `gm_rank` from `players` where `username`=? and `password`=?", array($_POST['username'], sha1($_POST['password'])));
        if ($query->recordcount() == 0) {
            $errormsg = $lang['error_login'];
            $error = 1;    
            session_unset();
            session_destroy();    
            if ($setting->index_log_error == "yes") {
                $logmsg = "IP " . $ip . " attempted to login with username " . $_POST['username'] . ".";
                errorlog($logmsg, $db);
            }
        } else {
            if ($setting->index_log_ip == "yes") {
                $query2 = $db->execute("select `username` from `players` where `ip`=? or `last_ip`=?", array($ip, $ip));
                if ($query2->recordcount() > 0) {
                    $multis = "The following users are playing with the same IP (" . $ip . "): <br />";
                    while ($multi = $query2->fetchrow()) {
                        $multis .= "<a href=\"users.php?id=" . $multi['username'] . "\">" . $multi['username'] . "</a> | ";
                    }
                    gmlog($multis, $db);
                }
            }                            
            $player = $query->fetchrow();
            if ($setting->general_close_game == "yes" && $player['gm_rank'] <= 20) {
                $errormsg = $lang['error_game_closed'];
                $error = 1;
            } else {
                $query = $db->execute("update `players` set `last_active`=?, `last_ip`=? where `id`=?", array(time(), $ip, $player['id']));
                $hash = sha1($player['id'] . $ip . $secret_key);
                $_SESSION['userid'] = $player['id'];
                $_SESSION['hash'] = $hash;
                header("Location: home.php");
            }
        }
    }
}
require_once("templates/themes/" . $setting->theme . "/header.php");
?>

<style>
    body {
        background: radial-gradient(circle at center, #2a2a2a 0%, #111 100%);
        color: #f5f5f5;
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        padding: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 40px;
    }

    td {
        vertical-align: top;
        padding: 20px;
    }

    .welcome-box {
        background: rgba(255, 255, 255, 0.07);
        border-radius: 10px;
        padding: 30px;
        box-shadow: 0 0 15px rgba(0,0,0,0.3);
        text-align: center;
    }

    .welcome-box h1 {
        color: #00d4ff;
        font-size: 28px;
        margin-bottom: 10px;
    }

    .welcome-box p {
        color: #ddd;
        font-size: 16px;
        line-height: 1.6;
    }

    fieldset {
        border: none;
        background: rgba(255,255,255,0.08);
        border-radius: 10px;
        padding: 25px;
        box-shadow: 0 0 15px rgba(0,0,0,0.4);
    }

    legend {
        color: #00d4ff;
        font-weight: bold;
        font-size: 18px;
        text-align: center;
        padding: 0 8px;
    }

    input[type="text"],
    input[type="password"] {
        width: 95%;
        padding: 8px;
        margin: 6px 0;
        background: #333;
        border: none;
        border-radius: 5px;
        color: #fff;
        font-size: 14px;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        border: none;
        background: linear-gradient(90deg, #00d4ff, #0077ff);
        color: #fff;
        font-weight: bold;
        border-radius: 6px;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    input[type="submit"]:hover {
        transform: scale(1.05);
        background: linear-gradient(90deg, #00aaff, #0055ff);
    }

    a {
        color: #00d4ff;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }

    .error {
        color: #ff6b6b;
        font-weight: bold;
        text-align: center;
        margin-bottom: 10px;
    }
</style>

<table>
<tr>
<td width="60%">
    <div class="welcome-box">
        <h1>🌌 Bem-vindo(a) ao <?=$config_name?>!</h1>
        <p>
            Prepare-se para uma jornada de batalhas, conquistas e glória!<br><br>
            Faça login para continuar sua aventura ou <a href="register.php">registre-se agora</a> e torne-se uma lenda!<br><br>
            <i>Edite <b>index.php</b> para personalizar esta mensagem e apresentar o seu jogo.</i>
        </p>
    </div>
</td>

<td width="40%">
    <fieldset>
        <legend><?=$lang['keyword_login']?></legend>
        <?php if ($error == 1): ?>
            <div class="error"><?=$errormsg?></div>
        <?php endif; ?>
        <form method="POST" action="index.php">
            <?=$lang['keyword_username']?>:<br>
            <input type="text" name="username" value="<?=$_POST['username']?>" /><br />
            <?=$lang['keyword_password']?>:<br>
            <input type="password" name="password" /><br />
            <input name="login" type="submit" value="<?=$lang['keyword_login']?>!" />
        </form>
    </fieldset>
</td>
</tr>
</table>

<?php
require_once("templates/themes/" . $setting->theme . "/footer.php");
?>
