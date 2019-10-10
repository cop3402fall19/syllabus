#!/bin/bash

if [ ${#} -lt 1 ]; then
    echo "USAGE: $(basename $0) file.ll"
    exit 1
fi
file="${1}"
program="${file%.ll}"
input="${program}.in"
output="${program}.out"
stderr="${program}.err"
groundtruth="${program}.groundtruth"
groundtrutherr="${program}.groundtrutherr"

if [ -f "${groundtruth}" ]; then
    cat "${groundtruth}"
elif [ -f "${groundtrutherr}" ]; then
    cat "${groundtrutherr}" >&2
fi
