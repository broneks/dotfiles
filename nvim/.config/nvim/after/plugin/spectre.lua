local status_ok, spectre = pcall(require, 'spectre')
if not status_ok then
  return
end

spectre.setup({
  live_update = true,
  is_insert_mode = true,
})
