#!/bin/dash

rm -r .tigger
tigger-init
echo 2 >a

tigger-add a
tigger-commit -m "first"
echo 3 >>a
tigger-add a
tigger-commit -m "second"
tigger-show 0:a
echo 
tigger-show :a
tigger-log
if [ -e .tigger/COMMIT_EDITMSG ]
then
    echo "test successed"
else
    echo "test failed"
fi
rm -r .tigger/
rm -f 