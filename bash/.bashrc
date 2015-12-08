#!bash

# Prompt #
export PS1="\W \\$ "

# oh my git
src_file='/Users/damonjmurray/.dist/oh-my-git/prompt.sh'
if [ -f "$src_file" ]; then
  . "$src_file"
else
  echo "Could not locate file $src_file"
fi
