return {
	{
		'hrsh7th/nvim-cmp',
		lazy = false,
		priority = 100,
		dependencies = {
			'onsails/lspkind.nvim',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			{ 'L3MON4D3/LuaSnip', build = "make install_jsregexp" },
			'saadparwaiz1/cmp_luasnip',
			'zbirenbaum/copilot.lua',
			'zbirenbaum/copilot-cmp',
		},
		config = function()
			local cmp = require('cmp')
			require('copilot').setup {
				suggestion = { enabled = false },
				panel = { enabled = false },
			}
			require('copilot_cmp').setup()
			cmp.setup({
				mapping = {
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<S-Tab>'] = cmp.mapping.select_next_item(),
				},
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'buffer' },
					{ name = 'path' },
					{ name = 'luasnip' },
					{ name = 'copilot' },
				},
				formatting = {
					format = require('lspkind').cmp_format({
						mode = 'symbol_text',
						maxwidth = 50,
					}),
				},
			})
		end,
	}
}
