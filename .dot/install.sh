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

  brew install --cask alacritty
  brew install --cask librewolf
  brew install --cask google-chrome
  brew install --cask amethyst
  brew install --cask insomnia
  brew install --cask slack
  brew install --cask discord
  brew install --cask spotify
  brew install --cask notion
  brew install --cask vlc

  brew install deno
  brew install lua
  brew install rust-analyzer
  brew install go

  brew install tmux
  brew install neovim
  brew install lazygit
  brew install fd
  brew install ripgrep
  brew install jq

  brew cleanup
fi
