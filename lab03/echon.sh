#usr/bin/sh

#echo $1
#echo $2
i=0

#echo $1
if (($# == 2))
    
then

    if (($1 -lt 0)) 2>/dev/null || ! [[ $1 =~ ^[0-9]+ ]]
    then
        echo './echon.sh: argument 1 must be a non-negative integer'
    else 

        while ((i < $1))
        do
            echo $2
            ((i++))
        done
    fi

else 
    echo "Usage: ./echon.sh <number of lines> <string>"
fi