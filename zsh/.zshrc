# Path

PATH="$HOME/.yarn/bin:$PATH"
PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/Library/Python/3.9/bin:$PATH"
PATH="/opt/homebrew/opt/ruby/bin:$PATH"
PATH="$HOME/.docker/bin:$PATH"
PATH="$(go env GOPATH)/bin:$PATH"
PATH="$HOME/.dotnet/tools:$PATH"

export PATH

# General

export BAT_THEME="1337"
alias cat='bat'
alias rm='echo "rm is disabled, use trash instead."'
alias calc='insect'

# Brew

export HOMEBREW_NO_ENV_HINTS=1
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

export PROMPT="${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ "

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

export ZSH_TMUX_AUTOSTART=true

# Node

export NODE_PATH='/usr/local/lib/node_modules'

# Ruby

# eval "$(rbenv init - zsh)"

# Npm

alias start='npm run start'
alias debug='npm run start:debug'
alias loco='npm run start:local'
alias taco='npx tsc --noEmit'
alias lint='npm run lint:fix'
alias gen='npm run generate'

# Docker

alias dk='docker'
alias dl='docker logs -f'
alias dki='docker images'
alias dks='docker service'
alias dkrm='docker rm'
alias dc='docker compose'
alias de='docker compose exec'
alias dkps="docker ps --format '{{.Names}} --- {{.Status}}'"
alias lf='docker compose logs -f'
alias up='docker compose up -d'
alias stop='docker compose stop'
alias ps='docker compose ps'
alias worker='docker compose restart worker'

# Chrome

alias chromedebug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222'

# Barley

export APP="$HOME/repos/app-client"
export API="$HOME/repos/api-hasura"
export BFF="$HOME/repos/barley-bff"

export APP_CLIENT_PATH="$HOME/repos/app-client/leap.yaml"
export BARLEY_BFF_PATH="$HOME/repos/barley-bff/leap.yaml"

alias ngrok_webhooks="ngrok http --url=moray-square-boar.ngrok-free.app http://localhost:8104"
alias sql_proxy_dev="$HOME/cloud-sql-proxy barley-dev:us-central1:postgres -p 5433"
alias sql_proxy_staging="$HOME/cloud-sql-proxy barley-staging:us-central1:postgres -p 5434"

# Google Cloud

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bronekszulc/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bronekszulc/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bronekszulc/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bronekszulc/google-cloud-sdk/completion.zsh.inc'; fi

# ZSH

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  tmux
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
