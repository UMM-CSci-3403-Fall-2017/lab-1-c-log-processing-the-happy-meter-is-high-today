#!/bin/bash

#useing a cat call(ha) to combie all the html files into a .txt file

cat $1/country_dist.html $1/hours_dist.html $1/username_dist.html > Combine.txt

./bin/wrap_contents.sh Combine.txt html_components/summary_plots $1/failed_login_summary.html

rm Combine.txt
