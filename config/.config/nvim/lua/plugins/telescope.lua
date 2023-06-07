return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      defaults = {
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'descending',
        file_ignore_patterns = {'node_modules', '@types'},
        layout_strategy = 'vertical',
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          '--glob=!.git/',
        },
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' },
      },
      pickers = {
        find_files = {
          theme = 'ivy',
        }
      },
    },
    init = function()
      local telescope = require('telescope')

      telescope.load_extension('fzf')
    end,
  },
  {
    'stevearc/dressing.nvim',
    opts = {
      input = {
        min_width = { 60, 0.9 },
      },
      select = {
        get_config = function(opts)
          return {
            telescope = require('telescope.themes').get_ivy(),
          }
        end,
      },
    },
  },
}
