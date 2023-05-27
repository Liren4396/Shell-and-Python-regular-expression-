#!/bin/dash
rm -r .tigger/
tigger-init
echo 1 >a 
echo 2 >b 
echo 3 >c 
echo 4 >d 

tigger-add a b
tigger-rm a b
tigger-commit -m "ff"
tigger-rm a b
tigger-add c d 
tigger-rm --force c d 

tigger-show :c
if [ ! -e .tigger/index/a ] && [ ! -e .tigger/index/b ] && [ ! -e .tigger/index/c ] && [ ! -e .tigger/index/d ]
then
    echo "test successed"
else
    echo "test failed"
fi