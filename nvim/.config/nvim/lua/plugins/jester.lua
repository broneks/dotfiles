return {
  {
    'David-Kunz/jester',
    opts = {
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
    },
  },
}
