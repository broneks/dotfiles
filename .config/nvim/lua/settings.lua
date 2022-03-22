local o = vim.opt
local g = vim.g
local cmd = vim.cmd

o.encoding = 'utf8'
o.termguicolors = true

-- Visual
o.showmode = false
o.number = true
o.relativenumber = true
o.scrolloff = 8
o.cmdheight = 2
o.cursorline = true
o.signcolumn = 'yes'
-- o.fillchars+=vert:\ 

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
o.undodir = '~/.vim/undodir'

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
o.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
o.shortmess:append('cI')

-- Yank to clipboard
o.clipboard:append('unnamedplus')

g.mapleader = ' '

-- au ColorScheme * hi Normal ctermbg=none guibg=none
-- hi Normal guibg=none ctermbg=none
cmd [[
  syntax on

  colorscheme duskfox 

  hi LineNr guibg=none ctermbg=none
  hi Folded guibg=none ctermbg=none
  hi NonText guibg=none ctermbg=none
  hi SpecialKey guibg=none ctermbg=none
  hi SignColumn guibg=none ctermbg=none
  hi EndOfBuffer guibg=none ctermbg=none
  hi HorizontalSplit guibg=none ctermbg=none
  hi CursorLineNR guibg=none ctermbg=none
  hi Pmenu guibg=none ctermbg=none
  hi VertSplit guifg=#8a8a8a guibg=none ctermbg=none
  hi netrwDir guifg=#5eacd3
  hi qfFileName guifg=#aed75f
]]
