#!/bin/bash

#Since this dosen't have to move anywhere in the directory its pretty stright forward.

#Looking for a file called "failed_login_data.txt" from a list thats in the current directory
cat $(find $1 -type f| grep "failed_login_data.txt")|
#Prins the #nth from the begining
awk '{print $4}'|
#Sortig the data and filering the results into an uniq
sort | uniq -c |
#Take the filter from all the aove and prints out a new line everytime, into a temp.txt 
awk '{print "data.addRow([\x27"$2"\x27, " $1"]);";}' > temp.txt

./bin/wrap_contents.sh temp.txt html_components/username_dist $1/username_dist.html

#Cleaning to be nice
rm temp.txt
