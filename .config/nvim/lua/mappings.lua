-- NERDTree
nnoremap('<C-x>', ':NERDTreeToggle<CR>')
nnoremap([[<C-\>]], ':NERDTreeFind<CR>')

-- ZenMode
nnoremap('<leader>z', ':ZenMode<CR>')

-- Git
nnoremap('<leader>gg', ':LazyGit<CR>')
-- bring in changes from upstream (left side)
nnoremap('<leader>gh', ':diffget //2<CR>')
-- bring in changes from head (right side)
nnoremap('<leader>gl', ':diffget //3<CR>')

-- Telescope
nnoremap('<leader>ff', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nnoremap('<leader>fb', '<cmd>Telescope buffers<cr>')
nnoremap('<leader>fm', '<cmd>Telescope marks<cr>')
nnoremap('<leader>fc', '<cmd>Telescope colorscheme<cr>')
nnoremap('<leader>fh', '<cmd>Telescope help_tags<cr>')
nnoremap('<leader>fe', '<cmd>Telescope commands<cr>')
nnoremap('<leader>fj', '<cmd>Telescope frecency<cr>')

-- Spotify
nnoremap('<leader>pp', '<cmd>SpotifyPlay<cr>')
nnoremap('<leader>ph', '<cmd>SpotifyPrevious<cr>')
nnoremap('<leader>pl', '<cmd>SpotifyNext<cr>')
nnoremap('<leader>pk', '<cmd>SpotifyCurrentSong<cr>')

-- Far
nnoremap('<leader>pr', ':Far<SPACE>')

-- Buffer cleanup
nnoremap('<leader>bd', ':Bdelete other<cr>')

-- Yank everything after cursor
nnoremap('Y', 'y$')

-- Line shifting
nnoremap('<leader>j', ':m .+1<CR>==')
nnoremap('<leader>k', ':m .-2<CR>==')
vnoremap('J', [[:m '>+1<CR>gv=gv]])
vnoremap('K', [[:m '<-2<CR>gv=gv]])

-- Macro remap to something more intentional
nnoremap('Q', '<nop>')
nnoremap('<leader>q', 'q')
nnoremap('q', '<nop>')

-- Line navigation
nnoremap('H', '^')
nnoremap('L', '$')
nnoremap('j', 'gj')
nnoremap('k', 'gk')

-- Pane navigation
nnoremap('<C-J>', '<C-W><C-J>')
nnoremap('<C-K>', '<C-W><C-K>')
nnoremap('<C-L>', '<C-W><C-L>')
nnoremap('<C-H>', '<C-W><C-H>')