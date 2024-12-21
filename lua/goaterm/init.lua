local terminal = require("goaterm.core")

local M = {}

function M.setup(opts)
	opts = opts or {}
	terminal.setup(opts)
end

return M
