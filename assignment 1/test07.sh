#!/bin/dash

rm -r .tigger/
rm a
tigger-init
echo 1 >a

tigger-add a
tigger-commit -m "f"
tigger-branch a1
if [ -e .tigger/branch/a1/index/a ]
then
    echo "test successed"
else
    echo "test failed"
fi