#!/usr/bin/env bash
set -e
BASE_DIR=$(dirname "$(readlink -f "$0")")
GIT_CONFIG_DIR="${HOME}/.config/git"

mkdir -p $GIT_CONFIG_DIR

# Create symlinks
ln -sfv "${BASE_DIR}/gitconfig" "${HOME}/.gitconfig"

ln -sfv "${BASE_DIR}/alias" "${GIT_CONFIG_DIR}/alias"

ln -sfv "${BASE_DIR}/gitignore" "${GIT_CONFIG_DIR}/gitignore"
