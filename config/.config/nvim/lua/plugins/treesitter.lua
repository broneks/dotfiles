return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
  },
  -- 'nvim-treesitter/nvim-treesitter-textobjects',
  -- {
  --   'aaronik/treewalker.nvim',
  --   opts = {
  --     highlight = true, -- Whether to briefly highlight the node after jumping to it
  --     highlight_duration = 250, -- How long should above highlight last (in ms)
  --   }
  -- },
}
