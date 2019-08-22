#!/bin/bash

if [ ${#} -lt 2 ]; then
    echo "USAGE: $(basename $0) path/to/your/compiler file.simplec"
    echo ""
    echo "NOTE: you may need to prepend \"./\" before the path to your compiler if it is a relative path"
    exit 1
fi

compiler="${1}"
file="${2}"
stem="${file%.simplec}"
target="${stem}.ll"

if [ -f "$compiler" ]; then
    echo "compiling ${file} to ${target}"
    "${compiler}" "${file}" > "${target}"
else
  echo "could not find your compiler at ${compiler}.  please check the path."
  exit 1
fi

