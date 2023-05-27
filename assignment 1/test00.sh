#!/bin/dash
rm -r .tigger/
rm a
echo 1 >a

tigger-init
tigger-add a
tigger-commit -m "f"
tigger-branch a1
tigger-checkout a1
echo 2 >b
tigger-add b
tigger-commit -m "ff"
if [ -e .tigger/branch/a1/1/b ] && [ -e .tigger/branch/a1/1/a ]
then
    echo "test successed"
else
    echo "test failed"
fi