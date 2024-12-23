local M = {}

local options = {
	["("] = ")",
	["{"] = "}",
	["["] = "]",
	["<"] = ">",
	["\""] = "\"",
}

function M.wrap_word_with()
	local char = vim.fn.nr2char(vim.fn.getchar())
	local open_with = char
	local close_with = options[open_with]
	if not close_with then
		print("Invalid character")
		return
	end

	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local line = vim.api.nvim_get_current_line()
	local col = cursor_pos[2] + 1

	local start_index, end_index = line:find("%w+", col)

	if start_index and end_index then
		local word = line:sub(start_index, end_index)
		local new_line = line:sub(1, start_index - 1) .. open_with .. word .. close_with .. line:sub(end_index + 1)
		vim.api.nvim_set_current_line(new_line)
		vim.api.nvim_win_set_cursor(0, { cursor_pos[1], col + 1 })
	end
end

M.setup = function()
	vim.api.nvim_set_keymap("n", "<leader>w", ":lua require'wrapem.core'.wrap_word_with()<CR>",
		{ noremap = true, silent = true })
end

return M
