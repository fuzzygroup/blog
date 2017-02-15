---
layout: post
title: Linux Tip of the Day - Counting Lines of Code Across Directories
---
find . -name '*.yml' | xargs wc -l

wc -l `tree -if --noreport | grep -e'\.php$'`

http://stackoverflow.com/questions/1358540/how-to-count-all-the-lines-of-code-in-a-directory-recursively

brew install sloccount
