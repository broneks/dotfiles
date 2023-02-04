return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'javascript', 'typescript' },
      highlight = {
        enable = true
      },
    },
  },
  'nvim-treesitter/nvim-treesitter-textobjects',
}
