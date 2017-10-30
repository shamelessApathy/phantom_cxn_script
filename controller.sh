#!/bin/bash
coin_toss="$(php /var/www/phantom_cxn_script/coin_toss.php)"
echo "Tossing Coin"
echo $coin_toss



if  [ $coin_toss = 0 ]
	then phantomjs casper_starbucks.js
fi
if  [ $coin_toss = 1 ]
	then phantomjs casper_mcdonalds.js
fi