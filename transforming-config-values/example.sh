#/bin/bash

source $(dirname $0)/$(echo $(basename $0) | sed 's/\.sh/-config.sh/1')

echo "hosts: '${hosts}'"
transformedHosts=$(echo ${hosts} | sed 's/[^ ][^ ]*/--host=&/g')
echo "transformedHosts: '${transformedHosts}'"
echo "some-command ${transformedHosts}"
# => some-command --host=example1.some.domain --host=example2.some.domain --host=example3.some.domain

