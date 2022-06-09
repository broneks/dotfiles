local o = vim.opt
local g = vim.g
local d = vim.diagnostic
local cmd = vim.cmd
local bg = require('./utils').bg
local fg = require('./utils').fg
local fg_bg = require('./utils').fg_bg

o.encoding = 'utf8'
o.termguicolors = true

-- Visual
o.background = 'light'
o.title = true
o.laststatus = 3
o.showmode = false
o.number = true
o.numberwidth = 4
o.relativenumber = true
o.scrolloff = 8
o.sidescrolloff = 8
o.cmdheight = 2
o.cursorline = true
o.signcolumn = 'yes'

-- Text editing
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true
o.wrap = false

-- Search
o.incsearch = true

-- Buffers
o.hidden = true
o.splitbelow = true
o.splitright = true

-- Experience
o.errorbells = false
o.swapfile = false
o.backup = false
o.writebackup = false
o.undofile = true
o.undodir = os.getenv('HOME') .. '/.vim/undodir'

-- Autocomplete
o.completeopt = { 'menuone', 'noselect' }

-- Popup
o.pumheight = 10 -- after which it scrolls

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
o.updatetime = 300
o.timeoutlen = 250

-- Don't pass messages to |ins-completion-menu|.
o.shortmess:append('cI')

-- Yank to clipboard
o.clipboard:append('unnamedplus')

-- Leader
vim.api.nvim_set_keymap('', '<space>', '<nop>', { noremap = true, silent = true })

g.mapleader = ' '
g.maplocalleader = ' '

-- no inline errors
d.config({ virtual_text = false })

-- gutter signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- colorscheme
cmd('syntax on')
cmd('colorscheme Papercolor')

-- highlights
bg('Pmenu', 'none') 
bg('LineNr', 'none')
bg('CursorLineNr', 'none')
bg('NonText', 'none')
bg('SpecialKey', 'none')
bg('SignColumn', 'none')
bg('EndOfBuffer', 'none')
bg('HorizontalSplit', 'none')
---
fg('netrwDir', '#5eacd3')
fg('qfFileName', '#aed75f')
fg('Folded', 'none')
---
fg_bg('VertSplit', '#77747f', 'none')
