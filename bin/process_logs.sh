#!/bin/bash
#Creates a TempDir inorder to do work
#saves the home dir to place the work

#loop statement, *. is a loop with $1 takes the target files, $f is the call back that is assigned Lis.
#for f in *.$1
#do
#Lis=$(basename "$f" .tgz)
#mkdir TempDir/$Ldis
#tar -xzf $f -C TempDir/$Lis
#bin/process_client_logs.sh TempDir/$Lis
#done

#bin/create_username_dist.sh TempDir
#bin/create_hours_dist.sh TempDir
#bin/create_country_dist.sh TempDir
#bin/assemble_report.sh TempDir
#mv failed_login_summary.html $home
#rm -rf ThisDir


mkdir Temp

for f in "$@"
do
	tarDir=$(basename "$f" .tgz)
	mkdir Temp/$tarDir
	tar -xzf $f -C Temp/$tarDir
	bin/process_client_logs.sh Temp/$tarDir
done

bin/create_username_dist.sh Temp

bin/create_hours_dist.sh Temp

bin/create_country_dist.sh Temp

bin/assemble_report.sh Temp

here=$(pwd)

mv Temp/failed_login_summary.html $here

rm -rf Temp
