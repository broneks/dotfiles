# General

autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%(5~|%-1~/.../%3~|%4~) %{$reset_color%}%% "

# export TERM=xterm-256color
export BAT_THEME="1337"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Repos

export C="$HOME/base/coursera"

export W=${C}/web
export B=${W}/static/bundles
export PAY=${B}/payments
export PUR=${B}/my-purchases-graphql
export INF=${C}/infra-services
export PRO=${C}/payment-processor-application

# Dotfiles

# https://atlassian.com/git/tutorials/dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Neovim

export VIMCON="$HOME/.config/nvim"
export EDITOR='nvim'
export VISUAL="$EDITOR"

alias vim='nvim'
alias v='nvim .'
alias vw="cd $HOME/base/coursera/web && nvim ."

# Tmux

alias tn='tmux new'
alias ta='tmux a'

export ZSH_TMUX_AUTOSTART=true

# Java

export JAVA_HOME=$(/usr/libexec/java_home)

# Node

export NODE_PATH="/usr/local/lib/node_modules"
export NODE_OPTIONS=--max-old-space-size=4096
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Yarn

alias y='yarn'
alias yi='yarn install --ignore-scripts'
alias ys='yarn snowpack:serve'

# Docker

alias dk='docker'
alias dkl='docker logs'
alias dklf='docker logs -f'
alias dki='docker images'
alias dks='docker service'
alias dkrm='docker rm'
alias dm='docker-machine'
alias dmx='docker-machine ssh'
alias dc='docker-compose'
alias de='docker-compose exec'
alias dkps="docker ps --format '{{.Names}} --- {{.Status}}'"
alias dclf='docker-compose logs -f'
alias lf='dclf'
alias up='docker-compose up -d'
alias stop='docker-compose stop'
alias ps='docker-compose ps'
alias worker='docker-compose restart worker'

# ZSH

export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="avit"

plugins=(
  git
  tmux
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
