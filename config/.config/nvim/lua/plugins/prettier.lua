return {
  {
    'prettier/vim-prettier',
    build = 'yarn install',
    ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'css',
      'scss',
      'json',
      'markdown',
      'yaml',
      'html',
      'graphql',
      'lua',
      'vue',
    },
    init = function()
      vim.g['prettier#autoformat_config_present'] = 1
      vim.g['prettier#config#config_precedence'] = 'prefer-file'
      vim.g['prettier#autoformat_require_pragma'] = 0
      vim.g['prettier#quickfix_enabled'] = 0
    end,
  },
}
