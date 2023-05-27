#!/usr/bin/env python3

import sys
if(len(sys.argv) != 4):
    print("error")
    exit
start = int(sys.argv[1])
end = int(sys.argv[2])
output = open(sys.argv[3], "w")
#print(type(start))
while(start <= end):
    output.write(str(start)+'\n')
    start += 1
output.close()