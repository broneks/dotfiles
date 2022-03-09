require 'globals'
require 'settings'
require 'plugins'

-- TODO: convert to lua or switch to native LSP
vim.cmd [[
  let $PATH = '/Users/bszulc/.nvm/versions/node/v14.18.1/bin:' . $PATH
  source ~/.config/nvim/coc.vim
]]

require 'plugin_configs'
require 'mappings'
require 'autocmds'
