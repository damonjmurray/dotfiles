#!/bin/bash

function symlink_source_file() {
  # Args:
  #   $1 - source_dir
  #   $2 - filename
  #   $3 - target_dir

  if [ "$#" -ne 3 ]; then
    display_error "Insufficient parameters" "symlink_source_file source_dir filename target_dir"
    exit 1
  fi

  # check source file exists
  if [ -f "$1/$2" ]; then
    # delete file if it already exists in target location
    if [ -f "$3/$2" ]; then
      rm -f "$3/$2"
    fi

    ln -s "$1/$2" "$3/$2"
    echo "Created a symlink to $1/$2 in $3"
  else
    echo "File '$1/$2' not found"
  fi
}
