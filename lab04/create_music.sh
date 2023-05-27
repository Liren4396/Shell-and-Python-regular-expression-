#!/bin/dash
mp3_file="$1"

wget -q -O- 'https://en.wikipedia.org/wiki/Triple_J_Hottest_100?action=raw'|
while read line
do

    case "$line" in
    \|*'[[Triple J'*'|'[0-9][0-9][0-9][0-9]']]'*) ;;
    *) continue;;
    esac
    #echo "line : $line"
    album=`echo "$line" | sed 's/.*\[\[//;s/|.*//'`
    #echo "album : $album"
    year=`echo "$album" | sed 's/.*, //'`
    #echo "year : $year"
    dir=""$2"/Triple J Hottest 100, $year"
    #echo "dir : $dir"
    mkdir -p -m 755 "$dir"

    num=1
    while read line && [ $num -le 10 ] 
    do
        
        case "$line" in
        '#'*) ;;
        *) continue;;
        esac

        #echo "line : $line"
        # remove links to wikipedia pages
        line=`echo "$line"|sed 's/[^[]*|//g'`
        #echo "line : $line"
        line=`echo "$line"|sed 's/\//-/g'`
        
        line=`echo "$line"|tr -d '[]"#'`
        line=`echo "$line"|sed 's/[–$]/%/g'`
        #echo "line : $line"
        artist=`echo "$line"|cut -f1 -d'%'`
        

        title=`echo "$line"|cut -f2 -d'%'|sed 's/^ //g'`
        
        artist=`echo "$artist"|sed 's/^ *//;s/ *$//'`
        #echo "artist : $artist"
        title=`echo "$title"|sed 's/^ *//;s/ *$//'`
        #echo "title : $title"
        file="$dir/$num - $title - $artist.mp3"
        #echo "file : $file"
        cp -p "$mp3_file" "$file"
        num=$((num + 1))
    done 
done