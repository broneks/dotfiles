local dap = require('dap')

local function attach()
  print('attaching')
  dap.run({
    type = 'pwa-node',
    request = 'attach',
    address = '127.0.0.1',
    port = 9229,
    name = 'Attach Node.js',
    localRoot = vim.fn.getcwd(),
    cwd = '${workspaceFolder}',
    remoteRoot = '/app',
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
    websocketAddress = function()
     return string.match(
      vim.api.nvim_exec('!docker logs compensation-bff|& grep -oE "ws.*" | tail -1', true),
      'ws:.*'
     )
    end,
  })
end

local function attachToRemote()
  print('attaching to remote')
  dap.run({
    type = 'pwa-node',
    request = 'attach',
    address = '127.0.0.1',
    name = 'Attaching Node.js',
    port = 9229,
    localRoot = vim.fn.getcwd(),
    remoteRoot = '/home/vcap/app',
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
  })
end

local function debugJest(testName, filename)
  print('starting ' .. testName .. ' in ' .. filename)
  dap.run({
    type = 'pwa-node',
    request = 'launch',
    cwd = vim.fn.getcwd(),
    name = 'Debug Jest',
    runtimeArgs = {'--inspect-brk', './node_modules/bin/jest', '--no-coverage', '-t', testName, '--', filename},
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
    console = 'integratedTerminal',
    port = 9229,
  })
end

return {
  debugJest = debugJest,
  attach = attach,
  attachToRemote = attachToRemote,
}
