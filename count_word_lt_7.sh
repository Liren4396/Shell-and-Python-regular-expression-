#usr/bin/sh
for i in `cat words`
do
    if (($(echo $i | wc -L) < 7))
    then
        echo $i
    fi
done