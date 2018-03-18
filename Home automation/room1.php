<?php

$msg = $_GET['device1'];

echo $msg;
$myfile = fopen("room1.txt", 'w') or die("Unable to open file!");
fwrite($myfile, $msg);
fclose($myfile)
?>

