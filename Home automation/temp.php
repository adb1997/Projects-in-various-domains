<?php

$value = $_GET['temp'];

$myfile = fopen("temp.txt", 'w') or die("Unable to open file!");

fwrite($myfile, $value);

fclose($myfile)
?>

