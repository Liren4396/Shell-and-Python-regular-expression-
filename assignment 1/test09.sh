#!/bin/dash
rm -r .tigger/
echo 1 >a
echo 1 >b

tigger-init
tigger-add a b
tigger-commit -m "f"
tigger-status
tigger-branch a1
echo 2 >c
echo 2 >d
tigger-add c d
tigger-commit -m "ff"
tigger-branch a2

if [ -e .tigger/branch/a2/index/c ] && [ -e .tigger/branch/a2/index/d ] && [ -e .tigger/branch/a2/index/a ] && [ -e .tigger/branch/a2/index/b ]
then
    echo "test successed"
else
    echo "test failed"
fi