#!/bin/bash

export GREP_OPTIONS="--color=auto"
logDir=$(dirname $0)/logs
logFile=${logDir}/$(echo $(basename $0) | sed 's/\.sh//1')-$(date +%Y-%m-%d_%H-%M-%S).log

log() {
  local message=$1
  local level=$2
  local timestamp=$(date +%Y-%m-%d_%H-%M-%S)
  mkdir -p ${logDir} 2> /dev/null
  printf "%s %-7s - %s\n" "[${timestamp}]" "${level}" "${message}" | grep ${level}
  printf "%s %-7s - %s\n" "[${timestamp}]" "${level}" "${message}" >> ${logFile}
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

# MAIN

logInfo "Some message"
logError "Some message"
logSuccess "Some message"

