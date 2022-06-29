#!/bin/sh

start="$1"
finish="$2"
if test $# = 2
then 
    start="$1"
    finish="$2"
    step=1
elif test $# = 3
then
    start="$1"
    finish="$2"
    step="$3"
else
    echo send help
    exit 1
fi
i="$start"
while (($i < $finish))
do
    echo $i
    i=$((i + step))
done