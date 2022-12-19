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
o.background = 'dark'
o.title = true
o.laststatus = 3
o.showmode = false
o.number = true
o.numberwidth = 4
o.relativenumber = true
o.scrolloff = 8
o.sidescrolloff = 8
o.cursorline = true
o.signcolumn = 'yes'
o.ch = 1 -- command height

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

-- Syntax
cmd 'syntax on'

-- Filetype
cmd 'filetype plugin on'

-- Tree
g.loaded = 1
g.loaded_netrwPlugin = 1

-- Note
g.vimwiki_list = {{ path = '~/vimwiki/', syntax = 'markdown', ext = '.md' }}

-- no inline errors
d.config({ virtual_text = false })

-- gutter signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Seek
cmd 'command! -nargs=1 Seek noautocmd vimgrep /<args>/gj `git ls-files` | cw'

-- highlights
bg('Normal', 'none')
bg('NormalFloat', 'none')
bg('NonText', 'none')
bg('Menu', 'none') 
bg('Pmenu', 'none') 
bg('LineNr', 'none')
bg('CursorLineNr', 'none')
bg('SpecialKey', 'none')
bg('SignColumn', 'none')
bg('EndOfBuffer', 'none')
bg('HorizontalSplit', 'none')
bg('Question', 'none')
bg('QuickFixLine', 'none')
bg('Tooltip', 'none')
---
fg('netrwDir', '#5eacd3')
fg('qfFileName', '#aed75f')
fg('Folded', 'none')
---
fg_bg('VertSplit', '#524f57', 'none')

-- Colorscheme
cmd 'colorscheme carbonfox'
