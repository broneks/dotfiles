local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<C-s>', api.node.open.horizontal, opts('Open: Horizontal Split'))
end

return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    version = 'nightly',
    cmd = { 'NvimTreeOpen', 'NvimTreeToggle' },
    opts = {
      on_attach = on_attach,
      view = {
        width = 50,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      renderer = {
        icons = {
          glyphs = {
            git = {
              ignored = '∅',
            },
          },
        },
      },
    },
    init = function()
      local fn = vim.fn
      local autocmd = vim.api.nvim_create_autocmd

      local function open_nvim_tree(data)
        -- buffer is a [No Name]
        local no_name = data.file == '' and vim.bo[data.buf].buftype == ''

        -- buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1

        if not no_name and not directory then
          return
        end

        -- change to the directory
        if directory then
          vim.cmd.cd(data.file)
        end

        -- open the tree
        require('nvim-tree.api').tree.open()
      end

      autocmd('VimEnter', { callback = open_nvim_tree })
    end,
  },
}
