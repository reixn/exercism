#!/bin/sh

set -o xtrace -o errexit

exercism download "--exercise=$1" --track=haskell
cd $1
stack build
git add -Av
git status
