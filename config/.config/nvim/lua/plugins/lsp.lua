return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      lsp_zero.setup_servers({
        'html',
        'cssls',
        'cssmodules_ls',
        'clangd',
        'tsserver',
        'eslint',
        'jsonls',
        'yamlls',
        'sqlls',
        'rust_analyzer',
        'ruby_ls',
        'pylsp',
        'solargraph',
      })

      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()
      local keyword_length = 5;

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          -- `Enter` key to confirm completion
          ['<CR>'] = cmp.mapping.confirm({select = false}),
          ['<C-e>'] = cmp.mapping.abort(),

          -- Ctrl+Space to trigger completion menu
          ['<C-Space>'] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),

          -- Scroll up and down in the completion documentation
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp', keyword_length = keyword_length, priority = '9' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip', keyword_length = keyword_length },
          { name = 'buffer', keyword_length = keyword_length },
          { name = 'npm', keyword_length = 3 },
        }),
      })
    end,
  },
}
