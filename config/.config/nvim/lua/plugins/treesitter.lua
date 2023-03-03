return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'html',
          'css',
          'javascript',
          'typescript',
          'tsx',
          'vue',
          'json',
          'markdown',
          'lua',
        },
        highlight = {
          enable = true,
        },
      })
    end,
  },
  'nvim-treesitter/nvim-treesitter-textobjects',
}
