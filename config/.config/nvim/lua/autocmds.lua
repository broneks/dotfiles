local cmd = vim.cmd

cmd 'au ColorScheme * hi Normal ctermbg=none guibg=none'

-- highlight yank for a brief second for visual feedback
cmd 'autocmd! TextYankPost * lua vim.highlight.on_yank { on_visual = false }'

-- automagically format on save
cmd 'autocmd BufWritePre *.js,*.ts Neoformat'
