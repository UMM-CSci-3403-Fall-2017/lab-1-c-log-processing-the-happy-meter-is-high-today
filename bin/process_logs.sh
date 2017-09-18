#!/bin/bash
mkdir stemp

for f in "$@"
do
dadir=$(basename "$f" .tgz)
mkdir stemp/$dadir
tar -xzf $f -C stemp/$dadir
bin/process_client_logs.sh stemp/$dadir
done
#I think I might be able to make this into an array but not to sure how
bin/create_username_dist.sh stemp
bin/create_hours_dist.sh stemp
bin/create_country_dist.sh stemp
bin/assemble_report.sh stemp

main=$(pwd)
mv stemp/failed_login_summary.html $main

rm -rf stemp
