# General

export TERM=xterm-256color
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

ZSH_THEME="spaceship"

SPACESHIP_GIT_SHOW=false
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=true
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_XCODE_SHOW_GLOBAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_GLOBAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_HASKELL_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_EXEC_TIME_SHOW=false

plugins=(git)

source $ZSH/oh-my-zsh.sh
