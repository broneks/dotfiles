local g = vim.g
local cmd = vim.cmd

g.lightline = {
  colorscheme = 'deus',
  active = {
    left = {
      {'mode', 'paste'},
      {'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus'}
    }
  },
  component_function = {
    gitbranch = 'FugitiveHead',
    cocstatus = 'coc#status'
  }
}

-- Use autocmd to force lightline update
cmd 'autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()'
