#!/usr/bin/env bash
set -e
BASE_DIR=$(dirname "$(readlink -f "$0")")

git config --global gpg.format ssh
git config --global user.signingkey $HOME/.ssh/id_ed25519.pub
git config --global commit.gpgsign true
git config --global gpg.ssh.allowedSignersFile ~/.ssh/allowed_signers
# git config --global core.excludesfile $HOME/.gitignore
