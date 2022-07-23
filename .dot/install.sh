#!/usr/bin/env bash

which brew 1>&/dev/null
if [[ $? != 0 ]] ; then
  echo "Homebrew is not installed."
else
  echo "Running brew install..."

  brew update
  brew upgrade
  brew install coreutils

  # Libraries 

  brew install --cask google-chrome
  brew install --cask rectangle
  brew install --cask spotify
  brew install --cask slack
  brew install --cask discord
  brew install --cask alacritty

  brew install nvm
  brew install deno
  brew install lua
  brew install rustup-init
  brew install rust-analyzer
  brew install go

  brew install fish
  brew install tmux
  brew install neovim
  brew install lazygit
  brew install ripgrep
  brew install jq

  brew cleanup
fi
