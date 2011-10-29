#!/usr/bin/env bash
#
# Shows which process listens to the given port showing lsof and ps output.
#

set -eu

if [[ ! $# -eq 1 ]]; then
  echo "Usage $(basename $0) <port>"
  exit 1
fi

port=$1

echo "Asking lsof with port ${port}..."
lsofOutput=$(sudo lsof -Pn | grep "TCP \*:${port} (")
if [[ ${lsofOutput} == "" ]]; then
  echo "No process found listening port ${port}."
  exit 1
fi
echo
echo ${lsofOutput}
echo
pid=$(echo ${lsofOutput} | awk '{print $2}')
echo "Asking ps with pid ${pid}..."
echo
ps -ef | grep ${pid} | grep -v grep
echo
echo "Done."

