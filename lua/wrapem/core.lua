local M = {}

local options = {
	["("] = ")",
	["{"] = "}",
	["["] = "]",
	["<"] = ">",
	["\""] = "\"",
}

local function is_whitespace(char)
	return char:match("%s") ~= nil
end
--- @todo Make it so your cursor can be anywhere within the word
function M.wrap_word_with()
	local char = vim.fn.nr2char(vim.fn.getchar())
	local open_with = char
	local close_with = options[open_with]
	if not close_with then
		local valid_keys = nil
		for key in pairs(options) do
			valid_keys = valid_keys and valid_keys .. ", " .. key or key
		end
		print("Valid keys are: " .. valid_keys)
		return
	end

	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local line = vim.api.nvim_get_current_line()
	-- because get_cursor returns cols as 0 based index
	local col = cursor_pos[2] + 1

	-- the col is where the cursor is but we wnant to move it to the beginning of the of word if it isnt already
	-- keep going until the beginning, check for whitespace or beginning of line (i.e col 1)
	local check_behind = line:sub(col - 1, col - 1)
	while not is_whitespace(check_behind) and col > 0 do
		col = col - 1
		check_behind = line:sub(col - 1, col - 1)
	end
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
