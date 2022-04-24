local M = {}

local cmd = vim.cmd

-- highlight functions

M.bg = function(group, col)
  cmd("hi " .. group .. " guibg=" .. col)
end

M.fg = function(group, col)
  cmd("hi " .. group .. " guifg=" .. col)
end

M.fg_bg = function(group, fgcol, bgcol)
  cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

return M
