set encoding=utf8

" Visual
set background=dark " terminal bg = #2a2c33, #18191d
set noshowmode
set number
set relativenumber
set scrolloff=8
set signcolumn=yes
set cmdheight=2
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

call plug#begin("~/.vim/plugged")

Plug 'mhinz/vim-startify'

" Music
Plug 'srishanbhattarai/neovim-spotify', { 'do': 'bash install.sh' }

" Search and replace
Plug 'brooth/far.vim'

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

" Theme
Plug 'cormacrelf/vim-colors-github'
Plug 'ajmwagar/vim-deus'
Plug 'folke/zen-mode.nvim'
Plug 'itchyny/lightline.vim'

" File tree
Plug 'scrooloose/nerdtree'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'

" Git
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'

" Comments
Plug 'tpope/vim-commentary'

" HTML
Plug 'tpope/vim-ragtag'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Registers
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }

" Motions
" Plug 'ggandor/lightspeed.nvim' " TODO: remap this

" Intellisense
Plug 'neoclide/coc.nvim', {'branch':'release'}

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

highlight Normal guibg=none ctermbg=none
highlight SignColumn guibg=none ctermbg=none
highlight CursorLineNR guibg=none ctermbg=none
highlight VertSplit guifg=grey guibg=none ctermbg=none
highlight HorizontalSplit guibg=none ctermbg=none
highlight ColorColumn ctermbg=0 guibg=grey
highlight LineNr guifg=#75a077
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f

highlight StartifyHeader  guifg=#75a077
highlight StartifyNumber  guifg=#75a077
highlight StartifySpecial guifg=#5eacd3

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeIgnore = ['node_modules']
let NERDTreeStatusLine='NERDTree'
let g:NERDTreeWinSize=50
" Automaticaly close nvim if NERDTree is only thing left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:prettier#autoformat_config_present = 1
let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#autoformat_require_pragma = 0

let g:far#default_file_mask="**/*.ts,**/*.tsx,**/*.js,**/*.jsx,**/*.json,**/*.css,**/*.scss,***/*.html"
let g:far#enable_undo=1
let g:far#ignore_files=['.gitignore']

nnoremap <silent> <C-a> :NERDTreeToggle<CR>
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

nnoremap <leader>pp <cmd>SpotifyPlay<cr>
nnoremap <leader>ph <cmd>SpotifyPrevious<cr>
nnoremap <leader>pl <cmd>SpotifyNext<cr>
nnoremap <leader>pk <cmd>SpotifyCurrentSong<cr>

nnoremap <leader>pr :Far<SPACE>

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
