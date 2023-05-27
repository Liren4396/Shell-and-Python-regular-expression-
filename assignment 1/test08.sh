#!/bin/dash
rm -r .tigger/

rm a
rm b
tigger-init

echo 1 >a
tigger-add a
tigger-commit -m "f"
tigger-rm --cached a

echo 1 >b
tigger-add b
tigger-commit -m "fff"
tigger-branch a1

if [ -e .tigger/branch/a1/index/b ] && [ ! -e .tigger/branch/a1/index/a ]
then
    echo "test successed"
else
    echo "test failed"
fi