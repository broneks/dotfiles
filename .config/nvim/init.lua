require 'globals'
require 'settings'
require 'plugins'

-- TODO: convert to lua or switch to native LSP
vim.cmd [[
  source ~/.config/nvim/coc.vim
]]

require 'plugin_configs'
require 'mappings'
require 'autocmds'
