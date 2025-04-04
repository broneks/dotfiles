inoremap('<C-c>', '<Esc>')

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
-- nnoremap('<leader>y', [["+y]])
-- vnoremap('<leader>y', [["+y]])
-- nnoremap('<leader>Y', [["+Y]], { noremap = false })

-- Line shifting
-- nnoremap('<leader>j', ':m .+1<cr>==')
-- nnoremap('<leader>k', ':m .-2<cr>==')
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

-- Git diff
nnoremap('gj', '<cmd>diffget //2<cr>')
nnoremap('gk', '<cmd>diffget //3<cr>')

--- Plugins ---

-- Plugin: Spectre search
nnoremap('<leader>S', [[:lua require('spectre').open()<cr>]])
nnoremap('<leader>sw', [[:lua require('spectre').open_visual({select_word=true})<cr>]])
vnoremap('<leader>s', [[<esc>:lua require('spectre').open_visual()<cr>]])
nnoremap('<leader>sp', [[viw:lua require('spectre').open_file_search()<cr>]])

-- Plugin: Toggle bool
nnoremap('<C-t>', [[<cmd>lua require'toggle-bool'.toggle_bool()<cr>]])

-- Plugin: Treesj split join
nnoremap('tt', ':TSJToggle<cr>')
nnoremap('ts', ':TSJSplit<cr>')
nnoremap('tj', ':TSJJoin<cr>')

-- Plugin: Nvim tree
nnoremap('<C-x>', ':NvimTreeToggle<cr>')
nnoremap([[<C-\>]], ':NvimTreeFindFile<cr>')
nnoremap('<C-s>', [[<cmd>lua require('nvim-tree.api').node.open.horizontal()<cr>]])
nnoremap('<BS>', [[<cmd>lua require('nvim-tree.api').node.navigate.parent_close()<cr>]])

-- Plugin: Git
nnoremap('<leader>gg', ':LazyGit<cr>')
nnoremap('gb', ':G blame<cr>')

-- Plugin: Telescope
nnoremap('<leader>ff', ':Telescope find_files<cr>')
nnoremap('<leader>fd', ':Telescope dir find_files<cr>')
nnoremap('<leader>fg', ':Telescope live_grep<cr>')
nnoremap('<leader>gd', ':Telescope dir live_grep<cr>')
nnoremap('<leader>fr', ':Telescope resume<cr>')
nnoremap('<leader>fb', ':Telescope buffers<cr>')
nnoremap('<leader>fc', ':Telescope colorscheme<cr>')
nnoremap('<leader>fh', ':Telescope help_tags<cr>')
nnoremap('<leader>fe', ':Telescope oldfiles<cr>')
nnoremap('<leader>ft', [[<cmd>lua require('ror.commands').list_commands()<cr>]])

-- Plugin: Debug
nnoremap('<F5>', [[<cmd>lua require'dap'.continue()<cr>]])
nnoremap('<F9>', [[<cmd>lua require'dap'.step_over()<cr>]])
nnoremap('<F10>', [[<cmd>lua require'dap'.step_into()<cr>]])
nnoremap('<F12>', [[<cmd>lua require'dap'.step_out()<cr>]])
nnoremap('<leader>b', [[<cmd>lua require'dap'.toggle_breakpoint()<cr>]])
nnoremap('<leader>B', [[<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>]])
nnoremap('<leader>lp', [[<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>]])
nnoremap('<leader>dl', [[<cmd>lua require'dap'.run_last()<cr>]])
nnoremap('<leader>da', [[<cmd>lua require'debug_helper'.attach()<cr>]])
nnoremap('<leader>dA', [[<cmd>lua require'debug_helper'.attachToRemote()<cr>]])
nnoremap('<leader>dn', [[<cmd>lua require'dap'.run_to_cursor()<cr>]])
nnoremap('<leader>dc', [[<cmd>lua require'dap'.terminate();require('dapui').close()<cr>]])
nnoremap('<leader>db', [[<cmd>lua require'dap'.clear_breakpoints()<cr>]])
nnoremap('<leader>de', [[<cmd>lua require'dap'.set_exception_breakpoints({'all'})<cr>]])
nnoremap('<leader>di', [[<cmd>lua require'dap.ui.widgets'.hover()<cr>]])
nnoremap('<leader>?', [[<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<cr>]])
nnoremap('<leader>dk', [[<cmd>lua require'dap'.up()<cr>zz<cr>]])
nnoremap('<leader>dj', [[<cmd>lua require'dap'.down()<cr>zz<cr>]])
nnoremap('<leader>dr', [[<cmd>lua require'dap'.repl.toggle({}, 'vsplit')<CR><C-w>l<cr>]])

-- Plugin: Neotest
nnoremap('<leader>tf', [[<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<cr>]])
nnoremap('<leader>tb', [[<cmd>lua require'neotest'.run.run()<cr>]])
nnoremap('<leader>td', [[<cmd>lua require'neotest'.run.run({strategy = 'dap'})<cr>]])

-- Plugin: Persistence
nnoremap('<leader>qs', [[<cmd>lua require('persistence').load()<cr>]]) -- restore the session for the current directory
nnoremap('<leader>ql', [[<cmd>lua require('persistence').load({ last = true })<cr>]]) -- restore the last session
nnoremap('<leader>qd', [[<cmd>lua require('persistence').stop()<cr>]]) -- stop Persistence => session won't be saved on exit

-- Plugin: YankBank
nnoremap('<leader>y', [[<cmd>YankBank<cr>]])

-- Plugin: Neogen
nnoremap('gcg', [[<cmd>lua require('neogen').generate()<cr>]])

-- Plugin: Treewalker
nnoremap('<leader>N', ':Treewalker Left<CR>')
nnoremap('<leader>n', ':Treewalker Right<CR>')
