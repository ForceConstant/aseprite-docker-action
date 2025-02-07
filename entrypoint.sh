#!/bin/bash

cd /github/workspace

STDOUT="$(aseprite --batch $1 2> error.txt)"

echo "stdout"
echo "$STDOUT"

if [ $? -ne 0 ]; then
  echo "ERROR: $(cat error.txt)"
  exit 1
fi

echo "stdout=$STDOUT" >> $GITHUB_OUTPUT
