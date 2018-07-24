#!/bin/bash

COUNTER=0
for dir in projects/terraform/*
do
    if [ ! -f $dir/README.yaml ]; then
        echo "$dir without README.yaml, skip"
        continue
    fi
    (( COUNTER++ ))
    ( 
        echo "Started updating $dir"
        cd $dir
        make init
        make readme/deps
        make readme
    )
done

echo "Count of updated terraform's readme: $COUNTER"