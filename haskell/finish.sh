#!/bin/sh

readonly name=$(jq -r '.exercise' ./.exercism/metadata.json)

git add src/
git commit -m "[haskell] finish $name"
stack purge
cd ..
