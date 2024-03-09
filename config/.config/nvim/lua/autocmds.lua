local cmd = vim.cmd

-- get rid of border backgrounds
cmd [[
  augroup style
    autocmd! ColorScheme * hi FloatBorder guifg=none guibg=none
  augroup END
]]

-- highlight yank for a brief second for visual feedback
cmd 'autocmd! TextYankPost * lua vim.highlight.on_yank { on_visual = false }'

-- automagically format on save
cmd [[
  augroup fmt
    autocmd!
    autocmd! BufWritePre *.js,*.jsx,*.ts,*.tsx EslintFixAll
    autocmd! BufWritePre *.js,*.jsx,*.ts,*.tsx undojoin | Neoformat
  augroup END
]]
