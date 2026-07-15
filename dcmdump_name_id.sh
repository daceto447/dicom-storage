#!/usr/bin/env bash

# Takes in a path to a directory of .dcm files, 
# uses dcmdump to get patient name and ID for each,
# and outputs as csv.

if [[ ! -d "$1" ]] ; then
    echo "\"$1\": Not a directory" >&2
    exit 1
fi

echo "patient,id"
for f in ${1}/* ; do
    if [[ "${f##*.}" == dcm ]] ; then
        grep -e "(0010,0010)" -e "(0010,0020)" <<< "$(dcmdump "$f")" |
            awk '{print $3}' |
            paste -sd ',' |
            sed 's/[][]//g'
    fi
done