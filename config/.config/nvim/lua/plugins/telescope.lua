return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  {
    'princejoogie/dir-telescope.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
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
        sorting_strategy = 'ascending',
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
          '--glob=!src/generated/',
        },
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' },
        path_display = { truncate = 2 }
      },
      pickers = {
        find_files = {
          theme = 'ivy',
        },
        live_grep = {
          theme = 'ivy',
        },
        resume = {
          theme = 'ivy',
        },
        buffers = {
          theme = 'ivy',
        },
        colorscheme = {
          theme = 'ivy',
        },
        help_tags = {
          theme = 'ivy',
        },
        oldfiles = {
          theme = 'ivy',
        },
      },
    },
    init = function()
      local telescope = require('telescope')

      telescope.load_extension('fzf')
      telescope.load_extension('dir')
    end,
  },
  {
    'stevearc/dressing.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
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
