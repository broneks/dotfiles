-- Pane navigation
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')

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

-- Quickfix
nnoremap(']q', ':cnext<cr>')
nnoremap('[q', ':cprev<cr>')

-- Buffers
nnoremap('<tab>', ':bnext<cr>')
nnoremap('<s-tab>', ':bprev<cr>')
nnoremap('<leader>bd', ':Bdelete other<cr>')

-- Toggle values
nnoremap('<C-s>', ':ToggleBool<cr>')

-- Harpoon
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
nnoremap('gb', ':G blame<cr>')

-- Telescope
nnoremap('<leader>ff', ':Telescope find_files<cr>')
nnoremap('<leader>fg', ':Telescope live_grep<cr>')
nnoremap('<leader>fb', ':Telescope buffers<cr>')
nnoremap('<leader>fm', ':Telescope harpoon marks<cr>')
nnoremap('<leader>fc', ':Telescope colorscheme<cr>')
nnoremap('<leader>fh', ':Telescope help_tags<cr>')
nnoremap('<leader>fe', ':Telescope oldfiles<cr>')
