<?php
// Flips a coin by getting either 0 or 1, rand function gets random number, round function makes it one or the other
$rand_num = rand(0,1);
$rand_num = round($rand_num, PHP_ROUND_HALF_UP);
echo $rand_num;

?>