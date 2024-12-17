return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v4.x',
	dependencies = {
		-- LSP Support
		'neovim/nvim-lspconfig',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	},

	config = function()
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })

			-- Format on save
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						if vim.bo.modified then
							vim.lsp.buf.format({ async = false })
						end
					end,
				})
			end
		end)

		require('lspconfig').lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						version = 'LuaJIT',
						path = vim.split(package.path, ';'),
					},
					diagnostics = {
						globals = { 'vim' },
					},
					workspace = {
						library = {
							[vim.fn.expand('$VIMRUNTIME/lua')] = true,
							[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
						},
					},
				},
			},
		})

		require('mason').setup({})
		require('mason-lspconfig').setup({
			ensure_installed = {},
			handlers = {
				lsp_zero.default_setup,
			},
		})
	end,
}
