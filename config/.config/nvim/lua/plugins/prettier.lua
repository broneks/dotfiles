return {
  -- code formatting
  {
    'sbdchd/neoformat',
    config = function()
      vim.g.neoformat_try_node_exe = 1
      vim.g.neoformat_enabled_javascript = {'prettier'}
      vim.g.neoformat_enabled_typescript = {'prettier'}
    end,
  },
}
