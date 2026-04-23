return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require('dap')
      local dap_ui = require('dapui')
      local mason = require('mason')
      local mason_dap = require('mason-nvim-dap')

      mason.setup()
      mason_dap.setup({
        automatic_installation = true,
        ensure_installed = { 'js-debug-adapter' },
      })

      dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'js-debug-adapter',
          args = { '${port}' },
        },
      }

      dap.configurations.typescript = {
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach local',
          port = 9229,
          sourceMaps = true,
          restart = true,
          smartStep = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
          resolveSourceMapLocations = { '**', '!**/node_modules/**' },
          sourceMapPathOverrides = {
            ['/src/*'] = '/Users/bronislaw.szulc/repos/barley-bff/src/*',
          },
        },
      }

      dap.configurations.javascript = dap.configurations.typescript

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
