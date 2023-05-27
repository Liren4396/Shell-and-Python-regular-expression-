#! /usr/bin/env python3
import sys,re
import glob,math
list = {}
for i in sys.argv[1:]:
    find_word = i
    dic = {}
    dic_1 = {}
    for file in glob.glob('lyrics/*.txt'):
        count = 1
        intotal = 0
        file_name = re.sub('lyrics/', '', file)
        file_name = re.sub('.txt', '', file_name)
        file_name = re.sub('_', ' ', file_name)
        lines = open(file).readlines()
        for line in lines:
            line = line.lower()
            total_word = re.split("[^a-zA-Z]", line)
            
            words = re.findall(r'[a-zA-Z]+', line)
            #print(words)
            
            if words is not None:
                #print(words)
                for word in words:
                    if word == find_word:
                        count += 1
            if total_word is not None:
                for word in total_word:
                    if word != '' and word is not None:
                        intotal += 1
        dic[file_name] = count
        dic_1[file_name] = intotal

    dic_1 = sorted(dic_1.items(), key = lambda x: x[0])
    dic = sorted(dic.items(), key = lambda x: x[0])
    count = 0
    for i, j in dic_1:
        
        #print(dic[count][1], i, j)
        output = dic[count][1]/j
        #print(f"{dic[count][1]:4}/{j:6} = {output:.9f} {i}   {math.log(output)}")
        if i not in list:
            list[i] = math.log(output)
        else:
            list[i] += math.log(output)
        #print(i, list[i])
        count += 1
    #print()
for i in list:
    print(f"{list[i]:10.5f} {i}")