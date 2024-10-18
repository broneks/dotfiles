function set_colorscheme()
  vim.cmd.colorscheme 'duskfox'
end

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
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
      })
      set_colorscheme()
    end
  },
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
    'Verf/deepwhite.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      low_blue_light = true,
    },
  },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
}
