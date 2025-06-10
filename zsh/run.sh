#!/usr/bin/env bash
set -e
BASEDIR=$(dirname "$(readlink -f "$0")")

# Create symlinks
ln -sfv "${BASEDIR}/zshrc" "${HOME}/.zshrc"
ln -sfv "${BASEDIR}/zsh_aliases" "${HOME}/.zsh_aliases"

# Create symlinks for private files
ln -sfv "${HOME}/.config/zsh/zsh_env" "${HOME}/.zsh_env"

# Path to Homebrew's zsh
ZSH_PATH="$(brew --prefix)/bin/zsh"

# Add Homebrew's zsh to /etc/shells, so it can be made the default shell
if ! grep -q "$ZSH_PATH" /etc/shells; then
    echo "Adding $ZSH_PATH to /etc/shells..."
    echo "$ZSH_PATH" | sudo tee -a /etc/shells
fi

# Make Homebrew's zsh the default shell if it isn't already.
# Use `dscl` instead of the `$SHELL` variable, because it might not yet be set
# after switching the default shell with `chsh`.
if ! test "$(dscl . -read "$HOME" UserShell | awk '{print $2}')" = "$ZSH_PATH"; then
    chsh -s "$ZSH_PATH"
fi

# fzf keybinding and completions
if ! test -f "$HOME/.fzf.zsh"; then
    echo "Installing fzf keybinding and completions..."
    "$(brew --prefix)"/opt/fzf/install --key-bindings --completion --no-bash --no-update-rc
fi

exec $ZSH_PATH
