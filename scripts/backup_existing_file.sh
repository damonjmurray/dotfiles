#!/bin/bash

function backup_existing_file() {
  # Args:
  #   $1 - target_dir
  #   $2 - filename
  #   $3 - backup_dir

  if [ "$#" -ne 3 ]; then
    display_error "Insufficient parameters" "backup_existing_file target_dir filename backup_dir"
    exit 1
  fi

  # check file to backup exists
  if [ -f "$1/$2" ]; then
    local timestamp=$(date +"%Y%m%d%H%M%S")
    cp $1/$2 $3/$2.$timestamp
    echo "Created a backup of $1/$2 at $3/$2.$timestamp"
  fi
}
