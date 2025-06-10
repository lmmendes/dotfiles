#!/usr/bin/env bash
set -e
BASE_DIR=$(dirname "$(readlink -f "$0")")
GIT_CONFIG_DIR="${HOME}/.config/ghostty"

ln -sfv "${BASEDIR}/config" "${GIT_CONFIG_DIR}/config"
