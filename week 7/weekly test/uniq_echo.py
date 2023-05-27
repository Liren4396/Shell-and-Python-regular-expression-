#! /usr/bin/env python3
import sys
arr = {}
for i in sys.argv[1:]:
    arr[i] = i
for i in arr:
    print(arr[i], end=" ")
print()