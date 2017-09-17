#!/bin/bash
#Creates a TempDir inorder to do work
mkdir TempDir
#saves the home dir to place the work
home=$(pwd)

#loop statement, *. is a loop with $1 takes the target files, $f is the call back that is assigned Lis.
for f in *.$1
do
Lis=$(basename "$f" .tgz)
mkdir TempDir/$Ldis
tar -xzf $f -C TempDir/$Lis
bin/process_client_logs.sh TempDir/$Lis
done

bin/create_username_dist.sh TempDir
bin/create_hours_dist.sh TempDir
bin/create_country_dist.sh TempDir
bin/assemble_report.sh TempDir

mv failed_login_summary.html $home

rm -rf TempDir
