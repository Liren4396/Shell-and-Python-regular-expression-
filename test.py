#! /usr/bin/env python3

import sys
import csv

data = csv.reader(sys.stdin, delimiter='|')

total = 0

for course, stuid, name, progam, gender in csv.reader(sys.stdin, delimiter='|'):
    try:
        progam, stage = progam.split('/')

    except ValueError:
        continue

    if progam == '3711':
        total += 1

print(total)