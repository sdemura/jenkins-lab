#!/bin/bash

export FLAKE="$((1 + RANDOM % 10))"

[[ "$FLAKE" -eq "$FAIL" ]] || exit 1
