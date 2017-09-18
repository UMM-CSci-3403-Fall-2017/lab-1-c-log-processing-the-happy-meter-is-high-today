#!/bin/bash
#Creates a TempDir inorder to do work
mkdir stemp
#Tried to used *.$1 but I couldnt seem to get it to work in this case. In sead useing $@ to do the same thing.
for f in "$@"
do
holder=$(basename "$f" .tgz)
mkdir stemp/$holder
tar -xzf $f -C stemp/$holder
bin/process_client_logs.sh stemp/$holder
done
#I think I might be able to make this into an array but not to sure how
bin/create_username_dist.sh stemp
bin/create_hours_dist.sh stemp
bin/create_country_dist.sh stemp
bin/assemble_report.sh stemp

main=$(pwd)
mv stemp/failed_login_summary.html $main
#clean up is nice
rm -rf stemp
