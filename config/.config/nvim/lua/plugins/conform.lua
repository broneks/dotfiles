return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        javascript = { 'prettierd', 'prettier', 'oxfmt', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', 'oxfmt', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', 'oxfmt', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', 'oxfmt', stop_after_first = true },
        json = { 'prettierd', 'prettier', 'oxfmt', stop_after_first = true },
      },
    },
  },
}
