local M = {}

function M.printFilename()
    P(vim.fn.expand('%')) 
end

return M
