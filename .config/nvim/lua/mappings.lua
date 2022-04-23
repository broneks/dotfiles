-- Tree 
nnoremap('<C-x>', ':NvimTreeToggle<CR>')
nnoremap([[<C-\>]], ':NvimTreeFindFile<CR>')

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
nnoremap('<leader>fm', '<cmd>Telescope harpoon marks<cr>')
nnoremap('<leader>fc', '<cmd>Telescope colorscheme<cr>')
nnoremap('<leader>fh', '<cmd>Telescope help_tags<cr>')
nnoremap('<leader>fe', '<cmd>Telescope commands<cr>')

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
nnoremap('<leader><leader>q', 'q')
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

-- This unsets the "last search pattern" register by hitting return
nnoremap('<CR>', ':noh<CR><CR>')

-- Paste
nnoremap('<leader>p', ':pu<CR>')
nnoremap('<leader>P', ':pu!<CR>')

-- Harpoon man
nnoremap('<space><space>f', [[:lua require('harpoon.ui').toggle_quick_menu()<CR>]])
nnoremap('<space><space>g', [[:lua require('harpoon.mark').add_file()<CR>]])
nnoremap('<space><space>j', [[:lua require('harpoon.ui').nav_file(1)<CR>]])
nnoremap('<space><space>k', [[:lua require('harpoon.ui').nav_file(2)<CR>]])
nnoremap('<space><space>l', [[:lua require('harpoon.ui').nav_file(3)<CR>]])
nnoremap('<space><space>;', [[:lua require('harpoon.ui').nav_file(4)<CR>]])

-- lab
nnoremap('<leader>bb', [[:lua require('./lab/print_filename').printFilename()<CR>]])
