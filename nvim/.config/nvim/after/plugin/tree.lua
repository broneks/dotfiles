local status_ok, tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

tree.setup {
  view = {
    width = 50,
    mappings = {
      list = {
        { key = "<C-s>", action = "split" },
      },
    },
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
          ignored = "∅",
        },
      },
    },
  },
}
