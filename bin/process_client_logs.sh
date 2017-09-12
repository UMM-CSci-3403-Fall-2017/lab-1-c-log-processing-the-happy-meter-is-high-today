#!/bin/bash

# After trying to use regex to find the correct wording I found that useing a PIPE command
# that gethers all of the files that contain "Failed password" by useing the -r which is recursice
# In order to simplify the line and make it more readable Home is given an diar.
Home=$1

#awk takes an condition in this case an if statement and prints off a then nth nubmers that corrospond to the number following the $, and to get just the hour this case is handled with a substr.
grep -rh "Failed password" $Home |
	awk '{if (($9 == "invalid") && ($6== "Failed"))
		print $1, $2, substr($3,0,2), $11, $13; 
	else 
		print $1, $2, substr($3,0,2), $9, $11}'| 
	cat > $Home/failed_login_data.txt

#This is more simply then what I was trying to do before, also this takes care of both cases.
