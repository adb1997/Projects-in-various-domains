<?php

$msg = $_GET['device2'];

echo $msg;
$myfile = fopen("room2.txt", 'w') or die("Unable to open file!");
fwrite($myfile, $msg);
fclose($myfile)
?>

