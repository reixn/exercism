#!/bin/sh

readonly name=$(jq -r '.exercise' ./.exercism/metadata.json)

set -o xtrace -o errexit

git add -v src/
git status
git commit -m "[haskell] finish $name"
stack purge
