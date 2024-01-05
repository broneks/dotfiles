# Path

PATH="$HOME/.yarn/bin:$PATH"
PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/Library/Python/3.9/bin:$PATH"
PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export PATH

# General

export BAT_THEME="1337"
alias cat='bat'
alias rm='echo "rm is disabled, use trash instead."'
alias calc='insect'

# Brew

alias upgrade='brew upgrade && brew cleanup --prune=1 -s'

# Git

alias lg='lazygit'

function parse_git_branch() {
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p' | head -c 40
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{#f7768e}'
COLOR_DIR=$'%F{#81b29a}'
COLOR_GIT=$'%F{#719cd6}'
setopt PROMPT_SUBST

export PROMPT="${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ "

# SomaFM

function fm() {
  if [ -n "$1" ]
  then
    somafm p $1 -n
  else
    somafm p random -n
  fi
}

function fmall() {
  somafm ls
}

function fmtune() {
  somafm -n
}

# Neovim

export VIMCON="$HOME/.config/nvim"
export EDITOR='nvim'
export VISUAL="$EDITOR"

alias vim='nvim'
alias v='vim .'

# Tmux

alias tn='tmux new'
alias ta='tmux a'

export ZSH_TMUX_AUTOSTART=true

# Node

export NODE_PATH='/usr/local/lib/node_modules'
export NODE_OPTIONS=--max-old-space-size=4096
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Ruby

# eval "$(rbenv init - zsh)"

# Yarn

alias y='yarn'
alias ys='yarn start'

# Docker

alias dk='docker'
alias dl='docker logs -f'
alias dki='docker images'
alias dks='docker service'
alias dkrm='docker rm'
alias dm='docker-machine'
alias dmx='docker-machine ssh'
alias dc='docker-compose'
alias de='docker-compose exec'
alias dkps="docker ps --format '{{.Names}} --- {{.Status}}'"
alias lf='docker-compose logs -f'
alias up='docker-compose up -d'
alias stop='docker-compose stop'
alias ps='docker-compose ps'
alias worker='docker-compose restart worker'

# Chrome

alias chromedebug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222'

# Barley

export APP="$HOME/repos/app-client"
export API="$HOME/repos/api-hasura"

alias app="vim $APP"
alias api="vim $API"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bronekszulc/Documents/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bronekszulc/Documents/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bronekszulc/Documents/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bronekszulc/Documents/google-cloud-sdk/completion.zsh.inc'; fi

# ZSH

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  tmux
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
