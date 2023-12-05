return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'marilari88/neotest-vitest'
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-vitest'),
        },
      })
    end
  },
}
