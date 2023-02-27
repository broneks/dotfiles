return {
  {
    'EdenEast/nightfox.nvim',
    opts = {
      options = {
        transparent = false
      },
    },
    priority = 1000,
    config = function()
      vim.cmd 'colorscheme duskfox'
    end,
  },
  {
    'folke/tokyonight.nvim',
    opts = {
      transparent = true,
      terminal_colors = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
      sidebars = { 'qf', 'help' },
      day_brightness = 0.3,
    },
  },
}
