vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.cursorline = true

vim.opt.autoread = true
vim.opt.updatetime = 300

-- Enable focus event tracking for terminals/tmux
vim.opt.t_fe = [[\<Esc>[?1004h]]
vim.opt.t_fd = [[\<Esc>[?1004l]]
vim.cmd([[execute "set <FocusGained>=\<Esc>[I"]])
vim.cmd([[execute "set <FocusLost>=\<Esc>[O"]])

-- Auto-reload files when changed externally
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "TermResponse" }, {
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})

-- Also check on WinEnter for tmux window switches
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  pattern = "*",
  command = "checktime",
})

-- Notification when file changes
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
  end,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 4,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
