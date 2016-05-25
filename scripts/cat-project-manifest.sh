#!/bin/bash

set -e

BOLD=`tput bold`
RESET=`tput sgr0`

usage() {
    echo "Usage: $0 PROJECT_FILE"
    echo ""
    echo "This script will extract the manifest file from a zipped project and"
    echo "write it to standard out."
}

msg () {
    >&2 echo "$BOLD$@$RESET"
}

exitmsg() {
    msg "$@"
    usage
    exit 1
}

if [ "$#" -ne 1 ]; then
    exitmsg "no input file given"
fi

if [ ! -f "$1" ]; then
    exitmsg "input file not found"
fi

unzip -p "$1" manifest | tr "\r" "\n"
