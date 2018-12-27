#!/bin/sh

revision=${1:-HEAD^}
echo "Finding spec files which have changes since the revision '$revision'"
files=$(git diff $revision --name-only | grep '_spec.rb')

echo "Running rspec with the following files"
for file in $files
do
  echo $file
done
echo

rspec $files
