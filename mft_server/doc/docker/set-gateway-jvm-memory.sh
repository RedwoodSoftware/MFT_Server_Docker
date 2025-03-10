#!/bin/bash
while [ $# -gt 0 ]; do
    if [[ $1 == "--"* ]]; then
        v="${1/--/}"
        declare "$v"="$2"
        shift
    fi
    shift
done

if [ -z "$memory" ]
then
    echo "memory is empty, please make sure its set in the environment variables"
    exit 1
else
    sed -i -e "s/-Xmx[0-9]*/-Xmx$memory/" "$(pwd)/gateway.vmoptions"
fi