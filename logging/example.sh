#!/bin/bash

export GREP_OPTIONS="--color=auto"

log() {
  local message=$1
  local level=$2
  local timestamp=$(date +%Y-%m-%d_%H-%M-%S)
  printf "%s %-7s - %s\n" "[${timestamp}]" "${level}" "${message}" | grep ${level}
}

logInfo() {
  export GREP_COLOR="1;34" # blue
  log "$1" "INFO"
}

logError() {
  export GREP_COLOR="1;31" # red
  log "$1" "ERROR"
}

logSuccess() {
  export GREP_COLOR="1;32" # green
  log "$1" "SUCCESS"
}

logInfo "Some message"
logError "Some message"
logSuccess "Some message"

