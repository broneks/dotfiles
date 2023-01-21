local status_ok, mini_pairs = pcall(require, 'mini.pairs')
if not status_ok then
  return
end

mini_pairs.setup()
