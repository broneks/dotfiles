return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'microsoft/vscode-js-debug',
        build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'
      },
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require('dap')
      local dap_ui = require('dapui')

      local debugger_path = vim.fn.resolve(vim.fn.stdpath('data') .. '/lazy/vscode-js-debug')

      dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'node',
          args = { debugger_path .. '/out/src/vsDebugServer.js', '${port}' },
        },
      }

      vim.cmd("hi DapBreakpointColor guifg=#fa4847")
      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointColor", linehl = "", numhl = "" })

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
