#!/bin/bash

set -e

WSPACE="`mktemp -d`"
trap 'rm -rf "$WSPACE"' EXIT

BOLD=`tput bold`
RESET=`tput sgr0`

DD=${DD:-dd}

usage() {
    echo "Usage: $0 PROJECT_FILE [OUTPUT_FILE] "
    echo ""
    echo "This script will extract the actual project data from a zipped and"
    echo "gzipped project and write it to OUTPUT_FILE. If not given, OUTPUT_FILE"
    echo "defaults to PROJECT_FILE.txt."
    echo ""
    echo "This script requires GNU dd. Since OS X ships with BSD dd and GNU dd"
    echo "is prefixed with g by default, this script allows specifying the dd"
    echo "executable to use using the DD environment variable."
}

msg () {
    >&2 echo "$BOLD$@$RESET"
}

exitmsg() {
    msg "$@"
    usage
    exit 1
}

if [ "$#" -lt 1 ]; then
    exitmsg "no input file given"
fi

if [ "$#" -gt 2 ]; then
    exitmsg "too many arguments"
fi

if [ ! -f "$1" ]; then
    exitmsg "input file not found"
fi

if ! "$DD" --version >/dev/null; then
    exitmsg "$DD --version failed, please make sure that \$DD resolves to a GNU dd"
fi

PR_FILE="`basename "$1"`"

unzip -q -d "$WSPACE" "$1" "$PR_FILE"

OFF=`grep --max-count=1 --only-matching --binary --text --byte-offset -F $'\x1f\x8b' "$WSPACE/$PR_FILE" | cut -d: -f1`

if [ "$#" -eq 2 ]; then
    OUT="$2"
else
    OUT="$PR_FILE.txt"
fi

"$DD" status=none if="$WSPACE/$PR_FILE" bs=1M skip="$OFF" iflag=skip_bytes | gzip -d > "$OUT"
