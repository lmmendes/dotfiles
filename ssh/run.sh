#!/usr/bin/env bash
set -ex
BASEDIR=$(dirname "$(readlink -f "$0")")
ROOTDIR=$(dirname "${BASEDIR}")

# Create config directory
mkdir -p "${HOME}/.ssh"

# Create symlinks
ln -sfv "${BASEDIR}/config" "${HOME}/.ssh"

# Home configuration
ln -sfv "${HOME}/home/ssh/config_home" "${HOME}/.ssh"

# SSH keys
ln -sfv "${HOME}/home/ssh/id_ed25519" "${HOME}/.ssh/id_ed25519"
ln -sfv "${HOME}/home/ssh/id_ed25519.pub" "${HOME}/.ssh/id_ed25519.pub"

# Allowed allowed_signers for GitHub Commits
ln -sfv "${HOME}/home/ssh/allowed_signers" "${HOME}/.ssh"
