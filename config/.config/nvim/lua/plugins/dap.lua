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

      local bff_root = '/Users/bronislaw.szulc/repos/wl-cmp-bff'

      dap.configurations.typescript = {
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach BFF (leap, port 9229)',
          address = 'localhost',
          port = 9229,
          cwd = bff_root,
          sourceMaps = true,
          restart = true,
          smartStep = true,
          trace = true,
          outFiles = { bff_root .. '/dist/**/*.js' },
          skipFiles = { '<node_internals>/**', '**/node_modules/**' },
          -- Leave resolveSourceMapLocations unset so Node v22's
          -- --enable-source-maps surfaces don't get filtered out.
          -- BFF tsconfig has `sourceRoot: "/"`, so map sources resolve to
          -- `/main.ts`, `/comp-review/...`. Two patterns for safety:
          -- one for the leading-slash form, one bare.
          sourceMapPathOverrides = {
            ['/*'] = bff_root .. '/src/*',
            ['*'] = bff_root .. '/src/*',
          },
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach by process id',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
      }

      dap.configurations.javascript = dap.configurations.typescript

      vim.cmd("hi DapBreakpointColor guifg=#fa4847")
      vim.cmd("hi DapBreakpointRejectedColor guifg=#888888")
      vim.cmd("hi DapLogPointColor guifg=#61afef")
      vim.cmd("hi DapStoppedColor guifg=#98c379")

      local bug = "\u{f188}"

      vim.fn.sign_define("DapBreakpoint",          { text = bug,  texthl = "DapBreakpointColor",         linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = bug,  texthl = "DapBreakpointColor",         linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = bug,  texthl = "DapBreakpointRejectedColor", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint",           { text = "\u{f12a3}", texthl = "DapLogPointColor",    linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped",            { text = "▶",  texthl = "DapStoppedColor",            linehl = "", numhl = "" })

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
