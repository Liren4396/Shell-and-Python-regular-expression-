#!/usr/bin/env python3

import sys

if(len(sys.argv) != 3):
    print("error")
    exit(1)



with open(sys.argv[2], 'r') as file:
    count = 1
    while True:
        line = file.readline()
        if line == "":
            break
        if (count >= int(sys.argv[1])):
            break
        
        count += 1
print(line,end="")
file.close()