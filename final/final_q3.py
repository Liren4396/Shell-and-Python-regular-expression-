#! /usr/bin/env python3
import sys
import re
import csv

list1 = list()
#use csv to do clarification
for course, stuid, name, progam, gender in csv.reader(sys.stdin, delimiter='|'):
    #if gender is M, extract the surname from name
    if gender == 'M':
        surname = re.search('^\w*,', name)
        surname = surname.group(0)
        surname = re.sub(',', '', surname)
        # use the surname, if it's not in the list, push it to the list
        if surname not in list1:
            list1.append(surname)
            
# solve the list in ascending order
list1.sort()
#print each list member
for surname in list1:
    print(surname)



