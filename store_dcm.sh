#!/usr/bin/env bash

if [[ "$#" -lt 2 ]] ; then
    echo "Usage: $(basename "${BASH_SOURCE[0]}") <output-directory> <args> <port>" >&2
    exit 1
fi
if [[ ! -d "$1" ]] ; then
    if ! mkdir "$1" ; then
        echo "Error creating output directory" >&2
        exit 1
    fi
fi
echo "Starting SCP on port ${!#}"
storescp -sp -aet "$(hostname)" -od "$@"