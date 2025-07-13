#!/usr/bin/env bash
set -e
BASEDIR=$(dirname "$(readlink -f "$0")")

# Ensure the mise config directory exists
mkdir -p "${HOME}/.config/mise"
mkdir -p "${HOME}/.config/mise/zsh-autocomplete"

# Create the symlink for the config.toml
ln -sfv "${BASEDIR}/config.toml" "${HOME}/.config/mise/config.toml"

# mise trust the new settings
mise trust "${HOME}/.config/mise/config.toml"

# Install all tools/plugins specified in the config
mise install --yes

# install autocomplete
mise completion zsh  > "${HOME}/.config/mise/mise.zsh"

# Remove unused versions and plugins not referenced in mise.toml
mise prune
