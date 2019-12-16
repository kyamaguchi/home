#!/bin/bash

cpulimit -p $(ps -A | grep " /Applications/Dropbox.app/Contents/MacOS/Dropbox$" | awk '{print $1}') -l 30 &

# Refs:
# $ brew install cpulimit
# https://github.com/Homebrew/homebrew-core/blob/master/Formula/cpulimit.rb
# https://medium.com/@sbr464/limit-dropbox-and-others-on-macos-from-taking-100-cpu-877266df104d
#   -> cputhrottle didn't work
