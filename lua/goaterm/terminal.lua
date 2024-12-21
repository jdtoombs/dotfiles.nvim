local commands = require('goaterm.commands')

local M = {}

local terminal = {
	screen = nil,
	sessions = {},
	current_session = nil
}

local width = math.floor(vim.o.columns * 0.8)
local height = math.floor(vim.o.lines * 0.8)
local y = math.floor((vim.o.lines - height) / 2 - 1)
local x = math.floor((vim.o.columns - width) / 2)

local function buffer_empty(bufnr)
	return (vim.api.nvim_buf_line_count(bufnr) == 1) and
			(vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] == "")
end

function M.next_tab()
	if #terminal.sessions > 1 then
		local next_index = (terminal.current_session % #terminal.sessions) + 1
		vim.api.nvim_win_set_buf(0, terminal.sessions[next_index])
		terminal.current_session = next_index
	end
end

function M.create_new_tab(init)
	local function insert_tab()
		table.insert(terminal.sessions, vim.api.nvim_create_buf(false, true))
		terminal.current_session = #terminal.sessions
	end

	if init then
		insert_tab()
	else
		insert_tab()
		-- need to change window to use new tab buffer here
		-- @todo check what mode they want to launch the tab in
		-- 0 means current window
		if buffer_empty(terminal.sessions[terminal.current_session]) then
			vim.api.nvim_win_set_buf(0, terminal.sessions[terminal.current_session])
			vim.fn.termopen(vim.o.shell)
		end
		print("Tab length" .. terminal.current_session)
	end
end

function M.on()
	-- Create a new buffer if non exist
	if #terminal.sessions == 0 then
		M.create_new_tab(true)
	end

	-- Set window options
	local opts = {
		style = "minimal",
		relative = "editor",
		border = "rounded",
		width = width,
		height = height,
		row = y,
		col = x,
	}

	-- Create the floating window
	terminal.screen = vim.api.nvim_open_win(terminal.sessions[terminal.current_session], true, opts)

	-- @todo: check if type is shell before starting in insert mode
	-- Check if the buffer is empty, and only start the terminal if it is unmodified
	if buffer_empty(terminal.sessions[terminal.current_session]) then
		-- Start the terminal in the buffer
		vim.fn.termopen(vim.o.shell)
		vim.cmd('startinsert')
	else
		-- Old buffer show to user
		vim.api.nvim_set_current_win(terminal.screen)
		vim.cmd('startinsert')
	end
end

function M.off()
	if terminal.screen and vim.api.nvim_win_is_valid(terminal.screen) then
		vim.api.nvim_win_close(terminal.screen, true)
		terminal.screen = nil
	end
end

function M.setup()
	commands.register_commands(M)
end

return M
