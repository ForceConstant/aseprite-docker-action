#!/bin/bash
set -euo pipefail

cd /github/workspace

echo "stdout=$(aseprite --batch $1)" >> $GITHUB_OUTPUT
