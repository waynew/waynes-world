#!/bin/sh

has_bash=1
command -v /usr/bin/env bash >/dev/null 2>&1 || { has_bash=0; }

if [ $has_bash -eq 1 ]; then
    echo "Yay we haz a bash - running bash setup!"
    ./setup.sh
else
    echo "No bash :("
    exit 1
fi

exit 0
