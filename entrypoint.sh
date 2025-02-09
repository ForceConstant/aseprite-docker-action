#!/bin/bash

cd /github/workspace

echo "run: aseprite --batch $1"
aseprite --batch $1 1> stdout.txt 2> error.txt
STDOUT="$(cat stdout.txt)"
STDERR="$(cat error.txt)"
EXIT_CODE=$?

echo "output:"
echo "$STDOUT"

if [ "$EXIT_CODE" -ne "0" ]; then
    echo "error:"
    echo "$STDERR"
    exit 1
fi

echo "stdout=$STDOUT" >> $GITHUB_OUTPUT
echo "stderr=$STDERR" >> $GITHUB_OUTPUT
echo "exit-code=$EXIT_CODE" >> $GITHUB_OUTPUT
