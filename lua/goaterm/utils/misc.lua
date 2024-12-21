local M = {}

-- d'oh, can use vim.fn.trim on nvim 0.9+
function M.trim(s)
	return s:match("^%s*(.-)%s*$")
end

return M
