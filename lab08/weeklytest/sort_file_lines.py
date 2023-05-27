#! /usr/bin/env python3
import sys

list_1 = list()
try:
    lines = open(sys.argv[1]).readlines()
    for line in lines:
        list_1.append(line)
    while True:
        count = 0
        min = list_1[count]
        while count < len(list_1):
            if len(min) > len(list_1[count]):
                min = list_1[count]
        
            count += 1
        print(min, end="")
        list_1.remove(min)
        list_1.sort()
        if len(list_1) == 0:
            break

except:
    print(end="")