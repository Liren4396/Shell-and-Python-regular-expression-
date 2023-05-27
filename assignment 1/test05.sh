#!/bin/dash

rm -r .tigger/
rm -f a
echo 1 >a

tigger-init
tigger-add a
tigger-rm --cached a
tigger-commit -m "ff"
if [ ! -e .tigger/repository ]
then
    echo "test successed"
else
    echo "test failed"
fi
