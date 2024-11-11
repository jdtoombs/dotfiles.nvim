local ft = require('guard.filetype')

-- Assuming you have guard-collection
ft('typescript,javascript,typescriptreact'):fmt('prettier')

vim.g.guard_config = {
	-- format on write to buffer
	fmt_on_save = true,
	-- use lsp if no formatter was defined for this filetype
	lsp_as_default_formatter = false,
	-- whether or not to save the buffer after formatting
	save_on_fmt = true,
}
