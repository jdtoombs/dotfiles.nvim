-- This file can be loaded by calling `lua require('plugins')` from your init.vim
vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim' }

	use 'nvim-tree/nvim-web-devicons'

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	use {
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		opts = {}
	}

	use {
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'tpope/vim-fugitive'

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- LSP Support
			'neovim/nvim-lspconfig',
			-- Autocompletion
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip'
		}
	}

	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig'
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use { 'nvimdev/guard-collection' }
	use { 'nvimdev/guard.nvim' }
	use { 'terrortylor/nvim-comment' }
	use { 'github/copilot.vim' }
	use { 'windwp/nvim-ts-autotag' }
	use { 'NvChad/nvim-colorizer.lua' }
end)
