#!/usr/bin/env bash

set -e

INSTALLDIR=$PWD

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}


info "Checking for Homebrew installation"
brew="/usr/local/bin/brew"

if [ -f "$brew" ]
then
  success "Homebrew is already installed"
else
  info "Homebrew not found. Installing..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  success "Homebrew installed"
fi

info "Installing Homebrew packages from $brewFile"
./homebrew/install.sh
success "Homebrew packages installed"

info "Configuring MacOS settings"
./macos/set-defaults.sh
success "MacOS settings configured"
