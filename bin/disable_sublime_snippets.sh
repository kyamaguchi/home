#!/bin/sh

# https://gist.github.com/dreadatour/7475747

ls -1 /Applications/Sublime\ Text.app/Contents/MacOS/Packages/

# Remove all default Sublime Text 3 snippets for Python language
export ST3_LANG="Ruby"
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/$ST3_LANG/Snippets
unzip -l /Applications/Sublime\ Text.app/Contents/MacOS/Packages/$ST3_LANG.sublime-package | grep '.sublime-snippet' | awk '{print $4}' | while read f; do touch ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/$ST3_LANG/$f; done
unset ST3_LANG
