#! /bin/dash

num=$(grep -E "$1" $2 | cut -f2,2 -d'|' | sort | uniq)
start=$(echo "$num" | head -n1)
end=$(echo "$num" | tail -n1)
while true
do
    
    
    i=$(($start+1))
    j=2
    while [ $i -lt $end ]
    do
        word=$(echo "$num" | head -"$j" | tail -1)
        if [ $i -ne $word ] 2>/dev/null
        then

            echo $i
            break
        fi

        i=$(($i+1))
        j=$(($j+1))
        #echo word$word
    done
    if [ $start -eq $end ]
    then

        break
    fi
    start=$(($start+1))
done