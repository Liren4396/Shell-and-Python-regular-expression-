#!/bin/sh
#debug set -x
year=$1
course=$2
if (($# != 2))
then
    echo 'Usage: ./scraping_courses.sh <year> <course-prefix>'
else
    if (($year > 2022 || $year < 2019)) 2>/dev/null || ! [[ $year =~ ^[0-9]+ ]]
    then
        echo './scraping_courses.sh: argument 1 must be an integer between 2019 and 2022'
    else 
        wget -qO-  https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0  https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0 | 
        2041 jq '.contentlets[] | {code: .code, title: .title}' |
        sed '/[{}]/d' | sed 's/"title": "//g' | sed 's/"$//g' | sed 's/"code": "//g' | 
        sed 's/",//g' | sed -n '{N;s/\n//p}' | sed 's/  / /g' | sed 's/^ //g' | grep "^$course" |
        sort -nk1.5,1.8 | sort -k1.2,1.4 | uniq
    fi
fi
#echo $0
#echo $year
#echo $course
#echo $#