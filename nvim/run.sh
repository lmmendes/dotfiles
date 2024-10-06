#!/usr/bin/env bash
set -ex

curl -fLo "${HOME}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
