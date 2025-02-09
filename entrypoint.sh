#!/bin/bash

cd /github/workspace

echo "run: aseprite --batch $1"
STDOUT="$(aseprite --batch $1 2> error.txt)"

echo "output:"
echo "$STDOUT"

if [ $? -ne 0 ]; then
    echo "error:"
    echo "$(cat error.txt)"
    exit 1
fi

echo "stdout=$STDOUT" >> $GITHUB_OUTPUT
