#!/bin/dash
cut -f2,3 -d'|' | sort | uniq | cut -f2 -d',' | cut -f2 -d' ' | sort 