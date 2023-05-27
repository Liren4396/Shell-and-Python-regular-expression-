#! /usr/bin/env python3
import sys,re

lines = sys.stdin.readlines()
#print(lines)
count = 0
for line in lines:
    line = re.split("[^a-zA-Z]", line)
    for word in line:
        if word != '':
            count += 1
    #print(line)
print(count, "words")