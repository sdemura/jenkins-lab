#!/bin/bash

export FLAKE="$((1 + RANDOM % 10))"

echo "testing if FLAKE == FAIL"
if [[ "$FLAKE" -eq "$FAIL" ]]; then
    echo "FLAKE equals FAIL"
    echo "exiting"
    exit 1
fi
