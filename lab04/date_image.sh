#!/bin/dash
for file in $*
do
    echo $file
    time=$(ls -l $file | cut -f6,7,8 -d' ')
    echo $time
    convert -gravity south -pointsize 36 -draw "text 0,10 '$time'" $file $file
    #convert -gravity south -pointsize 36 -draw "text 0,10 'Andrew rocks'" penguins.jpg temporary_file.jpg
done