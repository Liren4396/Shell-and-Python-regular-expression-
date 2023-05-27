#! /bin/dash
grep M$ | cut -f3,3 -d'|' | cut -f1 -d',' | sort | uniq