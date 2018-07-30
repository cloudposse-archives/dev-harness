#!/bin/bash

COUNTER=0

for dir in projects/terraform/*
do
    if [[ `git status $dir --porcelain` ]]
    then 
    (( COUNTER++ ))
    (
        cd $dir
        git checkout -b regenerate-readme
        git add .
        git commit -m "Regenerate README.md"
        git push -u origin regenerate-readme
        hub pull-request -r osterman -F ../../../scripts/PULL-REQUEST-DESCRIPTION.md
    )
    fi
done

echo "Count of created pr-s: $COUNTER"