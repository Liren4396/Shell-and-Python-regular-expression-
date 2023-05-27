#! /usr/bin/env python3
from curses.ascii import ctrl
import sys,re
arr = {}
arr_num = []
#max_1 = 0
try:
    while True:
        
        sentence = input()
        max = 0.0
        #print(sentence)
        arr_num = re.findall('-?\d+\.?\d*e?\d*?', sentence)
        if not arr_num:
            continue
        for i in arr_num:
            #i = re.sub('-{1,}', '', i)
            #i = re.sub('^.', '', i)
            i = float(i)
            if isinstance(i, float):
                if float(i) >= float(max):
                    max = float(i)
                    #max_1 = float(max)
                    arr[sentence] = float(max)
except EOFError:
    max_1 = 0.0
    for i in arr:
        #print("num", float(arr[i]))
        if float(arr[i]) > float(max_1):
            
            max_1 = float(arr[i])
    #for i in arr:
    new = [k for k, v in arr.items() if float(v) == float(max_1)]
    #print("new",new)
    for i in new:
        print(i)
