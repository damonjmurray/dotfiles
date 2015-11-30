#!/bin/bash

# imports
source '../scripts/set_backup_dir.sh' > /dev/null
source '../scripts/symlink_source_file.sh'
source '../scripts/backup_existing_file.sh'
source '../scripts/display_error.sh'


function setup_vim_dotfiles() {
  # set working directories
  local target_dir=$HOME
  local source_dir=`pwd -P`

  # get all the .dotfiles listed in the source dir
  for file in $(find $source_dir -type f); do
    # only include dotfiles (i.e.: .*)
    if [[ ${file##*/} == .* ]]; then
      local filename=${file##*/}
      backup_existing_file $target_dir $filename $BACKUP_DIR
      symlink_source_file $source_dir $filename $target_dir
    fi
  done
}

echo 'Installing vim dotfiles'
setup_vim_dotfiles
