#!/bin/sh

# https://gist.github.com/dreadatour/7475747

ls -1 /Applications/Sublime\ Text.app/Contents/MacOS/Packages/

# Remove all default Sublime Text 3 snippets for Python language
export ST3_LANG="Ruby"
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/$ST3_LANG/Snippets
unzip -l /Applications/Sublime\ Text.app/Contents/MacOS/Packages/$ST3_LANG.sublime-package | grep '.sublime-snippet' | awk '{print $4}' | while read f; do touch ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/$ST3_LANG/$f; done
unset ST3_LANG

## Usable snippets (Remove from Packages/Ruby/Snippets)
# #!;usr;local;bin;ruby-w.sublime-snippet
# 060-ruby-if-else.sublime-snippet
# 070-ruby-if.sublime-snippet
# 080-ruby-case.sublime-snippet
# File_open(-__-)-{-file-__-}.sublime-snippet
# File_read(-__-).sublime-snippet
# Wrap-in-Begin-Rescue-End.sublime-snippet
# all-{-e-..-}-(all).sublime-snippet
# any-{-e-..-}-(any).sublime-snippet
# attr_accessor-..-(rw).sublime-snippet
# attr_reader-..-(r).sublime-snippet
# attr_writer-..-(w).sublime-snippet
# def-end.sublime-snippet
# def-self-..-end-(defs).sublime-snippet
# map-{-e-..-}-(map).sublime-snippet
# unless-(unless).sublime-snippet
