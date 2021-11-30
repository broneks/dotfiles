set encoding=utf8
set t_Co=256

" Visual
set background=dark
set noshowmode
set number
set relativenumber
set scrolloff=8
set signcolumn=yes
set cmdheight=2
set cursorline
" set fillchars+=vert:\ 

" Text editing
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set nowrap

" Search
set nohlsearch
set incsearch

" Buffers
set hidden
set splitbelow
set splitright

" Experience
set noerrorbells
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=cI

" Yank to clipboard
set clipboard+=unnamedplus

call plug#begin("~/.vim/plugged")

Plug 'mhinz/vim-startify'

" Music
Plug 'srishanbhattarai/neovim-spotify', { 'do': 'bash install.sh' }

" Search and replace
" Plug 'brooth/far.vim'

" Prettier
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'scss', 'json', 'markdown', 'yaml', 'html', 'graphql'] }

" Typescript
Plug 'sheerun/vim-polyglot'

" Graphql
Plug 'jparise/vim-graphql'

" Search
Plug 'BurntSushi/ripgrep'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tami5/sqlite.lua'
Plug 'nvim-telescope/telescope-frecency.nvim'

" Theme
Plug 'ajmwagar/vim-deus'
Plug 'folke/zen-mode.nvim'
Plug 'itchyny/lightline.vim'
Plug 'EdenEast/nightfox.nvim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'

" File tree
Plug 'scrooloose/nerdtree'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'preservim/nerdcommenter'

" Git
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'

" Comments
Plug 'tpope/vim-commentary'

" HTML
Plug 'tpope/vim-ragtag'

" Registers
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Buffers
Plug 'Asheq/close-buffers.vim'

call plug#end()

let mapleader = " "

let g:lightline = {
  \   'colorscheme': 'deus',
  \   'active': {
  \     'left': [ ['mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus' ] ]
  \   },
  \   'component_function': {
  \     'gitbranch': 'FugitiveHead',
  \     'cocstatus': 'coc#status'
  \   },
  \ }

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

if (has("termguicolors"))
  set termguicolors
endif
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax enable

colorscheme deus

" specific to the "deus" theme
highlight Normal guibg=none ctermbg=none
highlight LineNr guifg=#75a077
highlight ColorColumn ctermbg=0 guibg=grey
highlight CocHighlightText guifg=#ffb71a guibg=#303030
highlight Pmenu guibg=#2f353a gui=none ctermbg=none
highlight PmenuSbar guibg=#2f353a gui=none ctermbg=none
highlight PmenuThumb guibg=#2f353a gui=none ctermbg=none
highlight NormalFloat guibg=#233646 gui=none ctermbg=none
highlight StartifyHeader  guifg=#75a077
highlight StartifyNumber  guifg=#75a077
highlight StartifySpecial guifg=#5eacd3
highlight NERDTreeCWD guifg=#8a8a8a

highlight CursorLineNR guibg=none ctermbg=none
highlight SignColumn guibg=none ctermbg=none
highlight VertSplit guifg=#8a8a8a guibg=none ctermbg=none
highlight HorizontalSplit guibg=none ctermbg=none
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeIgnore = ['node_modules']
let NERDTreeStatusLine='NERDTree'
let g:NERDTreeWinSize=55

let g:prettier#autoformat_config_present = 1
let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#autoformat_require_pragma = 0

let g:far#default_file_mask="**/*.ts,**/*.tsx,**/*.js,**/*.jsx,**/*.json,**/*.css,**/*.scss,***/*.html"
let g:far#enable_undo=1
let g:far#ignore_files=['.gitignore']

lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules", "@types"} } }

require('telescope').load_extension('frecency')
EOF

nnoremap <silent> <C-x> :NERDTreeToggle<CR>
nnoremap <silent> <C-\> :NERDTreeFind<CR>

nnoremap <leader>z :ZenMode<CR>

nnoremap <leader>gg :LazyGit<CR>
" bring in changes from upstream (left side)
nmap     <leader>gh :diffget //2<CR>
" bring in changes from head (right side)
nmap     <leader>gl :diffget //3<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fm <cmd>Telescope marks<cr>
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fe <cmd>Telescope commands<cr>
nnoremap <leader>fj <cmd>Telescope frecency<cr>

nnoremap <leader>pp <cmd>SpotifyPlay<cr>
nnoremap <leader>ph <cmd>SpotifyPrevious<cr>
nnoremap <leader>pl <cmd>SpotifyNext<cr>
nnoremap <leader>pk <cmd>SpotifyCurrentSong<cr>

nnoremap <leader>pr :Far<SPACE>

nnoremap <leader>bd :Bdelete other<cr>

nnoremap Y y$
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap Q <nop>

noremap <leader>q q
noremap q <nop>
noremap H ^
noremap L $
noremap j gj
noremap k gk

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

source ~/.config/nvim/coc.vim
