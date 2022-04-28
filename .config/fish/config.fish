if status is-interactive
    # Path

    fish_add_path /usr/local/bin
    fish_add_path {$HOME}/.yarn/bin
    fish_add_path {$HOME}/.config/yarn/global/node_modules/.bin

    # General

    set -Ux TERM      xterm-256color
    set -Ux BAT_THEME 1337

    set -Ux PAGER  less
    set -Ux EDITOR nvim
    set -Ux VISUAL nvim

    # Repos

    set -Ux C   {$HOME}/base/coursera
    set -Ux W   {$C}/web
    set -l  B   {$W}/static/bundles
    set -Ux PAY {$B}/payments
    set -Ux PUR {$B}/my-purchases-graphql
    set -Ux INF {$C}/infra-services
    set -Ux PRO {$C}/payment-processors-application

    # Dotfiles

    alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

    # Neovim

    set -Ux VIMCON {$HOME}/.config/nvim

    alias vim nvim
    alias v   'nvim .'
    alias vw  'cd {$W} && nvim .'

    # Tmux
    
    alias tn 'tmux new'
    alias ta 'tmux a'

    # Java
    
    set -Ux JAVA_HOME $(/usr/libexec/java_home)

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
    alias ys 'yarn snowpack:serve'

    # Fish

    function fish_greeting
        echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
    end

    set theme_color_scheme 'Base16 Eighties'
end
