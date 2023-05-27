#! /usr/bin/env python3
import sys,re
from unicodedata import numeric
sum = 0
for file in sys.argv[1:]:
    with open(file) as f:
        while True:
            output = f.readline()
            if output == '':
                break
            else:
                #print(output)
                num = re.findall(r"\d{1,}", output)
                if num != []:
                    i = 0
                    len_num = len(num)
                    #print("len", len_num)
                    while i < len_num:
                        #print(num[i])
                        
                        sum += int(num[i])
                        i += 1
print(sum)