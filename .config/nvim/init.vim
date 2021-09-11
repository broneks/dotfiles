set encoding=utf8

" Visual
set background=dark
set noshowmode
set number
set relativenumber
set scrolloff=8
set signcolumn=yes
set cmdheight=2

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
set shortmess+=c

call plug#begin("~/.vim/plugged")

" Prettier
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'scss', 'json', 'markdown', 'yaml', 'html'] }

" Search
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Typescript
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Theme
Plug 'ajmwagar/vim-deus'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File tree
Plug 'scrooloose/nerdtree'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'

" Git
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'

" Comment out
Plug 'tpope/vim-commentary'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'neoclide/coc-eslint'

call plug#end()

let mapleader = " "

let g:airline_section_x=''
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='base16_classic'

if (has("termguicolors"))
  set termguicolors
endif
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax enable

colorscheme deus 

highlight Normal guibg=none
highlight SignColumn guibg=none
highlight ColorColumn ctermbg=0 guibg=grey
highlight CursorLineNR guibg=None
highlight Normal guibg=none
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeIgnore = ['node_modules']
let NERDTreeStatusLine='NERDTree'
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:prettier#autoformat_config_present = 1
let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#autoformat_require_pragma = 0

if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m
endif

nnoremap <silent> <C-a> :NERDTreeToggle<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-l> :Buffers<CR>
nnoremap <leader>pv :Vex<CR>
nnoremap <silent> <leader>G :LazyGit<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap Y y$
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

source ~/.config/nvim/coc.vim
