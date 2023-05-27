#!/bin/dash
for file in `ls ./ | grep ".htm$"`
do
    #echo "$file"
    if [ -e $file'l' ]
    then
        echo $file'l' exists
        exit 1
    else
        if [ -e $file ]
        then
            if [ "$file" = "a\ \ file\ \ with\ \ \ spaces.htm" ]
            then
                cat 'a\ \ file\ \ with\ \ \ spaces.htm' > 'a\ \ file\ \ with\ \ \ spaces.htmt'
                rm 'a\ \ file\ \ with\ \ \ spaces.htm'
            else
                mv "$file" $file'l'
            fi
        fi
    fi
done