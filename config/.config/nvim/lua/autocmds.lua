local cmd = vim.cmd

cmd 'autocmd ColorScheme * hi Normal ctermbg=none guibg=none'

-- highlight yank for a brief second for visual feedback
cmd 'autocmd! TextYankPost * lua vim.highlight.on_yank { on_visual = false }'

-- automagically format on save
cmd [[
  augroup fmt
    autocmd!
    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx EslintFixAll
    autocmd BufWritePre * try | undojoin | Neoformat | catch /E790/ | Neoformat | endtry
  augroup END
]]
