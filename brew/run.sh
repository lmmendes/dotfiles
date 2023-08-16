#!/usr/bin/env bash
set -e
BASE_DIR=$(dirname "$(readlink -f "$0")")
arch -arm64 "${BASE_DIR}/run-brew.sh" "${BASE_DIR}/Brewfile"
