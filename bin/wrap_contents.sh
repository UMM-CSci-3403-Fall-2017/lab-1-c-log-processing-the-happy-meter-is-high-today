#!/bin/bash

#Wrap_Contetns takes in a Filename, Header/Footer and pushed out an file. This "wraps" the header and footer around the mainbody of text, in this case the FileName.

FileName=$1
HeadorFoot=$2
FileOutPut=$3


cat ${HeadorFoot}_header.html $FileName ${HeadorFoot}_footer.html >> $FileOutPut
