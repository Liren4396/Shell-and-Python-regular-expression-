#! /bin/dash

if [ -e $1 ]
then
    filename=`cut -f1 -d'.' $1`
    echo $filename
fi