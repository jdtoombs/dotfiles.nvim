local M = {}

local state = {
	win = nil,
	buf = nil
}

function M.toggle(opts)
	opts = opts or {}

	if state.win and vim.api.nvim_win_is_valid(state.win) then
		vim.api.nvim_win_close(state.win, true)
		state.win = nil
		return
	end

	local editor_width = vim.o.columns
	local editor_height = vim.o.lines

	local win_width = opts.width or math.floor(editor_width * 0.5)
	local win_height = opts.height or math.floor(editor_height * 0.5)

	local col = math.floor((editor_width - win_width) / 2)
	local row = math.floor((editor_height - win_height) / 2)

	local window_opts = {
		relative = 'editor',
		width = win_width,
		height = win_height,
		col = col,
		row = row,
		style = 'minimal',
		border = 'rounded'
	}

	if not (state.buf and vim.api.nvim_buf_is_valid(state.buf)) then
		state.buf = vim.api.nvim_create_buf(false, true)
		vim.bo[state.buf].modifiable = true
	end

	state.win = vim.api.nvim_open_win(state.buf, true, window_opts)

	if vim.fn.bufname(state.buf) == "" then
		-- look into vim.fn.termopen later for more flexibility
		vim.cmd("term")
	end

	vim.cmd("startinsert")
end

function M.setup(opts)
	opts = opts or {}
	vim.api.nvim_create_user_command("Goaterm", function()
		M.toggle(opts)
	end, {})

	vim.api.nvim_set_keymap('n', '<leader>gt', ':Goaterm<CR>', { noremap = true, silent = true })
	-- lagged space bar actions when spacebar used for below keymap
	vim.api.nvim_set_keymap('t', '<Esc><Esc>', '<C-\\><C-n>:Goaterm<CR>', { noremap = true, silent = true })
end

return M
