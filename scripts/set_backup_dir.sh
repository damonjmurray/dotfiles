#!/bin/bash

function set_backup_dir() {
  local default_backup_dir="$HOME/.dotfiles_backup"

  if [ ! -d $default_backup_dir ]; then
    echo "Creating backup directory at $default_backup_dir"
    `mkdir -p $default_backup_dir`
  fi

  BACKUP_DIR=$default_backup_dir
  echo $BACKUP_DIR
}


# run the function if $BACKUP_DIR has not already been exported
if [ -z "${BACKUP_DIR+xxx}" ]; then
  set_backup_dir
fi
