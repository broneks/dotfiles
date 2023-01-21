local status_ok, mini_comment = pcall(require, 'mini.comment')
if not status_ok then
  return
end

mini_comment.setup()
