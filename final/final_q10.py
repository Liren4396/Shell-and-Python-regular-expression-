#!/usr/bin/python3
import re
import sys

def function(s):     
    #use d as set type     
    d = {}     
    #use for loop to get each member in argument s     
    for i in s:         
        # change i to be lower         
        i = i.lower()         
        #if it not in d, just let d[i], the count be 0, same as append to the list,         
        #otherwise, the corresponding count should plus 1         
        if i not in d:             
            d[i] = 0         
        else:             
            d[i] += 1     
        #distinguish the len of set values is equal to 1 or not, return true or false     
    return len(set(d.values())) == 1





#get each line from stdin
for line in sys.stdin:
    #get each word from line
    # useless here
    for i in line:
        
        #remove \n and " " to get a list, use replace to get string and split to get list 
        string1 = line.replace("\n", "")
        sentence = string1.split(" ")
        #set a tuple as res
        res = []
        #get each member in sentence, use for loop
        for word in sentence:
            # and we set a function, if the return value is true, append to res
            if function(word) == True:
                res.append(word)
    #use join to add new space
    print(" ".join(res))