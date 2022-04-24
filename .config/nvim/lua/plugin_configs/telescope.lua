require('telescope').setup{
  defaults = {
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    file_ignore_patterns = {"node_modules", "@types"},
    layout_strategy = "vertical",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" },
  },
  pickers = {
    find_files = {
      theme = "ivy",
    }
  },
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('harpoon')
