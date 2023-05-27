#!/bin/dash

cut -f3 -d'|' |  sed 's/.*, //g' |  cut -f1 -d' ' |
sort | uniq -c | sort -n | sed 's/[1-9]//g' | sed 's/ //g' | tail -n1