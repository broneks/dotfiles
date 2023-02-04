local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup('plugins', {
  checker = {
    enabled = true,
    frequency = 43200, -- twice a day
  },
  ui = {
    border = 'rounded',
  },
})

require 'globals'
require 'settings'
require 'mappings'
require 'autocmds'
