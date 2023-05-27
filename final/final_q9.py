#! /usr/bin/env python3
import sys
import re
#argv1 is length and argv2 is filename
#change argv1 to int as length and argv
length = int(sys.argv[1])
filename = open(sys.argv[2])
list1 = list()

#use loop to get line continuously
while True:
    
    line = filename.readline()
    #if line is '', break the loop
    if line == '':
        break
    #use ' ' to split and partition
    partition = re.split(' ', line)
    #find length of the partition
    len_partion = len(partition)
    j = 0
    for i in partition:
        #append i to the list andd let j++ to do each loop 
        if j < len_partion - 1:
            i = i + " "
        
        list1.append(i)
        j += 1
#find each element in list
#if count + len_i is larger than length
#just modift this element to be this + \n
#else just increase the count
count = 0
#use position to find each element's position
position = 0
len_list = len(list1)
for i in list1:
    len_i = len(i)
    if position < len_list - 1:
        if (count + len_i) >= length:
            list1[position] = i+"\n"
            count = 0
        else:
            count += len_i
    
    position += 1
#write each element into file
with open(sys.argv[2], "w") as file:
    for i in list1:
        file.write(i)
file.close()