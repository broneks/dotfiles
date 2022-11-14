local status_ok, dap = pcall(require, 'dap')
if not status_ok then
  return
end

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
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
--   args = { os.getenv('HOME') .. '/dev/microsoft/vscode-chrome-debug/out/src/chromeDebug.js' }
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

require('dapui').setup()
require('jester').setup({
  cmd = "APP_ENV=test npx jest -- $file", -- run command
  identifiers = {"test", "it"}, -- used to identify tests
  prepend = {"describe"}, -- prepend describe blocks
  expressions = {"call_expression"}, -- tree-sitter object used to scan for tests/describe blocks
  path_to_jest_run = 'CF_ENV=test npx jest', -- used to run tests
  path_to_jest_debug = 'CF_ENV=test ./node_modules/bin/jest', -- used for debugging
  terminal_cmd = ":vsplit | terminal", -- used to spawn a terminal for running tests, for debugging refer to nvim-dap's config
  dap = { -- debug adapter configuration
    type = 'node2',
    request = 'launch',
    cwd = vim.fn.getcwd(),
    runtimeArgs = {'--inspect-brk', '$path_to_jest', '--no-coverage', '-t', '$result', '--', '$file'},
    args = { '--no-cache' },
    sourceMaps = false,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
    console = 'integratedTerminal',
    port = 9229,
    disableOptimisticBPs = true,
  },
})
