#!/bin/bash

if [ ! -f scripts/cache.txt ]; 
then
    repos=$(make git/list-repos | grep '^terraform-')
    echo "$repos" > scripts/cache.txt
else
    repos=$(<scripts/cache.txt)
fi

COUNTER=0
for repo in $repos; do
  if [ ! -d "projects/terraform/${repo}" ]; then
    git submodule add "git://github.com/cloudposse/$repo.git" "projects/terraform/$repo"
    (( COUNTER++ ))
  fi
done
echo "Count of new submodules: $COUNTER"