return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		require 'nvim-treesitter.configs'.setup {
			autotag = {
				enable = true,
			},
			ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "python", "rust" },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		}
	end,
}
