return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'c',
          'comment',
          'cmake',
          'css',
          'csv',
          'dockerfile',
          'git_config',
          'gitignore',
          'graphql',
          'go',
          'gomod',
          'gosum',
          'html',
          'javascript',
          'json',
          'lua',
          'markdown',
          'nginx',
          'python',
          'regex',
          'ruby',
          'rust',
          'sql',
          'tmux',
          'tsx',
          'typescript',
          'vue',
        },
        highlight = {
          enable = true,
        },
      })
    end,
  },
  'nvim-treesitter/nvim-treesitter-textobjects',
}
