#!/bin/bash

set -e

BOLD=`tput bold`
RESET=`tput sgr0`

msg () {
    >&2 echo "$BOLD$@$RESET"
}

exitmsg() {
    msg "$@"
    exit 1
}

if [ "$#" -ne 1 ]; then
    exitmsg "no input file given"
fi

if [ ! -f "$1" ]; then
    exitmsg "input file not found"
fi

unzip -p "$1" manifest | tr "\r" "\n"
