local status_ok, tokyonight = pcall(require, 'tokyonight')
if not status_ok then
  return
end

tokyonight.setup({
  transparent = true,
  terminal_colors = true,
  styles = {
    sidebars = 'transparent',
    floats = 'transparent',
  },
  sidebars = { 'qf', 'help' },
  day_brightness = 0.3,
})
