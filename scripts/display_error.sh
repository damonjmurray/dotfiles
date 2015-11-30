#!/bin/bash

function display_error() {
  # Args:
  #   $1 - error
  #   $2 - usage string

  local caller=${FUNCNAME[1]}

  local title=""
  local error=""
  local usage=""

  if [ "$#" -ne 2 ]; then
    title="Error calling display_error from $caller"
    error="Insufficient parameters"
    usage="display_error error_name usage_string"
  else
    title="Error in $caller"
    error=$1
    usage=$2
  fi

  local underline=$(for i in $(seq 1 ${#title}); do printf "-"; done)

  local msg=$(
cat << EOF
  $title
  $underline
  $error

  usage: $usage
EOF
  )

  echo $'\n'"$msg"$'\n'
}
