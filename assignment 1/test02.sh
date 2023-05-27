#!/bin/dash

rm -r .tigger/
rm -f a
tigger-init
touch a
tigger-add a
tigger-commit -m "f"
if [ -e .tigger/repository/0/a ]
then
	echo "test successed"
else
    echo  "test failed"
fi