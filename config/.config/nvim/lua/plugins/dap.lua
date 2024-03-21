return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require('dap')

      dap.adapters.node2 = {
        type = 'executable',
        command = 'node',
        args = {os.getenv('HOME') .. '/debugger/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
      }

      dap.configurations.javascript = {
        {
          name = 'Launch',
          type = 'node2',
          request = 'launch',
          program = '${file}',
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = 'inspector',
          console = 'integratedTerminal',
        },
        {
          -- For this to work you need to make sure the node process is started with the `--inspect` flag.
          name = 'Attach to process',
          type = 'node2',
          request = 'attach',
          processId = require'dap.utils'.pick_process,
        },
      }

      -- dap.adapters.chrome = {
      --   type = 'executable',
      --   command = 'node',
      --   args = { os.getenv('HOME') .. '/debugger/microsoft/vscode-chrome-debug/out/src/chromeDebug.js' }
      -- }

      -- dap.configurations.javascriptreact = {
      --   {
      --     name = 'Debug (Attach) - Remote',
      --     type = 'chrome',
      --     request = 'attach',
      --     program = '${file}',
      --     cwd = vim.fn.getcwd(),
      --     sourceMaps = true,
      --     trace = true,
      --     protocol = 'inspector',
      --     port = 9222,
      --     webRoot = '${workspaceFolder}'
      --   }
      -- }

      vim.fn.sign_define('DapBreakpoint', { texthl='DiagnosticSignWarn', numhl='DiagnosticSignWarn' })
      vim.fn.sign_define('DapBreakpointCondition', { texthl='DiagnosticSignWarn', numhl='DiagnosticSignWarn' })
      vim.fn.sign_define('DapBreakpointRejected', { texthl='DiagnosticSignError', numhl= 'DiagnosticSignError' })
      vim.fn.sign_define('DapLogPoint', { texthl='DiagnosticSignWarn', numhl= 'DiagnosticSignWarn' })
      vim.fn.sign_define('DapStopped', { texthl='DiagnosticSignHint', numhl= 'DiagnosticSignHint' })
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {'mfussenegger/nvim-dap'},
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      dapui.setup({
        icons = { expanded = '', collapsed = '', current_frame = '' },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { '<CR>', '<2-LeftMouse>' },
          open = 'o',
          remove = 'd',
          edit = 'e',
          repl = 'r',
          toggle = 't',
        },
        -- Use this to override mappings for specific elements
        element_mappings = {
          -- Example:
          -- stacks = {
          --   open = '<CR>',
          --   expand = 'o',
          -- }
        },
        -- Expand lines larger than the window
        -- Requires >= 0.7
        expand_lines = vim.fn.has('nvim-0.7') == 1,
        -- Layouts define sections of the screen to place windows.
        -- The position can be 'left', 'right', 'top' or 'bottom'.
        -- The size specifies the height/width depending on position. It can be an Int
        -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
        -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
        -- Elements are the elements shown in the layout (in order).
        -- Layouts are opened in order so that earlier layouts take priority in window sizing.
        layouts = {
          {
            elements = {
            -- Elements can be strings or table with id and size keys.
              'breakpoints',
              'stacks',
              'watches',
            },
            size = 40, -- 40 columns
            position = 'left',
          },
          {
            elements = {
              'scopes',
            },
            size = 0.25, -- 25% of total lines
            position = 'bottom',
          },
        },
        controls = {
          -- Requires Neovim nightly (or 0.8 when released)
          enabled = true,
          -- Display controls in this element
          element = 'repl',
          icons = {
            pause = 'PAUSE',
            play = 'PLAY',
            step_into = 'IN',
            step_over = 'OVER',
            step_out = 'OUT',
            step_back = 'BACK',
            run_last = 'LAST',
            terminate = 'END',
          },
        },
        floating = {
          max_height = nil, -- These can be integers or a float between 0 and 1.
          max_width = nil, -- Floats will be treated as percentage of your screen.
          border = 'single', -- Border style. Can be 'single', 'double' or 'rounded'
          mappings = {
            close = { 'q', '<Esc>' },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
          max_value_lines = 100, -- Can be integer or nil.
        }
      })

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end,
  },
}
