local cmd = vim.cmd;

function set_colorscheme()
  cmd [[ colorscheme duskfox ]]
end

return {
  {
    'EdenEast/nightfox.nvim',
    opts = {
      options = {
        transparent = false,
      },
    },
    priority = 1000,
    config = set_colorscheme,
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
