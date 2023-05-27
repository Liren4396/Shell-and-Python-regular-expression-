#! /usr/bin/env python3
import sys

for i in sys.argv[1:]:
    count = 0
    for j in i:
        if j == 'a' or j == 'e' or j == 'i' or j == 'o' or j == 'u'or j == 'A' or j == 'I' or j == 'E' or j == 'O' or j == 'U':
            count += 1
            #print(j, end="")
        else:
            count = 0
        if count == 3:
            print(i, end=" ")
            break
print()