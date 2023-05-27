#! /usr/bin/env python3

from re import T
import sys
#consider if the two files are mirrored
#first open these two files
file1 = open(sys.argv[1])
file2 = open(sys.argv[2])
#use list to solve this problem
#so create two lists
list1 = list()
list2 = list()
#count1 and count2 are used to count how many lines in each file
# actually is useless here
count1 = 0
count2 = 0
while True:
    #read each line in these two files
    line1 = file1.readline()
    line2 = file2.readline()
    #if line1 or line2 not equal to '', then
    #append to corresponding list, otherwise
    #break the loop
    if line1 != '':
        list1.append(line1)
    if line2 != '':
        list2.append(line2)
    if line1 == '':
        break
    count1 += 1
    if line2 == '':
        break
    count2 += 1
#count how many members in each list
len1 = len(list1)
len2 = len(list2)
#if they are not same
if len1 != len2:
    print(f"Not mirrored: different number of lines: {len1} versus {len2}")
else:
    #if len1 and len2 are same, we need to distinguish if they are same in correspoding line
    # use begin = 0 in one list, and count = len(another list).
    # use these two variables to compare opposite memeber in two list
    # if one time is different, change flag to 1 and print in line ? is different
    flag = 0
    begin = 0
    count = len2 - 1
    #count is the ?th in the end of the list 
    while count >= 0:
        #compare if two members are same
        if list1[begin] != list2[count]:
            flag = 1
            print(f"Not mirrored: line {begin+1} different")
            break
        #use begin++ and count++ as increasement
        begin = begin + 1
        count = count - 1
    #if the loop is end and flag is still 0, it's mirrored
    if flag == 0:
        print("Mirrored")
