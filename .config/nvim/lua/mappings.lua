-- Pane navigation
nnoremap('<C-J>', '<C-W><C-J>')
nnoremap('<C-K>', '<C-W><C-K>')
nnoremap('<C-L>', '<C-W><C-L>')
nnoremap('<C-H>', '<C-W><C-H>')

-- Line navigation
nnoremap('H', '^')
nnoremap('L', '$')
nnoremap('j', 'gj')
nnoremap('k', 'gk')

-- Yank everything after cursor
nnoremap('Y', 'y$')

-- Line shifting
nnoremap('<leader>j', ':m .+1<cr>==')
nnoremap('<leader>k', ':m .-2<cr>==')
vnoremap('J', [[:m '>+1<cr>gv=gv]])
vnoremap('K', [[:m '<-2<cr>gv=gv]])
vnoremap('p', [["_dP]])

-- Paste
nnoremap('<leader>p', ':pu<cr>')
nnoremap('<leader>P', ':pu!<cr>')

-- Stay in indent mode
vnoremap('<', '<gv')
vnoremap('>', '>gv')

-- Macro remap to something more intentional
nnoremap('Q', '<nop>')
nnoremap('q', '<nop>')
nnoremap('<leader><leader>q', 'q')

-- This unsets the "last search pattern" register by hitting return
nnoremap('<cr>', ':noh<cr><cr>')

-- Buffer cleanup
nnoremap('<leader>bd', ':Bdelete other<cr>')

-- Harpoon man
nnoremap('<space><space>f', [[:lua require('harpoon.ui').toggle_quick_menu()<cr>]])
nnoremap('<space><space>g', [[:lua require('harpoon.mark').add_file()<cr>]])
nnoremap('<space><space>j', [[:lua require('harpoon.ui').nav_file(1)<cr>]])
nnoremap('<space><space>k', [[:lua require('harpoon.ui').nav_file(2)<cr>]])
nnoremap('<space><space>l', [[:lua require('harpoon.ui').nav_file(3)<cr>]])
nnoremap('<space><space>;', [[:lua require('harpoon.ui').nav_file(4)<cr>]])

-- Tree 
nnoremap('<C-x>', ':NvimTreeToggle<cr>')
nnoremap([[<C-\>]], ':NvimTreeFindFile<cr>')

-- Git
nnoremap('<leader>gg', ':LazyGit<cr>')
nnoremap('<leader>gh', ':diffget //2<cr>') -- bring in changes from upstream (left side)
nnoremap('<leader>gl', ':diffget //3<cr>') -- bring in changes from head (right side)

-- Telescope
nnoremap('<leader>ff', '<cmd>Telescope find_files<cr>')
nnoremap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nnoremap('<leader>fb', '<cmd>Telescope buffers<cr>')
nnoremap('<leader>fm', '<cmd>Telescope harpoon marks<cr>')
nnoremap('<leader>fc', '<cmd>Telescope colorscheme<cr>')
nnoremap('<leader>fh', '<cmd>Telescope help_tags<cr>')
nnoremap('<leader>fe', '<cmd>Telescope commands<cr>')

-- lab
nnoremap('<leader>bb', [[:lua require('./lab/print_filename').printFilename()<cr>]])
