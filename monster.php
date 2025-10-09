<?php
/*************************************/
/*           ezRPG script            */
/*         Written by Zeggy          */
/*    http://www.ezrpgproject.com    */
/*************************************/
require_once("lib.php");
define("PAGENAME", $lang['page_members']);
$player = check_user($secret_key, $db);

require_once("templates/themes/" . $setting->theme . "/private_header.php");

//Start of Pagination
$limit = 30; // Amount per page
$page_max = 10; // max pages shown
$page = (intval($_GET['p']) == 0)?1:intval($_GET['p']);
$begin = ($limit * $page) - $limit;

$total_players = $db->getone("SELECT COUNT(id) AS `count` FROM `monsters`");
$numpages = ceil($total_players / $limit);

echo '<div class="pagination">';
//Previous link
echo ($page > 1 && $numpages > 1) ? "<a href=\"monster.php?p=" . ($page-1) . "\">&#9668;</a> " : "";

//Display page numbers
if ($numpages != 1) {
    if ($numpages <= $page_max){
        for ($i = 1; $i <= $numpages; $i++) {
            echo ($i == $page) ? "<span class=\"current\">" . $i . "</span> " : "<a href=\"monster.php?p=" . $i . "\">" . $i . "</a> ";
        }
    } else {
        if ($page <= 4) {
            for ($i = 1; $i <= 5; $i++) {
                echo ($i == $page) ? "<span class=\"current\">$i</span> " : "<a href=\"monster.php?p=$i\">$i</a> ";
            }
            echo '... ';
            echo "<a href=\"monster.php?p=" . ($numpages - 1) . "\">" . ($numpages - 1) . "</a> ";
            echo "<a href=\"monster.php?p=$numpages\">$numpages</a> ";
        } elseif ($page >= ($numpages - 3)) {
            echo '<a href="monster.php?p=1">1</a> ';
            echo '<a href="monster.php?p=2">2</a> ... ';
            for ($i = $numpages-4; $i <= $numpages; $i++) {
                echo ($i == $page) ? "<span class=\"current\">$i</span> " : "<a href=\"monster.php?p=$i\">$i</a> ";
            }
        } else {
            echo '<a href="monster.php?p=1">1</a> ';
            echo '<a href="monster.php?p=2">2</a> ... ';
            for ($i = $page-1; $i <= $page+1; $i++) {
                echo ($i == $page) ? "<span class=\"current\">$i</span> " : "<a href=\"monster.php?p=$i\">$i</a> ";
            }
            echo '... ';
            echo "<a href=\"monster.php?p=" . ($numpages-1) . "\">" . ($numpages-1) . "</a> ";
            echo "<a href=\"monster.php?p=$numpages\">$numpages</a> ";
        }
    }
}

//Next link
echo ($page != $numpages && $numpages > 1) ? "<a href=\"monster.php?p=" . ($page+1) . "\">&#9658;</a> " : "";
echo '</div>';

echo "<table id=\"forum-list-b\"><tr><td><b>" . $lang['keyword_total'] . " " . $lang['keyword_members'] . "</b>: " . $total_players . "</td></tr></table><br />";

?>

<table id="forum-list">
<tr>
<th align="left" width="20%"><b>Imagem</b></th>
<th align="left" width="40%"><b><?=$lang['keyword_username']?></b></th>
<th align="left" width="20%"><b><?=$lang['keyword_level']?></b></th>
<th align="left" width="20%"><b><?=$lang['keyword_actions']?></b></th>
</tr>

<?php
//Select all monsters with their image_path
$query = $db->execute(
    "SELECT `id`, `username`, `level`, `image_path` FROM `monsters` ORDER BY `level` ASC LIMIT ?, ?", 
    array($begin, $limit)
);

while($monster = $query->fetchrow()) {
    echo "<tr>\n";
    // Show image
    $img = $monster['image_path'] ? $monster['image_path'] : 'images/monsters/default.png'; // imagem padrão se não existir
    echo "<td><img src='" . htmlspecialchars($img) . "' alt='" . htmlspecialchars($monster['username']) . "' style='width:100px; height:auto;'></td>\n";

    echo "<td><a href=\"profile.php?id=" . $monster['username'] . "\">";
    echo ($monster['username'] == $player->username) ? "<b>" : "";
    echo $monster['username'];
    echo ($monster['username'] == $player->username) ? "</b>" : "";
    echo "</a></td>\n";

    echo "<td>" . $monster['level'] . "</td>\n";

    echo "<td><a href=\"battlem.php?act=attack&username=" . $monster['username'] . "\">";
echo "<img src='images/icones/atacar.jpg' alt='" . $lang['keyword_attack'] . "' style='width:50px; height:auto; display:block; margin:0 auto;'>";
echo "</a></td>\n";
    echo "</tr>\n";
}
?>
</table>

<?php
require_once("templates/themes/" . $setting->theme . "/private_footer.php");
?>
