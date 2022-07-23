#!/usr/bin/env bash

# bare repo

# git clone --bare git@github.com:broneks/dotfiles.git $HOME/.cfg
# function config {
#    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
# }
# mkdir -p .config-backup
# config checkout
# if [ $? = 0 ]; then
#   echo "Checked out config.";
#   else
#     echo "Backing up pre-existing dot files.";
#     config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
# fi;
# config checkout
# config config status.showUntrackedFiles no

# zsh

which zsh 1>&/dev/null
if [[ $? != 0 ]] ; then
  echo "Installing zsh..."

  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "zsh is already installed!"
fi

# chsh -s /usr/local/bin/fish

# Homebrew

which brew 1>&/dev/null
if [[ $? != 0 ]] ; then
  echo "Installing Homebrew..."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ $? != 0 ]] ; then
    echo "Something went wrong. Exiting..." && exit 1
  fi
else
  echo "Homebrew is already installed!"
fi

# tmux conf

if [[ ! -d $HOME/.tmux ]] ; then
  echo "Installing tmux conf..."

  git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux
  ln -s -f $HOME/.tmux/.tmux.conf
  # cp $HOME/.tmux/.tmux.conf.local $HOME
else
  echo "tmux conf is already installed!"
fi

if [ ! -d "${HOME}/.nvm" ] ; then
  echo "Installing nvm..."
  
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
else
  echo "nvm is already installed!"
fi
