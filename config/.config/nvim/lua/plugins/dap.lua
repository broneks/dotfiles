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
      local dap_ui = require('dapui')
      local dap_vscode = require('dap-vscode-js')

      local debugger_path = vim.fn.resolve(vim.fn.stdpath('data') .. '/lazy/vscode-js-debug')

      dap_vscode.setup({
        node_path = 'node', -- Path of node executable. Defaults to $NODE_PATH, and then 'node'
        debugger_path = debugger_path,
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
          args = { debugger_path .. '/out/src/vsDebugServer.js', '${port}' },
        },
      }

      dap_ui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dap_ui.open()
      end

      dap.listeners.before.launch.dapui_config = function()
        dap_ui.open()
      end

      dap.listeners.before.event_terminated.dapui_config = function()
        dap_ui.close()
      end

      dap.listeners.before.event_exited.dapui_config = function()
        dap_ui.close()
      end
    end,
  }
}
