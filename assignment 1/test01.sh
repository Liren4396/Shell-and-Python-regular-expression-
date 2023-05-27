#!/bin/dash

rm -rf .tigger
echo 1 >a
tigger-add a
tigger-commit -f "s"
tigger-branch a1
tigger-checkout a1
tigger-log
tigger-rm a
tigger-show
tigger-status
if [ -e .tigger/ ]
then
    echo "test failed"
else
    echo "test succeeded"
fi
rm -r .tigger/
rm -f a