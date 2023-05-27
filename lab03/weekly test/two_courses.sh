#!/bin/dash

cut -f2 -d'|' | sort |
uniq -c | sed 's/ //g' | sort -nr | grep '^2' | cut -b 2-8
#sed 's/2 //g' | sort -n