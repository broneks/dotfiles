return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      lazy = true,
    },
    lazy = false,
    config = function()
      local lualine = require('lualine')

      local colors = {
        bg       = '#24273A', -- tokyonight: '#1a1b26', -- nightfox: '#24273A', other: '#202328'
        fg       = '#bbc2cf',
        yellow   = '#EED49F', -- #ECBE7B',
        cyan     = '#8AADF4', -- '#008080',
        darkblue = '#081633',
        green    = '#A6DA95', -- #98be65',
        orange   = '#FF8800',
        violet   = '#a9a1e1',
        magenta  = '#c678dd',
        blue     = '#bbc2cf', -- '#51afef',
        red      = '#ED8796', -- #ec5f67',
      }

      local conditions = {
        buffer_not_empty = function()
          local filename = vim.fn.expand('%:t')
          local is_empty = vim.fn.empty(filename) ~= 1
          local is_nvim_tree = string.find(filename, 'NvimTree') ~= nil

          return not is_empty or not is_nvim_tree
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand('%:p:h')
          local gitdir = vim.fn.finddir('.git', filepath .. ';')
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      local config = {
        options = {
          globalstatus = true,
          -- Disable sections and component separators
          component_separators = '',
          section_separators = '',
          theme = {
            -- We are going o use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
          },
        },
        sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {"require'lsp_status'.status()"},
          -- These will be filled later
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      -- Inserts a component in lualine_c at left section
      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- Inserts a component in lualine_x ot right section
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      ins_left {
        function()
          -- return '▊'
          return ''
        end,
        color = { fg = colors.blue }, -- Sets highlighting of component
        padding = { left = 0, right = 1 }, -- We don't need space before this
      }

      ins_left {
        -- mode component
        function()
          -- return ''
          return ''
        end,
        color = function()
          -- auto change color according to neovims mode
          local mode_color = {
            n = colors.green,
            i = colors.red,
            v = colors.blue,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
          }
          return { fg = mode_color[vim.fn.mode()] }
        end,
        padding = { right = 1 },
      }

      ins_left {
        'branch',
        icon = '',
        color = { fg = colors.violet },
      }

      ins_left {
        'filename',
        path = 1,
        cond = conditions.buffer_not_empty,
        color = { fg = colors.magenta },
      }

      ins_left { 'location' }

      ins_left {
        'diagnostics',
        sources = { 'nvim_diagnostic', 'nvim_lsp' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.cyan },
        },
      }

      -- Insert mid section. You can make any number of sections in neovim :)
      -- for lualine it's any number greater then 2
      ins_left {
        function()
          return '%='
        end,
      }

      local dap_status_ok, dap = pcall(require, 'dap')

      ins_right {
        function()
          if not dap_status_ok then
            return
          end

          return dap.status()
        end,
        color = { fg = colors.fg },
      }

      ins_right {
        'diff',
        -- symbols = { added = ' ', modified = '柳 ', removed = ' ' },
        -- jia1  = add
        -- bian4 = change
        -- jian3 = reduce
        symbols = { added = '加 ', modified = '變 ', removed = '減 ' },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      }

      ins_right {
        'o:encoding', -- option component same as &encoding in viml
        fmt = string.upper, -- I'm not sure why it's upper case either ;)
        cond = conditions.hide_in_width,
        color = { fg = colors.fg },
      }

      -- ins_right {
      --   'fileformat',
      --   fmt = string.upper,
      --   icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
      --   color = { fg = colors.fg },
      -- }

      ins_right {
        'filesize',
        cond = conditions.buffer_not_empty,
      }

      ins_right { 'progress', color = { fg = colors.blue } }

      ins_right {
        function()
          -- return '▊'
          return ''
        end,
        color = { fg = colors.blue },
        padding = { left = 1 },
      }

      local lsp_client_names = {
        cssls = 'css',
        cssmodules_ls = 'css',
        tsserver = 'js',
        eslint = 'es',
        graphql = 'gql',
        jsonls = 'json',
        yamlls = 'yml',
        sqlls = 'sql',
        vuels = 'vue',
        rust_analyzer = 'rust',
        denols = 'deno',
      }

      -- ins_right {
      --   -- Lsp server name
      --   function()
      --     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      --     local clients = vim.lsp.get_active_clients()

      --     if next(clients) == nil then
      --       return 'No Lsp'
      --     end

      --     return 'Lsp'
      --   end,
      --   color = { fg = colors.blue },
      -- }

      ins_right {
        -- Lsp server name
        function()
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()

          if next(clients) == nil then
            return ''
          end

          local names = {}

          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              table.insert(names, lsp_client_names[client.name] or client.name)
            end
          end

          return '| ' .. table.concat(names, ',')
        end,
        color = { fg = colors.blue },
      }

      lualine.setup(config)
    end,
  },
}
