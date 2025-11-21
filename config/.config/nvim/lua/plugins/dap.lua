return {
  {
    'mxsdev/nvim-dap-vscode-js',
    dependencies = {
      {
        'microsoft/vscode-js-debug',
        build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'
      },
      {
        'Joakker/lua-json5',
        build = './install.sh',
      },
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      local dapvscode = require('dap-vscode-js')

      dapvscode.setup({
        node_path = 'node', -- Path of node executable. Defaults to $NODE_PATH, and then 'node'
        -- debugger_path = '(runtimedir)/site/pack/packer/opt/vscode-js-debug',
        -- debugger_path = '/Users/bronislaw.szulc/debugger/microsoft/vscode-js-debug',
        debugger_path = vim.fn.resolve(vim.fn.stdpath('data') .. '/lazy/vscode-js-debug'),
        -- debugger_cmd = { 'js-debug-adapter' }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
        adapters = { 'pwa-node', --[['pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost']] }, -- which adapters to register in nvim-dap
        -- log_file_path = '(stdpath cache)/dap_vscode_js.log' -- Path for file logging
        -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
        -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
      })

      dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'node',
          args = { vim.fn.resolve(vim.fn.stdpath('data') .. '/lazy/vscode-js-debug/out/src/vsDebugServer.js'), '${port}' },
        },
      }

      for _, language in ipairs({
        'typescript',
        'javascript',
        'typescriptreact',
        'javascriptreact',
      }) do
        dap.configurations[language] = {
          {
            -- Node.js
            {
              type = 'pwa-node',
              request = 'launch',
              name = 'Launch file',
              program = '${file}',
              cwd = '${workspaceFolder}',
              outDir = 'dist',
            },
            -- Jest
            {
              {
                type = 'pwa-node',
                request = 'launch',
                name = 'Debug Jest Tests',
                -- trace = true, -- include debugger info
                runtimeExecutable = 'node',
                runtimeArgs = {
                  './node_modules/jest/bin/jest.js',
                  '--runInBand',
                },
                rootPath = '${workspaceFolder}',
                cwd = '${workspaceFolder}',
                console = 'integratedTerminal',
                internalConsoleOptions = 'neverOpen',
              }
            },
          }
        }
      end

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
        expand_lines = true,
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

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end

      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
    keys = {
      {
        '<leader>da',
        function()
          require('dap').run({
              type = 'pwa-node',
              request = 'attach',
              name = 'Node Debugger',
              cwd = vim.fn.getcwd(),
          })
        end,
      },
    }
  }
}
