<?php
$config_server = "localhost"; //Database host
$config_database = "thedudes_new"; //Database name
$config_username = "thedudes_loki"; //Database username
$config_password = "usuckdic"; //Database password
$secret_key = "mysecret"; //Secret key, make it a random word/sentence/whatever

//Do not edit below this line

include('../lib/adodb/adodb.inc.php'); //Include adodb files
$db = &ADONewConnection('mysql'); //Connect to database
$db->Connect($config_server, $config_username, $config_password, $config_database); //Select table

$db->SetFetchMode(ADODB_FETCH_ASSOC); //Fetch associative arrays
$ADODB_FETCH_MODE = ADODB_FETCH_ASSOC; //Fetch associative arrays
//$db->debug = true; //Debug

$query = $db->execute("update `players` set energy = IF((energy + 1)>maxenergy, maxenergy, (energy + 1))");
?>