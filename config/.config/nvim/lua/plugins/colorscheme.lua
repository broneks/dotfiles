local cmd = vim.cmd;

function set_colorscheme()
  cmd [[ colorscheme tokyonight ]]
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
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      terminal_colors = true,
      style = 'moon',
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
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
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup()
    end,
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
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    'ray-x/aurora',
    init = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
    end,
    lazy = false,
    priority = 1000,
  },
  {
    'NTBBloodbath/doom-one.nvim',
    lazy = false,
    priority = 1000,
  },
}
