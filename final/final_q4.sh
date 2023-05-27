#! /bin/dash

# first step is to solve the num in acsending order
# find the smallest and largest number -- use head and tail
num=$(sort -n "$1")
start=$(echo "$num" | head -n1)
end=$(echo "$num" | tail -n1)

#regard i as the second smallest value and j as the ?th we need to print
i=$(($start+1))
j=2
#use i less than end as the condition of the loop
while [ $i -lt $end ]
do
    # use head and tail (same as we find start and end) to find each number in num
    # in acsending order
    word=$(echo "$num" | head -"$j" | tail -1)
    # if word, the number is not equal to i,
    # just print to the screen
    if [ $i -ne $word ] 2>/dev/null #filter out the error message
    then

        echo $i
        break
    fi

    i=$(($i+1))
    j=$(($j+1))
done