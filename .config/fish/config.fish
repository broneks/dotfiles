if status is-interactive
    # Path

    fish_add_path /usr/local/bin
    fish_add_path /usr/local/lib/node_modules/.bin
    fish_add_path {$HOME}/.nvm/versions/node/(nvm current)/lib/node_modules/.bin
    fish_add_path {$HOME}/.yarn/bin
    fish_add_path {$HOME}/.config/yarn/global/node_modules/.bin
    fish_add_path {$HOME}/.cargo/bin

    # General

    set -Ux PAGER  less
    set -Ux EDITOR nvim
    set -Ux VISUAL nvim

    alias ls  'ls -p -G'
    alias la  'ls -A'
    alias ll  'ls -l'
    alias lla 'll -A'

    # TODO: Repos

    # Dotfiles

    alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

    # Neovim

    set -Ux VIMCON {$HOME}/.config/nvim

    alias vim nvim
    alias v   'nvim .'

    # Tmux
    
    alias tn 'tmux new'
    alias ta 'tmux a'

    # Java
    
    # set -Ux JAVA_HOME $(/usr/libexec/java_home)

    # Node
    
    set -Ux NODE_PATH    /usr/local/lib/node_modules
    set -gx NODE_OPTIONS --max-old-space-size=4096
    set -Ux NVM_DIR      {$HOME}/.nvm
    function nvm
        bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
    end

    # Yarn
    
    alias y  yarn
    alias yi 'yarn install'
    alias ys 'yarn start'

    # Fish

    set fish_greeting ''
end

source /Users/bronek/.docker/init-fish.sh || true # Added by Docker Desktop
