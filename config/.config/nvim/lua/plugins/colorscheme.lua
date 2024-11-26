function set_colorscheme()
  vim.cmd.colorscheme 'deepwhite'
  vim.opt.background = 'light'
end

function is_bg_dark()
  local colorscheme = vim.g.colors_name

  return vim.o.background == 'dark'
    or colorscheme == 'dawnfox'
    or colorscheme == 'dayfox'
    or colorscheme == 'dayfox-night'
    or colorscheme == 'deepwhite'
end

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        transparent = is_bg_dark(),
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
      transparent = is_bg_dark(),
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
        transparent = is_bg_dark(),
      },
    },
  },
  {
    'Verf/deepwhite.nvim',
    lazy = false,
    priority = 1000,
    opts = true,
  },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = is_bg_dark(),
    },
  },
}
