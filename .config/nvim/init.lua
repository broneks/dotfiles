-- TODO: remove once web repo bumps node version
vim.cmd [[let $PATH = '/Users/bszulc/.nvm/versions/node/v14.18.1/bin:' . $PATH]]

require 'globals'
require 'settings'
require 'plugins'
require 'plugin_configs'

-- TODO: convert to lua or switch to native LSP
vim.cmd [[source ~/.config/nvim/coc.vim]]

require 'mappings'
require 'autocmds'
