#!/bin/dash

for file in $*
do
    #if [ -e "$file"]
    #then
    #    echo "no $file exists"
    #fi
    echo "$file displayed to screen if possible"
    display $file 2>dev>null
    echo -n 'Address to e-mail this image to? '
    read email
    if [ -z $email] 2>dev>null
    then
        echo "No email sent"
    else 
        echo -n 'Message to accompany image?'
        read message
        echo "$file sent to $email"
        echo "$file sent to $email" | mutt -s "$message" -e 'set copy=no' -a $file -- $email
    fi
    
done
