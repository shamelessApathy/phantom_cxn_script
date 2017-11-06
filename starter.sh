#!/bin/bash
echo "This is the starter script for phantom cxn"
sleep 1

echo "searching through iwlist wlan0 scan for ESSIDs that match"
#iwlist wlan0 scan | grep "DZV"

# This prints partial essids
#iwlist wlan0 scanning | awk -F '[ :=]+' '/(ESS|Freq|Qual)/{ printf $3" "}
#/Encr/{ print $4 }'


#Tim's solution
#local IFS="\n"
#read -a ARRAY <<< $(iwlist wlan0 scan)
#for X in ${ARRAY[@]}; do
#echo $X | awk 'print $1 '
#done

# Works but doesn't include the spaces
#iw wlan0 scan | awk -f wifi.awk

#This is the best one so far, captures spaces
#iwlist scan | awk 'BEGIN{ FS=":" }
#/ESSID/{ essid[e++]=$2 }
#/Address/{
# gsub(/.*Address: /,"") 
# addr[d++]=$0
#}
#END{
# for (a in addr){   print addr[a]  }
# for (h in essid){  print essid[h] }
#}
#'

# Trying same thing but manipulating array indices
iwlist wlan0 scan | awk 'BEGIN{ FS=":" }
/ESSID/{ essid[e++]=$2 }
/Address/{
 gsub(/.*Address: /,"") 
 addr[d++]=$0
}
END{
 for (a in addr){   print addr[a]  }
 for (h in essid)
	{  
		print essid[h]
		STUFF=essid[h]
		if [ "$STUFF" == *"DZV on air"* ]
	    then
			print "We have a match"
			print essid[h]
	    fi
	}
}
'
