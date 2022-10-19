local status_ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

treesitter_configs.setup {
  ensure_installed = { 'javascript', 'typescript' },
  highlight = {
    enable = true
  }
}
