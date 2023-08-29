local cmd = vim.cmd;

function set_colorscheme()
  cmd [[ colorscheme nightfox ]]
end

return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparent = true,
      },
    },
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      terminal_colors = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
      sidebars = { 'qf', 'help' },
      day_brightness = 0.3,
      on_colors = function(colors)
        colors.border = '#3b4561'
      end
    },
  },
  {
    'Verf/deepwhite.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      low_blue_light = true,
    },
    config = set_colorscheme,
  },
}
