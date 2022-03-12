#!/usr/bin/env bash

# zsh

which zsh 1>&/dev/null
if [[ $? != 0 ]] ; then
  echo "Installing zsh..."

  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "zsh is already installed!"
fi

# Homebrew

which brew 1>&/dev/null
if [[ $? != 0 ]] ; then
  echo "Installing Homebrew..."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ $? != 0 ]] ; then
    echo "Something went wrong. Exiting..." && exit 1
  fi

  brew update
  brew upgrade
  brew install coreutils

  # Libraries 

  brew tap homebrew/cask-fonts
  brew install --cask font-fira-code
  brew install --cask firefox
  brew install --cask google-chrome
  brew install --cask rectangle
  brew install --cask spotify
  brew install --cask slack
  brew install --cask discord
  brew install --cask alacritty

  brew install nvm
  brew install lua
  brew install rust
  brew install go

  brew install tmux
  brew install neovim
  brew install lazygit
  brew install ripgrep
  brew install spaceship
  brew install sqlite
  brew install spotify-tui

  brew cleanup
else
  echo "Homebrew is already installed!"
fi

# tmux conf

if [[ ! -d ~/.tmux ]] ; then
  echo "Installing tmux conf..."

  git clone https://github.com/gpakosz/.tmux.git ~/.tmux
  ln -s -f ~/.tmux/.tmux.conf
  # cp ~/.tmux/.tmux.conf.local ~
else
  echo "tmux conf is already installed!"
fi
