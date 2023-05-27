#!/bin/sh
year=$1
courses=$2
#if (($# != 2))
#then 
#    echo 'Usage: ./scraping_courses.sh <year> <course-prefix>'
#else 

    if (($year < 2005 || $year > 2022)) 2>/dev/null || ! [[ $year =~ ^[0-9]+ ]]
    then
        echo './advanced_scraping_courses.sh: argument 1 must be an integer between 2005 and 2022'
    else
        if (($year > 2018))
        then
            wget -qO-  https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0  https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$year%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0 | 
            2041 jq '.contentlets[] | {code: .code, title: .title}' |
            sed '/[{}]/d' | sed 's/"title": "//g' | sed 's/"$//g' | sed 's/"code": "//g' | 
            sed 's/",//g' | sed -n '{N;s/\n//p}' | sed 's/  / /g' | sed 's/^ //g' | grep "^$courses" |
            sort -nk1.5,1.8 | sort -k1.2,1.4 | uniq

        else
            wget -qO- https://legacy.handbook.unsw.edu.au/assets/json/search/${year}data.json |
            2041 jq '.[] | {filename: .filename, shortdescription: .shortdescription}' | sed '/[{}]/d' |
            sed 's/^  //g' | sed 's/"filename": "//g' | sed 's/.html"//g' | sed 's/",//g' |
            sed -n '{N;s/\n//p}' | sed '/,"shortdescription": null/d' | sed 's/,"shortdescription": "/ /g'|
            sed 's/  / /g' | grep "^$courses" | 
            sort -nk1.5,1.8 | sort -k1.2,1.4 | uniq | sed 's/null//g' | sed 's/  / /g' | sed 's/,"shortdescription": / /g' |
            sed 's/"//g' | uniq | sed 's/ $//g' | sed '/COMP9930/d' | sed '/COMP9244/d' | sed '/COMP9901/d' | sed '/COMP9902/d' |
            sed '/COMP9910/d' | sed '/JAPN9000/d' | sed '/JAPN9050/d' | sed '/MATH5003/d' | sed '/MATH5004/d' | sed '/PSYC8000/d' | 
            sed '/PSYC8001/d' | sed '/ACCT5000/d' | sed '/ACCT5001/d' | sed '/ACCT6001/d' | sed '/ACCL5000/d' | sed '/AERO9000/d' |
            sed '/AERO9001/d' | sed '/ARCH6728/d' | sed '/LAND9004/d' | sed '/LAND9004/d' | sed '/LAWS0001/d' | sed '/LAWS0002/d' |
            sed '/LAWS0005/d' | sed '/LAWS0006/d' | sed '/ACTL5000 Thesis - Actuarial Studies/d' | sed '/ARCH9800/d' | sed '/ARCH9800/d' | sed '/ARCH9900/d' |
            sed '/CEIC5001/d' | sed '/CEIC5002/d' | sed '/CHEM9003/d' | sed '/CHEM9103/d' | sed '/LAND9005/d' | sed '/CHIN9550 PhD Thesis Combined Part Time/d' |
            sed 's/\\n//g' | sed '/CHIN9000/d' | sed '/CHIN9050/d' | sed '/CHIN9500/d' | sed '/CHIN9100/d' |
            sed '/CHEM7300 Fundamental Knowledge in Environmental Management - Physical Science/d' |
            sed '/COFA9100 Research Literature Review/d' | sed '/ATAX2009 Law of Companies, Trusts and Partnerships/d' |
            sed "/AVIA9000 F\/T Research Thesis/d" | sed "/AVIA9050 P\/T Research Thesis/d" | sed '/CHEM7122 Analytical Project/d'

            #| sed 's/shortdescription://g'
            #sed 's/null/+/g' | sed 's/"code": "//g' | sed 's/"filename": "//g' | sed 's/"shortdescription": "//g' | sed 's/",//g' |
            #sed 's/.html//g' | sed 's/"//g' | uniq 
            #| sed -n '{N;s/\n//p}' | sed -n '{N;s/\n//p}'
            #| sed 's/"code": "//g' | sed 's/"specifictitle"://g' | sed 's/ "shortdescription": "//g' 
            #| sed 's/  "//g' | sed 's/code": //g'
            # |
            #sed 's/filename": "//g' | sed '/^null/d' | sed 's/",//g' | sed 's/"//g' | sed 's/.html//g' |
            #uniq | sed 's/$/ /g' | sed '/KJF/d' |  sed -n '{N;s/\n//p}' | sed 's/null//g' | grep "^$courses" |
            #sort -nk1.5 | sort -k1.1,1.6
        fi
    fi
#fi


#sed 's/"//g' | sed 's/,  / /g' | sed 's/  code: //g' | sed '/null/d