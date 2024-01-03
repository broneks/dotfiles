local cmd = vim.cmd;

function set_colorscheme()
  cmd [[ colorscheme kanagawa ]]
end

return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none'
            }
          }
        }
      }
    },
  },
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
        colors.fg_gutter = '#71839b'
      end,
      on_highlights = function(highlights)
        highlights.CursorLineNr.fg = '#e0af68'
      end,
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
