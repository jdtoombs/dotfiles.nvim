return {
	"nvimdev/guard.nvim",
    -- lazy load by ft
    ft = { "lua", "c", "markdown", "json", "yaml", "vim", "typescript", "javascript", "html", "css", "rust", "python" },
    -- Builtin configuration, optional
    dependencies = {
        "nvimdev/guard-collection",
    },
	config = function()
		vim.g.guard_config = {
			-- format on write to buffer
			fmt_on_save = true,
			-- use lsp if no formatter was defined for this filetype
			lsp_as_default_formatter = false,
			-- whether or not to save the buffer after formatting
			save_on_fmt = true,
		}
	end,
}
