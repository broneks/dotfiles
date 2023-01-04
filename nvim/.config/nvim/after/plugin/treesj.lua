local status_ok, tsj = pcall(require, 'treesj')
if not status_ok then
  return
end

tsj.setup {
  use_default_keymaps = false,
}
