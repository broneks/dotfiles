# General
function parse_git_branch() {
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p' | head -c 40
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{#ED8796}'
COLOR_DIR=$'%F{#A6DA95}'
COLOR_GIT=$'%F{#8AADF4}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

# export TERM=xterm-256color
export BAT_THEME="1337"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.cargo/bin:$PATH"

# Repos

export BASE="$HOME/draft"
export C="$BASE/contentfly"
export D="$BASE/draft"

# Dotfiles

# https://atlassian.com/git/tutorials/dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Neovim

export VIMCON="$HOME/.config/nvim"
export EDITOR='nvim'
export VISUAL="$EDITOR"

alias vim='nvim'
alias v='nvim .'
alias vc='vim $C'
alias vd='vim $D'

# Tmux

alias tn='tmux new'
alias ta='tmux a'

export ZSH_TMUX_AUTOSTART=true

# Java

# export JAVA_HOME=$(/usr/libexec/java_home)

# Node

export NODE_PATH="/usr/local/lib/node_modules"
export NODE_OPTIONS=--max-old-space-size=4096
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Yarn

alias y='yarn'
alias yi='yarn install --ignore-scripts'
alias ys='yarn start'

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
alias lf='docker-compose logs -f'
alias up='docker-compose up -d'
alias stop='docker-compose stop'
alias ps='docker-compose ps'
alias worker='docker-compose restart worker'

alias dab='de app bash'
alias rap='dc restart app'
alias lap='dklf draft_app'

# Chrome

alias chromedebug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222'

# ZSH

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  tmux
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
