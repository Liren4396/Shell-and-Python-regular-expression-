#! /usr/bin/env python3
import sys
odd = 0
even = 0
if (len(sys.argv) == 2):
    try:
        lines = open(sys.argv[1]).readlines()
        if len(lines) % 2 == 0:
            even = 1
        else:
            odd = 1
        num = len(lines) // 2
        if odd == 1:
            i = 0
            while i < num:
                i += 1
            print(lines[i], end="")
            
        if even == 1:
            i = 0
            while i < num - 1:
                i += 1
            print(lines[i], end="")  
            print(lines[i + 1], end="")
    except:
        print(end="")