#! /usr/bin/env python3
import sys,re
sum = 0
while True:
    lines = sys.stdin.readlines()
    for line in lines:
        line = line.lower()
        words = re.findall(r'[a-zA-Z]+', line)
        for word in words:
            if word == sys.argv[1]:
                sum += 1
    break
print(f"{sys.argv[1]} occurred {sum} times")