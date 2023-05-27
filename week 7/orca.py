#! /usr/bin/env python3
import sys,re
sum = 0
for file in sys.argv[1:]:
    output = open(file)
    with open(file) as output:
        while True:
            sentence = output.readline()
            if sentence == '':
                break
            else:
                
                key = re.search('[A-Z].*$', sentence)
                key = str(key.group(0))
                if key == 'Orca':
                    num = re.search(' [0-9]{1,} ', sentence)
                    num = re.search('[0-9]{1,}', num.group(0))
                    num = int(num.group(0))
                    sum += num
    output.close()
print(sum,"Orcas reported")