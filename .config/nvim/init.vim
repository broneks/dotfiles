set scrolloff=8
set number
set relativenumber
set tabstop=2
set softtabstop=2
set nowrap
set shiftwidth=2
set expandtab
set smartindent
set encoding=utf8
set nohlsearch
set hidden
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set cmdheight=2
set suffixesadd=.js,.jsx,.ts,.tsx
set splitright
set splitbelow

call plug#begin("~/.vim/plugged")

" Prettier
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Search
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'

" Javascript
Plug 'pangloss/vim-javascript'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'HerringtonDarkholme/yats.vim'

" GraphQL
Plug 'jparise/vim-graphql'

" Theme
Plug 'gruvbox-community/gruvbox'
Plug 'rktjmp/lush.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'folke/zen-mode.nvim'

" File tree
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'

" Git
Plug 'tpope/vim-fugitive'

" Comment out
Plug 'tpope/vim-commentary'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch':'release'}

call plug#end()

" Coc
let g:coc_global_extensions = ['coc-tsserver',
\'coc-python',
\ 'coc-pydocstring',
\ 'coc-json',
\ 'coc-html-css-support',
\ 'coc-css',
\ 'coc-sql',
\ 'coc-yaml']

" Theme
let g:airline#extensions#coc#enabled = 0
let g:airline_section_x=''
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_gruvbox_dark_soft'

lua << EOF
  require("zen-mode").setup {
    window = {
      backdrop = 0.4,
      width = 160,
    }
  }
EOF

if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme gruvbox
highlight Normal guibg=none
highlight SignColumn guibg=none
let g:gruvbox_contrast_dark='hard'

" File tree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeIgnore = ['node_modules']
let NERDTreeStatusLine='NERDTree'
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <C-a> :NERDTreeToggle<CR>

" Prettier
let g:prettier#autoformat_config_present = 1
let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#autoformat_require_pragma = 0

" Remaps
let mapleader = " "

nnoremap <leader>pv :Vex<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>kz :ZenMode<CR>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
