-- space for leader
vim.g.mapleader = " "

-- file explorer, comment out for now since I'm using oil.nvim
-- vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

-- replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- drag selected lines up and down shifting everything around them
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- keep cursor in middle when jumping up/down page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- setup oil.nvim
vim.keymap.set("n", "<leader>fe", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- toggle copilot
vim.keymap.set("n", "<leader>cp", function()
    if vim.g.copilot_enabled then
        vim.cmd("Copilot disable")
        print("Copilot disabled")
    else
        vim.cmd("Copilot enable")
        print("Copilot enabled")
    end
end, { desc = "Toggle Copilot" })
