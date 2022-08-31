require('nvim-tree').setup {
  view = {
    width = 50,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  git = {
    ignore = false,
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
