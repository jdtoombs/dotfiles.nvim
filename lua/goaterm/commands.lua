local M = {}

-- Function to register commands
function M.register_commands(plugin)
	-- Power on command
	vim.api.nvim_create_user_command('GoatermOn', function()
		plugin.on()
	end, { desc = 'Toggle floating terminal window' })
	vim.api.nvim_set_keymap('n', '<C-g>t', ':GoatermOn<CR>', { noremap = true, silent = true })

	-- Power off command
	vim.api.nvim_create_user_command('GoatermOff', function()
		plugin.off()
	end, { desc = 'Close floating terminal window' })
	vim.api.nvim_set_keymap('t', '<Esc><Esc>', '<C-\\><C-n>:GoatermOff<CR>', { noremap = true, silent = true })

	-- New tab command
	vim.api.nvim_create_user_command('GoatermNewTab', function()
		plugin.create_new_tab()
	end, { desc = 'Create a new terminal tab' })
	vim.api.nvim_set_keymap('t', '<C-g>n', '<C-\\><C-n>:GoatermNewTab<CR>i', { noremap = true, silent = true })

	-- Tab jump to command
	vim.api.nvim_create_user_command('GoatermTabNext', function()
		plugin.next_tab()
	end, { desc = 'Jump to a terminal tab', nargs = "*" })
	vim.api.nvim_set_keymap('t', '<C-g>j', '<C-\\><C-n>:GoatermTabNext<CR>i', { noremap = true, silent = true })
end

return M
