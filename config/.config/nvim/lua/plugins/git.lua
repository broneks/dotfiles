return {
  'tpope/vim-fugitive',
  'kdheepak/lazygit.nvim',
  'sindrets/diffview.nvim',

  -- git blame virtual text
  {
    enabled = false,
    'f-person/git-blame.nvim',
    config = function()
      vim.g.gitblame_message_template = ' • <summary> • <author> '
      vim.g.gitblame_delay = 1000
      vim.g.gitblame_message_when_not_committed = ''
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = true,
  },
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = true,
  }
}
