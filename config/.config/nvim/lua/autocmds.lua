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
    autocmd! BufWritePre *.js,*.jsx,*.ts,*.tsx undojoin | Neoformat
    autocmd! BufWritePre *.js,*.jsx,*.ts,*.tsx EslintFixAll
  augroup END
]]

-- go.nvim
local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

-- git-conflict.nvim
---- co — choose ours
---- ct — choose theirs
---- cb — choose both
---- c0 — choose none
---- ]x — move to previous conflict
---- [x — move to next conflict
vim.api.nvim_create_autocmd('User', {
  pattern = 'GitConflictDetected',
  callback = function()
    vim.notify('Conflict detected in '..vim.fn.expand('<afile>'))
    vim.keymap.set('n', 'cww', function()
      engage.conflict_buster()
      create_buffer_local_mappings()
    end)
  end
})
