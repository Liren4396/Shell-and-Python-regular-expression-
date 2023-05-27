#!/bin/dash

rm -r .tigger/
tigger-init
touch a b
tigger-add a b
tigger-commit -m "first commit"
echo 1 >a
tigger-add a
tigger-commit -m "second commit"
echo 2 >a
echo 3 >b
tigger-add a b
tigger-commit -m "third commit"
if [ -e .tigger/repository/2/a ] && [ -e .tigger/repository/2/b ]
then
    echo "test successed"
else
    echo "test failed"
fi
rm -r .tigger/
rm -f a
