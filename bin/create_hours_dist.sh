#!/bin/bash

#!/bin/bash

#Since this dosen't have to move anywhere in the directory its pretty stright forward.


cat $(find $1 -type f| grep "failed_login_data.txt")|
#Looking for a file
#cat "failed_login_data.txt"|
#Prins the #nth from the begining
awk '{print $3}'|
#Sortig the data and filering the results into an uniq
sort | uniq -c |
#Take the filter from all the aove and prints out a new line everytime, into a temp.txt 
awk '{print "data.addRow([\x27"$2"\x27, " $1"]);";}' > temp.txt

./bin/wrap_contents.sh temp.txt html_components/hours_dist $1/hours_dist.html

#Cleaning to be nice
rm temp.txt
