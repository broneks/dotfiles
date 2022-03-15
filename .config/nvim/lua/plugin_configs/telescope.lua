require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"node_modules", "@types"},
    layout_strategy = "vertical"
  },
  pickers = {
    find_files = {
      theme = "ivy",
    }
  }
}
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('frecency')
require('telescope').load_extension('harpoon')
