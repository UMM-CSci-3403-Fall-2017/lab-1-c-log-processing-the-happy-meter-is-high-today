#!/bin/bash

#Creates a IP_Add.txt in the home dir where this function is called. Pulls the IP addres from the file c called "failed_login_data.txt".
cat $(find $1 -type f | grep "failed_login_data.txt") | awk '{print $5}' | sort > IP_Add.txt

#This joins two files that has a common field, in this case the IP_Add to the US
join IP_Add.txt etc/country_IP_map.txt > IP_Add1.txt

#Tried to pipe this into one function but was not happy.
awk '{print $2}' IP_Add1.txt | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > SortCon.txt

rm IP_Add.txt IP_Add1.txt

./bin/wrap_contents.sh SortCon.txt html_components/country_dist $1/country_dist.html
