#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

target=$HOME/.config/nvim
echo $target
if [ -e $target ]; then
  echo "~${target#$HOME} already exists... skipping"
else
  echo "Creating symlink for nvim"
  ln -s $DIR $target
fi

# Python NeoVim client
pip3 install neovim

# Install plugins
nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall
