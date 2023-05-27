#usr/bin/sh
small=()
medium=()
big=()
for file in `ls *` 
do
    #echo $i
    count=`wc -l $file | cut -f1 -d' '` 2>dev>null 
    #echo $count 
    if (($count < 10)) 2>dev>null
    then 
        small+=($file)
    elif (($count >= 10 && $count <= 100)) 2>dev>null
    then 
        medium+=($file) 
    elif (($count > 100)) 2>dev>null
    then 
        big+=($file)
    fi
done

echo -n "Small files: "
for i in "${small[@]}"
do
    echo -n "$i "
done
echo ""

echo -n "Medium-sized files: "
for i in "${medium[@]}"
do
    echo -n "$i "
done
echo ""

echo -n "Large files: "
for i in "${big[@]}"
do
    echo -n "$i "
done
echo ""