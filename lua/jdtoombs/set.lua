vim.cmd [[colorscheme tokyonight]]

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_set_hl(0, "@comment.doc", { fg = "#FF0000" })

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.cursorline = true
