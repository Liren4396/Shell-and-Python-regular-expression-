#! /usr/bin/env python3
import sys

arr = {}
count = 0
#print(sys.argv[1])
try:
    while True:
        str = input()
        flag = 0
        for i in arr:
            #print(arr[i])
            if i == str:
                arr[str] += 1
                flag = 1
                if arr[str] == int(sys.argv[1]):
                    print("Snap:",str)
                    exit(0)
        if flag == 0:
            arr[str] = 1
except:
    pass
